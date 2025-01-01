Eventify - Decentralized Event Ticketing System

Eventify is a decentralized event ticketing system built on the Ethereum blockchain. It leverages the power of ERC-721 Non-Fungible Tokens (NFTs) to represent event tickets. This ensures that every ticket is unique, traceable, and securely stored on the blockchain. The system allows event organizers to manage ticket sales and gives users the ability to buy and sell event tickets in a transparent and secure environment.
Features

    Create Events: Organizers can create events, set ticket prices, define the maximum number of tickets available, and specify the event date.
    Buy Tickets: Users can purchase tickets for events using ETH. Each ticket is minted as an NFT, representing ownership.
    Ticket Returns: Users can return tickets, and a refund is provided if the event has not yet occurred.
    NFT-based Tickets: Each ticket is a unique ERC-721 token, providing secure and verifiable ownership of the ticket.
    Event Information: Users can view event details such as event name, date, and ticket price.

Smart Contract

The smart contract is written in Solidity and utilizes the OpenZeppelin library for ERC-721 functionality and ownership control.

    ERC-721 NFTs: Each ticket is represented as an ERC-721 token.
    Owner-Only Functions: Event creation and other management actions are restricted to the contract owner.
    Event Management: Event organizers can create events, set ticket prices, and manage ticket sales.

Getting Started

To interact with the Eventify contract, you need to deploy the smart contract on an Ethereum-compatible blockchain and interact with it using a Web3 wallet like MetaMask. The contract allows users to buy tickets with ETH, view event details, and return tickets if necessary.
Prerequisites

    Solidity: The smart contract is written in Solidity (version 0.8.26).
    Ethereum Network: The contract can be deployed to any Ethereum-compatible network (mainnet, testnet, or a local development network like Ganache).
    MetaMask: A browser extension or mobile wallet for interacting with the contract.

Installation

    Clone this repository:

git clone https://github.com/your-username/Eventify.git

Install dependencies:

    npm install

    Deploy the contract on an Ethereum-compatible network.

Usage

    Add Event: Event organizers can call the addEvent function to create an event, specifying the event name, date, ticket price, and maximum tickets.
    Buy Ticket: Users can purchase tickets using ETH by calling the buyTicket function.
    Return Ticket: If the user decides to return the ticket, they can call the returnTicket function, and the contract will process the refund if the event has not yet occurred.

Contributing

I welcome contributions to improve the Eventify project. If you have suggestions or improvements, feel free to open an issue or submit a pull request.
License

This project is licensed under the MIT License - see the LICENSE file for details.
