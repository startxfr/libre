# Synchronize libre TMS

As soon as you have [installed libre TMS](installer.md) and [configured](libre-configure.md) your 
libre installation, you can start synchronize course content. 

Remember that the course content repository is defined in the `~/.libre/repository.yml` configuration file.

The `libre-repository` command will help you interact with your local course repository. 
You can use the following commands :

* `libre-repository install`    will install remote course content into your local course cache directory
* `libre-repository update`     will update your local course cache directory with fresh remote course content
* `libre-repository uninstall`  will uninstall your local course cache directory
* `libre-repository status`     will give you status of your local course cache directory
* `libre-repository info`       will give you information about your local course cache directory
* `libre-repository usage`      will help you find how to use this command
* `libre-repository version`    will give you this command version


## Install course repository (manual)

Simply run `libre-repository install` command and you will have a local course content directory created
according to the configuration defined in `~/.libre/repository.yml`.
You can run `libre-repository status` to display your course cache status and content.


## Install course repository (auto)

Because course repository is a dependency of instructor, session or infrastructure components, repository install, update and 
uninstall will be automatically performed when invoking command like `libre-instructor`, `libre-infra` or `libre-infra`


## After course content caching

When your course cache content is filled with course materials, you can :

1. [Setup a course session](session-config.md)
2. [Install a course session](session-install.md)
3. [Deploy a classroom](infra-deploy.md)
4. [Start a course session](session-start.md)
