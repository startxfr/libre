# LIBRE Training Toolkit - Chapter ansible role 

Role used to handle basic chapter operations

## Parameters

- do: give an action (load, start, stop, status)

## Sample role for starting a chapter
```yaml
- name: "Execute start chapter"
  roles:
    - { role: chapter, do: load }
    - { role: chapter, do: start }
```

## Sample role for stopping a chapter
```yaml
- name: "Execute stop chapter"
  roles:
    - { role: chapter, do: load }
    - { role: chapter, do: stop }
```
