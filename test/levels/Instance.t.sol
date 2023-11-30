// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Instance, InstanceFactory} from "ethernaut/levels/InstanceFactory.sol";

contract InstanceLevel is SetUpLevelTest {
    Instance internal inst;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0 ether;
        instanceBalance = 0 ether;
        level = address(new InstanceFactory());
        super.setUp();
        inst = Instance(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        string memory password = inst.password();
        inst.authenticate(password);
        vm.stopPrank();
    }
}
