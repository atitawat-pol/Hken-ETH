// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HKENToken.sol";

contract HKENTokenTest is Test {
    HKENToken public hkentoken;
    function setUp() public {
       hkentoken = new HKENToken();
    }

    function testHKEN() public {
        assertEq("HKENToken", hkentoken.symbol());
    }

    function testOwner() public {
        assertEq(0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84, hkentoken.owner());
    }

    function testExample() public {
        assertTrue(true);
    }
}
