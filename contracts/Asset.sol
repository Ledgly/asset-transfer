pragma solidity ^0.4.18;

import "./Owned.sol";

contract Asset is Owned{
	
	struct Properties {
		bytes32 name;               // Name of the art object
	    uint created;               // When was this created
	    uint8 dependency;           // Any dependency (not sure what it can be at this point)
	    bytes32 creator;            // who created the art
	    address location;           // where it is created
	    uint totalRelease;
	    uint releaseNumber;         // X of Y release
	    uint8 unlockPaymentCode;    // Binds this to the existing owner
	    bool isFinal;               // left over from Propy.	
	}

	enum State { forSale, onAuction, notForSale }

	bytes32 public serial;
	State public sellState;

	// Market Sell //
	uint public expiry; // Note: delete on notForSale
	uint public price;

	Properties properties;

	// Constructor //
	function Asset(bytes32 _serial, bytes32 _name, uint _created, uint8 _dependency, 
		bytes32 _creator, address _location, uint _totalRelease, uint _releaseNumber,
		uint8 _unlockPaymentCode, bool _isFinal) public{

		serial = _serial;

		sellState = State.notForSale;

		properties.name = _name;
		properties.created = _created;
		properties.dependency = _dependency;
		properties.creator = _creator;
		properties.location = _location;
		properties.totalRelease = _totalRelease;
		properties.releaseNumber = _releaseNumber;
		properties.unlockPaymentCode = _unlockPaymentCode;
		properties.isFinal = _isFinal;

		// Events // 
		//emit Sent(currentOwner, _totalRelease, _releaseNumber);

	}

	// Modifier //
	modifier isForSale(){
		if (sellState == State.forSale){
			_;
		}
	}

	modifier isOnAuction(){
		if (sellState == State.onAuction) {
			_;
		}
	}

	modifier isNotForSale(){
		if (sellState == State.notForSale) {
			_;
		}
	}

	modifier beforeExpiry(){
		if (expiry >= now) {
			_;
		}
	}

	// Direct Purchase //

	function setForSale(uint _price, uint _expiry) onlyOwner external returns(bool) {
		expiry = _expiry;
		price = _price;
		sellState = State.forSale;
		return true;
	}

	function buyAsset() beforeExpiry isForSale external payable returns (bool){
		require(msg.value >= price);

		// Overpayment - we need a method of withdrawl for overpaid ethers. (and keeping track of them)
		// this is so that people who pay extra for gas can be refunded

		// Change Ownership - We need to be able to call changeOwnership in Owned.sol; but the function call
		// is only available for the owner of Asset.

		return true;

	}

	// Auction //

	// We need to add the functionality for the auction likely following the resource from the meeting.
	// If there is a time-based control, we need an accurate method of determining the time. now() only returns
	// the current block time which is inaccurate to some degree.



    event Sent(address from, uint totalRelease, uint releaseNumber);





}