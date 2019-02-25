	;ft_toupper
	;tests 97 <= char <= 122 then returns char - 32
	;int isalpha(int c);

global _ft_toupper
	
section .text

_ft_toupper:
	cmp	rdi, 97
	jl	nochange
	cmp	rdi, 122
	jg	nochange
        mov	rax, rdi
	sub	rax, 32
        ret
	
nochange:
	mov	rax, rdi
	ret
