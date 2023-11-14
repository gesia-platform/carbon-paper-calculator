// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface IOperator {
    function isOperator(address _account) external view returns (bool);
}
