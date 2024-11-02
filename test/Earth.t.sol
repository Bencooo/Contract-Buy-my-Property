// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Earth} from "../src/Earth.sol";

contract EarthTest is Test {

    Earth earth;
    
    function setUp() public {
        earth = new Earth();
        earth.createWorld("Guadeloupe","971");
    }
     
    function createWorldTest() public {
        
        assertEq(earth.owner(),address(0x0Dc9776AC54eE9c30E41D3918620F51105606515));
        assertEq(earth.worldNumber(),1);

        // Show this link for more information : https://book.getfoundry.sh/cheatcodes/expect-revert
        vm.expectRevert(abi.encodeWithSelector(Earth.NAME_OF_WORLD_ALREADY_USED.selector,"Guadeloupe"));
        earth.createWorld("Guadeloupe","GWADA");
        vm.expectRevert(abi.encodeWithSelector(Earth.SYMBOL_OF_WORLD_ALREADY_USED.selector,"971"));
        earth.createWorld("Gwada","971");
    }


}