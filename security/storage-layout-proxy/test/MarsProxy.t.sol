// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MarsProxy.sol";

contract MarsProxyTest is Test {
    MarsProxy public marsProxy;
    MarsProxyV2 public marsProxyV2;
    MarsProxyV3 public marsProxyV3;
    function setUp() public {
        marsProxy = new MarsProxy();
        marsProxyV2 = new MarsProxyV2();
        marsProxyV3 = new MarsProxyV3();
    }

    function testInitialize() public {
        marsProxy.initialize();
        assertEq("Mars", marsProxy.name());
    }

    function testUpgradeV2() public {
        assertEq("v2!", marsProxyV2.version());
    }

    function testUpgradeV3() public {
        assertEq("v3!", marsProxyV3.version());
    }

    function testTax() public {
        assertEq(5, marsProxyV3.tax());
    }

    function testFee() public {
        assertEq(5, marsProxyV3.fee()); // It's going to fail bc. fee is no longer in V3 anymore.
    }
}