// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Motorbike, MotorbikeFactory} from "../helpers/MotorbikeFactory.sol";

contract MotorbikeLevel is SetUpLevelTest {
    Motorbike internal motorbike;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new MotorbikeFactory());
        super.setUp();
        motorbike = Motorbike(payable(instance));

        /** CODE YOUR SOLUTION HERE */
    }
}
