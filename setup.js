const { ether, time } = require('@1inch/solidity-utils');
const { ethers } = require('hardhat');

async function main() {
    const network = await ethers.provider.getNetwork();
    console.log("network:", network);
    // It has both ETH and 1inch for testing propose
    const impersonatedSigner = await ethers.getImpersonatedSigner("0x720D8790666bd40B9CA289CBe73cb1334f0aE7e3");

    // Setup envirement
    const inch = await ethers.getContractAt('IERC20', '0x111111111117dc0aa78b770fa6a738034120c302');
    const st1inch = await ethers.getContractAt('ISt1inch', '0x9a0c8ff858d273f57072d714bca7411d717501d7');
    const powerPod = await ethers.getContractAt('PowerPod', '0xdaf782667d98d5069ee7ba139932945c4d08fde9');
    const whitelist = await ethers.getContractAt('WhitelistRegistry', '0xa49ecb28cc8ab39659be2bfb6f7b86f0c4461a0b');

    const stakeAmount = ether('10000');
    const lockTime = time.duration.years('2');
    const myShareToken = {
        name: 'MyShareTokenName',
        symbol: 'MST',
    };
    const resolver = impersonatedSigner;
    const worker = resolver;

    // Ethers setup script

    // approve 1inch staking
    await (await inch.connect(resolver).approve(st1inch.address, stakeAmount));
    // stake 1inch token
    await (await st1inch.connect(resolver).deposit(stakeAmount, lockTime)).wait();
    // add delegation pod to
    // 1. make it possible for any user to delegate staking power to
    // the resolver's account
    // 2. make it possible for a resolver to allocate its staking power for itself
    await (await st1inch.connect(resolver).addPod(powerPod.address)).wait();

    // register resolver's delegation token to count stakers' shares and rewards
    await (
        await powerPod
            .connect(resolver)
            .functions['register(string,string)'](
                myShareToken.name,
                myShareToken.symbol,
            )
    ).wait();

    // Set default rewards farm
    // Optional, needed to incentivize staker for delegation
    const shareTokenAddress = await powerPod.registration(resolver.address);
    const FarmingPod = await ethers.getContractFactory('FarmingPod');
    const gift = await ethers.getContractAt('IERC20', '0x111111111117dc0aa78b770fa6a738034120c302'); // Your gift token address
    console.log(shareTokenAddress);
    const farm = await FarmingPod.deploy(shareTokenAddress, inch.address);
    await (await powerPod.connect(resolver).setDefaultFarm(farm.address)).wait();

    // Delegate staked power to self
    await (await powerPod.connect(resolver).delegate(resolver.address)).wait();

    // Whitelist resolver (there should be enough staked power to be in top 5)
    await (await whitelist.connect(resolver).register()).wait();

    // Add worker address from which order settlement will be executed
    await (await whitelist.connect(resolver).promote(1, worker.address)).wait();
};

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});