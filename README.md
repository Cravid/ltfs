# LTFS Tape Manual

## Description

Das LTFS tool läuft aus Gründen der Versionsinkompatibilität mit den früheren Windows Tapes 
nicht normal, sondern muss im Container eingebunden werden. Das gemountete LTFS ist trotz 
durchgabe der Dateisystemstruktur von außerhalb des Containers nicht sichtbar (warum kann
ich noch nicht sagen). Daher muss im Container gemountet und dann von dort kopiert werden.

## Prerequisites

### Docker

- install docker

	`$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

- docker build

> **IMPORTANT:**  Internet access and root privileges required!

	$ cd /mnt/share/Benutzer/David/4n6-tools/ltfs/
	$ docker build --network host -t ltfs .

- run container

	`$ docker run --rm -it --name ltfs --privileged -v /dev:/dev -v /mnt:/mnt ltfs`

> **IMPORTANT:**  Die nachfolgenden Kommandos müssen innerhalb des containers durchgeführt werden.

- show ltfs options

	`$ ltfs --help`

- mount ltfs tape

	`$ ltfs -o devname=/dev/st0 /mnt/lfs`

- copy from tape to any location, e.g., network share

	`$ cp -r /mnt/ltfs/XD\ 2020 \ 01 \ 01 /mnt/ufed/2020/01/$1`

- unmount ltfs

	`$ umount /mnt/ltfs`

- unload tape

	`$ mt -f /dev/st0 offline`

- kill container

    `$ exit`
    
> **IMPORTANT:**  Durch die -rm option beim obigen docker run killt der Container sich selbst.
