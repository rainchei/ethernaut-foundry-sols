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
    }
}
