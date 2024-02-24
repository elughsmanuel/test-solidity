// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleTokenWallet {
    address public owner;
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        owner = msg.sender;
    }

    function transfer(address token, address to, uint256 value) external returns (bool) {
        require(msg.sender == owner, "Only owner can transfer tokens");
        require(to != address(0), "Invalid recipient address");
        
        IERC20(token).transfer(to, value);
        emit Transfer(address(this), to, value);
        return true;
    }

    function balanceOf(address token) external view returns (uint256) {
        return IERC20(token).balanceOf(address(this));
    }
}
