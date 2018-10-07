# LIBRE Training Toolkit - Session ansible role 

Role used to handle basic session operations

## Parameters

- do: give an action (load, install, start, stop, uninstall, status)


## Sample role for installing a session
```yaml
- name: "Execute install session"
  roles:
    - { role: session, do: load }
    - { role: session, do: install }
```

## Sample role for starting a session
```yaml
- name: "Execute start session"
  roles:
    - { role: session, do: load }
    - { role: session, do: start }
```

## Sample role for stopping a session
```yaml
- name: "Execute stop session"
  roles:
    - { role: session, do: load }
    - { role: session, do: stop }
```

## Sample role for uninstalling a session
```yaml
- name: "Execute uninstall session"
  roles:
    - { role: session, do: load }
    - { role: session, do: uninstall }
```