// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {LevelBaseTest} from "../LevelBaseTest.sol";
import {InstanceFactory} from "ethernaut/levels/InstanceFactory.sol";

contract InstanceTest is LevelBaseTest {
    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new InstanceFactory());
        super.setUp();
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
