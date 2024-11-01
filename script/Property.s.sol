// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Property} from "../src/Property.sol";

contract PropertyScript is Script {
    Property public property;

    function setUp() public {
        property = new Property("Guadeloupe","971");
    }

    function run() public {
        vm.startBroadcast();
        vm.stopBroadcast();
    }
}
