// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MicroBurnERC20 is ERC20 {
    constructor() ERC20("MicroBurn", "MBURN2") {
        _mint(msg.sender, 1000000 ether);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _burn(msg.sender, amount / 1000);
        return super.transfer(to, amount);
    }
}
