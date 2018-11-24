# Install course session

As soon as you have [installed libre TMS](installer.md), [configured your environement](libre-configure.md),
 [synchronized your courses materials](libre-repository.md) and
 [configured your session](session-config.md), you can install your session. 

Remember that the course session is defined in the `/libre/conf/session.json` configuration file.

The `libre-session` command will help you interact with the configured session and start runing your course. 
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

## Deploy course session to deliver (manual)

Simply run `libre-session install` command. According to the configuration defined in `/libre/conf/session.json` 
Course will be installed into your instructor installation. 
After a successfull execution, course will be ready to be run on instructor machine and deploy into the 
classroom infrastructure. 
Run `libre-session status` after configuration to check and display your configured course session.

## Deploy course session to deliver (auto)

Because course session is a dependency of instructor component, session install, update and 
uninstall will be automatically performed when invoking command `libre-instructor`


## After session installation

When your session is installed and your `/libre/course` directory is filled with course content material, you can :

1. [Deploy a classroom](infra-deploy.md)
2. [Start a course session](session-start.md)
