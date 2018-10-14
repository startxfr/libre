# LIBRE Training Toolkit - On-Premise provisionning ansible role

Role used to handle basic infrastructure operations


## Parameters

- do: give an action (load, provision, provision-post, deprovision, status)

## Sample role for deploying a classroom infrastructure
```yaml
- name: "Execute provision classroom infrastructure"
  roles:
    - { role: infra_prem, do: load }
    - { role: infra_prem, do: provision }
```
then with updated inventory
```yaml
- name: "Execute post provision classroom infrastructure"
  roles:
    - { role: infra_prem, do: load }
    - { role: infra_prem, do: provision-post }
```

## Sample role for undeploying a classroom infrastructure
```yaml
- name: "Execute deprovision classroom infrastructure"
  roles:
    - { role: infra_prem, do: load }
    - { role: infra_prem, do: deprovision }
```
