// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test{
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    function setUp() public {
        deployer=new DeployBasicNft();
        basicNft=deployer.run();

    }

    function testNameIcCorrect() public view {

        string memory expectedName="Doggie";
        string memory actualName=basicNft.name();

        assert(keccak256(abi.encodePacked(expectedName))==keccak256(abi.encodePacked(actualName)));
    }


}
