programa
{
	inclua biblioteca Matematica --> m
	inclua biblioteca Util 
    	inclua biblioteca Tipos
    	inclua biblioteca Graficos --> g
    	inclua biblioteca Sons --> s
    	inclua biblioteca Internet --> i
    	inclua biblioteca Arquivos --> a
    	
    const inteiro numeroAlunos = 2
    cadeia veredito = ""
    cadeia alunos[numeroAlunos][6]
    real media[numeroAlunos][6]
    inteiro operacao = 0
    
       
    funcao inicio()
    {
    		
    		escreva("\t\t\t\t\t\t\tSEJA BEM VINDO(A)!\n")
    		escreva("\t\t\t\t\t\tVocê ainda não tem alunos cadastrados!\n")

		carrega_imagem()
    		musica()		    		
    		cadastro()
        	menu_inicial()	
    }
	 
    funcao inteiro menu_inicial()
    {
              
        escreva("\n\t\t\t\t[1]Cadastro de Alunos\t[2]Média da Turma\t[3]Situação do Aluno\n\t\t\t\t[4]Exibição de Aluno\t[5]Mural de Aniversário\t[6]Editar Cadastro\t[7]Finalize o Programa")
    
        escreva("\n\n\t\t\t\t\t\t   Escolha a operação desejada: ")	
        leia(operacao)

        enquanto (operacao != 1 e operacao != 2 e operacao != 3 e operacao != 4 e operacao != 5 e operacao !=6 e operacao != 7){
        
            escreva("\n\n\t\t\t\t\t\t   Informe uma opção válida: ")
            leia(operacao)
        }
    
        se (operacao == 1)
        {
            	
            	cadastro() // esperado para por a opção para alterar os dados caso dê tempo 	
        }
        senao se (operacao == 2)
        {
        		classificarRendimento()
        }
        senao se (operacao == 3)
        {
            situacaoDoAluno()// Fazer algo para a situação do aluno
        }
        senao se (operacao == 4)
        {
            exibirAlunoOrdenadoPorNota() // Exibir informações do aluno
            
        }senao se( operacao == 5){
        	
        		muralAniversario()
        	}
        senao se (operacao == 6)
        {
        		
        		editarAluno()
     
        }	senao {
        	
        	limpa()
        	escreva("\n\t\t\t\t\t\t\t\tPrograma Finalizado !")// Finalizar o programa
           Util.aguarde(3000)
           limpa()
           imagemFinal()
           	
        	}

        retorne operacao
    }

	funcao exibirAlunoOrdenadoPorNota()
    {
    	real allmedias[numeroAlunos][1]
    	para(inteiro z = 0;z < numeroAlunos; z++)
    	{real notass = 0.0
    		para(inteiro x = 3;x < 6; x++)
    		{
    			notass = notass + media[z][x]
    		}
    		allmedias[z][0] = notass / 3
    	}
		escreva("\nAlunos ordenados por nota (da maior para a menor):\n\n")
    
        // Ordenar os alunos por nota (da maior para a menor)
        para(real q = 10.00;q > 0;q -=0.1)
        {           
           
                para(inteiro w = 0; w < numeroAlunos; w++)
                { 
                	se(m.arredondar( allmedias[w][0],1) == m.arredondar( q,1))
                	{
                		//escreva("\t\t",allmedias[w][0],"\t\t!!!!")
				// Exibir os alunos ordenados por nota
        //escreva("\nAlunos ordenados por nota (da maior para a menor):\n\n")
        				para(inteiro i = 0; i < 1; i++)
        				{
        //{
            escreva("Aluno ", w+1, ":\n")
            escreva("Nome: ", alunos[w][0], "\n")
            escreva("Mês de Nascimento: ", alunos[w][1], "\n")
            escreva("Turma: ", alunos[w][2], "\n")
            escreva("Notas: ")
        				//}
            // Exibe as notas do aluno
            para(inteiro j = 3; j < 6; j++)
            {
                escreva(" / ", media[w][j]," / " )
            }
            
            // Calcula a média do aluno
            real mediaAluno = 0.0
            para(inteiro j = 3; j < 6; j++)
            {
                mediaAluno += media[w][j]
            }
            mediaAluno /= 3.0
            
            // Exibe a média do aluno
            escreva("\nMédia do aluno: ", m.arredondar(mediaAluno, 2), "\n")
            
            // Verifica a situação do aluno
            cadeia situacao
            se (mediaAluno >= 6)
            {
                situacao = "Aprovado"
            }
            senao
            {
                situacao = "Reprovado"
            }
            
            // Exibe a situação final do aluno
            escreva("Situação do aluno: ", situacao, "\n")
            
            escreva("\n")
      
                	}
                		
                	}
                }
           
        }
               
        
        deNovo()
    }

    funcao cadastro()
    {
        para(inteiro i = 0; i < numeroAlunos; i++)
        {
            para(inteiro j = 0; j < 6; j++ )
            {
                se(j == 0)
                {
                    escreva("Informe o nome do ", (i+1), "º aluno: ")
                    leia(alunos[i][j])

                   
                }
                senao se(j == 1)
                {
                    escreva("Informe o mês de nascimento do aluno: ")
                    leia(alunos[i][j])
                }
                senao se(j == 2)
                {
                    escreva("Informe a turma do ", (i+1), "º aluno: ")
                    leia(alunos[i][j])
                }
                senao
                {
                    escreva("Informe a nota ", (j - 2), " do aluno ", (i+1), ": ")
                    leia(alunos[i][j])
                }
            }
	 }
    		
        calcularMedia() // Adicionado para calcular a média após preencher a matriz alunos
    }

    funcao calcularMedia()
    {
        para(inteiro i = 0; i < numeroAlunos; i++)
        {
            para(inteiro j = 3; j < 6; j++)
            {
                real nota = Tipos.cadeia_para_real(alunos[i][j])
                media[i][j] = nota
            }
        }
        deNovo()
    }

    funcao classificarRendimento()
    {
        real total_das_notas = 0.0
        cadeia turma
        real valordivisao = 0.0

        escreva("Informe a turma: ")
        leia(turma)

        para(inteiro n = 0; n < numeroAlunos; n++)
        {
            para(inteiro p = 2; p < 3; p++)
            {
                se(turma == alunos[n][p])
                {
                    para(inteiro h = 3; h < 6; h++)
                    {
                        total_das_notas = total_das_notas + media[n][h]
                        valordivisao += 1
                    }
                }
            }
        }

        real mediaTurma = total_das_notas / valordivisao 

        escreva("\nMédia da turma: ", m.arredondar(mediaTurma, 2))

        se (mediaTurma < 6)
        {
            veredito = "ruim"
        }
        senao se (mediaTurma >= 6 e mediaTurma < 8)
        {
            veredito = "médio"
        }
        senao se (mediaTurma >= 8 e mediaTurma < 10)
        {
            veredito = "bom"
        }
        senao
        {
            veredito = "excelente"
        }

        escreva("\nVeredito da turma: ", veredito)
        deNovo()
        
    }
     funcao situacaoDoAluno()
    {
        escreva("Informe o número do aluno ( 1 a ", numeroAlunos, "): ")
        inteiro numAluno
        leia(numAluno)

        se (numAluno >= 1 e numAluno <= numeroAlunos)
        {
            inteiro indiceAluno = numAluno - 1
            cadeia nomeAluno = alunos[indiceAluno][0]
            cadeia turmaAluno = alunos[indiceAluno][2]
            real mediaAluno = 0.0

            para(inteiro j = 3; j < 6; j++)
            {
                mediaAluno += media[indiceAluno][j]
            }
            
            mediaAluno /= 3.0

            escreva("\nTurma do aluno: ", turmaAluno)
            escreva("\nNotas do aluno ", nomeAluno, ": ")
            
            para(inteiro j = 3; j < 6; j++)
            {
                escreva(media[indiceAluno][j]," / ")
            }

            escreva("\nMédia do aluno ", nomeAluno, ": ", m.arredondar(mediaAluno, 2))

            se (mediaAluno >= 6)
            {
                escreva("\nSituação do aluno ", nomeAluno, ": Aprovado")
            }
            senao
            {
                escreva("\nSituação do aluno ", nomeAluno, ": Reprovado")
            }
        }
        senao
        {
            escreva("Número de aluno inválido.")
        }
        deNovo()
         	
    	}
    	
    funcao deNovo(){
    		escreva("\nDigite 1 para fazer outra operação ou 0 para encerrar o programa: ")
		leia(operacao)
        se (operacao == 1){
        	limpa()        
        	menu_inicial()
        	}
        senao {
        		
        	 	limpa()
        	 	escreva("\n\t\t\t\t\t\t\t\tPrograma Encerrado !\n")// fecha o programa
        	 	 Util.aguarde(3000)
           	limpa()
           	imagemFinal()
        	 	
        	}
    }
       
     funcao muralAniversario()
    {
        escreva("\n\n\t\t\t\t\t\t\tAniversariantes de Cada Mês\n\n")
        
        cadeia nomesMeses[12] = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
        
        para(inteiro mes = 1; mes <= 12; mes++)
        {
            escreva("\nAniversariantes de ", nomesMeses[mes - 1], ": ")
            
            para(inteiro i = 0; i < numeroAlunos; i++)
            {
            	
                cadeia mesNascimento = alunos[i][1] // Extrai o mês da data de nascimento
                inteiro mesAniversario = Tipos.cadeia_para_inteiro(mesNascimento, 10)

			                
                se (mesAniversario == mes)
                {
                    escreva("- ", alunos[i][0])
                }
                
            } 
                       
            escreva("\n")
        }
        
        deNovo()
    }

    funcao editarAluno()
{
    escreva("Informe o número do aluno que deseja editar (1 a ", numeroAlunos, "): ")
    inteiro numAluno
    leia(numAluno)

    se (numAluno >= 1 e numAluno <= numeroAlunos)
    {
        // Exibe as opções de informações para editar
        inteiro indiceAluno = numAluno - 1

        escreva("\nEscolha qual informação deseja editar para o aluno ", alunos[indiceAluno][0], ":")
        escreva("\n[1] Nome\t [2] Mês de Nascimento\t [3] Turma\n[4] Nota 1\t [5] Nota 2\t [6] Nota 3\n")

        inteiro opcao
        leia(opcao)

        se (opcao >= 1 e opcao <= 6)
        {
            // Solicita a nova informação e atualiza nas matrizes alunos e media
            escreva("\nInforme a nova informação: ")

            se (opcao == 3)
            {
                leia(alunos[indiceAluno][opcao - 1])
            }
            senao se (opcao >= 4 e opcao <= 6)
            {
                real novoValor
                leia(novoValor)
                media[indiceAluno][opcao - 1] = novoValor
                alunos[indiceAluno][opcao - 1] = Tipos.real_para_cadeia(novoValor)
            }
            senao
            {
                leia(alunos[indiceAluno][opcao - 1])
            }

            escreva("Informação editada com sucesso!\n")
        }
        senao
        {
            escreva("Opção inválida.\n")
        }
    }
    senao
    {
        escreva("Número de aluno inválido.\n")
    }
    deNovo()
}




	funcao carrega_imagem(){

		a.criar_pasta("/pasta_Imagem")

       	// Baixa a imagem e salva com um caminho válido
       i.baixar_imagem("https://i.postimg.cc/MKqhngCf/teste.jpg", "/pasta_Imagem/Imagem_final")
		}

	funcao imagemFinal(){
		

		
	inteiro hacker = g.carregar_imagem("/pasta_Imagem/Imagem_final.jpg")
	
	g.iniciar_modo_grafico(verdadeiro)
	g.definir_dimensoes_janela(500, 500)
	g.definir_titulo_janela("Importando imagem | Portugol Studio")

	enquanto(verdadeiro){
		g.desenhar_imagem(0, 0, hacker)
		g.renderizar()
		}
	}

	funcao musica()
    {

        inteiro som = s.carregar_som("SnapInsta.io-Ikimono-Gakari-Blue-Bird-_Tradução_-_128-kbps_.wav")
        s.reproduzir_som(som, verdadeiro)
        s.definir_volume(25)
        s.definir_posicao_atual_musica(som, 2000)
 
    }

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 289; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {alunos, 13, 11, 6}-{media, 14, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */