
# Function and Errors ETH-AVAX Token Contract

## Overview

`FuncErrors` is an ERC20 token contract implementing minting, burning, and custom transfer restrictions. It is based on the OpenZeppelin ERC20 and Ownable contracts and adds functionality to allow the contract owner to mint tokens, users to burn their own tokens, and custom validation logic for token transfers.

## Features

- **ERC20 Token**: Standard token functionality (transfer, balanceOf, etc.).
- **Minting**: Only the contract owner can mint new tokens.
- **Burning**: Users can burn (destroy) their own tokens, reducing the total supply.
- **Transfer Restrictions**: Transfer amounts must be at least 20 tokens, with a custom error message if the transfer is invalid.

## Contract Details

### Minting

The contract owner can mint new tokens to a specified address. Only the owner can call the `mint` function.

```solidity
function mint(address account, uint256 amount) external onlyOwner;
```

- `account`: The address to receive the minted tokens.
- `amount`: The number of tokens to mint (must be greater than 0).

### Burning

Users can burn their own tokens, which reduces both their token balance and the total supply.

```solidity
function burn(uint256 amount) external;
```

- `amount`: The number of tokens to burn (must be greater than 0 and less than or equal to the user's balance).

### Transfer Restrictions

The contract overrides the default `transfer` function to ensure that the transfer amount is at least 20 tokens.

```solidity
function transfer(address to, uint256 amount) public virtual override returns (bool);
```

- `to`: The recipient's address.
- `amount`: The number of tokens to transfer (must be at least 20).

If the transfer amount is less than 20, the function will revert with a custom error message: `Transfer failed: Amount must be at least 20`.

## Installation

To install the dependencies for this contract, you will need to use [Hardhat](https://hardhat.org/) or [Truffle](https://www.trufflesuite.com/truffle). Here’s how you can install the dependencies with npm:

1. Initialize a new project:

    ```bash
    npm init -y
    ```

2. Install Hardhat (or Truffle):

    ```bash
    npm install --save-dev hardhat
    ```

3. Install OpenZeppelin Contracts:

    ```bash
    npm install @openzeppelin/contracts@4.9.0
    ```

## Usage

1. Deploy the contract to the Ethereum network using your preferred deployment framework (e.g., Hardhat or Truffle).
2. Interact with the contract using any Ethereum wallet or frontend interface, such as [Ethers.js](https://docs.ethers.io/) or [Web3.js](https://web3js.readthedocs.io/).

## License

This project is licensed under the MIT License - see the (CurtRusselM.Celeste) file for details.

## Contact

For any questions or feedback, please open an issue or contact us via [CurtRusselCeleste.com](https://www.facebook.com/profile.php?id=100069766380432&mibextid=ZbWKwL).

```
