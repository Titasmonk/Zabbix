# Template Remote Port Discovery

This template is using Zabbix Server or Zabbix Proxy external check to discover TCP ports in Remote machines. You have to enter the ports in the macro {$TCP_DISC}. If the ports are not in an open state and Zabbix Server/Proxy can't connect to them, they will not be discovered.

The ports have to be sepperated by a dot "." for example:
- Macro: {$TCP_DISC} -> Value: 22.10050.80.8080


### Installation:

Import the template into Zabbix and upload the script to /usr/lib/zabbix/externalscripts/tcp_disc.sh:

```sh
$ chmod +x /usr/lib/zabbix/externalscripts/tcp_disc.sh
$ chown zabbix:zabbix /usr/lib/zabbix/externalscripts/tcp_disc.sh
```