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
git checkout master
```

## 3. Test console

```bash
ansible -i inventory.yml --list-hosts all
```

Should return

```bash
  hosts (1):
    localhost
```
