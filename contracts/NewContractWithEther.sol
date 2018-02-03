pragma solidity ^0.4.19;

contract D {
    uint x;
    function D (uint a) payable {
        x = a
    }
}

contract C {
    D d = new D(4); // will be executed as part of C's constructor

    function createD (uint arg) {
        D newD = new D(arg)
    }

    function createAndEndowD(uint arg, uint amount) payable {

        //can send ether on creation
        D newD = (new D).value(amount) (arg);
    }
}