// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract VotingPowerCalculator {
    uint256 private immutable _origin;
    uint256 private immutable _expTable0;
    uint256 private immutable _expTable1;
    uint256 private immutable _expTable2;
    uint256 private immutable _expTable3;
    uint256 private immutable _expTable4;
    uint256 private immutable _expTable5;
    uint256 private immutable _expTable6;
    uint256 private immutable _expTable7;
    uint256 private immutable _expTable8;
    uint256 private immutable _expTable9;
    uint256 private immutable _expTable10;
    uint256 private immutable _expTable11;
    uint256 private immutable _expTable12;
    uint256 private immutable _expTable13;
    uint256 private immutable _expTable14;
    uint256 private immutable _expTable15;
    uint256 private immutable _expTable16;
    uint256 private immutable _expTable17;
    uint256 private immutable _expTable18;
    uint256 private immutable _expTable19;
    uint256 private immutable _expTable20;
    uint256 private immutable _expTable21;
    uint256 private immutable _expTable22;
    uint256 private immutable _expTable23;
    uint256 private immutable _expTable24;
    uint256 private immutable _expTable25;
    uint256 private immutable _expTable26;
    uint256 private immutable _expTable27;
    uint256 private immutable _expTable28;
    uint256 private immutable _expTable29;

    constructor(uint256 expBase, uint256 origin) {
        _origin = origin;
        _expTable0 = expBase;
        _expTable1 = (_expTable0 * _expTable0) / 1e18;
        _expTable2 = (_expTable1 * _expTable1) / 1e18;
        _expTable3 = (_expTable2 * _expTable2) / 1e18;
        _expTable4 = (_expTable3 * _expTable3) / 1e18;
        _expTable5 = (_expTable4 * _expTable4) / 1e18;
        _expTable6 = (_expTable5 * _expTable5) / 1e18;
        _expTable7 = (_expTable6 * _expTable6) / 1e18;
        _expTable8 = (_expTable7 * _expTable7) / 1e18;
        _expTable9 = (_expTable8 * _expTable8) / 1e18;
        _expTable10 = (_expTable9 * _expTable9) / 1e18;
        _expTable11 = (_expTable10 * _expTable10) / 1e18;
        _expTable12 = (_expTable11 * _expTable11) / 1e18;
        _expTable13 = (_expTable12 * _expTable12) / 1e18;
        _expTable14 = (_expTable13 * _expTable13) / 1e18;
        _expTable15 = (_expTable14 * _expTable14) / 1e18;
        _expTable16 = (_expTable15 * _expTable15) / 1e18;
        _expTable17 = (_expTable16 * _expTable16) / 1e18;
        _expTable18 = (_expTable17 * _expTable17) / 1e18;
        _expTable19 = (_expTable18 * _expTable18) / 1e18;
        _expTable20 = (_expTable19 * _expTable19) / 1e18;
        _expTable21 = (_expTable20 * _expTable20) / 1e18;
        _expTable22 = (_expTable21 * _expTable21) / 1e18;
        _expTable23 = (_expTable22 * _expTable22) / 1e18;
        _expTable24 = (_expTable23 * _expTable23) / 1e18;
        _expTable25 = (_expTable24 * _expTable24) / 1e18;
        _expTable26 = (_expTable25 * _expTable25) / 1e18;
        _expTable27 = (_expTable26 * _expTable26) / 1e18;
        _expTable28 = (_expTable27 * _expTable27) / 1e18;
        _expTable29 = (_expTable28 * _expTable28) / 1e18;
    }

    function _votingPowerAt(uint256 balance, uint256 timestamp) internal view returns (uint256 votingPower) {
        unchecked {
            uint256 t = timestamp - _origin;
            votingPower = balance;
            if (t & 0x01 != 0) {
                votingPower = (votingPower * _expTable0) / 1e18;
            }
            if (t & 0x02 != 0) {
                votingPower = (votingPower * _expTable1) / 1e18;
            }
            if (t & 0x04 != 0) {
                votingPower = (votingPower * _expTable2) / 1e18;
            }
            if (t & 0x08 != 0) {
                votingPower = (votingPower * _expTable3) / 1e18;
            }
            if (t & 0x10 != 0) {
                votingPower = (votingPower * _expTable4) / 1e18;
            }
            if (t & 0x20 != 0) {
                votingPower = (votingPower * _expTable5) / 1e18;
            }
            if (t & 0x40 != 0) {
                votingPower = (votingPower * _expTable6) / 1e18;
            }
            if (t & 0x80 != 0) {
                votingPower = (votingPower * _expTable7) / 1e18;
            }
            if (t & 0x100 != 0) {
                votingPower = (votingPower * _expTable8) / 1e18;
            }
            if (t & 0x200 != 0) {
                votingPower = (votingPower * _expTable9) / 1e18;
            }
            if (t & 0x400 != 0) {
                votingPower = (votingPower * _expTable10) / 1e18;
            }
            if (t & 0x800 != 0) {
                votingPower = (votingPower * _expTable11) / 1e18;
            }
            if (t & 0x1000 != 0) {
                votingPower = (votingPower * _expTable12) / 1e18;
            }
            if (t & 0x2000 != 0) {
                votingPower = (votingPower * _expTable13) / 1e18;
            }
            if (t & 0x4000 != 0) {
                votingPower = (votingPower * _expTable14) / 1e18;
            }
            if (t & 0x8000 != 0) {
                votingPower = (votingPower * _expTable15) / 1e18;
            }
            if (t & 0x10000 != 0) {
                votingPower = (votingPower * _expTable16) / 1e18;
            }
            if (t & 0x20000 != 0) {
                votingPower = (votingPower * _expTable17) / 1e18;
            }
            if (t & 0x40000 != 0) {
                votingPower = (votingPower * _expTable18) / 1e18;
            }
            if (t & 0x80000 != 0) {
                votingPower = (votingPower * _expTable19) / 1e18;
            }
            if (t & 0x100000 != 0) {
                votingPower = (votingPower * _expTable20) / 1e18;
            }
            if (t & 0x200000 != 0) {
                votingPower = (votingPower * _expTable21) / 1e18;
            }
            if (t & 0x400000 != 0) {
                votingPower = (votingPower * _expTable22) / 1e18;
            }
            if (t & 0x800000 != 0) {
                votingPower = (votingPower * _expTable23) / 1e18;
            }
            if (t & 0x1000000 != 0) {
                votingPower = (votingPower * _expTable24) / 1e18;
            }
            if (t & 0x2000000 != 0) {
                votingPower = (votingPower * _expTable25) / 1e18;
            }
            if (t & 0x4000000 != 0) {
                votingPower = (votingPower * _expTable26) / 1e18;
            }
            if (t & 0x8000000 != 0) {
                votingPower = (votingPower * _expTable27) / 1e18;
            }
            if (t & 0x10000000 != 0) {
                votingPower = (votingPower * _expTable28) / 1e18;
            }
            if (t & 0x20000000 != 0) {
                votingPower = (votingPower * _expTable29) / 1e18;
            }
        }
        return votingPower;
    }

    function _balanceAt(uint256 votingPower, uint256 timestamp) internal view returns (uint256 balance) {
        unchecked {
            uint256 t = timestamp - _origin;
            balance = votingPower;
            if (t & 0x01 != 0) {
                balance = (balance * 1e18) / _expTable0;
            }
            if (t & 0x02 != 0) {
                balance = (balance * 1e18) / _expTable1;
            }
            if (t & 0x04 != 0) {
                balance = (balance * 1e18) / _expTable2;
            }
            if (t & 0x08 != 0) {
                balance = (balance * 1e18) / _expTable3;
            }
            if (t & 0x10 != 0) {
                balance = (balance * 1e18) / _expTable4;
            }
            if (t & 0x20 != 0) {
                balance = (balance * 1e18) / _expTable5;
            }
            if (t & 0x40 != 0) {
                balance = (balance * 1e18) / _expTable6;
            }
            if (t & 0x80 != 0) {
                balance = (balance * 1e18) / _expTable7;
            }
            if (t & 0x100 != 0) {
                balance = (balance * 1e18) / _expTable8;
            }
            if (t & 0x200 != 0) {
                balance = (balance * 1e18) / _expTable9;
            }
            if (t & 0x400 != 0) {
                balance = (balance * 1e18) / _expTable10;
            }
            if (t & 0x800 != 0) {
                balance = (balance * 1e18) / _expTable11;
            }
            if (t & 0x1000 != 0) {
                balance = (balance * 1e18) / _expTable12;
            }
            if (t & 0x2000 != 0) {
                balance = (balance * 1e18) / _expTable13;
            }
            if (t & 0x4000 != 0) {
                balance = (balance * 1e18) / _expTable14;
            }
            if (t & 0x8000 != 0) {
                balance = (balance * 1e18) / _expTable15;
            }
            if (t & 0x10000 != 0) {
                balance = (balance * 1e18) / _expTable16;
            }
            if (t & 0x20000 != 0) {
                balance = (balance * 1e18) / _expTable17;
            }
            if (t & 0x40000 != 0) {
                balance = (balance * 1e18) / _expTable18;
            }
            if (t & 0x80000 != 0) {
                balance = (balance * 1e18) / _expTable19;
            }
            if (t & 0x100000 != 0) {
                balance = (balance * 1e18) / _expTable20;
            }
            if (t & 0x200000 != 0) {
                balance = (balance * 1e18) / _expTable21;
            }
            if (t & 0x400000 != 0) {
                balance = (balance * 1e18) / _expTable22;
            }
            if (t & 0x800000 != 0) {
                balance = (balance * 1e18) / _expTable23;
            }
            if (t & 0x1000000 != 0) {
                balance = (balance * 1e18) / _expTable24;
            }
            if (t & 0x2000000 != 0) {
                balance = (balance * 1e18) / _expTable25;
            }
            if (t & 0x4000000 != 0) {
                balance = (balance * 1e18) / _expTable26;
            }
            if (t & 0x8000000 != 0) {
                balance = (balance * 1e18) / _expTable27;
            }
            if (t & 0x10000000 != 0) {
                balance = (balance * 1e18) / _expTable28;
            }
            if (t & 0x20000000 != 0) {
                balance = (balance * 1e18) / _expTable29;
            }
        }
        return balance;
    }
}