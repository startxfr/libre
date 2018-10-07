# LIBRE Training Toolkit - LIBRE ansible role 

Role used to handle basic libre operations

## Parameters

- do: give an action (load, install, uninstall, status)


## Sample role for installing LIBRE
```yaml
- name: "Execute install LIBRE"
  roles:
    - { role: libre, do: load }
    - { role: libre, do: install }
```

## Sample role for uninstalling a LIBRE
```yaml
- name: "Execute uninstall LIBRE"
  roles:
    - { role: libre, do: load }
    - { role: libre, do: uninstall }
```