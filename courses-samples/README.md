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
  - id: 'example1' # also used as folder name
    idn: using_loops # Used by the lab command, ex: `lab grade using_loops
    name: "Example lab: The first one"
    time: 10 # indicative, in minutes
    desc: |
      Description of the exercice
      and step to execute
```


#### 2.2 Copy the example lab folder or create the following file tree

```
labs
-- example1
---- start.yml
---- stop.yml
---- grade.yml
```

start, stop and grade are entries points for `lab <start|stop|restart|grade>`

You have access to two variables in these files :
`current_lab` contains the manifest values for the current lab
`grade_result_file` contains the file path in which you have to write the results


#### 2.3 Create your lab environment as you want

```yaml
# labs/example1/start.yml
- name: Create the /home/student/{{ current_lab.idn }} directory
    file:
    path: /home/student/{{ current_lab.idn }}
    state: directory
    owner: student
    group: student
    mode: 0755

- name: Copy default files to /home/student/{{ current_lab.idn }} directory
    loop: [ansible.cfg, inventory]
    copy:
    src: files/{{ item }}
    dest: /home/student/{{ current_lab.idn }}
    owner: student
    group: student
    mode: 0644
```