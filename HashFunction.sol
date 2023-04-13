pragma solidity ^0.8.9;

/*
Keccak256 (Cryptographic Hash Function)
- Definition
    - - Function that takes in arb size input and outputs a data of fixed sized
- Properties
    -- Deterministic
        --- Hash(x) = h , everytime
    --Function is Quick to compute the hash
    --Irreversible 
        --- give h, hard to find x such that hash(x) = h
    --Small Change in input changes the output
    --Collision resistant
        --- hard to find x, y such that hash(x) = hash(y)

- Notes
    -- Collision resistance but easy way to create one
    -- by passing more than one data type to encodePacked



*/

contract HashFunction{
   // - to call keccak256 pass in bytes as input
   //do this with abi.ecode it takes data in all inputs and encodes it as bytes
   //keccak then takes the output and encodes it as a 32 byte hash

    
    
    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32){
            return keccak256(abi.encodePacked(_text, _num, _addr));

        

    }

    function collision(string memory _text, string memory _anotherText) public pure returns (bytes32){

            //return keccak256(abi.encodePacked(_text, _anotherText));
            //AAA BBB -> AAABBB
            //AA ABBB -> AAABBB
            //when you pass in two string encodeP concatenates the two strings
            //diferent inputs same output but not keccak eP causes this
            //instead of ecode packed call encode to avoid a hash collision ocurring
            return keccak256(abi.encode(_text, _anotherText));

        

    }

}

//because of the properties of the given hash it's almost impossible to find and reverse the hash
contract GuessTheMagicWord {
    //guess thwe word which computes to a certain hash
    //obviously this would be challenging but it proves that the hash will always match
    bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;
    function guess(string memory _word) public view returns (bool){
            return keccak256(abi.encodePacked(_word)) == answer;

        

    }

}