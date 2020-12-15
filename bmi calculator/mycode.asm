.model small
.stack 100h
.code

main proc
   mov bl,51      ;fixed bl 3
   sub bl, 48
   
   mov ah, 1
   int 21h         ;inut
   sub al, 48 
   
   
   
   
   mul bl       ;multiply bl*al and store it in ax
   aam          ;adjust after multiplication
   
   mov cx, ax   ;ax store in cx
   
   add ch, 48
   add cl, 48
   
   mov ah,2
   mov dl,10    ;new line
   int 21h
   mov dl, 13
   int 21h
   
   
   
   mov ah,2      ;print high nibble
   mov dl, ch
   int 21h
   
   mov dl,cl     ;print low nibble
   int 21h
   
   
   