// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {IAlienCodex, AlienCodexFactory} from "../helpers/AlienCodexFactory.sol";

contract AlienCodexLevel is SetUpLevelTest {
    IAlienCodex internal alienCodex;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new AlienCodexFactory());
        super.setUp();
        alienCodex = IAlienCodex(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
