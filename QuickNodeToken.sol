pragma solidity 0.8.21;

//ERC token standard #20 interface 
interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint balance);
    function allowance(address owner, address spender) external view returns (uint remaining);
    function transfer(address recipient, uint amount) external view returns (bool success);
    function approve(address spender, uint amount) external view returns (bool success);
    function transferFrom(address sender, address recipient , uint amount) external returns (bool success);

    event Transfer(address indexed from , address indexed to , uint value);
    event Approval( address indexed owner, address indexed spender, uint value); 
}

//Action token contract

contract QuickNodeToken is ERC20Interface {
    string public symbol;
    string public name;
    uint8 public decimals;
    uint public _totalSupply;

    mapping (address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor (){
        symbol ="QNC";
        name = "QuickNode Coin";
        decimals = 18;
        _totalSupply = 1_000_001_000_000_000_000_000_000;
        balances[0xE9899172aef07FEc3418A31f2FccFA25ff3eA15b] = _totalSupply;
        emit Transfer(address(0),0xE9899172aef07FEc3418A31f2FccFA25ff3eA15b, _totalSupply);
        
    }

    function totalSupply() public view returns(uint) {
        return _totalSupply - balances[address(0)];
    }

    function transfer(address recipient, uint amount) public returns (bool success){
        balances[msg.sender] = balances[msg.sender]-amount;
        balances [recipient] = balances[recipient] + amount;
        emit Transfer(msg.sender , recipient, amount);
        return true;
    }

    function approve(address spender , uint amount) public returns (bool success){
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender , amount);
    }

    function transferFrom(address sender , address recipient, uint amount) public returns (bool success) {
        balances[sender] = balances[sender] - amount;
        allowed[sender][msg.sender] = allowed[sender][msg.sender]-amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint remaining) {
        return allowed[owner][spender];
    }

}