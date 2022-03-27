
_main:

;projeto.c,2 :: 		void main() {
;projeto.c,3 :: 		int A=0;
	CLRF       main_A_L0+0
	CLRF       main_A_L0+1
;projeto.c,4 :: 		CMCON0 = 7;
	MOVLW      7
	MOVWF      CMCON0+0
;projeto.c,5 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;projeto.c,6 :: 		TRISA = 0b000001; //SO RA0 É ENTRADA
	MOVLW      1
	MOVWF      TRISA+0
;projeto.c,7 :: 		TRISC = 0b000000; //PORTC É SAIDA
	CLRF       TRISC+0
;projeto.c,8 :: 		PORTC = 0X00;
	CLRF       PORTC+0
;projeto.c,10 :: 		while(1)
L_main0:
;projeto.c,12 :: 		if(PORTA.B0==1 && A==0)
	BTFSS      PORTA+0, 0
	GOTO       L_main4
	MOVLW      0
	XORWF      main_A_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	XORWF      main_A_L0+0, 0
L__main14:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main13:
;projeto.c,14 :: 		A=1;
	MOVLW      1
	MOVWF      main_A_L0+0
	MOVLW      0
	MOVWF      main_A_L0+1
;projeto.c,15 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;projeto.c,16 :: 		}
L_main4:
;projeto.c,17 :: 		if(PORTA.B0==1 && A==1)
	BTFSS      PORTA+0, 0
	GOTO       L_main8
	MOVLW      0
	XORWF      main_A_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      1
	XORWF      main_A_L0+0, 0
L__main15:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
L__main12:
;projeto.c,19 :: 		A=0;
	CLRF       main_A_L0+0
	CLRF       main_A_L0+1
;projeto.c,20 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;projeto.c,21 :: 		}
L_main8:
;projeto.c,22 :: 		if(A==1)
	MOVLW      0
	XORWF      main_A_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      1
	XORWF      main_A_L0+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;projeto.c,24 :: 		PORTC++;
	INCF       PORTC+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;projeto.c,25 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
;projeto.c,26 :: 		}
L_main10:
;projeto.c,27 :: 		}
	GOTO       L_main0
;projeto.c,28 :: 		}
	GOTO       $+0
; end of _main
