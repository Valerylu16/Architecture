.MODEL SMALL
.STACK 100H
.DATA
    ;DATA ALL THE VARIABLE WILL BE DECLARED
    var1 DB 'Enter three characters: $'    
    var2 DB 'Your characteres are: $'
.CODE
    ;CODE SEGMENT
    MAIN PROC   ;INT MAIN
        ;STATEMENT
        ;STATEMENT
        MOV AX, @DATA
        MOV DS, AX
        
        MOV DX, offset var1
        MOV AH, 9
        INT 21H  
              
        MOV AH, 1
        INT 21H
        
        MOV CH, AL 
        
        MOV AH, 1
        INT 21H
        
        MOV BL, AL
        
        MOV AH, 1
        INT 21H
        
        MOV BH, AL
        
        CALL ENTERKEY
        
        MOV DX, offset var2
        MOV AH, 9
        INT 21H
        
        CALL ENTERKEY
        MOV DL, CH        
        MOV AH,2
        INT 21H
        
        CALL ENTERKEY
        
        MOV DL, BL
        MOV AH,2
        INT 21H
        
        CALL ENTERKEY
        
        MOV DL, BH
        MOV AH,2
        INT 21H
        
        MOV AH, 4CH
        INT 21H
        
        MAIN ENDP
    
    ENTERKEY PROC
        
        MOV DX, 10
        MOV AH, 2
        INT 21H
        
        MOV DX, 13
        MOV AH, 2
        INT 21H
        
        RET
        ENTERKEY ENDP 
END MAIN ;EXIT (0)
        