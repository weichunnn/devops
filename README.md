# Documenting Dev Ops Journey

# Tech Stack 
1. Terraform
2. Ansible
3. Jenkins
4. Kubernetes
5. Docker

# Experiments Explored
1. Immutable Infrastructure
2. Button Click Deployment
3. Reverse Proxy Hosting with SSL Certificate (self signed & Let's Encrypt Automtation)

# Issues Faces and Solved

## Docker Build on M1 Mac
M1 docker preview and keycloak 'image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8)' Issue

```
# specify build platform
docker build . -t <user>/<image-name> --platform linux/x86_64
```

## Jenkins SSH Issue with Ubuntu v22
Reason: ssh-rsa based on sha-1 is deprecated in latest ubuntu version 
1. Downgrade to Ubuntu 18
2. Troubleshoot by adding key accepted type (https://bbs.archlinux.org/viewtopic.php?id=270005)
```
# get auth log from ssh daemon and figure out why
grep sshd /var/log/auth.log
https://bbs.archlinux.org/viewtopic.php?id=270005
```


## Ansible Playbook Cannot Invoke Through Jenkins
1. Python Download of Pip seems to not play well (ansible is install on user locally and jenkins unable to access)
2. Install and setup via apt-get is workable (with other python modules)


# Useful Code Snippet
## Generation of Self Signed Cert
```
openssl req -x509 -nodes -days 365 \
-subj "/C=US/ST=Oregon/L=Portland/O=TechNode, LLC/CN=weichunnn.tech" \
-newkey rsa:2048 -keyout /etc/nginx/private/nginx-selfsigned.key \
-out /etc/nginx/certs/nginx-selfsigned.crt;
```

## Manage Docker Through Ansible
```
---
- name: provision web server
  hosts: tag_group_web
  tasks:
    - name: install docker
      apt: 
        update_cache: yes
        name: docker.io
      become: yes
    
    - name: start docker
      shell: |
        systemctl start docker
        systemctl enable docker
      become: yes

    - name: run image
      shell: docker run --name hello-world -d -p 80:80 -p 443:443 weichunnn/nginx-static
      become: yes
```
