sudo apt update

sudo apt install -y device-tree-compiler gnupg scala make gcc g++ python3 python3-dev python3-pip autoconf flex bison automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

sudo apt-get update
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
sudo apt-get update
sudo apt-get install -y sbt

sudo pip3 install cocotb==1.5.2
pip3 install psutil sysv_ipc

git clone https://github.com/verilator/verilator.git
cd verilator; git checkout v4.106
autoconf; ./configure; make -j4; sudo make install
cd ..

git clone https://github.com/riscv/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain; git checkout 2021.04.23
./configure --prefix=/opt/riscv; sudo make -j4

