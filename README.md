# Projeto PFL - T01G07

## Integrantes:
* Carolina Rosemback Guilhermino - up201800171
* Margarida Cosme - up201709304

## Definições de Funções e Casos de Teste:
### Fib.hs

* fibRec:  
Implementação recursiva da sequência de Fibonacci. Trata-se de uma implementação pouco eficiente, em que é feita uma chamada da função para cada valor. Desse modo cada termo pode ser calculado mais de uma vez.

        Caso de teste: fibRec 10 -> 55  | Tempo de execução: 0.02s | 60,544 bytes
                       fibRec 50 -> 12586269025 | Tempo de execução: 0.01s  | 93,096 bytes
                       fibRec 100 -> 354224848179261915075 | | Tempo de execução: 0.01s | 133,328 bytes
* fibLista:  
Implementação utilizando listas com base em programação dinâmica, em que há uma lista com resultados parciais, sendo mais eficiente do que a resolução recursiva do problema. Assim, só serão calculados os valores necessários para a sequência de Fibonacci.

        Caso de teste : fibLista 10 -> 55 | Tempo de execução: 0.01 secs | 63,872 bytes
                        fibLista 50 -> 12586269025 | Tempo de execução: 0.01 secs | 166,648 bytes
                        fibLista 100 -> 354224848179261915075 | Tempo de execução: 0.01 secs | 420,760 bytes

* fibListaInfinita:  
Implementação utilizando lista infinita, a qual soma os os elementos da lista com a cauda, gerando uma lista com o resultado.

        Caso de teste: fibListaInfinita 10 -> 55 | Tempo de execução: 0.01s | 55,584 bytes
                       fibListaInfinita 50 -> 12586269025 | Tempo de execução: 0.01s | 67,008 bytes
                       fibListaInfinita 100 -> 354224848179261915075 | Tempo de execução: 0.01s |  80,848 bytes

* fibRecBN:  
Trata-se de uma versão de fibRec mas com aplicação para BigNumbers, utilizando a função importada do modulo BigNumber criado, somaBN.

        Caso de teste: fibRecBN [1,0] -> [5,5]  | Tempo de execução: 0.01 secs | 135,312 bytes
                       fibRecBN [5,0] -> [1,2,5,8,6,2,6,9,0,2,5]  | Tempo de execução: 0.01 secs | 799,728 bytes
                       fibRecBN [1,0,0] -> [3,5,4,2,2,4,8,4,8,1,7,9,2,6,1,9,1,5,0,7,5] | Tempo de execução: 0.03 secs | 2,356,504 bytes

* fibListaBN:  
Trata-se de uma versão de fibLista mas com aplicação para BigNumbers, utilizando a função importada do modulo BigNumber criado, somaBN.

        Caso de teste: fibListaBN [1,0] -> [5,5] | Tempo de execução: 0.01 secs | 154,576 bytes
                       fibListaBN [5,0] -> [1,2,5,8,6,2,6,9,0,2,5] | Tempo de execução: 0.01 secs | 908,488 bytes
                       fibListaBN [1,0,0] -> [3,5,4,2,2,4,8,4,8,1,7,9,2,6,1,9,1,5,0,7,5] | Tempo de execução: 0.03 secs | 2,842,248 bytes

* fibListaInfinitaBN:  
Trata-se de uma versão de fibListaInfinita mas com aplicação para BigNumbers, utilizando a função importada do modulo BigNumber criado, somaBN.

        Caso de teste: fibListaInfinitaBN [1,0] -> [5,5] | Tempo de execução: 0.01 secs | 88,312 bytes
                       fibListaInfinitaBN [5,0] -> [1,2,5,8,6,2,6,9,0,2,5] | Tempo de execução: 0.02 secs | 539,656 bytes
                       fibListaInfinitaBN [1,0,0] ->  [3,5,4,2,2,4,8,4,8,1,7,9,2,6,1,9,1,5,0,7,5] | Tempo de execução: 0.03 secs | 1,829,792 bytes

### BigNumber.hs

* scanner:   
Função que converte uma string em BigNumber, incluindo valores negativos. Utiliza 'digitToInt' e a função auxiliar criada 'changeSign' caso haja números negativos.

        Caso de teste: scanner "10"  -> [1,0] | Tempo de execução: 0.01 secs
                       scanner "-10" -> [-1,0] | Tempo de execução: 0.00 secs

* output:  
Função que converte um BigNumber em uma string, incluindo valores negativos. Utiliza a função show para os valores do BigNumber através de concapMap.

        Caso de teste: output [1,0]  -> "10" | Tempo de execução: 0.00 secs
                       output [-1,0] -> "-10" | Tempo de execução: 0.01 secs

* somaBN:  
Função que recebe dois BigNumbers e realiza a soma dos mesmos. Foram utilizadas guardas para cobrir todos os casos possíveis de inputs, como para soma com números negativos e casos de overflow. Também usamos as funções auxiliares 'equalOrBiggerBN', 'changeSign' e 'remove0'

        Caso de teste: somaBN [1,0] [2,0] -> [3,0] | Tempo de execução: 0.00 secs
                       somaBN [-1,0] [2,0] -> [1,0] | Tempo de execução: 0.01 secs
                       somaBN [-1,0] [-2,0] -> [-3,0] | Tempo de execução: 0.01 secs
                       somaBN [1,0] [-2,0] -> [-1,0] | Tempo de execução: 0.01 secs
               
* subBN:  
Função que recebe dois BigNumbers e realiza a subtração dos mesmos. Utiliza a função somaBN passando o segundo valor com sinal trocado (usando a função auxiliar 'changeSign') para executar a subtração.

        Caso de teste: subBN [1,0] [2,0] -> [-1,0] | Tempo de execução: 0.01 secs
                       subBN [-1,0] [2,0] -> [-3,0] | Tempo de execução: 0.01 secs
                       subBN [-1,0] [-2,0] -> [1,0] | Tempo de execução: 0.00 secs
                       subBN [1,0] [-2,0] -> [3,0] | Tempo de execução: 0.01 secs

* multBN:  
Função que recebe dois BigNumbers e realiza a multiplicação dos mesmos. Foram utilizadas guardas para cobrir todos os casos possíveis de inputs e as funções auxiliares 'changeSign' e 'multBN'', que recebe os dois valores e um acumulador. As guardas existentes consideram: caso os dois números sejam positivos (passa para multBN' os dois valores e [0] como acumulador), caso ambos sejam negativos  (passa para multBN' os dois valores com sinais trocados e [0] como acumulador) ou caso um deles seja negativo e o outro positivo (passa para multBN' os dois valores, sendo o valor negativo sendo passado com o sinal trocado e [0] como acumulador).

        Caso de teste: multBN [1,0] [2,0] -> [2,0,0] | Tempo de execução: 0.01 secs
                       multBN [-1,0] [2,0] -> [-2,0,0] | Tempo de execução: 0.01 secs
                       multBN [-1,0] [-2,0] -> [2,0,0] | Tempo de execução: 0.01 secs
                       multBN [1,0] [-2,0] -> [-2,0,0] | Tempo de execução: 0.01 secs

* divBN:  
Função que recebe dois BigNumbers e realiza a divisão dos mesmos. Utilizamos guardas para cobrir todos os casos possíveis de inputs: caso o divisor seja [0], o função retorna um error avisando que não é possível realizar divisões por 0. Ela retorna um tuplo com resultado da operação e o resto. Foram usadas as funções auxiliares 'equalOrBiggerBN' e 'divBN''.

        Caso de teste: divBN [2,0] [4] -> ([5],[0])  | Tempo de execução: 0.01 secs
                       divBN [1,0] [3] -> ([3], [1]) | Tempo de execução: 0.01 secs

* safeDivBN:  
Função que recebe dois dois BigNumbers e realiza a divisão dos mesmos. É semelhante a divBN, com o diferencial que utiliza o monad Maybe, de modo que não retorna um erro caso o input seja uma divisão por [0]. 

        Caso de teste: safeDivBN [2,0] [0] -> Nothing | Tempo de execução: 0.01 secs
                       safeDivBN [2,0] [4] -> ([5],[0]) | Tempo de execução: 0.01 secs

#### Funções Auxiliares:

* changeSign:  
Função que recebe um BigNumber e inverte seu sinal.

        Caso de teste: changeSign [2,0] -> [-2,0] | Tempo de execução: 0.00 secs
                       changeSign [-2,0] -> [2,0] | Tempo de execução: 0.00 secs

* remove0:  
FUnção que recebe um BigNumber e remove os zeros iniciais do mesmo.

        Caso de teste: remove0 [0,0,1] -> [1] | Tempo de execução: 0.00 secs
                      
* equalOrBiggerBN:  
Função que recebe dois BigNumbers e retorna um Bool, de acordo com as seguintes guardas:  
    * n1 positivo e n2 negativo -> True
    * n1 negativo e n2 positivo -> False
    * Ambos positivos, e n1 maior que n2 -> True
    * Ambos positivos, e n2 maior que n1 -> False
    * Ambos negativos, e n1 maior que n2 -> False
    * Ambos negativos, e n1 menor que n2 -> True    
  <br>
* bnToInteger:
Transforma um BigNumber em um Inteiro.

        Caso de teste: bnToInteger [3,0] -> 30  | Tempo de execução: 0.00 secs
                       bnToInteger [1,0,0] -> 100 | Tempo de execução: 0.00 secs


## Questão 4
