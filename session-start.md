# Start course session

As soon as you have [installed libre TMS](installer.md), [configured your environement](libre-configure.md),
 [synchronized your courses materials](libre-repository.md) and
 [configured](session-config.md) and [installed your session](session-config.md) and
 [deployed your classroom](infra-deploy.md), you can start your session. 

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

## Start delivering your course session (manual)

Simply run `libre-session start` command. According to the configuration defined in `/libre/conf/session.json` 
course componet will be launched and main services will be enabled.
Run `libre-session status` after configuration to check and display your configured course session status.

## Start delivering your course session (auto)

Because course session is a dependency of instructor component, session install, start and 
uninstall will be automatically performed when invoking command `libre-instructor`


## After session startup

When your session is started you have to deliver you course an run :

1. [Switch from chapters](chapter-next.md)
2. [Start labs](labs-start.md)
3. [Terminate session](session-stop.md)
