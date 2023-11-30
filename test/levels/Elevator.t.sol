// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Elevator, ElevatorFactory} from "ethernaut/levels/ElevatorFactory.sol";

contract ElevatorLevel is SetUpLevelTest {
    Elevator internal elevator;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new ElevatorFactory());
        super.setUp();
        elevator = Elevator(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
