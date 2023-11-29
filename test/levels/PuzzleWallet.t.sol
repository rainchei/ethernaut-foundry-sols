// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {PuzzleWallet, PuzzleWalletFactory} from "ethernaut/levels/PuzzleWalletFactory.sol";

contract PuzzleWalletLevel is SetUpLevelTest {
    PuzzleWallet internal puzzleWallet;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 0.001 ether;
        level = address(new PuzzleWalletFactory());
        super.setUp();
        puzzleWallet = PuzzleWallet(instance);
    }

    function exploitLevel() internal override {
        /** CODE YOUR SOLUTION HERE */
    }
}
