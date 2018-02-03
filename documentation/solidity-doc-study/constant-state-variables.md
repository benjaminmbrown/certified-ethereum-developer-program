# Constant state variables

- State vars can be declared as ```constant```.
- Have to be assigned from an expression that's constant at compile time
- Can't use expressions that access storage (this.balance, block.number,etc)
- Can't use expressions that execute data(mg.gas)
- Can't make calls to external contracts
- Can use expressions that have memory side-effects, but those that might affect other memory objects can not be used
- Builtin functions like keccak256, sha256, ripemd160, ecrecover, addmod, and mulmod are allowed

``` 
pragma solidity ^0.4.19;

contract C {
    uint constant x = 32**32 + 8;
    string constant text = "abc";
    bytes32 constant myHash = keccak256("abc");
}