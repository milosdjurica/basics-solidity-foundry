// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {Encoding} from "../src/Encoding.sol";

contract CounterTest is Test {
    Encoding public encoding;

    function setUp() public {
        encoding = new Encoding();
    }

    function test_combineString() public view {
        encoding.combineStrings();
    }
}
