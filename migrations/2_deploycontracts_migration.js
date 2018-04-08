var SCRToken = artifacts.require("./SCRToken.sol");
var CGXToken = artifacts.require("./CgcxToken.sol");
var CgcxSaleContract = artifacts.require("./CgcxSaleContract.sol");

var _cgxFundDeposit = "0x3568ad428a3878a8fa55d41fef163891999ce2e9",
    _cgxFutureDeposit = "0xe46b854e221807c2319de20f38700d00133264ce",
    _cgxPresaleDeposit = "0xc28bab8b8c4d348945ce0e071f015caea139c92a",
    _cgxInflationDeposit = "0xf7fcf34e057a70bfb490755d1f5d68ead901472e"

var _ethFundDeposit = "0xbf4dd8b8b9f2c88493865cd62b6757fcb30b6615",
    _CGXtoken,
    _fundingStartTime = 1501643908,
    duration = 20;

var CGXAddress, SCRAddress, SaleContractAddress;

module.exports = function(deployer){
	// console.log("Deploying CGX");
	deployer.deploy(CGXToken, _cgxFundDeposit, _cgxFutureDeposit, _cgxPresaleDeposit, _cgxInflationDeposit).then(function() {
		CGXAddress = CGXToken.address;
		console.log("CGX address = ", CGXAddress);
		return deployer.deploy(CgcxSaleContract, _ethFundDeposit, _cgxFundDeposit, CGXAddress, _fundingStartTime, duration).then(function(instance2){
			console.log("Deployed CgcxSaleContract");
	  		console.log("Sale Contract address = ", CgcxSaleContract.address);
		});
  	});
}
