# usual-powercli

Hello,
Here are the scripts that I use every day to manage the virtual machines present in my esxi hosts.

  Below are the steps required to get this working on a base linux system

  - Install Powershell
  - Add PowerCli Module on Powershell
  - Try Connected To Hosts
  - Create credential file
  - Automate connection by providing the server's IP address

## 1. Install Powershell

  Install system components

    sudo apt-get update
    sudo apt-get install curl gnupg apt-transport-https

  Import the public repository GPG keys

    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

  Register the Microsoft Product feed

    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /e$

  Update the list of repository package

    sudo apt-get update

  Install PowerShell

    sudo apt-get install -y powershell

  Start PowerShell

    pwsh

