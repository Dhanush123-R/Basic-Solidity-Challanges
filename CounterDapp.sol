//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CounterDapp {

    error CounterDapp__NumberCannotDecrement();
    
    uint256 number;

    function setNumber(uint256 _number) public {
        number = _number;
    }

    function getNumber() public view returns(uint256) {
        return number;
    }

    function increment() public {
        number = number + 1;
    }

    function decrement() public {
        if(number == 0) {
            revert CounterDapp__NumberCannotDecrement();
        }
        number = number - 1;
    }
}
