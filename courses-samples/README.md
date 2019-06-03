# LIBRE Course material sample repository

This content store course materials examples to use as a framework for building course content
ready to be delivered using libre TMS.

## 1. EX001 - Complete example

Sample with ansible actions used during libre training lifecycle. Also include asciibook sample 
to write your own content and generator scripts generating html, pdf, docbook, epub

## 2. Create a lab

#### 2.1 Add an entry to the manifest.yml file

These keys are the minimum required, you can add others that will be available in your tasks.

```yaml
labs:
  - id: 'example1' # also used as folder name if `directory` is not defined
    idn: using_loops # Used by the lab command, ex: `lab grade using_loops
    directory: "01.1_loops" # Optionnal
    name: "Example lab: The first one"
    time: 10 # indicative, in minutes
    desc: |
      Description of the exercice
      and step to execute
```


#### 2.2 Copy the example lab folder or create the following file tree

```
labs
├── 01.1_loops
│   ├── ansible.cfg # mandatory
│   ├── inventory
│   │   ├── group_vars
│   │   │   └── mynodes.yml
|   |   └── inventory
│   ├── start.yml
│   ├── stop.yml
│   ├── grade.yml
│   ├── manifest.yml # generated
│   └── output.txt # generated symlink
```

start, stop and grade are entries points for `lab <start|stop|restart|grade>`

You have access to two generated files :
`manifest.yml` contains the manifest values for the current lab (id, name, desc,...)
`output.txt` link to the file in which you have to write the outputs


#### 2.3 Create your lab environment as you want

```yaml
---
# labs/example1/start.yml

- hosts: webservers
  become: yes
  tasks:
    - name: Ensure HTTPD package is unistalled
      package:
       name: httpd
       state: absent
```