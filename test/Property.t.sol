// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Property} from "../src/Property.sol";

contract PropertyTest is Test {

    Property property;
    
    function setUp() public {
        property = new Property("Guadeloupe","971");
    }
     
    function testMintTest() public {
        property.mint(15,8);
        assertEq(property.propertyID(), 1);
    }

    function testGetPositionByIDTest() public {
        property.mint(15,8);
        assertEq(property.getPositionByID(1).x,15);
        assertEq(property.getPositionByID(1).y,8);
    }


}