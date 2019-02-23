NAME= libfts.a
CC= clang
CFLAGS= -Wall -Wextra -Werror

ASM= nasm
ASM_FLAGS= -fmacho64

LINKER= ld
LINKER_FLAGS= -macosx_version_min 10.8 -lSystem

SRC=	srcs/ft_bzero.s \
        srcs/ft_strcat.s \
        srcs/ft_isalpha.s \
        srcs/ft_isdigit.s \
	srcs/ft_isalnum.s \
	srcs/ft_isascii.s \
	srcs/ft_isprint.s \
        srcs/ft_toupper.s \
	srcs/ft_tolower.s \
	srcs/ft_puts.s 

OBJ= $(SRC:.s=.o)

%.o : %.s
	$(ASM) $(ASM_FLAGS) $<

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

test: $(NAME)
	$(CC) $(CFLAGS) test.c -I./includes -L. -lfts && ./a.out

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
