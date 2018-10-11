# LIBRE SELF Provisionning playbooks

Theses playbooks must be run from a console installation. For more more informations
you can read documentation on how to [setup a console installation](../../../install-console.md)


## 1. Setup provisionning

After installing console, you should be under the `~/libre/ansible` directory. You must
then create your own `inventory.yml` file.

### 1.1 Copy sample file

You will find `inventory/infra-self.yml` as a sample file in the console directory.
This file contain all configuration variables used during SELF provisionning playbook and
could be used as as starting point for your own deployement.

```bash
cp inventory/infra-self.yml inventory.yml
```

### 1.2 Create from sample

You can edit inventory.yml file (`vi inventory.yml`) and place the following content :

```yaml
---
local:
  hosts:
    localhost:
  vars:
    # Set SELF access key to use fot this deployement
    infra_self_access_key: "XXXXXXXXXXXXX"
    # Set SELF secret key to use fot this deployement
    infra_self_secret_key: "XXXXXXXXXXXXXX"
    # Set SELF route53 sub-domain to use for deploying DNS classroom names
    infra_self_dns_zone: training.example.com
    # Set SELF route53 region to use for deploying DNS classroom names
    infra_self_route53_dns_zone: example.com
    # Set SELF region to use for this deployement
    infra_self_region: eu-west-1
    # Set SELF type of instance
    infra_self_instance_type: t2.micro
    # Set Number of instance (will be upgraded with the number of students + instructor and spare)
    infra_self_instance_nb: 1
    # Set AMI base image (must be available in the region)
    # - Centos Official 7.4 base image
    infra_self_image: ami-3548444c
    # Set SELF key name to set into the EC2 instances
    infra_self_key_name: my-self-ssh-key
    # Set SELF private key related to the previous key name
    infra_self_ssh_private_key_file: ~/.ssh/id_rsa
    # Set ssh user used to connect to the EC2 instance
    infra_self_ssh_user: centos
```

## 2. Start provisionning classroom

During this process, you will be prompted for a session ID and token. This information is mandatory
for this process as it control autorisation to deploy course content. This session contains also
information required for this deployment, like the number of workstation to deploy.

```bash
ansible-playbook -i inventory.yml -e target=local playbooks/infra-self/provision.yml
```

By running the provision playbook, you will start :
- Create classroom dedicated VPC
- Create classroom VPC subnet
- Create classroom VPC Internet Gateway
- Create classroom VPC public route table
- Create classroom VPC security group
- Create classroom EC2 instance
- Create classroom DNS entries
- Generate inventory file

## 3. Post-provisionning classroom

After a good SELF provisionning, you must have fully workable EC2 instance as well as
a new inventory referencing student and instructor workstations. You must finish deployement
by running the post deployement playbook.

```bash
ansible-playbook -i inventory.yml -e target=classroom playbooks/infra-self/provision-post.yml
```

By running the post provision playbook, you will start :
- Updating all hostname
- Installing LIBRE into instructor workstation
- Installing LIBRE into students workstation
- Copy classroom inventory to instructor workstation

## 4. Next step

When you have finished this installation, you can connect to the instructor workstation
and start configuring your classroom.

```bash
ssh -i ~/my-self-ssh-key.pem centos@instructor.<session>.training.example.com
libre-session install
```

## 5. Deprovision a classroom

You can run this playbook from every LIBRE console. you will be prompted for a session ID and token.
This information is mandatory for this process as it control autorisation to undeploy course content.

```bash
ansible-playbook -i inventory.yml -e target=local playbooks/infra-self/deprovision.yml
```

## 6. Troubleshooting



