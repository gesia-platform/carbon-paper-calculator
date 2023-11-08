// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../operator/IOperator.sol";

contract CarbonPaperCalculator {
    // Constants
    uint256 private constant CO2_PER_KG = 1130; // Carbon footprint per kg (0.113 scaled by 10,000)
    uint256 private constant DENSITY = 80; // Density of the paper in gsm (grams per square meter)
    // State variables
    mapping(string => uint256) private paperWeights;
    mapping(string => uint256) private paperSizes;

    address public operatorManager;

    modifier operatorsOnly() {
        require(IOperator(operatorManager).isOperator(msg.sender), "#operatorsOnly:");
        _;
    }

    constructor(address _operatorManager){
        operatorManager = _operatorManager;
    }

    constructor() {
    }

    function addPaperSize(string memory paperType, uint256 width, uint256 height) external operatorsOnly {
        // paper size scaled by 10 000 (widthxheight)
        paperSizes[paperType] = calculateWeight(width, height, DENSITY);
    }

    function addPaperWeight(string memory paperType, uint256 weight) external operatorsOnly {
        //paper weight scaled by 10 000 (weight)
        paperWeights[paperType] = weight;
    }

    // Private function to calculate the weight of a paper size
    function calculateWeight(uint256 widthMM, uint256 heightMM, uint256 _density) private pure returns (uint256) {
        return widthMM * heightMM * _density / 1000;
    }

    // calculate CO2 footprint by weight in scaled grams
    function calculateCO2ByWeight(uint256 weightGramsScaled, uint256 count) private pure returns (uint256) {
        // CO2_PER_KG -> scaled by 10 000
        // weightGramsScaled -> scaled by 10 000
        // weightGramsScaled (g->kg) -> 1000
        // total 10**11
        uint256 result = (CO2_PER_KG * weightGramsScaled * 10 ** 18) / 10 ** 11;
        return result * count;
    }

    // calculate CO2 footprint by size
    function calculateCO2BySize(uint256 sizeScaled, uint256 count) private pure returns (uint256) {
        // CO2_PER_KG -> scaled by 10 000
        // two sizes -> scaled by 10 000 total 100 000 000
        // total 10**12
        uint256 result = (CO2_PER_KG * sizeScaled * 10 ** 18) / 10 ** 12;
        return result * count;
    }

    // get the weight for a given paper size
    function getPaperWeight(string memory size) public view returns (uint256) {
        require(paperWeights[size] > 0, "Invalid paper weight");
        return paperWeights[size];
    }

    // get the size for a given paper size
    function getPaperSize(string memory size) public view returns (uint256) {
        require(paperSizes[size] > 0, "Invalid paper size");
        return paperSizes[size];
    }

    // calculate CO2 footprint by paper size in (18 decimals)
    function calculateCO2ByPaperSize(string memory paperType, uint256 count) public view returns (uint256) {
        uint256 weightInSize = getPaperSize(paperType);
        return calculateCO2BySize(weightInSize, count);
    }

    // calculate CO2 footprint by paper weight in (18 decimals)
    function calculateCO2ByPaperWeight(string memory paperType, uint256 count) public view returns (uint256) {
        uint256 weightPaper = getPaperWeight(paperType);
        return calculateCO2ByWeight(weightPaper, count);
    }
}
