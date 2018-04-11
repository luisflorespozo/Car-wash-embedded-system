__CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC
LIST P = 16F84
INCLUDE <P16F84.INC>

ESTATUS EQU	03H
PORTA	EQU	05H
PORTB	EQU	06H
TRISA	EQU	85H
TRISB	EQU	86H
CONT	EQU 0CH
PDel0 	EQU 0C
PDel1 	EQU 0D

		ORG	00H
		BSF 	ESTATUS,5;	Para ir al banco 1
		CLRF	TRISA;		
		COMF	TRISA,1; 	todo en 1 (entradas)
		BCF		TRISA,0	;	de todas las entradas excluimos RA0 del buzz
		CLRF	TRISB;		Para poner todas las patitas en 0 sin importar las que no uso (salidas)
		BCF		ESTATUS,5;	Para volver al banco 0

INICIO	CLRF	PORTA
		CLRF	PORTB;		Ponemos todo en OFF por seguridad (todo apagado)
		BSF		PORTB,4;	MT+(DER)= ON (condición inicial)
SW1		CALL 	ESPAUSA		; llamamos al control de STOP=0?
		BTFSC	PORTA,1;	Preguntamos SW1(sensor1)=0??
		GOTO 	SW1; 		NO, volvemos a preguntar
		BSF 	PORTB,5;	LED ROJO=1
		BCF		PORTA,0;	Buzz OFF	
		MOVLW	01H
		MOVWF 	PORTB;		 muestra el 1 en display
		BSF 	PORTB,5;
		CAll 	DELAY
		CALL 	ESPAUSA;	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		MOVLW	02H
		MOVWF 	PORTB; 		muestra el 2 en display
		BSF 	PORTB,5;
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		MOVLW	03H
		MOVWF 	PORTB;		 muestra el 3 en display
		BSF 	PORTB,5;
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		;----------------------------------------------------
		
		MOVLW	0FH
		MOVWF 	PORTB; 		muestra NADA en display
		BCF		PORTB,3
		CALL	DELAY
		CLRF 	PORTB
		BSF		PORTB,4;	MT+(DER)= ON (condición inicial)
		MOVLW	01H
		MOVWF 	PORTB;		 muestra el 1 en display
		BSF		PORTB,4;	MT+(DER)= ON 
		
SW2		CALL 	ESPAUSA
		BTFSC	PORTA,2;	Preguntamos SW2=0?
		GOTO 	SW2
		;CALL 	ESPAUSA;	No: preguntamos con SW4
		CLRF 	PORTB
		BSF		PORTB,6;	Led amarillo=1
		MOVLW	03H
		MOVWF 	PORTB; 		muestra el 3 en display
		BSF 	PORTB,6;
		CAll 	DELAY
		CALL 	ESPAUSA;	 pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		MOVLW	02H
		MOVWF 	PORTB; 		muestra el 2 en display
		BSF 	PORTB,6;
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		MOVLW	01H
		MOVWF 	PORTB;		 muestra el 1 en display
		BSF 	PORTB,6;
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		MOVLW	00H
		MOVWF 	PORTB; 		muestra el 0 en display
		BSF 	PORTB,6;
		CALL 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL;	 pregunta si ya es 3 en el display
		MOVLW	0FH
		MOVWF 	PORTB; 		muestra NADA en display
		BSF 	PORTB,6;
		BCF		PORTB,3
		CALL	DELAY
		;
		;----------------------------------------------------
		MOVLW	0FH
		MOVWF 	PORTB; 		muestra NADA en display
		BSF		PORTB,3
		CALL	DELAY
		MOVLW	00H
		MOVWF 	PORTB; 		muestra el 0 en display
		BSF		PORTB,3
		BSF 	PORTB,6;
		CAll 	DELAY		
		MOVLW	09H
		MOVWF 	PORTB; 		muestra el 1 en display
		BSF 	PORTB,6;
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		MOVLW	0AH
		MOVWF 	PORTB; 		muestra el 2 en display
		BSF 	PORTB,6;
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL;	pregunta si ya es 3 en el display
		BSF		PORTB,3;	MT-(IZQ)= ON 
		BSF		PORTB,6;	Led amarillo=1
		;----------------------------------------------------
		CLRF 	PORTB
		MOVLW	0FH
		MOVWF 	PORTB; 		muestra NADA en display
		CALL 	DELAY
		MOVLW	02H
		MOVWF 	PORTB;		muestra el 2 en display
		BCF		PORTB,3
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		BSF		PORTB,4;	MT+(DER)= ON 
				;RETURN
SW3		CALL 	ESPAUSA
		BTFSC	PORTA,3
		GOTO	SW3
		CLRF	PORTB
		BSF		PORTB,7
		MOVLW	01H
		MOVWF 	PORTB; 		muestra el 1 en display
		BSF		PORTB,7
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL;	 pregunta si ya es 3 en el display
		MOVLW	02H
		MOVWF 	PORTB; 		muestra el 2 en display
		BSF		PORTB,7
		CAll 	DELAY
		CALL 	ESPAUSA; 	pregunta si se apreto STOP
		CAll 	CONTROL;	 pregunta si ya es 3 en el display
		MOVLW	03H
		MOVWF 	PORTB; 		muestra el 3 en display
		BSF		PORTB,7
		CAll 	DELAY
		CALL 	ESPAUSA;	pregunta si se apreto STOP
		CAll 	CONTROL; 	pregunta si ya es 3 en el display
		;----------------------------------------------------
		CLRF 	PORTB
		MOVLW	0FH
		MOVWF 	PORTB; 		muestra NADA en display
		BCF		PORTB,3
		CALL	DELAY
		GOTO 	INICIO


CONTROL	XORLW 03H
	;	BTFSC	ESTATUS,2
		RETURN
	;	GOTO SW1
		;call DELAY
		;RETURN

ESPAUSA	
		BTFSC 	PORTA,4; 			pregunta por primera vez sw4=0?
		RETURN; 					si no se sale continua en lo que estaba
		MOVLW 	00H; 				cargamos el 0 en w
		MOVWF 	PORTB;			 	mostramos el 0 en el disp
		VUELTA	
				CLRF 	PORTA
				BSF		PORTA,0;	 PRENDO EL BUZZ
				BSF		PORTB,5; 	 si si, hace el parpadeo y muestra 0
				CALL 	DELAY2
				BCF 	PORTB,5
				CALL 	DELAY2
				BTFSC	PORTA,4; 	 vuelve a preguntar si sw4=0?
				GOTO 	VUELTA;     si no se volvio a apretar se queda parpadeando
		CLRF PORTA
		RETURN; 					si si apretop de nuevo, vuelve a lo que estaba haciendo

DEMORA	MOVLW	3E8H
		MOVWF 	CONT
OTRO	DECFSZ	CONT,1
		GOTO 	OTRO
		RETURN
 
DELAY2  movlw     .253 ; 1 set numero de repeticion  (B)
       movwf     PDel0 ; 1
PLoop1  movlw     .253 ; 1 set numero de repeticion  (A)
       movwf     PDel1 ; 1
PLoop2  clrwdt ; 1 clear watchdog
       clrwdt ; 1 ciclo delay
       decfsz    PDel1,1 ; 1 + (1) es el tiempo 0  ? (A)
       goto      PLoop2 ; 2 no, loop
       decfsz    PDel0,1 ; 1 + (1) es el tiempo 0  ? (B)
       goto      PLoop1 ; 2 no, loop
PDelL1  goto PDelL2 ; 2 ciclos delay
PDelL2  
       return ; 2+2 Fin.

DELAY	CALL DELAY2
		CALL DELAY2
		CALL DELAY2
		RETURN

END