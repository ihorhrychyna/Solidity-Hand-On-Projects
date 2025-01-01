// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

//MyltiplayerGame contract
contract MultiplayerGame {
    mapping (address => bool) public players;

    function JoinGame() public virtual{
        players[msg.sender] = true;
    } 
}

//Game contract inheritance from MultiplayerGame

contract Game is MultiplayerGame {
    string public gameName;
    uint256 public playerCount;

    constructor(string memory _gameName){
        gameName = _gameName;
        playerCount = 0;
    }

    function startGame() public {
    //Perform game-specific logic here


    }

    function joinGame() public virtual {
        super.JoinGame(); // functions from parent contract
        // add your own function
        playerCount++;

    }


}