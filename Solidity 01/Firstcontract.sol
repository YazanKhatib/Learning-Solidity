pragma solidity ^0.4.23;
contract Firstcontract{
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
}
