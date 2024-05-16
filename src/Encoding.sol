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

    // ! Basically this does the same thing like abi.encode() BUT it cuts off extra 00000000000
    function encodePackedString() public pure returns (bytes memory str) {
        str = abi.encodePacked("str");
    }

    // https://forum.openzeppelin.com/t/difference-between-abi-encodepacked-string-and-bytes-string/11837
    function castStringIntoBytes() public pure returns (bytes memory str) {
        str = bytes("str");
    }

    function decodeString() public pure returns (string memory str) {
        str = abi.decode(encodeString(), (string));
    }

    function multiEncode() public pure returns (bytes memory str) {
        str = abi.encode("some string ", "other string!");
    }

    function multiDecode() public pure returns (string memory str1, string memory str2) {
        (str1, str2) = abi.decode(multiEncode(), (string, string));
    }

    function multiEncodePacked() public pure returns (bytes memory str) {
        str = abi.encodePacked("some string ", "other string!");
    }

    // ! This doesn't work !!!
    function multiDecodePacked() public pure returns (string memory str1, string memory str2) {
        (str1, str2) = abi.decode(multiEncodePacked(), (string, string));
    }

    // ! This works !!!
    function castMultiEncodedToString() public pure returns (string memory str) {
        str = string(multiEncodePacked());
    }
}
