#!/usr/bin/expect -f

log_user 0
set timeout 10

spawn telnet $env(HOST)
expect "'^]'." sleep .1;
expect   "User Name:"
send "$env(USERNAME)\r"
expect "Password:"
send "$env(PASSWORD)\r";
log_user 1
interact
