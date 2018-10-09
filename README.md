# LIBRE Training Management System

This project define a complete training management system to help you build and run simple 
or complex training courses. This system can :
- Install an instructor environement
- Install a single student environement
- Deploy a classroom environement (multiple students)
- Download and manage course materials

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
/tmp/installer-libre instructor
# install course environement
libre-session install <session_id> <session_token>
# install course environement (self-host)
libre-infra self provision
# install course environement (on-premise)
# libre-infra prem provision
# install course environement (aws)
# libre-infra aws setup
# libre-infra aws provision
# Start course 
libre-chapter start
# Start lab on each workstation 
libre-lab start <lab_id>
```

## 3. Complete  method (full workflow)

In order to get a fully installed training classroom, user must follow the following 
workflow

1. Install LIBRE on instructor workstation
2. Install course materials on instructor workstation
3. Configure session on instructor workstation
4. Provision classroom workstation
5. Deploy course materials on students workstation
6. Start course service on instructor


### 3.1. LIBRE installation

An installer is provided to help you deploy LIBRE environement. You will find more 
information about this installer on [the installer instruction](installer.md).

The simpliest way is to run the following script on your workstation. 

```bash
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/installer-libre
chmod +x /tmp/installer-libre
/tmp/installer-libre 
```

#### 3.1.1. Instructor installation

Default installation will install an instructor environment. You can specify it during the 
installation process by adding `instructor` to the installer script
```bash
/tmp/installer-libre instructor
```

After installing LIBRE, if you need to setup a training session before provision and deploy your classroom.

```bash
# change setup before default install
libre-session install <session_id> <session_token>
# install course environement (self-host)
libre-infra self provision
# install course environement (on-premise)
# libre-infra prem provision
# install course environement (aws)
# libre-infra aws setup
# libre-infra aws provision
```

#### 3.1.2. Student installation

If you want to setup a student environment (usefull when installing student workstation 
individually) you can add `student` to the installer script

```bash
/tmp/installer-libre student
```

Only instructor setup can deploy course material to a student workstation

## 3.2. Instructor configuration

After the instructor installation (or in parallel, as long as LIBRE is installed)
you must configure the course and session to be delivered

### 3.3. Session configuration

Setup the session to be delivered. This process will check through an API if this training session
exist, get session detail from it and fill the /libre/conf/libre-session.yml config file.
You will need to get the `session_id` and `session_token` from the training provider.

```bash
libre-session config <session_id> <session_token>
```

## 3.4. Install instructor course material

After the instructor session configuration, you can install course material on your instructor workstation

```bash
libre-session install
```
