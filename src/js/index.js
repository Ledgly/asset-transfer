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
	contractInstance = TradingContract.at('0xde37a6b9624f67f98b19b3702756436f2c5f0b04');
	console.log(contractInstance);

	contractInstance.method.uuid().call(function(err,res) {
		console.log("data:" + res);
		console.log("stuff:" + err);
	});
});