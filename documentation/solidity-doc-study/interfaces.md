# Interfaces


- Can't inherit other contracts or interfaces
- Can't define constructor
- Can't define variables
- Can't define structs
- Can't define enums
- Contracts can inherit interfaces as they would other contracts

 Interfaces are denoted by keyword interface
 
 Interfaces are limited to what the ABI can represent, and the conversion between the ABI and the interface should be possible without any information loss

 ```
 
 pragma solidity ^0.4.19;

 interface Token {
     function transfer(address recipient, uint amount);
 }