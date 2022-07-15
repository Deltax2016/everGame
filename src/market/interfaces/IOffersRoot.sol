pragma ton-solidity ^0.47.0;

interface IOffersRoot {
    function changeDeploymentFee(uint128 _value) external;

    function changeMarketFee(uint8 _value, uint8 _decimals) external;

    function confirmOffer(uint8 _royalty, address _royaltyAuthor) external returns(address offerAddress);

    function declineOffer() external;
}