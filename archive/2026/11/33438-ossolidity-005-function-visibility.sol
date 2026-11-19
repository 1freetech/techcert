// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VisibilityLab {
    uint256 private storedNumber;

    function setNumber(uint256 number) external {
        require(number <= 1000, "Number too large");
        _save(number);
    }

    function getNumber() public view returns (uint256) {
        return storedNumber;
    }

    function doubleStored() external view returns (uint256) {
        return _double(storedNumber);
    }

    function _save(uint256 number) internal {
        storedNumber = number;
    }

    function _double(uint256 number) private pure returns (uint256) {
        return number * 2;
    }

    function triple(uint256 number) public pure returns (uint256) {
        return number * 3;
    }

    function isZero() external view returns (bool) {
        return getNumber() == 0;
    }
}

contract VisibilityChild is VisibilityLab {
    function saveFromChild(uint256 number) external {
        require(number <= 1000, "Number too large");
        _save(number);
    }
}