// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Proxy} from "../src/Proxy.sol";
import {World} from "../src/World.sol";
import {WorldV2} from "../src/WorldV2.sol";

contract DeployProxy is Script {
    function run() external {
        vm.startBroadcast();

        World world = new World("Testing", "TEST");
        console.log("World deployed at:", address(world));

        Proxy proxy = new Proxy();
        console.log("Proxy deployed at:", address(proxy));

        proxy.setDelegation(address(world));
        console.log("Proxy set to delegate to World at:", address(world));

        // Mint une propriété
        //world.mint(1, 2);

        // Récupère la valeur numberOfProperty
        uint256 totalProperties = world.getNumberOfProperties();
        console.log("Nombre total de proprio mint :", totalProperties);

        // (Optionnel) Déploiement de WorldV2
        /*WorldV2 worldV2 = new WorldV2();
        console.log("WorldV2 deployed at:", address(worldV2));*/

        vm.stopBroadcast();
    }
}
