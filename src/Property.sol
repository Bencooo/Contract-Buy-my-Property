// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract Property is ERC721{
    
    error POSITION_ALREADY_USED(uint256,uint256);

    event PROPERTY_MINTED(uint256,uint256);

    address private _owner;
    
    struct Position{
        uint256 x;
        uint256 y;
    }

    mapping(uint256 => Position) private _positions;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => mapping(uint256 => bool)) private _positionsUsed;

    uint256 public propertyID;

    constructor(string memory _name, string memory _symbol) ERC721(_name,_symbol){
        _owner = msg.sender;
    }

    modifier _positionUsed(uint256 x, uint256 y) {
        if(_positionsUsed[x][y] == true){
            revert POSITION_ALREADY_USED(x,y);
        }
        _positionsUsed[x][y] = true;
        _;
    }

    function mint(uint256 x,uint256 y) public _positionUsed(x,y) {
        propertyID++;
        _mint(msg.sender,propertyID);
        _positions[propertyID] = Position(x,y);
        emit PROPERTY_MINTED(x,y);
    }

    function transfer(address _to,uint256 _propertyID) public {
        transferFrom(msg.sender,_to,_propertyID);
    }

    function getPositionByID(uint256 _id) public view returns (Position memory) {
        return _positions[_id];
    }

    
}
