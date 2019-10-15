# LIBRE Course material sample repository

This directory contains course materials examples to use as a framework for building courses
ready to be delivered using LIBRE TMS.

## 1. EX001 - Complete example

Sample with Ansible actions used during LIBRE training lifecycle. It also includes _asciidoc_ sample 
to write your own content and scripts generating HTML, PDF, DocBook and epub.

## 2. Create a lab

#### 2.1 Add an entry to the manifest.yml file

The following properties are the minimum required. You can add others that will be available in your tasks.

```yaml
labs:
  - id: 'example1' # also used as folder name if `directory` is not defined
    idn: super-example # Used by the lab command, ex: `libre-lab grade super-example
    directory: "01.1_example" # Optional
    name: "Example lab: The first one"
    time: 10 # indicative, in minutes
    desc: |
      Description of the exercise
      and steps to execute
```


#### 2.2 Copy the example lab folder or create the following file tree

```
labs
├── 01.1_example
│   ├── ansible.cfg # mandatory
│   ├── inventory
│   │   ├── group_vars
│   │   │   └── mynodes.yml
|   |   └── myinventory
│   ├── resources # Contains all the resources the lab needs
│   │   ├── secret.txt # Or whatever
│   │   └── student # Contains all the resources students need, copied in the /home/student directory
│   │       ├── inventory
│   │       └── ansible.cfg
│   ├── start.yml
│   ├── stop.yml
│   └── grade.yml

```

start, stop and grade are entry points for `libre-lab <start|stop|restart|grade>`

You have access to two generated files:

- `manifest.yml`: contains the manifest values for the current lab (id, name, desc,...)
- `output.txt`: link to the file in which you have to write the outputs


#### 2.3 Create your lab environment as you want

```yaml
---
# labs/example1/start.yml

- hosts: webservers
  become: yes
  tasks:
    - name: Ensure the httpd package is not installed
      package:
       name: httpd
       state: absent
```
