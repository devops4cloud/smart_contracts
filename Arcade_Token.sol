pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract Arcade_Token {

    using SafeMath for uint;
    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchange_rate = 10;
    mapping(address => uint)balances;


    function balance() public view returns(uint) {
        return balances[msg.sender];
    }

    function transfer (address reciepient, uint value) public {
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[reciepient] = balances[reciepient].add(value);
    }

    function purchase() public payable {
        uint amount = msg.value.mul(exchange_rate);
        balances[msg.sender] = balances[msg.sender].add(amount);
        owner.transfer(msg.value);
    }

    function mint(address reciepient, uint value ) public {
        require (msg.sender == owner, "You are not authorized");
        balances[reciepient] = balances[reciepient].add(value);


    }
    
}
