// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Earth} from "../src/Earth.sol";

contract EarthTest is Test {
    Earth earth;

    function setUp() public {
        earth = new Earth();
        earth.createWorld("Guadeloupe", "971");
    }

    function testOwner() public {
        assertEq(address(this), earth.owner());
    }

    function testCreateWorld() public {
        assertEq(earth.worldNumber(), 1);

        // // Show more information on this link : https://book.getfoundry.sh/cheatcodes/expect-emit
        vm.expectEmit(true, true, false, true);
        emit Earth.WORLD_CREATED("Martinique", "972");
        earth.createWorld("Martinique", "972");

        // Show more information on this link : https://book.getfoundry.sh/cheatcodes/expect-revert
        vm.expectRevert(abi.encodeWithSelector(Earth.NAME_OF_WORLD_ALREADY_USED.selector, "Guadeloupe"));
        earth.createWorld("Guadeloupe", "GWADA");
        vm.expectRevert(abi.encodeWithSelector(Earth.SYMBOL_OF_WORLD_ALREADY_USED.selector, "971"));
        earth.createWorld("Gwada", "971");
    }
}
