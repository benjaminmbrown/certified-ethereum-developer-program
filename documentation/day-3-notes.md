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

`bytes32[] arr1`;
`bytes32[3] fixedArr`;

