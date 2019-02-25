	;ft_is_power_of_two
	;returns 1 if n is a power of two, else 0
	;int ft_is_power_of_two(size_t n)

global _ft_is_power_of_two

section .text
	
_ft_is_power_of_two:
	mov	rsi, rdi	;copies n
	dec	rsi
	and	rdi, rsi
	cmp	rdi, 0
	je	true
	jmp	false
true:
	mov rax, 1
	ret
false:
	mov rax, 0
	ret
