//SPDX-License-Identifier : MIT
pragma solidity 0.8.21;

contract SimpleStorage {
     
     uint256 public myfavouriteNumber;

    // uint256[] listOfFavouriteNumbers;
    struct Person{
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;//[]

   //chelse -> 232
   mapping(string => uint256) public nameT0FavouriteNumber;

     function store(uint256 _favouriteNumber) public {
         myfavouriteNumber = _favouriteNumber;
     }
//view , pure
     function retrieve() public view returns(uint256){
         return myfavouriteNumber;
     }
// calldata, memory , storage
     function addPerson(string memory _name, uint256 _favouriteNumber) public {
         listOfPeople.push(Person(_favouriteNumber, _name)); 
         nameT0FavouriteNumber[_name] = _favouriteNumber;
     }
}