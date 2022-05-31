// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

contract UniswapV2 {

    address public tokenAddress;
    IERC20 NappyToken;
    address LPTokens;
    IUniswapV2Router02 Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    address private constant ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant WETH = 0xc778417E063141139Fce010982780140Aa0cD5Ab;

    mapping(address => uint256)public ETHStored;

    event AddLiquidity(address indexed, uint256 amount);

    constructor(address _token){
        require(_token != address(0), "bilkul galat hai nai chalega");
        tokenAddress = _token;
        NappyToken = IERC20(_token);
        
    }


    function addLiquidity(uint256 _tokenAmount) external payable{
        // require(msg.sender == NappyToken, 'UniswapV2: FORBIDDEN');
        require(msg.value >= 1 ether, 'not enough balance');
        NappyToken.transferFrom(msg.sender, address(this), _tokenAmount);
        NappyToken.approve(ROUTER, _tokenAmount);
        Router.addLiquidityETH{value: msg.value}(tokenAddress, _tokenAmount, 1000, msg.value, msg.sender, block.timestamp + 666);
    }

    function swapExactTokensForETH(uint256 _tokenAmount) external {
          NappyToken.transferFrom(msg.sender, address(this), _tokenAmount);
          NappyToken.approve(ROUTER, _tokenAmount);

            // if (_tokenAmount == WETH || _tokenOut == WETH) {
            // if (_tokenAmount == WETH) {
          address[] memory path = new address[](2);
            path[0] = address(NappyToken);
            path[1] = WETH;
            // } else {
            // path = new address[](3);
            // path[0] = NappyToken;
            // path[1] = WETH;
            // path[2] = _tokenOut;
            // }
        // swapExactTokensForTokens(_amountIn, _amountOutMin, path, _to, block.timestamp);
        // function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
       (uint256[] memory amounts) = Router.swapExactTokensForTokens(_tokenAmount, 2, path, address(this), block.timestamp + 7777);
       ETHStored[msg.sender] += amounts[1];
        // tokenAddress.(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);
     }

    function removeLiquidity(uint256 _tokenAmount) external {
        // address pair = IUniswapV2
        // NappyToken.transferFrom(msg.sender, address(this), _tokenAmount);
        // NappyToken.approve(ROUTER, _tokenAmount);
        Router.removeLiquidityETH(
           
            tokenAddress,
            _tokenAmount,
            2,
            2,
            msg.sender,
            block.timestamp + 7777
        );

    } 

    function withdraw(uint256 _amount)external {
        require(ETHStored[msg.sender] >= _amount, 'kuch nai hai chalaja');
        // uint256 amount = ETHStored[msg.sender];
        ETHStored[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        // emit
    }
}
