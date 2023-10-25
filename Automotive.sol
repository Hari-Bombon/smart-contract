// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Automotive {
    // Variables
    address public owner;
    mapping(address => bool) public buyers;
    string public vehicleMake;
    string public vehicleModel;
    uint public price;

    // Events
    event Purchase(address indexed buyer, string make, string model, uint price);

    // Constructor
    constructor() {
        owner = msg.sender;
        price = 0; // Initialize with a default price
    }

    // Modifier to check if the price is set
    modifier priceIsSet() {
        require(price > 0, "Price is not set");
        _;
    }

    // Functions
    function buyVehicle(string memory _make, string memory _model) public payable priceIsSet {
        require(msg.value >= price, "Insufficient funds");
        require(!buyers[msg.sender], "Already purchased");
        vehicleMake = _make;
        vehicleModel = _model;
        buyers[msg.sender] = true;
        emit Purchase(msg.sender, _make, _model, price);
    }

    function setPrice(uint _price) public {
        require(msg.sender == owner, "Only the owner can set the price");
        price = _price;
    }

    function checkOwnership() public view returns (bool) {
        return buyers[msg.sender];
    }
}
