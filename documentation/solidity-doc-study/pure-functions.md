# Pure functions

Functions are pure which promise not to read from OR modify state

These are considered reading from state:

- Reading from state variables
- Accessing this.balance or <address>.balance
- Calling and function not marked ```pure```
- Using inline assembly that contains restricted opcodes


These are considered modifying state:

- Writing to state variables
- Emitting events
- Creating other contracts
- using selfdestruct
- Sending ether via calls
- Calling any functions not marked view or pure
- using low-level calls
- using inline assembly that contains restricted opcodes

Example:

```

pragma solidity ^0.4.19;

contract C {
    function f(uint a, uint b) pure returns (uint){
        return a * (b+42);
    }
}

```