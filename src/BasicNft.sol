// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

    import{ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;

    constructor() ERC721("Doggie","DOG" ){
        s_tokenCounter=0;
    }

    function mintNft() public {

    }
    function tokenURI(uint256 tokenid) public view override returns (string memory){
        
    }

}