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
    }
}
