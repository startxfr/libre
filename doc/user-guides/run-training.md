<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/doc/assets/logo.svg?sanitize=true">

# LIBRE Run a training user guide

## Start chapter 

When you execute the following command, a log trace is recorded in the
course log file.
This operation is not mandatory but it help us track the course evolution and 
will help us improve courseware material.

```bash
[root@instructor ~]# libre-chapter start <chapter_name>
```

## Start lab

The 0 environement is reserved to the instructor. You must connect to the 
you workstation in order to execute lab tasks. You can pass a lab number 
(based on the section index in course book) or a lab name (as referenced
in course book) to manage lab context.

```bash
[root@instructor ~]# libre-lab start <lab_name>
```

In order to manage lab workflow, you can use the following commands

```bash
[root@instructor ~]# libre-lab grade <lab_name>
```

> **NOTICE**:  Grade and stop action could be executed without a lab number
  or lab name. In that case, last started lab will be used.

## Stop lab

```bash
[root@instructor ~]# libre-session stop <lab_name>
```

## Stop chapter

```bash
[root@instructor ~]# libre-chapter stop <chapter_name>
```