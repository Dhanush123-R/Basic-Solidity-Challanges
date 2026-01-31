//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract BasicCalculator {

    error BasicCalculator__ZeroDivisionError();
    error BasicCalculator__NegativeValueResult();

    function addition(uint256 a, uint256 b) public pure returns(uint256) {
        return a + b;
    }

    function subtraction(uint256 a, uint256 b) public pure returns(uint256) {
        if(b > a) {
            revert BasicCalculator__NegativeValueResult();
        }
        return a - b;
    }

    function multiplication(uint256 a, uint256 b) public pure returns(uint256) {
        return a * b;
    }

    function division(uint256 a, uint256 b) public pure returns(uint256) {
        if(b == 0) {
            revert BasicCalculator__ZeroDivisionError();
        }
        return a / b;
    }
}
