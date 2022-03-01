// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    
    // public variable also have view function
    // if we don't define a visibility of variable it will be internal visibility type
    // type, visibility, named
    uint256 favoriteNumber; // initialized value is 0
    bool favoriteBool;
    
    // struct is not like dictionary
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    
    // creating an array
    // type(array): refer to struct People, visibility, named
    People[] public people; // empty dynamic array
    
    // fixed size array
//    People[1] public people2;

    /*
    Mapping:
        A dictionary like data structure with 1 value per key
    */
    // type(mapping), visibility, named
    mapping(string => uint256) public nameToFavoriteNumber;
    
    // using struct=People named person
//    People public person = People({favoriteNumber: 2, name: "Patrick"});
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // the 2 keywords that don't make a transactin: view, pure
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    
    // pure functin that purely do some type of math
//    function retrieve2(uint256 favoriteNumber) public pure {
        // we are not gonna save state of this operation
//        favoriteNumber + favoriteNumber;
//    }
    
    /*
    keywords:
        memory: when you store an object in memory it actually means that it'll only be stored during execution
                of the function or of the contract call
        storage: data will persist even after the function executes
        string: string in solidity is actually technically not a value type
                string is actually an array of bytes(bytes array)
                A variable of type string is actually a special type of array that we can append text to
    */
    // function addPerson(string storage _name, uint256 _favoriteNumber) public {
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
        // people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    
}