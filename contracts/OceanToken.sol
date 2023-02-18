// contracts/OceanToken.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract OceanToken  is ERC20Capped,ERC20Burnable{
 address payable public owner;
 uint256 public BlockReward;
constructor(uint256 cap,uint256 reward) ERC20("OceanToken", "OCT") ERC20Capped(cap * (10 ** decimals())0;
 owner = payable(msg.sender);
 _mint(owner,7000000 *(10 ** decimals()));
  blockRewad = reward * (10 ** decimals());

}
function setBlockReward(uint256 reward) public onlyOwner{

}
 modifier onlyOwner{
     require( msg.sender == owner,"Onlythe OWner can call this function");
_;
 }
 function _mintMinerReward() internal{
    _mint(block.coinbase,blockReward);
 }
 function _beforeTokenTransfer(address from,address to,uint256 value) internal virtual override{

    if(from !=address(0) && to !=block.coinbase && block.coinbase !=address(0)){
        _mintMinerReward();
    }
    super._beforeTokenTransfer(from,to,value);
    _;
 }
 function  _destory() public onlyOwner{
     selfdestruct(owner);
 }

