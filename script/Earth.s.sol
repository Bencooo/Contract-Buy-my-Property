// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Earth} from "../src/Earth.sol";

contract EarthScript is Script {
    Earth public earth;

    function setUp() public {
        earth = new Earth();
    }

    function run() public {
        vm.startBroadcast();
        vm.stopBroadcast();
    }
}
