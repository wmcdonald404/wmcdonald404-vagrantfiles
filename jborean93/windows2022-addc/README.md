## Active Directory Domain Controller Vagrant Box

This is a simple Active Directory Domain Controller (AD DC) box.

1. The [Vagrantfile](Vagrantfile) will triggers several shell provision calls
2. "Active Directory Domain Controller Setup"
3. "Create Active Directory Security Groups"
4. "Create Active Directory Domain Users"
5. "Allocate Users to Security Groups"

```
.
├── README.md
├── scripts
│   └── powershell
│       ├── allocategroupmembership.ps1
│       ├── createdomaincontroller.ps1
│       ├── createdomainusers.ps1
│       └── createsecuritygroups.ps1
└── Vagrantfile
```


```
$DomainName = (Get-ADDomainController).Domain
$DomainDetail = Get-ADDomain -Identity $DomainName
$DomainControllerDetail = Get-ADDomainController -Server $DomainDetail.PDCEmulator -Filter *
[pscustomobject]@{Name = $DomainDetail.NetBIOSName;FQDN = $DomainDetail.DNSRoot;PDC = $DomainDetail.PDCEmulator;MemberDCs = $DomainControllerDetail}

PS C:\Users\vagrant> $DomainName = (Get-ADDomainController).Domain
PS C:\Users\vagrant> $DomainDetail = Get-ADDomain -Identity $DomainName
PS C:\Users\vagrant> $DomainControllerDetail = Get-ADDomainController -Server $DomainDetail.PDCEmulator -Filter *
PS C:\Users\vagrant> [pscustomobject]@{Name = $DomainDetail.NetBIOSName;FQDN = $DomainDetail.DNSRoot;PDC = $DomainDetail.PDCEmulator;MemberDCs = $DomainControllerDetail}

Name FQDN            PDC                             MemberDCs
---- ----            ---                             ---------
WIN  WIN.GM2IQNHEVA4 WIN-GM2IQNHEVA4.WIN.GM2IQNHEVA4 WIN-GM2IQNHEVA4

```