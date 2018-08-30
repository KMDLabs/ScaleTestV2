#!/bin/bash
cd ~/.komodo
# Backup wallet.dat and conf files
find . -name '*.conf' -o -name wallet.dat | tar -cvf wallets.tar -T -
# Remove all Chain DATA for TXSCL cluster chains
rm -rf TXSCL*
# Put the wallets and conf files back
tar -xvf wallets.tar
