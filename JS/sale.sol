pragma solidity ^0.8.15;

import "./nftminting.sol";

contract SaleToken {
    SaleToken public Token;

    constructor(address _tokenAddress) {
        Token = SaleToken(_tokenAddress);
    }
    struct TokenInfo {
        uint tokenId;
        uint Rank;
        uint Type;
        uint price;

    }
     mapping(uint => uint) public tokenPrices;

  
        uint[] public SaleTokenList;
        }
            function SalesToken(uint _tokenId, uint _price) public {

        // NFT의 소유자를 가져옵니다.
        address tokenOwner = Token.ownerOf(_tokenId);
        // NFT의 소유자 계정과 함수를 실행한 계정이 비교하여 같은지 확인합니다.
        require(tokenOwner == msg.sender);

        require(_price > 0);

        // NFT판매자의 대리인이 맞는지 확인합니다.
        require(Token.isApprovedForAll(msg.sender, address(this)));

        tokenPrices[_tokenId] = _price;
        SaleTokenList.push(_tokenId);
        }

            function BuyToken(uint _tokenId) public payable {
        
        address tokenOwner = Token.ownerOf(_tokenId);
        
        require(tokenOwner != msg.sender);
       
        require(tokenPrices[_tokenId] > 0);
       
        require(tokenPrices[_tokenId] <= msg.value );

        
        payable(tokenOwner).transfer(msg.value);

        // 판매완료된 NFT를 대리인이 구매자에게 보내줍니다.
        Token.transferFrom(tokenOwner, msg.sender, _tokenId);

        tokenPrices[_tokenId] = 0;

        popSaleToken(_tokenId);
        }
      
        function cancleSaleToken(uint _tokenId) public {
    // NFT의 소유자를 가져옵니다.
    address tokenOwner = Token.ownerOf(_tokenId);
    require(tokenOwner == msg.sender);
    require(tokenPrices[_tokenId] > 0);

    tokenPrices[_tokenId] = 0;
    popSaleToken(_tokenId);
    }

        function getSaleTokenList() public view returns(TokenInfo[] memory){
    require(SaleTokenList.length > 0);
    // 판매중인 NFT 토큰 리스트와 같은 길이의 배열 생성
    TokenInfo[] memory list = new TokenInfo[](SaleTokenList.length);

    for(uint i = 0; i < SaleTokenList.length; i++) {
        uint tokenId = SaleTokenList[i];
        uint Rank = Token.getTokenRank(tokenId);
        uint Type = Token.getTokenType(tokenId);
        uint price = tokenPrices[tokenId];

        list[i] = TokenInfo(tokenId, Rank, Type, price);
    }

    return list;
    }

        function getLatestToken(address _tokenOwner) public view returns(TokenInfo memory) {
    uint balance = Token.balanceOf(_tokenOwner) - 1;
    uint tokenId = Token.tokenOfOwnerByIndex(_tokenOwner,balance);
    uint Rank = Token.getTokenRank(tokenId);
    uint Type = Token.getTokenType(tokenId);
    uint price = tokenPrices[tokenId];

    return TokenInfo(tokenId,Rank,Type,price);
    }



}