// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Voting{

    struct Candidate {
        string name;
        uint256 voteCount;
    }
    address public owner;
    uint256 public nextCandidateId;

    //mapping
    mapping(uint256 => Candidate) public candidates;

    mapping(address => bool) public hasVoted;


    //Event

    event VotedSuccessfully(address indexed voter, uint256 indexed candidateId);


    //Modifier
    modifier onlyOwner(){
        require(msg.sender == owner, "Voting: Only Owner can action.");
        _;
    }

     //Constructor
    constructor() {
        owner = msg.sender;
        nextCandidateId = 0;
    }

    //Function
    function addCandidate(string calldata _name) public onlyOwner {
        candidates[nextCandidateId] = Candidate(_name, 0);
        nextCandidateId++;
    }



    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender] , "Voting: you have already voted.");

        require(_candidateId < nextCandidateId , "Voting: Invalid candidate ID.");

        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;
        emit VotedSuccessfully(msg.sender, _candidateId);
    }


    function getCandidatescount() public view returns (uint256) {
        return nextCandidateId;
    }


}

