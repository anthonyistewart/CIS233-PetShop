pragma solidity ^0.5.0;


contract ERC20Basic {
    

    function totalSupply() public view returns (uint256) {}
    
    function balanceOf(address tokenOwner) public view returns (uint) {}

    function transfer(address receiver, uint numTokens) public returns (bool) {}

    function approve(address delegate, uint numTokens) public returns (bool) {}

    function allowance(address owner, address delegate) public view returns (uint) {}

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {}
}

contract Adoption{
  address[16] public adopters;
  ERC20Basic erc20;

  // Create a variable that stores the pet price
  uint private petPrice = 1 ether;

  // Adopting a pet
  // This function becomes "payable" so we can send money to the contracts
  // We also require the value sent to this contract be exactly equal to the pet price
  function adopt(uint petId) public returns (uint){
    require(petId >= 0 && petId <=15, "Invalid Pet ID");
    require(adopters[petId] == address(0), "Pet already owned.");
    require(erc20.balanceOf(msg.address) >= 1, "You must pay the exact price.");

    adopters[petId] = msg.sender;
    

    return petId;
  }
  
  //Set the address for our ERC20 standard
  constructor (address _t) public {
        erc20 = ERC20Basic(_t);
   }
  
  

  // Retrieving the adopters
  function getAdopters() public view returns (address[16] memory){
    return adopters;
  }
}
