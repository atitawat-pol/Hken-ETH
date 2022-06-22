// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MarsProxy.sol";

contract MarsProxyTest is Test {
    MarsProxy public marsProxy;
    function setUp() public {
        marsProxy = new MarsProxy();
    }

    function testInit() public {
        string memory name = marsProxy.name();
        assertEq(name, "Mars");
        console2.log("Hello");
    }

    function testExample() public {
        assertTrue(true);
    }
}
