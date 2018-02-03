# View Functions

View functions are those which promise NOT to modify the state

These WOULD modify state:

- Writing to state variables
- Emitting events
- Creating other contracts
- using selfdestruct
- Sending ether via calls
- Calling any functions not marked view or pure
- using low-level calls
- using inline assembly that contains restricted opcodes

- ```constant``` is an alias to ```view```
- Getter methods are marked ```view```
- Compiler doesn't enforce that a view is not modifying state


```

pragma solidity ^0.4.19;

contract C {
    function f(uint a, uint b) view returns (uint){
        return a * (b + 42) + now;
    }
}