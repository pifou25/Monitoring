#!/bin/bash
touch /tmp/dependancy_monitoring_in_progress
echo 0 > /tmp/dependancy_monitoring_in_progress
versionPHP=$(php -r \@phpinfo\(\)\; | grep 'PHP Version' -m 1 | awk '{ print $4 }' | cut -d'.' -f1)

if [ "$versionPHP" -ge 7 ]
	then
		echo "*****************************************************************************************************"
		echo "*   Lancement de l'installation du module SSH pour PHP 7 / Launch install of module ssh2 for PHP 7  *"
		echo "*****************************************************************************************************"
		sudo apt-get clean
		echo 20 > /tmp/dependancy_monitoring_in_progress
		sudo apt-get update
		echo 80 > /tmp/dependancy_monitoring_in_progress
		sudo apt-get install -y php-ssh2 php-phpseclib
		echo 90 > /tmp/dependancy_monitoring_in_progress
		echo 100 > /tmp/dependancy_monitoring_in_progress
		echo "*****************************************************************************************************"
		echo "*  Pour finaliser l'installation, redémarrer Jeedom / To complete the installation, restart Jeedom  *"
		echo "*****************************************************************************************************"
fi
if [ "$versionPHP" -ne 7 ]
	then
		echo "Installation KO, PHP7 n'est pas installé"
		echo 100 > /tmp/dependancy_monitoring_in_progress
fi
rm /tmp/dependancy_monitoring_in_progress
