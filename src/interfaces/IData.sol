pragma ton-solidity >= 0.46.0;

interface IData {
    function transferOwnership(address addrTo) external;

    function getOwner() external view returns (address addrOwner);
    function getInfo() external view returns (
        address addrRoot,
        address addrOwner,
        address addrAuthor,
        address addrData,
        uint id,
        bytes name,
        bytes url,
        uint8 number,
        uint8 amount
    );

    function lendOwnership(address _addr) external;
    
    function returnOwnership() external;
}
