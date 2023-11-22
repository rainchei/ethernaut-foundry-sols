// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Force, ForceFactory} from "ethernaut/levels/ForceFactory.sol";

contract ForceLevel is SetUpLevelTest {
    Force internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new ForceFactory());
        super.setUp();
        lv = Force(instance);
        vm.deal(player, 1 ether);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
