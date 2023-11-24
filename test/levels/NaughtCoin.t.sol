// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {NaughtCoin, NaughtCoinFactory} from "ethernaut/levels/NaughtCoinFactory.sol";

contract NaughtCoinLevel is SetUpLevelTest {
    NaughtCoin internal naughtCoin;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new NaughtCoinFactory());
        super.setUp();
        naughtCoin = NaughtCoin(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
