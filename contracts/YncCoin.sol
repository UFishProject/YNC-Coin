// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./lib/AdminRole.sol";

contract YNCCoin is ERC20Burnable, AdminRole {
    constructor(string memory name_, string memory symbol_)
        ERC20(name_, symbol_)
    {
        _mint(msg.sender, 1000 * 1000 * 1000 * 10**18);
    }

    function mint(address recipient_, uint256 amount_)
        public
        onlyAdmin
        returns (bool)
    {
        uint256 balanceBefore = balanceOf(recipient_);
        _mint(recipient_, amount_);
        uint256 balanceAfter = balanceOf(recipient_);

        return balanceAfter > balanceBefore;
    }

    function burn(uint256 amount) public override onlyAdmin {
        super.burn(amount);
    }

    function burnFrom(address account, uint256 amount)
        public
        override
        onlyAdmin
    {
        super.burnFrom(account, amount);
    }
}
