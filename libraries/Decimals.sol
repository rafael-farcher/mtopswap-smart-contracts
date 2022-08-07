// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

library Decimals {
    function divWithPrecision(
        uint256 _numeratorAmount,
        uint256 _denominatorAmount,
        uint8 _precision
    ) internal pure returns (uint256) {
        return (_numeratorAmount * 10**_precision) / _denominatorAmount;
    }

    function mulWithPrecision(
        uint256 _amountA,
        uint256 _amountB,
        uint8 _precision
    ) internal pure returns (uint256) {
        return (_amountA * _amountB) / 10**_precision;
    }

    function formatFromToDecimals(
        uint8 _fromDecimals,
        uint8 _toDecimals,
        uint256 _amount
    ) internal pure returns (uint256) {
        uint256 _amountFormatted;
        if (_fromDecimals < _toDecimals) {
            _amountFormatted = _amount * (10**(_toDecimals - _fromDecimals));
        } else if (_fromDecimals > _toDecimals) {
            _amountFormatted = _amount / (10**(_fromDecimals - _toDecimals));
        } else {
            _amountFormatted = _amount;
        }

        return _amountFormatted;
    }

    function formatToBiggerDecimals(
        uint8 _decimalsA,
        uint8 _decimalsB,
        uint256 _amountA,
        uint256 _amountB
    )
        internal
        pure
        returns (
            uint256 _amountAFormatted,
            uint256 _amountBFormatted,
            uint8 _biggerDecimals
        )
    {
        if (_decimalsA < _decimalsB) {
            _amountAFormatted = _amountA * 10**(_decimalsB - _decimalsA);
            _amountBFormatted = _amountB;
            _biggerDecimals = _decimalsB;
        } else if (_decimalsA > _decimalsB) {
            _amountAFormatted = _amountA;
            _amountBFormatted = _amountB * 10**(_decimalsA - _decimalsB);
            _biggerDecimals = _decimalsA;
        } else {
            _amountAFormatted = _amountA;
            _amountBFormatted = _amountB;
            _biggerDecimals = _decimalsA;
        }
    }
}
