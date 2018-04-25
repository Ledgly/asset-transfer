pragma solidity ^0.4.18;

contract Owned {
	
	address public currentOwner;
	address public pendingOwner;

	// Constructor //
	function Owned() public {
		currentOwner = msg.sender;
	}

	// Modifier //
	modifier onlyOwner(){
		if (currentOwner == msg.sender){
			_;
		}
	}

	modifier onlyPendingOwner(){
		if (pendingOwner == msg.sender) {
			_;
		}
	}

	// methods //
	function changeOwnership(address _to) onlyOwner public returns(bool){
		pendingOwner = _to;
		return true;
	}

	function claimOwnership() onlyPendingOwner public returns(bool){
		currentOwner = pendingOwner;
		return true;
	}

	function forceChangeOwnership(address _to) onlyOwner public returns(bool) {
		currentOwner = _to;
		return true;
	}

	// Getters //
	function getOwner() public view returns(address){
		return currentOwner;
	}

}
