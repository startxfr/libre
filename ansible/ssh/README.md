# LIBRE SSH Key

Theses keys are used in LIBRE playbooks and roles during installation and allow users
to connect to their own environments.

Filenames are of the form `<user>-id_rsa` where _user_ corresponds to the user defined
with `infra_user_instructor` or `infra_user_student` config variables. Respective default
values are **instructor** and **student**.


1. Instructor keys
    1. [Instructor RSA Public key](./instructor-id_rsa.pub)
    2. [Instructor RSA Private key](./instructor-id_rsa)
2. Student keys
    1. [Student RSA Public key](./student-id_rsa.pub)
    2. [Student RSA Private key](./student-id_rsa)
