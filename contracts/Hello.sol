// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Hello{
    string public name;

    function set(string memory _name) public {
        name = _name;
    }

    function get() public view returns(string memory){
        string memory ans = string.concat("Hello ", name);
        return ans;
    }


}