# Inheritance

- All function calls are virtual
- The Most derived function is called except when the contract name is explicitly given
- When contract inherits from multiple contracts, only a single contract is created on the blockchain - the code from base contracts is copied into the created contract
- General inheritance similar to [Python inheritance]("https://pythonspot.com/inheritance/")



```

pragma solidity ^0.4.19;

contract owned {
    function owned() { owner = msg.sender ;}
    address owner;
}

// "is" keyword denotes inheritance from another contract
// mortal can access all non-private members including internal functions and state // vars. They cannot be accessed externally via "this"

contract mortal is owned {
    function kill(){
        if (msg.sender == owner) selfdestruct(owner);
    }
}

//Abstract contracts to make interface known to compiler. Note: function without body
// if a contract does not implement all functions it can only be used as an interface

contract Config {
    function lookup (uint id) returns address addr);
}

contract NameReg {
    function register (bytes32 name);
    function unregister();
}

//Multiple inheritance here. "owned" is also a base class of mortal, yet there is only one instance of "owned" 

contract named is owned, mortal {
    function named(bytes32 name) {
        Config config = Config (0xd5f9d8d94886e70b06e474c3fb14fd43e2f23970);
        NameReg(config.lookup(1)).register(name);
    }

    //Example of override function - must have same name and same number/types of inputs
    function kill(){
        if (msg.sender == owner){
            Config config = Config(0xd5f9d8d94886e70b06e474c3fb14fd43e2f23970);
            NameReg(config.lookup(1)).register(name);
            //you can still call specific overridden functions
            mortal.kill():
        }
    }
}

//here the constructor takes an argument and it needs to be provided in the 
//header (constructor) of the derived contract
contract PriceFeed is owned, mortal, named("GoFeed"){
    function updateInfo(uint NewInfo){
        if(msg.sender == owner) info = newInfo;
    }

    function get () constant returns (uint r) { return info; }

    uint info;
}

```
In the previous, mortal.kill() "forwards" the destruction request. This is not th best way to do it.

```
pragma solidity ^0.4.0;

contract owned {
    function owned() { owner = msg.sender; }
    address owner;
}

contract mortal is owned {
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}

contract Base1 is mortal {
    function kill() { /* do cleanup 1 */ mortal.kill(); }
}


contract Base2 is mortal {
    function kill() { /* do cleanup 2 */ mortal.kill(); }
}

contract Final is Base2, Base1 {
}

```

Above: A call to Final.kill() will call Base2.kill as the most derived overrride, which will bypass  Base1.kill because this override does not know about Base1. We solve this using ```super```

```


contract Base1 is mortal {
    function kill() { /* do cleanup 1 */ super.kill(); }
}


contract Base2 is mortal {
    function kill() { /* do cleanup 2 */ super.kill(); }
}


```

- When Base1 calls a function of super - it calls this function on the next base contract in the final inheritance graph
- It will call Base2.kill()
- The actual function that is called when user super is not known in the context of the class where it is used although its type is known.
- Final inheritance sequence: Final, Base1, Base2, mortal, owned

## Arguments for Base Constructors

- Derived contracts must provide all arguments needed for base constructors
- Can be done in two ways
- 1. Directly in the inheritance list (Base(7)) - more convenienct if constructor argument is a constant and defines or describes the behavior of the contract 
- 2. Modifier invoked as part of the header of the derived constructor (Base(_y * _y)). - has to be used if the constructor arguments of the base depend on those of derived.

Example:

```

pragma solidity ^0.4.19;

contract Base {
    uint x;
    function Base(uint _x) { x = _x; }
}

contract Derived is Base(7){
    function Derived(uint _y) Base (_y * _y){}
}

```

## Multiple Inheritance

- Follows Python's C3 Linearization 
- Desirable property of monotonicity but disallows inheritance graphs.
- The order in which base classes are given the *is* directive is important

"Linearization of inheritance graph impossible" Error:

```
pragma solidity ^0.4.19;

contract X {}
contract A is X { }
contract C is A, X {}

```

- C requests X to override A (by A, X in the order)
- A itself requests override of X, which cannot be resolved
- RULE: specify the base classes in order from "most Base-like" to "most derived"

## Inheriting Different Kinds of Members of the Same Name

- ERROR: when inheritance results in a contract with a function and modifier of the same name
- ERROR: event and modifier of same name
- ERROR: functiona nd event of same name
- A state variable getter can override public function