// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.s_number(), 1);
    }

    function test_ArrMap() public {
        counter.pushArr(1111);
        counter.pushArr(1111);
        counter.pushArr(1111);

        counter.addMap(0, 222);
        counter.addMap(1, 222);
        counter.addMap(2, 222);

        assertEq(counter.getArrElement(2), counter.getMapElement(2));
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.s_number(), x);
    }
}
