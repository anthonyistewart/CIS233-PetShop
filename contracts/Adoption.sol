pragma solidity ^0.5.0;

contract BasicERC20 {
  function totalSupply() public view returns (uint256) {}
  function balanceOf(address tokenOwner) public view returns (uint) {}
  function transfer(address receiver, uint numTokens) public returns (bool) {}
  function approve(address delegate, uint numTokens) public returns (bool) {}
  function allowance(address owner, address delegate) public view returns (uint) {}
  function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {}
}

contract Adoption{

contract ERC20Basic {


  mapping(uint => Pet) pets;

  uint dogcoinPrice = 1 ether;
  address petShopOwner;
  BasicERC20 dogcoin;

  constructor(address _t) public{
    dogcoin = BasicERC20(_t);
    petShopOwner = msg.sender;

      for(uint i=0; i<16; i++){
          pets[i].petPrice = 1;
          pets[i].owner = address(0);
      }
  }

  // Adopting a pet
  function adopt(uint petId) public returns (uint){
    require(petId >= 0 && petId <=15, "Invalid Pet ID");
    require(pets[petId].owner == address(0), "Pet already owned.");
    require(dogcoin.balanceOf(msg.sender) >= pets[petId].petPrice, "You must pay the exact price.");
    require(dogcoin.allowance(msg.sender, address(this)) >= pets[petId].petPrice, "You must approve the payment.");

    dogcoin.transferFrom(msg.sender, petShopOwner, pets[petId].petPrice);
    pets[petId].owner = msg.sender;

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

  function buyDogCoin() payable public returns (uint){
    require(msg.value == dogcoinPrice, "You must pay the exact price.");
    require(dogcoin.transfer(msg.sender, 1), "Token transfer failed.");
    return dogcoin.balanceOf(msg.sender);
  }

  function getBalance(address account) public view returns (uint){
    require(account != address(0), "You must provide a valid address.");
    return dogcoin.balanceOf(account);
  }
}
