// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Recovery, RecoveryFactory} from "ethernaut/levels/RecoveryFactory.sol";

contract RecoveryLevel is SetUpLevelTest {
    Recovery internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 0 ether;
        level = address(new RecoveryFactory());
        super.setUp();
        lv = Recovery(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
