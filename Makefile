##
## EPITECH PROJECT, 2023
## MicroLibC [WSL : Ubuntu]
## File description:
## Makefile
##

NAME		=	libasm.so

NASM		=	nasm

LD 			=	ld

NASMFLAGS	=	-f elf64

LDFLAGS		=	-shared

SRC			=	strlen.asm		\
				strchr.asm		\
				memset.asm		\
				memcpy.asm		\
				strcmp.asm		\
				strncmp.asm		\
				strrchr.asm		\
				strpbrk.asm		\
				memmove.asm		\
				strcasecmp.asm	\
				strstr.asm		\
				strcspn.asm

OBJ			=	$(SRC:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJ)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

%.o:		%.asm
			$(NASM) $(NASMFLAGS) $< -o $@

clean:
			rm -f $(OBJ)

fclean:		clean
			rm -f $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
