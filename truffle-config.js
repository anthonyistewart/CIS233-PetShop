const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "legal salute universe below cruel snap music eternal lottery spin decade opera";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 8545
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/42a6230951844fe6a55026f80560442a")
      },
      network_id: 3
    }
  }
};
