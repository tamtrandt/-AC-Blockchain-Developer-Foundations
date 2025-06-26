// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingEligibility {
    
    uint public minAge;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "VotingEligibility: Only owner can call this function.");
        _;
    }

    constructor() {
        minAge = 18;
        owner = msg.sender;
    }

    function checkEligibility(uint age) public view returns (bool) {
        if (age >= minAge) {
            return true;
        } else {
            return false;
        }
    }

  
    function updateMinAge(uint newMinAge) public onlyOwner {
        minAge = newMinAge;
    }
}