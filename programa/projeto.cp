#line 1 "E:/Projetos/joguinho LEMBRAR DE FAZER ESSE JOGO/programa/projeto.c"





void main()
{

int A=0,B=0,C=0,D=250,E=0,F=0;
CMCON0 = 0x07;
ANSEL = 0;
TRISA = 0b110000;
TRISC = 1;

while (1)
 {
 F=0;
 D--;
 C=0;
 E=0;
 A = rand();
 B = rand();
  RA0_bit  = A;
  RA1_bit  = B;

 while( RA0_bit ==1 && ! RA1_bit ==1)
 {
 delay_ms(10);
 c++;
 if( RC2_bit ==0 && ! RC1_bit ==0)
 {
  RA0_bit  = 0;
 delay_ms(90);
 }
 if( RC1_bit ==0)
 {
 C=D;
 }
 if(C==D)
 {
  RA0_bit  = 0;
 }
 }

 while( RA1_bit ==1 && ! RA0_bit ==1)
 {
 delay_ms(10);
 c++;
 if( RC1_bit ==0 && ! RC2_bit ==0)
 {
  RA1_bit  = 0;
 delay_ms(90);
 }
 if( RC2_bit ==0)
 {
 C=D;
 }
 if(C==D)
 {
  RA1_bit  = 0;
 }
 }

 while( RA0_bit  == 1 &&  RA1_bit  == 1)
 {
 delay_ms(10);
 c++;
 if( RC2_bit ==0 &&  RC1_bit ==0)
 {
  RA0_bit  = 0;
  RA1_bit  = 0;
 delay_ms(90);
 }
 if( RC2_bit ==1 && ! RC1_bit ==1)
 {
 if(F==5)
 {C=D;}
 F++;
 }
 if( RC1_bit ==1 && ! RC2_bit ==1)
 {
 if(F==5)
 {C=D;}
 F++;
 }
 if(C==D)
 {
  RA0_bit  = 0;
  RA1_bit  = 0;
 }
 }

 while(C==D && E<10)
 {
  RA0_bit  = 1;
  RA1_bit  = 1;
 delay_ms(50);
  RA0_bit  = 0;
  RA1_bit  = 0;
 delay_ms(100);
 E++;
 }

 if(E==10)
 {D=250;}

}
}
