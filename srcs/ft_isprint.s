	;ft_isprint
	;tests 32 <= char <= 126
	;int isprint(int c);

global _ft_isprint
	
section .text

_ft_isprint:
	cmp	rdi, 32
	jl	false
	cmp	rdi, 126
	jg	false
	mov	rax, 1
	ret

false:
	mov	rax, 0
	ret
