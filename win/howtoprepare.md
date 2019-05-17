# How to prepare Windows box for Vagrant with VirtualBox provider

1. Install Windows (in here 2016) from M$ .iso
2. Install VirtualBox Guest Additions
3. Apply all available patches
4. Symbolic links on desktop

```
New-Item -itemtype symboliclink -path C:\Users\All Users\Desktop -name LogOff -value C:\Windows\System32\logoff.exe
```

5. Edit Policies

  * Run gpedit from a command prompt
  * Navigate to Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy
  * Select 'Password must meet complexity requirements' and disable
  * Navigate to Computer Configuration -> Administrative Templates -> System
  * Select ' Display Shutdown Event Tracker' and disable

6. Setup Vagrant user

```
New-LocalUser -name vagrant -AccountNeverExpires -Description "Vagrant user" -Password $( ConvertTo-SecureString "vagrant" -AsPlainText -Force ) -PasswordNeverExpires -UserMayNotChangePassword
Add-LocalGroupMember -Group Administrators -Member vagrant
```

7. Disable UAC

```
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force
```

8. WinRM setup

```
winrm quickconfig -q
winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
```

9. Remote Desktop setup & CredCSP

```
$obj = Get-WmiObject -Class "Win32_TerminalServiceSetting" -Namespace root\cimv2\terminalservices
$obj.SetAllowTsConnections(1,1)

Enable-WSManCredSSP -Force -Role Server
```

10. Disable Firewall

```
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
```

11. PageFile shrinking

```
$System = GWMI Win32_ComputerSystem -EnableAllPrivileges
$System.AutomaticManagedPagefile = $False
$System.Put()

$CurrentPageFile = gwmi -query "select * from Win32_PageFileSetting where name='c:\\pagefile.sys'"
$CurrentPageFile.InitialSize = 512
$CurrentPageFile.MaximumSize = 512
$CurrentPageFile.Put()
```

12. Powershell execution policy

```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

13. System cleanup using DISM.exe & Disk Cleanup

```
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

C:\Windows\System32\cleanmgr.exe /d c:
```

14. Review needed Server Roles & Features

when done remove those not needed from disk

```
Get-WindowsFeature | ? { $_.InstallState -eq 'Available' } | Uninstall-WindowsFeature -Remove
```

15. Defragment C: drive & purge hidden data using SDelete from SysInternals Suite

```
Optimize-Volume -DriveLetter C

sdelete -z c:
```

16. Shutdown machine and prepare for packaging

machine disk compacting:
```
VBoxManage modifymedium <diskfile>.vdi --compact
```

17. Build the package and add it to Vagrant boxes

```
vagrant package --base <baseboxname> --output win2016.box --vagrantfile Vagrantfile
```

where Vagrantfile content is

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.vm.base_mac = "<provide here mac address of the basebox interface>"

  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end

end
```

and finally add it to vagrant:

```
vagrant box add <box name> win2016.box
```

18. Test It!

```
vagrant box list
vagrant init <box name>
vagrant up
```
