// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract Encoding {
    function combineStrings() public pure returns (string memory) {
        // ! Encoding to bytes and then wrapping up in string
        // ! Can also do ->
        // return string.concat("Hello, ", "string.concat");
        return string(abi.encodePacked("Hello, ", "encodePacked!"));
    }

    function encodeNumber() public pure returns (bytes memory number) {
        number = abi.encode(1);
    }

    function encodeString() public pure returns (bytes memory str) {
        str = abi.encode("str");
    }

    function encodePackedString() public pure returns (bytes memory str) {
        str = abi.encodePacked("str");
    }

    // https://forum.openzeppelin.com/t/difference-between-abi-encodepacked-string-and-bytes-string/11837
    function castStringIntoBytes() public pure returns (bytes memory str) {
        str = bytes("str");
    }
}
