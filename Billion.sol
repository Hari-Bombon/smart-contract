//SPDX-License-Identifier: MIT

pragma solidity 0.8.21;
import "@openzepplin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract Billion is ERC20PresetMinterPauser {
    constructor()ERC20PresetMinterPauser("SharKolin", "SHARK")  {
        _mint(msg.sender, 1_000_000_ 010 * 10**18);
    }
}