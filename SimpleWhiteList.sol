//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract WhiteList {

    address owner;

    constructor(){
        owner = msg.sender;
    }

    mapping(address => bool) public whiteList;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function addUser(address[] calldata whiteListAddress) external onlyOwner {
        for(uint256 i=0;i<whiteListAddress.length;i++) {
            whiteList[whiteListAddress[i]] = true;
        }
    }

    function deleteUser(address[] calldata whiteListAddress) external onlyOwner {
        for(uint256 i=0;i<whiteListAddress.length;i++) {
            whiteList[whiteListAddress[i]] = false;
        }
    }

    function whiteListFunc(address _address) public {
        require(whiteList[msg.sender], "You don't have access");

        // execute the specified operation from here
    }
}
