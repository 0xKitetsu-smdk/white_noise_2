// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./Attacker.sol";

contract CounterTest is Test {
    uint256 challengeFork;

    address TRANSIENT_LOAN =  0x34950D5CB9A785262b01c795f9b986E9697767ec;

    address MY_ADDR = 0xC6868e56b7BeCd885102fdaF33137F1712Bcf1d7;

    Attacker ATTACKER;

    function setUp() public {
        ATTACKER = new Attacker();

        console.log("Attacker address ",address(ATTACKER));

        // challengeFork = vm.createFork("https://127.0.0.1:8545/");
    }

    function test() public {
        console.log("Hello world");
        bool success;bytes memory data;
        // vm.selectFork(challengeFork);
        (success,data) = TRANSIENT_LOAN.call(hex"e3b06401"); // solvers
        address[] memory solvers = abi.decode(data,(address[]));
        console.log("solved by ",solvers.length);
        // vm.prank(0xdeadC81d8040059809520AaBD756B4aDA3b3E944);
        vm.prank(MY_ADDR);
        (success,data) = TRANSIENT_LOAN.call(hex"64d98f6e"); // isSolved
        bool isSolved = abi.decode(data,(bool));
        console.log("isSolved  ",isSolved);

        // ATTACKER.start();

        // 6c665a5599bB517A6f36913246a2B3e1bc34dA77335574560000000000000000000000000000000000000000000000000000000000000001C6868e56b7BeCd885102fdaF33137F1712Bcf1d7



    }
}
