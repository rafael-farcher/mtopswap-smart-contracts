// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./interfaces/IOracle.sol";

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract OneUsdOracleMainnet is IOracle {
    AggregatorV3Interface public priceFeed;

    /**
     * Network: Harmony Mainnet
     * Aggregator: ONE/USD
     * Address: 0xdCD81FbbD6c4572A69a534D8b8152c562dA8AbEF
     */
    constructor() {
        priceFeed = AggregatorV3Interface(
            0xdCD81FbbD6c4572A69a534D8b8152c562dA8AbEF
        );
    }

    /**
     * Returns the latest price
     */
    function getPrice() public view override returns (uint256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price);
    }
}
