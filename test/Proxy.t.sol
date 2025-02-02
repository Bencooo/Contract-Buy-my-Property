// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Earth} from "../src/Earth.sol";
import {Proxy} from "../src/Proxy.sol";

contract ProxyTest is Test {
    Earth earth;
    Proxy proxy;

    function setUp() public {
        earth = new Earth();
        proxy = new Proxy(address(0));
    }

    function testSetImpl() public {
        proxy.setImpl(address(earth));
        assertEq(proxy.impl(), address(earth));
        vm.startPrank(address(0x12));
        vm.expectRevert(abi.encodeWithSelector(Proxy.PERMISSION_DENIED.selector,address(0x12)));
        proxy.setImpl(address(earth));
        vm.stopPrank();
    }

    function testFallback() public {
        proxy.setImpl(address(earth));
        (bool success,) =
            address(proxy).call(abi.encodeWithSignature("createWorld(string,string)", "Guadeloupe", "971"));
        assertEq(success, true);

        vm.expectRevert(abi.encodeWithSignature("Proxy.DELEGATION_FAILED()"));
        (bool failed,) =
            address(proxy).call(abi.encodeWithSignature("destroyWorld(string,string)", "Guadeloupe", "971"));
        assertEq(failed, false);
    }
}
