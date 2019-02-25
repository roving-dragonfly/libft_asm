	;ft_log2
	;returns the log2 of n
	;size_t ft_log2(size_t n)

global _ft_log2

section .text

_ft_log2:
	xor	r11, r11	;clears counter
shift:
	cmp	rdi, 0
	je	return
        shr	rdi, 1
	inc	r11
	jmp	shift
return:
        mov	rax, r11
	ret
