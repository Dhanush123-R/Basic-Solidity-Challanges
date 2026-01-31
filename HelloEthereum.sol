//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract HelloEthereum {

    string newName;

    function setName(string memory name) public {
        newName = name;
    }

    function getName() public view returns(string memory) {
        return newName;
    }
}
