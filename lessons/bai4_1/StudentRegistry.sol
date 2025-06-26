// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegistry {

    struct Student {
        string name;
        uint256 age;
        bool isRegistered;
    }


    mapping(address => Student) public students;


    function register(string calldata _name, uint256 _age) public {
        require(!students[msg.sender].isRegistered, "Student already registered!");

        students[msg.sender].name = _name;
        students[msg.sender].age = _age;
        students[msg.sender].isRegistered = true;
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