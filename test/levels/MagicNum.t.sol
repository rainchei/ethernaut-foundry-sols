// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {MagicNum, MagicNumFactory} from "ethernaut/levels/MagicNumFactory.sol";

contract MagicNumLevel is SetUpLevelTest {
    MagicNum internal magicNum;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new MagicNumFactory());
        super.setUp();
        magicNum = MagicNum(instance);

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        /**
         * EVM Bytecode for Contract Creation = { INIT_CODE } + { RUNTIME_CODE }
         *
         * INIT_CODE = CODECOPY(0x00, 0x0c, 0x0a) + RETURN(0x00, 0x0a)
         *   600a -- push 10 (runtime code size)
         *   600c -- push 12 (runtime code start byte)
         *   6000 -- push 0 (memory offset to copy to)
         *   39   -- codecopy
         *   600a -- push 10 (return data size)
         *   6000 -- push 0 (memory offset to start returning from)
         *   f3   -- return
         * RUNTIME_CODE = MSTORE(0x80, 0x2a) + RETURN(0x80, 0x20)
         *   602a -- push 2a (value to return (42 in decimal))
         *   6080 -- push 80 (memory offset to store)
         *   52   -- mstore
         *   6020 -- push 20 (number of bytes to return)
         *   6080 -- push 80 (memory offset to return)
         *   f3   -- return
         *
         * NOTE:
         *   MSTORE(p, v)
         *     p: memory offset to store
         *     v: the value to store
         *   RETURN(p, s)
         *     p: memory offset to start returning from
         *     s: size of the returning data
         *   CODECOPY(s, f, t)
         *     s: runtime code size
         *     f: runtime code start byte
         *     t: memory offset to copy to
         */
        bytes
            memory code = hex"600a600c600039600a6000f3602a60805260206080f3";
        address addr;
        assembly {
            // create(value, offset, size)
            //   value: value in wei to send to the new account
            //   offset: byte offset in the memory in bytes, the initialisation code for the new account
            //   size: byte size to copy (size of the initialisation code)
            //
            // NOTE:
            //   EVM encodes the length of `bytes` data as the last byte in the array
            addr := create(0, add(code, 0x20), mload(code))
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }
        magicNum.setSolver(addr);
        vm.stopPrank();
    }
}
