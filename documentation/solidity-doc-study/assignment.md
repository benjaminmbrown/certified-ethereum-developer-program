# Assignments

# Destructuring Assignments
- Solidity internally allows tuples
- Tuple: list of objects of different types with constant size at compile-time
- can be used to return multiple values at the same time
- can assign them to multiple variables at the same time

# Returning Multiple Values

```

pragma solidity ^0.4.19;
 
contract C {
    uint [] data;

    function f() returns (uint bool, uint){
        return (7, true, 2);
    }

    function g() { 

        //declares and assigns variables
        var (x,b,y) = f();

        //assign to pre-existing vars
        (x,y) = (2,7);

        //trick to swap values - not working for non-value storage types
        (x,y) = (y,x);

        //if tuple ends in empty component, rest of values discarded

        (data.length, )  = f(); // will set length to 7

        //same on left side:
        (,data[3]) = f(); // sets data[3] to 2

        //componenets can only be left out at the left-hand side of assignments except when like this:
        (x,) = (1,);
        //this is the only way to specify a 1 component tuple ß

    }
}