<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE Training Management System

This project defines a complete training management system to help you build and run simple
or complex training courses. This system can:

- Install an instructor environment (toolkit and course materials)
- Install a standalone student environment (lab materials)
- Deploy a classroom environment (multiple students)
- Download and manage course materials
- Collect course logs and students actions

## 2. Quick method

If you want to get a complete and running training environment from scratch, you can use the
following procedure

```bash
# Install the installer
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/libre-installer
chmod +x /tmp/libre-installer
# Install LIBRE
/tmp/libre-installer install bootstrap
# Install course environment
libre-session config
libre-session install
# Provision course environment (self-hosted)
libre-infra self config
libre-infra self provision
## Provision course environment (on-premise)
#libre-infra prem config
#libre-infra prem provision
## Post-provision course environment (after classroom provisioning)
# libre-infra prem post-provision
## Provision course environment (aws)
#libre-infra aws config
#libre-infra aws provision
## Post-provision course environment (after instance provisioning)
# libre-infra aws post-provision
# Start course
libre-session start
libre-chapter start
# Start lab on each workstation
libre-lab start <lab_id>
```

## 3. Complete  method (full workflow)

In order to get a fully installed training classroom, users must observe the following
workflow:

1. [Install LIBRE on instructor workstation](docs/commands/installer.md)
2. [Install course materials on instructor workstation](docs/commands/libre-repository.md)
3. [Configure session on instructor workstation](docs/commands/session-config.md)
4. [Provision classroom workstation](docs/commands/classroom-provision.md)
5. [Deploy course materials on students workstations](docs/commands/session-install.md)
6. [Start course service on instructor](docs/commands/session-start.md)


### 3.1. LIBRE installation

An installer is provided to help you deploy LIBRE environment. You will find more
information about this installer in [the installer instructions](docs/commands/installer.md).

The simplest way is to run the following script on your workstation:

```bash
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/libre-installer
chmod +x /tmp/libre-installer
/tmp/libre-installer install
```

#### 3.1.1. Instructor installation

The default installation will install an instructor environment. You can specify it during the
installation process by adding `-t instructor` to the installer script:

```bash
/tmp/libre-installer -t instructor install
```

After installing LIBRE, if you need to setup a training session prior to provision and deploy your classroom:

```bash
# change setup before default install
libre-session config
```

#### 3.1.2. Student installation

If you want to setup a student environment (useful when installing student workstations
individually) you can add `-t student` to the installer script:

```bash
/tmp/libre-installer -t student install
```

! Only an instructor setup can deploy course materials to a student workstation

### 3.2. Instructor configuration

After the instructor installation (or in parallel, as long as LIBRE is installed)
you must configure the course and session to be delivered.

### 3.3. Session configuration

This step sets up the session to be delivered. This process will check through an API if this training session
exists, get session details from it and fill the /usr/share/libre/conf/libre-session.yml config file.
You will need to get the `session_id` and `session_token` from the training provider.

```bash
libre-session config
```

### 3.4. Install instructor course materials

After the instructor session configuration, you can install course materials on your instructor workstation:

```bash
libre-session install
```

### 3.5. Install the infrastructure

After session installation, you must create a classroom environment:

```bash
## Provision course environment (self-hosted)
#libre-infra self config
#libre-infra self provision
## Provision course environment (on-premise)
#libre-infra prem config
#libre-infra prem provision
## Post-provision course environment (after classroom provisioning)
# libre-infra prem post-provision
## Provision course environment (aws)
#libre-infra aws config
#libre-infra aws provision
## Post-provision course environment (after instance provisioning)
# libre-infra aws post-provision
```

### 3.6. Start session classroom

After infrastructure deployment, you can start your session and proceed to teaching:

```bash
# Start session tools
libre-session start
# Start teaching a course chapter
libre-chapter start
# Start a lab on the student workstations
libre-lab start <lab_id>
```

# 4. Release notes

To see the full releases list, please refer to the [releases page](docs/RELEASES.md). 
Release names are based on constellation names as described in the 
[release sytem](docs/RELEASES.md#release-naming-rules).
