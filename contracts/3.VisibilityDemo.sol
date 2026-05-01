// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A{
    uint public x;
    // 只能从所定义的合约中访问
    uint private y;
    // 只能从所定义的合约和派生合约中访问
    uint internal z;

    function setX(uint _x) public {
        x = _x;
    }

    function setY(uint _y) public {
        y = _y;
    }

    function setZ(uint _z) public {
        z = _z;
    }
    // 不能从内部调用 （即 readY() 不起作用，但 this.readY() 可以）
    function readY() external view returns(uint){
        return y;
    }

    // 只能从当前的合约或从它派生出来的合约中访问
    function readXZ() internal view returns(uint, uint){
        return (x, z);
    }

    // 只能从当前的合约中访问
    function readXY() private view returns(uint, uint){
        return (x, y);
    }

    function readAll() public view returns(uint, uint, uint){
        return (x, this.readY(), z);
    }

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function deposit() public payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract B is A{
    function readX() public view returns(uint){
        return x;
    }

    function readZ() public view returns(uint){
        return z;
    }
}