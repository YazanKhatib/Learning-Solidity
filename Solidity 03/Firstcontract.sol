pragma solidity ^0.4.23;

interface loans {
    function carloan() external view returns (bool);
    function houseloan() external view returns (bool);
}

contract errorhandling{
    function testrequire() pure public{
        require(2 == 1);
    }

    function testassert() pure public{
        assert(false);
    }

    function testrevert() pure public{
        // if ( tickets == 0)
        revert();
    }
}
contract Bankaccount{
    address private owner;
    uint private balance;

    modifier ownership{
        //require(condition, message);
        require(owner == msg.sender, "you can't access this Bankaccount");
        _;
    }
    constructor(uint inv) public {
        owner = msg.sender;
        balance = inv;
    }

    function deposit(uint _amount) public ownership {
        balance += _amount;
    }

    function withdraw(uint _amount) public ownership {
        if ( balance >= _amount)
        balance -= _amount;
    }

    function checkbalance() public ownership view returns(uint){
        return balance;
    }
}

contract Firstcontract is Bankaccount(100), loans{
    string private name ;
    uint private age;

    function setName(string _name) public{
        name = _name;
    }

    function getName() view public returns(string) {
        return name;
    }

    function setAge(uint _age) public {
        age = _age;
    }

    function getAge() view public returns(uint) {
        return age;
    }

    function carloan() external view returns (bool){
        return checkbalance() >= uint(500);
    }

    function houseloan() external view returns(bool) {
        return checkbalance() >= uint(1000);
    }
}
