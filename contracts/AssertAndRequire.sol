
pragma solidity ^0.4.19;

contract AssertAndRequire {
     function sendHalf(address _addr) payable returns(uint balance){
         require(msg.value % 2 == 0); //require even numbers
         uint balanceBeforeTransfer = this.balance;
         addr.transfer(msg.value / 2);
         assert(this.balance == balancezbeforeTransfer - msg.value/2);
         return this.balance;

     }
}