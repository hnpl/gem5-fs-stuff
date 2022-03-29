echo "helloworld" | sudo apt-get update
echo "helloworld" | sudo apt-get upgrade
echo "helloworld" | \
    sudo apt-get install -y binutils build-essential libtool texinfo gzip zip \
         unzip patchutils curl git make cmake ninja-build automake bison flex \
         gperf grep sed gawk bc zlib1g-dev libexpat1-dev libmpc-dev \
         libglib2.0-dev libfdt-dev libpixman-1-dev

mkdir -p /riscv/_install
cd /riscv
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain -j`nproc`
cd /riscv/riscv-gnu-toolchain
git checkout --recurse-submodules 051b9f7ddb7d136777505ea19c70a41926842b96
./configure --prefix=/riscv/_install --enable-multilib
make linux -j`nproc`
make install
