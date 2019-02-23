/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aalves <aalves@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/02/23 14:02:15 by aalves            #+#    #+#             */
/*   Updated: 2019/02/23 19:42:19 by aalves           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

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

	strcpy(toto, "kikou");
	ft_strcat(toto, " lol");
	if (strcmp(toto, "kikou lol"))
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
	puts("test string");
	ft_puts("test string");
	puts(NULL);
	ft_puts(NULL);
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
			ft_puts_check()
			);
}
