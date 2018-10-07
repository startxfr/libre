# LIBRE SSH Key

Theses key are used in LIBRE playbooks and roles during installation and allow used 
to connect to there own environments.

Filename are of the form of `<user>-id_rsa` where user correspond to the user defined
with `infra_user_instructor` or `infra_user_student` config variables. Respective default 
values are **instructor** and **student**.


1. Instructor keys
    1. [Instructor RSA Public key](./instructor-id_rsa.pub)
    2. [Instructor RSA Private key](./instructor-id_rsa)
2. Student keys
    1. [Student RSA Public key](./student-id_rsa.pub)
    2. [Student RSA Private key](./student-id_rsa)