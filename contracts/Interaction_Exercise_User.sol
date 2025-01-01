// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract User {
    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address userAddress, string memory username) external {
        // Ensure the user doesn't already exist
        require(players[userAddress].playerAddress == address(0), "User already exists");

        // Create a new player and add to the mapping
        Player memory newPlayer = Player({
            playerAddress: userAddress,
            username: username,
            score: 0
        });

        players[userAddress] = newPlayer;
    }
}