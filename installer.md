# LIBRE installer

## With internet access

### Fast method (sudo)

Run this script in order to download and run the libre TMS installer
```bash
sudo yum install -y curl
sudo curl -L https://goo.gl/T8Dw9J -o /tmp/installer-libre
sudo chmod +x /tmp/installer-libre
/tmp/installer-libre 
```

### Fast method (sudo su -)

Run this script in order to download and run the libre TMS installer
```bash
sudo su -
yum install -y curl
curl -L https://goo.gl/T8Dw9J -o /tmp/installer-libre
chmod +x /tmp/installer-libre
/tmp/installer-libre 
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
curl -L https://goo.gl/T8Dw9J -o /tmp/installer-libre
```

4. Adapt permission to allow execution
```bash
chmod +x /tmp/installer-libre
```

5. Run the installer
```bash
/tmp/installer-libre
```

## Without internet access

### Using LIBRE-USB USB key

TODO
