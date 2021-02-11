
_main:

;projeto.c,6 :: 		void main()
;projeto.c,9 :: 		int A=0,B=0,C=0,D=250,E=0,F=0;//variaveis que fazem o jogo rodar
	CLRF       main_A_L0+0
	CLRF       main_A_L0+1
	CLRF       main_C_L0+0
	CLRF       main_C_L0+1
	MOVLW      250
	MOVWF      main_D_L0+0
	MOVLW      0
	MOVWF      main_D_L0+1
	CLRF       main_E_L0+0
	CLRF       main_E_L0+1
	CLRF       main_F_L0+0
	CLRF       main_F_L0+1
;projeto.c,10 :: 		CMCON0 = 0x07;//desliga comparadores
	MOVLW      7
	MOVWF      CMCON0+0
;projeto.c,11 :: 		ANSEL = 0;//desliga portas analogicas
	CLRF       ANSEL+0
;projeto.c,12 :: 		TRISA = 0b110000;//seta RA4-5 com entrada e o resto saida
	MOVLW      48
	MOVWF      TRISA+0
;projeto.c,13 :: 		TRISC = 1;
	MOVLW      1
	MOVWF      TRISC+0
;projeto.c,15 :: 		while (1)//loop infinito
L_main0:
;projeto.c,17 :: 		F=0;//erro macanico dos botões
	CLRF       main_F_L0+0
	CLRF       main_F_L0+1
;projeto.c,18 :: 		D--;//faz o tempo de acionamento ficar menor
	MOVLW      1
	SUBWF      main_D_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_D_L0+1, 1
;projeto.c,19 :: 		C=0;//quando chegar a a D o player perde
	CLRF       main_C_L0+0
	CLRF       main_C_L0+1
;projeto.c,20 :: 		E=0;//tempo de Derrota
	CLRF       main_E_L0+0
	CLRF       main_E_L0+1
;projeto.c,21 :: 		A = rand();//valor aleatorio para A
	CALL       _rand+0
	MOVF       R0+0, 0
	MOVWF      main_A_L0+0
	MOVF       R0+1, 0
	MOVWF      main_A_L0+1
;projeto.c,22 :: 		B = rand();//valor aleatorio para A
	CALL       _rand+0
;projeto.c,23 :: 		led1 = A;//valor aleatorio acende ou não led1
	BTFSC      main_A_L0+0, 0
	GOTO       L__main58
	BCF        RA0_bit+0, 0
	GOTO       L__main59
L__main58:
	BSF        RA0_bit+0, 0
L__main59:
;projeto.c,24 :: 		led2 = B;//valor aleatorio acende ou não led1
	BTFSC      R0+0, 0
	GOTO       L__main60
	BCF        RA1_bit+0, 1
	GOTO       L__main61
L__main60:
	BSF        RA1_bit+0, 1
L__main61:
;projeto.c,26 :: 		while(led1==1 && !led2==1)
L_main2:
	BTFSS      RA0_bit+0, 0
	GOTO       L_main3
	BTFSC      RA1_bit+0, 1
	GOTO       L_main3
L__main57:
;projeto.c,28 :: 		delay_ms(10);//delay para dar como reflexo
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;projeto.c,29 :: 		c++;//quando chegar a D o player perde
	INCF       main_C_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_C_L0+1, 1
;projeto.c,30 :: 		if(s1==0 && !s2==0)//se apertar o botão 1 ganha
	BTFSC      RC2_bit+0, 2
	GOTO       L_main9
	BTFSS      RC1_bit+0, 1
	GOTO       L_main9
L__main56:
;projeto.c,32 :: 		led1 = 0;//reseta o led1
	BCF        RA0_bit+0, 0
;projeto.c,33 :: 		delay_ms(90);//evita ruidos
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;projeto.c,34 :: 		}
L_main9:
;projeto.c,35 :: 		if(s2==0)//se apertar o botão 2 perde
	BTFSC      RC1_bit+0, 1
	GOTO       L_main11
;projeto.c,37 :: 		C=D;
	MOVF       main_D_L0+0, 0
	MOVWF      main_C_L0+0
	MOVF       main_D_L0+1, 0
	MOVWF      main_C_L0+1
;projeto.c,38 :: 		}
L_main11:
;projeto.c,39 :: 		if(C==D)//demorou muito para apertar
	MOVF       main_C_L0+1, 0
	XORWF      main_D_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVF       main_D_L0+0, 0
	XORWF      main_C_L0+0, 0
L__main62:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;projeto.c,41 :: 		led1 = 0;//reseta o led1
	BCF        RA0_bit+0, 0
;projeto.c,42 :: 		}
L_main12:
;projeto.c,43 :: 		}
	GOTO       L_main2
L_main3:
;projeto.c,45 :: 		while(led2==1 && !led1==1)
L_main13:
	BTFSS      RA1_bit+0, 1
	GOTO       L_main14
	BTFSC      RA0_bit+0, 0
	GOTO       L_main14
L__main55:
;projeto.c,47 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	NOP
;projeto.c,48 :: 		c++;//quando chegar a D o player perde
	INCF       main_C_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_C_L0+1, 1
;projeto.c,49 :: 		if(s2==0 && !s1==0)//se apertar o botão 2 ganha
	BTFSC      RC1_bit+0, 1
	GOTO       L_main20
	BTFSS      RC2_bit+0, 2
	GOTO       L_main20
L__main54:
;projeto.c,51 :: 		led2 = 0;//reseta o led2
	BCF        RA1_bit+0, 1
;projeto.c,52 :: 		delay_ms(90);
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
;projeto.c,53 :: 		}
L_main20:
;projeto.c,54 :: 		if(s1==0)//se apertar o botão 1 perde
	BTFSC      RC2_bit+0, 2
	GOTO       L_main22
;projeto.c,56 :: 		C=D;
	MOVF       main_D_L0+0, 0
	MOVWF      main_C_L0+0
	MOVF       main_D_L0+1, 0
	MOVWF      main_C_L0+1
;projeto.c,57 :: 		}
L_main22:
;projeto.c,58 :: 		if(C==D)//demorou muito para apertar
	MOVF       main_C_L0+1, 0
	XORWF      main_D_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVF       main_D_L0+0, 0
	XORWF      main_C_L0+0, 0
L__main63:
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;projeto.c,60 :: 		led2 = 0;//reseta o led2
	BCF        RA1_bit+0, 1
;projeto.c,61 :: 		}
L_main23:
;projeto.c,62 :: 		}
	GOTO       L_main13
L_main14:
;projeto.c,64 :: 		while(led1 == 1 && led2 == 1)
L_main24:
	BTFSS      RA0_bit+0, 0
	GOTO       L_main25
	BTFSS      RA1_bit+0, 1
	GOTO       L_main25
L__main53:
;projeto.c,66 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	NOP
;projeto.c,67 :: 		c++;//quando chegar a D o player perde
	INCF       main_C_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_C_L0+1, 1
;projeto.c,68 :: 		if(s1==0 && s2==0)//se apertar o botão 1 e 2 ganha
	BTFSC      RC2_bit+0, 2
	GOTO       L_main31
	BTFSC      RC1_bit+0, 1
	GOTO       L_main31
L__main52:
;projeto.c,70 :: 		led1 = 0;//reseta o led1
	BCF        RA0_bit+0, 0
;projeto.c,71 :: 		led2 = 0;//reseta o led2
	BCF        RA1_bit+0, 1
;projeto.c,72 :: 		delay_ms(90);
	MOVLW      234
	MOVWF      R12+0
	MOVLW      195
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
;projeto.c,73 :: 		}
L_main31:
;projeto.c,74 :: 		if(s1==1 && !s2==1)//se apertar o botão 2 perde
	BTFSS      RC2_bit+0, 2
	GOTO       L_main35
	BTFSC      RC1_bit+0, 1
	GOTO       L_main35
L__main51:
;projeto.c,76 :: 		if(F==5)
	MOVLW      0
	XORWF      main_F_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      5
	XORWF      main_F_L0+0, 0
L__main64:
	BTFSS      STATUS+0, 2
	GOTO       L_main36
;projeto.c,77 :: 		{C=D;}
	MOVF       main_D_L0+0, 0
	MOVWF      main_C_L0+0
	MOVF       main_D_L0+1, 0
	MOVWF      main_C_L0+1
L_main36:
;projeto.c,78 :: 		F++;
	INCF       main_F_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_F_L0+1, 1
;projeto.c,79 :: 		}
L_main35:
;projeto.c,80 :: 		if(s2==1 && !s1==1)//se apertar o botão 1 perde
	BTFSS      RC1_bit+0, 1
	GOTO       L_main39
	BTFSC      RC2_bit+0, 2
	GOTO       L_main39
L__main50:
;projeto.c,82 :: 		if(F==5)
	MOVLW      0
	XORWF      main_F_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      5
	XORWF      main_F_L0+0, 0
L__main65:
	BTFSS      STATUS+0, 2
	GOTO       L_main40
;projeto.c,83 :: 		{C=D;}
	MOVF       main_D_L0+0, 0
	MOVWF      main_C_L0+0
	MOVF       main_D_L0+1, 0
	MOVWF      main_C_L0+1
L_main40:
;projeto.c,84 :: 		F++;
	INCF       main_F_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_F_L0+1, 1
;projeto.c,85 :: 		}
L_main39:
;projeto.c,86 :: 		if(C==D)//demorou muito para apertar
	MOVF       main_C_L0+1, 0
	XORWF      main_D_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVF       main_D_L0+0, 0
	XORWF      main_C_L0+0, 0
L__main66:
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;projeto.c,88 :: 		led1 = 0;//reseta o led1
	BCF        RA0_bit+0, 0
;projeto.c,89 :: 		led2 = 0;//reseta o led2
	BCF        RA1_bit+0, 1
;projeto.c,90 :: 		}
L_main41:
;projeto.c,91 :: 		}
	GOTO       L_main24
L_main25:
;projeto.c,93 :: 		while(C==D && E<10)
L_main42:
	MOVF       main_C_L0+1, 0
	XORWF      main_D_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVF       main_D_L0+0, 0
	XORWF      main_C_L0+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L_main43
	MOVLW      128
	XORWF      main_E_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      10
	SUBWF      main_E_L0+0, 0
L__main68:
	BTFSC      STATUS+0, 0
	GOTO       L_main43
L__main49:
;projeto.c,95 :: 		led1 = 1;
	BSF        RA0_bit+0, 0
;projeto.c,96 :: 		led2 = 1;
	BSF        RA1_bit+0, 1
;projeto.c,97 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	NOP
	NOP
;projeto.c,98 :: 		led1 = 0;
	BCF        RA0_bit+0, 0
;projeto.c,99 :: 		led2 = 0;
	BCF        RA1_bit+0, 1
;projeto.c,100 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
;projeto.c,101 :: 		E++;
	INCF       main_E_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_E_L0+1, 1
;projeto.c,102 :: 		}
	GOTO       L_main42
L_main43:
;projeto.c,104 :: 		if(E==10)
	MOVLW      0
	XORWF      main_E_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      10
	XORWF      main_E_L0+0, 0
L__main69:
	BTFSS      STATUS+0, 2
	GOTO       L_main48
;projeto.c,105 :: 		{D=250;}
	MOVLW      250
	MOVWF      main_D_L0+0
	CLRF       main_D_L0+1
L_main48:
;projeto.c,107 :: 		}//fim do loop
	GOTO       L_main0
;projeto.c,108 :: 		}//fim do programa
	GOTO       $+0
; end of _main
