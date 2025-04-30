// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract MDS17 is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    string uri ="";
    string constant METADATA_TEST = "ipfs://bafybeie2k3snxksygvx53apcxdprwqhba22l2wpvjwzvtlyrnqq7alydpi/";
    constructor(address initialOwner)
        ERC721("MDS17", "MDS")
        Ownable(initialOwner)
    {}

    function mint(uint256 norm)
    public payable
    returns (uint256)
    {
        require(msg.value == 0 ether, "");
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
        if (norm ==100)
            _setTokenURI(tokenId, string(abi.encodePacked(METADATA_TEST, Strings.toString(1), ".json")));
        else if (norm >=75 && norm <= 99)
            _setTokenURI(tokenId, string(abi.encodePacked(METADATA_TEST, Strings.toString(2), ".json")));
        else if (norm >=50 && norm <= 74)
            _setTokenURI(tokenId, string(abi.encodePacked(METADATA_TEST, Strings.toString(3), ".json")));
        else if (norm >=25 && norm <= 49)
            _setTokenURI(tokenId, string(abi.encodePacked(METADATA_TEST, Strings.toString(4), ".json")));
        else
            _setTokenURI(tokenId, string(abi.encodePacked(METADATA_TEST, Strings.toString(5), ".json")));
        return tokenId;
    }

    

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
