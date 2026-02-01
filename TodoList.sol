//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TodoList {

    struct Task{
        string startDate;
        string endDate;
        string taskName;
        string priority;
        bool isCompleted;
    }

    mapping(address => Task[]) tasks;
    
    function setTasks(string memory _startDate, string memory _endDate, string memory taskName, string memory _priority, bool _isCompleted) public {
        Task memory newTasks = Task(_startDate, _endDate, taskName, _priority, _isCompleted);
        tasks[msg.sender].push(newTasks);
    }

    function getTasks(address _address, uint256 _taskNumber) public view returns (Task memory) {
        return tasks[_address][_taskNumber];
    }
}
