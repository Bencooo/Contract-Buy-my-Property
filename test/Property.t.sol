// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Property} from "../src/Property.sol";

contract CounterTest is Test {
    Property public property;

    function setUp() public {
        property = new Property();
    }

}
