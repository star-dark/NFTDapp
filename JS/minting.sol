// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("MyNFT", "NFT") {}

    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns (uint256){
    
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
    contract nftminting is  ERC721Enumerable, Owner {

    uint constant public MAX_TOKEN_COUNT = 1000;
    uint public mint_price = 1 ether;
    string public metadataURI;
    constructor(string memory _name, string memory _symbol, string memory _metadataURI) ERC721(_name, _symbol) {
        metadataURI = _metadataURI;
    }

    struct TokenData{ 
        uint Rank;
        uint Type;
    }
    mapping(uint=>TokenData) public TokenDatas;

    uint public tokenCount;

    function mintToken() public payable {
        //mintToken 실행시 이더지급하는 payable
        require(msg.value >= mint_price);
        require(MAX_TOKEN_COUNT > ERC721Enumerable.totalSUPPLY());

        uint tokenId = ERC721Enumerable.totalSUPPLY;
        //총발행량

        TokenData memory random = getRandomTokenData(msg.sender, tokenId);
        TokenDatas[tokenId] = random;

        tokenCount[TokenDatas[tokenId].Rank-1][TokenDatas[tokenId].Type-1] += 1;
        //RANK 와 TYPE의 토큰이 몇개가 생성되엇는지 확인가능하도록하는 상태벼수

        payable(Ownable.owner()).transfer(msg.value);

        _mint(msg.sender, tokenId);
    }
    function tokenURI(uint _tokenId) public override view returns(string memory) {
  

  
    string memory Rank = Strings.toString(TokenDatas[_tokenId].Rank);
    string memory Type = Strings.toString(TokenDatas[_tokenId].Type);

 
   

        return data;
            }function setMetaDataURI(string memory _uri) public  onlyOwner  {
        metadataURI = _uri;
        }

        // tokenId를 넣었을때 해당 NFT의 Rank를 return합니다.
        function getTokenRank(uint _tokenId) public view returns(uint) {
        return TokenDatas[_tokenId].Rank;
        }

        // tokenId를 넣었을때 해당 NFT의 Type를 return합니다.
        function getTokenType(uint _tokenId) public view returns(uint) {
        return TokenDatas[_tokenId].Type;
        }

        // tokenCount를 보여주는 함수
        function getTokenCount() public view returns(uint[4][4] memory) {
        return tokenCount;
        }

}