// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract SmallProxy is Proxy {
    bytes32 private constant IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    receive() external payable {
        _fallback();
    }

    function setImplementation(address _newImplementation) public {
        assembly {
            sstore(IMPLEMENTATION_SLOT, _newImplementation)
        }
    }

    function _implementation() internal view override returns (address implementationAddress) {
        assembly {
            implementationAddress := sload(IMPLEMENTATION_SLOT)
        }
    }

    function getDataToTransact(uint256 _numberToUpdate) public pure returns (bytes memory) {
        return abi.encodeWithSignature("setValue(uint256)", _numberToUpdate);
    }

    function readStorage() public view returns (uint256 valueAtStorageSlot0) {
        assembly {
            valueAtStorageSlot0 := sload(0)
        }
    }
}

contract ImplementationA {
    uint256 public s_value;

    function setValue(uint256 _newValue) public {
        s_value = _newValue;
    }
}

contract ImplementationB {
    uint256 public s_value;

    function setValue(uint256 _newValue) public {
        s_value = _newValue + 2;
    }
}
