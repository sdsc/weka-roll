# SDSC "weka" roll

## Overview

This roll bundles the Weka data mining tool.

For more information about WEKA visit the official web page:

- <a href="http://www.cs.waikato.ac.nz/ml/weka/" target="_blank">Weka</a> is a
collection of machine learning algorithms for data mining tasks.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate weka source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

None.


## Building

To build the weka-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `weka-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll weka
% cd /export/rocks/install
% rocks create distro
% rocks run roll weka | bash
```

In addition to the software itself, the roll installs weka environment
module files in:

```shell
/opt/modulefiles/applications/weka
```


## Testing

The weka-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/weka.t 
```
