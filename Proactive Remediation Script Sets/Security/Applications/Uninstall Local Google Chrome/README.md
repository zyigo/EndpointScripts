# Uninstall Local Google Chrome
Uninstalls Chrome if it has been installed locally by a user.
 
## Pre-Requisites
There are no pre-requisites for this PR set.

## Key Points
- This PR set is expected to drive end-users towards compliance (i.e., it gets annoying after a while, so they stop installing Chrome). It is not a CS control that limits the user from installing apps and/or running EXE files.
- This PR set does not remove Google Chrome that has been installed with admin privileges. Instead, it is assumed that device is already suitably configured as a secure endpoint, and that admin rights are approriately limited. 
- Run this PR hourly to provide stronger assurance of the apps removal.
- This script should be combined with user training, especially for _'repeat offenders'_.