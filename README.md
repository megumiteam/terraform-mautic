## Mautic Resoruce Templates

Easy deploy Mautic webserver on AWS.

### Required
- terraform
- direnv

### Init

```
$ cp terraform.tfvars.example terraform.tfvars
$ cp .envrc.example .envrc
```

### Setup Environment vars

```
$ vim .envrc
export AWS_PROFILE=YOUR_AWS_PROCILE
export AWS_REGION=ap-northeast-1

$ direnv allow
```

### Setup Resources config

```
$ vim terraform.tfvars
cidr = "172.31.0.0/16"
site_name  = "mautictest"
stage = "development"
domain = "example.com"
allow_ip = "0.0.0.0/0"
key_name = "YOUR_SSH_KEY_NAME"
```

### Check Resource Updates

```
$ terraform plan
```


### Deploy

```
$ terraform apply
```

### Update EC2 UserData

1: Edit `userdata.sh`
```
$ vim userdata.sh
```

2: Base64 encode
```
$ cat userdata.sh | openssl enc -e -base64
```

3: Overwrite `30_ec2.tf` file.
