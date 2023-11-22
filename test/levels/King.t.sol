// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {King, KingFactory} from "ethernaut/levels/KingFactory.sol";

contract KingLevel is SetUpLevelTest {
    King internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new KingFactory());
        super.setUp();
        lv = King(payable(instance));
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
