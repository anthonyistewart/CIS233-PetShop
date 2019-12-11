var Adoption = artifacts.require("Adoption");
var BasicERC20 = artifacts.require("BasicERC20");

module.exports = function(deployer) {
  deployer.deploy(BasicERC20, 16).then(function(erc20){
    deployer.deploy(Adoption, erc20.address);
  });
};
