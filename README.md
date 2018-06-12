# Second generation scaletest

This repo generates the chains and provides the nessary files to run a Notary Node for TXSCL chains

## Instructions
For notary nodes, you need to do the usual things but a few steps are diffrent.
You need to install komodo from libscott branch momo. The buildkomodo.sh script will do this for you if using momo branch of this repo.

`./buildkomodo.sh`

Install nanomsg

`./installnanomsg.sh`

Install SuperNET from jl777 branch

`git clone https://github.com/jl777/SuperNET.git -b jl777 ~/SuperNET`

You need the usual wp_7776 file, there is one in this repo that will source your passphrase from `passphrase.txt`

`cp wp_7776 ~/SuperNET/iguana`

You will also need to: `cp m_notary_scale ~/SuperNET/iguana/`

`nano ~/SuperNET/iguana/passphrase.txt`

`passphrase=yourpassphrase`

Set your pubkey.txt

`nano ~/komodo/src/pubkey.txt`

Copy your pubkey.txt to SuperNET/iguana dir

`cp ~/komodo/src/pubkey.txt ~/SuperNET/iguana/`

Launch the chains

`cd ~/komodo/src/`

`source pubkey.txt;./komodod -notary -pubkey=$pubkey`

`./sync_assets`

Once you have all 64 TXSCL chains running and synced. Import your private key:

`./assets-cli importprivkey "private key"`

`cd ~/komodo/src`

`komodo-cli importprivkey "private key"`

Once this is done and you have a balance in your address, launch m_notary_scale.

`cd ~/SuperNET/iguana`

`./m_notary_scale`

Once this has loaded, do:

`cd ~/ScaleTestV2`

`./splitfunds`

Everything should be working.
