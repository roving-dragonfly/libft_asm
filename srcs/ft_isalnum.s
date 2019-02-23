	;ft_isalnum
	;tests 48 <= char <= 57 || 65 <= char <= 90 || 97 <= char <= 122
	;int isalnum(int c);

global _ft_isalnum
	
section .text

_ft_isalnum:
	cmp	rdi, 48
	jl	false
	cmp	rdi, 57
	jle	true
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
