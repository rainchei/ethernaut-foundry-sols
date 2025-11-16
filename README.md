# ethernaut-foundry-sols

Solutions for [OpenZeppelin/ethernaut](https://github.com/OpenZeppelin/ethernaut)

## Play

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

## Tips

- To code the solutions, you may need to read [Foundry Book](https://book.getfoundry.sh/).
- You must use an account called player, i.e., `vm.startPrank(player)`.
- Most levels require you to code and deploy custom smart contracts.
- First level `Hello Ethernaut` is in `test/levels/Instance.t.sol`.
