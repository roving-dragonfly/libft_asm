	;ft_tolower
	;tests 65 <= char <= 80 then returns char + 32
	;int tolower(int c);

global _ft_tolower
	
section .text

_ft_tolower:
	cmp	rdi, 65
	jl	nochange
	cmp	rdi, 80
	jg	nochange
        mov	rax, rdi
	add	rax, 32
	ret
	
nochange:
	mov	rax, rdi
	ret
