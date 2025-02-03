// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {World} from "../src/World.sol";

contract WorldTest is Test {
    World public world;

    struct Position {
        uint256 x;
        uint256 y;
    }

    function setUp() public {
        world = new World("Test", "TEST");
    }

    function testConstructor() public view {
        assertEq("Test",world.name());
        assertEq("TEST",world.symbol());
    }

    function testMint() public {
        world.mint(1, 1);
        vm.expectRevert(abi.encodeWithSelector(World.POSITION_ALREADY_USED.selector, 1, 1));
        world.mint(1, 1);
        Position pos = world.getPositionOf(0);
        assertEq(pos.x, 1);
        assertEq(pos.y, 1);
        assertEq(world.getNumberOfProperties(), 1);
        assertEq(world.ownerOf(0),msg.sender);
    }

    function testPositionAvailable() public {
        world.min(1,1);
        assertEq(false,world.isPositionAvailable(1,1));
    }

    function testBalanceOf() public {
        world.mint(1,1);
        assertEq(1,world.balanceOf(msg.sender));
    }

}