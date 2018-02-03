# Error Handling


- Solidty uses state-reverting exceptipons to handle errors
- These exceptions undo all changes made to state and current call + subcalls.
- also flags and error to caller
- When exceptions happen in a sub call, they 'bubble up' automatically
- Catching exceptions not yet possible

## Assert & Require 

### Assert

- ```assert()``` is for handling internal errors and invariants
- Properly functioning code should never reach a failing assert state. (that's a bug- fix it!)

Assert-style exceptions are generated in these situations:
- Accessing an array too large or negative index (i.e. i>x.legth or i<0)
- Access a fixed length bytesN at a too large or negative index
- Divide / modulo by zero (5/0 or 23% 0)
- shift by a negative
- Convert a value too big or negative into enum type
- Call a zero-initialized var of internal function type
- Call assert with a false argument


### Require

- ```require()``` should be used to check for valid conditions on inputs/ contract state variables. Or validate return values from calls to external contracts.

- can be used to flag an error and revert the current call

- analysis toosl can evaluate contract to identify the conditions and function calls which will reach a failing assert.

Require-style exceptions are generated when:

- Calling throw
- Calling require with an argument that evaluates to false
- If you  call function via message call but it runs out of gas, has no matching function, or throws an exception
- Create a contract using the new keyword but contract creation does not finish properly
- Perform an external function call targeting a contrac that has no code
- If your contract receives Ethere via public function without payable modifier (includes construtcor and fallback)
- If your contract receives ethere via public getter function
- If a .transfer() fails


## Example

```

pragma solidity ^0.4.19;

contract AssertAndRequire {
     function sendHalf(address _addr) payable returns(uint balance){
         require(msg.value % 2 == 0); //require even numbers
         uint balanceBeforeTransfer = this.balance;
         addr.transfer(msg.value / 2);
         assert(this.balance == balancezbeforeTransfer - msg.value/2);
         return this.balance;

     }
}

```