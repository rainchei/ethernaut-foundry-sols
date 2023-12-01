// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts-08/access/Ownable.sol"; // Path change of openzeppelin contract

contract AlienCodex is Ownable {
    bool public contact;
    bytes32[] public codex;

    modifier contacted() {
        assert(contact);
        _;
    }

    function makeContact() public {
        contact = true;
    }

    function record(bytes32 _content) public contacted {
        codex.push(_content);
    }

    /**
     * @dev Solidity 5 behavior for replicating `codex.length--`;
     *      remove the item from the array and decrease the length by one
     *      do not check for underflow and allow writing to existing storage slots
     */
    function retract() public contacted {
        // codex.length--;
        assembly {
            let ptr := mload(0x40)

            // fetch the length of the array
            let len := sload(codex.slot)

            // values start at hash of slot
            mstore(ptr, codex.slot)
            let startAddress := keccak256(ptr, 0x20)

            // decrement length by one
            sstore(codex.slot, sub(len, 0x01))

            // get the last item in the array (0 indexed)
            let lastAddress := add(startAddress, sub(len, 0x01))
            // set to zero
            sstore(lastAddress, 0x00)
        }
    }

    function revise(uint256 i, bytes32 _content) public contacted {
        codex[i] = _content;
    }
}
