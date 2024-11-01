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
        // 0x0Dc9776AC54eE9c30E41D3918620F51105606515
        console.log(msg.sender);

        
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

        // Print 0x0Dc9776AC54eE9c30E41D3918620F51105606515
        console.log(property.ownerOf(2));
        
        // Transfer property2 to 0x0Dc9776AC54eE9c30E41D3918620F51105606515
        property.transfer(address(0x293032BA5dcC00f817dF26d59529AeeD5dfFf3aE),2);

        // Print 0x0Dc9776AC54eE9c30E41D3918620F51105606515
        console.log(property.ownerOf(2));
        // Print 1
        console.log(property.balanceOf(msg.sender));
        // Print 1
        console.log(property.balanceOf(address(0x293032BA5dcC00f817dF26d59529AeeD5dfFf3aE)));

        vm.stopBroadcast();
    }
}
