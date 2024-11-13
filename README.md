# FuncErrors Token Contract

`FuncErrors` is a simple ERC-20 token contract built with Solidity. It utilizes OpenZeppelin's ERC20 and Ownable libraries for token management and access control. The contract demonstrates the use of `require()`, `assert()`, and `revert()` statements for error handling in smart contracts.

## Overview

This contract defines an ERC-20 token called "FuncErrors" (`FE`). Only the owner of the contract can mint new tokens, and users can burn their own tokens or transfer tokens to others with specific conditions.

## Features

- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Any user can burn their tokens, reducing the total supply.
- **Transfers**: Tokens can be transferred with a minimum transfer amount requirement.

## Error Handling

The contract includes three main error handling mechanisms:
- **`require`**: Used to validate inputs (e.g., non-zero amounts) and ensure users have sufficient balance.
- **`assert`**: Used to enforce invariants, ensuring conditions that should never fail within the contract.
- **`revert`**: Used to halt execution with a custom error message for specific conditions (e.g., minimum transfer amount).

## Contract Functions

### `mint(address account, uint256 amount)`

Mints new tokens to the specified account. Only the owner can call this function.

- **Parameters**:
  - `account`: Address to receive the minted tokens.
  - `amount`: Number of tokens to mint (must be greater than 0).

- **Error Handling**:
  - Uses `require()` to check that `amount` is greater than 0.

### `burn(uint256 amount)`

Allows the caller to burn a specified amount of their tokens, reducing the total supply.

- **Parameters**:
  - `amount`: Number of tokens to burn (must be greater than 0 and less than or equal to the caller's balance).

- **Error Handling**:
  - Uses `require()` to check that `amount` is valid and the caller has a sufficient balance.
  - Uses `assert()` to validate that the total supply has been reduced by the burned amount.

### `transfer(address to, uint256 amount)`

Overrides the standard ERC-20 transfer function, requiring a minimum transfer amount of 20 tokens.

- **Parameters**:
  - `to`: Address to receive the tokens.
  - `amount`: Number of tokens to transfer (must be at least 20).

- **Error Handling**:
  - Uses `require()` to check that `amount` is greater than 0 and the sender has a sufficient balance.
  - Uses `revert()` to halt the transaction if the `amount` is less than 20 tokens, with a custom error message.

## Usage

1. **Minting Tokens**: Only the contract owner can mint tokens to a specified address.
2. **Burning Tokens**: Any user can burn their tokens to decrease the total supply.
3. **Transferring Tokens**: Users can transfer tokens to others but must meet the minimum transfer requirement.

## Requirements

- **Solidity Version**: ^0.8.0
- **Dependencies**: 
  - OpenZeppelin Contracts v4.9.0 for `ERC20` and `Ownable` modules

## License

This project is licensed under the MIT License.
