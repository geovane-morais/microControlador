#line 1 "C:/Users/Geovane/Downloads/PIC/codigos/microC/button for on led/project one.c"
void main() {
CMCON0 = 0X07;
ANSEL = 0X00;
TRISA = 0B000000;
TRISC = 0B111111;
PORTA = 0;

while (1)
{
 if(RC0_bit ==1)
 {
 RA0_bit = 0;
 }
 else
 {
 RA0_bit = 1;
 delay_ms(1000);
 }
}
}
