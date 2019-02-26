	;ft_memcmp
	;compares byte string s1 against byte string s2.
	;int memcmp(const void *s1, const void *s2, size_t n);

global _ft_memcmp

section .text

_ft_memcmp:
	xor	rcx, rcx	;clean the higher bytes
check:	
	cmp	rdx, 0
	je	count_end
	mov	cl, byte [rdi]	;cl > lower 8 bits of rcx
	cmp	cl, byte [rsi]
	jne	diff
	inc	rdi
	inc	rsi
	dec	rdx
	jmp	check

diff:
	xor	rax, rax
	xor	rcx, rcx
	mov	al, byte [rdi]	;al > lower 8 bits of rax
	mov	cl, byte [rsi]	;needed to have a char - char > int
        sub	rax, rcx
	cmp	rax, 127
	jg	of_negative
	ret
	cmp	rax, -128
	jl	of_positive
	
of_positive:        
	mov	rax, 1
        ret
	
of_negative:
        mov	rax, -1
	ret
	
count_end:
	mov	rax, 0
	ret
	
