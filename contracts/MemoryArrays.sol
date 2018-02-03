/*
Creating arrays with variable length in memory can be done using the new keyword. As opposed to storage arrays, it
is not possible to resize memory arrays by assigning to the .length member.
*/
pragma solidity ^0.4.0;
contract C {
    function f(uint len) {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        // Here we have a.length == 7 and b.length == len
        a[6] = 8;
    }
}