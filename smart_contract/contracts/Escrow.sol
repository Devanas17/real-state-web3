// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

interface IERC721 {
    function transferFrom(address _from, address _to, uint256 _id) external;
}

contract Escrow {
    address public nftAddress;
    address payable public seller;
    address public inspector;
    address public lender;

    constructor(
        address _nftAddress,
        address payable _seller,
        address _inspector,
        address _lender
    ) {
        nftAddress = _nftAddress;
        seller = _seller;
        inspector = _inspector;
        lender = _lender;
    }

    mapping(uint256 => bool) public isListed;
    mapping(uint256 => uint256) public purchasePrice;
    mapping(uint256 => uint256) public escrowAmount;
    mapping(uint256 => address) public buyer;
    mapping(uint256 => bool) public inspectionPassed;
    mapping(uint256 => mapping(address => bool)) public approval;

    function lists(
        uint256 _nftId,
        address _buyer,
        uint256 _purchasePrice,
        uint256 _escrowAmount
    ) public {
        IERC721(nftAddress).transferFrom((msg.sender), address(this), _nftId);
        isListed[_nftId] = true;
        buyer[_nftId] = _buyer;
        purchasePrice[_nftId] = _purchasePrice;
        escrowAmount[_nftId] = _escrowAmount;
    }
}
