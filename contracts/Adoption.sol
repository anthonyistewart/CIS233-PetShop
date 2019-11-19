pragma solidity ^0.5.0;

contract Adoption{
  address[16] public adopters;

  // Create a variable that stores the pet price
  uint private petPrice = 1 ether;

  // Adopting a pet
  // This function becomes "payable" so we can send money to the contracts
  // We also require the value sent to this contract be exactly equal to the pet price
  function adopt(uint petId) payable public returns (uint){
    require(petId >= 0 && petId <=15, "Invalid Pet ID");
    require(adopters[petId] == address(0), "Pet already owned.");
    require(msg.value == petPrice, "You must pay the exact price.");

    adopters[petId] = msg.sender;

    return petId;
}

  // Retrieving the adopters
  function getAdopters() public view returns (address[16] memory){
    return adopters;
  }
}
