##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## Makefile for MiniLibC project
##

ASFLAGS	=	-f elf64

AS		=	nasm

NAME	=	libasm.so

SRC		=	src/strlen.asm			\
			src/strchr.asm			\
			src/memset.asm			\
			src/memcpy.asm			\
			src/strcmp.asm			\
			src/memmove.asm			\
			src/strncmp.asm			\
			src/rindex.asm			\
			src/strpbrk.asm			\
			src/strstr.asm

OBJ		=	$(SRC:.asm=.o)

%.o: %.asm
	$(AS) $(ASFLAGS) $<

all: $(NAME)

$(NAME): $(OBJ)
	ld -shared -o $(NAME) $(OBJ)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re