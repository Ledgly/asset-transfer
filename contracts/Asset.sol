pragma solidity ^0.4.18;

import "./Owned.sol";

contract Asset is Owned{

	// Defines the attributes of the piece of art
	struct Assets {
		string name;                // Name of the art object
	    uint serial;                // Hash of the original document
	    uint created;               // When was this created
	    uint8 dependency;           // Any dependency (not sure what it can be at this point)
	    string creator;             // who created the art
	    address location;           // where it is created
	    uint totalRelease;
	    uint releaseNumber;         // X of Y release
	    uint8 unlockPaymentCode;    // Binds this to the existing owner
	    bool isFinal;               // left over from Propy.		
	}

    address artAddress;
	mapping (address => Assets) asset;
	
	function Asset(string _name, uint _serial, uint _created, uint8 _dependency, string _creator, 
					address _location, uint _totalRelease, uint _releaseNumber, uint8 _unlockPaymentCode, bool _isFinal) public{
	 
			artAddress = msg.sender;
			asset[artAddress].name = _name;
			asset[artAddress].serial = _serial;
			asset[artAddress].created = _created;
			asset[artAddress].dependency = _dependency;
			asset[artAddress].creator = _creator;
			asset[artAddress].location = _location;
			asset[artAddress].totalRelease = _totalRelease;
			asset[artAddress].releaseNumber = _releaseNumber;
			asset[artAddress].unlockPaymentCode = _unlockPaymentCode;
			asset[artAddress].isFinal = _isFinal;
			emit Sent(artAddress, _totalRelease, _releaseNumber);


		}

    event Sent(address from, uint totalRelease, uint _releaseNumber);
    
    function setisFinal() public {
        
    }
    
	function getAllAssetProperties() public view returns(address) {
		return artAddress;
	}
	

}
