#!/bin/bash


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#!/bin/sh
apt-get update  # To get the latest package lists


while true; do
    read -p "Do you wish to install Flare node and its requirements? [YES | NO]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# echo ""
# echo "Installing net-tools"
# echo ""

# sudo apt install net-tools -y

echo ""

echo "Installing Golang 1.15"
echo ""

wget https://golang.org/dl/go1.15.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
sudo rm go1.15.linux-amd64.tar.gz

# ADD BELOW TO BASH PROFILE
# export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$HOME/go

echo ""
echo "Adding exports to bash profile (~./profile)"
echo ""

echo "Adding exports to /home/$SUDO_USER/.profile"
echo '' >> /home/$SUDO_USER/.profile
echo '# Added by Flare Node Install Script' >> /home/$SUDO_USER/.profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/$SUDO_USER/.profile
echo 'export GOPATH=$HOME/go' >> /home/$SUDO_USER/.profile
echo 'export XRP_APIs="https://xrpl.flare.network:443,https://xrpl-1.flare.network:443,https://xrplcluster.com"' >> /home/$SUDO_USER/.profile
echo '# END' >> /home/$SUDO_USER/.profile

# Install Node
echo ""
echo "Installing NodeJS"
echo ""
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs


# Install Yarn
echo ""
echo "Installing Yarn"
echo ""
npm install --global yarn

# Install JQ
echo ""
echo "Installing JQ"
echo ""
sudo apt-get install -y jq

# Install build tools
echo ""
echo "Installing Build Tools"
echo ""
sudo apt update && sudo apt -y install curl && sudo apt -y install gcc

# Clone Flare Repo
echo ""
echo "Cloning Flare Node"
echo ""
git clone https://gitlab.com/flarenetwork/flare

sudo chown $SUDO_USER flare

echo ""
echo "Installing Flare Node"
echo ""
cd flare
npm install

echo "### IMPORTANT ####"
echo "Run 'source ~/.profile' to finilise installation."
