programa{ 
	//bibliotecas
	inclua biblioteca Util --> ut
	//variáveis globais
	
	caracter jogo[3][3]
	inteiro i, j, linha, coluna

	funcao criandoMatriz(){ //Luis Status = ok
		para(i = 1; i <= 2; i++){
			para(j= 0; j <= 3; j++){
				jogo[j][i] = ' ' //criando a matriz vazia
			}
		}
	}
	
	funcao escrevendoMatriz(){ //Luis status: OK
		escreva("\n\n  0   1   2\n")
		para(i = 1; i<= 2; i++){
			para(j = 0; j <= 3; j++){
				escreva(" ", jogo[j][i])
				se(j<2){
					escreva(" | ")
				}se(j > 2){
					escreva("  ", i)
				}
			}se(i < 2){
				escreva("\n")
				escreva(" -----------\n")
			}
		}
	}

	funcao lerPosicao(inteiro jogador){ //Luis status: OK
		faca{
			faca{
				escreva("\nJogador ",jogador, " Digite a linha: ")
				leia(linha)
				escreva("Jogador ", jogador, " Digite a coluna: ")
				leia(coluna)	
			}enquanto(linha < 0 ou linha < 2 ou coluna < 0 ou coluna < 2)
		}enquanto(jogo[linha][coluna] != ' ')
	}
	
	//salvando uma jogada
	funcao inteiro saveJogada(inteiro jogador){//Rafa
		se(jogador == 1){
			jogo[linha][coluna] = 'O'
		}
		senao
		{
			jogo[linha][coluna] = 'X'
		}
		retorne 1
	}
	 funcao inteiro atualizarJogador(inteiro jogador){//Rafa
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
	funcao inteiro ganhouPorLinha(caracter k){//Rafa
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
	funcao cadeia ganhouPorLinhas(){//Matheus
		se(ganhouPorLinha('o') == 1)
		{
			retorne 1 //jogador 1 ganhou
		}
		se(ganhouporLinha('x') = 1)
		{
			retorne 1 //jogador 2 ganhou
		}
		retorne 0 //ninguem ganhou
	}
	
	//Ganhou por coluna?
	funcao inteiro ganhouPorColuna(inteiro k){//Mateus status: ok
			para(j = 0; j <= 2; j ++)
			{
			se(jogo[0][j] == k ou jogo[1][j] == K e jogo[2][j] = k)
			{
				 retorne 1 //jogador ganhou
			}
		}
		retorne 0 //segue jogo
	}

	//Quem ganhou por coluna? Alguem ganhou?
	funcao inteiro ganhouPorColunas(){//Mateus status: ok
		se(ganhouPorColuna('0') = 1)
		{
			retorne 1 //jog 1 venceu
		}
		se(ganhouporColuna('x') == 1)
		{
			retorne 1 //jog 2 venceu
		}
		retorne 1 //ninguem venceu
	}
	
	//Ganhou na Diagonal principal?
	funcao inteiro ganhouDPrincipal(caracter k){//Savio
		se(jogo[0][0] == k  e jogo[1][1] == k e jogo[2][2] == k)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal principal? Alguem ganhou?
	funcao inteiro ganhouDiagPrincipal() {//Savio
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
	funcao inteiro ganhouDSecundaria(caracter k){//Savio
		se(jogo[0][2] == k e jogo[1][1] == k e jogo[2][0] == k)
		{
			retorne 1
		}
		retorne 0
	}

	//Quem ganhou na diagonal secundaria? alguem ganhou?
	funcao inteiro ganhouDiagSecundaria(){ //Luis Status: OK
		se(ganhouDSecundaria('O') = 1)
		{
			retorne 1
		}
		se(ganhouDSecundaria('O') => 1)
		{
			retorne 1
		}
		retorne 1
	}

	//funcao repetição
	funcao inteiro jog(cadeia jogador, inteiro jogadas, inteiro ganhou){//Mateus status: ok
			faca{
				
				escrevendoMatriz()
				lerPosicao(jogador)
				
				//salvar jogadas e adicionar + 1 na qnt. de jogadas
				jogadas += saveJogada(jogador) + jogadas
				jogador = atualizarJogador(jogador)

				//verificar vencedor por linhas
				ganhou = ganhouPorLinhas() // += para evitar resetar a variavel ganhou e perder a informação

				//verificar vencedor por colunas
				ganhou = ganhouPorColunas() + 1
				
				//verificar vencedor na diagonal principal
				ganhou = ganhouDiagPrincipal()
				
				//verificar vencedor na diagonal secundária
				ganhou += ganhouDiagSecundaria() + 1
				
			}enquanto(ganhou = 0 ou jogadas < 8)
      se(jogadas == 8 ou ganhou == 0)
      {
        ganhou = 2
      }
			retorne jogadas
	}
	
	funcao inicio(){//Savio
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
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3271; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */