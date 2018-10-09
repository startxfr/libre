# LIBRE Training Toolkit - Lab ansible role 

Role used to handle basic lab operations


## Parameters

- do: give an action (load, start, stop, reset, status)

## Sample role for starting a lab
```yaml
- name: "Execute start lab"
  roles:
    - { role: lab, do: load }
    - { role: lab, do: start }
```

## Sample role for stopping a lab
```yaml
- name: "Execute stop lab"
  roles:
    - { role: lab, do: load }
    - { role: lab, do: stop }
```

## Sample role for reseting a lab
```yaml
- name: "Execute reset lab"
  roles:
    - { role: lab, do: load }
    - { role: lab, do: reset }
```
