// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Ethernaut, Level} from "ethernaut/Ethernaut.sol";
import {TestUtils} from "./utils/TestUtils.sol";

abstract contract SetUpLevelTest is TestUtils, Test {
    Ethernaut internal ethernaut;
    address internal level;

    uint256 internal playerPrivateKey;
    address internal player;
    uint256 internal playerBalance;

    address internal instance;
    uint256 internal instanceBalance;

    function setUp() public virtual {
        // ethernaut
        ethernaut = getEthernautWithStatsProxy();
        // player
        string
            memory mnemonic = "test test test test test test test test test test test junk";
        playerPrivateKey = vm.deriveKey(mnemonic, 0);
        player = vm.addr(playerPrivateKey);
        vm.deal(player, playerBalance + instanceBalance);
        // level
        ethernaut.registerLevel(Level(level));
        instance = this.createLevelInstance{value: instanceBalance}(
            ethernaut,
            level,
            player
        );
    }

    function exploitLevel() internal virtual {}

    function test_SubmitLevel() public {
        exploitLevel();
        assertTrue(
            submitLevelInstance(ethernaut, level, instance, player),
            "Level is not cleared."
        );
    }
}
