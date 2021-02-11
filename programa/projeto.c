#define   s1      RC2_bit
#define   s2      RC1_bit
#define   led1    RA0_bit
#define   led2    RA1_bit

void main() 
{

int A=0,B=0,C=0,D=250,E=0,F=0;//variaveis que fazem o jogo rodar
CMCON0 = 0x07;//desliga comparadores
ANSEL = 0;//desliga portas analogicas
TRISA = 0b110000;//seta RA4-5 com entrada e o resto saida
TRISC = 1;

while (1)//loop infinito
     {
      F=0;//erro macanico dos botões
      D--;//faz o tempo de acionamento ficar menor
      C=0;//quando chegar a a D o player perde
      E=0;//tempo de Derrota
      A = rand();//valor aleatorio para A
      B = rand();//valor aleatorio para A
      led1 = A;//valor aleatorio acende ou não led1
      led2 = B;//valor aleatorio acende ou não led1
//=================== led1 aceso ======================
      while(led1==1 && !led2==1)
            {
            delay_ms(10);//delay para dar como reflexo
            c++;//quando chegar a D o player perde
            if(s1==0 && !s2==0)//se apertar o botão 1 ganha
                     {
                     led1 = 0;//reseta o led1
                     delay_ms(90);//evita ruidos
                     }
            if(s2==0)//se apertar o botão 2 perde
                     {
                     C=D;
                     }
            if(C==D)//demorou muito para apertar
                    {
                    led1 = 0;//reseta o led1
                    }
            }
//=================== led2 aceso ======================
      while(led2==1 && !led1==1)
            {
            delay_ms(10);
            c++;//quando chegar a D o player perde
            if(s2==0 && !s1==0)//se apertar o botão 2 ganha
                     {
                     led2 = 0;//reseta o led2
                     delay_ms(90);
                     }
            if(s1==0)//se apertar o botão 1 perde
                     {
                     C=D;
                     }
            if(C==D)//demorou muito para apertar
                    {
                    led2 = 0;//reseta o led2
                    }
            }
//================ led1 e led2 aceso ===================
       while(led1 == 1 && led2 == 1)
            {
            delay_ms(10);
            c++;//quando chegar a D o player perde
            if(s1==0 && s2==0)//se apertar o botão 1 e 2 ganha
                     {
                     led1 = 0;//reseta o led1
                     led2 = 0;//reseta o led2
                     delay_ms(90);
                     }
            if(s1==1 && !s2==1)//se apertar o botão 2 perde
                     {
                     if(F==5)
                           {C=D;}
                     F++;
                     }
            if(s2==1 && !s1==1)//se apertar o botão 1 perde
                     {
                     if(F==5)
                           {C=D;}
                     F++;
                     }
            if(C==D)//demorou muito para apertar
                    {
                    led1 = 0;//reseta o led1
                    led2 = 0;//reseta o led2
                    }
            }
//================= SINAL DE ERRO ====================
       while(C==D && E<10)
            {
            led1 = 1;
            led2 = 1;
            delay_ms(50);
            led1 = 0;
            led2 = 0;
            delay_ms(100);
            E++;
       }
//===========FAZ VOLTAR A 2s o tempo limite==========
       if(E==10)
                {D=250;}
//====================================================
}//fim do loop
}//fim do programa