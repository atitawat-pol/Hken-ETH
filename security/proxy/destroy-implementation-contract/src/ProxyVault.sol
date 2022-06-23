// WARNNING: Do not use this code in production
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ProxyVault {
    uint256 public balance;
    mapping(address => bool) public isInvestor;
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function addInvestor(address _investor) external {
        // delegate call to implementation
        implementation.delegatecall(_investor);
    }
}