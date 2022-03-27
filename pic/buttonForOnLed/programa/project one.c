void main() {  //beginning of the program
CMCON0 = 0X07;                    //desligo os comparadores
ANSEL = 0X00;                     //desliga as saidas analogicas
TRISA = 0B000000;                 //define todas as porta como saidas
TRISC = 0B111111;                 //define todas as portc como entradas
PORTA = 0;                        //porta inicia LOW

while (1)     //beginning of the infinite loop
{
      if(RC0_bit ==1)             //pode ser PORTC.BO ==1
      {
       RA0_bit = 0;               //desliga o LED
      }
      else
      {
       RA0_bit = 1;               //acendo o LED
       delay_ms(1000);             //retardo para desligar
      }
} //END LOOP
} //END PROGRAM