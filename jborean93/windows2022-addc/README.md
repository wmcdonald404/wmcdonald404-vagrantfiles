## Active Directory Domain Controller Vagrant Box

This is a simple Active Directory Domain Controller (AD DC) box.

- The [Vagrantfile](Vagrantfile) will trigger a provisioner which will run
- The [addc.ps1](addc.ps1) script. This will create a Domain Controller with:
    - Netbios Domain: WIN
    - Active Directory Domain: WIN.<VMID>



