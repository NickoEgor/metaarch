# Minimalist Arch Metadistribution

## Installation in VirtualBox

1. Download Arch ISO on [Arch Linux Downloads](https://www.archlinux.org/download)
2. Run it on VirtualBox
3. Run command below in LiveCD shell:
```bash
curl https://raw.githubusercontent.com/NickoEgor/metaarch/master/livecd.sh > livecd.sh && bash livecd.sh
```
4. Login as "root" user with "pass" password after reboot
5. Run command below:
```bash
curl https://raw.githubusercontent.com/NickoEgor/metaarch/master/rootsetup.sh > rootsetup.sh && bash rootsetup.sh && rm rootsetup.sh
```
6. System is ready
