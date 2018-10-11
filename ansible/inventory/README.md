# LIBRE Inventory samples

This directory provide you some inventory sample to use with you LIBRE deployement process

## 1. Basic inventory

These inventories give you basic inventory sample to use for classroom setup

### 1.1 Base inventory (base.yml)

[base.yml inventory](./base.yml) contain only one group `local` and could only be run on the
controller node. It is the default inventory used in all libre installation if no specific
inventory is pushed to the node during provisionning.

### 1.2 All-in-one inventory (allinone.yml)

[allinone.yml inventory](./allinone.yml) contain all groups (`local`, `instructor`, `students` and `classroom`)
with only one single host on each group : localhost. This inventory can be used for local test an debug of part
of the LIBRE playbooks.

## 2. Infrastructure inventory

These inventories give you a framework for provisionning classroom infrastructure using the
 [LIBRE console](../../install-console.md)

### 2.1 AWS Infrastructure inventory (infra-aws.sample.yml)

[infra-aws.sample.yml inventory](./infra-aws.sample.yml) must be used with the [provision](../playbooks/infra-aws#2-start-provisionning-classroom),
[post-provision](../playbooks/infra-aws#3-post-provisionning-classroom) or
[deprovision](../playbooks/infra-aws#5-deprovision-a-classroom) playbooks in the
[infra-aws playbooks library](../playbooks/README.md)
It will use local controller to execute AWS API calls and perform a full classroom installation
based on the configured session.

### 2.2 On-premise Infrastructure inventory (infra-prem.sample.yml)

[infra-prem.sample.yml inventory](./infra-prem.sample.yml) must be used with the [provision](../playbooks/infra-prem#2-start-provisionning-classroom),
[post-provision](../playbooks/infra-prem#3-post-provisionning-classroom) or
[deprovision](../playbooks/infra-prem#5-deprovision-a-classroom) playbooks in the
[infra-prem playbooks library](../playbooks/README.md)
It will use local controller to start a PXE boot server and later execute SSH calls
to perform classroom post-provisionning operations based on the configured session.

### 2.3 Self-hosted Infrastructure inventory (infra-self.sample.yml)

[infra-self.sample.yml inventory](./infra-self.sample.yml) must be used with the [provision](../playbooks/infra-self#2-start-provisionning-classroom),
[post-provision](../playbooks/infra-self#3-post-provisionning-classroom) or
[deprovision](../playbooks/infra-self#5-deprovision-a-classroom) playbooks in the
[infra-self playbooks library](../playbooks/README.md)
It will use local controller to perform a full classroom installation on the
local environement as a standallone instructor and student workstation.
