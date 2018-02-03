# Logging

- Possible to access low level interface to logging of EVM
- Use ```log0```, ```log1```, ```log2```, ```log3```, and ```log4```
- ```logi``` takes i+1 param of type bytes32 where 1st arg is used for data and other parts as topics

The event in the [example here](events.md) can be called with low level logs:

```

pragma solidity ^0.4.19;

contract C {
    function f() {
        bytes32 _id = 0x420042;
        log3(
            bytes32(msg.value),
            bytes32(0x50cb9fe53daa9737b786ab3646f04d0150dc50ef4e75f59509d83667ad5adb20),
            bytes32(msg.sender),
            _id);
    }
}

```

* The hex number here is equal to keccak256("Deposit(address,hash256,uint256)") - the signature of the event


## Javascript Documentation

//TODO: 


## Example of usage of events

//TODO: 

## How to access events in JS

//TODO: