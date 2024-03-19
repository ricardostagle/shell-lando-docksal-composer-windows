# Install docksal and lando on windows

## Install Docker v 4.27.1

## Install Ubuntu using Microsoft Store , enable wsl 2 during the install set up process.
Check Docker set up for Docksal Installation, go to general section in the settings and enable the expose daemon on tcp checkbox..

Enable Ubuntu also in Resources → WSL integration

Once in Ubuntu is installed we can turn off the internet security in the aso of VPN while we create the file in the next step and we run it.

Type the next lines to give permission to the shell to be executed and run the shell.

chmod 777 install-docksal-composer-corvette.sh
./install-docksal-composer-.sh

Finally we needed to go to hosts file in windows ( c://Windows/sistem32/drivers/etc/) and add mysite.docksal.site at the end of the line: 
127.0.0.1 kubernetes.docker.internal (previous version)
127.0.0.1 kubernetes.docker.internal mysite.docksal.site  (line after the change)
Surely file needs admin permissions to be modified previously then press right click and go to security tab and give permissions to your user.

If we need restart your windows, open docker and wait until docker finishes to load . After that, open Ubuntu and get in Corvette folder and run “fin up” to execute corvette containers again.
