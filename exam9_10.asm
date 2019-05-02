;.mode small
.stack 100h
.data   
    
    T1  db  'Introduce your array of numbers: $'
    Arr db  100 dup(?) 
    n   dw  ?
    m   dw  ? 
 
.code
Main proc
   
   MOV AX, @data
   MOV DS, AX
   
   LEA DX, T1
   MOV AH, 9
   int 21h
   
   ;salto de linea
   MOV DL, 13
   MOV AH, 2
   int 21h
   
   MOV DL, 10
   MOV AH, 2
   int 21h
   ;;;;;;;;;;;;;;;
   
   ;MOV BL, 0
   MOV CX, 100
   MOV SI, offset Arr
   Typing:
        
        MOV AH, 1
        int 21h  
        
        CMP AL, 13
        JE After
        
        MOV [SI], AL
        INC SI 
    
        LOOP Typing
   
   
   After:
        SUB SI, offset Arr
        MOV CX, SI    
        
        MOV [n], CX
        MOV [m], CX  
   
   Bucle:
    
        CALL Funcion
    
        MOV CX, [m]
    
        LOOP Bucle
    
   JMP Final    
        
        
        Funcion:
            MOV CX, [n]     
            SUB CX, 1
            MOV SI, offset Arr
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     
        Sorting:
            MOV BX, SI
            ADD BX, 1   
        
            MOV DL, [BX] 
        
            CMP [SI], DL
            JG Interchange
        
            continuacion1:
            INC SI
        
            continuacion2:
        
            LOOP Sorting
   
        JMP Return
        
        Interchange:
            MOV DL, [SI]
            MOV DH, [BX]
            MOV [SI], DH 
            MOV [BX], DL
        
            CMP SI, 100
            JL continuacion1
        
            JMP continuacion2
        
        Return:
   
            SUB [m], 1
               
            RET
   
   
   Final:
   
        MOV CX, [n]
        ADD CX, 1
        MOV SI, offset Arr   
   
        ;salto de linea
        MOV DL, 13
        MOV AH, 2
        int 21h
   
        MOV DL, 10
        MOV AH, 2
        int 21h
        ;;;;;;;;;;;;;;;
   
   Printing:
        
        MOV DL, [SI]
        MOV AH, 2
        int 21h
        
        INC SI
        
        LOOP Printing
          
        
   MOV AH, 4Ch
   int 21h
    
Main endp
End main