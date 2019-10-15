<img align="right" height="50" src="https://raw.githubusercontent.com/startxfr/libre/dev/docs/assets/logo.svg?sanitize=true">

# LIBRE installer

## With internet access

### Fast method (sudo)

Run this script in order to download and run the libre TMS installer
```bash
sudo yum install -y curl
sudo curl -L https://goo.gl/T8Dw9J -o /tmp/libre-installer
sudo chmod +x /tmp/libre-installer
/tmp/libre-installer install
```

### Fast method (sudo su -)

Run this script in order to download and run the libre TMS installer
```bash
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/libre-installer
chmod +x /tmp/libre-installer
/tmp/libre-installer install
```

### Step by step (using root)

1. Become root user
```bash
sudo su -
```

2. Ensure that you have curl installer
```bash
yum install -y curl
```

3. Download installer script
```bash
curl -L https://goo.gl/T8Dw9J -o /tmp/libre-installer
```

4. Adapt permission to allow execution
```bash
chmod +x /tmp/libre-installer
```

5. Run the installer
```bash
/tmp/libre-installer install
```

## Without internet access

### Using LIBRE-USB USB key

TODO 


## After instructor installation

Right after installing libre TMS, you can :

1. [Perform additionnal configuration](libre-configure.md)
2. [Synchronize course repository](libre-repository.md)
3. [Setup a course session](session-config.md)
4. [Install a course session](session-install.md)
5. [Deploy a classroom](classroom-deploy.md)
6. [Start a course session](session-start.md)

