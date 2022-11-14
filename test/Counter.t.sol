// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";


contract CounterTest is Test {
    uint256 challengeFork;

    address TRANSIENT_LOAN =  0x34950D5CB9A785262b01c795f9b986E9697767ec;

    function setUp() public {
        challengeFork = vm.createFork("https://rpc.eip1153.com/");
    }

    function test() public {
        console.log("Hello world");
        vm.selectFork(challengeFork);
        // console.logBytes(address(0x34950D5CB9A785262b01c795f9b986E9697767ec).code);

        (bool success,bytes memory data) = TRANSIENT_LOAN.call(hex"2a514f1501710c6ec584bc805ad003fe8f94153053cb2952f923c1bea1e106f24d2d620c");
        console.logBytes(data);


    }
}
