# What is Dracnmap?

[![Version](https://img.shields.io/badge/Dracnmap-3.0.0-brightgreen.svg?maxAge=259200)]()
[![Version](https://img.shields.io/badge/Codename-Blackhawk-red.svg?maxAge=259200)]()
[![Stage](https://img.shields.io/badge/Release-Testing-brightgreen.svg)]()
[![Build](https://img.shields.io/badge/Supported_OS-Linux-orange.svg)]()

**Dracnmap** is an open source tool which is using to exploit the network and gathering information with **Nmap** help.
**Nmap** command comes with lots of options that can make the utility more robust and difficult to follow for new users.
Hence **Dracnmap** is designed to perform fast scaning with the utilizing script engine of **Nmap** and **Nmap** can perform various automatic scanning techniques with the advanced commands.

## Version

Stable release: **v2.2**  
Testing release: **testing (v3.0.0)**

## Screenshot

![dracnmap_main_menu_01](doc/img/dracnmap_main_menu_01.png)  

# Getting started

## Stable release

1. ```git clone https://github.com/Screetsec/Dracnmap.git```
2. ```cd Dracnmap```
3. ```chmod +x dracnmap-v2.2.sh ```
4. ```sudo ./dracnmap-v2.2.sh or sudo su ./dracnmap-v2.2.sh ```

## Testing release (v3.0.0)

Author of changes: **[trimstray](https://github.com/trimstray)**

- removed blank spaces/tabs
- correcting indentation (transparent code)
- separated comparison operator
- protection against giving an illegal value
- separated modules into files
- added headings to the menu (id, description)
- added simple **CLI** (the ability to run pure **Nmap**)
- load config from file
- added `set/show` commands
- added **help**
- fixes in user interface
- changed in the dependency checking mechanism (before init user interface)
- minor fixes and more

> For more information about changes please see in **CHANGELOG.md**.

1. ```git clone https://github.com/trimstray/Dracnmap```
2. ```cd Dracnmap```
3. ```chmod +x dracnmap```
4. ```sudo ./dracnmap or sudo su ./dracnmap```

### Environment

* `4.13.0-kali1-amd64 #1 SMP Debian 4.13.13-1kali1 (2017-11-17) x86_64 GNU/Linux`
* `GNU bash, version 4.4.12(1)-release`
* `Nmap version 7.60 ( https://nmap.org )`

# Requirements

- We recommend Kali Linux 2 or Kali 2016.3 rolling/Cyborg/Parrot/Dracos/BackTrack/Backbox and another GNU/Linux operating system
- [Nmap](https://nmap.org/)

# Tutorial or another tool?

You can visit my channel: https://www.youtube.com/channel/UCpK9IXzLMfVFp9NUfDzxFfw

**TheFatRat**, Backdoor Creator (bypass av): https://github.com/Screetsec/TheFatRat

# Bugs

- See Issues page

- Contact:

  - **Edo Maland** (Screetsec) - author of the stable release (v2.2)

    Hey sup? do you want ask about all my tools? You can join me in [telegram.me/offscreetsec](telegram.me/offscreetsec)

  - **[trimstray](https://github.com/trimstray)** - author of the testing release (v.3.0.0)

# Changelog

Be sure to check out the **CHANGELOG.md**.

# Donations

- If this project very help you to penetration testing and u want support author, you can give me a cup of coffee :)
- **Edo Maland**: [![Donation](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://blockchain.info/id/address/1NuNTXo7Aato7XguFkvwYnTAFV2immXmjS)

<img src="https://cloud.githubusercontent.com/assets/17976841/25007109/75380fa6-2089-11e7-8a4a-4a8ae9c06e24.png" width="30%"></img>

# Credits

- Thanks to allah and **Screetsec** [Edo -maland-] <Me>

- **Dracos Linux** from Scratch Indonesia (Awesome Pentesting OS), you can see in http://dracos-linux.org/

- **Offensive Security** for the awesome OS (http://www.offensive-security.com/)

- http://www.kali.org/

- And another open sources tool in github

- Up to date new tools hacking visit http://www.kitploit.com

- Contributors:

  - First Contribute - **@nullrndtx**


  - **Boy Suganda Sinaga** [dragz17]


  - **v3.0.0** (testing) - **[trimstray](https://github.com/trimstray)**

# Books for Nmap

- Nmap 6: Network exploration and security auditing Cookbook
- Nmap Host Discovery Techniques
- Nmap Cheat Sheet (PDF) - 8ack
- Nmap - A Stealth Port Scanner - Villanova Computer Science
- Nmap Quick Reference Guide - SCADAhacker

# Disclaimer

***Note: modifications, changes, or alterations to this sourcecode is acceptable, however,any public releases utilizing this code must be approved by writen this tool ( Edo -m- ).***
