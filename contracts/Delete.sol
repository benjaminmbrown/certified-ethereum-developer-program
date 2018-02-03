pragma solidity ^0.4.0;

contract DeleteExample {
    uint data;
    uint[] dataArray;

    function f() {
        uint x = data;
        delete x; // sets x to 0, does not affect data
        delete data; // sets data to 0, does not affect x which still holds a copy
        uint[] y = dataArray;
        delete dataArray; // this sets dataArray.length to zero, but as uint[] is a complex object, also
        // y is affected which is an alias to the storage object
        // On the other hand: "delete y" is not valid, as assignments to local variables
        // referencing storage objects can only be made from existing storage objects.
    }
}

/*
delete a assigns the initial value for the type to a. I.e. for integers it is equivalent to a = 0, but it can also be
used on arrays, where it assigns a dynamic array of length zero or a static array of the same length with all elements
reset. For structs, it assigns a struct with all members reset.
delete has no effect on whole mappings (as the keys of mappings may be arbitrary and are generally unknown). So
if you delete a struct, it will reset all members that are not mappings and also recurse into the members unless they are
mappings. However, individual keys and what they map to can be deleted.
It is important to note that delete a really behaves like an assignment to a, i.e. it stores a new object in a.
*/