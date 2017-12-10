# Day 3

## Intro
Instructor: Stu Peters, CTO - stu@chainsafe.io


## Data Types

### Int

`int x`

`unint 256 y = 187;` (unsigned, integer does not go negative)

`uint constant z = 512;`

### Bool
`bool x;`

`bool y = true;`

`bool constant z = false;`


### Untyped
`var x;`

### Address

Address is an ethereum address
`address public user;`
-Public declaration creates a function that exposes the value of the variable to external users of the contract.

### String

A string is only accessible from the contract itself. External contracts can not access this.
`string lang = "Solidity"`

### Byes

A byte is like a string but can be exposed publicly - more commonly used.
`byte x;`;

### Array

Common data structure, collection. In solidity you can only keep same types of information in an array

`bytes32[] arr1;` - dynamic, can be as long as you want

`bytes32[3] fixedArr;`- static, only fit 3

### Mapping
Mapping is two types that are user defined (a key and value)

`mapping (address => uint256) public balances;`