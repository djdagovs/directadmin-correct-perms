# directadmin-correct-perms
This script is to correct all files and directories in the documentroots of all virtual hosts on an DirectAdmin server
## Why?
Because you might have done a migration from a non-suExec environment to ansuExec of PHP-FPM environment.
## Usage
###Without parameters:
```bash
./directadmin-correct-perms
Only verbose output:
=user=
==domain.tld==
NOT EXECUTING
All files without perm 0644
find /home/user/domains/domain.tld/public_html -type f ! -perm 0644 -ls
All directories without perm 0755
find /home/user/domains/domain.tld/public_html -type d ! -perm 0755 -ls
All files of directories without correct owner
find /home/user/domains/domain.tld/public_html ! -user user -ls
All files of directories without correct group
find /home/user/domains/domain.tld/public_html ! -group user -ls
```
###With (random, be creative) parameters:
```bash
./directadmin-correct-perms BOOYA
Actually change perms on files and directories:
=user=
==domain.tld==
EXECUTING
All files without perm 0644
..verbose out put from command..
All directories without perm 0755
..verbose out put from command..
All files of directories without correct owner
..verbose out put from command..
All files of directories without correct group
..verbose out put from command..
```