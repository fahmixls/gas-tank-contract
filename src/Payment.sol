// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {IPaymaster} from "./interfaces/IPaymaster.sol";
import {IEntryPoint} from "./interfaces/IEntryPoint.sol";

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/**
 * @title Payment
 * @notice A paymaster contract that allow users to pay for gas fee using non native token
 * @dev This contract implements ERC-4337 Account Abstraction paymaster functionality
 */
contract Payment is ReentrancyGuard, Ownable {
    using SafeERC20 for IERC20;

    /**
      @dev Struct to store configuration for each support token
      */
    struct TokenConfig {
        IERC20 token;
        AggregatorV3Interface priceFeed;
    }

    constructor() Ownable(msg.sender) {}
}
