##
## EPITECH PROJECT, 2023
## MicroLibC [WSL : Ubuntu]
## File description:
## Makefile
##

NAME		=	libasm.so

NASM		=	nasm

GCC 		=	gcc

NASMFLAGS	=	-f elf64

SRC			=	strlen.asm

OBJ			=	$(SRC:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJ)
			$(GCC) --shared -o $(NAME) $(OBJ)

%.o:		%.asm
			$(NASM) $(NASMFLAGS) $< -o $@

clean:
			rm -f $(OBJ)

fclean:		clean
			rm -f $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
