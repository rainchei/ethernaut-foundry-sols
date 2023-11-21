// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Fallout, FalloutFactory} from "../helpers/FalloutFactory.sol";

contract FalloutLevel is SetUpLevelTest {
    Fallout internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new FalloutFactory());
        super.setUp();
        lv = Fallout(payable(instance));
        vm.deal(player, 0.01 ether);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
