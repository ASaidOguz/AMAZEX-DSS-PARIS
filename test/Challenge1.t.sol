// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test,console} from "forge-std/Test.sol";
import {MagicETH} from "../src/1_MagicETH/MagicETH.sol";
import {Hack} from "../src/1_MagicETH/Hack.sol";
/*////////////////////////////////////////////////////////////
//          DEFINE ANY NECESSARY CONTRACTS HERE             //
//    If you need a contract for your hack, define it below //
////////////////////////////////////////////////////////////*/



/*////////////////////////////////////////////////////////////
//                     TEST CONTRACT                        //
////////////////////////////////////////////////////////////*/
contract Challenge1Test is Test {
    MagicETH public mETH;
   
    address public exploiter = makeAddr("exploiter");
    address public whitehat = makeAddr("whitehat");
    uint256 public constant HACK_AMOUNT=1000 ether;
    function setUp() public {
        mETH = new MagicETH();

        mETH.deposit{value: 1000 ether}();
        // exploiter is in control of 1000 tokens
        mETH.transfer(exploiter, 1000 ether);
        
    }

    function testExploit() public {
        vm.startPrank(whitehat, whitehat);
        /*////////////////////////////////////////////////////
        //               Add your hack below!               //
        //                                                  //
        // terminal command to run the specific test:       //
        // forge test --match-contract Challenge1Test -vvvv //
        ////////////////////////////////////////////////////*/

        
        Hack hack=new Hack(address(mETH),exploiter,whitehat);
        hack.hack();
        console.log("WhiteHat Balance:",mETH.balanceOf(whitehat));
        mETH.withdraw(HACK_AMOUNT);
        //==================================================//
        vm.stopPrank();

        assertEq(whitehat.balance, 1000 ether, "whitehat should have 1000 ether");
    }
}
