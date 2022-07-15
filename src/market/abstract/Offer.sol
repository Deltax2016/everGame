pragma ton-solidity ^0.47.0;
pragma AbiHeader expire;
pragma AbiHeader pubkey;
pragma AbiHeader time;

import '../../errors/BaseErrors.sol';
import '../errors/OffersBaseErrors.sol';

import '../../interfaces/IData.sol';
import '../interfaces/IOffersRoot.sol';
import '../../libraries/Constants.sol';

abstract contract Offer {
    uint128 public static price;
    address public static addrData;

    bytes static deployHash;

    address public markerRootAddr;
    address public tokenRootAddr;
    address public addrOwner;

    // Market fee in TON's
    uint128 public marketFee;
    uint8 public marketFeeDecimals;
    
    uint8 royalty;
    address royaltyAuthor;

    function setDefaultProperties(
        address _markerRootAddr,
        address _tokenRootAddr,
        address _addrOwner,
        uint128 _marketFee,
        uint8 _marketFeeDecimals,
        uint8 _royalty, 
        address _royaltyAuthor
    ) 
        internal 
    {
        markerRootAddr = _markerRootAddr;
        tokenRootAddr = _tokenRootAddr;
        addrOwner = _addrOwner;

        marketFee = _marketFee;
        marketFeeDecimals = _marketFeeDecimals;
        royalty = _royalty;
        royaltyAuthor = _royaltyAuthor;
    }

    function getRoyaltyInfo() external view returns (uint8 value, address author) {
        value = royalty;
        author = royaltyAuthor;
    }

    function getFeesValues(uint128 _price) internal view returns (uint128 totalFeeValue, uint128 royaltyValue, uint128 marketFeeValue) {
        uint128 marketFeeDecimalsValue = uint128(uint128(10) ** uint128(marketFeeDecimals));
        marketFeeValue = math.divc(math.muldiv(_price, uint128(marketFee), uint128(100)), marketFeeDecimalsValue);
        totalFeeValue = marketFeeValue;
        royaltyValue = 0;
        if (royalty > 0) {
            royaltyValue = math.muldiv(_price, uint128(royalty), uint128(100));
            totalFeeValue += royaltyValue;
        }
    }

    modifier onlyOwner() {
        require(msg.sender == addrOwner, BaseErrors.message_sender_is_not_my_owner);
        _;
    }

    modifier onlyMarketRoot() {
        require(msg.sender == markerRootAddr, OffersBaseErrors.message_sender_is_not_my_root);
        _;
    }
}