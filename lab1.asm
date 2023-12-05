ASSUME cs:text_,ds:data_

; 14.z= ((a*c-b*d)/f +(a+b)*c/d)/h
data_ SEGMENT
a db 4
b db 4
c db 6
d db 2
f db 4
h db 2
rez db ? 
data_ ENDS

text_ SEGMENT

; 14.z= ((a*c-b*d)/f +(a+b)*c/d)/h
; ((4*6-4*2)/4 + (4+4)*6/2)/2 = (16/4 + 48/2)/2 = (4+24)/2=14
start:
mov ax, data_
mov ds, ax
mov ax,0
;a*c
mov al,a
mov bl,c
mul bl; ax=a*c=al*bl
mov bx,ax; bx= a * c 
;b*d
mov al,b
mov cl,d
mul cl ; ax = al*cl=b*d
;a*c-b*d
sub bx, ax; bx = a * c - b * d
mov ax, bx
mov cl,f
div cl; ah=ax%cl, AL = ax / cl = (a*c-b*d)/f 
;a+b
mov bl, a
add bl, b; bl = a + b
;(a+b)*c
mov cl, al ; cl = (a*c-b*d)/f 
mov ax, 0
mov al, bl
mul c ; ax = (a + b) * c
;(a + b) * c / d
div d; al = ax / d , ah = ax % d

add al, cl ;al = (a*c-b*d)/f +(a+b)*c/d

;((a*c-b*d)/f +(a+b)*c/d) / h
mov ah, 0
div h; al = rez

mov rez, al
;
mov ax, 4c00h ; end program
int 21h

; end program
text_ ENDS

END start