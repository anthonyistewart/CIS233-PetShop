pragma solidity ^0.5.0;

contract Adoption{

  struct Pet {
    uint petPrice;
    address owner;
  }

  mapping(uint => Pet) pets;
  //Pet pets[16];

  constructor() public{
      for(uint i=0; i<16; i++){
          pets[i].petPrice = 1 ether;
          pets[i].owner = address(0);
      }
  }

  // Adopting a pet
  // This function becomes "payable" so we can send money to the contracts
  // We also require the value sent to this contract be exactly equal to the pet price
  function adopt(uint petId) payable public returns (uint){
    require(petId >= 0 && petId <=15, "Invalid Pet ID");
    require(pets[petId].owner == address(0), "Pet already owned.");
    require(msg.value == pets[petId].petPrice, "You must pay the exact price.");

    pets[petId].owner = msg.sender;

    return petId;
  }

  // Retrieving the address of the owner of this pet
  function getAdopter(uint petId) public view returns (address){
    require(petId >= 0 && petId <=15, "Invalid Pet ID");
    return pets[petId].owner;
  }

  // Retrieving all the adopters
  function getAdopters() public view returns (address[16] memory){
    address[16] memory adopters;
    for(uint i=0; i<16; i++){
      adopters[i] = pets[i].owner;
    }
    return adopters;
  }
}
