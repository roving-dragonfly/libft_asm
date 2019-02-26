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
	srcs/ft_puts.s \
	srcs/ft_strlen.s \
	srcs/ft_memset.s \
	srcs/ft_memcpy.s \
	srcs/ft_strdup.s \
        srcs/ft_cat.s \
        srcs/ft_memalloc.s \
        srcs/ft_is_power_of_two.s \
        srcs/ft_log2.s \
        srcs/ft_max.s \
	srcs/ft_memcmp.s

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
