	;ft_memcmp
	;compares byte string s1 against byte string s2.
	;int memcmp(const void *s1, const void *s2, size_t n);

global _ft_memcmp

section .text

_ft_memcmp:
	cmp	rdx, 0
	je	count_end
	mov	cl, byte [rdi]	;cl > lower 8 bits of rcx
	cmp	cl, byte [rsi]
	jne	diff
	inc	rdi
	inc	rsi
	dec	rdx
	jmp	_ft_memcmp

diff:
	mov	al, byte [rdi]
	mov	cl, byte [rsi]	;needed to have a char - char > int
	sub	rax, rcx
	ret
	
count_end:
	mov	rax, 0
	ret
	
