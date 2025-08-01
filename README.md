# LuwareNimbusPowerShellModule

PowerShell module for the Luware Nimbus API.

This repository contains a sample PowerShell module structured similarly to the Meraki PowerShell module. Each Nimbus command is implemented in its own script under `Nimbus/1.0.0/Public` and loaded through the module manifest.

## Usage

Import the module from the `Nimbus/1.0.0` directory and call any of the available commands:

```powershell
Import-Module ./Nimbus/1.0.0/Nimbus.psd1
Get-NimbusUserDetails -AuthToken "<token>" -BaseUri "https://portal.eu-1" -UserId "<id>"
Copy-NimbusUser -AuthToken "<token>" -BaseUri "https://portal.eu-1" -SourceO365Id "<templateUserId>" -NewO365Id "<newUserId>"
```

The functions rely on the Nimbus REST API as documented on [help.luware.com](https://help.luware.com/nimbus-integrations/nimbus-api).

## PowerShell Installation
To install PowerShell 7 on Ubuntu, run the following commands:

```bash
sudo apt-get update
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
```

Launch PowerShell using:

```bash
pwsh
```
