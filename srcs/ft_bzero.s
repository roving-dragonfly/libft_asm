	;ft_bzero
	;write zeroes to a byte string
	;void bzero(void *s, size_t n);

global	_ft_bzero

section .text

_ft_bzero:
	cmp	rsi, 0		;n < 0 ?
	je	return
	mov	[rdi], byte 0	;*s = 0
	inc	rdi		;s++
	dec	rsi		;n--
        jmp	_ft_bzero

return:
	ret
        
