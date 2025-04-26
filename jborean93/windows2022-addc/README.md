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