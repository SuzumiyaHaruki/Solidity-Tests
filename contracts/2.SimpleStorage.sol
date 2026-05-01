// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleStorage{
    uint8 public x;
    address owner;
    string message;
    bool flag;

    constructor(string memory _message, uint8 _x) {
        message = _message;
        owner = msg.sender;
        x = _x;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function start() public onlyOwner{
        flag = true;
    }

    function close() public onlyOwner{
        flag = false;
    }

    function set(uint8 _x) public {
        require(flag, "flag is false!");
        x = _x;
    }

    function setMessage(string memory _message) public{
        require(flag, "flag is false!");
        message = _message;
    }

}