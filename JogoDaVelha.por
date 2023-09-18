programa
{ 
	//bibliotecas
	inclua biblioteca Util --> ut
	//variáveis globais
	
	caracter jogo[3][3]
	inteiro i, j, linha, coluna

	funcao criandoMatriz(){
		para(i = 0; i <= 2; i++)
		{
			para(j= 0; j <= 2; j++)
			{
				jogo[i][j] = ' ' //criando a matriz vazia
			}
		}
	}
	
	funcao escrevendoMatriz(){
		escreva("\n\n  0   1   2\n")
		para(i = 0; i<= 2; i++)
		{
			para(j = 0; j <= 2; j++)
			{
				escreva(" ", jogo[i][j])
				se(j<2)
				{
					escreva(" | ")
				}
				se(j == 2)
				{
					escreva("  ", i)
				}
			}
			se(i < 2)
			{
				escreva("\n")
				escreva(" -----------\n")
			}
		}
	}

	funcao lerPosicao(inteiro jogador){
		faca{
			faca{
				escreva("\nJogador ",jogador, " Digite a linha: ")
				leia(linha)
				escreva("Jogador ", jogador, " Digite a coluna: ")
				leia(coluna)	
			}enquanto(linha < 0 ou linha > 2 ou coluna < 0 ou coluna > 2)
		}enquanto(jogo[linha][coluna] != ' ')
	}
	
	//salvando uma jogada
	funcao inteiro saveJogada(inteiro jogador){
		se(jogador == 1){
			jogo[linha][coluna] = 'O'
		}
		senao
		{
			jogo[linha][coluna] = 'X'
		}
		retorne 1
	}
	 funcao inteiro atualizarJogador(inteiro jogador){
    		se(jogador == 1)
    		{
      		jogador = 2
    		}
    		senao
    		{
      		jogador = 1
    		}
        retorne jogador
   
  }
	
	//Ganhou por linha?
	funcao inteiro ganhouPorLinha(caracter k){
		para(i = 0; i <= 2; i ++)
		{
			se(jogo[i][0] == k e jogo[i][1] == k e jogo[i][2] == k)
			{
				retorne 1 //Jogador ganhou 
			}
		}
		retorne 0 //Segue o jogo
	}

	//funcao para teste de vitoria por linha dos jogadores
	funcao inteiro ganhouPorLinhas(){
		se(ganhouPorLinha('O') == 1)
		{
			retorne 1 //jogador 1 ganhou
		}
		se(ganhouPorLinha('X') == 1)
		{
			retorne 2 //jogador 2 ganhou
		}
		retorne 0 //ninguem ganhou
	}
	
	//Ganhou por coluna?
	funcao inteiro ganhouPorColuna(caracter k){
			para(j = 0; j <= 2; j ++)
			{
			se(jogo[0][j] == k e jogo[1][j] == k e jogo[2][j] == k)
			{
				 retorne 1 //jogador ganhou
			}
		}
		retorne 0 //segue jogo
	}

	//Quem ganhou por coluna? Alguem ganhou?
	funcao inteiro ganhouPorColunas(){
		se(ganhouPorColuna('O') == 1)
		{
			retorne 1 //jog 1 venceu
		}
		se(ganhouPorColuna('X') == 1)
		{
			retorne 2 //jog 2 venceu
		}
		retorne 0 //ninguem venceu
	}
	
	//Ganhou na Diagonal principal?
	funcao inteiro ganhouDPrincipal(caracter k){
		se(jogo[0][0] == k  e jogo[1][1] == k e jogo[2][2] == k)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal principal? Alguem ganhou?
	funcao inteiro ganhouDiagPrincipal() {
		se(ganhouDPrincipal('O') == 1)
		{
			retorne 1
		}
		se(ganhouDPrincipal('X') == 1)
		{
			retorne 2
		}
		retorne 0
	}
	
	//Ganhou na diagonal secundária?
	funcao inteiro ganhouDSecundaria(caracter k){
		se(jogo[0][2] == k e jogo[1][1] == k e jogo[2][0] == k)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal secundaria? alguem ganhou?
	funcao inteiro ganhouDiagSecundaria(){
		se(ganhouDSecundaria('O') == 1)
		{
			retorne 1
		}
		se(ganhouDSecundaria('X') == 1)
		{
			retorne 2
		}
		retorne 0
	}

	//funcao repetição
	funcao inteiro jog(inteiro jogador, inteiro jogadas, inteiro ganhou){
			faca{
				
				escrevendoMatriz()
				lerPosicao(jogador)
				
				//salvar jogadas e adicionar + 1 na qnt. de jogadas
				jogadas += saveJogada(jogador)
				jogador = atualizarJogador(jogador)

				//verificar vencedor por linhas
				ganhou += ganhouPorLinhas() // += para evitar resetar a variavel ganhou e perder a informação

				//verificar vencedor por colunas
				ganhou += ganhouPorColunas()
				
				//verificar vencedor na diagonal principal
				ganhou += ganhouDiagPrincipal()
				
				//verificar vencedor na diagonal secundária
				ganhou += ganhouDiagSecundaria()
				
			}enquanto(ganhou == 0 e jogadas < 9)
      se(jogadas == 9 e ganhou == 0)
      {
        ganhou = 4
      }
			retorne ganhou
	}
	
	funcao inicio(){
		//variáveis da main
		inteiro ganhou 
		inteiro jogador, jogadas, op
		
		faca{
			jogador = 1
			ganhou = 0
			jogadas = 0

			criandoMatriz()
			ganhou = jog(jogador, jogadas, ganhou)
			escrevendoMatriz()

        
				se(ganhou == 1)
				{
					escreva("\n\tPARABENS JOGADOR 1")
					
				}
				se(ganhou == 2)
				{
					escreva("\n\tPARABENS JOGADOR 2")
				}
        se(ganhou == 4)
        {
          escreva("\n\tEMPATE")
        }
				ut.aguarde(5000)
				limpa()
			
			escreva("\nDigite 1 para jogar novamente: ")
			leia(op)
		}enquanto(op == 1)
		escreva("Você saiu do jogo")
	}
}