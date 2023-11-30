// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {GoodSamaritan, GoodSamaritanFactory} from "ethernaut/levels/GoodSamaritanFactory.sol";

contract GoodSamaritanLevel is SetUpLevelTest {
    GoodSamaritan internal goodSamaritan;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new GoodSamaritanFactory());
        super.setUp();
        goodSamaritan = GoodSamaritan(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
