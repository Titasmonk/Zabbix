# Template Listening Port Discovery

This template is utilizing Zabbix Agent (Active) to discover TCP ports in Listening state. You have to enter the ports that you want to be discovered in the macro {$TCP_DISCOVERY}. If the port are not in listening state, it will not be discovered.

The ports have to be sepperated by a dot "." for example:
- Macro: {$TCP_DISCOVERY} -> Value: 22.10050.80.8080

 

### Installation:

Upload the script to /etc/zabbix/scripts/tcp_discovery.sh:

```sh
$ chown zabbix:zabbix tcp_discovery.sh
```
Add UserParameter to zabbix-agent configuration file:
```
UserParameter=tcp.discovery[*], /etc/zabbix/scripts/tcp_discovery.sh '$1'
```
Restart Zabbix agent:
```sh
systemctl restart zabbix-agent
```