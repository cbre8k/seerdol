// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "./Migrate.s.sol";
import {Foo, FooU, FooT} from "../src/Foo.sol";

contract Deployer is BaseMigrate {
    function run() external {
        deployFoo();
        deployFooU();
        deployFooT();
    }

    function deployFoo() public broadcast {
        deployContract("Foo.sol:Foo", abi.encode());
    }

    function deployFooU() public broadcast {
        deployUUPSProxy("Foo.sol:FooU", abi.encodeCall(FooU.initialize, ()));
    }

    function deployFooT() public broadcast {
        deployTransparentProxy(
            "Foo.sol:FooT",
            abi.encodeCall(FooT.initialize, ())
        );
    }
}
