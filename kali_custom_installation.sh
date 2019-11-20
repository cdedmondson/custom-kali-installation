#!/bin/sh

# Install wine
dpkg --add-architecture i386 
apt-get update 
apt-get install wine 
apt-get install wine32 

# Check if wine installed correctly
wine --version

# Install curl
apt-get install curl 

# Install ghidra
mkdir /$HOME/ghidra
cd ghidra
wget https://ghidra-sre.org/ghidra_9.1_PUBLIC_20191023.zip
unzip ghidra_9.1_PUBLIC_20191023.zip
rm ghidra_9.1_PUBLIC_20191023.zip
cd ~

# Install terminator
apt-get install terminator 

# Install mingw-w64 cross compiler
apt-get install mingw-w64 

# Install rinetd port-forwarding tool
apt-get install rinetd 

# Install atom code editor
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
apt-get update 
apt-get install atom

# Install enum4linux
apt-get install enum4linux

# Install gobuster
apt-get install gobuster 

# Create alias for "ls" and append to .bashrc
echo alias ls="\"ls --color=always -rthla"\" >> ~/.bashrc

# Install pure-ftpd
apt-get install pure-ftpd

# Set up FTP
groupadd ftpgroup  
useradd -g ftpgroup -d /dev/null -s /etc ftpuser 
pure-pw useradd ftpuser1 -u ftpuser -d /ftphome
cd /etc/pure-ftpd/auth/
ln -s ../conf/PureDB 60pdb
mkdir -p /ftphome
chown -R ftpuser:ftpgroup /ftphome/
/etc/init.d/pure-ftpd restart


# Set up tftp
mkdir /tftp
atftpd --daemon --port 69 /tftp
cp /usr/share/windows-binaries/nc.exe /tftp/


