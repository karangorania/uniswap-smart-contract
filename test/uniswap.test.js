const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Uniswap', () => {
  let NappyToken;
  let nappyToken;
  let Uniswap;
  let uniswap;
  let addr1;
  let addr2;
  let owner;

  beforeEach(async () => {
    [owner, addr1, addr2] = await ethers.getSigners();
    NappyToken = await ethers.getContractFactory('NappyToken');
    nappyToken = await NappyToken.deploy();
    await nappyToken.deployed();
    nappyTokenAddress = nappyToken.address;

    // Uniswap
    Uniswap = await ethers.getContractFactory('Uniswap');
    uniswap = await Uniswap.deploy(nappyTokenAddress);
    await uniswap.deployed();
    uniswapAddress = uniswap.address;
  });

  it('Should mint the token ', async () => {
    await nappyToken.mint(addr1.address, 10000000000);
    expect(await nappyToken.balanceOf(addr1.address)).to.equal(
      ethers.utils.parseUnits('10000000000', 18)
    );
  });

  it('Should approve the uniswap contract', async () => {
    await nappyToken.approve(
      uniswapAddress,
      ethers.utils.parseUnits('10000000000', 18)
    );
  });

  it('Should transfer the token to uniswap contract', async () => {
    await nappyToken.mint(addr1.address, 10000000000);
    await nappyToken.transfer(
      uniswapAddress,
      ethers.utils.parseUnits('10000000000', 18)
    );
  });
});
