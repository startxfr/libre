<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/doc/assets/logo.svg?sanitize=true">

# LIBRE Console installation

LIBRE console allow LIBRE user to handle low level action like infrastructure deployement

## 1. Requirements

```bash
sudo su -
yum install -y curl git ansible
exit
```

## 2. Install console

```bash
git clone https://github.com/startxfr/libre /tmp/libre
cd /tmp/libre/ansible
git checkout v0.6.17
```

## 3. Test console

```bash
ansible -i /usr/share/libre/conf/inventory --list-hosts all
```

Should return

```bash
  hosts (1):
    localhost
```
