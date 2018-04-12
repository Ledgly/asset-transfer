const Asset = artifacts.require("Asset.sol");

module.exports = async (deployer, network, accounts) => {
	const OWNER = accounts[0];

	deployer.deploy(Asset, "0000000000000");
}