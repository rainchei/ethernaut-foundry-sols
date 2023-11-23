// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Reentrance, ReentranceFactory} from "../helpers/ReentranceFactory.sol";

contract ReentranceLevel is SetUpLevelTest {
    Reentrance internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0.01 ether;
        instanceBalance = 0.001 ether;
        level = address(new ReentranceFactory());
        super.setUp();
        lv = Reentrance(payable(instance));
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}