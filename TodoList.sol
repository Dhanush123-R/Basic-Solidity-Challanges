//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TodoList {

    struct Task{
        string startDate;
        string endDate;
        string taskName;
        string description;
        uint256 priority;
        bool isCompleted;
    }

    event TaskCreated(address indexed sender, uint256 taskNumber);
    event TaskCompleted(address indexed sender, uint256 taskNumber);
    event TaskDeleted(address indexed sender, uint256 taskNumber);
    event DescriptionUpdated(address indexed sender, uint256 taskNumber, string Description);
    event PriorityUpdated(address indexed sender, uint256 taskNumber, uint256 priority);
    event EndDateUpdated(address indexed sender, uint256 taskNumber, string endDate);

    mapping(address => Task[]) tasks;
    
    function createTasks(string memory _startDate, string memory _endDate, string memory taskName, string memory _description, uint256 _priority, bool _isCompleted) public {
        Task memory newTasks = Task(_startDate, _endDate, taskName, _description, _priority, _isCompleted);
        tasks[msg.sender].push(newTasks);

        uint256 taskNumber = tasks[msg.sender].length - 1;

        emit TaskCreated(msg.sender, taskNumber);
    }

    function isTaskCompleted(uint256 _taskNumber) public {
        require(_taskNumber < tasks[msg.sender].length, "Task is not present");
        tasks[msg.sender][_taskNumber].isCompleted = !tasks[msg.sender][_taskNumber].isCompleted;

        emit TaskCompleted(msg.sender, _taskNumber);
    }

    function deleteTasks(uint256 _taskNumber) public {
        uint256 lastTask = tasks[msg.sender].length -1;
        require(tasks[msg.sender].length > 0, "List is already empty");
        require(_taskNumber <= lastTask, "Task does not exist");

        tasks[msg.sender][_taskNumber] = tasks[msg.sender][lastTask];
        tasks[msg.sender].pop();

        emit TaskDeleted(msg.sender, _taskNumber);
    }

    function extendEndDate(uint256 _taskNumber, string memory _newEndDate) public {
        require(!tasks[msg.sender][_taskNumber].isCompleted, "Task is already done");
        tasks[msg.sender][_taskNumber].endDate = _newEndDate;
        emit EndDateUpdated(msg.sender, _taskNumber, _newEndDate);
    }

    function updateDescription(uint256 _taskNumber, string memory _newDescription) public {
        require(!tasks[msg.sender][_taskNumber].isCompleted, "Task is already done");
        tasks[msg.sender][_taskNumber].description = _newDescription;
        emit DescriptionUpdated(msg.sender, _taskNumber, _newDescription);
    }

    function updatePriority(uint256 _taskNumber, uint256 _newPriority) public {
        require(!tasks[msg.sender][_taskNumber].isCompleted, "Task is already done");
        tasks[msg.sender][_taskNumber].priority = _newPriority;
        emit PriorityUpdated(msg.sender, _taskNumber, _newPriority);
    }

    function getTasksCount() public view returns (uint256) {
        return tasks[msg.sender].length;
    }

    function getTasks(uint256 _taskNumber) public view returns (Task memory) {
        return tasks[msg.sender][_taskNumber];
    }

}
