pragma solidity ^0.4.11;

contract Escrow {

    address buyer;
    address seller;
    address arbiter;
    uint amount;

    function Escrow (address _seller, address _arbiter, uint _amount) {
        buyer = msg.sender;
        seller = _seller;
        arbiter = _arbiter;
        amount = _amount;
    }

    function payoutSeller () returns (bool) {
        require(msg.sender == buyer || msg.sender == arbiter);
        seller.transfer(this.balance);
        return true;
    }

    function refundBuyer () returns (bool) {
        require(msg.sender == buyer || msg.sender == arbiter);
        buyer.transfer(this.balance);

    }

    function fund() payable returns (bool) {
        require(msg.value == amount);
        return true;
    }

    function getBalance() constant returns (uint) {
        return this.balance;
    }
    
}