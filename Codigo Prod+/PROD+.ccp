#include <stdio.h> // Tratamento de entrada/saída; 
#include <stdlib.h> //   Implementa funções para diversas operações, incluindo conversão,  alocação de memória, controle de processo, funções de busca e ordenação;
#include <string.h> // Tratamento de  strings;
#include <math.h>  // Funções matemáticas comuns em computação;
#include <locale.h> // Especifica constantes de acordo com a localização específica, como moeda, data, etc;
#include <ctype.h> // Funções para conversão de maiúsculas, minúsculas e outros tratamentos de caracteres;
#include <time.h> // Capturar a data do sistema;
#include <windows.h> //Pro Sleep;
#define n printf("\n");  
#define c system("cls||clear"); 


 
int codfunci=0, codprod=0, codsell=0,maiorsell=0, cod_prod, cod_funci;//A variável no qual começa a contar o codigo de cada vendedor e produto
int *c_f=&codfunci; //Ponteiro que aponta para a variável codfunci;
int *c_p=&codprod; //Ponteiro que aponta para a variável codprodi;
int *c_s=&codsell; //Ponteiro que aponta para a variável codsell;


/*==========================>> STRUCTS <<=========================*/

typedef struct{
	int quantify_vendas;
	float total_cash;
}sell;                       // struct de vendas

typedef struct{
  int codigo;
  char descricao[200];
  char unidadeMed[50];
  double qtdEstoque;
  double qtdMinEstoq;
  char dataEntrada[9];
  double preco;
  int total_sells;
}produtos;                 // struct de produtos
 
/*========= FIM PRODUTOS ==========*/ 


/*========= STRUCT FUNCIONÁRIOS ==========*/ 
typedef struct{
  int CodFuncionario;
  char nome[50];
  char cargo[100];
  char nascimento[20];
  char sexo[20];
  double tel;
  sell vendas_funci;
}funcionario;
/*========= FIM FUNCIONÁRIOS ==========*/ 


/*========= STRUCT VENDAS ==========*/ 
typedef struct{
  int cod_venda;
  char data_operacao[9];
  int cod_prod_vendido;
  int qqt_produto_vendido;
  double valor_total_venda;
  int cod_funci;
}vendas_arq;
/*========= FIM VENDAS ==========*/ 


/*==========================>> FIM STRUCTS <<=========================*/

/*========= FUNÇÕES ==========*/

void data_operacao(char str1[9]);
void menu();
void menu2(double *escolha);
void tratamento(char *string);
void transstr(char *string, int *cont, double *choice);
void logotipo();            

/*Funcionarios*/
void inserir_funcionario();
void listar_func();
void rem_funcionario();
void editar_funci();
void consultar_funci();
void verificacao_de_arquivo_de_funcionario();
void verificacao_de_arquivo_de_produto();
/*Fim Funcionarios*/


/*Produtos*/
void inserir_produto();
void consultar_produto();
void rem_produt();
void listar_prod();
void editar_prod();
/*Fim Produtos*/

/*Vendas*/
void consultar_vendas();
void vendas();
void vendas_funci();
void verificacao_de_arquivo_de_vendas();
void consultar_vendas02();
void listar_vendas();
void relatorio_txt();
void relatorio_tela();
void relatorio_erro(char str[9]);
/*Fim Vendas*/

/*========= FIM FUNÇÕES ==========*/ 





/*========= FUNÇÃO MAIN ==========*/ 

int main(){
    
	setlocale(LC_ALL, "Portuguese"); // Possibilita a utilização de acentuação; 
    
	logotipo();
    
	printf("Hora de acesso: >> %s <<\nData de acesso: >> %s <<",__TIME__,__DATE__);  // Pegua data e hora atual do sistema
	n n
    menu();     // chamando o menu principal na main
    

  return 0;  
}
/*========= FIM MAIN ==========*/ 



/*=================>> FUNÇÃO MENU <<===================*/

void menu(){

  char escolha[5];
  double choice;
  int cont;
  
  
	system("color 2f");      // sistema de cores
	
   do{
   
    puts("\t===============>> MENU PRINCIPAL <<==============");

    printf("\n\t|\t0 -> Sair\n\n");
    printf("\t|\t1 -> Gerir funcionários\n\n");
    printf("\t|\t2 -> Gerir produtos\n\n");
    printf("\t|\t3 -> Gerir vendas\n\n");
    printf("\t|\t4 -> Gerir relatórios\n");
    
    puts("\t=================================================");
    printf("\n>> ");
    fgets(escolha,5,stdin);        //Ler a escolha do usuario, em forma de string
    c
    tratamento(escolha);            //Faz o tratamento do '\n'
    transstr(escolha,&cont,&choice); //Transfere o conteudo da string para uma variavel inteira, se possivel
     

    if(cont==1){

    if(choice==0){												// Se a escolha for igual a 0, o programa encerra
      puts(">>>>>>> Obrigado pela preferência ;) <<<<<<<");
      puts("\a");             // gerar um som
      exit(0);
    }        

    if(choice>4){			 // se a escolha for um número maior que a quantidade de opções do menu, mostra uma mensagem de erro e é retornado o menu 
      
	  system("color 4f");
	  printf("\nOps... :( Opção inválida! Por favor, digite uma opção válida.\n\n");
      Sleep(200);           // a tela fica adormecida por 2 segundos
	  return menu();
    }
        
       menu2(&choice);        //Chamar o submenu, de acordo com a escolha do usuario
  }
  
   }while(cont==0);

}
/*=================>> FIM FUNÇÃO MENU <<===================*/


/*=================>> FUNÇÃO MENU2 <<===================*/

void menu2(double *escolha){

  char selecionar[5];
  double choice; 
  int cont;
  
  system("color 1f");

  if(*escolha==1){
	
    c   // ou system("clear"); limpa o conteúdo da tela;   
    
	verificacao_de_arquivo_de_funcionario();  // Informa se o arquivo de funcionário não existe 
	    
    do{

	puts("==============>> GERIR FUNCIONÁRIOS <<===============");
    printf("|\t0 -> Sair\n"); 
    printf("|\t1 -> Voltar\n");
    printf("|\t2 -> Inserir funcionários\n");
    printf("|\t3 -> Remover funcionário\n");
    printf("|\t4 -> Consultar funcionário\n");
    printf("|\t5 -> Editar funcionário\n");
    printf("|\t6 -> Listar todos os funcionários\n");
    puts("=====================================================");
    printf("\n>> ");
    fgets(selecionar,5,stdin);
    c
    tratamento(selecionar);
    transstr(selecionar,&cont,&choice);
  
  if(cont==1){
    
  if(choice==0){
     puts("\a");
  	 exit(0);
  }
  

	if(choice==1){
      c 
      return menu();
  }

      if(choice==2)
        inserir_funcionario();
        
        if(choice==3){
        	c
            rem_funcionario();
		}
        	    
		if(choice==4){
	  	  c
	  	  consultar_funci();
	  	}
	  	
        if(choice==5){
      	  editar_funci();
	    }
	    
	  	if(choice==6){
	    	listar_func();
		}
	  	if(choice>6){			 // se a escolha for um número maior que a quantidade de opções do menu, mostra uma mensagem de erro e é retornado o menu 
      
	  		system("color 4f");
	  		printf("\nOps... :( Opção inválida! Por favor, digite uma opção válida.\n\n");
      		Sleep(200);
			         
	  	    return menu2(escolha);
    	}
     }
     
  }while(cont==0);
}


  if(*escolha==2){
  	
    c
    
    verificacao_de_arquivo_de_produto();    // Informa se o arquivo de produto não existe 
    
  do{
  	
    puts("===================>> PRODUTOS <<====================");
    printf("|\t0 -> Sair\n");
    printf("|\t1 -> Voltar\n");
    printf("|\t2 -> Inserir produtos\n");
    printf("|\t3 -> Remover produtos\n");
    printf("|\t4 -> Consultar produtos\n");
    printf("|\t5 -> Editar produtos\n");
    printf("|\t6 -> Listar todos os produtos\n");
    puts("=======================================");
    printf("\n>> ");
    fgets(selecionar,5,stdin);
    c
    tratamento(selecionar);
    transstr(selecionar,&cont,&choice);
    
  if(cont==1){
	if(choice==0){
      exit(0);
    }

    if(choice==1){
      c
      return menu();
    }
	  
    if(choice==2){
    	c
    	inserir_produto();
	}
	
	if(choice==3){
		c
		rem_produt();
	}
	
	if(choice==4){
		c
		consultar_produto();
	}
	
	if(choice==5){
		c
		editar_prod();
	}
	
	if(choice==6){
		c
	 listar_prod();
	}
	if(choice>6){			 // se a escolha for um número maior que a quantidade de opções do menu, mostra uma mensagem de erro e é retornado o menu 
      
	  system("color 4f");
	  printf("\nOps... :( Opção inválida! Por favor, digite uma opção válida.\n\n");
      Sleep(200);       
      
	  return menu2(escolha);
    }
  }
    
  }while(cont==0);
  

  }
  
  if(*escolha==3){
  	
  	printf("==============>> GERIR VENDAS <<===============\n\n");
	printf("|\t1 -> Vender\n");
    printf("|\t2 -> Visualizar funcionarios e suas vendas\n");
    printf("|\t3 -> Listar todas as vendas\n");
    printf("|\t4 -> Consultar as vendas\n");
  	puts("=================================================\n\n");
    n
  	fgets(selecionar, 5, stdin);
  	tratamento(selecionar);
  	transstr(selecionar, &cont, &choice);
  	fflush(stdin);
  	
  	if(choice==1){
  		c
  		vendas_funci();
	  }
	  if(choice==2){
	  	c
	  	consultar_vendas();
	  }
	  if(choice==3){
	  	c
	  	listar_vendas();
	  }
	  if(choice==4){
	  	c
	  	consultar_vendas02();
	  }
	  if(choice>4){			 // se a escolha for um número maior que a quantidade de opções do menu, mostra uma mensagem de erro e é retornado o menu 
      
	  system("color 4f");
	  printf("\nOps... :( Opção inválida! Por favor, digite uma opção válida.\n\n");
      Sleep(200);       
      
	  return menu();
    }
  }
  
  if(*escolha==4){
  	c
  	
  	printf("==============>> CONSULTAR VENDAS <<===============\n");
  	printf("\t|1 -> Criar txt\n");
	printf("\t|2 -> Visualizar no programa\n");
	printf("\t|3 -> Voltar\n");
	printf("\t|4 -> Sair\n");
	puts("=================================================\n\n");
	printf(">> ");
	fgets(selecionar, 5, stdin);
	transstr(selecionar, &cont, &choice);
	fflush(stdin);
	
	if(choice==1){
		c
		relatorio_txt();
	}
	if(choice==2){
		c
		relatorio_tela();
	}
	if(choice==3){
		c
		return menu2(escolha);
	}
	if(choice==4){
		c
		puts(">>>>>>> Obrigado pela preferência ;) <<<<<<<");
		puts("\a");
		exit(0); 
	}
	   if(choice>4){			 // se a escolha for um número maior que a quantidade de opções do menu, mostra uma mensagem de erro e é retornado o menu 
      
	  system("color 4f");
	  printf("\nOps... :( Opção inválida! Por favor, digite uma opção válida.\n\n");
      Sleep(200);      
	   
	  return menu2(escolha);
    }
  }
}
/*=================>> FIM FUNÇÃO MENU2 <<===================*/



/*=================>> FUNÇÃO INSERIR FUNCIONÁRIO <<===================*/

void inserir_funcionario(){

  FILE *arq;
  arq=fopen("funcionarios.bin", "ab");
  
  if(arq==NULL)
    puts("O arquivo não foi encontrado :(");


  int cont, insertquantify,i;
  char numero[20];

  printf("Quantos funcionários você deseja inserir ? ");
  printf("\n>> ");
  scanf("%d",&insertquantify);               
  fflush(stdin);
    
  if(insertquantify==0){
  	  c	
	  return menu();
  }

  funcionario *registro;

    registro = (funcionario *) calloc(insertquantify,sizeof(funcionario));
    
    c 
    printf("==============>> REGISTRO FUNCIONÁRIO <<===============\n\n");
    
    
    for(i=0;i<insertquantify;i++){ 

	 	
      printf("Nome completo >> ");        

	  fgets(registro[i].nome,50, stdin);    
      tratamento(registro[i].nome);
    
      n
      printf("Cargo >> ");
      fgets(registro[i].cargo,100, stdin);
      tratamento(registro[i].cargo);
    
      n
      printf("Data de nascimento >> ");
      fgets(registro[i].nascimento, 20, stdin);
      tratamento(registro[i].nascimento);
    
     
    
      n
      printf("Sexo >> ");
      fgets(registro[i].sexo, 20, stdin);
      tratamento(registro[i].sexo);
    
      n

      do{
		
		printf("Número de telefone >> ");
        fgets(numero, 20, stdin);
        tratamento(numero);
        transstr(numero,&cont,&registro[i].tel);
      
      }while(cont==0);
    
      registro[i].CodFuncionario=++codfunci;
      n
      printf("Código do funcionário: >> %d <<\n\n",registro[i].CodFuncionario);
      n
      puts("=====================================");
      n
     
    }

    fwrite(registro, sizeof(funcionario), insertquantify, arq);
    fclose(arq);
    free(registro);
    
    int opc;
	
    printf("Deseja fazer mais alguma coisa ? ");
    printf(" \n0 -> Sair\n1 -> Voltar para Menu\n2 -> Inserir mais funcionários\n3 -> Mostrar todos funcionários\n4 -> Editar Funcionário\n5 -> Remover Funcionário\n6 -> Consultar Funcionário\n");
    printf("\n>> ");
    scanf("%d",&opc);
    fflush(stdin);

    switch (opc){

      case 0: exit(0); break;
      case 1:
        c
        return menu();
        break;  
      case 2:
        c
        return inserir_funcionario();
        break;
      case 3:
      	c
      	return listar_func();
	  	break;
	  case 4:
	  	c
	  	return editar_funci();
	  	break;
	  case 5: 
	  	c
		return rem_funcionario();
		break;
	  case 6: 
		c
		return consultar_produto(); 		
	  	break;   	
	  default:
	    puts("Por favor, digite uma opção válida!!!");		  
		c    
	}

    
}
/*=================>> FIM FUNÇÃO INSERIR FUNCIONÁRIO <<===================*/


/*=================>> FUNÇÃO INSERIR PRODUTOS <<===================*/

void inserir_produto(){
	
  FILE *prod;
  prod=fopen("produtos.bin", "ab");
  
  int cont, insertquantify,i;
  char preco[50], minestoque[1000],maxestoque[1000],unidade_de_medida[50];
  printf("Quantos produtos você deseja inserir ? ");
  printf("\n>> ");
  scanf("%d",&insertquantify);
  fflush(stdin);
  
  if(insertquantify==0){         
  	  c	
	  return menu();
  }
  
  produtos *estoque;
    
  estoque = (produtos *) calloc(insertquantify,sizeof(produtos));    // Alocando memoria para estoque
  
  printf("==============>> REGISTRO PRODUTOS <<===============\n\n");
    
    for(i=0;i<insertquantify;i++){
    	
      printf("Informe a descrição do produto: ");
      fgets(estoque[i].descricao,200, stdin);
      tratamento(estoque[i].descricao);
   	  
	  n
		 
      
	  do{
	  	printf("Digite o preço : ");
        fgets(preco, 50, stdin);
        tratamento(preco);
        transstr(preco, &cont, &estoque[i].preco);
	  }while(cont==0);
	 
      n
      do{
      printf("Máximo estoque: ");
      fgets(maxestoque, 1000, stdin);
      tratamento(maxestoque);
      transstr(maxestoque,&cont,&estoque[i].qtdEstoque);
		}while(cont==0);
      
	  n
      
	  do{
	  	printf("Mínimo estoque: ");
      fgets(minestoque,1000,stdin);
      tratamento(minestoque);
      transstr(minestoque,&cont,&estoque[i].qtdMinEstoq);
	  }while(cont==0);
	  

      n
      do{
      	printf("Unidade de medida: ");
      	fgets(estoque[i].unidadeMed, 50, stdin);
      	tratamento(estoque[i].unidadeMed);
	  }while(cont==0);
    	
      data_operacao(estoque[i].dataEntrada);
      estoque[i].codigo=++codprod;
      
       n
      printf("Código do produto: >> %d <<\n\n",estoque[i].codigo);
      
      puts("=====================================");
      n
    }
    
    fwrite(estoque, sizeof(produtos), insertquantify, prod);      //Podemos escrever e ler blocos de dados no arquivo
    fclose(prod);
    free(estoque);                 // Liberando o espaço alocado
    
    int opc;
	
    printf("Deseja fazer mais alguma coisa ? ");
    printf(" \n0 -> Sair\n1 -> Voltar para Menu\n2 -> Inserir mais Produtos\n3 -> Mostrar todos Produtos\n4 -> Editar Produtos\n5 -> Remover Produtos\n6 -> Consultar Produtos\n");
    printf("\n>> ");
    scanf("%d",&opc);
    fflush(stdin);

    switch (opc){

      case 0: exit(0); break;
      case 1:
        c
        return menu();
        break;  
      case 2:
        c
        return inserir_produto();
        break;
      case 3:
      	c
      	return listar_prod();
	  	break;
	  case 4:
	  	c
	  	return editar_prod();
	  	break;
	  case 5: 
	  	c
		return rem_produt();
		break;
	  case 6: 
		c
		return consultar_produto(); 		
	  	break;   	
	  default:
	    puts("Por favor, digite uma opção válida!!!");		  
		c    
	}
    
}
/*=================>> FIM FUNÇÃO INSERIR PRODUTOS <<===================*/



/*=================>> FUNÇÃO LISTAR FUNCIONÁRIO <<===================*/

void listar_func(){

  FILE *ar;

  ar=fopen("funcionarios.bin", "rb");
  
  if(ar==NULL)
  	puts("ERRO NULL");
  
  funcionario registro;
  
  for(;fread(&registro, sizeof(funcionario), 1, ar);){
  	if(registro.CodFuncionario>0)
      printf("Código do funcionário: >> %d <<\n\nNome: >> %s\n\n=====================================\n\n",registro.CodFuncionario,registro.nome);
  }

  fclose(ar);
  
  int opc;
  
    printf("Deseja fazer mais alguma coisa ? ");
    printf(" \n0 -> Sair\n1 -> Voltar para Menu\n2 -> Inserir funcionários\n3 -> Mostrar todos funcionários\n4 -> Editar Funcionário\n5 -> Remover Funcionário\n6 -> Consultar Funcionário\n");
    printf("\n>> ");
    scanf("%d",&opc);
    fflush(stdin);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  if(opc==2){
  	c
  	return inserir_funcionario();
  }
  if(opc==3){
  	c
  	return  listar_func();
  }
  if(opc==4){
  	c
  	return editar_funci();
  }
  if(opc==5){
  	c
  	return rem_funcionario();
  }
  if(opc==6){
  	c
  	return consultar_funci();
  }
}
/*=================>> FIM FUNÇÃO LISTAR FUNCIONÁRIO <<===================*/


/*=================>> FUNÇÃO VERIFICAÇÃO DE ARQUIVO <<===================*/
void verificacao_de_arquivo_de_funcionario(){
  
  FILE *file;
	file = fopen("funcionarios.bin", "rb");

  if(file!=NULL){
    
    funcionario registro;
    
    while(fread(&registro, sizeof(funcionario), 1, file)==1){        // verifica e resgata o ultimo codigo do produto 
      	if(registro.CodFuncionario>0)
	   *c_f =registro.CodFuncionario;      
      }
      
    fclose(file);
   }else
      puts("Nenhum arquivo encontrado, por favor registre um funcionário.\n");
}
/*=================>> FIM FUNÇÃO VERIFICAÇÃO DE ARQUIVO <<===================*/



/*=================>> FUNÇÃO TRATAMENTO <<===================*/

void tratamento(char *string){
	
  if(string[strlen(string) - 1] == '\n')  
  string[strlen(string) - 1] = '\0'; 				     
  fflush(stdin);

}
/*=================>> FIM FUNÇÃO TRATAMENTO <<===================*/



/*=================>> FUNÇÃO TRANSSTR <<===================*/
void transstr(char *string, int *cont, double *choice){

  *cont=0;
  int i;
  for(i=0;i<strlen(string);i++){
    if(isdigit(string[i])==0){          //Verifica se o caracter na posição especifica da string, é um caracter númerico
      c
      printf("Ops... Por favor, digite uma opção válida.\n");
      
      *cont=0;            //Caso não seja caracter númerico, a váriavel de controle vai ser zero
      break;
    }else{
      *cont=1;                        //Caso seja númerico, recebe 1
      *choice=atof(string);           //Tranferir o conteúdo da string para uma váriavel inteira
      break;  
    }
  }
}
/*=================>> FIM FUNÇÃO TRANSSTR <<===================*/



/*=================>> Verificação do arquivo de produto <<===================*/
void verificacao_de_arquivo_de_produto(){
	
	FILE *file;
	file = fopen("produtos.bin", "rb");

  if(file!=NULL){  
    produtos estoque;
    for(;fread(&estoque, sizeof(produtos), 1, file);){
    	if(estoque.codigo>0)
       *c_p =estoque.codigo;
    }
    fclose(file);
   	}else
      puts("Nenhum arquivo encontrado, por favor registre um produto.\n");
}

/*=================>> FIM Verificação do arquivo de produto <<===================*/



/*=================>> FUNÇÃO LISTAR PRODUTO <<===================*/

void listar_prod(){
	
	FILE *ar;

  ar=fopen("produtos.bin", "rb");
  
  if(ar==NULL)
  	puts("ERRO NULL");
  
  produtos estoque;
  
  for(;fread(&estoque, sizeof(produtos), 1, ar);){       
  	if(estoque.codigo>0)
    printf("Produto: >> %s \nCodigo do produto: >> %d \n==================\n",estoque.descricao, estoque.codigo);
  }

  fclose(ar);
  
  int opc;
  
  puts("\n\nPor favor, digite uma opção: \n\n");
  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Consultar um produto");
  printf(">> ");
  scanf("%d",&opc);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  if(opc==2){
  	c
  	return consultar_produto();
  }
}
/*=================>> FIM LISTAR PRODUTO <<===================*/


/*=================>> Data de operação <<===================*/

void data_operacao(char str1[9]){
	
	char date[9];
	
	_strdate(date);                   // copie a data atual em um determinado buffer
	
    	char day[5]={ date[3],date[4]};       // Trocando padrão americano por padrão Brasileiro   
    	char month[5]={date[0],date[1]};     
    	char year[5]={date[6],date[7]};
    	
      strcat(str1, day);        // Contatena 
      strcat(str1,"/");
      strcat(str1,month);
      strcat(str1,"/");
      strcat(str1, year);
      strcat(str1, "\0");
      
}
/*=================>> Fim Data de operação <<===================*/


/*=================>> Consultar Produtos <<===================*/

void consultar_produto(){
	
  FILE *ar=fopen("produtos.bin", "rb");

  int opcod;
  
  if(ar==NULL)
  	puts("ERRO NULL");
  
  produtos estoque;
  printf("digite o codigo do produto desejado: >>");
  scanf("%d", &opcod);
  
  for(;fread(&estoque, sizeof(produtos), 1, ar);){
    	if(opcod==estoque.codigo)
    	printf("Código do produto: >> %d <<\n\nDescrição: >> %s\n\nPreço: >> %.2f\n\nMaximo em estoque: >> %.0f\n\nMinimo em estoque: >> %.0f\n\nUnidade de medida: >> %s\n\nData de registro: >> %s\n\n=====================================\n\n",estoque.codigo,estoque.descricao,estoque.preco,estoque.qtdEstoque,estoque.qtdMinEstoq, estoque.unidadeMed,estoque.dataEntrada);
  }

  fclose(ar);
  
  int opc;
  
  puts("\n\nPor favor, digite uma opção: \n\n");
  puts("0 -> Sair\n1 -> Voltar para menu principal\n");
  printf(">> ");
  scanf("%d",&opc);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  
}
/*=================>> Fim consultar produtos <<===================*/



/*=================>> Remover produtos <<===================*/

void rem_produt(){
	
	int choice;
	int posicao;
	
	produtos estoque;
	
	printf("Digite o codigo do produto que deseja excluir: ");
	scanf("%d", &choice);
	
	FILE *ar=fopen("produtos.bin", "r+wb");
	
	while(feof(ar)==0){
		posicao=ftell(ar);                       // Retorna o valor atual do indicador de posição do fluxo
		fread(&estoque, sizeof(produtos), 1, ar);
		
		if(choice==estoque.codigo){   
			fseek(ar,posicao,SEEK_SET);  // A função retorna o número de unidades efetivamente lidas
			estoque.codigo=-1;
			fwrite(&estoque, sizeof(produtos), 1, ar);
			break;
		}
	}
	rewind(ar);     // serve para retornar ao começo do arquivo.
	fclose(ar); 
	
	int opc;
  
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Remover produto novamente\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return rem_produt();
	  }
  
}
/*=================>> Fim Remover produtos <<===================*/



/*=================>> Remover funcionários <<===================*/

void rem_funcionario(){
	
	int choice;
	int posicao;
	
	funcionario registro;
	
	printf("Digite o codigo do funcionario que deseja excluir: ");
	scanf("%d", &choice);
	
	FILE *ar=fopen("funcionarios.bin", "r+wb");
	
	while(feof(ar)==0){
		posicao=ftell(ar);
		fread(&registro, sizeof(funcionario), 1, ar);
		
		if(choice==registro.CodFuncionario){
			fseek(ar,posicao,SEEK_SET);
			registro.CodFuncionario=-1;
			fwrite(&registro, sizeof(funcionario), 1, ar);
			break;
		}
	}
	rewind(ar);
	fclose(ar);
	
	int opc;
  
	  printf("====================> FUNCIONARIO REMOVIDO <==================== \n");
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Remover funcionario novamente\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return rem_funcionario();
	  }
}
/*=================>> Fim Remover funcionários <<===================*/


/*=================>> Editar funcionários <<===================*/
void editar_funci(){
	
	int choice,choice2, controle,opc;
	double a;
	int posicao;
	char str[50];
	
	funcionario registro;
	
	printf("Digite o código do funcionário que deseja editar >> ");
	scanf("%d", &choice);
	fflush(stdin);
	n
	printf("|\t1 -> Editar Nome\n");
	printf("|\t2 -> Editar Cargo\n");
	printf("|\t3 -> Editar Data de Nascimento\n");
	printf("|\t4 -> Editar Sexo\n");
	printf("|\t5 -> Editar Telefone\n");
	printf(">> ");
	scanf("%d", &choice2);
	fflush(stdin); 
	
	FILE *ar=fopen("funcionarios.bin", "r+wb");
	
	while(feof(ar)==0){      // verifica o indicador de fim de arquivo (EOF) do fluxo e retorna um valor 
	                                                //diferente de zero se este indicador estiver setado
		posicao=ftell(ar);
		fread(&registro, sizeof(funcionario), 1, ar);
		
		if(choice==registro.CodFuncionario){
			fseek(ar,posicao,SEEK_SET);      // (constante de valor 0) - movimenta para a posição indicada.
			
		switch(choice2){
			
				case 1: 
					printf("Digite o novo nome: ");
					fgets(str,50,stdin);
					tratamento(str);
					strcpy(registro.nome, str);
					
					fwrite(&registro, sizeof(funcionario), 1, ar);
					fclose(ar);
				 puts("\n\nPor favor, digite uma opção: \n\n");
				  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar funcionario novamente\n");
				  printf(">> ");
				  scanf("%d",&opc);
				  
				  if(opc==0){
				  	c
				  	exit(0);
				  }
				  
				  if(opc==1){
				  	c
				  	return menu();
				  }
				  if(opc==2){
				  	c
				  	return editar_funci();
				  }
					
				case 2: 
					printf("Digite o novo cargo: ");
					fgets(str,50,stdin);
					tratamento(str);
					strcpy(registro.cargo, str);
					n
					fwrite(&registro, sizeof(funcionario), 1, ar);
					fclose(ar);
					 puts("\n\nPor favor, digite uma opção: \n\n");
					  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar funcionario novamente\n");
					  printf(">> ");
					  scanf("%d",&opc);
					  
					  if(opc==0){
					  	c
					  	exit(0);
					  }
					  
					  if(opc==1){
					  	c
					  	return menu();
					  }
					  if(opc==2){
					  	c
					  	return editar_funci();
					  }

				case 3:
					fgets(str,50,stdin);
					tratamento(str);
					strcpy(registro.nascimento, str);
					n
					fwrite(&registro, sizeof(funcionario), 1, ar);
					fclose(ar);
				 puts("\n\nPor favor, digite uma opção: \n\n");
				  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar funcionario novamente\n");
				  printf(">> ");
				  scanf("%d",&opc);
				  
				  if(opc==0){
				  	c
				  	exit(0);
				  }
				  
				  if(opc==1){
				  	c
				  	return menu();
				  }
				  if(opc==2){
				  	c
				  	return editar_funci();
                }
		
				case 4:
					fgets(str,50,stdin);
					tratamento(str);
					strcpy(registro.sexo, str);
					n
					fwrite(&registro, sizeof(funcionario), 1, ar);
					fclose(ar);
					
				  puts("\n\nPor favor, digite uma opção: \n\n");
				  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar funcionario novamente\n");
				  printf(">> ");
				  scanf("%d",&opc);
				  
				  if(opc==0){
				  	c
				  	exit(0);
				  }
				  
				  if(opc==1){
				  	c
				  	return menu();
				  }
				  if(opc==2){
				  	c
				  	return editar_funci();
				  }
								
				case 5:
					fgets(str,50,stdin);
					tratamento(str);
					transstr(str,&controle,&registro.tel);
					n
					fwrite(&registro, sizeof(funcionario), 1, ar);
					fclose(ar);
				  puts("\n\nPor favor, digite uma opção: \n\n");
				  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar funcionario novamente\n");
				  printf(">> ");
				  scanf("%d",&opc);
				  
				  if(opc==0){
				  	c
				  	exit(0);
				  }
				  
				  if(opc==1){
				  	c
				  	return menu();
				  }
				  if(opc==2){
				  	c
				  	return editar_funci();
				  }
			}
		}
	}
	
	rewind(ar);
	fclose(ar);
}
/*=================>> Fim Editar funcionários <<===================*/


/*=================>> Consultar Funcionários <<===================*/
void consultar_funci(){
	
	FILE *ar=fopen("funcionarios.bin", "rb");
 
  int opcod;
  
  if(ar==NULL)
  	puts("ERRO NULL");
  
  funcionario registro;
  
  printf("digite o codigo do funcionario desejado: >>");
  scanf("%d", &opcod);
  
  for(;fread(&registro, sizeof(funcionario), 1, ar);){
    	if(opcod==registro.CodFuncionario)
    	printf("\n\nNome: >> %s <<\n\nCargo: >> %s\n\nNascimento: >> %s\n\nSexo: >> %s\n\nNumero de telefone: >> %.0f\n\nCodigo: >> %d\n\n=====================================\n\n",registro.nome,registro.cargo,registro.nascimento,registro.sexo,registro.tel,registro.CodFuncionario);
	
  }

  fclose(ar);
  
  int opc;
  
  puts("\n\nPor favor, digite uma opção: \n\n");
  puts("0 -> Sair\n1 -> Voltar para Menu Principal\n3 -> Fazer Nova Consulta de Funcionario");
  printf(">> ");
  scanf("%d",&opc);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  if(opc==2){
  	c
  	return consultar_funci();
  }
  
}
/*=================>> Fim Consultar funcionários <<===================*/


/*=================>> Editar produtos <<===================*/
void editar_prod(){
	
 int choice,choice2, controle, opc;
	double a;
	int posicao;
	char str[50];
	
 produtos estoque;
 
 printf("Digite o codigo do produto que deseja editar: ");
 scanf("%d", &choice);
 fflush(stdin); n
 printf("|\t1 -> Editar descrição\n");
 printf("|\t2 -> Editar unidade de medida\n");
 printf("|\t3 -> Editar quantidade de estoque\n");
 printf("|\t4 -> Editar quantidade minima de estoque\n");
 printf("|\t5 -> Editar preço\n");
 printf("|\t6 -> Voltar\n");
 printf("|\t7 -> Sair\n");
 printf(">> ");
 scanf("%d", &choice2);

 fflush(stdin);
 FILE *ar=fopen("produtos.bin", "r+wb");
 
 while(feof(ar)==0){
 	
   posicao=ftell(ar);
   fread(&estoque, sizeof(produtos), 1, ar);
   
   if(choice==estoque.codigo){
     fseek(ar,posicao,SEEK_SET);
     
  switch(choice2){
       case 1: 
         printf("Digite a nova descrição >> ");
         fgets(str,50,stdin);
         tratamento(str);
         strcpy(estoque.descricao, str);
         
         fwrite(&estoque, sizeof(produtos), 1, ar);
         fclose(ar);
       
  
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar produto novamente\n3 -> Voltar\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return editar_prod();
	  }
        
       case 2:
         printf("Digite a nova unidade de medida >> ");
         fgets(str,50,stdin);
         tratamento(str);
         strcpy(estoque.unidadeMed, str);
         n
         fwrite(&estoque, sizeof(produtos), 1, ar);
      	fclose(ar);
            
  
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar produto novamente\n3 -> Voltar\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return editar_prod();
	  }
      
       case 3:
       			printf("Digite a nova quantidade de estoque >> ");
         fgets(str,50,stdin);
         tratamento(str);
         transstr(str,&controle,&estoque.qtdEstoque);
         
         n
         fwrite(&estoque, sizeof(produtos), 1, ar);
      	 fclose(ar);
    
  
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar produto novamente\n3 -> Voltar\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return editar_prod();
	  }
	  
       case 4:
       	
       printf("Digite a nova quantidade minima de estoque >> ");
         fgets(str,50,stdin);
         tratamento(str);
         transstr(str,&controle, &estoque.qtdMinEstoq);
         
         n
         fwrite(&estoque, sizeof(produtos), 1, ar);
         fclose(ar);   
  
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar produto novamente\n3 -> Voltar\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return editar_prod();
	  }
	  
       case 5:
       printf("Digite o novo preço >> ");
         fgets(str,50,stdin);
         tratamento(str);
         transstr(str,&controle,&estoque.preco);
         
         n
         fwrite(&estoque, sizeof(produtos), 1, ar);
         fclose(ar);
  
	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Editar produto novamente\n3 -> Voltar\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  if(opc==2){
	  	c
	  	return editar_prod();
	  }  
     	
		case 6:
		 c
		 return menu();
		 break;
		case 7: 
		 c
		 puts("\a");
		 exit(0);
		 break; 
	 }  
   }
 }
 fclose(ar);

}
/*=================>> Fim Editar produtos <<===================*/


/*=================>> Vendas <<===================*/
void vendas_funci(){
	
	verificacao_de_arquivo_de_vendas();
	
	FILE *funci=fopen("funcionarios.bin", "rb");
	FILE *prod=fopen("produtos.bin", "r+wb");
	FILE *sells=fopen("vendas.bin", "ab");
	
	char data_de_erro[9];
	data_operacao(data_de_erro);
	int cod_prod, cod_funci, prod_quantify, codprod;
	double preco;
	int posicao,posicao2;
	int cont=0, cont1=0, cont2=0, codf;
	
	produtos estoque;
	funcionario registro;
	vendas_arq vendas;
	
	n n 
	
	printf("Digite o código do produto que deseja vender >>  \n");
 	scanf("%d", &cod_prod);
 	printf("Digite a quantidade que deseja vender >>  \n");
 	scanf("%d", &prod_quantify);
 	printf("Digite o código do funcionario que realizou a venda >> \n");
 	scanf("%d", &cod_funci);
 	
 	while(feof(funci)==0){
 		
 		fread(&registro,sizeof(funcionario), 1, funci);
 		if(cod_funci==registro.CodFuncionario){
 			cont1=1;
 			break;
		 }
 	}
		 if(cont1=1){
		 	
		 	while(feof(prod)==0){
		 		
		 		posicao=ftell(prod);
 				fread(&estoque,sizeof(produtos), 1, prod);
 				
 				if(cod_prod==estoque.codigo){
 					fseek(prod,posicao,SEEK_SET);
 					cont2=1;
 					codprod=estoque.codigo;
 					break;
				 }		 
			 }
		 }
		 	while(feof(prod)==0){    //verifica o indicador de fim de arquivo (EOF) do fluxo e retorna um valor diferente de zero se este indicador estiver setado.
		 		posicao=ftell(prod);
		 		fread(&estoque,sizeof(produtos), 1, prod);
		 		if(cont2==1){
		 			
		 			fseek(prod,posicao,SEEK_SET);       //permite realizar operações de leitura e escrita em arquivos de forma randômica.
 					
					 if(estoque.qtdEstoque-prod_quantify>=0){
					 	
 						fseek(prod,posicao,SEEK_SET);
 						estoque.qtdEstoque-=prod_quantify;
 						preco=estoque.preco;
 						estoque.total_sells+=prod_quantify;
 						fwrite(&estoque, sizeof(produtos), 1, prod);
 						cont=1;
 						break;
 						
					 	
					}
					if(estoque.qtdEstoque-prod_quantify<=estoque.qtdMinEstoq){
 							
					 	printf("Número em estoque abaixo do mínimo !\n");
					 	relatorio_erro(data_de_erro);
					 	break;
						
					}
					
				 }
				 
			 }
			 
	 fclose(funci);
	 fclose(prod);
     fopen("funcionarios.bin", "r+wb");
	
	 if(cont==1){
	 	while(feof(funci)==0){
	 		
	 		posicao2=ftell(funci);
	 		fread(&registro,sizeof(funcionario), 1, funci);
	 		
	 		if(cod_funci==registro.CodFuncionario){
	 			
	 			fseek(funci,posicao2,SEEK_SET);
	 			codf=registro.CodFuncionario;
	 			registro.vendas_funci.quantify_vendas+=prod_quantify;
 				registro.vendas_funci.total_cash+=(preco*prod_quantify);
 				fwrite(&registro, sizeof(funcionario), 1, funci);
 				
 				break;
			}			 
		 }
	 }
		 	if(cont==1 && cont1==1 && cont2==1){
		 		
		 		vendas.cod_prod_vendido=codprod;
		 		vendas.cod_venda=++codsell;
		 		data_operacao(vendas.data_operacao);
		 		vendas.qqt_produto_vendido=prod_quantify;
		 		vendas.valor_total_venda=(preco*prod_quantify);
		 		vendas.cod_funci=codf;
		 	
		 		fwrite(&vendas, sizeof(vendas_arq), 1, sells);
			}
		 	
		 	
		
	fclose(sells);
	fclose(funci);
	
	int opc;
    
	printf("Digite uma opção: ");
    printf(" \n0 -> Sair\n1 -> Voltar para Menu\n2 -> Fazer nova Venda\n");
    printf(">> ");
    scanf("%d",&opc);
    fflush(stdin);

    switch (opc){

      case 0: exit(0); break;
      case 1:
        c
        return menu();
        break;
    case 2:
    	c
    	return vendas_funci();
		break;
	  default:
	    puts("Por favor, digite uma opção válida!!!");		  
		c
	}
}
/*=================>> Fim vendas <<===================*/


/*=================>> Consultar vendas <<===================*/

void consultar_vendas(){
	
  FILE *ar=fopen("funcionarios.bin", "rb");

  int opcod;
  
  if(ar==NULL)
  	puts("ERRO NULL");
  
  funcionario registro;
  
  printf("Digite o código do funcionário desejado: >> ");
  scanf("%d", &opcod);
  
  for(;fread(&registro, sizeof(funcionario), 1, ar);){ n
    if(opcod==registro.CodFuncionario)
    	printf("Nome: >> %s <<\n\nCodigo: >> %d\n\nVendas totais: >> %d\n\nTotal de dinheiro pelas vendas: %f\n\n>> =====================================\n\n",registro.nome,registro.CodFuncionario,registro.vendas_funci.quantify_vendas,registro.vendas_funci.total_cash);	
  }

  fclose(ar);
  
  int opc;
  
  puts("\n\nPor favor, digite uma opção: \n\n");
  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Fazer nova Consulta\n");
  printf(">> ");
  scanf("%d",&opc);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  if(opc==2){
  	c
  	return consultar_vendas();
  }
  
}
/*=================>> Fim consultar vendas <<===================*/



/*=================>> Verificação dos arquivos de vendas <<===================*/
void verificacao_de_arquivo_de_vendas(){
	
	FILE *file;
	file = fopen("vendas.bin", "rb");

  if(file!=NULL){  
    vendas_arq sells;
    while(fread(&sells, sizeof(vendas_arq), 1, file)==1){
       *c_s =sells.cod_venda;
      }
      
    fclose(file);
   }else
      puts("Nenhum arquivo encontrado, por favor registre uma venda.\n");
}
/*=================>> Fim Verificação dos arquivos de vendas <<===================*/



/*=================>> Listar vendas <<===================*/
void listar_vendas(){
	
	FILE *ar;
	
	ar=fopen("vendas.bin", "rb");
	
	if(ar==NULL)
		puts("ERRO NULL");
		
	vendas_arq vendas;
	
	for(;fread(&vendas, sizeof(vendas_arq), 1, ar);){ n  
		if(vendas.cod_venda>0)
			printf("Código da venda: >> %d \nData emitida: >> %s\n==================\n",vendas.cod_venda, vendas.data_operacao);
  		}
  		
  	fclose(ar);
  	
  	int opc;
  
  puts("\n\nPor favor, digite uma opção: ");
  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Consultar uma venda\n");
  printf(">> ");
  scanf("%d",&opc);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  if(opc==2){
  	c
  	return consultar_vendas();
  }
	}
/*=================>> Fim Listar vendas <<===================*	
	
	
	
/*=================>> Consultar vendas <<===================*/	

void consultar_vendas02(){                   // Consultar o arquivo de vendas
	
	FILE *ar=fopen("vendas.bin", "rb");
	 
  int opcod;
  if(ar==NULL)
  	puts("ERRO NULL");
  
  vendas_arq vendas;
  
  printf("Digite o codigo do produto desejado >> ");
  scanf("%d", &opcod);
  
  for(;fread(&vendas, sizeof(vendas_arq), 1, ar);){
    	if(opcod==vendas.cod_venda)	
    	printf("Código: >> %d <<\nCódigo do funcionario: >> %d\nCódigo do produto vendido: >> %d\nQuantidade: >> %d\nValor Total da Venda: >> %.3f\nData de Operação: >> %s\n\n>> =====================================\n\n",vendas.cod_venda, vendas.cod_funci, vendas.cod_prod_vendido, vendas.qqt_produto_vendido, vendas.valor_total_venda, vendas.data_operacao);
  }
 
  fclose(ar);
  
  int opc;
  
  puts("\n\nPor favor, digite uma opção: \n\n");
  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Refazer consulta vendas produtos\n");
  printf(">> ");
  scanf("%d",&opc);
  
  if(opc==0){
  	c
  	exit(0);
  }
  
  if(opc==1){
  	c
  	return menu();
  }
  if(opc==2){
  	c
  	return consultar_vendas02();
  }
  
}
/*=================>> Fim Consultar vendas <<===================*/



/*=================>> Relatório em txt <<===================*/

void relatorio_txt(){
	
	int choice, posi, cont=0, codstart, codend, maiorsell=0, cod_prod, cod_funci;
	char datastart_comp[9], dataend_comp[9];
	
	printf("==============>> RELATÓRIO <<===============\n\n");
	printf("1 -> Criar um relatório de todas as vendas \n");
	printf("2 -> Criar um relatório do produto mais vendido \n");
	printf("3 -> Criar um relatório do funcionário que mais vendeu \n");
	printf("4 -> Voltar \n");
	printf("5 -> Sair \n");
	puts("===============================================\n\n");
	printf(">> ");
	scanf("%d", &choice);
	
	fflush(stdin);
	
	if(choice==1){
		
		n
		printf("Digite a data do começo do relatório no formato dd/mm/aa: \n");
		fgets(datastart_comp, 9, stdin);             
		tratamento(datastart_comp);
		printf("Digite a data do final do relatório no formato dd/mm/aa: \n");
		fgets(dataend_comp, 9, stdin);
		tratamento(dataend_comp);
		
		FILE *sells=fopen("vendas.bin", "rb");
		FILE *arq=fopen("relatorio_vendas.txt", "w");
		
		vendas_arq vendas;
		
		while(feof(sells)==0){
			fread(&vendas, sizeof(vendas_arq), 1, sells);
			if(!strcmp(datastart_comp,vendas.data_operacao) && cont==0){
				codstart=vendas.cod_venda;
				cont=1;
			}
			
			if(!strcmp(dataend_comp,vendas.data_operacao) && cont==1){
				codend=vendas.cod_venda;
			
			}
			
		} 	
	
		rewind(sells); //serve para retornar ao começo do arquivo.
		

			for(;fread(&vendas, sizeof(vendas_arq), 1, sells);){
							
				if(vendas.cod_venda>=codstart && vendas.cod_venda<=codend){
					fprintf(arq,"Codigo: >> %d\nCodigo do funcionario: >> %d\nCódigo do produto vendido: >> %d\nQuantidade: >> %d\nValor Total da Venda: >> %.3f\nData de Operação: >> %s\n\n>> =====================================\n\n",vendas.cod_venda, vendas.cod_funci, vendas.cod_prod_vendido, vendas.qqt_produto_vendido, vendas.valor_total_venda, vendas.data_operacao);
				}
					
			}
		
	
		
		fclose(arq);
		fclose(sells);
		produtos estoque;
	}
	if(choice==2){
		
		n
		
		printf("Digite a data do começo do relatório no formato dd/mm/aa: \n");
		fgets(datastart_comp, 9, stdin);
		tratamento(datastart_comp);
		printf("Digite a data do final do relatório no formato dd/mm/aa: \n");
		fgets(dataend_comp, 9, stdin);
		tratamento(dataend_comp);

		FILE *sells=fopen("vendas.bin", "rb");
		FILE *arq=fopen("relatorio_prod.txt", "w");
		FILE *prod=fopen("produtos.bin", "r");
		vendas_arq vendas;
		produtos estoque;
		while(feof(sells)==0){
			fread(&vendas, sizeof(vendas_arq), 1, sells);
			if(!strcmp(datastart_comp,vendas.data_operacao) && cont==0){
				codstart=vendas.cod_venda;
				cont=1;
			}
			if(!strcmp(dataend_comp,vendas.data_operacao) && cont==1){
				codend=vendas.cod_venda;
			}
			
		}
		
		rewind(sells); //serve para retornar ao começo do arquivo.
		n

			for(;fread(&estoque, sizeof(produtos), 1, prod);){
				if(vendas.cod_venda>=codstart && vendas.cod_venda<=codend){
					if(estoque.total_sells>maiorsell){
						maiorsell=estoque.total_sells;
						cod_prod=estoque.codigo;
					}
				}
			}
				fprintf(arq,"Produto mais vendido: %d\n\nQuantidade: %d", cod_prod, maiorsell);
		fclose(arq);
		fclose(sells);
		}
		
		if(choice==3){
			n
		printf("Digite a data do começo do relatório no formato dd/mm/aa: \n");
		fgets(datastart_comp, 9, stdin);
		tratamento(datastart_comp);
		printf("Digite a data do final do relatório no formato dd/mm/aa: \n");
		fgets(dataend_comp, 9, stdin);
		tratamento(dataend_comp);

		FILE *sells=fopen("vendas.bin", "rb");
		
		FILE *prod=fopen("produtos.bin", "r");
		FILE *func=fopen("funcionarios.bin", "r");
		FILE *funcionario_arq=fopen("relatorio_funci.txt", "w");
		vendas_arq vendas;
		produtos estoque;
		funcionario registro;
		while(feof(sells)==0){
			fread(&vendas, sizeof(vendas_arq), 1, sells);
			if(!strcmp(datastart_comp,vendas.data_operacao) && cont==0){
				codstart=vendas.cod_venda;
				cont=1;
			}
			if(!strcmp(dataend_comp,vendas.data_operacao) && cont==1){
				codend=vendas.cod_venda;
			}
			
		}
		rewind(sells);                      //serve para retornar ao começo do arquivo.

			for(;fread(&registro, sizeof(funcionario), 1, func);){
				if(vendas.cod_venda>=codstart && vendas.cod_venda<=codend){
					if(registro.vendas_funci.quantify_vendas>maiorsell){
						maiorsell=registro.vendas_funci.quantify_vendas;
						cod_funci=registro.CodFuncionario;
					}
				}
			}
				fprintf(funcionario_arq, "Funcionário que mais vendeu: %d\n\nQuantidade: %d", cod_funci, maiorsell);
		fclose(funcionario_arq);
		fclose(sells);
		}
		if(choice==4){
			c
			return menu();
		}
		if(choice==5){
			c
			return menu();
		}
	}
	

/*=================>> Fim Relatório em txt <<===================*/



/*=================>> Relatório na tela <<===================*/
void relatorio_tela(){
	
	int choice,opc;
	
	printf("==============>> RELATÓRIO <<===============\n\n");
	printf("1 -> Ver um relatório de todas as vendas \n");
	printf("2 -> Ver um relatório do produto mais vendido \n");
	printf("3 -> Ver um relatório do funcionário que mais vendeu \n");
	printf("4 -> Voltar \n");
	printf("5 -> Sair \n");
	puts("===============================================\n\n");
	printf(">> ");
	scanf("%d", &choice);
	
	if(choice==1){
		
		FILE *ar=fopen("vendas.bin", "rb");
		
		if(ar==NULL)
		puts("ERRO NULL");
		
     	vendas_arq vendas;
	
	for(;fread(&vendas, sizeof(vendas_arq), 1, ar);){
    	printf("Codigo: >> %d\nCodigo do funcionario: >> %d\nCódigo do produto vendido: >> %d\nQuantidade: >> %d\nValor Total da Venda: >> %.3f\nData de Operação: >> %s\n\n>> =====================================\n\n",vendas.cod_venda, vendas.cod_funci, vendas.cod_prod_vendido, vendas.qqt_produto_vendido, vendas.valor_total_venda, vendas.data_operacao);
    }
    
  	fclose(ar);
  	
  	  puts("\n\nPor favor, digite uma opção: \n\n");
	  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Rever Relatorio\n");
	  printf(">> ");
	  scanf("%d",&opc);
	  
	  if(opc==0){
	  	c
	  	exit(0);
	  }
	  
	  if(opc==1){
	  	c
	  	return menu();
	  }
	  
	  if(opc==2){
	  	c
	  	relatorio_tela();
	  }
	}
	
	if(choice==2){
		
		FILE *ar=fopen("relatorio_prod.txt", "r");
		if(ar==NULL)
		puts("ERRO NULL");
	    system("type relatorio_prod.txt");       // Mostra o conteudo do arquivo de texto em questão na tela.
	    fclose(ar);
	    
	    puts("\n\nPor favor, digite uma opção: \n\n");
		  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Rever Relatorio\n");
		  printf(">> ");
		  scanf("%d",&opc);
		  
		  if(opc==0){
		  	c
		  	exit(0);
		  }
		  
		  if(opc==1){
		  	c
		  	return menu();
		  }
		  if(opc==2){
		  	c
		  	relatorio_tela();
		  }	    
	}
	
	if(choice==3){
		
		FILE *ar=fopen("relatorio_prod.txt", "r");
		
		if(ar==NULL)
		puts("ERRO NULL");
		
     	system("type relatorio_funci.txt"); // Mostra o conteudo do arquivo de texto em questão na tela.
	    fclose(ar);
	    
	      puts("\n\nPor favor, digite uma opção: \n\n");
		  puts("0 -> Sair\n1 -> Voltar para menu principal\n2 -> Rever Relatorio\n");
		  printf(">> ");
		  scanf("%d",&opc);
		  
		  if(opc==0){
		  	c
		  	exit(0);
		  }
		  
		  if(opc==1){
		  	c
		  	return menu();
		  }
		  if(opc==2){
		  	c
		  	relatorio_tela();
		}
			    
	}
	
		if(choice==4){
			c
			return menu();
		}
		if(choice==5){
			c
			return menu();
		}
  
  
}
/*=================>> Fim Relatório na tela <<===================*/


/*=================>> Logotipo <<===================*/
void logotipo(){
 system ("color 5F");
 
 printf("     	                                     	 \n");
 printf(" 000000000      000000000          00000000       00000000            00000           	\n");
 printf(" 00000000000    0000000000       000000000000     0000000000          00000          	\n");
 printf(" 000      000   000     000     000        000    000     000         00000             	\n");   	
 printf(" 000      000   000     000    000          000   000     000    000000000000000      	\n");
 printf(" 00000000000    0000000000     000          000   000     000    000000000000000        	\n");
 printf(" 000000000      00000000        000        000    000     000         00000           	\n");
 printf(" 000            000   000        000000000000     0000000000          00000          	\n");
 printf(" 000            000    000         00000000       000000000           00000           	\n");
 printf("\n");
 
 n n
 
 printf("\t\t-------------------->> [CREDIT BY] <<---------------------\n\n");
 printf("\t\t>>>>>>>>>>>>>>>>>>>>> # Guilherme # <<<<<<<<<<<<<<<<<<<\n\n\n");
 printf("\t\t    >>>>>>>>>>>>>>>>> #  Otavio   # <<<<<<<<<<<<<<<\n\n\n");
 printf("\t\t        >>>>>>>>>>>>> #  Ademir   # <<<<<<<<<<<\n\n\n");
 printf("\t\t-------------------->>   [GRUPO]  <<------------------\n\n");
 
 printf("\t\t\t>> PRESSIONE ENTER PARA CONTINUAR <<\n\n\n\n");
 
 n n
 
 system("pause");
 system("cls");	
 
}
/*=================>> Fim Logotipo <<===================*/


/*=================>> Relatório <<===================*/

void relatorio_erro(char str[9]){
	
	FILE *arq=fopen("relatorio_de_erro.txt", "a");
		fprintf(arq, "motivo: fora de estoque\n\nData: %s", str);
	fclose(arq);
	
}
/*=================>> Fim Relatório <<===================*/