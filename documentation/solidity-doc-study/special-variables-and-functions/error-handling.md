# Error Handling

When handling errors, it is important to recognize when you are dealing with an internal or an external error from inputs or compotnents


## Internal Errors

For internal errors, we use Solidity's ```assert()``` function:

```assert(bool condition)```

```assert()``` with throw an error if the condition is not met

TODO: Example of using assert on internal error.

# External Errors

For checking the status of inputs or external components, we use Solidity's ```require()``` function:

```require(bool condition)```

```require()``` with throw an error if the condition is not met

Example:

```
pragma solidity ^0.4.19;

contract requireExample {

   function requireExample () { 
        owner = msg.sender;
    }

    address public owner;

    function changeOwner(address _newOwner){
        //Here the require function checks to see if the request (msg.sender) is  by the owner of the contract before proceeding
        require(msg.sender == owner);
        OwnerChanged(owner, _newOwner);
        owner = _newOwner;
    }
 
}
```

