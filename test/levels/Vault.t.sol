// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Vault, VaultFactory} from "ethernaut/levels/VaultFactory.sol";

contract VaultLevel is SetUpLevelTest {
    Vault internal lv;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        level = address(new VaultFactory());
        super.setUp();
        lv = Vault(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
