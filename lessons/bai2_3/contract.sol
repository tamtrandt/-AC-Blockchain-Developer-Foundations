// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

contract Welcome {
    string public message; 

    constructor(string memory Message) {
        message = Message;
    }

    function getGreeting() public view returns (string memory) {
        return message;
    }

    function getGreetingAndSender() public view returns (string memory, address) {
        return (message, msg.sender);
    }
}