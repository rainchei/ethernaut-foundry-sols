// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {MagicNum, MagicNumFactory} from "ethernaut/levels/MagicNumFactory.sol";

contract MagicNumLevel is SetUpLevelTest {
    MagicNum internal magicNum;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new MagicNumFactory());
        super.setUp();
        magicNum = MagicNum(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
