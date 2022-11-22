// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}
/// @title IFlashLoanReceiver
/// @notice Interface for contracts that wish to receive flashloans from a [TransientLoan] contract.
interface IFlashLoanReceiver {
    /// @notice This function is executed by the [TransientLoan] contract after the transient borrower
    /// is set. During its execution and its sub callframes, this contract can call [TransientLoan]'s `borrow`
    /// function to borrow tokens. All borrowed tokens must be returned by the end of this function's execution,
    /// or the call will revert.
    function bankroll() external;
}

/// @notice TransientLoan contract interface
interface ITransientLoan {
    /// @notice Initiate a flash loan. Enables calls to `borrow` within the same execution.
    function startLoan() external;

    /// @notice Borrow a token from the [TransientLoan] contract.
    function borrow(address token, uint256 amount, address to) external;

    function enter() external;

    function write(bytes32 slot, bytes32 value) external;

    function atlas(uint256, uint256, uint256) external;

    /// @notice Transfer captured tokens in exchange for a spot on the reward NFT whitelist.
    function submit() external;

    /// @notice Check whether or not the calling EOA has solved the challenge.
    function isSolved() external view returns (bool);
}
contract Attacker is IFlashLoanReceiver{
    event Log(string message);
    event Log(string message,uint balance);
    ITransientLoan TRANSIENT_LOAN = ITransientLoan(0x34950D5CB9A785262b01c795f9b986E9697767ec);

    IERC20 DOVE_TKN = IERC20(0x99bB517A6f36913246a2B3e1bc34dA7733557456);

    function getSolvers() external view returns (address[] memory solvers){
        (bool success,bytes memory data) = address(TRANSIENT_LOAN).staticcall(hex"e3b06401"); // solvers
        solvers = abi.decode(data,(address[]));
    }

    function start() external {
        emit Log("Attacker::start()#",block.timestamp);
        TRANSIENT_LOAN.startLoan();
        emit Log("Attacker::start()# startLoan ended");
        emit Log("Attacker::start()# Dove_balanceof this",DOVE_TKN.balanceOf(address(this)));
        // borrow
        // address(TRANSIENT_LOAN).call(hex"6c665a5599bB517A6f36913246a2B3e1bc34dA77335574560000000000000000000000000000000000000000000000000000000000000001C6868e56b7BeCd885102fdaF33137F1712Bcf1d7");
    }

    function bankroll() external {
        emit Log("Attacker::bankroll()#Requesting FlashLoan");
        uint amountToBorrow = 5;
        address(TRANSIENT_LOAN).call(abi.encodePacked(ITransientLoan.borrow.selector,address(DOVE_TKN),amountToBorrow,address(this) ));
        emit Log("Attacker::bankroll()#FlashLoan received. Dove_balance(this)",DOVE_TKN.balanceOf(address(this)));
        // bytes32 targetAddr = abi.encodePacked(keccak256(address(this),tx.origin));
        // TRANSIENT_LOAN.atlas(targetAddr,0,0);

        emit Log("Attacker::bankroll()#Repaying FlashLoan");
        DOVE_TKN.transfer(msg.sender, amountToBorrow);
        emit Log("Attacker::bankroll()#FlashLoan Repaid");
    }

}