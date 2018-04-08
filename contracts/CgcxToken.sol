pragma solidity ^0.4.11;
import "./StandardToken.sol";
import "./SafeMath.sol";
import "./Pausable.sol";

contract CgcxToken is SafeMath, StandardToken, Pausable {
    // metadata
    string public constant name = "Cgcx Token";
    string public constant symbol = "CGX";
    uint256 public constant decimals = 18;
    string public version = "1.0";

    // contracts
    address public cgxSaleDeposit        = 0x0053B91E38B207C97CBff06f48a0f7Ab2Dd81449;      // deposit address for Cgcx Sale contract
    address public cgxSeedDeposit        = 0x0083fdFB328fC8D07E2a7933e3013e181F9798Ad;      // deposit address for Cgcx Seed Contributors
    address public cgxPresaleDeposit     = 0x007AB99FBf023Cb41b50AE7D24621729295EdBFA;      // deposit address for Cgcx Presale Contributors
    address public cgxVestingDeposit     = 0x0011349f715cf59F75F0A00185e7B1c36f55C3ab;      // deposit address for Cgcx Vesting for team and advisors
    address public cgxCommunityDeposit   = 0x0097ec8840E682d058b24E6e19E68358d97A6E5C;      // deposit address for Cgcx Marketing, etc
    address public cgxFutureDeposit      = 0x00d1bCbCDE9Ca431f6dd92077dFaE98f94e446e4;      // deposit address for Cgcx Future token sale
    address public cgxInflationDeposit   = 0x00D31206E625F1f30039d1Fa472303E71317870A;      // deposit address for Cgcx Inflation pool

    uint256 public constant cgxSale      = 31603785 * 10**decimals;
    uint256 public constant cgxSeed      = 3566341  * 10**decimals;
    uint256 public constant cgxPreSale   = 22995270 * 10**decimals;
    uint256 public constant cgxVesting   = 28079514 * 10**decimals;
    uint256 public constant cgxCommunity = 10919811 * 10**decimals;
    uint256 public constant cgxFuture    = 58832579 * 10**decimals;
    uint256 public constant cgxInflation = 14624747 * 10**decimals;

    // constructor
    function CgcxToken()
    {
      balances[cgxSaleDeposit]           = cgxSale;                                         // Deposit CGX share
      balances[cgxSeedDeposit]           = cgxSeed;                                         // Deposit CGX share
      balances[cgxPresaleDeposit]        = cgxPreSale;                                      // Deposit CGX future share
      balances[cgxVestingDeposit]        = cgxVesting;                                      // Deposit CGX future share
      balances[cgxCommunityDeposit]      = cgxCommunity;                                    // Deposit CGX future share
      balances[cgxFutureDeposit]         = cgxFuture;                                       // Deposit CGX future share
      balances[cgxInflationDeposit]      = cgxInflation;                                    // Deposit for inflation

      totalSupply = cgxSale + cgxSeed + cgxPreSale + cgxVesting + cgxCommunity + cgxFuture + cgxInflation;

      Transfer(0x0,cgxSaleDeposit,cgxSale);
      Transfer(0x0,cgxSeedDeposit,cgxSeed);
      Transfer(0x0,cgxPresaleDeposit,cgxPreSale);
      Transfer(0x0,cgxVestingDeposit,cgxVesting);
      Transfer(0x0,cgxCommunityDeposit,cgxCommunity);
      Transfer(0x0,cgxFutureDeposit,cgxFuture);
      Transfer(0x0,cgxInflationDeposit,cgxInflation);
   }

  function transfer(address _to, uint _value) whenNotPaused returns (bool success)  {
    return super.transfer(_to,_value);
  }

  function approve(address _spender, uint _value) whenNotPaused returns (bool success)  {
    return super.approve(_spender,_value);
  }
}
