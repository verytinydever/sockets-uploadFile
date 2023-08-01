systemctl stop blockxd.service

rm -rf $HOME/.blockxd
rm $HOME/go/bin/blockxd
rm /etc/systemd/system/blockxd.service

cp blockxd $HOME/go/bin

blockxd config chain-id blockx_50-1
blockxd config keyring-backend file
blockxd init seednode2 --chain-id blockx_50-1 --keyring-backend file

cp genesis.json $HOME/.blockxd/config

# BINARY_PATH="$(which blockxd)"

# sed -i "s|ExecStart=blockxd start|ExecStart=$BINARY_PATH start|g" blockxd.service
cp blockxd.service /etc/systemd/system
cd $HOME/.blockxd/config

# for seed nodes, run following. need to change persistent_peers
# sed -i 's/seed_mode = false/seed_mode = true/g' config.toml
# sed -i 's/persistent_peers = \"\"/persistent_peers = \"8339668165d1fe98f24c042e7a61fd7c6aa7a1aa@142.93.202.64:26656,23b12388a6922cb3bb7b72b8b7cc7429b7444f80@142.93.3.163:26656,85f8e76274cb95d9dde3487d5b8547be27f58192@167.99.12.133:26656\"/g' config.toml

# for non-seed nodes, run following.
sed -i 's/seeds = \"\"/seeds = \"3bdc1c076399ee1090b1b7efa0474ce1a1cb191a@146.190.153.165:26656,49a5a62543f5fec60db42b00d9ebe192c3185e15@146.190.157.123:26656\"/g' config.toml

systemctl daemon-reload
systemctl start blockxd.service
