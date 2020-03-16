# SSH Notes!

From [Brad's SSH Crash Course](https://www.youtube.com/watch?v=hQWRp-FdTpc)

## Overview

#### What is SSH?

- Secure Shell
- Communication protocol (like http, https, ftp, etc)
- Do just about anything on the remote computer
- Traffic is encrypted
- Used mostly in the terminal/command line

### Client/Server Communication

- SSH is the client
- SSHD is the server (open SSH daemon)
- The server must have sshd installed and running or you will not be able to connect using SSH

### Authentication Methods

- Password
- Public / Private key pair
- Host based

Example:

    $ ssh brad@192.168.1.29

### Generating Keys

    $ ssh-keygen

- ~/.ssh/id_rsa (private key)
- ~/.ssh/id_rsa.pub (public key)
- Public key goes into server "authorized_keys" file

### What About Windows?

- Windows 10 now supports native SSH
- Putty is used in older versions of Windows
- Git Bash & other terminal programs include the SSH command & other Unix tools

## Diving In

Logging in:

    $ ssh user@SERVER_IP_ADDRESS

You'll see a message upon first login asking if you want to add that server IP to your list of known hosts. Say yes.

It'll ask you for a password for the server (not the local machine you're on)

That will display the welcome page.

# Misc Notes

- `ssh-agent && ssh-add` will add the passphrase for that session
- ssh login attempts are saved at /var/log/auth.log
- Made these changes to `/etc/ssh/sshd_config`
  - LogLevel VERBOSE
  - PasswordAuthentication no
  - AllowTcpForwarding no
  - X11Forwarding no
  - AllowUsers <user>
