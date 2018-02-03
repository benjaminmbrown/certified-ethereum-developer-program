#Address Functions

These are special functions you can use to get information about an address or perform action with an address.


```<address>.balance(uint256)``` balance of address in Wei 

Example. msg.sender.balance will return balance of the current call's address

```<address>.transfer(uint256 amount)``` send amount to address and throws error on failure


```<address>.send(uint256 amount) returns (bool)``` send amount to address, returns false on failure

```<address>.call(...) returns (bool)``` issues low level CALL, returns false on failure

```<address>.callcode(...) returns (bool)``` issues low level CALLCODE, returns false on failure

```<address>.delegatecall(...) returns (bool)``` issues lowlevel DELEGATECALL, returns false on failure


## Notes on transferring value:

Using ```send``` can be problematic.

From worst to best:

Check return value of ```send```

Use ```transfer```

Use a pattern where recipient withdraws the money



