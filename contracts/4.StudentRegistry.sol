// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StudentRegistry{
    struct Student{
        uint256 id;
        string name;
        uint256 age;
        string department;
        bool exists;
    }

    Student[] public studentList;

    mapping(uint256 => Student) public students;

    // id 被标记为 indexed，表示以后可以在链上日志里按 id 查找事件
    event StudentAdded(uint256 indexed id, string name, uint256 age, string department);

    function addStudent(uint256 _id, string memory _name, uint256 _age, string memory _department) public{
        require(!students[_id].exists, "Student already exists");
        students[_id] = Student(_id, _name, _age, _department, true);
        studentList.push(students[_id]);
        emit StudentAdded(_id, _name, _age, _department);
    }

    function getStudent(uint256 _id) public view returns(uint256, string memory, uint256, string memory){
        require(students[_id].exists, "Student does not exist");
        return(students[_id].id, students[_id].name, students[_id].age, students[_id].department);
    }

    function getAllStudents() public view returns(Student[] memory){
        return studentList;
    }
}