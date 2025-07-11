// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

/**
 * @title Entry point interfaces
 * @notice Interface for the EntryPoint contract used in ERC-4337 Account Abstraction
 */
interface IEntryPoint {
    function balanceOf(address account) external view returns (uint256);

    function depositTo(address account) external payable;

    function withdrawTo(
        address payable withdrawAddress,
        uint256 withdrawAmount
    ) external;

    /*
     * @dev Struct representing a UserOperation for ERC-4337
     */
    struct UserOperation {
        address sender;
        uint256 nonce;
        bytes initialCode;
        bytes callData;
        uint256 callGasLimit;
        uint256 verificationGasLimit;
        uint256 preVerificationGas;
        uint256 maxFeePerGas;
        uint256 maxPriorityFeePerGas;
        bytes paymesterAndData;
        bytes signature;
    }
}
