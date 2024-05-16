// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

contract Counter {
    uint256 public s_number;
    uint256 public s_number2;
    uint256 public constant NUMBER3 = 3;

    uint256[] public arr;
    mapping(uint256 => uint256) public map;

    function setNumber(uint256 _newNumber) public {
        s_number = _newNumber;
    }

    function increment() public {
        s_number++;
    }

    function pushArr(uint256 a) public {
        arr.push(a);
    }

    function getArrElement(uint256 a) public view returns (uint256) {
        return arr[a];
    }

    function getMapElement(uint256 a) public view returns (uint256) {
        return map[a];
    }

    function addMap(uint256 a, uint256 b) public {
        map[a] = b;
    }
}
