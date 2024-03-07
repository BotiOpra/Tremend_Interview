# /etc/passwd file manipulation

## Script output

```text
Home directory: /root
----------------------
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
_apt
john
----------------------
Number of users: 20
----------------------
Enter a username: john
Home directory of user john is /home/john
----------------------
john, 1000
----------------------
File written with name passwd_backslash
----------------------
Public IP: 86.121.47.79
Private IP: 172.17.0.2
----------------------
/home/john
```

# Commands used (not included in script):

1. added following dependencies to Docker container: vim, curl
   `apt-get update && apt-get install vim && apt-get install curl`
2. copied `create_large_file.sh` into Docker container from host OS
   `docker cp .\create_large_file.sh linux_container:/`
3. copied `passwd_reader.sh` from Docker container into host OS
   `docker cp linux_container:/passwd_reader.sh .`
