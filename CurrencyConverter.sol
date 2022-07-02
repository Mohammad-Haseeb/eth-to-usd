// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract CurrencyConverter{
     int256 public value;
     int256 public conversionRate;
     function sendFund() payable public returns(bool){
        AggregatorV3Interface dataFeedFinder= AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
                (, conversionRate,,,) = dataFeedFinder.latestRoundData();   
                conversionRate *= 1e10 ;   
                 value = (int256(msg.value) * conversionRate) / 1e18;   
                
         return true;
     }


}