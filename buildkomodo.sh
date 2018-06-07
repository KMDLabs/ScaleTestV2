#Install Deps
sudo apt-get update
sudo apt-get -y install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-openssl-dev bsdmainutils automake curl
#Install Komodo
cd ~
git clone https://github.com/libscott/komodo.git -b momo
cd komodo
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
