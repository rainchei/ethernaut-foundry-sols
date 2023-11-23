// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {GatekeeperOne, GatekeeperOneFactory} from "ethernaut/levels/GatekeeperOneFactory.sol";

contract GatekeeperOneLevel is SetUpLevelTest {
    GatekeeperOne internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new GatekeeperOneFactory());
        super.setUp();
        lv = GatekeeperOne(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
