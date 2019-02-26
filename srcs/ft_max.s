	;ft_max
	;given a and b, returns the max number
	;size_t ft_max(size_t a, size_t b)
	
global _ft_max
	
section .text	

_ft_max:
	cmp	rdi, rsi
	jle	max_b
max_a:
	mov	rax, rdi
	ret
max_b:	
	mov	rax, rsi
	ret
