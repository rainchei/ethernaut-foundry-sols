// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {GatekeeperTwo, GatekeeperTwoFactory} from "ethernaut/levels/GatekeeperTwoFactory.sol";

contract GatekeeperTwoLevel is SetUpLevelTest {
    GatekeeperTwo internal gatekeeperTwo;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new GatekeeperTwoFactory());
        super.setUp();
        gatekeeperTwo = GatekeeperTwo(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player, player);
        new GateAttackTwo(address(gatekeeperTwo));
        vm.stopPrank();
    }
}

contract GateAttackTwo {
    constructor(address _target) {
        uint64 key = uint64(
            bytes8(keccak256(abi.encodePacked(address(this))))
        ) ^ type(uint64).max;
        GatekeeperTwo(_target).enter(bytes8(key));
    }
}
