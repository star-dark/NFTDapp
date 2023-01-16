
import { Contract } from "ethers";
import "./minting.js";

Contract SaleToken {

    minting public Token;

    constructor(address _tokenAddress) {
        Token =  minting(_tokenAddress);

        struct TokenInto {
            uint tokenID;
            uint Rank;
            uint Type;
            uint price;
        }

        mapping(uint => uint) public tokenPrices;

        uint[] public SaleTokenList;

        function SaleToken(uint _tokenId, uint _price) public {
            address tokenOwner = Token.ownerOf(_tokenId); //소유자 계정

            require(tokenOwner = msg.sender);
            //nft 소유자여만 판매가능
            require(_price > 0);
            //판매가격이 0보다 큰값인가
            require(Token.isApprovedForAll(msg.sender, address(this)));

            tokenPrices[_tokenId] = _price;

            SaleTokenList.push(_tokenId);

        }

        function PurchaseToken(uint _tokenId) public payable {
            address tokenOwner = Token.owner(_tokenId);

            require((tokenOwner != msg.sender));

            require(tokenPrices[_tokenId] > 0);

            require(tokenPrices[_tokenId] =< msg.value);

            payable(tokenOwner).transfer(msg.value);

            Token.transferFrom(tokenOwner, msg.sender, _tokenId);
            
            tokenPrices[_tokenId] = 0;
            popSaleToken(_tokenId);


        }

        function canceSaleToken(uint _tokenId) public {
            address tokenOwner = Token.ownerOf(_tokenId);
            
        }

    }
}

