// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(address => bool) public hasVoted;

    Candidate[] public candidates;

    constructor() {
        candidates.push(Candidate("pavan", 0));
        candidates.push(Candidate("satvik", 0));
    }

    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "Already voted");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    function getVotes(uint candidateIndex) public view returns(uint) {
        return candidates[candidateIndex].voteCount;
    }

}
