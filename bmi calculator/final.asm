.model small
.stack 100h
.data

msg1  db "Press 1 for add$"
 msg2 db 10,13, "Press 2 for sub$"
 msg3 db 10,13, "Press 3 for mul$" 
 msg4 db 10,13, "The sum is: $"
 msg5 db 10,13, "Enter num1: $" 
 msg6 db 10,13, "Enter num2: $" 
 msg7 db 10,13, "Select Your Option: $" 
 msg8 db 10,13, "The Sub is: $" 
 msg9 db 10,13, "The Mul is: $"
 msg10 db 10,13, "Recalculate : $"
 
 
 
.code
 main proc
 mov ax,@data
 mov ds,ax 

 
option:
 mov ah,9
 lea dx,msg1
 int 21h
 
 
 mov ah,9
 lea dx,msg2
 int 21h
 
 
 mov ah,9
 lea dx,msg3
 int 21h 
 
  
 mov ah,2
 mov dl,10  
 int 21h
 mov dl,13
 int 21h 
 
 
 
  mov ah,9
 lea dx,msg7
 int 21h
 
 mov ah,1
 int 21h 
 
 
 cmp al, 49  
 je add
 
  cmp al, 50  
 je sub 
  cmp al, 51
 je mul
 
 
 
 
 
   
 
 add:
 mov ah,9
 lea dx,msg5
 int 21h
 
 
 mov ah,1
 int 21h
 mov bl,al
 
 
 mov ah,9
 lea dx,msg6
 int 21h
   
 mov ah, 1
 int 21h
 
           
 add al,bl
 mov ah,0 
          
 aaa          
   
 mov cx, ax   
   
   add ch, 48
   add cl, 48
 
 
 mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h  
 
  mov ah,9
 lea dx,msg4
 int 21h
 
 
   mov ah,2      
   mov dl, ch
   int 21h
   
   mov dl,cl     
   int 21h   
   
 
 mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h  
 
 
 
  mov ah,9
 lea dx,msg10
 int 21h 
 mov ah,1 
 int 21h  
 
 
 
  mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h 
 
 cmp cl,'Y'
 je  option
 
 cmp cl,'N'
 je exit
 
 
 sub:
   
   
   mov ah,9
   lea dx, msg5  
   int 21h
   
    mov ah, 1
    int 21h       
    mov bl,al         
    
   
   
    mov ah,9
    lea dx, msg6  
    int 21h
   
    mov ah, 1
    int 21h
           
  
   
   
   
   
   sub al,bl 
   mov ah,0     
   aas          
   
   mov cx, ax  
   
   add ch, 48
   add cl, 48
   
   mov ah,2
   mov dl,10    
   int 21h
   mov dl, 13
   int 21h
   
    
    
   mov ah,9
   lea dx, msg8  
   int 21h
    
   
   mov ah,2      
   mov dl, ch
   int 21h
   
   mov dl,cl     
   int 21h
   
   
    mov ah,9
 lea dx,msg10
 int 21h 
 mov ah,1 
 int 21h  
 
 
 
  mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h 
 
 cmp cl,'Y'
 je  option
 
 cmp cl,'N'
 je exit  
 
 mul:
 
     mov ah,9
   lea dx, msg5  
   int 21h
   
    mov ah, 1
    int 21h       
    mov bl,al         
    sub bl, 48  
   
   
    mov ah,9
    lea dx, msg6  
    int 21h
   
    mov ah, 1
    int 21h         
    sub al, 48 
   
   
   
   
   mul bl      
   aam         
   
   mov cx, ax   
   
   add ch, 48
   add cl, 48
   
   mov ah,2
   mov dl,10    
   int 21h
   mov dl, 13
   int 21h
   
    
    
   mov ah,9
   lea dx, msg9  
   int 21h
    
   
   mov ah,2      
   mov dl, ch
   int 21h
   
   mov dl,cl    
   int 21h  
   
     mov ah,9
 lea dx,msg10
 int 21h 
 mov ah,1 
 int 21h  
 
 
 
  mov ah,2
 mov dl,10
 int 21h
 mov dl,13
 int 21h 
 
 cmp cl,'Y'
 je  option
 
 cmp cl,'N'
 je exit
 
    
   

 
  exit:
    mov ah,4ch
    int 21h