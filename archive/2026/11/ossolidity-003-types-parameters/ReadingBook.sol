// SPDX-License-Identifier: MIT
pragma solidity 0.8.38;

/// @title ReadingBook — introductory Solidity data types and parameters
/// @notice Demonstration only. No real telemetry or financial transactions.
contract ReadingBook {
    uint256 public constant TRAINING_LIMIT_WATTS = 1000;

    address public immutable instructor;
    uint256 public lastWatts;
    bool public hasReading;
    string private _deviceLabel;

    error Unauthorized(address caller);
    error ReadingTooLarge(uint256 supplied);
    error InvalidLabelLength(uint256 length);

    event ReadingRecorded(address indexed operator, uint256 watts);

    constructor(string memory initialLabel) {
        uint256 labelBytes = bytes(initialLabel).length;
        if (labelBytes == 0 || labelBytes > 40) {
            revert InvalidLabelLength(labelBytes);
        }
        instructor = msg.sender;
        _deviceLabel = initialLabel;
    }

    /// @notice State-changing external function; only the deployer may call it.
    function record(uint256 watts) external {
        if (msg.sender != instructor) revert Unauthorized(msg.sender);
        if (watts > TRAINING_LIMIT_WATTS) revert ReadingTooLarge(watts);
        lastWatts = watts;
        hasReading = true;
        emit ReadingRecorded(msg.sender, watts);
    }

    /// @notice Copies a calldata string into persistent contract storage.
    function rename(string calldata nextLabel) external {
        if (msg.sender != instructor) revert Unauthorized(msg.sender);
        uint256 labelBytes = bytes(nextLabel).length;
        if (labelBytes == 0 || labelBytes > 40) {
            revert InvalidLabelLength(labelBytes);
        }
        _deviceLabel = nextLabel;
    }

    /// @notice A view function can read storage but must not mutate it.
    function summary() external view returns (string memory label, uint256 watts, bool recorded) {
        return (_deviceLabel, lastWatts, hasReading);
    }

    /// @notice A pure function depends only on its argument, not contract state.
    function twice(uint256 watts) external pure returns (uint256) {
        if (watts > TRAINING_LIMIT_WATTS) revert ReadingTooLarge(watts);
        return watts * 2;
    }
}
