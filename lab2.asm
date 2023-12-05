ASSUME cs:text_,ds:data_

data_ SEGMENT
;2. Given two words A and B. Obtain word C:
;- bits 0-2 and bit 10 of C have the value 0
;- bits 3-6 of C coincide with the bits 5-8 of A
;- bits 7-9 of C coincide with the bits 0-2 of B
;- bits 11-15 of C coincide with the bits 5-9 of B

a dw 0111011101010111b ; 0111.0111.0101.0111b
b dw 1001101110111110b ; 1001.1011.1011.1110b
c dw ?
data_ ENDS
; 1110101100101000
text_ SEGMENT
 
start:
mov ax, data_ 
mov ds, ax

mov bx, 0 ; in register bx we calculate the rezult

mov ax,a
and ax, 0000000111100000b; and 0111011101010111b, 0000000111100000b => ax=0000010100000
mov cl,2
ror ax,cl
or bx,ax

mov ax,b
and ax, 0000000000000111b
mov cl,7
rol ax,cl
or bx,ax

mov ax,b
and ax, 0000001111100000b
mov cl,6
rol ax,cl
or bx,ax

mov c,bx ; 1110101100101000

mov ax, 4c00h ; end program
int 21h
; 
text_ ENDS

END start