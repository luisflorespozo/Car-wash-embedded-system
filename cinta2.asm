__CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC
LIST P = 16F84
INCLUDE <P16F84.INC>

ESTATUS EQU	03H
PORTA	EQU	05H
PORTB	EQU	06H
TRISA	EQU	85H
TRISB	EQU	86H
CONT	EQU 0CH


		ORG	00H
		BSF 	ESTATUS,5;	Para ir al banco 1
		CLRF	TRISA;		
		COMF	TRISA,1; 	Para poner todas las patitas en 1 sin importar las que no uso (entradas
		CLRF	TRISB;		Para poner todas las patitas en 0 sin importar las que no uso (salidas)
		BCF		ESTATUS,5;	Para volver al banco 0

INICIO	CLRF	PORTB;		Ponemos todo en OFF por seguridad (todo apagado)
		BCF		PORTA,0;	Buzz OFF
		BSF		PORTB,4;	MT+(DER)= ON (condición inicial)
SW1		BTFSC	PORTA,0;		Preguntamos SW1(sensor1)=0??
		GOTO 	ESPAUSA
		CLRF	PORTB;		Todo OFF
		BSF 	PORTB,0;	LED ROJO=1
		BCF		PORTA,0;	Buzz OFF	
		CALL 	SUB123;		Hacemos el conteo 1,2,3
		

SUB123	MOVLW	01H
		MOVWF 	PORTB
		CAll 	DELAY
		MOVLW	02H
		MOVWF 	PORTB
		CAll 	DELAY
		MOVLW	03H
		MOVWF 	PORTB
		CAll 	DELAY
		RETURN
ESPAUSA	
VUELTA	BTFSC 	PORTA,3; pregunta por primera vez sw4=0?
		RETURN; si no se sale a sw1 y continua todo
		BSF		PORTB,5; si si, hace el parpadeo
		CALL 	DELAY
		BCF 	PORTB,5
		CALL 	DELAY
		BTFSC	PORTA,3; vuelve a preguntar si sw4=0?
		GOTO VUELTA; si no se volvio a apretar se queda parpadeando
		RETURN; si si apretop de nuevo, vuelve a lo que estaba haciendo

DELAY	MOVLW	64H
		MOVWF 	CONT
OTRO	DECFSZ	CONT,1
		GOTO 	OTRO
		RETURN
END