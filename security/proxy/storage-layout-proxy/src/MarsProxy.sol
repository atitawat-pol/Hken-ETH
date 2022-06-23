// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import "../lib/openzeppelin-contracts-upgradeable/contracts/token/ERC20/ERC20Upgradeable.sol";
import "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

contract MarsProxy is Initializable, ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable {
    function initialize() public initializer {
        __ERC20_init("Mars", "MARS");
        __Ownable_init_unchained();
        __UUPSUpgradeable_init_unchained();

        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}

contract MarsProxyV2 is MarsProxy {
    uint public fee;

    function version() public pure returns (string memory) {
        return "v2!";
    }
}

contract MarsProxyV3 is MarsProxy {
    uint public fee; // Avoid storage layout colision with tax, we have to copy fee from V2
    uint public tax = 5;

    function version() public pure returns (string memory) {
        return "v3!";
    }
}