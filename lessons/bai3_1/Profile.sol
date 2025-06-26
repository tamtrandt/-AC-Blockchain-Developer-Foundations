// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Profile {
    
    string public name;
    uint256 public age; 
   
    constructor() {}

    function setProfile(string calldata _name, uint256 _age) public { 
        name = _name; 
        age = _age;  
        
    }

   
}