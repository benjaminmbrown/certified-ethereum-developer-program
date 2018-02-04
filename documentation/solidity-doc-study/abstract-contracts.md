# Abstract Contracts

- Contract functions can lack an implementation

```

pragma solidity ^0.4.19;

contract Feline {
    function utterance () returns (bytes32);
}

```

- The above can not be compiled, but can be used as base contracts :

```

pragma solidity ^0.4.19;

contract Feline {
    function utterance() returns (bytes32);
}

contract Cat is Feline { 
    function utterance() returns (bytes32) { 
        return "meow";
    }
}

```

- NOTE: if contract inherits from an abstract contract and does not implemeent all non-implemented functions by overriding, it will itself be abstract

