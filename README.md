# blockx-node-public
BlockX Public Node for Validators, Node operators, Developers

# how to become a validator - Linux
1. Download blockxd binary file and genesis file.
2. run the following command
    $ RUN_PATH = "/usr/local/sbin/"
    $ mv ./blockxd $RUN_PATH
    $ blockxd init <validator-name> --chain-id blockx_12345-1 --keyring-backend file
    $ blockxd config chain-id blockx_12345-1
    $ blockxd config keyring-backend file
    $ blockxd keys add <your key name> --keyring-backend file
    $ cp ./genesis.json ~/.blockxd/config/genesis.json
3. Get BCX.
4. run the following command
   blockxd tx staking create-validator --amount=100000000000000000000000abcx --pubkey=$(blockxd tendermint show-validator) --moniker=< your node name> --chain-id=blockx_12345-1 --commission-rate="0.05" --commission-max-rate="0.10" --commission-max-change-rate="0.01" --min-self-delegation="1000000" --gas="300000" --gas-prices="1000000000abcx" --from=<your key> --keyring-backend file
5. open config.toml file and set the seeds.
    $ vim ~/.blockxd/config/config.toml
    Find seeds = "" line and modify as seeds = "seed-id@seed-rpc"
6. run the validator
    $ blockxd start --minimum-gas-prices 1000000000abcx
