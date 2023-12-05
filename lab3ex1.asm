;Given 2 byte strings A and B. Build the string R which contains the elements of B in reversed
;order followed by the negative elements of A. 
;Exemplu:
;A: 1,2,-4,-3
;B: 12,13,14,15,16
;R: 16, 15, 14, 13, 12, -4, -3
;R: 10 F E D C FC FD

assume ds:data,cs:code

data segment
  a db 1,2,-4,-3
  la equ ($-a)
  b db 12,13,14,15,16
  lb equ ($-b)
  d db lb+la dup(?)
data ends

code segment
start:
    mov ax,data
    mov ds,ax
	 
	mov si,0
	mov di,0
	add si,lb-1
	mov cx,lb
	repeta2:
		mov al,b[si]
		sub si,1
		mov d[di],al
		add di,1
	loop repeta2
	
	mov si,0
	mov cx,la
	repeta:
		mov al,a[si]
		cmp al,0
		jge pozitiv
		jl negativ
		negativ:
	    mov d[di],al
		add di,1
		pozitiv:
		add si,1
	loop repeta
	
    mov ax,4C00h
    int 21h
code ends
end start