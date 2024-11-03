// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Property} from "./Property.sol";

contract Earth {
    error NAME_OF_WORLD_ALREADY_USED(string);
    error SYMBOL_OF_WORLD_ALREADY_USED(string);

    event WORLD_CREATED(string, string);

    address private _owner;

    mapping(uint256 => Property) private _properties;
    mapping(bytes32 => bool) private _namesUsed;
    mapping(bytes32 => bool) private _symbolsUsed;

    uint256 public worldNumber;

    constructor() {
        _owner = msg.sender;
    }

    modifier _nameNotUsed(string memory _name) {
        bytes32 cp = keccak256(bytes(_name));
        if (_namesUsed[cp] == true) {
            revert NAME_OF_WORLD_ALREADY_USED(_name);
        }
        _namesUsed[cp] = true;
        _;
    }

    modifier _symbolNotUsed(string memory _symbol) {
        bytes32 cp = keccak256(bytes(_symbol));
        if (_symbolsUsed[cp] == true) {
            revert SYMBOL_OF_WORLD_ALREADY_USED(_symbol);
        }
        _symbolsUsed[cp] = true;
        _;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function createWorld(string memory _name, string memory _symbol)
        public
        _nameNotUsed(_name)
        _symbolNotUsed(_symbol)
    {
        worldNumber++;
        Property newWorld = new Property(_name, _symbol);
        _properties[worldNumber] = newWorld;
        emit WORLD_CREATED(_name, _symbol);
    }
}
