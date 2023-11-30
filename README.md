## ethernaut-foundry-sols

[ OpenZeppelin/ethernaut ](https://github.com/OpenZeppelin/ethernaut) solutions as foundry tests

### Play

1. Install dependencies

```sh
forge install
```

2. Code your solution in the `test/levels/*.t.sol` file

3. Run the test

```sh
# Test all levels
forge test --silent --summary

# Test specific level
forge test --silent --match-contract=<LEVEL_NAME>
```

### Tips

- To code the solutions, you may need to read [Foundry Book](https://book.getfoundry.sh/).
- In each level you must use the account called player. In Foundry, that may translate to using `vm.startPrank(player)`.
- Some levels require you to code and deploy custom smart contracts.
- First level `Hello Ethernaut` is in `test/levels/Instance.t.sol`, which has been resolved already.
- For solutions of each level, check out to branch `mySol`.

