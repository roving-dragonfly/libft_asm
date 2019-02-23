	;ft_isascii
	;tests 0 <= char <= 127
	;int isascii(int c);

global _ft_isascii
	
section .text

_ft_isascii:
	cmp	rdi, 0
	jl	false
	cmp	rdi, 127
	jg	false
	mov	rax, 1
	ret
        
false:
	mov	rax, 0
	ret
