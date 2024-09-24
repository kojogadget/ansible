# Kjartan's Get Started Script

This is an ansible playbook that currently works on systems with the apt and dnf package managers. The script will recreate the environment I use daily so that I won't have to remember everything if I find my self on a new system. 

## Run

The command to run the script is:

```zsh
ansible-playbook local.yml -JK
```

## Docker

There are also some dockerfiles in this repo. These are for testing purposes. 

## Acknowledgements

This project was inspired by and adapted from [ThePrimeagen](https://github.com/ThePrimeagen/ansible).

