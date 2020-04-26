## Notes from The Linux Command Line Book

### Useful Commands To Remember

#### Chapter 1

- `date`: displays current time and date
- `cal`: displays calendar of current month
- `df`: display filesystem plus free space / size / mount info
- `free`: display amount of free memory
- `ctrl+alt+f1`: seems to return me to the Ubuntu login screen
- `ctrl+alt+f2`: puts me back into the Ubuntu GUI
- `ctrl+alt+f3/f4/f5/f6`: gives me tty3/4/5/6 terminals
- `ctrl+alt+f7`: gives me a screen that doesn't accept input which has `/dev/sda3: clean, XXXX/XXXX files, XXXX/XXXX blocks`

#### Chapter 2

- `pwd`: print working directory
- `cd`: change directory
- `ls`: list directory contents
- absolute paths: `/usr/bin`
- relative paths: `./bin` or `../dev`
  - single period `./` refers to current directory, double period `../` refers to parent directory

#### Chapter 3

- `file`: determine file type
- `less`: view file contents
- `ls`: `-a` all, including hidden - `-A` all, except `.` and `..` - `-S` sort by file size - `-t` sort by modification time - `-h` file sizes in human readable - `-F` adds `/` to directories and other indicator characters
- @@-rw-r--r-x@@: access rights to a file/directory. first char is type of file (@@-@@ for regular file, @@d@@ for directory). next sets of three are access rights for owner/group/everyone else.
- @@-rwxr--r-- 1 efex efex 2.5M Apr 5 09:08 rclone-copy.log@@ = @@(access rights) (num of hard links) (owner) (group) (size in bytes) (last mod date/time) (name of dir/file)@@
- @@reset@@: Ctrl-c to quit current process in terminal window
- @@/@@: root dir
- @@/bin@@: binaries needed to boot and run
- @@/boot@@: linux kernal, initial RAM disk img, and boot loader along with grub.conf
- @@/dev@@: device nodes
- @@/etc@@: system-wide config files plus shell scripts that start system services at boot time (check out /etc/crontab, /fstab, /passwd)
- @@/home@@: where each user's home directory is located
- @@/lib@@: contains shared library files used by core system programs
- @@/lost+found@@: used in case of a partial recovery from a file system corruption event
- @@/media@@: contains mount points for removable media that are auto-mounted
- @@/mnt@@: mount points for media mounted manually
- @@/opt@@: used to install optional software
- @@/proc@@: virtual file system maintained by the linux kernel
- @@/root@@: home dir of root user
- @@/sbin@@: system binaries (vital for system / superuser)
- @@/tmp@@: stores temp files from various programs
- @@/usr@@: contains all programs and support files used by regular users
- @@/usr/bin@@: contains executable programs installed by linux distro
- @@/usr/lib@@: shared libraries for programs in @@/usr/bin@@
- @@/usr/local@@: where programs not included in distro but are needed for system-wide use will be installed
- @@/usr/sbin@@: contains system admin programs
- @@/usr/share@@: all shared data used by programs in @@/usr/bin@@
- @@/usr/share/doc@@: documentation for packages installed
- @@/var@@: data that is likely to be changed will go into here. databases, spool files, user mail, and so forth
- @@/var/log@@: log files for various system activity (check out /messages and /syslog)

#### Chapter 4

pg 23

