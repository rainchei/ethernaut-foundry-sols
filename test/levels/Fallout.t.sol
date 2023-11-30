// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Fallout, FalloutFactory} from "../helpers/FalloutFactory.sol";

contract FalloutLevel is SetUpLevelTest {
    Fallout internal fallout;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0.01 ether;
        instanceBalance = 0 ether;
        level = address(new FalloutFactory());
        super.setUp();
        fallout = Fallout(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
