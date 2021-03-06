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
  working classrooms environments using a bootstrap station
- **bootstrap** Physical or virtual station used to provision and manage
  multiple training session environments from a same location.
- **station** Computer unit used by instructor or student during a training session
- **workstation** Special computer unit used by instructor or student to access their
  dedicated workspace environment using a graphical interface (act as bastion).


## 1. Provisionner guide

- [Install a bootstrap environment](user-guides/install-bootstrap.md)
- [Configure and install a training session](user-guides/install-session.md#configure)
- [Configure an infrastructure environment](user-guides/install-infra.md#configure)
- [Provision a classroom environment](user-guides/install-infra.md#provision)
- [Deploy a classroom environment](user-guides/install-infra.md#post-provision)
- [Start a training session](user-guides/install-session.md#start-the-training)
- [Run a training session](user-guides/run-training.md)
- [Close a training session](user-guides/uninstall-session.md)
- [Deprovision  a classroom environment](user-guides/uninstall-infra.md)
- [Uninstall an instructor environment](user-guides/uninstall-instructor.md)


## 2. Trainer guide

- [Start a training session](user-guides/install-session.md#start-the-training)
- [Run a training session](user-guides/run-training.md)
- [Close a training session](user-guides/uninstall-session.md)
- [Uninstall an instructor environment](user-guides/uninstall-instructor.md)


## 3. Developer guide

- [Main files and directory structure](developer/FILES.md)
- [Main LIBRE commands](developer/BIN.md)
- [Release history and conventions](RELEASES.md)


## 4. Deployement workflow

To get a training environement, you should follow this workflow :

1. Provision or access a bootstrap environment (provisionner)
2. Configure the targeted training session (provisionner)
3. Provision the training classroom (provisionner)
4. Start and run the training classroom (trainer)
4. Terminate the training classroom (provisionner)










The full installation of a classroom, using an AWS infrastructure backend, takes
approximately 25min (4-student classroom) using the following scenario:

- *02 mins* Provision the bootstrap AWS instance (out of this scope)
- *05 mins* Apply [bootstrap requirements](#111-bootstrap-requirements)
- *02 mins* Configure [STARTX LIBRE environment](#112-configuring-startx-libre-environment-on-instructor) 
  on instructor
- *02 mins* Setup [STARTX AWS infrastructure config](#433-aws-infractusture) on 
  ~/.libre/infra.yml instructor config
- *08 mins* Install LIBRE using the [LIBRE installation guide](#113-install-libre-tms) 
  on instructor.
- *02 mins* Configure the session by following the 
  [training session installation guide](#121-configure-and-install-training-session) 
  on instructor. Configure with `libre-session install`
- *08 mins* Configure and provision the infrastructure with 
  [AWS provisioning guide](#133-aws-provisioning) on instructor
  - *01 mins* Configure with `libre-infra aws config`
  - *05 mins* With approx. 2min more per student. Configure with 
    `libre-infra aws provision`
  - *10 mins* With aprox 2min more per student. Configure with 
    `libre-infra aws post-provision
- *05 mins* [Start a training session](#14-start-your-training-session) on instructor
