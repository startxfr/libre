# LIBRE Training Toolkit - Instructor ansible role 

Role used to handle basic instructor operations

## Parameters

- do: give an action (load, install, uninstall, status)
- courses_repository_enable: boolean to activate course directory
- courses_repository_dir: directory used to store repository content
- courses_repository_tmp: directory used when clonning course directory
- courses_repository_distant_url: url of the distant courses material repository
- courses_repository_distant_branch: branch containing courses material release
- courses_repository_distant_base: base directory containing courses materials

## Sample role for installing a instructor
```yaml
- name: "Execute install instructor"
  roles:
    - { role: instructor, do: load }
    - { role: instructor, do: install }
```

## Sample role for uninstalling a instructor
```yaml
- name: "Execute uninstall instructor" 
  roles:
    - { role: instructor, do: load }
    - { role: instructor, do: uninstall }
```