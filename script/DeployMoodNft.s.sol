
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";


contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg=vm.readFile("./img/sad.svg");
        string memory happySvg=vm.readFile("./img/Happy.svg");
        vm.startBroadcast();
        MoodNft moodNft=new MoodNft(
            svgImageUri(sadSvg),
            svgImageUri(happySvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgImageUri(string memory svg) public pure returns(string memory){
        string memory baseUri="data:image/svg+xml;base64,";
        string memory svgBase64Encoded=Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseUri,svgBase64Encoded));
    }

}