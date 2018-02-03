# Fallback Function

- It is important to implement a fallback function if you want your contract to receive ether

- Contract can have exactly one unnamed function
- Function cannot have arguments and cannot return anything
- it is executed on a coll to the contract if no other functions matches function identifier
- Or, if no data was supplied
- Executed when contract receives plain ether without data
- To receive Ether, fallback function must be marked ```payable```


- Contract without payable can receive ether as a recipient of ```coinbase``` transaction  (miner block reward) or as a destination of a ```selfdestruct```
- Contract cannot react to Ether transfers and cannot reject them. 
- It means this.balance can be higher than the some of some manual accounting implemented in a contract()


- Important to make fallback functions cheap
- Gas required by a transaction tht invokes a fallback function is much higher.

Following operatiosn will consume more gas than the stipend provided to a fallback function:

- Writing to storage
- Creating a contract
- Calling an external function which consumes a lot of gas
- Sending Ether


```

pragma solidity ^0.4.0;

contract Test {
// This function is called for all messages sent to
// this contract (there is no other function).
// Sending Ether to this contract will cause an exception,
// because the fallback function does not have the "payable"
// modifier.
    function() { x = 1; }
    uint x;
}

// This contract keeps all Ether sent to it with no way to get it back.
contract Sink {
    function() payable { }
}
contract Caller {
    function callTest(Test test) {
        test.call(0xabcdef01); // hash does not exist
        // results in test.x becoming == 1.
        // The following will not compile, but even
        // if someone sends ether to that contract,
        // the transaction will fail and reject the
        // Ether.
        //test.send(2 ether);

}
}
