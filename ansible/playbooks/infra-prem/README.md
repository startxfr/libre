# LIBRE On-premise Provisionning playbooks

Theses playbooks must be run from a console installation. For more more informations
you can read documentation on how to [setup a console installation](../../../install-console.md) 


## 1. Setup provisionning

After installing console, you should be under the `~/libre/ansible` directory. You must
then create your own `inventory.yml` file.

### 1.1 Copy sample file

You will find `inventory/infra-prem.yml` as a sample file in the console directory.
This file contain all configuration variables used during On-premise provisionning playbook and
could be used as as starting point for your own deployement. 

```bash
cp inventory/infra-prem.yml inventory.yml
```

### 1.2 Create from sample

You can edit inventory.yml file (`vi inventory.yml`) and place the following content :

```yaml
---
local:
  hosts:
    localhost:
  vars:
    # Set DNS sub-domain to use for deploying DNS classroom names
    infra_prem_dns_zone: training.example.com
    # Set On-premise private key tu use for ssh connection
    infra_prem_ssh_private_key_file: ~/my-ssh-key.pem
    # Set ssh user used to connect to the workstation
    infra_prem_ssh_user: centos
```

## 2. Start provisionning classroom

During this process, you will be prompted for a session ID and token. This information is mandatory
for this process as it control autorisation to deploy course content. This session contains also 
information required for this deployment, like the number of workstation to deploy.

```bash
ansible-playbook -i inventory.yml -e target=local playbooks/infra-prem/provision.yml
```

By running the provision playbook, you will start :
- Create classroom Network
- Create classroom Network Internet Gateway 
- Create classroom Network route table 
- Create classroom Network security group
- Test classroom workstation
- Create classroom DNS entries
- Generate inventory file

## 3. Post-provisionning classroom

After a good on-premise provisionning, you must have fully workable workstations as well as
a new inventory referencing student and instructor workstations. You must finish deployement
by running the post deployement playbook.

```bash
ansible-playbook -i inventory.yml -e target=classroom playbooks/infra-prem/provision-post.yml
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
ssh -i ~/my-ssh-key.pem instructor@instructor.training.example.com
libre-session install
```

## 5. Deprovision a classroom

You can run this playbook from every LIBRE console. you will be prompted for a session ID and token. 
This information is mandatory for this process as it control autorisation to undeploy course content. 

```bash
ansible-playbook -i inventory.yml -e target=local playbooks/infra-prem/deprovision.yml
```

## 6. Troubleshooting


