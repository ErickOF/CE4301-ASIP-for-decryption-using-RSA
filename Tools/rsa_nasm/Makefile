.PHONY: run

APP=rsa_nasm

run:
	@nasm -f elf64 ${APP}.asm -o ${APP}.obj
	@ld -m elf_x86_64 ${APP}.obj -o ${APP}.o
	@rm ${APP}.obj
	@python3 exp_mod.py
	@chmod +x ${APP}.o
	@./${APP}.o

