- arch/uname -m (architecture of OS)
- whoami (current usermame)
- who (current user)
- pwd : present working directory
- ls : List (what's in dir)
- cat : Concatenation (read file content) (-n show line numbers also)
- wc : Word Count (count no of lines, words, characters in file)

[<user>@<host> ~]$ (~: root dir, $: normal user shell)

- sudo -i : Superuser do (switch to root user)

[<root>@<host> /]# (/: root dir, #: root user shell)

- exit (logout)
- mkdir (create dir)
- mv/cp -r(to copy dir) file1 dir1/ (move/copy file1 => dir1)
- cd /home (change dir)
- file (to check the type of file)
- ln -s <complete-path> <shortcut> (creating shortcuts)

### ** files **

- ls -l
  - : file (text, executable)
    d : dir
    c : character (device files /dev, for i/o) (Represent hardware devices that handle data as a stream of characters (e.g., keyboards, serial ports).
    b : block file (disk file/ block disk file) (Represent devices that handle data in blocks, like hard drives or USB drives.)
    l : link (shortcuts)
    p : FIFO / Named Pipe (Special files for inter-process communication (IPC). Data written by one process can be read by another in a first-in, first-out manner.)
    s : socket file (Used for IPC, particularly in networking, allowing processes to communicate over the network.)

### ** Filters **

- grep <to-search> <filename> : Global Regular Expression Print (Refers to searching throughout the entire file or input)
- find <filename> (Used to find the pathname of the file)
- less / more <filename> (display file content page-wise/line-wise)
- head / tail <filename> -n (display top/bottom n lines of file) (-f for file monitoring)
- cut/awk -d<delimeter> -f<field/column> (to get the column after delimeter)
- sed 's/<search-for>/replace-with/g'

### ** Redirection **

- </> (input / output to overwrite file or create new one)
- > > (append)
- &>> (append all output)
- 2>> (append only error)

### ** Piping **

- <first-command> | <second-command> (send the output of first as input to second command)

### ** Users **

- /etc/passwd (file)
  - <username>:<shadow file shortcut>:<userId>:<groupId>:<comment>:<home dir>:<shell>
  - root:x:0:0:root:/root:/bin/bash
    root: username
    x: link to password file /etc/shadow
    0: user Id
    0: group Id
    root: comment
    /root: home dir
    /bin/bash: shell

### ** Groups **

- /etc/group (file)
  - <groupname>:<shortcut to password>:<groupId>:<group members>
  - vagrant:x:1000:vagrant
- id <user> (get id info about user)
- groups <user> (get groups info of user)
- useradd/adduser <username> (add newuser)
- passwd <username> (set or reset password of user)
- groupadd <groupname> (add group)
- usermod -a(append to supplementary group) -G(list of supplementary groups) -g(change primary group) <groupname> <username> (add user to supplementary group)
- last (history of users logged into system)
- userdel -r <username>, rm -rf /home/<username> (remove user)
- groupdel <groupname> (remove group)
- lsof (lsof stands for List Open Files. It is a command-line utility in Unix/Linux systems used to list information about files that are currently opened by processes.)

### ** File permissions **

- ls -l
  r(read), w(write), x(executable)
  -rw-r--r--. 1 <username> <groupname> <time> file.txt
  - : fileType
    rw-: user permissions
    r--: group permissions
    r--: others permissions
- chown (change ownership & group)
  chown -R <user>:<group> <file>
- chgrp (change group ownership)
- chmod (change mod) (change file/dir permission)
  Use letters (u, g, o, a) and symbols (+, -, =) to add, remove, or set permissions.
  u: Owner (user)
  g: Group
  o: Others
  a: All (owner, group, others)
        - chmod a+x <file> (add permission of executable to all (-: remove) (=:set))

        ** Numeric Mode **
            Permissions are calculated by adding the values for read, write, and execute:
                Read (r) = 4
                Write (w) = 2
                Execute (x) = 1
                Example permission combinations:
                    7 (4+2+1): Read, write, and execute.
                    6 (4+2): Read and write.
                    5 (4+1): Read and execute.
                    4: Read only.
                    chmod 754 file.txt
                        7: Owner can read, write, and execute.
                        5: Group can read and execute.
                        4: Others can only read.


### ** SUDO **

aws ALL=(ALL:ALL) NOPASSWD: ALL
&aws ALL=(ALL:ALL) NOPASSWD: ALL 1. aws, (%aws is a group name)
Specifies the user to whom this rule applies.
In this case, the user is aws. 2. (ALL:ALL):
This specifies the user and group that the user can execute commands as.
ALL (User): The user who is allowed to run commands. Here, ALL means the user can run commands as any user, including root.
ALL (Group): The group the user can impersonate when running the command. \*\*ALL means the user can run commands on behalf of any group. 3. (ALL)
Specifies the user identity that the aws user can run commands as.
ALL means the aws user can run commands as any user, including the root user. 4. NOPASSWD
Doesn't required user password to proceed

### ** PACKAGE/SOFTWARE MANAGEMENT **

- rpm -qa (list all rpm packages) -qi <packagename> (installed info with description) --last (recently installed)
- rpm -qf /etc/passwd (find out this file path belongs to which package)
- rpm -qc <packagename> (config file for a package)
- rpm -ev --nodeps(doesn't check dependencies) <packagename> (remove package)
- dpkg -l (list all deb packages)
- rpm -qpR {.rpm-file} (to check for dependencies)
- rpm -qR {package} (to check for dependencies)

- curl : Client URL
  (curl is a command-line tool used to transfer data to or from a server using various network protocols. It stands for Client URL, emphasizing its primary function: interacting with URLs and handling data transfers over the web.)
- wget : World Wide Web Get
  (wget is a command-line utility in Unix/Linux systems used to download files from the internet. It is non-interactive, meaning it can run in the background without requiring user interaction.) - wget https://something.com/public/telnet-0.17-85.el9.x86_64.rpm
       ** Common Uses of curl **
           1. Download a File
               curl -O https://example.com/file.txt
           2. Send GET Request
               curl https://example.com
           3. Send POST Request
               curl -X POST -d "key=value" https://example.com/api
           4. Add Custom Headers
               curl -H "Authorization: Bearer TOKEN" https://example.com/api
           5. Save Output to a File
               curl https://example.com -o output.txt
           6. Debug/Verbose Output
               curl -v https://example.com

       - curl https://something.com/public/telnet-0.17-85.el9.x86_64.rpm -o (output folder) telnet-0.17-85.el9.x86_64.rpm  || curl -O https://something.com/telnet-0.17-85.el9.x86_64.rpm
       - these packages are installed without dependencies so they won't run that's why we use high level package manager like yum/dnf

       To install the .rpm package:
         - sudo rpm -ivh(install) -Uvh(upgrade) telnet.rpm
         - sudo dpkg -i telnet.deb


### ** SERVICES **

- systemctl start/status/enable https/mongod

### ** PROCESSES **

- top (like task manager)
- ps aux
- ps -ef (also shows parent process id)
  (ps: process status, a: Displays processes from all users (not just your own processes), u: Displays additional information in a user-friendly format, such as the process owner, CPU usage, memory usage, and start time, x: Includes processes that are not attached to a terminal (e.g., daemon processes or background services))
  (little bit detailed with file path of processes)
        USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
        root         1  0.0  0.1  17028  1040 ?        Ss   14:32   0:01 /sbin/init
        alice     1234  0.1  1.2 121356 15468 pts/1    S    14:34   0:00 bash
        alice     5678  5.5  0.8 984756 10244 ?        R    14:35   0:12 /usr/bin/python3 script.py

        USER: The user who owns the process.
        PID: The process ID.
        %CPU: CPU usage as a percentage.
        %MEM: Memory usage as a percentage.
        VSZ: Virtual memory size in kilobytes.
        RSS: Resident Set Size (physical memory usage).
        TTY: The terminal associated with the process (if any).
        STAT: The process state (e.g., running, sleeping).
        START: The start time of the process.
        TIME: CPU time used by the process.
        COMMAND: The command that started the process.

- kill <PID> (stop process gracefully, child processes will be stopped)
- kill -9 <PID> (forcefull stop process)

### ** ARCHIVING / COMPRESSING **

- tar : Tape Archive
  (tar is a Unix/Linux command-line utility used for archiving files. It collects multiple files into a single archive file, often for the purpose of distribution or backup)
        - tar -cf archive.tar file1 file2 file3 (c: create, f: file)
        - tar -xf archive.tar (x: extract)
        - tar -czf archive.tar.gz file1 file2 (z: compress)
        - tar -xzf archive.tar.gz
        - tar -tf archive.tar (t: list content of tar file)
        - tar -rf archive.tar newfile (r: append file to tar



** SERVER MANAGEMENT **
