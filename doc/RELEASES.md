<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/doc/assets/logo.svg?sanitize=true">

# Release convention

| Release  | Kind  | Description
|----------|-------|------
| x.0.0    | Major | Major change in the libre constitution
| x.x.0    | Minor | Major change in offered in libre config (second numeric coresponding to the stable libre release number. ex: libre 0.2 = stable 0.2 release)
| x.x.x    | Push  | Evolution, bugfix or security fix related to the libre build construction. Pair number are for stables releases. Unpair number are for tests releases.

# Release naming rules

Release name are based on constellation name seleted according to major star proximity to the [solar system](https://en.wikipedia.org/wiki/Solar_System).
The clostest the constellation are from the solar system, the better they are.
- *Major release* are [planetary system](https://en.wikipedia.org/wiki/Planetary_system)
- *Minor releases* are [constellation](https://en.wikipedia.org/wiki/Constellation) inside the planetary system
- *Atomic releases* are [stars](https://en.wikipedia.org/wiki/Star) inside the constellation

| Release  | Name      | Description
|----------|-----------|------
| 1.0.x    | Solar     | To be defined
| 0.9.x    | Lyra      | To be defined
| 0.8.x    | Centaurus | To be defined
| 0.7.x    | Cygnus    | To be defined
| 0.6.x    | Pegasus   | Stable classroom deployment in AWS
| 0.5.x    | Cetus     | Stable release for Centos 7.6 environment
| 0.4.x    | Sextans   | Stabilize infra AWS deployment
| 0.3.x    | Orions    | Adding infra management
| 0.2.x    | Hydrus    | Adding session management
| 0.1.x    | hercules  | Revamped with NoSuchCommand review
| 0.0.x    | libra     | POC for libre istallation


# Release history

## version 0.6.x (Pegasus)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.6.3    | 2019-05-12 | Move self infra to kvm backend and introduce infra state
| 0.6.1    | 2019-05-12 | Optimize loading sequence
| 0.6.0    | 2019-05-06 | Stable release for infra deployment in aws environment

## version 0.5.x (Cetus)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.5.99   | 2019-05-09 | Debug infra aws deployment
| 0.5.44   | 2019-05-02 | Stable instructor install on Centos 7.6
| 0.5.43   | 2019-04-29 | Add repository refresh on install and signsheet record in instructor container
| 0.5.40   | 2019-04-27 | Update to Centos 7.6 environement
| 0.5.34   | 2018-12-09 | Reorg var dependencies and log management
| 0.5.32   | 2018-11-30 | Clean service dependencies
| 0.5.30   | 2018-11-27 | Upgrade sxapi dependencies in instructor container (move to yaml)
| 0.5.24   | 2018-11-10 | Improve configuration option in user ~/.libre directory
| 0.5.10   | 2018-11-07 | Improve error handling
| 0.5.0    | 2018-10-31 | Change in user management

## version 0.4.x (Sextans)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.4.26   | 2018-10-26 | Stable release for Centos deployment
| 0.4.14   | 2018-10-25 | Refactor and optimize ansible code
| 0.4.8    | 2018-10-18 | Change usage and help script
| 0.4.6    | 2018-10-15 | Move to an exclusive Centos environment installation
| 0.4.2    | 2018-10-14 | Improve online help and dynamic loading
| 0.4.0    | 2018-10-11 | Fixed installer by NoSuchCommand

## version 0.3.x (Orion)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.3.16   | 2018-10-11 | Stable release with limited option for infra
| 0.3.8    | 2018-10-10 | Move directory structure with NoSuchCommand expertise
| 0.3.4    | 2018-10-10 | Upgrade sxapi dependencies in instructor container
| 0.3.2    | 2018-10-09 | Add course book display in instructor container
| 0.3.1    | 2018-10-08 | Instructor container can display course and session info
| 0.3.0    | 2018-10-07 | Add instructor container

## version 0.2.x (hydrus)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.2.14   | 2018-10-06 | Add aws and prem infra backend
| 0.2.12   | 2019-10-05 | Add self infrastruction backend
| 0.2.6    | 2019-10-04 | Exchange info between ansible and bin script with /tmp/libre.txt 
| 0.2.0    | 2018-10-03 | Add auto-completion script

## version 0.1.x (hercules)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.1.22   | 2018-10-01 | Introduce infra role
| 0.1.12   | 2019-10-01 | Improve bin command
| 0.1.8    | 2018-09-30 | Add lab, chapter and course role
| 0.1.2    | 2018-09-29 | Introduce ~/.libre configuration directory
| 0.1.1    | 2018-09-28 | Reorg var inclusion in all roles
| 0.1.0    | 2018-09-27 | Revamping code by NoSuchCommand

## version 0.0.x (libra)

| Release  | Date       |  Description
|----------|------------|-------------
| 0.0.6    | 2018-09-26 | Add instructor and student role
| 0.0.5    | 2018-09-25 | Add repository role
| 0.0.4    | 2018-09-22 | Add libre role
| 0.0.2    | 2018-09-21 | Add libre installer

## version beta (zero-day)

| beta     | 2018-09-14 | test component for POC TMS capacities
