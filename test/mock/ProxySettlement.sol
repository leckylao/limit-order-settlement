// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../../contracts/interfaces/ISettlement.sol";
import "../../contracts/interfaces/IFeeBank.sol";

contract ProxySettlement {
    ISettlement private _settlement;
    IERC20 private _inch;
    IFeeBank private _feeBank;

    constructor(
        ISettlement settlement,
        IERC20 inch,
        IFeeBank feeBank
    ) {
        _settlement = settlement;
        _inch = inch;
        _feeBank = feeBank;
    }

    function deposit(uint256 amount) external {
        _inch.approve(address(_feeBank), amount);
        _feeBank.deposit(amount);
    }

    function settleOrders(
        IOrderMixin orderMixin,
        OrderLib.Order calldata order,
        bytes calldata signature,
        bytes calldata interaction,
        uint256 makingAmount,
        uint256 takingAmount,
        uint256 thresholdAmount,
        address target
    ) external {
        _settlement.settleOrders(
            orderMixin,
            order,
            signature,
            interaction,
            makingAmount,
            takingAmount,
            thresholdAmount,
            target
        );
    }

    function settleOrdersEOA(
        IOrderMixin orderMixin,
        OrderLib.Order calldata order,
        bytes calldata signature,
        bytes calldata interaction,
        uint256 makingAmount,
        uint256 takingAmount,
        uint256 thresholdAmount,
        address target
    ) external {
        _settlement.settleOrdersEOA(
            orderMixin,
            order,
            signature,
            interaction,
            makingAmount,
            takingAmount,
            thresholdAmount,
            target
        );
    }
}
