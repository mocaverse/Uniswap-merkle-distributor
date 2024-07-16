// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity =0.8.17;

import {Script, console} from "forge-std/Script.sol";
import {MerkleDistributorWithDeadline} from "./../contracts/MerkleDistributorWithDeadline.sol";

contract DeployMainnet is Script {

    function run() public {

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY_ACTUAL");
        vm.startBroadcast(deployerPrivateKey);

        //note: to be updated
        address token = 0x0;
        bytes32 merkleRoot = 0x0;
        uint256 endTime = 0;

        MerkleDistributorWithDeadline simpleStaking = new MerkleDistributorWithDeadline(token, merkleRoot, endTime);

        vm.stopBroadcast();
    }
}

// forge script script/Deploy.s.sol:DeployMainnet --rpc-url mainnet --broadcast --verify -vvvv --etherscan-api-key mainnet


contract TransferOwnership is Script {

    function run() public {

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY_ACTUAL");
        vm.startBroadcast(deployerPrivateKey);

        // note: to update
        address distributor = 0x0;
        address newOwner = 0x0;
        
        MerkleDistributorWithDeadline(distributor).transferOwnership(newOwner);

        vm.stopBroadcast();
    }
}

// forge script script/Deploy.s.sol:DeployMainnet --rpc-url mainnet --broadcast --verify -vvvv --etherscan-api-key mainnet