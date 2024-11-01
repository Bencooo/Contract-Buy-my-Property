// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Property} from "../src/Property.sol";

contract PropertyTest is Test {
    Property public property;

    function setUp() public {
        property = new Property("Guaddeloupe","971");
    }

    function mintTest() public {
        property.mint(15,8);
        assertEq(property.propertyID(),1);
    }

    function getPositionByID() public {
        assertEq(property.getPositionByID(0).x,15);
        assertEq(property.getPositionByID(0).y,8);
    }

}