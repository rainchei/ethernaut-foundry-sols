# ethernaut-foundry-sols

Solutions for [OpenZeppelin/ethernaut](https://github.com/OpenZeppelin/ethernaut) built with [Foundry](https://getfoundry.sh/).

Each [Ethernaut](https://ethernaut.openzeppelin.com/) challenge is a smart contract that must be "hacked" to pass. This repository provides a reproducible, local testing harness so you can write and verify your exploit as a Foundry test.

## Overview

| | |
|---|---|
| **Build tool** | [Foundry](https://getfoundry.sh/) (Rust-based Solidity framework) |
| **Test framework** | [forge-std](https://github.com/foundry-rs/forge-std) |
| **Challenges covered** | 30 Ethernaut levels |
| **Solidity version** | `^0.8.0` |
| **License** | MIT |

## Repository Structure

```
ethernaut-foundry-sols/
├── .github/
│   └── workflows/
│       └── test.yml          # CI workflow (manual trigger, forge build + test)
├── lib/                      # Git submodule dependencies
│   ├── ethernaut/            # OpenZeppelin Ethernaut challenge contracts
│   ├── forge-std/            # Foundry standard library
│   └── openzeppelin-contracts/ # OpenZeppelin contracts (transparent proxy, etc.)
├── test/
│   ├── SetUpLevelTest.sol    # Abstract base contract for all level tests
│   ├── helpers/              # Custom Level + Factory contracts (for levels not in ethernaut lib)
│   │   ├── AlienCodex.sol / AlienCodexFactory.sol
│   │   ├── Fallout.sol / FalloutFactory.sol
│   │   ├── Motorbike.sol / MotorbikeFactory.sol
│   │   ├── Reentrance.sol / ReentranceFactory.sol
│   │   └── Token.sol / TokenFactory.sol
│   ├── levels/               # One *.t.sol file per Ethernaut level
│   │   └── *.t.sol           # (30 files — see full list below)
│   └── utils/
│       └── TestUtils.sol     # Helpers: create/submit level instances, event parsing
├── foundry.toml              # Foundry project configuration
├── remappings.txt            # Import path remappings
└── .gitmodules               # Submodule declarations
```

## Levels Covered

| # | Contract | Level name |
|---|---|---|
| 0 | `Instance.t.sol` | Hello Ethernaut |
| 1 | `Fallback.t.sol` | Fallback |
| 2 | `Fallout.t.sol` | Fallout |
| 3 | `CoinFlip.t.sol` | Coin Flip |
| 4 | `Telephone.t.sol` | Telephone |
| 5 | `Token.t.sol` | Token |
| 6 | `Delegation.t.sol` | Delegation |
| 7 | `Force.t.sol` | Force |
| 8 | `Vault.t.sol` | Vault |
| 9 | `King.t.sol` | King |
| 10 | `Reentrance.t.sol` | Re-entrancy |
| 11 | `Elevator.t.sol` | Elevator |
| 12 | `Privacy.t.sol` | Privacy |
| 13 | `GatekeeperOne.t.sol` | Gatekeeper One |
| 14 | `GatekeeperTwo.t.sol` | Gatekeeper Two |
| 15 | `NaughtCoin.t.sol` | Naught Coin |
| 16 | `Preservation.t.sol` | Preservation |
| 17 | `Recovery.t.sol` | Recovery |
| 18 | `MagicNum.t.sol` | Magic Number |
| 19 | `AlienCodex.t.sol` | Alien Codex |
| 20 | `Denial.t.sol` | Denial |
| 21 | `Shop.t.sol` | Shop |
| 22 | `Dex.t.sol` | Dex |
| 23 | `DexTwo.t.sol` | Dex Two |
| 24 | `PuzzleWallet.t.sol` | Puzzle Wallet |
| 25 | `Motorbike.t.sol` | Motorbike |
| 26 | `DoubleEntryPoint.t.sol` | Double Entry Point |
| 27 | `GoodSamaritan.t.sol` | Good Samaritan |
| 28 | `GatekeeperThree.t.sol` | Gatekeeper Three |
| 29 | `Switch.t.sol` | Switch |

## Architecture

### Test lifecycle

All level tests extend the abstract `SetUpLevelTest` contract. Foundry automatically calls `setUp()` before each test function.

```
SetUpLevelTest (abstract)
│
├── setUp() [virtual]          ← override per level: register factory, write exploit
│   ├── getEthernautWithStatsProxy()   creates Ethernaut + Statistics proxy
│   ├── vm.deriveKey(mnemonic, 0)      deterministic player address
│   ├── vm.deal(player, ...)           fund player account
│   ├── ethernaut.registerLevel(...)   register the level factory
│   └── createLevelInstance(...)       deploy the challenge contract
│
└── test_SubmitLevel() [final] ← verifies the level is solved via Ethernaut events
```

### Writing a solution

Open the corresponding file in `test/levels/` and add your exploit code inside `setUp()` between the marked comments:

```solidity
contract FallbackLevel is SetUpLevelTest {
    Fallback internal challengeInstance;

    function setUp() public override {
        playerBalance = 1 ether;
        instanceBalance = 0.001 ether;
        level = address(new FallbackFactory());
        super.setUp();  // deploys the challenge contract
        challengeInstance = Fallback(payable(instance));

        /** CODE YOUR SOLUTION HERE */
        vm.startPrank(player);
        // ... your exploit ...
        vm.stopPrank();
    }
}
```

`test_SubmitLevel()` is inherited — it submits the instance to Ethernaut and asserts that the `LevelCompletedLog` event is emitted, confirming the level is solved.

### Helpers

Five levels (`AlienCodex`, `Fallout`, `Motorbike`, `Reentrance`, `Token`) use challenge contracts that have been removed from or altered in the upstream Ethernaut repository. Custom reimplementations of the vulnerable contracts and their factories live in `test/helpers/` and are used transparently by the corresponding test files.

## Getting Started

### Prerequisites

- [Foundry](https://getfoundry.sh/) — install with:

  ```sh
  curl -L https://foundry.paradigm.xyz | bash
  foundryup
  ```

### Installation

```sh
git clone https://github.com/rainchei/ethernaut-foundry-sols
cd ethernaut-foundry-sols
forge install
```

## Play

1. Open the level test file you want to solve, e.g. `test/levels/Vault.t.sol`.

2. Add your exploit code in the `setUp()` function where indicated.

3. Run the test for that level:

   ```sh
   forge test --silent --match-contract=VaultLevel
   ```

4. Run all levels at once:

   ```sh
   forge test --silent --summary
   ```

## Tips

- Read the [Foundry Book](https://book.getfoundry.sh/) for cheatcode documentation (`vm.startPrank`, `vm.load`, `vm.deal`, etc.).
- You must perform all actions as `player` using `vm.startPrank(player)` / `vm.stopPrank()`.
- Most levels require deploying a custom attacker contract inside `setUp()`.
- The first level (Hello Ethernaut) is in `test/levels/Instance.t.sol`.
- Use `forge test -vvvv --match-contract=<LEVEL_NAME>` for full trace output when debugging.
