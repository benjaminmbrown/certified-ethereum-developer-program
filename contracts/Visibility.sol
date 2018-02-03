pragma solidity ^0.4.19;

contract C { 
    uint private data;
    function f(uint a) private returns(uint b){ return a+1;}
    function setData(uint a) internal { data -a;}
    function getData() public returns(uint) { return data;}
    function compute(uint a, uint b) internal returns (uint) { return a+b;}
}

contract D {
    function readData(){
        C c = new C();
        uint local = c.f(7); //Error (f not visible);
        c.setData(3);
        local = c.getData();
        local = c.compute(3,5)//Error "compute" is not visible
    }

}

contract E is C {
function g(){
    C c = new C();
    uint val = compute(3,5); //WORKS - access to internal member in derived contracs
}
}