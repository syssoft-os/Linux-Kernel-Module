# Linux-Kernel-Module
Example implementation of an Linux kernel module.

Gruppenmitglieder:
  - Robert Roth, s4roroth, 1415920
  - Pierre-Jordan de Amezaga, s4pideam, 1133913
  - Shirin Saleh, s4shsale, 1604776

# Anleitung
Das Repo beinhaltet den Source Code auf Basis von linux/driver/block/brd.c

Der Code wurde in einer VirtualBox VM mit dem aktuellsten Debian getestet.

1. Clone das Repository.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/024198bc-297c-42ed-a7b7-15693edb3b43)

2. Baue das Modul via ```make``` 
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/0cff1559-d916-4e32-956f-04a55fdc73a3)

Anschließend sollten im Ordner folgende Files enthalten sein:
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/97aaa742-b2f7-421d-a93a-aa606f5e11c3)

3. Füge das Modul mit ```sudo insmod block_device_module.ko```. Der Test mit Hilfe des Befehls ```sudo dmesg | tail``` sollte als letzten Eintrag eine Besätigung enthalten, dass das Modul geladen wurde.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/85883600-8def-42ab-9492-be08125b2d75)

Mit Hilfe des Befehls ```cat /proc/devices``` kann eine Liste der Character- und Block devices angezeigt werden. In der Liste der Block devices sollte nun bereits unser Block device *mydevice* auftauchen.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/0d15ef42-ceb5-4a9e-8c7c-6df2a6766643)

4. Erstelle Block device mit namen *myblockdevice* via ```sudo mknod /dev/myblockdevice b 1 0```. Im Ordner */dev* sollte das entsprechende File angezeigt werden.
Zusätzlich können via ```fdisk -l /dev/myblockdevice``` Informationen abgerufen werden.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/dd032d55-a96c-47f9-b6f7-21558eade12c)

