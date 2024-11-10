# wmcdonald404-vagrantfiles
Some simple starter Vagrantfiles, mostly targeting the libvirt provider.

# Structure/contents
```

.
├── bento                           # Ubuntu Vagrantfiles
│   └── ubuntu-24.04                    # 24.04, LTS
├── debian                          # Debian Vagrantfiles
│   └── bookworm64                      # Debian 12.7
├── fedora                          # Fedora Vagrantfiles
│   ├── fedora30                        # Fedora 30
│   ├── fedora39                        # Fedora 39
│   ├── fedora40                        # Fedora 40
│   ├── fedora40-ansible                # Fedora 40, single VM, Ansible provisioner
│   ├── fedora40-multivm                # Fedora 40, multi VM, no provisioner   
│   └── fedora40-multivm-ansible        # Fedora 40, multi VM, Ansible provisioner
├── generic                         # roboxes.org generic Vagrantfiles
│   ├── ubuntu-20.04                    # Ubuntu 20.04
│   └── ubuntu-22.04                    # Ubuntu 22.04
└── jborean93                       # Windows Vagrantfiles
    ├── windows2022                     # Windows 2022, single VM
    ├── windows2022-multidisk           # Windows 2022, single VM, multiple block devices
    └── windows2022-multivm             # Windows 2022, multi VM
```


# References
- [Setting up Vagrant under Libvirt on Fedora](https://wmcdonald404.github.io/github-pages/2024/03/22/linux-vagrant-libvirt-on-fedora.html)
- [Running Windows 2022 on Vagrant with the Libvirt Provider](https://wmcdonald404.github.io/github-pages/2024/03/20/linux-vagrant-windows-boxes.html)
- [Running Multiple Vagrant Boxes and the Ansible Provisioner](https://wmcdonald404.github.io/github-pages/2024/06/09/multiple-vagrant-boxes-with-ansible-provisioner.html)

# TODO
- Maybe add some Fedora and/or RHEL CoreOS?
