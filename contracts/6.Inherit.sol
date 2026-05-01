// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

abstract contract Geometry{
    // 当合约中至少有一个函数没有被实现，或者合约没有为其所有的基本合约构造函数提供参数时， 合约必须被标记为 abstract。
    function surfaceArea() public virtual returns(uint256);
    function volume() public virtual returns(uint256);

}

contract Cube is Geometry{
    uint length;

    constructor(uint _length){
        length = _length;
    }

    event ChangeLength(uint oldLength, uint newLength);

    function changeLength(uint _newLength) public {
        uint old = length;
        length = _newLength;
        emit ChangeLength(old, length);
    }

    function surfaceArea() public view override returns(uint256){
        return 6 * length * length;
    }
    function volume() public view  override  returns(uint256){
        return length ** 3;
    }

}