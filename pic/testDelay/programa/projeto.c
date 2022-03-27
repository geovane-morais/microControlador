
void main() {
int A=0;
CMCON0 = 7;
ANSEL = 0;
TRISA = 0b000001; //SO RA0 É ENTRADA
TRISC = 0b000000; //PORTC É SAIDA
PORTC = 0X00;

      while(1)
      {
        if(PORTA.B0==1 && A==0)
         {
          A=1;
          delay_ms(400);
         }
         if(PORTA.B0==1 && A==1)
         {
          A=0;
          delay_ms(400);
         }
         if(A==1)
         {
         PORTC++;
         delay_ms(200);
         }
      }
}