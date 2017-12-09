pragma solidity ^0.4.0;

contract Calculator {
    uint addResult;

    function addNumber (uint n1, uint n2) {
        addResult = n1 + n2;
    }

    function getResult() constant returns (uint) {
        return addResults;
    }
}