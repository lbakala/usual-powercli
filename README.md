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

  Follow this link : [Installing PowerShell Core on Linux](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-powershell-core-on-linux?view=powershell-6)

  Start Powershell

      # pwsh

## 2. Add PowerCLI Module on Powershell

     # pwsh
     PS /> Find-Module -Name VMWare.PowerCLI
     PS /> Install-Module -Name VMWare.PowerCLI

## 3. Try Connected To Hosts

      PS /> Connect-VIServer -Server IP      

   - For the firt connection on your host, it is possible to receive a message related to the certificate

   You can deal certificat erreur by :

      PS /> set-PowerCLIConfiguration -InvalidCertificationAction Ignore
