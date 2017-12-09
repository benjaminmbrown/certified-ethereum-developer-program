# Day 2

## Intro
  ## Instructor: Neeraj S Srivastava
* DLT Labs - Distributed Ledger Technology
* R3 Corda
* Truth vs. Consensus
* Blockchain is an ecosystem - not a technology
* DLT has 13 verticals in the ecosystem
  * examples infrastructure, programming, security, cryptography, philosophy, strategy
* Pick a vertical & stick to it
* Consensus - Proof of Stake vs. Proof of Authority vs. Byzantine Fault Tolerance vs. PoW
* JP Morgan R3 Corda - takes base of ethereum with newer components - fork of ethereum
  * DLT vs Blockchain. (Coda = DLT != Blockchain) - ( Eth, BTC = blockchain)
    * Coda has a centralized server that assigns the leader
  * Ethereum is very modular - has proof of work and proof of authority in module
  * Can switch consensus algorithm after launch (with effort) while everything else remains the same
* Byzantine fault tolerance theory
  * Incentivizes systems to try to come in sync where before there was no incentive
  * Old databases can only be updated one record at a time - if n number of nodes, who gets the right to update the db at any given time?

## GETH Details
   Go through geth in detail and understand the fundamentals of how to manually create a smart contract, compile it, and upload to blockchain


### To create a smart contract
   Contract example:
   
```pragma solidity ^0.4.0;
contract add {
    uint public c;
    
    function Add(uint a, uint b){
        c = a + b;
    }
    function returnAdd() constant returns (uint) {
        return c;
    }
}
```
* create sourcecode variable w/ code in string
* var sourceCode = "{your source}"
* var compileCode = eth.compile.solidity(sourceCode)
* output of compilecode is now in bytecode hex (code: attribute) which is what the blockchain understands

* ABI Definition
  * contract can call another contract or outside world
  * The interface: in order to call, you need to name/address of the contract, function name, and parameters needed

* compiile object from geth itself

## Using Remix
   Good as a debugger for singular contracts and debugging. Not for enterprise development
* Shows how Remix works behind the scene

## Truffle Framework

   When using multiple contracts, truffle is useful for interacting contracts. Use when deployment and testing
