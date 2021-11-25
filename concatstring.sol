pragma solidity ^0.8.1;

contract TheString{
    
    function findLength(string memory str)public view returns(uint){
        bytes memory s = bytes(str);
        return s.length;
    } 
   
    function can(string memory One ,string memory two)public view returns(string memory){
            return string(abi.encodePacked(One,two));
    }
    
}