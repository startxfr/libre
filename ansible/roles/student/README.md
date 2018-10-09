# LIBRE Training Toolkit - Student ansible role 

Role used to handle basic student operations

## Parameters

- do: give an action (load, install, uninstall, status)


## Sample role for installing a student
```yaml
- name: "Execute install student"
  roles:
    - { role: student, do: load }
    - { role: student, do: install }
```

## Sample role for uninstalling a student
```yaml
- name: "Execute uninstall student"
  roles:
    - { role: student, do: load }
    - { role: student, do: uninstall }
```
