// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Property} from "../src/Property.sol";

contract PropertyScript is Script {
    Property public property;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        // 0x0Dc9776AC54eE9c30E41D3918620F51105606515
        console.log(msg.sender);
        
        property = new Property("Guadeloupe","971");
        // First mint
        property.mint(15,8);
        // Print 1
        console.log(property.propertyID());
        //Print 15
        console.log(property.getPositionByID(1).x);
        //Print 8
        console.log(property.getPositionByID(1).y);

        // First mint
        property.mint(4,9);
        // Print 2
        console.log(property.propertyID());
        //Print 4
        console.log(property.getPositionByID(2).x);
        //Print 9
        console.log(property.getPositionByID(2).y);
        // Print 2
        console.log(property.balanceOf(msg.sender));

        vm.stopBroadcast();
    }
}
