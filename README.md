ssh2telnet
==========

A container image which runs an SSH server and proxies connections to a telnet
server.

Telnet related environment variables
------------------------------------
- `HOST` address of telnet host
- `USERNAME` used in `telnet.sh` expect login script
- `PASSWORD` used in `telnet.sh` expect login script

SSH related environment variables
---------------------------------
- `USERNAME` name of ssh user to connect to
- `PASSWORD` password set for user account
- `KEY` string of public key to connect to ssh

Building
--------

Run the following to build::

    buildah bud -t ssh2telnet:latest .

Running
-------

Create an environment file `env.bash`::

    USERNAME=manager
    PASSWORD=<password>
    HOST=telnet.example.com
    KEY=<public key contents>

Run the container::

    podman run -p 2200:22 --env-file ./env.bash -ti --rm ssh2telnet:latest

Connect to the container::

    ssh manager@localhost -p 2200

telnet.sh
---------

This is an `expect` script specific to a telnet connection that requires a
login. It can be customised by replacing in the image or bind mounting an
alternative.