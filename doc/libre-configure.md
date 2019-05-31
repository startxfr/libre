<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/doc/assets/logo.svg?sanitize=true">

# Configure libre TMS

As soon as you have installed libre TMS using the [libre installer](installer.md) your curent user 
will have a `~/.libre` directory created and filled with the following files :

- [config.yml](#config.yml-libre-configuration-file)
- [session.yml](#session.yml-session-configuration-file)
- [repository.yml](#repository.yml-repository-configuration-file)
- [infra.yml](#infra.yml-infrastructure-configuration-file)





## config.yml : libre configuration file

This file define and configure your libre installation. This config file is
divided into 2 sections :

### application: Configuration of the libre application

Describe and configure your libre installation

| property      |   
+---------------|---------------------------------------------
| type          | libre installation type. Could be one of 'instructor' or 'student'
| version       | libre installation version
| verbose       | enable (True) or disable (False) verbose display mode
| debug         | enable (True) or disable (False) debug display mode
| ansible       | Path to ansible playbook and roles used by this libre environement
| source.repo   | URL of the libre SCM repository
| source.branch | Branch name in the libre SCM repository
| source.base   | Source code base directory in the libre SCM repository
| source.tmp    | Local temporary directory used during upgrade or reinstall

### directory: Libre directory configuration

Describe and configure your libre directory installation

| property      |   
+---------------|---------------------------------------------
| base          | Location of the training directory (course and session materials)
| conf          | Location of the course configuration directory (where course is configured)
| course        | Location of the course material directory (where course is installed)
| collect       | Location of the collector directory (where course logs are recorded)

### Sample file

```yaml
application:
  type: "instructor"
  version: "0.6.17"
  verbose: "True"
  debug: "True"
  ansible: "/usr/local/lib/libre-ansible"
  source:
    repo: "https://github.com/startxfr/libre"
    branch: "stable"
    base: "/"
    tmp: "/tmp/libre"
directory:
  base: "/usr/share/libre"
  conf: "/usr/share/libre/conf"
  course: "/usr/share/libre/course"
  collect: "/usr/share/libre/collect"
```




## repository.yml : repository configuration file

This file define and configure your course repository installation. 

| property  |   
+-----------|---------------------------------------------
| url       | URL of the courses content repository
| branch    | Branch name in the courses content repository
| base      | Base directory  in the courses content repository
| local     | Local cache directory

### Sample file

```yaml
url: "https://github.com/startxfr/libre"
branch: "stable"
base: "/courses-samples"
local: "/var/local/libre.repo"
```




## session.yml : session configuration file

This file define and configure your session backends. This config file is
composed of 2 configuration properties :

| property      |   
+---------------|---------------------------------------------
| type          | Default session backend to use (should be one of 'gapi', 'manual' or 'sample')
| gapi          | If session backend is 'gapi' you should define here your google script backend URL

### Sample file

```yaml
type: "sample"
gapi: "https://script.google.com/macros/s/XXXXXXX_DOCKEY_XXXXXXXXXXXXXXXXXX/exec"
```



## infra.yml : infrastructure configuration file

This file define and configure your infrastructure backends. This config file is
divided into 4 sections :

### default: Configuration of the default infrastructure backend

A single property `default` with the name of the default backend to use. 
Should be one of 'self', 'prem' or 'aws'.

### self: Configuration of the Self infrastructure backend

Describe and configure the self infrastructure backend

| property              |   
+-----------------------|------------------------------------------------
| type                  | Name of the infrastructure type (self)
| network.dns           | Domain name to use for the instructor station
| network.associated_ip | IP associated to this domain name


### prem: Configuration of the On-Premise infrastructure backend

Describe and configure the prem infrastructure backend

| property            |   
+---------------------|---------------------------------------------
| type                | Name of the infrastructure type (prem)
| network.dns         | Domain name to use for the instructor station
| ssh.privateKey_file | ssh private key file location
| ssh.user            | ssh user used to connect


### aws: Configuration of AWS infrastructure backend

Describe and configure the aws infrastructure backend

| property            |   
+---------------------|---------------------------------------
| type                | Name of the infrastructure type (aws)
| auth.access_key     | AWS access key to use for AWS interaction (Must have credentials over EC2, VPC, Route53 objects)
| auth.secret_key     | AWS secret key coresponding to the access key
| route53.zone        | AWS route53 declared zone to use
| route53.domain      | AWS route53 domain to use for compute node naming (will be overwrited by session configuration)
| ec2.region          | AWS EC2 region to use
| ec2.type            | AWS EC2 compute type to provision
| ec2.image           | AWS EC2 image used to boot (must be available in your region)
| ssh.keyname         | AWS EC2 key name coresponding to the private key file 
| ssh.privateKey_file | ssh private key file location
| ssh.user            | ssh user used to connect


### Sample file

```yaml
default: "self"
self: 
  type: "self"
  network:
    dns: "classroom.example.com"
    associated_ip: "127.0.0.1"
prem: 
  type: "prem"
  network:
    dns: "training.example.com"
  ssh:
    privateKey_file: "~/.libre/infra-id_rsa"
    user: "root"
aws: 
  type: "aws"
  auth:
    access_key: "False"
    secret_key: "False"
  route53:
    zone: "example.com"
    domain: "libre.example.com"
  ec2:
    region: "eu-west-3"
    type: "t2.micro"
    image: "ami-0e1ab783dc9489f34"
  ssh:
    keyname: "libre-instructor"
    privateKey_file: "~/.libre/infra-id_rsa"
    user: "centos"
```




## After libre configuration

Right after configuring your libre TMS, you can :

1. [Synchronize course repository](libre-repository.md)
2. [Setup a course session](session-config.md)
3. [Install a course session](session-install.md)
4. [Deploy a classroom](classroom-deploy.md)
5. [Start a course session](session-start.md)
