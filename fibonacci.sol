//Fibonacci series

pragma solidity ^0.8.1;

contract Fibonacci{

    function theFibonacci(uint n)public view returns(uint){
        uint a=1;
        uint b=1;
        for(uint i=2;i<n;i++){
            uint c=a+b;
            b=a;
            a=c;
        }
        return a;
    }
}