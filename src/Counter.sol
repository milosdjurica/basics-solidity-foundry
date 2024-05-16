// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

contract Counter {
    uint256 public s_number;
    uint256 public s_number2;
    uint256 public constant NUMBER3 = 3;

    fallback() external payable {}
    receive() external payable {}

    function setNumber(uint256 _newNumber) public {
        s_number = _newNumber;
    }

    function increment() public {
        s_number++;
    }
}
