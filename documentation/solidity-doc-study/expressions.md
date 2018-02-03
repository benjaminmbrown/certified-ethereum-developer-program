# Solidity Expressions

## Input Parameters

- Input params are declared same as variables
- Unused params can omit the variable name

```
pragma solidity ^0.4.19;

contract InputParams {
    function takeInput(uint _a, uint _b){
        //use _a and _b here
    }
}

```

Note: it is common practice to prefis input parameters with an underscore ```_``` for readability


## Output Parameters

- Output params can be declared with same syntax after ```returns``` keyword
- Parameter names can be omitted
- Output values can also be specified with ```return``` statements
- return params are initialized ot zero and stay zero unless explicitly set
- return params can be used as expressions in function body, where they are alos usable in left-hand side of assignments
- you can return multiple values as output parameters, given that the number of components is the same as the number of output params

```

pragma solidity ^0.4.19;

contract OutputParams {
    function takeInputReturnOutput(uint _a, uint _b) returns (uint o_sum, uint o_product){
        o_sum = _a + _b;
        o_product = _a * _b;
    }
}

```


## Caveats on Arrays and Structs

- Assigning to a state variable always creates a copy
- assigning to a local variable creates and independent copy ONLY for elementary types (static types that fit into 32 bits)
- if structs/arrays are assigned from state var to local var, the local var holds a reference to the orig state var
- a 2nd asmt to the local var does not modify the state but only changes the reference
- Assignments to members (or elems) of the local var DO change the state

## Declarations

- A var declared will have init default value whose byte representaiton is all zeros
- Default values of variables are "zero-state". 
- Ex. Default val of bool is false
- Ex. Default val of uint/int is 0
- Dynamically sized arrays (bytes32/strings) default val is empty array or string

# Scoping
- Var declared ANYWHERE in a function will be in scope for ENTIRE functions
- Why?  Solidity inherits scoping rules from JS
- If a var is declared, it will be initialized at beginning of the function to its default value.

Ex. This runs but is bad code:

```

pragma solidity ^0.4.0;
contract C {
    function foo() returns (uint) {
        // baz is implicitly initialized as 0
        uint bar = 5;
        if (true) {
            bar += baz;
        } else {
            uint baz = 10;// never executes
        }
        return bar;// returns 5
    }
}
```