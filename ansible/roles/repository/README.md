# LIBRE Training Toolkit - Training-Repo ansible role

Role used to handle basic repository operations

## Parameters

- do: give an action (load, install, update, uninstall, status)


## Sample role for installing a training repository
```yaml
- name: "Execute install repository"
  roles:
    - { role: repository, do: load }
    - { role: repository, do: install }
```

## Sample role for updating a training repository
```yaml
- name: "Execute updating repository"
  roles:
    - { role: repository, do: load }
    - { role: repository, do: update }
```

## Sample role for uninstalling a training repository
```yaml
- name: "Execute uninstall repository"
  roles:
    - { role: repository, do: load }
    - { role: repository, do: uninstall }
```
