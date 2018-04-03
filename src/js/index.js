var web3Provider = null;
var abi;

if (typeof web3 !== 'undefined') {
  web3Provider = new Web3(web3.currentProvider);
} else {
  // set the provider you want from Web3.providers
  web3Provider = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

$.getJSON('../Asset.json', function(data){
	abi = data['abi'];
	TradingContract = web3.eth.contract(abi);
	contractInstance = TradingContract.at('0xf6e3b6936db073b7283920378eaececb9d601f58');
	console.log(contractInstance)
});