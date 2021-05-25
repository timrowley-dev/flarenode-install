# flarenode-install
Flare Networks Node Installation Tools

Download install script:
`wget http://cdn.ftso.com.au/public/flarenode/install-latest.sh`

The script runs the following commands:

Update Apt-get 
`apt-get update`

Install Golang 1.15
`wget https://golang.org/dl/go1.15.linux-amd64.tar.gz`
`sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz`
`sudo rm go1.15.linux-amd64.tar.gz`

Update Bash Profile with Envrionment Variables
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
echo 'export XRP_APIs="https://xrpl.flare.network:443,https://xrpl-1.flare.network:443,https://xrplcluster.com"' >> ~/.profile

Source Bash Profile
`source ~/.profile`

Install NodeJS
`curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -`
`sudo apt-get install -y nodejs`

Install Yarn
`npm install --global yarn`

Install JQ
`sudo apt-get install -y jq`

Install Build Tools
`sudo apt update && sudo apt -y install curl && sudo apt -y install gcc`

Clone Flare Repo
`git clone https://gitlab.com/flarenetwork/flare`

Set Flare Directory Permissions
`sudo chown $USER flare`

Install NPM packages in Flare Node Directory
`cd flare`
`npm install`

Start Coston
`./coston.sh`

# Postman

**Collection**
https://raw.githubusercontent.com/ava-labs/avalanche-postman-collection/master/Avalanche.postman_collection.json

**Environment**
https://raw.githubusercontent.com/ava-labs/avalanche-postman-collection/master/Example-Avalanche-Environment.postman_environment.json

(Source: https://github.com/ava-labs/avalanche-postman-collection)
