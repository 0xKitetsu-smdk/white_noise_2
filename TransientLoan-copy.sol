// Decompiled by library.dedaub.com
// 2022.11.10 19:26 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_736f6c76657273; // STORAGE[0x736f6c76657273]

function enter() public payable { 
}

function write(bytes32 varg0, bytes32 varg1) public payable { 
    MEM[RETURNDATASIZE()] = 0x7735940000;
    v0 = dataCopy(MEM[(RETURNDATASIZE()) len (MSIZE())], MEM[(RETURNDATASIZE()) len (RETURNDATASIZE())]);
    MEM[RETURNDATASIZE()] = varg0;
    v1 = ripemd160hash(MEM[(RETURNDATASIZE()) len (MSIZE())], MEM[(RETURNDATASIZE()) len (MSIZE())]);
    if (v1) {
        if (!(MEM[0] >> 160)) {
            require(0x77359400 < varg0RETURNDATASIZE(), RETURNDATASIZE());
            // exit;
            T[varg0] = varg1;
        }
    }
    revert(0, RETURNDATASIZE());
}

function 0xdfab6ef9() public payable { 
}

function 0x2a514f15(uint256 varg0) public payable { 
    MEM[RETURNDATASIZE()] = msg.sender;
    MEM[MSIZE()] = tx.origin;
    require(uint32(keccak256(MEM[(RETURNDATASIZE()) len (MSIZE())])) == uint32(varg0)RETURNDATASIZE(), RETURNDATASIZE());
    MEM[32] = RETURNDATASIZE();
}

function submit() public payable { 
    require(0x63763cbb > block.timestamp);
}

function isSolved() public payable { 
    MEM[RETURNDATASIZE()] = msg.sender;
    return STORAGE[keccak256(MEM[0 len 32])];
}

function 0xe3b06401() public payable { 
    MEM[RETURNDATASIZE()] = 32;
    MEM[MSIZE()] = stor_736f6c76657273;
    v0 = v1 = 'solvert';
    while (v0 <= 'solvers' + stor_736f6c76657273) {
        MEM[MSIZE()] = STORAGE[v0];
        v0 += 1;
    }
    return MEM[(RETURNDATASIZE()) len (MSIZE())];
}

function borrow(address varg0, uint256 varg1, address varg2) public payable { 
    require(varg1 <= 10);
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    if (0x6c665a55 == function_selector >> 224) {
        borrow(address,uint256,address);
    } else if (0xe97dcb62 == function_selector >> 224) {
        enter();
    } else if (0xe2e52ec1 == function_selector >> 224) {
        write(bytes32,bytes32);
    } else if (0xdfab6ef9 == function_selector >> 224) {
        0xdfab6ef9();
    } else if (0x2a514f15 == function_selector >> 224) {
        0x2a514f15();
    } else if (0x5bcb2fc6 == function_selector >> 224) {
        submit();
    } else if (0x64d98f6e == function_selector >> 224) {
        isSolved();
    } else {
        require(0xe3b06401 == function_selector >> 224RETURNDATASIZE(), RETURNDATASIZE());
        0xe3b06401();
    }
}

/*{
    "0x2a514f15": "atlas(uint256,uint256,uint256)",
    "0x6c665a55": "borrow(address,uint256,address)",
    "0xe97dcb62": "enter()",
    "0x64d98f6e": "isSolved()",
    "0xdfab6ef9": "startLoan()",
    "0x5bcb2fc6": "submit()",
    "0xe2e52ec1": "write(bytes32,bytes32)"
}*/

0xe3b0640100000000000000000000000000000000000000000000000000000000

