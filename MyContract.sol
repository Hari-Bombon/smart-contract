pragma solidity 0.8.21;

contract Factory{
    Child[] public children;
    event ChildCreated(
        uint date,
        uint data,
        address childAddress
    );
    function createChild(uint _data) external {
        Child child = Child(_data);
        children.push(child);
        emit ChildCreated(
             now,
            _data,
            address(child)
        );
    }

}

contract Child {
    uint data;
    constructor(uint _data) public {
        data = _data;
    }
}