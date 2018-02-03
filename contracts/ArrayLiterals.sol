/*Array literals are arrays that are written as an expression and are not assigned to a variable right away.
*/
pragma solidity ^0.4.0;
contract C {
    function f() {
    g([uint(1), 2, 3]);
    }
    function g(uint[3] _data) {
    // ...
    }
}

/*The type of an array literal is a memory array of fixed size whose base type is the common type of the given elements.
The type of [1, 2, 3] is uint8[3] memory, because the type of each of these constants is uint8. Because
of that, it was necessary to convert the first element in the example above to uint. Note that currently, fixed size
memory arrays cannot be assigned to dynamically-sized memory arrays, i.e. the following is not possible:*/

// This will not compile.
pragma solidity ^0.4.0;
contract C {
    function f() {
    // The next line creates a type error because uint[3] memory
    // cannot be converted to uint[] memory.
        uint[] x = [uint(1), 3, 4];
    }
}