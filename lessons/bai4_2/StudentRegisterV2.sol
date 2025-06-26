// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegistry {

    //Data Type Declare
    struct Student {
        string name;
        uint256 age;
        bool isRegistered;
    }
    address public owner;


    //Event Declare 
    event StudentAdded(address indexed studentAddress, string name, uint256 age);



    //Mapping
    mapping(address => Student) public students;


    //Constructor
    constructor() {    
        owner = msg.sender;
    }


    //Modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "StudenRegistry: Only owner action.");
        _;
    }

    //Function
    function addStudent(address _studentAddress, string calldata _name, uint256 _age) public onlyOwner {
        require(!students[msg.sender].isRegistered, "Student already registered!");
        students[msg.sender].name = _name;
        students[msg.sender].age = _age;
        students[msg.sender].isRegistered = true;
        //Emit Event
        emit StudentAdded(_studentAddress, _name, _age);
    }

    
    function getStudent(address _user ) public view returns (string memory name,
    uint age, bool isRegistered) {
        Student storage studentInfo = students[_user];
        return (studentInfo.name, studentInfo.age, studentInfo.isRegistered);
    }

    function isStudentRegistered(address _user) public view returns (bool) {    
        return students[_user].isRegistered;
    }
}