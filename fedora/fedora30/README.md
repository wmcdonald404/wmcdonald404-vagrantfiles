# Fedora 30 

Note: The links from the Hashicorp Vagrant Box registry for older releases are pointing to dead mirrors. e.g. [Fedora 30](https://portal.cloud.hashicorp.com/vagrant/discover/fedora/30-cloud-base)

The canonical archive of older Fedora releases is: https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/, for example the F30 Vagrant images are: https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/30/Cloud/x86_64/images/

## Manually Add a Box 

1. List existing boxes:
```
$ vagrant box list
bento/ubuntu-24.04          (libvirt, 202404.26.0)
debian/bookworm64           (libvirt, 12.20240503.1)
fedora/37-cloud-base        (libvirt, 37.20221105.0)
fedora/39-cloud-base        (libvirt, 39.20231031.1)
fedora/40-cloud-base        (libvirt, 40.20240414.0, (amd64))
jborean93/WindowsServer2022 (libvirt, 1.2.0, (amd64))
```

2. Add a new (old) box from the archive mirror:
```
$ vagrant box add --name fedora/30-cloud-base --provider libvirt https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/30/Cloud/x86_64/images/Fedora-Cloud-Base-Vagrant-30-1.2.x86_64.vagrant-libvirt.box
```

> **Note:** This would equate to --box-version 30.20190425.0 from [Fedora 30](https://portal.cloud.hashicorp.com/vagrant/discover/fedora/30-cloud-base) but you need to add from a .box file in order to specify a version.

 wmcdonald  ~  vagrant box list | grep 30-cloud-base
fedora/30-cloud-base        (libvirt, 0)


$ cd ~/scratch/vagrant/fedora/
$ mkdir fedora30
$ cd fedora30
$ vagrant init fedora/30-cloud-base
$ grep -Ev '^.*#|^$' Vagrantfile > Vagrantfile.stripped
$ cp Vagrantfile Vagrantfile.commented
$ cp Vagrantfile.stripped Vagrantfile
