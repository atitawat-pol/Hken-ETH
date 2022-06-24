// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";


contract Implementation is Initializable {
    uint256 public balance;
    mapping(address => bool) public isInvestor; // #1
    address public implementation;
    address public manager;

    // modifier onlyManager() {
    //     require(msg.sender == manager);
    //     _;
    // }

    function initialize(address proxy) external initializer {
        manager = proxy;
    }
    
    // delegated from ProxyVault
    function addInvestor(address _investor) external {
        isInvestor[_investor] = true;
    }
}