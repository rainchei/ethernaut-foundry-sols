// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Shop, ShopFactory} from "ethernaut/levels/ShopFactory.sol";

contract ShopLevel is SetUpLevelTest {
    Shop internal shop;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new ShopFactory());
        super.setUp();
        shop = Shop(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
