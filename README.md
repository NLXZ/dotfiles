# Dotfiles
![Main view screenshot](https://i.imgur.com/nar96lN.png)

## Installation
I created a repository with an Ansible playbook to automatically setup Kali Linux with this dotfiles and some more configurations:  
  
[https://github.com/NLXZ/kali-setup](https://github.com/NLXZ/kali-setup)

Or just run:
```shell
# Clone the repository
git clone https://github.com/NLXZ/dotfiles ~/.dotfiles

# Create the link (CAUTION)
stow -t ~ -d ~/.dotfiles --adopt .
```
