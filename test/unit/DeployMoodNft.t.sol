// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract TestDeployMoodNft is Test {
    DeployMoodNft deployMood;

    function setUp () public{
        deployMood=new DeployMoodNft();

    }

    function testConvertatorSvg() public {
        string memory svgObject="";
        string memory actualSvg="";
    }
}