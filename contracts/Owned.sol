pragma solidity ^0.4.18;

contract Owned {
	
	address public currentOwner;
	address public pendingOwner;

	// constructor //
	function Owned() {
		currentOwner = msg.sender;
	}

	// modifier //
	modifier onlyOwner(){
		if (currentOwner == msg.sender){
			_;
		}
	}

	modifer onlyPendingOwner(){
		if (pendingOwner == msg.sender) {
			_;
		}
	}

	// methods //
	function changeOwnership(address _to) onlyOwner returns(bool){
		pendingOwner = _to;
		return true;
	}

	function claimOwnership() onlyPendingOwner returns(bool){
		contractOwner = pendingContractOwner;
		return true;
	}

	function forceChangeOwnership(address _to) onlyOwner returns(bool) {
		contractOwner = _to;
		return true;
	}

}