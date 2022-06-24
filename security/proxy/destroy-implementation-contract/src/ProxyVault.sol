// WARNNING: Do not use this code in production
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
import "@openzeppelin/contracts/access/Ownable.sol";

contract ProxyVault is Ownable {
    uint256 public balance;
    mapping(address => bool) public isInvestor; // #1
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function addInvestor(address _investor) external onlyOwner {
        // delegate call to implementation
        (bool success, bytes memory data) = implementation.delegatecall(
            // abi.encodeWithSelector(implementation.addInvestor.selector, _investor)
            abi.encodeWithSignature("addInvestor(address)", _investor)
        );
        require(success, "addInvestor not successful");
        // if (!success) {
        //     if (data.length == 0) revert("Fail jaa");
        //     assembly {
        //         revert(add(32, data), mload(data))
        //     }
        // }
        require(isInvestor[_investor]);
    }

    function upgradeTo(address _implementation) external onlyOwner {
        implementation = _implementation;
    }
}