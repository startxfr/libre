# LIBRE Training Toolkit - Training-Repo ansible role 

Role used to handle basic training_repo operations

## Parameters

- do: give an action (load, install, update, uninstall, status)


## Sample role for installing a training repository
```yaml
- name: "Execute install training_repo"
  roles:
    - { role: training_repo, do: load }
    - { role: training_repo, do: install, become: yes }
```

## Sample role for updating a training repository
```yaml
- name: "Execute start training_repo"
  roles:
    - { role: training_repo, do: load }
    - { role: training_repo, do: update, become: yes }
```

## Sample role for uninstalling a training repository
```yaml
- name: "Execute uninstall training_repo"
  roles:
    - { role: training_repo, do: load }
    - { role: training_repo, do: uninstall, become: yes }
```
