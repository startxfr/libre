<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE Training Management System

This project define a complete training management system to help you build and run simple
or complex training courses. This system can :
- Install an instructor environement (toolkit and course materials)
- Install a standalone student environement (lab materials)
- Deploy a classroom environement (multiple students)
- Download and manage course materials
- Collect course log and students actions

## 2. Quick method

If you want to get a complete and running training environement from scratch, you can use the
following procedure

```bash
# install the installer
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/installer-libre
chmod +x /tmp/installer-libre
# install LIBRE
/tmp/installer-libre install
# install course environement
libre-session config
libre-session install
# provision course environement (self-host)
libre-infra self config
libre-infra self provision
## provision course environement (on-premise)
#libre-infra prem config
#libre-infra prem provision
## post-provision course environement (after classroom provisionning)
# libre-infra prem post-provision
## provision course environement (aws)
#libre-infra aws config
#libre-infra aws provision
## post-provision course environement (after instance provisionning)
# libre-infra aws post-provision
# Start course
libre-session start
libre-chapter start
# Start lab on each workstation
libre-lab start <lab_id>
```

## 3. Complete  method (full workflow)

In order to get a fully installed training classroom, user must follow the following
workflow

1. [Install LIBRE on instructor workstation](docs/commands/installer.md)
2. [Install course materials on instructor workstation](docs/commands/libre-repository.md)
3. [Configure session on instructor workstation](docs/commands/session-config.md)
4. [Provision classroom workstation](docs/commands/classroom-provision.md)
5. [Deploy course materials on students workstation](docs/commands/session-install.md)
6. [Start course service on instructor](docs/commands/session-start.md)


### 3.1. LIBRE installation

An installer is provided to help you deploy LIBRE environement. You will find more
information about this installer on [the installer instruction](docs/commands/installer.md).

The simpliest way is to run the following script on your workstation.

```bash
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/installer-libre
chmod +x /tmp/installer-libre
/tmp/installer-libre install
```

#### 3.1.1. Instructor installation

Default installation will install an instructor environment. You can specify it during the
installation process by adding `instructor` to the installer script
```bash
/tmp/installer-libre -t instructor install
```

After installing LIBRE, if you need to setup a training session before provision and deploy your classroom.

```bash
# change setup before default install
libre-session config
```

#### 3.1.2. Student installation

If you want to setup a student environment (usefull when installing student workstation
individually) you can add `student` to the installer script

```bash
/tmp/installer-libre -t student install
```

! Only instructor setup can deploy course material to a student workstation

### 3.2. Instructor configuration

After the instructor installation (or in parallel, as long as LIBRE is installed)
you must configure the course and session to be delivered

### 3.3. Session configuration

Setup the session to be delivered. This process will check through an API if this training session
exist, get session detail from it and fill the /usr/share/libre/conf/libre-session.yml config file.
You will need to get the `session_id` and `session_token` from the training provider.

```bash
libre-session config
```

### 3.4. Install instructor course material

After the instructor session configuration, you can install course material on your instructor workstation

```bash
libre-session install
```

### 3.5. Install infrastructure

After session installation, you must create a classroom environement

```bash
## provision course environement (self-hosted)
#libre-infra self config
#libre-infra self provision
## provision course environement (on-premise)
#libre-infra prem config
#libre-infra prem provision
## post-provision course environement (after classroom provisionning)
# libre-infra prem post-provision
## provision course environement (aws)
#libre-infra aws config
#libre-infra aws provision
## post-provision course environement (after instance provisionning)
# libre-infra aws post-provision
```

### 3.6. Start session classroom

After infrastructure deployment, you can start your session and begin learning to students

```bash
# Start session tools
libre-session start
# Start learning a course chapter
libre-chapter start
# Start a lab on workstations
libre-lab start <lab_id>
```

# 4. Release notes

To see the full release list, please refer to the [release page](docs/RELEASES.md). 
Release name are based on constellation name as described in the 
[release sytem](docs/RELEASES.md#release-naming-rules)
