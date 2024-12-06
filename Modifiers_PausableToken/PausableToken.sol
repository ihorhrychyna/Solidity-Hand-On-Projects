// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// A simple token contract with pausable functionality to allow or block transfers.

contract PausableToken {
    address public owner; // The address of the contract owner.
    bool public paused; // A flag indicating whether the contract is paused.
    mapping(address => uint) public balances; // A mapping to store the balances of each address.

    // Constructor function initializes the contract state.
    constructor() {
        owner = msg.sender; // Set the owner to the account deploying the contract.
        paused = false; // The contract starts in an unpaused state.
        balances[owner] = 1000; // Assign an initial balance of 1000 tokens to the owner.
    }

    // Modifier to restrict access to functions only to the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner"); // Check if the caller is the owner.
        _; // Continue executing the function.
    }

    // Modifier to ensure the contract is not paused before executing the function.
    modifier notPaused() {
        require(paused == false, "The contract is paused!"); // Check if the contract is unpaused.
        _; // Continue executing the function.
    }

    // Function to pause the contract, only callable by the owner.
    function pause() public onlyOwner {
        paused = true; // Set the `paused` flag to true.
    }

    // Function to unpause the contract, only callable by the owner.
    function unpause() public onlyOwner {
        paused = false; // Set the `paused` flag to false.
    }

    // Function to transfer tokens to another address, callable only when the contract is unpaused.
    function transfer(address to, uint amount) public notPaused {
        require(balances[msg.sender] >= amount, "Insufficient Balance"); // Ensure the sender has enough balance.

        balances[msg.sender] -= amount; // Deduct the amount from the sender's balance.
        balances[to] += amount; // Add the amount to the recipient's balance.
    }
}
