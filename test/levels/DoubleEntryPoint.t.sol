// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {DoubleEntryPoint, DoubleEntryPointFactory} from "ethernaut/levels/DoubleEntryPointFactory.sol";

contract DoubleEntryPointLevel is SetUpLevelTest {
    DoubleEntryPoint internal doubleEntryPoint;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new DoubleEntryPointFactory());
        super.setUp();
        doubleEntryPoint = DoubleEntryPoint(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
