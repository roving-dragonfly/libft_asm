	;ft_memcpy
	;copies n bytes from memory area src to memory area dst.
	;void *memcpy(void *restrict dst, const void *restrict src, size_t n);

global	_ft_memcpy

section .text

_ft_memcpy:
	mov	rax, rdi	;returns dst
        mov	rcx, rdx	;set counter at n
	cld			;set direction
        rep	movsb		;while 	(len--); *dst++ = *src++
	ret
	
