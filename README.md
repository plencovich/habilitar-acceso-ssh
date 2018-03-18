![Plen.co](https://plen.co/assets/images/logo.png)

## Habilitar acceso SSH por KEY

### Configuración
1. Copiar el contenido en un archivo bash `enable_ssh.sh`
2. Modifica `ssh-rsa AAAAB3N........key` por la clave pública generada en tu computadora, normalemente se encuentra en `~/.ssh/id_rsa.pub`. Si aún no tiene ninguna clave generada, puede generarla siguiente estos pasos [Genear Clave Pública para Acceso SSH](https://github.com/plencovich/generar-clave-publica-acceso-ssh)

### Archivo BASH
```
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
```

### Opcional:

Opcionalmente puedes crear un *comando alias* para ejecutarlo desde cualquier lado del servidor, esto sea hace editando el archivo `.bashrc` y al final agregar una linea `alias enableSSH='bash /root/enable_ssh.sh'`, guardan, cierran consola y al abrir escriben `enableSSH` y listo!
