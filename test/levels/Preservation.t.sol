// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Preservation, PreservationFactory} from "ethernaut/levels/PreservationFactory.sol";

contract PreservationLevel is SetUpLevelTest {
    Preservation internal preservation;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new PreservationFactory());
        super.setUp();
        preservation = Preservation(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
