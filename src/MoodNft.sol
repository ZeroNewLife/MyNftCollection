// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    enum MOOD {
        HAPPY,
        SAD
    }
    error MoodNftFlipNoOwner();


    mapping(uint256 => MOOD) private s_setTokenIdMood;
    uint256 s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    constructor(string memory sadSvg, string memory happySvg) ERC721("Mood NFT", "MD") {
        s_tokenCounter = 0;
        s_sadSvg = sadSvg;
        s_happySvg = happySvg;
    }

    function mint() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_setTokenIdMood[s_tokenCounter] = MOOD.HAPPY;
        s_tokenCounter++;
    }
    function flipMood (uint256 tokenId) public {
        if(_isApprovedOrOwner(msg.sender,tokenId)){
            revert MoodNftFlipNoOwner();
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_setTokenIdMood[tokenId] == MOOD.HAPPY) {
            imageURI = s_happySvg;
        } else {
            imageURI = s_sadSvg;
        }
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            name(), // You can add whatever name here
                            '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                            '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
