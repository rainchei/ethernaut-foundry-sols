// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {GatekeeperTwo, GatekeeperTwoFactory} from "ethernaut/levels/GatekeeperTwoFactory.sol";

contract GatekeeperTwoLevel is SetUpLevelTest {
    GatekeeperTwo internal gatekeeperTwo;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new GatekeeperTwoFactory());
        super.setUp();
        gatekeeperTwo = GatekeeperTwo(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
