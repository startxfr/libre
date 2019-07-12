<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE Install Session user guide


## Setup your training session

### Setup your training session

When you are on an instructor node properly configured, you can start to setup a new
training session. According to your session backend configuration, as defined
in `~/.libre/session.yml` you can have access to various kind of session
backend :
- gapi : Use a google sheet as a backend for training session informations
- manual : you set session informaiton manually
- sample : deploy automatically a sample training session

> **NOTICE**:  If you used a gapi backend, you where prompted for a session ID and
  a session secret in order to set your session environement.


### Configure the training session

```bash
[root@instructor ~]# 
# setup session
libre-session config
```


### Install the training session

```bash
[root@instructor ~]# 
# setup session
libre-session install
```


### Check your training session

To check your session status, you can run 

```bash
[root@instructor ~]# 
libre-session status
```

## Provision your infrastructure

After configuring your session, you must continue by [provisioning your infrastructure](install-infra.md).
You can then come back to the start session process when infrastructure
is provisioned and deployed.


## Start the training

### Start your training session

When your infrastructure backend is provisioned, you can start you training
session by 

```bash
# start training
[root@instructor ~]# 
libre-session start
```


### Check your training session

To check your session status, you can run 

```bash
[root@instructor ~]# 
libre-session status
```