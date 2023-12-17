cmd_/home/vboxuser/develop/kernel/ea/io_module.mod := printf '%s\n'   io_module.o | awk '!x[$$0]++ { print("/home/vboxuser/develop/kernel/ea/"$$0) }' > /home/vboxuser/develop/kernel/ea/io_module.mod
