<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE Install Infrastructure user guide


## Provision your classroom

If your installation worked well, you must have a fully configured training
session. 

You must then choose an infrastructure backend and provision your classroom
infrastructure.

### Self-Hosted provisioning

This infrastructure backend must be run only on hardware nodes. It use kvm
and libvirt to run a classroom emulation.

```bash
[root@instructor ~]# 
# configure self infrastructure
libre-infra self config
# provision infrastructure
libre-infra self provision
# provision infrastructure
libre-infra self post-provision
```

### On-Premise provisioning

This infrastructure backend must be run only on hardware nodes with
a network interface linked to the student nodes. 
This backend use tftp, dhcp as well as kvm and libvirt to run an 
on-premise classroom.

```bash
[root@instructor ~]# 
# configure on-premise infrastructure
libre-infra prem config
# provision infrastructure
libre-infra prem provision
# provision infrastructure
libre-infra prem post-provision
```

### AWS provisioning

This infrastructure backend could be run on any node with an internet 
connection. Neverless, for student access to instructor material, the
instructor node must also be run from an EC2 resource localized in the
same datacenter.
This backend use AWS API to provision an complete cloud classroom.

```bash
[root@instructor ~]# 
# configure AWS infrastructure
libre-infra aws config
# provision infrastructure
libre-infra aws provision
# provision infrastructure
libre-infra aws post-provision
```

## Check your training infrastructure

To check your infrastructure status, you can run 

```bash
[root@instructor ~]# 
libre-infra status
```
