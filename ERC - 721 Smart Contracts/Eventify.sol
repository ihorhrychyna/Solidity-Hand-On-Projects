// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Eventify is Ownable, ERC721Enumerable  {

    // Struct to store event data
    struct Event {
        string name;        
        uint256 date;       
        uint256 priceTicket; 
        uint256 maxTickets;  
        uint256 countTickets; 
    }

    // Mapping to store events by their ID
    mapping(uint256 => Event) public events;
    uint256 public eventCount; 

    // Declare the event
    event TicketPurchased(address indexed buyer, uint256 indexed eventId, uint256 quantity);

    event TicketReturned(address indexed owner, uint256 indexed eventId, uint256 tokenId);

    constructor(string memory name, string memory symbol, address initialOwner) 
    ERC721(name, symbol)  // Passing strings to the ERC721 constructor
    Ownable(initialOwner) { // Passing the owner to the Ownable constructor
        transferOwnership(initialOwner);  // Set contract owner
    }


    // Function to add a new event
    function addEvent(
        string memory _name, 
        uint256 _date, 
        uint256 _priceTicket, 
        uint256 _maxTickets
    ) external onlyOwner {
        require(_date > block.timestamp, "Event time expired");
        require(_maxTickets > 0, "Tickets can't be zero");

        // Add the event to the mapping
        events[eventCount] = Event({
            name: _name,
            date: _date,
            priceTicket: _priceTicket,
            maxTickets: _maxTickets,
            countTickets: 0
        });

        eventCount++;
    } 

     
    function buyTicket(uint256 eventId, uint256 quantity) external payable {
        // 1. Ensure the event exists
        require(eventId < eventCount, "Event does not exist");
        Event storage _event = events[eventId];

        // 2. Ensure the event has not already occurred
        require(_event.date > block.timestamp, "Event has already occurred");

        // 3. Check if there are enough tickets available
        require(_event.countTickets + quantity <= _event.maxTickets, "Not enough tickets available");

        // 4. Verify that enough ETH is sent for the purchase
        require(msg.value >= _event.priceTicket * quantity, "Insufficient ETH sent");

        // 5. Mint an NFT for each ticket
        for (uint256 i = 0; i < quantity; i++) {
            _mint(msg.sender, totalSupply()); // Generate a unique token
        }

        // 6. Update the count of sold tickets
        _event.countTickets += quantity;

        // 7. (Optional) Log the ticket purchase
        emit TicketPurchased(msg.sender, eventId, quantity);
    }

      
    function getEventDetails(uint256 eventId) external view returns (string memory name, uint256 date, uint256 priceTicket)  {
        // Ensure the event exists
        require(eventId < eventCount, "Event does not exist");

        // Get the event details from the mapping
        Event storage _event = events[eventId];

        // Return the details in the required format
        return (_event.name, _event.date, _event.priceTicket);
    }

    
    function getTicketsByOwner(address owner) external view returns (uint256[] memory) {
        uint256 balance = balanceOf(owner); // Get the current token balance of the owner
    
        // Check if the owner has any token balance 
        if (balance == 0) {
            return new uint256[](0);
        }
    
        // Declare the array of ticket IDs 
        uint256[] memory tickets = new uint256[](balance);

        // Add each token to the array
        for (uint256 i = 0; i < balance; i++) {
            tickets[i] = tokenOfOwnerByIndex(owner, i);
        }

        return tickets;
    }


    function returnTicket(uint256 eventId, uint256 ticketId) external {
        // 1. Check if the event exists
        require(eventId < eventCount, "Event does not exist");
        Event storage _event = events[eventId];

        // 2. Check if the ticket belongs to the user
        require(ownerOf(ticketId) == msg.sender, "You are not the ticket owner");

        // 3. Check if the event has not yet occurred
        require(_event.date > block.timestamp, "Event has already occurred");

        // 4. Remove the ticket from the user's account
        _burn(ticketId); // Remove the NFT from the owner

        // 5. Update the count of sold tickets
        _event.countTickets -= 1;

        // 6. Refund the user if needed
        payable(msg.sender).transfer(_event.priceTicket); // Refund the user

        // 7. Log the ticket return
        emit TicketReturned(msg.sender, eventId, ticketId);
    }



}