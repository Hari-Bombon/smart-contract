
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract NFT is ERC1155 {
    uint256 public constant gurll = 1;
  

    constructor() ERC1155("https://imgs.search.brave.com/FmMXmmTQV3SZKFLA2HLO3S2vaNzyJ1QDp4UUnbxlnyM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzczLzUyLzA3/LzM2MF9GXzI3MzUy/MDcxMV9Zb3Bhdm11/ZkZ0QkFsWmx3YTNq/NllwZjBCVlVUU0Q3/ci5qcGc") {
        _mint(msg.sender, gurll, 1, "");
     
    }
     
}