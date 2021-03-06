pragma solidity ^0.4.15;

import './Token.sol';
import './dependencies/Ownable.sol';

contract TokenFactory {

    function createCloneToken(
        address _parentToken,
        uint _snapshotBlock,
        string _tokenName,
        string _tokenSymbol
        ) public returns (Token) {

        Token newToken = new Token(
            this,
            _parentToken,
            _snapshotBlock,
            _tokenName,
            _tokenSymbol
        );

        newToken.transferControl(msg.sender);
        return newToken;
    }
}