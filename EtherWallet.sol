//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract EtherWallet {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    mapping(address => uint256) public balances; // Mapping to store balances of addresses

    function deposit() public payable {
        require(msg.value > 0, "Amount is not enough to deposit");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] > _amount, "Balance is not enough to withdraw");
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Withdraw failed");
    }
    
    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] > _amount, "Amount is not enough to transfer");
        require(_to != address(0), "Invalid address");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}
