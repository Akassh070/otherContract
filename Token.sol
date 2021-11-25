pragma solidity ^0.8.1;

contract Token{
    
    uint decimals = 18;
    uint totalSupply  = 10000;
    string tokenName = "Akash";
    string symbol = "Ak";
    mapping(address=>uint)public balanceOf;
    mapping(address=>mapping(address=>uint))public allowance;
    constructor(){
        balanceOf[msg.sender]=totalSupply;
    }
    function transfer(address _to,uint _amount)public returns(bool success){
        require(balanceOf[msg.sender]>=_amount,"You Have Not Enough Token");
        balanceOf[msg.sender]=balanceOf[msg.sender]-_amount;
        balanceOf[_to]=balanceOf[_to]+_amount;
        return true;
    }
    function fromTransfer(address payable _from,address _to,uint _amount)public returns(bool success){
        require(balanceOf[_from]>=_amount,"He Has Not Enough Balance");
        balanceOf[_from]=balanceOf[_from]-_amount;
        balanceOf[_to]=balanceOf[_to]+_amount;
        return true;
    }
    function approve(address _spender,uint _amount)public{
        require(_spender !=msg.sender);
        //require(allowance[msg.sender][_spender]>=_amount,"Not Enough Token Ypu Have");
        allowance[msg.sender][_spender]=_amount;
        
    }
    function getTheBalanceOfDeployer()public view returns(uint){
        return balanceOf[msg.sender];
    }
    function CHeckAllowance(address _a,address _b)public returns(uint){
        return allowance[_a][_b];
    }
}