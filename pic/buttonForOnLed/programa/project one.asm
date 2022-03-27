
_main:

;project one.c,1 :: 		void main() {  //beginning of the program
;project one.c,2 :: 		CMCON0 = 0X07;                    //desligo os comparadores
	MOVLW      7
	MOVWF      CMCON0+0
;project one.c,3 :: 		ANSEL = 0X00;                     //desliga as saidas analogicas
	CLRF       ANSEL+0
;project one.c,4 :: 		TRISA = 0B000000;                 //define todas as porta como saidas
	CLRF       TRISA+0
;project one.c,5 :: 		TRISC = 0B111111;                 //define todas as portc como entradas
	MOVLW      63
	MOVWF      TRISC+0
;project one.c,6 :: 		PORTA = 0;                        //porta inicia LOW
	CLRF       PORTA+0
;project one.c,8 :: 		while (1)     //beginning of the infinite loop
L_main0:
;project one.c,10 :: 		if(RC0_bit ==1)             //pode ser PORTC.BO ==1
	BTFSS      RC0_bit+0, 0
	GOTO       L_main2
;project one.c,12 :: 		RA0_bit = 0;               //desliga o LED
	BCF        RA0_bit+0, 0
;project one.c,13 :: 		}
	GOTO       L_main3
L_main2:
;project one.c,16 :: 		RA0_bit = 1;               //acendo o LED
	BSF        RA0_bit+0, 0
;project one.c,17 :: 		delay_ms(1000);             //retardo para desligar
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;project one.c,18 :: 		}
L_main3:
;project one.c,19 :: 		} //END LOOP
	GOTO       L_main0
;project one.c,20 :: 		} //END PROGRAM
	GOTO       $+0
; end of _main
