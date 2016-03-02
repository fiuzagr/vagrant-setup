#!/bin/sh

function help () {
	echo "VM - Script para administrar a máquina virtual do UBUNTU.";
	echo "";
	echo "	VM porta				- redireciona a porta 8080 para a 80";
	echo "	VM inicia       - inicia a máquina virtual UBUNTU";
	echo "	VM pausa        - pausa a máquina virtual UBUNTU";
	echo "	VM desliga      - desliga a máquina virtual UBUNTU";
	echo "";
}

if [ $1 ] 
then
	case "$1" in
		porta)
			sudo pfctl -evf ~/._dev/pf.conf
			echo 'Direcionamento ATIVADO!';
		;;
		inicia)
			VBoxManage startvm UBUNTU --type headless
			echo 'Máquina Virtual INICIADA!';
		;;
		pausa)
			VBoxManage controlvm UBUNTU savestate
			echo 'Máquina Virtual PAUSADA!';
		;;
		desliga)
			VBoxManage controlvm UBUNTU poweroff
			echo 'Máquina Virtual DESLIGADA!';
		;;
	esac
else
	help;
fi
