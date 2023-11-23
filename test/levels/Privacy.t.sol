// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Privacy, PrivacyFactory} from "ethernaut/levels/PrivacyFactory.sol";

contract PrivacyLevel is SetUpLevelTest {
    Privacy internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new PrivacyFactory());
        super.setUp();
        lv = Privacy(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
