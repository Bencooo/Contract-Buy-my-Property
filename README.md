# 🌍 World & Proxy Contracts

## **World Contract**

🛠 **World.sol** is a semi-ERC721 contract that stores all properties of the **World** game.

## **Proxy Contract**

🔄 **Proxy.sol** is the contract used to interact with **World.sol**. All operations performed through **Proxy** are stored in its storage, allowing you to **change the delegation address without losing registered data**.

---

## **🚀 Foundry - Ethereum Development Toolkit**

**Foundry** is a blazing-fast, portable, and modular toolkit for Ethereum application development, written in **Rust**.

### **📌 Foundry consists of:**

- 🏗 **Forge**: Ethereum testing framework (similar to **Truffle, Hardhat, and DappTools**).
- 🔧 **Cast**: A powerful tool for interacting with smart contracts, sending transactions, and fetching on-chain data.
- ⚡ **Anvil**: A local Ethereum node (like **Ganache** or **Hardhat Network**).
- 🛠 **Chisel**: A fast and utilitarian Solidity REPL.

📖 **Complete Documentation:** [Foundry Book](https://book.getfoundry.sh/)

---

## **🚀 Useful Commands**

### **📌 Build the project**
```sh
forge build
```

### **📌 Run tests** 🧪
```sh
forge test
```

### **📌 Format Solidity code** 🎨
```sh
forge fmt
```

### **📌 Analyze gas costs** ⛽
```sh
forge snapshot
```

### **📌 Start a local node (Anvil)** ⚙️
```sh
anvil
```

### **📌 Deploy a contract** 🚀
```sh
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### **📌 Use Cast** 🛠
```sh
cast <subcommand>
```

### **📌 Get help on Foundry** 📚
```sh
forge --help
anvil --help
cast --help
```

---

## **💡 Final Notes**
✅ **Modularity & Speed**: Foundry is designed to be faster and more flexible than traditional alternatives.
✅ **Interoperability**: Fully compatible with existing Solidity tools.
✅ **Developer Experience**: Intuitive API and comprehensive documentation.

🔥 **Develop, test, and deploy faster with Foundry!**
