	;ft_memset
	;writes len bytes of value c (converted to an unsigned char) to the string b.
	;void *memset(void *b, int c, size_t len);

global	_ft_memset

section .text

_ft_memset:
	mov	r11, rdi	;saves return value
	mov	rcx, rdx	;set the counter at len
        cld			;set direction
	mov	rax, rsi	;set the byte to write
 	rep	stosb		;while (len--) *b++ = c
	mov	rax, r11
	ret
	
