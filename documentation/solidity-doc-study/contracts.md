# Contracts

- [Contracts](#contracts)
    - [Contract creation](#contract-creation)
    - [Visibility](#visibility)
        - [external](#external)
        - [public](#public)
        - [internal](#internal)
        - [private](#private)
    - [Getter Functions](#getter-functions)


## Contract creation

- When contract is created, its constructor is executed. 
- A constructor is optional
- only one constructor allowed (no overloading)
- Cyclic contract creation dependencies are impossible

Example Contract:

```
pragma solidity ^0.4.19;

contract OwnedToken { 
    TokenCreator creator;
    //constructor.. registers owner & assigned nave
    function OwnedToken (bytes32 _name) {
        owner = msg.sender;
        creator = TokenCreator(msg.sender);
        name = _name;
    }
    function changeName(bytes32 newName) {
        require(msg.sender == address(creator))
        name = newName;
    }
    function transfer(address newOwner) {
        require(msg.sender == owner);
        //ask creator if transfer is ok
        require(creator.isTokenTransferOk(owner, newOwner))
        owner = newOwner
    }
}

contract TokenCreator { 
 function createToken (bytes32 name)
    returns (OwnedToken tokenAddress){
        return new OwnedToken(name);
    }

    function changeName (OwnedToken tokenAddress, bytes32 name) {
        tokenAddress.changeName(name);
    }

    function isTokenTransferOk(
        address currentOwner,
        address newOwner
    ) returns (bool ok){
        address tokenAddress = msg.sender;
        return (keccak256(newOwner & 0xff) == bytes20(tokenAddress) & 0xff);
    }

}

```

## Visibility

Two kinds of function calls in solidity. Internal function calls that do not create an actual EVM call (a "message" call). External calls create an actual EVM call.

Everything inside a contract is visible to all observers - private only prevents other contracts from modifying the info.

Four types of visibilities for functions and state vars:

### external 

- Part of contract interface
- Can be called from other contracts via transaction
- Can NOT be called internally
- Efficient when receiving large arrays of data

### public

- Part of contract interface
- Can be called internally
- Can be called via messages
- For public state variables, automatic getter is created

### internal

- Functions and state vars can only be accessed internally
- Only within the current contract or derived contracts

### private

- Only visible for the contract they are defined in
- Not available in derived contracts


Example:

```

pragma solidity ^0.4.19;

contract Visibility{
    function f(uint a) private returns(uint b){ return a+1;}
    function setData(uint a) internal { data -a;}

    uint public data;
}

```

Example: in this example. D can call c.getData to retreive value of data in state storage, but D is not able to call f(). E is derived from C and thus can call compute();

```
pragma solidity ^0.4.19;

contract C { 
    uint private data;
    function f(uint a) private returns(uint b){ return a+1;}
    function setData(uint a) internal { data -a;}
    function getData() public returns(uint) { return data;}
    function compute(uint a, uint b) internal returns (uint) { return a+b;}
}

contract D {
    function readData(){
        C c = new C();
        uint local = c.f(7); //Error (f not visible);
        c.setData(3);
        local = c.getData();
        local = c.compute(3,5)//Error "compute" is not visible
    }

}

contract E is C {
function g(){
    C c = new C();
    uint val = compute(3,5); //WORKS - access to internal member in derived contracs
}
}


```

## Getter Functions

The compiler automatically creates getters for public state variables.

In this code the compiler will create a getter function called data that doesn't take any arguments and returns a uint

```
pragma solidity ^0.4.19;

contract C { 
    uint public data = 42;
}

contract Caller {
    C c = new C();
    function f(){

         //c.data exists b/c the compiler created the getter for the plubic state variable 
        uint local = c.data();
       
    }
}

```

- Getters have external visibility
- If the symbol is accessed internally (without ```this.```) it is evaluated as a state var
- If access externallly (with ```this```) it is evaluated as a function

```

pragma solidity ^0.4.19;

contract C { 
    uint public data = 42;

    function x(){
        data = 3; //internal access (no 'this')
        uint val = this.data() // external with 'this'
    }
}


```

Exampl of complex visibilty

```
pragma solidity ^0.4.19;

contract Complex {
    struct Data {
        uint a;
        bytes3 b;
        mapping(uint => uint) map;
    }
    
    mapping (uint -> mapping(bool->Data[])) public data;
}

//The generated function will loook like:

function data(uint arg1, bool arg2, uint arg3) returns (uint a, bytes3 b){
    a = data[arg1][arg2][arg3].a;
    b = data[arg1][arg2][arg3].b;
}