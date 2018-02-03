# Function Calls

## Internal Function Calls

Functions within the current contract can be called directly and are considered "Internal"

- can be called recursively
- function calls are translated to simple jumps in EVM
- current memory is not cleared : passing memory references to internal functions is very efficient

```

pragma solidity ^0.4.19;

contract InternalExample {
    function g(uint a) returns (uint ret){ return f()};
    function f() returns (uint ref){ return g(7) + f()}
}

```

## External Function Calls
- ```this.g(8)``` and ```c.g(2)``` are valid function calls
- these functions will be called "externally"
- Called by message call and not by EVM jumps (like internal)
- ```this``` cannot be used in constructor - Why? the contract has not been created yet
- Wei amount can optional be specified with ```.value()``` and ```.gas()```

``` 

pragma solidity ^0.4.19;

contract InfoFeed {
    function info() payable returns (uint ret) { return 42; }
}

contract Consumer {
    InfoFeed feed;
    function setFeed( address addr) { feed = InfoFeed(addr);}
    function callFeed90 { feed.info.value(10).gas(800)();}
}

```

Notes:

- function calls cause exceptions: if the called contract doesn't exist or if the contract itself runs out of gas or throws an exception
- to use ```.value()``` the target contract function must be ```payable()```


## Named Calls

- function call arguments can be given by name in any order

```

pragma solidity ^0.4.19;

contract C {
    function f (uint key, uint value){
        //...
    }
    function g () {
        f({ name: 4, key: 5}) //Notice here they are not in the same order
    }
}

```

## Omitted Function Param Names

- names of unused params can be omitted
- omitted parameters will still be on the stack
- omitted parameters will be inaccessible

```

pragma solidity ^0.4.19;

contract C {
    //omit name for param
    function func(uint k, uint) returns (uint){
        return k;
    }
}

```

## Creating Contracts via new

- a contract can create a new contract with ```new``` keyword
- full code of contract being created must be known in advance
- recursion not possible
- can forward ether to  newly created contract (but can't limit gas)

Creation can fail because:

- out-of-stack
- not enough ether
- other issues

an exception if thrown

Example:

```

pragma solidity ^0.4.19;

contract D {
    uint x;
    function D (uint a) payable {
        x = a
    }
}

contract C {
    D d = new D(4); // will be executed as part of C's constructor

    function createD (uint arg) {
        D newD = new D(arg)
    }

    function createAndEndowD(uint arg, uint amount) payable {

        //can send ether on creation
        D newD = (new D).value(amount) (arg);
    }
}

```