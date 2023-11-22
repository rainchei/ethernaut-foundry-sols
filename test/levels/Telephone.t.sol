// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Telephone, TelephoneFactory} from "ethernaut/levels/TelephoneFactory.sol";

contract TelephoneLevel is SetUpLevelTest {
    Telephone internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new TelephoneFactory());
        super.setUp();
        lv = Telephone(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}