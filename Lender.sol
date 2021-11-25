//Lender Give The money To The Borrower At The Fix Amount of Interest and for the limited time....
pragma solidity ^0.8.1;

contract TheLender{
    address payable lender;
    address payable borrower;
    uint public time;
    uint public amount;
    uint public interest;

    constructor(address payable _lender,address payable _borrower,uint _time,uint _interest,uint _amount){
        lender=_lender;
        borrower=_borrower;
        time=block.timestamp+_time;
        interest=_interest;
        amount=_amount;
    }
    function recived()payable public{

    }
    function fund()payable public{
        borrower.transfer(amount);
    }
    function reimburse()payable public{
        payable(lender).transfer(amount+interest);
    }
    function geTheBalance()public view returns(uint){
        return address(this).balance;
    }
    
}