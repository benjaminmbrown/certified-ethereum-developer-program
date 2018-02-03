/*Data locations are important because they change how assignments behave: assignments between storage and memory
and also to a state variable (even from other state variables) always create an independent copy. Assignments to local
storage variables only assign a reference though, and this reference always points to the state variable even if the
latter is changed in the meantime. On the other hand, assignments from a memory stored reference type to another
memory-stored reference type do not create a copy.*/

/*Summary:
Forced data location:
• parameters (not return) of external functions: calldata
• state variables: storage
Default data location:
• parameters (also return) of functions: memory
• all other local variables: storage
*/

pragma solidity ^ 0.4 .0;
contract C {
    uint[] x; // the data location of x is storage
    // the data location of memoryArray is memory
    function f(uint[] memoryArray) {
        x = memoryArray; // works, copies the whole array to storage
        var y = x; // works, assigns a pointer, data location of y is storage
        y[7]; // fine, returns the 8th element
        y.length = 2; // fine, modifies x through y
        delete x; // fine, clears the array, also modifies y
        // The following does not work; it would need to create a new temporary /
        // unnamed array in storage, but storage is "statically" allocated:
        // y = memoryArray;
        // This does not work either, since it would "reset" the pointer, but there
        // is no sensible location it could point to.
        // delete y;
        g(x); // calls g, handing over a reference to x
        h(x); // calls h and creates an independent, temporary copy in memory
    }

    function g(uint[] storage storageArray) internal {}

    function h(uint[] memoryArray) {}
}