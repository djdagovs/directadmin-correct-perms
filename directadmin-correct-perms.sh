#!/bin/bash

# Some generic functions
ECHORED()       {
        echo -e "\e[1;31m${1}\e[0m"
}

ECHOYELLOW()    {
        echo -e "\e[1;33m${1}\e[0m"
}

ECHOGREEN()     {
        echo -e "\e[1;32m${1}\e[0m"
}

ECHOBLUE()      {
        echo -e "\e[1;34m${1}\e[0m"
}

# List all virtualhosts
USERS=$(ls /usr/local/directadmin/data/users)

# Loop users and get domains
for USER in ${USERS}; do
	echo ${USER}
	# List all virtualhosts for this user
	cat /usr/local/directadmin/data/users/${USER}/domains.list
done


