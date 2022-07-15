pragma ton-solidity >= 0.47.0;

pragma AbiHeader expire;
pragma AbiHeader pubkey;
pragma AbiHeader time;

import './IName.sol';

abstract contract Name is IName {

    string _game;

    function getName() public override responsible returns (string game) {
        return {value: 0, flag: 64}(_game);
    }

}