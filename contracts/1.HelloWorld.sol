// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HelloWorld{
    string message;
    address owner;
    constructor(){
        message = "Hello World!";
        owner = msg.sender;
    }
    // 为消息更新添加事件，方便前端或日志追踪
    event updateMessage(string oldMessage, string newMessage);
    function getMessage()public view returns(string memory){
        return message;
    }
    // 函数修饰器，只有 owner 可以更新消息
    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner can update message.");
        _;
    }

    function setMessage(string memory _message)public onlyOwner{
        string memory old = message;
        message = string.concat("Hello ", _message);
        emit updateMessage(old, message);
    }
}