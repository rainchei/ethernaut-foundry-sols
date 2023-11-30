// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Telephone, TelephoneFactory} from "ethernaut/levels/TelephoneFactory.sol";

contract TelephoneLevel is SetUpLevelTest {
    Telephone internal telephone;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0 ether;
        instanceBalance = 0 ether;
        level = address(new TelephoneFactory());
        super.setUp();
        telephone = Telephone(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
