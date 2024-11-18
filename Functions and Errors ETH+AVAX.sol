// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

/// @title FuncErrors Token Contract
/// @dev An ERC20 token implementation with minting, burning, and custom transfer restrictions.
contract FuncErrors is ERC20, Ownable {
    /// @notice Constructor to initialize the token with a name and symbol
    /// @dev Inherits ERC20 and Ownable to manage token functionality and ownership.
    constructor() ERC20("Catizen", "CATI") {}

    /// @notice Allows the owner to mint new tokens.
    /// @dev This function is restricted to the contract owner using `onlyOwner`.
    /// @param account The address to receive the minted tokens.
    /// @param amount The number of tokens to mint (must be greater than 0).
    function mint(address account, uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than 0"); // Ensure the mint amount is valid.
        _mint(account, amount); // Call the internal `_mint` function from ERC20.
    }

    /// @notice Allows a user to burn (destroy) their own tokens.
    /// @dev Reduces the total supply and the user's balance.
    /// @param amount The number of tokens to burn (must be greater than 0 and <= user's balance).
    function burn(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0"); // Validate the burn amount.
        require(balanceOf(msg.sender) >= amount, "Insufficient balance"); // Ensure the user has enough tokens to burn.
        assert(totalSupply() == totalSupply() - amount); // Validate total supply change after burn.
        _burn(msg.sender, amount); // Call the internal `_burn` function from ERC20.
    }

    /// @notice Transfers tokens to another address with additional restrictions.
    /// @dev Overrides the default ERC20 `transfer` function to add custom validation logic.
    /// @param to The address to receive the tokens.
    /// @param amount The number of tokens to transfer (must be >= 20).
    /// @return A boolean indicating whether the transfer was successful.
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        require(amount > 0, "Amount must be greater than 0"); // Ensure the transfer amount is valid.
        if (amount < 20) {
            revert("Transfer failed: Amount must be at least 20"); // Enforce a minimum transfer amount.
        }
        require(balanceOf(msg.sender) >= amount, "Insufficient balance"); // Ensure the sender has enough tokens.
        _transfer(msg.sender, to, amount); // Call the internal `_transfer` function from ERC20.
        return true; // Return true to indicate a successful transfer.
    }
}
