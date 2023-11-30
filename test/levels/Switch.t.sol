// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Switch, SwitchFactory} from "ethernaut/levels/SwitchFactory.sol";

contract SwitchLevel is SetUpLevelTest {
    Switch internal s;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new SwitchFactory());
        super.setUp();
        s = Switch(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
