/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aalves <aalves@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/02/23 14:02:15 by aalves            #+#    #+#             */
/*   Updated: 2019/02/25 22:28:42 by aalves           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>
#include <unistd.h>

#define SEED 123123123

void ft_bzero(void *s, size_t n);
char *ft_strcat(char *restrict s1, const char *restrict s2);
int ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isalnum(int c);
int ft_isascii(int c);
int ft_isprint(int c);
int ft_toupper(int c);
int ft_tolower(int c);
int ft_puts(const char *s);
size_t ft_strlen(const char *s);
void *ft_memset(void *b, int c, size_t len);
void *ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
char *ft_strdup(const char *s1);
void *ft_cat(int fd);
void *ft_memalloc(size_t n);
int ft_is_power_of_two(size_t n);
size_t ft_log2(size_t n);

int ft_bzero_check()
{
	char toto[256];

    for (int i = 0; i < 256; ++i)
        toto[i] = (char)(rand() % 255);
	ft_bzero(toto, 256);
    for (int i = 0; i < 256; ++i)
	{
		if (toto[i])
		{
			printf("ft_bzero : Found %d at offset %d\n", toto[i], i);
			return (1);
		}
	}
	return (0);
}

int ft_strcat_check()
{
	char toto[512];

	strcpy(toto, "ayy");
	ft_strcat(toto, " lmao");
	if (strcmp(toto, "ayy lmao"))
	{
        printf("ft_strcat : final string > %s\n", toto);
		return (1);
	}
	return (0);
}

int ft_isalpha_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_isalpha(i) != !isalpha(i))
		{
			printf("ft_isalpha : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_isdigit_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_isdigit(i) != !isdigit(i))
		{
			printf("ft_isdigit : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_isalnum_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_isalnum(i) != !isalnum(i))
		{
			printf("ft_isalnum : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_isascii_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_isascii(i) != !isascii(i))
		{
			printf("ft_isascii : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_isprint_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_isprint(i) != !isprint(i))
		{
			printf("ft_isprint : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_toupper_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_toupper(i) != !toupper(i))
		{
			printf("ft_toupper : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_tolower_check()
{
	for (int i = 0; i < 256; ++i)
	{
		if (!ft_tolower(i) != !tolower(i))
		{
			printf("ft_tolower : failed for %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_puts_check()
{
	puts("puts test string");
	ft_puts("puts test string");
	puts(NULL);
	ft_puts(NULL);
	return (0);
}

int ft_strlen_check()
{
	if (ft_strlen("ayy lmao") != strlen("ayy lmao") ||
		ft_strlen("") != strlen(""))
	{
		printf("ft_strlen : failed");
		return (1);
	}
	return (0);
}

int ft_memset_check()
{
	char toto[256];

	for (int i = 0; i < 256; ++i)
        toto[i] = (char)(rand() % 255);
	if (ft_memset(toto, '4', 256) != toto)
	{
		printf("ft_memset : wrong return value \n");
		return (1);
	}

    for (int i = 0; i < 256; ++i)
	{
		if (toto[i] != '4')
		{
			printf("ft_memset : failed at %d\n", i);
			return (1);
		}
	}
	return (0);
}

int ft_memcpy_check()
{
	char toto[256];
	char titi[256];

    for (int i = 0; i < 256; ++i)
        toto[i] = (char)(rand() % 255);
	for (int i = 0; i < 256; ++i)
        titi[i] = (char)(rand() % 255);
	ft_memcpy(toto, titi, 256);
	if (memcmp(toto, titi, 256))
	{
		printf("ft_memcpy : failed\n");
		return (1);
	}
	return (0);
}

int ft_strdup_check()
{
	char *str = "ayy lmao";
	char *toto = ft_strdup(str);
	if (strcmp(str, toto))
	{
		printf("ft_strdup : failed, str = %s\n", toto);
        return (1);
	}
	return (0);
}

int ft_cat_check()
{
	int fd = open("./Makefile", O_RDONLY);
	ft_cat(fd);
	close(fd);
    ft_cat(-42);
	return (0);
}

int ft_memalloc_check()
{
	char *toto = ft_memalloc(512);
	for (int i = 0; i < 512; ++i)
	{
		if (toto[i] != 0)
		{
			printf("ft_memalloc : failed at %d\n", i);
			return (1);
		}
	}
	free(toto);
    return (0);
}

int ft_is_power_of_two_check()
{
    if (!ft_is_power_of_two(1) ||
		!ft_is_power_of_two(2) ||
		!ft_is_power_of_two(8) ||
		!ft_is_power_of_two(256) ||
		!ft_is_power_of_two(4096) ||
		ft_is_power_of_two(6) ||
		ft_is_power_of_two(7) ||
	 	ft_is_power_of_two(66) ||
		ft_is_power_of_two(654))
	{
		printf("ft_is_power_of_two : failed\n");
		return (1);
	}
	return (0);
}

int ft_log2_check()
{
	if (1 != ft_log2(1) ||
		2 != ft_log2(3) ||
		9 != ft_log2(258))
	{
		printf("ft_log2 : failed %lu\n", ft_log2(1));
		return (1);
	}
	return (0);
}

int	main ()
{
    srand(SEED);
	return (
			ft_bzero_check() ||
			ft_strcat_check() ||
			ft_isalpha_check() ||
			ft_isalnum_check() ||
			ft_isascii_check() ||
			ft_isprint_check() ||
			ft_toupper_check() ||
            ft_tolower_check() ||
            ft_puts_check() ||
			ft_strlen_check() ||
			ft_memset_check() ||
            ft_memcpy_check() ||
			ft_strdup_check() ||
			ft_cat_check() ||
			ft_memalloc_check() ||
			ft_is_power_of_two_check() ||
			ft_log2_check()
			);
}
