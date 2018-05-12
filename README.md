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

   - For the first connection on your host, it is possible to receive a message related to the certificate

   You can deal certificat erreur by :

      PS /> set-PowerCLIConfiguration -InvalidCertificationAction Ignore

## 4. Create Credential File

      # mkdir /root/.vmware
      # touch /root/.vmware/secret.xml
      # chmod 000 /root/.vmware/secret.xml
      # cat > secret.xml
      <?xml version="1.0" encoding="iso-8859-1"?>
      <data>
      <server>
      <ip>192.168.xx.xx</ip>
      <user>username</user>
      <pwd>******</pwd>
      </server>
      <server>
      <ip>192.168.xx.xx</ip>
      <user>username</user>
      <pwd>******</pwd>
      </server>
      </data>

## 5. Automate connection by providing the server's IP address

      # cat > connected.ps1
      $server = $args[$args.count-1]
      [xml]$xmldata = get-content "/root/.vmware/co.xml"
      $obj = $xmldata.data.server | Where-Object {$_.ip -eq $server}
      $username= $obj | %{$_.user}
      $pass = $obj | %{$_.pwd}
      $password = $pass | ConvertTo-SecureString -asPlainText -Force
      $credential = New-Object System.Management.Automation.PSCredential $username,$password
      $connected=Connect-VIServer -Server $server -credential $credential

      # pwsh connected.ps1 192.168.xx.xx

      # cat > VM
      #!/usr/bin/pwsh
      . "/home/user/connected.ps1" $args[$args.count-1]
      $item = $args[0]
      switch($tem)
      {
            List
            {
              Get-VM
            }
      }

  Call List action
      # pwsh VM List 192.168.xx.xx


