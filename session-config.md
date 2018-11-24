# Course session setup

As soon as you have [installed libre TMS](installer.md), [configured your environement](libre-configure.md)
and [synchronized your courses materials](libre-repository.md), you can setup your course session. 

Remember that the course session backend is defined in the `~/.libre/session.yml` configuration file.

The `libre-session` command will help you interact with your session backend and start runing your course. 
You can use the following commands :

* `libre-session config`     will configure course session to deliver
* `libre-session install`    will install course session to deliver
* `libre-session start`      will start delivering course session
* `libre-session stop`       will stop delivering course session
* `libre-session uninstall`  will uninstall course session delivered
* `libre-session status`     will give you status of your course session to deliver
* `libre-session info`       will give you information about your course session to deliver
* `libre-session usage`      will help you find how to use this command
* `libre-session version`    will give you this command version

## Configure course session to deliver (manual)

Simply run `libre-session config` command. According to the configuration defined in `~/.libre/session.yml` you
will be warned for additionnals informations. After a successfull execution, you will find the course session configuration
file in `/libre/conf/session.json`. This file define the course session you are going to deliver, if you need to perform 
adjustement, you can modify this file manually.
Run `libre-session status` after configuration to check and display your configured course session.


## Configure course session to deliver (auto)

Because course session is a dependency of instructor component, session install, update and 
uninstall will be automatically performed when invoking command `libre-instructor`


## After session configuration

When your course session is configured, you can :

1. [Install a course session](session-install.md)
2. [Deploy a classroom](infra-deploy.md)
3. [Start a course session](session-start.md)
