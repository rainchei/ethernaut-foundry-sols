// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Ethernaut, Level} from "ethernaut/Ethernaut.sol";
import {Statistics} from "ethernaut/metrics/Statistics.sol";
import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

abstract contract TestUtils is TestBase {
    function getEthernautWithStatsProxy() internal returns (Ethernaut e) {
        e = new Ethernaut();
        Statistics s = new Statistics();
        address proxyStats = address(
            new TransparentUpgradeableProxy(
                address(s),
                address(this),
                abi.encodeCall(s.initialize, (address(e)))
            )
        );
        e.setStatistics(proxyStats);
    }

    function createLevelInstance(
        Ethernaut _ethernaut,
        address _level,
        address _player
    ) public payable returns (address instance) {
        vm.startPrank(_player);
        vm.recordLogs();
        _ethernaut.createLevelInstance{value: msg.value}(Level(_level));
        Vm.Log[] memory entries = vm.getRecordedLogs();
        assert(entries.length != 0);
        // Find event LevelInstanceCreatedLog emitted from ethernaut
        for (uint256 i; i < entries.length; ++i) {
            // Recall that topics[0] is the event signature
            if (
                entries[i].topics[0] ==
                keccak256("LevelInstanceCreatedLog(address,address,address)")
            ) {
                // 0x000000000000000000000000104fbc016f4bb334d775a19e8a6510109ac63e00 shiftLeft 24 hex digits == 96 bits
                instance = address(bytes20(entries[i].topics[2] << 96));
            }
        }
        assert(instance != address(0));
        vm.stopPrank();
    }

    function submitLevelInstance(
        Ethernaut _ethernaut,
        address _levelAddress,
        address _instance,
        address _player
    ) public returns (bool success) {
        vm.startPrank(_player);
        vm.recordLogs();
        _ethernaut.submitLevelInstance(payable(_instance));
        Vm.Log[] memory entries = vm.getRecordedLogs();
        if (entries.length == 0) return false;
        // Find event LevelCompletedLog emitted from ethernaut
        address player;
        address levelAddress;
        for (uint256 i; i < entries.length; ++i) {
            // Recall that topics[0] is the event signature
            if (
                entries[i].topics[0] ==
                keccak256("LevelCompletedLog(address,address,address)")
            ) {
                player = address(bytes20(entries[i].topics[1] << 96));
                levelAddress = address(bytes20(entries[i].topics[3] << 96));
            }
        }
        success = (_player == player && _levelAddress == levelAddress);
        vm.stopPrank();
    }
}
