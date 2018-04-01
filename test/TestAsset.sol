pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Asset.sol";

contract TestAsset{
	Asset asset = Asset(DeployedAddresses.Asset());

	function testOwnership() public {
		address owner = asset.getOwner();
		Assert.equal(owner, 0x96576cc0E57d6303DFe763Cb7f060EFCFFaaa2f8, "Owner should be the first account.");
	}


}