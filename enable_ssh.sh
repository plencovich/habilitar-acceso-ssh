#!/bin/bash
export TERM=linux
if [[ $1 ]]; then

    if [ ! -e "/home/$1/.ssh" ];then
        mkdir /home/$1/.ssh
        chmod 700 /home/$1/.ssh
    fi

    if [ ! -e "/home/$1/.ssh/authorized_keys" ];then
        touch /home/$1/.ssh/authorized_keys
        chmod 600 /home/$1/.ssh/authorized_keys
    fi

    chown -R $1:$1 /home/$1/.ssh

    echo "ssh-rsa AAAAB3N........key" >> /home/$1/.ssh/authorized_keys
    clear
    echo "Listo!"
else
    clear
    echo "Debe ingresar el usuario del dominio que desea tener acceso por SSH"
    echo "Ejemplo: bash enable_ssh.sh nombreUser"
fi
