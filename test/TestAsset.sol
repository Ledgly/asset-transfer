pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Asset.sol";

contract TestAsset{
	Asset asset = Asset(DeployedAddresses.Asset());

	address a1 = 0x96576cc0E57d6303DFe763Cb7f060EFCFFaaa2f8;

	address a2 = 0xbdE17789B3FC44A85EF73b3be5158610121BEBeB;

	function testOwnership() public {
		address owner = asset.getOwner();
		Assert.equal(owner, a1, "Owner should be the first account.");
	}


}