// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {CoinFlip, CoinFlipFactory} from "ethernaut/levels/CoinFlipFactory.sol";

contract CoinFlipLevel is SetUpLevelTest {
    CoinFlip internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new CoinFlipFactory());
        super.setUp();
        lv = CoinFlip(payable(instance));
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
