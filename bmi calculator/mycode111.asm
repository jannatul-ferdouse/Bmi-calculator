.model small 
.stack 100h
.data 

sms1 db 10,13,"Press 1 for BMI calculatro. $"
sms2 db 10,13,"Press 2 for Unit Converter. $"
sms7 db 10,13,"Press 3 for EXIT. $"
sms3 db 10,13,10,13,"Please, Choose the option: $"
sms4 db 10,13, " You type wrong keyword. Please, Try again.$" 
sms5 db 10,13,,"Press 1 For Recalculate $"
sms6 db 10,13,,"Press 2 For back to Main Menu $" 


;BMI

a db 10,13,10,13,"~~~~~~~~~~~~ BMI CALCULATOR ~~~~~~~~~~~~$"
b db 10,13,10,13,"***** Instruction Chart ******$"
b1 db 10,13,"1. A BMI is 1 considered overweight.$"
b2 db 10,13,"2. A BMI is 2 or 3 considered Perfect.$" 
b3 db 10,13,"3. A BMI is 4 or 5 considered underweight.$" 
c db  10,13,10,13,"Enter Your Height(cm): $" 
d db  10,13,"Enter Your Weight(kg): $"
e db "Your BMI is: $"
f db "So, Your BMI status is Perfect.Keep it.$"
f1 db "So, Your BMI status is overweight.$"
f2 db "So, Your BMI status is underweight.$"
g db "Press 1 to back Main Menu.$"
h db "Press 2 to Exit.$"
temp dw ? 

;Unit Converter

msg db 10,13,"~~~~~~~~~~~~~ UNIT CONVERTER ~~~~~~~~~~~~~~$"
msg1 db 10,13,10,13,"Please choose, What unit you want to conver:$"  
msg2 db 10,13,10,13,"Press 1 to convert Feet to Inchi.$"
msg3 db 10,13,"Press 2 to convert Yard to Feet.$"
msg4 db 10,13,"Press 3 to convert Metre to Feet.$"
msg5 db 10,13,"Press 4 to convert Ounces to Grams.$"
msg6 db 10,13,"Press 5 to convert Pounds to Ounces.$"
msg7 db 10,13,10,13,"Enter Your Choise: $"

msg8 db 10,13,"Enter the value in Feet: $"
msg9 db " Feet= $"
msg10 db " Inches $"

msg11 db 10,13,"Enter the value in Yard: $"
msg12 db " Yard= $"
msg13 db " Feets $"

msg14 db 10,13,"Enter the value in Metre: $"
msg15 db " Metre= $"
msg16 db " Feets $"

msg17 db 10,13,"Enter the value in Ounces: $"
msg18 db " Ounces= $"
msg19 db " Grams $"

msg20 db 10,13,"Enter the value in Pounds: $"
msg21 db " Pounds= $"
msg22 db " Ounces $"



print1 db 10,13,10,13,"** FEET TO INCHI **$" 
print2 db 10,13,10,13,"** YARD TO FEET **$"
print3 db 10,13,10,13,"** METRE TO FEET **$"
print4 db 10,13,10,13,"** OUNCES TO GRAMS **$"
print5 db 10,13,10,13,"** POUNDS TO OUNCES **$"
print6 db 10,13,"Wrong keyword!!! Try again.$"




.code

main proc
   
    mov ax,@data
    mov ds,ax
    
    FIRST:
    
    mov ah,9
    lea dx,sms1
    int 21h
    
    mov ah,9
    lea dx,sms2
    int 21h
    
    mov ah,9
    lea dx,sms7
    int 21h 
    
  
    repeat:
    mov ah,9
    lea dx,sms3
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,'1'
    je BMI
    jl wrng
    jg lvl1
    
    
    
    lvl1:
      cmp al,'2'
      je unitcon
      jg lvl2
      
    lvl2:
      cmp al,'3'
      je exit
      jg wrng
      
      
    
    wrng:
      
    mov ah,9
    lea dx,sms4
    int 21h
    
    jmp repeat
    
    
    BMI:                   ; BMI START
    


    
    ;Print a
    
    lea dx,a
    mov ah,9
    int 21h
    
    ;Print b
    
    lea dx,b
    mov ah,9
    int 21h
    
    ;Print b1
    
    lea dx,b1
    mov ah,9
    int 21h
    
    ;Print b2
    
    lea dx,b2
    mov ah,9
    int 21h
    
    ;Print b3
    
    lea dx,b3
    mov ah,9
    int 21h 
    
    ;Print c
    
    lea dx,c
    mov ah,9
    int 21h
    
    mov ax,0
    mov bx,0
    mov dx,0
    mov temp,0
    
    
    INPUT1:
    and ax,000FH
    push ax
    mov ax,10
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
   
    mov ah,1
    int 21h
    
    cmp al,0DH
    je print
    
   
    jmp INPUT1
    
    print:
    call NL
    
    ;Print d
    
    lea dx,d
    mov ah,9
    int 21h
    
    mov temp,bx
    mov ax,0
    mov bx,0
    
    
    INPUT2:
    
    and ax,000FH
    push ax
    mov ax,10
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
   
    mov ah,1
    int 21h
    
    cmp al,0DH
    je CONVERT
    
    jmp INPUT2
    
    
    CONVERT:
    
    call NL
    mov ah,9
    lea dx,e
    int 21h
    
    mov ax,temp
    mov dx,0
    
    div bx
    
   
    
    
    cmp ax,1
    je over
    
    cmp ax,2
    je perfect
    
    cmp ax,3
    je perfect
    
    cmp ax,4
    je under
    
    cmp ax,5
    je under
    
    over:
    
    mov bx,ax
    add bx,30h
    mov ah,2
    mov dx,bx
    int 21h
    
    call NL
    call NL
    lea dx,f1
    mov ah,9
    int 21h
    jmp cheek1
    
    
    perfect:
    
    mov bx,ax
    add bx,30h
    mov ah,2
    mov dx,bx
    int 21h
    
    CALL NL
    CALL NL
    
    lea dx,f
    mov ah,9
    int 21h
    
    jmp cheek1
    
    under:
    
    mov bx,ax
    add bx,30h
    mov ah,2
    mov dx,bx
    int 21h
    
    call NL
    call NL
   
    lea dx,f1
    mov ah,9
    int 21h
    
    jmp cheek1
    
    cheek1:
    
    call NL
    
    mov ah,9
    lea dx,sms5
    int 21h
    
    mov ah,9
    lea dx,sms6
    int 21h
    
    mov ah,9
    lea dx,sms3
    int 21h
    
   mov ah,1
   int 21h
    
    cmp al,'1'
    je BMI
   
    cmp al,'2'
    je FIRST 
    
    
    again1:
    
    mov ah,9
    lea dx,sms3
    int 21h
    jmp cheek1
    
    
    
    
    unitcon:                      ;Unit start
   

    lea dx,msg
    mov ah,9
    int 21h
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    lea dx,msg3
    mov ah,9
    int 21h
    
    lea dx,msg4
    mov ah,9
    int 21h
    
    lea dx,msg5
    mov ah,9
    int 21h
    
    lea dx,msg6
    mov ah,9
    int 21h
    
    startu:
    
    lea dx,msg7
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,'1'
    je ft_to_inc
    jl invalid
    
    
    cmp al,'2'
    je yrd_to_ft
   
   
    
    
    cmp al,'3'
    je m_to_ft
    
    
    
    cmp al,'4'
    je oz_to_gm
  
  
    
    cmp al,'5'
    je bl_to_oz
    jg invalid
    
    
    
    
    ft_to_inc:
    lea dx,print1
    mov ah,9
    int 21h
    
    lea dx,msg8
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
     
    sub al,30h
    
    mov bx,3Ch
    sub bx,30h
    
    mul bx
    aam
    add ah,30h
    add al,30h
    mov bx,ax
    
    lea dx,msg9
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg10
    mov ah,9
    int 21h
    
    jmp cheek2
    
   
    
    
    
    yrd_to_ft:
     
    lea dx,print2
    mov ah,9
    int 21h
    
    lea dx,msg11
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
     
    sub al,30h
    
    mov bx,33h
    sub bx,30h
    
    mul bx
    aam
    add ah,30h
    add al,30h
    mov bx,ax
    
    lea dx,msg12
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg13
    mov ah,9
    int 21h
    
    jmp cheek2
   
 
    
    
    
    m_to_ft:
    
    lea dx,print3
    mov ah,9
    int 21h
    
    lea dx,msg14
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
     
    sub al,30h
    
    mov bx,33h
    sub bx,30h
    
    mul bx
    aam
    add ah,30h
    add al,30h
    mov bx,ax
    
    lea dx,msg15
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg16
    mov ah,9
    int 21h
    
    jmp cheek2
     
  
    
    
    oz_to_gm:
     
     
    lea dx,print4
    mov ah,9
    int 21h
    
    lea dx,msg17
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
     
    sub al,30h
    
    mov bx,4Ch
    sub bx,30h
    
    mul bx
    aam
    add ah,30h
    add al,30h
    mov bx,ax
    
    lea dx,msg18
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg19
    mov ah,9
    int 21h
    
    jmp cheek2
   
   
    
    bl_to_oz:
     
     
    lea dx,print5
    mov ah,9
    int 21h
    
    lea dx,msg20
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
     
    sub al,30h
    
    mov bx,40h
    sub bx,30h
    
    mul bx
    aam
    add ah,30h
    add al,30h
    mov bx,ax
    
    lea dx,msg21
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg22
    mov ah,9
    int 21h
    
    jmp cheek2
  
    invalid:
     
    lea dx,print6
    mov ah,9
    int 21h
    
    jmp startu
    
    
    cheek2:
    
    call NL
    
    mov ah,9
    lea dx,sms5
    int 21h
    
    mov ah,9
    lea dx,sms6
    int 21h
    
    mov ah,9
    lea dx,sms3
    int 21h
    
   mov ah,1
   int 21h
    
    cmp al,'1'
    je unitcon
   
    cmp al,'2'
    je FIRST 
    
    
    again2:
    
    mov ah,9
    lea dx,sms3
    int 21h
    jmp cheek2
    
   
    
    
    
    
     
    NL:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    RET
    
    exit:
    
    
      
      
    
    
    