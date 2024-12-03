= CKAN Installation

== Source Install

We will be installing in Ubuntu 24.04 LTS OS which should come with Python 2.12.x installed.

The CKAN documentation has a detailed description of the installation process in a Debian based system:

https://docs.ckan.org/en/2.11/maintaining/installing/install-from-source.html

Some proposed changes will be to install PostGreSQL version 17 

Make sure the following dependencies are installed using the apt repository

```shell
sudo apt-get install python3-dev libpq-dev python3-pip python3-venv git-core redis-server libmagic1
```
