pragma solidity 0.8.21;

contract Counter {
    uint public count;

    function increment() external  {
        count++;
    }

    function decrement() external {
        count --;
    }
}