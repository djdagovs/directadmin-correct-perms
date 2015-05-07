#!/bin/bash

# Fetch params
EXEC=$1

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
	ECHOGREEN ${USER}
	# List all virtualhosts for this user (just in case there are multiple virtualhosts per user)
	DOMAINS=$(cat /usr/local/directadmin/data/users/${USER}/domains.list)
	for DOMAIN in ${DOMAINS}; do
		ECHOYELLOW ${DOMAIN}
		if [[ -z ${EXEC} ]]; then
			ECHORED "NOT EXECUTING"
			# Find all files without perm 0644
			find /home/${USER}/domains/${DOMAIN}/public_html -type f ! -perm 0644 -ls
			# Find all directories without perm 0755
			find /home/${USER}/domains/${DOMAIN}/public_html -type d ! -perm 0755 -ls
			# Find all files of directories without correct ownership
			find /home/${USER}/domains/${DOMAIN}/public_html ! -user ${USER} -ls
			# Find all files of directories without correct ownership
			find /home/${USER}/domains/${DOMAIN}/public_html ! -group ${USER} -ls
		else
			ECHOBLUE "EXECUTING"
			# Find all files without perm 0644
			find /home/${USER}/domains/${DOMAIN}/public_html -type f ! -perm 0644 -exec chmod -v 644 {} \;
			# Find all directories without perm 0755
			find /home/${USER}/domains/${DOMAIN}/public_html -type d ! -perm 0755 -exec chmod -v 755 {} \;
			# Find all files of directories without correct ownership
			find /home/${USER}/domains/${DOMAIN}/public_html ! -user ${USER} -exec chown -v ${USER}:${USER} {} \;
			# Find all files of directories without correct ownership
			find /home/${USER}/domains/${DOMAIN}/public_html ! -group ${USER} -exec chown -v ${USER}:${USER} {} \;
		fi
	done
done


