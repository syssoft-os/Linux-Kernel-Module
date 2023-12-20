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

4. Füge das Modul mit ```sudo insmod block_device_module.ko```. Der Test mit Hilfe des Befehls ```sudo dmesg | tail``` sollte als letzten Eintrag eine Besätigung enthalten, dass das Modul geladen wurde.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/85883600-8def-42ab-9492-be08125b2d75)

Mit Hilfe des Befehls ```cat /proc/devices``` kann eine Liste der Character- und Block devices angezeigt werden. In der Liste der Block devices sollte nun bereits unser Block device *mydevice* auftauchen.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/0d15ef42-ceb5-4a9e-8c7c-6df2a6766643)

4. Erstelle Block device mit namen *myblockdevice* via ```sudo mknod /dev/myblockdevice b 1 0```. Im Ordner */dev* sollte das entsprechende File angezeigt werden.
Zusätzlich können via ```fdisk -l /dev/myblockdevice``` Informationen abgerufen werden.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/dd032d55-a96c-47f9-b6f7-21558eade12c)

5. Nun können wir eine Input Datei erzeugen, aus deren Inhalt wir auf unser Block basiertes i/o-Gerät schreiben. Erzeuge hierzu eine Datei ```touch input.txt``` und schreibe einen beliebigen Inhalt darein (bei uns *Hello World!*)
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/0521019f-5e6e-420e-b9a7-e9cdbf1a7993)

6. Schreibe nun den Inhalt der Datei *input.txt* auf das Block basiere device mit ```sudo dd if=input.txt of=/dev/myblockdevice bs=4096```
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/4b33231f-0f1c-4995-9c24-62cf48ba78cc)

Versuchen wir nun den Inhalt des Devices zu mit ```cat /dev/myblockdevice``` zu lesen, erhalten wir als Ausgabe nur *Hello World!*, da beim lesen die Inhalte offenbar direkt wieder entschlüsselt werden.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/87949411-3b35-4fea-a00c-36f2cd29a763)

Der Verschlüsselte Inhalte, kann über die Hexadezimale anzeige via ```sudo hexdump -C /dev/myblockdevice``` betrachtet werden
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/f7b66078-224b-4313-889a-e0a9cfbb65ec)

Wie in folgendem Screenshot eines Online-Encrypters ersichtlich stimmt der verschlüsselte Inhalt bei Nutzung des XOR_Keys 42 für den Inhalt *Hello World!* überein.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/6d8aaa49-eae2-4350-af23-215e4e3c0b32)

7. Um nun den Inhalt des Devices wieder in eine Datei zu lesen müssen wir die Datei zunächst mit ```touch output.txt``` erzeugen.
Anschließend können wir den Inhalt des Devices in die zuvor erzeugte Dateu laden via ```sudo dd if=/dev/myblockdevice of=output.txt bs=4096```. Lesen wir die Datei anschließend aus enthält sie unseren initialen Eingabetext.
![grafik](https://github.com/s4paweil/Linux-Kernel-Module/assets/83007148/05b9fddf-0155-4b0c-8a41-587a46422075)

