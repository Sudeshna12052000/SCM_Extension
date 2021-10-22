pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
contract ConsultationContract {

    // Ether stored in contract address
    uint256 public contractBalance;


    struct retailerContract {
        string retailerPublicKey;
        string supplierPublicKey;
        uint256 ret_key;
        uint256 supplier_key;
    }

    // agro-Farmer contract mappings
    mapping (string => retailerContract) retailer;
    string[] keyValueArray = ["dummy"];
    

    // set and get functions for retailer
    function setRetailer(string memory keyValue, string memory retailerPublicKey, string memory supplierPublicKey, uint256 ret_key,uint256 supplier_key
    ) internal {
        retailerContract memory contractObj =  retailerContract(retailerPublicKey, supplierPublicKey, ret_key, supplier_key);
        retailer[keyValue] = contractObj;
    }

    function getRetailer(string memory keyValue) public view returns (retailerContract memory) {
        return retailer[keyValue];
    }

    // retailer's money transfer to contract
    function bookRetailerContract (string calldata keyValue, string calldata retailerPublicKey, string calldata supplierPublicKey, uint256 ret_key,uint256 supplier_key) external payable {
        setRetailer(keyValue, retailerPublicKey, supplierPublicKey, ret_key, supplier_key);
        keyValueArray.push(keyValue);
        contractBalance=address(this).balance;
    }
    function getAllKeyValue() public view returns(string[] memory){
        return keyValueArray;
    }


    // get retailer's transfer from contractBalance
    function getContractBalance() public view returns (uint256) {
        return contractBalance;
    }
}
