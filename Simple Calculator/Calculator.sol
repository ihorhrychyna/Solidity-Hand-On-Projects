// SPDX-License-Identifier: MIT
// The SPDX license identifier specifies that this contract is licensed under the MIT License.

pragma solidity ^0.8.26;
// This sets the Solidity version. The contract is compatible with Solidity 0.8.26 or higher versions within 0.8.x.

contract Calculator {
    // This contract implements a basic calculator that performs arithmetic operations.

    uint256 result = 0;
    // A state variable to store the result of the calculations. It starts at 0.

    function add(uint256 num) public {
        // Adds the input number `num` to the current result.
        result += num;
    }

    function subtract(uint256 num) public {
        // Subtracts the input number `num` from the current result.
        result -= num;
    }

    function multiply(uint256 num) public {
        // Multiplies the current result by the input number `num`.
        result *= num;
    }

    function divide(uint256 num) public {
        // Divides the current result by the input number `num`.
        // Note: Ensure `num` is not zero to avoid division by zero errors.
        result /= num;
    }

    function GetResult() public view returns (uint256) {
        // Returns the current value of the `result` variable.
        // This is a view function, so it doesn't modify the state.
        return result;
    }
}
