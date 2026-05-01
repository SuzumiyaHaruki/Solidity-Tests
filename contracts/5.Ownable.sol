
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable{
    address payable owner;
    uint public num;

    constructor(uint _num) {
        owner = payable(msg.sender);
        num = _num;
    }

    modifier onlyowner(){
        require(msg.sender == owner, "Not Owner"); 
        _;
    }

    event ChangeNumber(uint oldNum, uint newNum);

    function changeNum(uint _num) public onlyowner{ 
        uint old = num;  
        num = _num;    
        emit ChangeNumber(old, num);    
    }

    function getOwner() public view returns(address payable){
        return owner;
    }

}
