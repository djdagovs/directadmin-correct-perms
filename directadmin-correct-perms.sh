#!/bin/bash

# List all virtualhosts
USERS=$(ls /usr/local/directadmin/data/users)

# Loop users and get domains
for USER in ${USERS}; do
	# List all virtualhosts for this user
	cat /usr/local/directadmin/data/users/${USER}/domains.list
done


