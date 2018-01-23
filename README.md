# What is Dracnmap?

[![Version](https://img.shields.io/badge/Dracnmap-3.0.0-brightgreen.svg?maxAge=259200)]()
[![Version](https://img.shields.io/badge/Codename-Blackhawk-red.svg?maxAge=259200)]()
[![Stage](https://img.shields.io/badge/Release-Stable-brightgreen.svg)]()
[![Build](https://img.shields.io/badge/Supported_OS-Linux-orange.svg)]()

**Dracnmap** is an open source tool which is using to exploit the network and gathering information with **Nmap** help.
**Nmap** command comes with lots of options that can make the utility more robust and difficult to follow for new users.
Hence **Dracnmap** is designed to perform fast scaning with the utilizing script engine of **Nmap** and **Nmap** can perform various automatic scanning techniques with the advanced commands.

## Version

Stable release: **v3.0.0**  
Testing release: **testing**

## Screenshot

![dracnmap_main_menu_01](doc/img/dracnmap_main_menu_01.png)  

# Getting started

1. ```chmod +x dracnmap```
2. ```sudo ./dracnmap or sudo su ./dracnmap```

## Set session environment

It is a good idea to prepare the environment before scanning. You can do this from the cli level or using the configuration file.

### IP Address

To set the single or multiple IP addresses:

``````
Screetsec@dracnmap> set session ipaddr
What is your IP Target or Host: 8.8.8.8
Screetsec@dracnmap> show session ipaddr
{"IP address":
  {"ipaddr":"8.8.8.8"}
}
``````

or in the `config`:

``````
# Specifies the default ip address.
# Examples:
#   - _ipaddr=("127.0.0.1" "8.8.8.8")
_ipaddr=("127.0.0.1")
``````

### Port number

To set the port number:

``````
Screetsec@dracnmap> set session port
What is your Port Target: 443
Screetsec@dracnmap> show session port
{"Service port number":
  {"port":"443"}
}
``````

or in the `config`:

``````
# Specifies the default port number.
# Examples:
#   - _port="80"
_port="80"
``````

### User

To set the user name:

``````
Screetsec@dracnmap> set session user
What is your cmd user: root
Screetsec@dracnmap> show session user
{"Username":
  {"user":"root"}
}
``````

or in the `config`:

``````
# Specifies the default username.
# Examples:
#   - _user="admin"
_user="admin"
``````

### Password

To set the password:

``````
Screetsec@dracnmap> set session pass
What is your cmd pass: aephahDi6euk
Screetsec@dracnmap> show session pass
{"User password":
  {"pass":"aephahDi6euk"}
}
``````

or in the `config`:

``````
# Specifies the default user name password.
# Examples:
#   - _pass=$(pwgen 18)
_pass=""
``````

### Interface

To set the interface:

``````
Screetsec@dracnmap> set session iface
What is your interface: wlan0
Screetsec@dracnmap> show session iface
{"Network interface":
  {"iface":"wlan0"}
}
``````

or in the `config`:

``````
# Specifies the default MAC address.
# Examples:
#   - _iface="eth0"
_iface="eth0"
``````

### MAC Address

To set the mac address:

``````
Screetsec@dracnmap> set session hwaddr
What is your MAC address: 00:00:00:00:00:00
Screetsec@dracnmap> show session hwaddr
{"MAC address":
  {"hwaddr":"00:00:00:00:00:00"}
}
``````

or in the `config`:

``````
# Specifies the default network interface.
# Examples:
#   - _hwaddr="00:01:02:03:04:05"
_hwaddr=""
``````

### Domain

To set the domain name:

``````
Screetsec@dracnmap> set session domain
What is your domain name: example.com
Screetsec@dracnmap> show session domain
{"Domain name":
  {"domain":"example.com"}
}
``````

or in the `config`:

``````
# Specifies the default domain name.
# Examples:
#   - _domain="example.com"
_domain="example.com"
``````

### Database user

To set the database user:

``````
Screetsec@dracnmap> set session dbuser
What is your cmd user: root
Screetsec@dracnmap> show session dbuser
{"Database user name":
  {"dbuser":"root"}
}
``````

or in the `config`:

``````
# Specifies the default database user name.
# Examples:
#   - _userdb="admin"
_userdb="admin"
``````

### Database password

To set the database password:

``````
Screetsec@dracnmap> set session dbpass
What is your cmd pass: aephahDi6euk
Screetsec@dracnmap> show session dbpass
{"User password":
  {"pass":"aephahDi6euk"}
}
``````

or in the `config`:

``````
# Specifies the default database user password.
# Examples:
#   - _passdb=$(pwgen 18)
_passdb=""
``````

### Report

To set the report file:

``````
Screetsec@dracnmap> set session report
Type [standard,xml,grep]: standard
Screetsec@dracnmap> show session report
{"Report type":
  {"report":"standard"}
}
``````

or in the `config`:

``````
# Specifies the default output type and path.
# Examples:
#   - _report="html"
_report=""
``````

### TOR

To set the tor connections:

``````
Screetsec@dracnmap> set session tor
TOR [true,false]: true
Screetsec@dracnmap> show session tor
{"Pass through TOR":
  {"tor":"true"}
}
``````

or in the `config`:

``````
# Specifies the TOR connection.
# Examples:
#   - _tor="true"
_tor=""
``````

### Terminal

To set the terminal type:

``````
Screetsec@dracnmap> set session terminal
Terminal [internal,external]: internal
Screetsec@dracnmap> show session terminal
{"Terminal type":
  {"terminal":"internal"}
}
``````

or in the `config`:

``````
# Specifies the terminal type.
# Examples:
#   - _terminal="internal"
_terminal="internal"
``````

# Requirements

- We recommend Kali Linux 2 or Kali 2016.3 rolling/Cyborg/Parrot/Dracos/BackTrack/Backbox and another GNU/Linux operating system
- [Nmap](https://nmap.org/)
- [Proxychains](http://proxychains.sourceforge.net/)

# Tutorial or another tool?

You can visit my channel: https://www.youtube.com/channel/UCpK9IXzLMfVFp9NUfDzxFfw

**TheFatRat**, Backdoor Creator (bypass av): https://github.com/Screetsec/TheFatRat

# Bugs

- See Issues page

- Contact:

  - **Edo Maland** (Screetsec) - author

    Hey sup? do you want ask about all my tools? You can join me in [telegram.me/offscreetsec](telegram.me/offscreetsec)

  - **[trimstray](https://github.com/trimstray)** - main contributor of the v3.0.0

# Changelog

Be sure to check out the [CHANGELOG.md](CHANGELOG.md).

# Testing environment

- `4.13.0-kali1-amd64 #1 SMP Debian 4.13.13-1kali1 (2017-11-17) x86_64 GNU/Linux`
- `GNU bash, version 4.4.12(1)-release`
- `Nmap version 7.60 ( https://nmap.org )`

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


  - **v3.0.0** - **[trimstray](https://github.com/trimstray)**

# Books for Nmap

- Nmap 6: Network exploration and security auditing Cookbook
- Nmap Host Discovery Techniques
- Nmap Cheat Sheet (PDF) - 8ack
- Nmap - A Stealth Port Scanner - Villanova Computer Science
- Nmap Quick Reference Guide - SCADAhacker

# Disclaimer

***Note: modifications, changes, or alterations to this sourcecode is acceptable, however,any public releases utilizing this code must be approved by writen this tool ( Edo -m- ).***
