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

SRC			=	src/strlen.asm		\
				src/strchr.asm		\
				src/memset.asm		\
				src/memcpy.asm		\
				src/strcmp.asm		\
				src/strncmp.asm		\
				src/strrchr.asm		\
				src/strpbrk.asm		\
				src/memmove.asm		\
				src/strcasecmp.asm	\
				src/strstr.asm		\
				src/strcspn.asm

BONUS_SRC	=	bonus/index.asm		\
				bonus/rindex.asm	\
				bonus/memfrob.asm

OBJ			=	$(SRC:.asm=.o)

BONUS_OBJ	=	$(BONUS_SRC:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJ)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

%.o:		%.asm
			$(NASM) $(NASMFLAGS) $< -o $@

bonus:		$(OBJ) $(BONUS_OBJ)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJ) $(BONUS_OBJ)

clean:
			rm -f $(OBJ)
			rm -f $(BONUS_OBJ)

fclean:		clean
			rm -f $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
