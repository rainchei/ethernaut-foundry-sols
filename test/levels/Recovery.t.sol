// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Recovery, RecoveryFactory} from "ethernaut/levels/RecoveryFactory.sol";

contract RecoveryLevel is SetUpLevelTest {
    Recovery internal recovery;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0.001 ether;
        playerBalance = 0 ether;
        level = address(new RecoveryFactory());
        super.setUp();
        recovery = Recovery(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        /** Contract created by MY_ADDR
         * = rightmost_20_bytes(keccak(RLP(MY_ADDR, NONCE)))
         * = address(keccak256(0xd6, 0x94, MY_ADDR, NONCE))
         *
         * Note:
         * If MY_ADDR is a contract, the nonce for its first deployed contract is 0x01.
         * This is because that the nonce 0x00 is taken when MY_ADDR itself deployed.
         */
        address lostAddress = address(
            uint160(
                uint256(
                    keccak256(
                        abi.encodePacked(
                            bytes1(0xd6),
                            bytes1(0x94),
                            bytes20(address(recovery)),
                            bytes1(0x01)
                        )
                    )
                )
            )
        );
        ISimpleToken(lostAddress).destroy(player);
        vm.stopPrank();
    }
}

interface ISimpleToken {
    function destroy(address _to) external;
}
