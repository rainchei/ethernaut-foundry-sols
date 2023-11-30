// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Token, TokenFactory} from "../helpers/TokenFactory.sol";

contract TokenLevel is SetUpLevelTest {
    Token internal token;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0 ether;
        instanceBalance = 0 ether;
        level = address(new TokenFactory());
        super.setUp();
        token = Token(instance);

        /** CODE YOUR SOLUTION HERE */
    }
}
