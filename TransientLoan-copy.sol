// Decompiled by library.dedaub.com
// 2022.11.10 19:26 UTC

// Data structures and variables inferred from the use of storage instructions
uint256 stor_736f6c76657273; // STORAGE[0x736f6c76657273]
// "0xe97dcb62": "enter()",
function enter() public payable { 
    T[0] = keccak256(msg.sender,address(this));
}
// "0xe2e52ec1": "write(bytes32,bytes32)"
function write(bytes32 varg0, bytes32 varg1) public payable { 
    // 0x7735940000 (512_000_000_000) 2_000_000_000
    MEM[0] = 0x7735940000;
    v0 = dataCopy(0,0x20,0,0);
    hash_varg0 = ripemd160hash(varg0)
    require(hash_varg0 >> 160 == 0)
    require(0x77359400 < varg0);
    T[varg0] = varg1;
}
// "0xdfab6ef9": "startLoan()",
function 0xdfab6ef9() public payable { 
    require(T[0] == 0 )
    require(S[keccak256(msg.sender)] == 0)
    T[0] = msg.sender
    require(msg.sender.CALL("0x0c657eb0")) // bankroll()
    // loop here
    require( 2 * T[t] + t + 1 != t + 1 )
    currentBal = T[t+2].STATICCALL("balanceOf",address(this))
    require(currentBal >= T[t+1],"Repay your debt!")
}
// "0x6c665a55": "borrow(address,uint256,address)",
function borrow(address varg0, uint256 varg1, address varg2) public payable { 
    (DoveToken_v0, amountToBorrow_v1, LoanRecipient_v2) = (varg0,varg1,varg2) // calldata is tightly packed
    require(amountToBorrow_v1 <= 10);
    require( T[0] == msg.sender,"Not the Borrower!");
    t= timestamp()
    k = T[t];
    T[t] += 1
    balance = DoveToken_v0.balanceOf(address(this)); 

    T[2k+t+1] = balance
    // T[2k+t+2] = DoveToken_v0
    T[k+1] = DoveToken_v0

    DoveToken_v0.transfer(LoanRecipient_v2,amountToBorrow_v1)
}
// loan fallback "0x2a514f15": "atlas(uint256,uint256,uint256)"
function 0x2a514f15(uint256 varg0) public payable { 
    MEM[0] = msg.sender;
    MEM[0x20] = tx.origin;
    require(uint32(keccak256(MEM[0,0x40])) == uint32(varg0));
    MEM[0x20] = 0;
    require(T[0] == msg.sender,"Not the borrower!")
    t_0 = T[0]
    require(varg0.DELEGATECALL())
    require( t_0 == T[0])
}

// 0x5bcb2fc6
function submit() public payable { 
    require(0x63763cbb > block.timestamp);
    require(T[0:] == 0 ,"Repay your debt!");

    require( Dove_Addr.STATICCALL("balanceOf",msg.sender) );
    require(success)
    DOVE_balance_caller = M[0x60:]
    require(DOVE_balance_caller > 0)

    require(Dove_Addr.CALL("transferFrom",msg.sender,address(this),DOVE_balance_caller));

    S[keccak256(tx.origin)] == 1
    S[keccak256(msg.sender)] == 1

    S["solvers"] += 1

    S[S["solvers"] + "solvers"] = tx.origin


}

function isSolved() public payable { 
    // MEM[RETURNDATASIZE()] = msg.sender;
    // return STORAGE[keccak256(MEM[0 len 32])];
    return STORAGE[keccak256(msg.sender)];
}
// solvers()
function 0xe3b06401() public payable { 
    MEM[RETURNDATASIZE()] = 32;
    MEM[0x20] = stor_736f6c76657273;
    v0 = v1 = 'solvert';
    // 0     0x20                     0x40
    // |--32 --|--stor_736f6c76657273 --| 
    while (v0 <= 'solvers' + stor_736f6c76657273) {
        MEM[MSIZE()] = STORAGE[v0];
        v0 += 1;
    }
    return MEM[(RETURNDATASIZE()) len (MSIZE())];
}
// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    if (0x6c665a55 == function_selector >> 224) {
        borrow(address,uint256,address); // ✅
    } else if (0xe97dcb62 == function_selector >> 224) {
        enter(); // ✅
    } else if (0xe2e52ec1 == function_selector >> 224) {
        write(bytes32,bytes32);
    } else if (0xdfab6ef9 == function_selector >> 224) {
        // "startLoan()"
        0xdfab6ef9();
    } else if (0x2a514f15 == function_selector >> 224) {
        // "atlas(uint256,uint256,uint256)"
        0x2a514f15(); // ✅
    } else if (0x5bcb2fc6 == function_selector >> 224) {
        submit(); // ✅
    } else if (0x64d98f6e == function_selector >> 224) {
        isSolved(); // ✅
    } else {
        require(0xe3b06401 == function_selector >> 224RETURNDATASIZE(), RETURNDATASIZE());
        // solvers()
        0xe3b06401(); // ✅
    }
}

/*

    "0x2a514f15": "atlas(uint256,uint256,uint256)",
    "0x6c665a55": "borrow(address,uint256,address)",
    "0xe97dcb62": "enter()",
    "0x64d98f6e": "isSolved()",
    "0xdfab6ef9": "startLoan()",
    "0x5bcb2fc6": "submit()",
    "0xe2e52ec1": "write(bytes32,bytes32)"


0xe3b0640100000000000000000000000000000000000000000000000000000000

1710c6ec584bc805ad003fe8f94153053cb2952f923c1bea1e106f28cd8a5d6

0000000000000000000000000000000000000000000000000000000000000020
0000000000000000000000000000000000000000000000000000000000000006
000000000000000000000000b49bf876be26435b6fae1ef42c3c82c5867fa149
000000000000000000000000349f83f229226039555213ec7caba378d1caa7bf
0000000000000000000000004fab15e52e27958abb5add243cdb2fa6d18f2081
000000000000000000000000ba7216c8d4220330dc3c81811b13aa7e3b95573c
0000000000000000000000009348ef8214b673b5dbe38c0112c48fef219de1a8
000000000000000000000000deadc81d8040059809520aabd756b4ada3b3e944