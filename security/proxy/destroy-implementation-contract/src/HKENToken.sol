// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HKENToken is ERC20, Ownable {
    constructor() ERC20("HKEN", "HKENToken") {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }
}