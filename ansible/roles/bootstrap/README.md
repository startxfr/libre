# LIBRE Training Toolkit - Bootstrap ansible role

Role used to handle basic bootstrap operations

## Parameters

- do: give an action (load, install, uninstall, status)

## Sample role for installing a bootstrap
```yaml
- name: "Execute install bootstrap"
  roles:
    - { role: bootstrap, do: load }
    - { role: bootstrap, do: install }
```

## Sample role for uninstalling a bootstrap
```yaml
- name: "Execute uninstall bootstrap"
  roles:
    - { role: bootstrap, do: load }
    - { role: bootstrap, do: uninstall }
```
