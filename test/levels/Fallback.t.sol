// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Fallback, FallbackFactory} from "ethernaut/levels/FallbackFactory.sol";

contract FallbackLevel is SetUpLevelTest {
    Fallback internal fback;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 1000 ether;
        level = address(new FallbackFactory());
        super.setUp();
        fback = Fallback(payable(instance));
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
