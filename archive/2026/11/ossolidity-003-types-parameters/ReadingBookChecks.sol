// SPDX-License-Identifier: MIT
pragma solidity 0.8.38;

import "./ReadingBook.sol";

/// @notice A different contract address used to demonstrate authorization checks.
contract OtherCaller {
    function attempt(ReadingBook book, uint256 watts) external {
        book.record(watts);
    }
}

/// @notice Classroom assertions designed to run in the Remix VM.
/// @dev All checks create isolated contracts; do not deploy to a paid network.
contract ReadingBookChecks {
    function checkDefaults() external returns (bool) {
        ReadingBook book = new ReadingBook("miner-a");
        (string memory label, uint256 watts, bool recorded) = book.summary();
        assert(keccak256(bytes(label)) == keccak256(bytes("miner-a")));
        assert(watts == 0 && !recorded);
        assert(book.instructor() == address(this));
        assert(book.TRAINING_LIMIT_WATTS() == 1000);
        return true;
    }

    function checkRecordAndZero() external returns (bool) {
        ReadingBook book = new ReadingBook("miner-a");
        book.record(0);
        (, uint256 zeroWatts, bool hasZero) = book.summary();
        assert(zeroWatts == 0 && hasZero);
        book.record(125);
        (, uint256 nextWatts, bool hasNext) = book.summary();
        assert(nextWatts == 125 && hasNext);
        return true;
    }

    function checkPureFunction() external returns (bool) {
        ReadingBook book = new ReadingBook("miner-a");
        assert(book.twice(75) == 150);
        assert(book.twice(0) == 0);
        return true;
    }

    function checkRename() external returns (bool) {
        ReadingBook book = new ReadingBook("miner-a");
        book.rename("bench-b");
        (string memory label,,) = book.summary();
        assert(keccak256(bytes(label)) == keccak256(bytes("bench-b")));
        return true;
    }

    function checkUnauthorizedCaller() external returns (bool) {
        ReadingBook book = new ReadingBook("miner-a");
        OtherCaller stranger = new OtherCaller();
        bool rejected;
        try stranger.attempt(book, 75) {
            rejected = false;
        } catch {
            rejected = true;
        }
        assert(rejected && !book.hasReading());
        return true;
    }

    function checkReadingLimit() external returns (bool) {
        ReadingBook book = new ReadingBook("miner-a");
        bool rejected;
        try book.record(1001) {
            rejected = false;
        } catch {
            rejected = true;
        }
        assert(rejected && !book.hasReading());
        return true;
    }

    function checkEmptyConstructorLabel() external returns (bool) {
        bool rejected;
        try new ReadingBook("") returns (ReadingBook created) {
            rejected = false;
            created;
        } catch {
            rejected = true;
        }
        assert(rejected);
        return true;
    }
}
