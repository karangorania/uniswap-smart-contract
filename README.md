# Uniswap-Smart-Contract

Uniswap Smart Contract user can add liquidity and swap with ETH. We have use Router for swap & add liquidity.

## Uniswap Library

- [V2-Core](https://www.npmjs.com/package/@uniswap/v2-core)
- [V2-Periphery](https://www.npmjs.com/package/@uniswap/v2-periphery)

## Important Step

```bash
create .env file in root directory.
```

```bash
    API_URL = "https://eth-ropsten.alchemyapi.io/v2/your-api-key"
    PRIVATE_KEY = "YOUR-METAMASK-PRIVATE_KEY"
    ETHERSCAN_API_KEY = "YOUR-ETHERSCAN_API_KEY"

```

-Get Your API Key

- [Alchemy](https://alchemy.com/?r=36af7883c4699196)

-Get Your Rinkeby Faucet

- [Rinkeby Faucet](https://faucets.chain.link/rinkeby)

## NPM Packages

- [Openzeppelin](https://www.npmjs.com/package/@openzeppelin/contracts)
- [Hardhat-Ethers](https://www.npmjs.com/package/hardhat-ethers)
- [Chai](https://www.npmjs.com/package/chai)
- [Ethers](https://www.npmjs.com/package/ethers)
- [Ethereum-Waffle](https://www.npmjs.com/package/ethereum-waffle)
- [Dotenv](https://www.npmjs.com/package/dotenv)
- [Hardhat-Etherscan](https://www.npmjs.com/package/@nomiclabs/hardhat-etherscan)

## Tech Stack

- [Node](https://nodejs.org/en/)
- [Hardhat](https://hardhat.org/)
- [Solidity](https://docs.soliditylang.org/)
- [Openzeppelin](https://openzeppelin.com/)

## Run Locally

Clone the project

```bash
  git clone https://github.com/karangorania/uniswap-smart-contract
```

Go to the project directory

```bash
  cd uniswap-smart-contract
```

Install dependencies

```bash
  npm install
```

Compile

```bash
  npx hardhat compile
```

Test

```bash
  npx hardhat test
```

Deploy

```bash
  node scripts/deploy.js
```

Deploy on Rinkeby

```bash
  npx hardhat run scripts/deploy.js --network rinkeby
```

Verify Contract

```bash
npx hardhat verify --network rinkeby <YOUR_CONTRACT_ADDRESS>
```

Help

```bash
  npx hardhat help
```

## Check on Rinkeby Explorer

- [NappyToken](https://ropsten.etherscan.io/address/0xd50AAC05b95bcFFB658265dA522bdbA94D1Fd1E3)
- [Uniswap](https://ropsten.etherscan.io/address/0xe733d6D6FE687665257cfF03E31CB54BD67e2367)
