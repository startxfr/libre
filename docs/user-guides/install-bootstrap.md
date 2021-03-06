<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE Install Bootstrap user guide

## Requirements

### Infrastructure requirements

If you plan to run a `self` or `prem` infrastructure, you must install this 
environment without any virtualisation layer. Only direct install on physical 
installation with virtualisation CPU enabled are supported.

If you plan to run an `aws` infrastructure, you must install you bootstrap
environment into an EC2 instance located into the same datacenter as your
targeted environment.

### System requirements

This setup require a Centos 7.6 or later with at least 100Mo free RAM and 1Vcpu
(required to have 2Vcpu) and a root access for installation.

If you start from a fresh install, you should run the following sequence to get 
a fully updated environment.

```bash
[user@localhost ~]# sudo su -
[root@localhost ~]$ yum update -y && yum install -y curl git
```

### Installing bootstrap

#### Configuring bootstrap environment

Prior to your libre installation, you can add a custom bootstrap configuration
file in order to configure the libre TMS environment to use specific 
session backend, your own course repository or your private infrastructure 
backends.
You can create the following files with you custom parameters to 
configure your LIBRE environment prior to any action:
- `~/.libre/config.yml` : **libre** default configuration
- `~/.libre/infra.yml` : **infrastructure** configuration file
- `~/.libre/infra-id_rsa` : infrastructure ssh backend **private key**
- `~/.libre/infra-id_rsa.pub` : infrastructure ssh backend **public key**
- `~/.libre/repository.yml` : **course repository** config file
- `~/.libre/session.yml` : **session** backend provider config file

If you don't perform this personnalisation, fresh config files will be deployed 
after the bootstrap install and you will be able to change their content whenever you want. 

> **WARNING**:  Pay attention to the `infra-id_rsa` as this key must be recorded 
  in your AWS infrastructure backend (if AWS infra is used). 
  It corespond to the ssh key recorded in your AWS zone.

> **NOTICE**: In the `infra.yml` config file, `aws.access_key` and
  `aws.secret_key` are set to `False` in order to force interactive prompt 
  for AWS credentials.
  These credentials must have autorizations over EC2, VPC, Route53 objects
  for the used datacenter (default is `eu-west-3`).

  If you manually set `aws.access_key` and `aws.secret_key` in the `infra.yml` 
  prior to any `libre-infra aws xxxx` command, you can bypass the interactive 
  sequence and run aws infrastructure provisioning without interaction.

#### Install libre TMS with bootstrap profile

```bash
[root@localhost ~]$ curl -L https://goo.gl/T8Dw9J -o /tmp/libre-installer
[root@localhost ~]$ chmod +x /tmp/libre-installer
[root@localhost ~]$ /tmp/libre-installer install bootstrap
[root@bootstrap ~]$ libre-bootstrap info
```

### Configuring bootstrap

#### Configure STARTX course repository

Edit `~/.libre/repository.yml` file with the following content. 
You can also download the [repository.yml config file](./config/repository.yml) example.

```yaml
url: "https://github.com/startxfr/startxTools"
branch: "ansiblesg"
base: "/libre/course-repo"
local: "/var/local/libre.repo"
```

#### Configure STARTX session backend

Edit `~/.libre/session.yml` file with the following content. You can also download the [session.yml config file](./config/session.yml) example.

```yaml
type: "gapi"
gapi: "https://script.google.com/macros/s/AKfycbxeOVza-MLwqSOtCLecPgzaXA-kUngoTdpbGyGJeObl9TyeSw8/exec"
```

#### Configure STARTX infrastructure

You can choose between 3 type of infrastructure deployment

##### Self infractusture

1. Configure STARTX infrastructure in self-hosted environment

Edit `~/.libre/infra.yml` file with the following content. You can also download the [infra.yml config file](./config/infra.yml) example.

```yaml
default: "self"
self:
  type: "self"
  network:
    dns: "classroom.example.com"
    associated_ip: "127.0.0.1"
```


##### On-Prem infractusture

1. Configure STARTX infrastructure in on-premise environment

Edit `~/.libre/infra.yml` file with the following content. You can also download the [infra.yml config file](./config/infra.yml) example.

```yaml
default: "prem"
prem:
  type: "prem"
  network:
    dns: "training.example.com"
  ssh:
    privateKey_file: "~/.libre/infra-prem-id_rsa"
    user: "root"
```

2. Configure STARTX On-premise credentials

Generate `~/.libre/infra-prem-id_rsa.pub` and  `~/.libre/infra-prem-id_rsa` files 
whith the following command

```bash
[root@bootstrap ~]$ ssh-keygen -t rsa -b 4096 -N "" -f ~/.libre/infra-prem-id_rsa
```

##### AWS infractusture

1. Configure STARTX infrastructure in AWS environment

Edit `~/.libre/infra.yml` file with the following content. You can also download the [infra.yml config file](./config/infra.yml) example.

```yaml
default: "aws"
aws:
  type: "aws"
  auth:
    access_key: "XXXXXXXXXXXXXXXXXX"
    secret_key: "XXXXXXXXXXXXXXXXXX"
  route53:
    zone: "startx.fr"
    domain: "libre.startx.fr"
  ec2:
    region: "eu-west-3"
    type: "t2.micro"
    image: "ami-0e1ab783dc9489f34"
  ssh:
    keyname: "ssh-libre-instructor"
    privateKey_file: "~/.libre/infra-id_rsa"
    user: "centos"
```

2. Configure STARTX AWS credentials

Edit `~/.libre/infra-id_rsa.pub` and `~/.libre/infra-id_rsa` files with a SSH RSA 
key referenced in your AWS wallet.
