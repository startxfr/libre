<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE Documentation

## Definitions

- **classroom** Virtual or physical environments running instructor and students 
  workspaces
- **workspace** Multiple station running as a unit used by students during their
  training session experience
- **student** Physical user attending a training session and executing lab works under 
  his dedicated workspace
- **instructor** Physical trainer running a training session and animating lab works 
  executed by students
- **provisionner** Physical user with enought credentials and skills to provision
  working classrooms environments
- **station** Computer unit used by instructor or student during a training session
- **workstation** Special computer unit used by instructor or student to access their
  dedicated workspace environment using a graphical interface (act as bastion).


## 1. Usage guide

- [Install an instructor environement](user-guides/install-instructor.md)
- [Configuration and install a training session](user-guides/install-session.md#configure)
- [Configure an infrastructure environement](user-guides/install-infra.md#configure)
- [Provision a classroom environement](user-guides/install-infra.md#provision)
- [Deploy a classroom environement](user-guides/install-infra.md#post-provision)
- [Start a training session](user-guides/install-session.md#start-the-training)
- [Run a training session](user-guides/run-training.md)
- [Close a training session](user-guides/uninstall-session.md)
- [Deprovision  a classroom environement](user-guides/uninstall-infra.md)
- [Uninstall an instructor environement](user-guides/uninstall-instructor.md)

## 2. Developper guide

- [Main files and directory structure](developper/FILES.md)
- [Main libre commands](developper/BIN.md)
- [Release history and convention](RELEASES.md)


## 3. Deployement workflow

the full installation of a classroom, using an AWS infrastructure backend, take 
approximatively 25min (4 students classroom) using the following scenario:

- *02 mins* provisionning instructor AWS instance (out of this scope)
- *05 mins* Apply [Instructor requirements](#111-instructor-requirements)
- *02 mins* Configure [STARTX libre environement](#112-configuring-startx-libre-environement-on-instructor) 
  on instructor
- *02 mins* Setup [STARTX AWS infrastructure config](#433-aws-infractusture) on 
  ~/.libre/infra.yml instructor config
- *08 mins* Install libre using the [libre installation guide](#113-install-libre-tms) 
  on instructor.
- *02 mins* Configure the session by following the 
  [training session installation guide](#121-configure-and-install-training-session) 
  on instructor. Configure with `libre-session install`
- *08 mins* Configure and provision the infrastructure with 
  [AWS provisionning guide](#133-aws-provisionning) on instructor
  - *01 mins* Configure with `libre-infra aws config`
  - *05 mins* With aprox 2min more per student. Configure with 
    `libre-infra aws provision`
  - *10 mins* With aprox 2min more per student. Configure with 
    `libre-infra aws post-provision
- *05 mins* Start the training session with 
  [starting a training session](#14-start-your-training-session) on instructor