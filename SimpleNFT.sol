// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleNFT {
    string public name;
    string public symbol;
    uint256 public tokenIdCounter;

    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;
    mapping(uint256 => string) public tokenURI;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );


    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        tokenIdCounter = 1;
    }

    function mint(address to, string memory _tokenURI) external {
        uint256 tokenId = tokenIdCounter;
        tokenIdCounter++;

        ownerOf[tokenId] = to;
        balanceOf[to]++;
        tokenURI[tokenId] = _tokenURI;

        emit Transfer(address(0), to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) external {
        require(ownerOf[tokenId] == from, "Not owner");
        require(to != address(0), "Zero address");

        balanceOf[from]--;
        balanceOf[to]++;
        ownerOf[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }
}
