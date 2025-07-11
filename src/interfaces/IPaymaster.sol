// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import {IEntryPoint} from "./IEntryPoint.sol";

/**
 * @title Paymaster interface
 * @notice Interface for Paymaster contract in ERC-4337 Account Abstraction
 */

interface IPaymaster {
    function validatePaymasterUserOp(
        IEntryPoint.UserOperation calldata userOp,
        bytes32 userOpHash,
        uint256 maxCost
    ) external returns (bytes memory context, uint256 validationData);

    function postOp(
        IPaymaster.PostOpMode mode,
        bytes calldata context,
        uint256 actualGasCost
    ) external;

    /**
     * @dev Enum representing the possible outcomes of a UserOperation
     */
    enum PostOpMode {
        opSucceeded,
        opReverted,
        postOpReverted
    }
}
