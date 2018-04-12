pragma solidity ^0.4.18;

import "./Owned.sol";

contract Asset is Owned{
	
	struct Properties {
		bytes32 name;
		// Additional Properties

	}

	bytes32 public uuid = "uuid";

	Properties properties;

	function Asset(bytes32 _uuid) public{
		uuid = _uuid;
	}

}