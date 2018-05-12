$server = $args[$args.count-1]
[xml]$xmldata = get-content "/root/.vmware/secret.xml"
$obj = $xmldata.data.server | Where-Object {$_.ip -eq $server}
$username= $obj | %{$_.user}
$pass = $obj | %{$_.pwd}
$password = $pass | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username,$password
$connected=Connect-VIServer -Server $server -credential $credential

