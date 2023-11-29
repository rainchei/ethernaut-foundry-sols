// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "ethernaut/levels/base/Level.sol";

interface IAlienCodex {
    function owner() external returns (address);
}

contract AlienCodexFactory is Level, Test {
    function createInstance(address _player)
        public
        payable
        override
        returns (address)
    {
        _player;
        bytes memory code = abi.encodePacked(vm.getCode("AlienCodex"));
        address _instance;
        assembly {
            _instance := create(0, add(code, 0x20), mload(code))
        }
        return _instance;
    }

    function validateInstance(address payable _instance, address _player)
        public
        override
        returns (bool)
    {
        // _player;
        IAlienCodex instance = IAlienCodex(_instance);
        return instance.owner() == _player;
    }
}
