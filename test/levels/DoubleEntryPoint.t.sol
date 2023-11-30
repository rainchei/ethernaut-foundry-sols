// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {DoubleEntryPoint, DoubleEntryPointFactory, IDetectionBot, IForta} from "ethernaut/levels/DoubleEntryPointFactory.sol";

contract DoubleEntryPointLevel is SetUpLevelTest {
    DoubleEntryPoint internal doubleEntryPoint;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new DoubleEntryPointFactory());
        super.setUp();
        doubleEntryPoint = DoubleEntryPoint(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        address bot = address(new DetectionBot(doubleEntryPoint.cryptoVault()));
        doubleEntryPoint.forta().setDetectionBot(bot);
        vm.stopPrank();
    }
}

contract DetectionBot is IDetectionBot {
    address private vault;

    constructor(address _vault) {
        vault = _vault;
    }

    function handleTransaction(address user, bytes calldata msgData)
        external
        override
    {
        (, , address origSender) = abi.decode(
            // slice the first 4 bytes of msg.data, which are the bytes of the function signature
            msgData[4:],
            (address, uint256, address)
        );
        if (origSender == vault) {
            // bot is triggerred by forta i.e., msg.sender == forta
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
