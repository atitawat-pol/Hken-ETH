// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;


contract Implementation {

    function initialize() external initializer {

    }
    
    // delegated from ProxyVault
    function addInvestor(address _investor) external onlyOwner {
        isInvestor[_investor] = true;
    }
}