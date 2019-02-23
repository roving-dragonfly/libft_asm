	;ft_isalpha
	;tests 65 <= char <= 90 || 97 <= char <= 122
	;int isalpha(int c);

global _ft_isalpha
	
section .text

_ft_isalpha:
	cmp	rdi, 65
	jl	false
	cmp	rdi, 90
	jle	true
	cmp	rdi, 97
	jl	false
	cmp	rdi, 122
	jle	true
        jmp	false
	
false:
	mov	rax, 0
	ret

true:
	mov	rax, 1
	ret
