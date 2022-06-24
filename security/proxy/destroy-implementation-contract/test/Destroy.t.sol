// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HKENToken.sol";
import "../src/ProxyVault.sol";
import "../src/Implementation.sol";

contract HKENTokenTest is Test {
    HKENToken public hkentoken;
    Implementation public implementation;
    ProxyVault public proxyVault;
    function setUp() public {
        hkentoken = new HKENToken();
        implementation = new Implementation();
        proxyVault = new ProxyVault(address(implementation));
        // call initialize with proxy
        implementation.initialize(address(proxyVault));
    }

    // function testHKEN() public {
    //     assertEq("HKENToken", hkentoken.symbol());
    // }

    // function testHKENOwner() public {
    //     assertEq(0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84, hkentoken.owner());
    // }

    function testProxyVaultOwner() public {
        assertEq(0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84, proxyVault.owner());
    }

    // function testImplementationDeployed() public {
    //     assertEq(address(0), implementation.manager());
    // }

    function testImplementationInitializedWithProxy() public {
        assertEq(address(proxyVault), implementation.manager());
    }

    function testFailAddInvestorNotOwner() public {
        vm.prank(address(0));
        proxyVault.addInvestor(address(0xEeB46C02306577A3890c204Fc64D43b6cd353C1c));
    }

    function testProxyVaultStates() public {
        // implementation contract has been set
        assertEq(address(implementation), proxyVault.implementation());
        // balance is zero
        assertEq(0, proxyVault.balance());
    }

    function testAddInvestor() public {
        address _investor = 0xEeB46C02306577A3890c204Fc64D43b6cd353C1c;
        assertEq(false, proxyVault.isInvestor(_investor));
        proxyVault.addInvestor(_investor);
        assertEq(true, proxyVault.isInvestor(_investor));
    }
}
