# Projeto PFL - T01G07

## Integrantes:
* Carolina Rosemback Guilhermino - up201800171
* Margarida Cosme - up201709304

## Definições de Funções e Casos de Teste:
### Fib.hs

* fibRec:  
Implementação recursiva da sequência de Fibonacci. Trata-se de uma implementação pouco eficiente, em que é feita uma chamada da função para cada valor. Desse modo cada termo pode ser calculado mais de uma vez.

        Caso de teste: fibRec 10 -> 55
                       fibRec 50 -> 12586269025
                       fibRec 70 -> 190392490709135
* fibLista:  
Implementação utilizando listas com base em programação dinâmica, em que há uma lista com resultados parciais, sendo mais eficiente do que a resolução recursiva do problema. Assim, só serão calculados os valores necessários para a sequência de Fibonacci.

        Caso de teste : fibLista 10 -> 55
                        fibLista 50 -> 12586269025
                        fibLista 100 -> 190392490709135

* fibListaInfinita:  
Implementação utilizando lista infinita, a qual soma os os elementos da lista com a cauda, gerando uma lista com o resultado.

        Caso de teste: fibListaInfinita 10 -> 55
                       fibListaInfinita 50 -> 12586269025
                       fibListaInfinita 100 -> 190392490709135

* fibRecBN:  
Trata-se de uma versão de fibRec mas com aplicação para BigNumbers, utilizando a função importada do modulo BigNumber criado, somaBN.

        Caso de teste: fibRecBN [1,0] -> [5,5]
                       fibRecBN [5,0] -> [1,2,5,8,6,2,6,9,0,2,5]
                       fibRecBN [7,0] -> [1,9,0,3,9,2,4,9,0,7,0,9,1,3,5]

* fibListaBN:  
Trata-se de uma versão de fibLista mas com aplicação para BigNumbers, utilizando a função importada do modulo BigNumber criado, somaBN.

        Caso de teste: fibListaBN [1,0] -> [5,5]
                       fibListaBN [5,0] -> [1,2,5,8,6,2,6,9,0,2,5]
                       fibListaBN [7,0] -> [1,9,0,3,9,2,4,9,0,7,0,9,1,3,5]

* fibListaInfinitaBN:  
Trata-se de uma versão de fibListaInfinita mas com aplicação para BigNumbers, utilizando a função importada do modulo BigNumber criado, somaBN.

        Caso de teste: fibListaInfinitaBN [1,0] -> [5,5]
                       fibListaInfinitaBN [5,0] -> [1,2,5,8,6,2,6,9,0,2,5]
                       fibListaInfinitaBN [7,0] -> [1,9,0,3,9,2,4,9,0,7,0,9,1,3,5]

### BigNumber.hs

* scanner:   
Função que converte uma string em BigNumber, incluindo valores negativos. Utiliza 'digitToInt' e a função auxiliar criada 'changeSign' caso haja números negativos.

        Caso de teste: scanner "10"  -> [1,0]
                       scanner "-10" -> [-1,0]

* output:  
Função que converte um BigNumber em uma string, incluindo valores negativos. Utiliza a função show para os valores do BigNumber através de concapMap.

        Caso de teste: output [1,0]  -> "10"
                       output [-1,0] -> "-10"

* somaBN:  
Função que recebe dois BigNumbers e realiza a soma dos mesmos. Foram utilizadas guardas para cobrir todos os casos possíveis de inputs, como para soma com números negativos e casos de overflow. Também usamos as funções auxiliares 'equalOrBiggerBN', 'changeSign' e 'remove0'

        Caso de teste: somaBN [1,0] [2,0] -> [3,0]
                       somaBN [-1,0] [2,0] -> [1,0]
                       somaBN [-1,0] [-2,0] -> [-3,0]
                       somaBN [1,0] [-2,0] -> [-1,0]
               
* subBN:  
Função que recebe dois BigNumbers e realiza a subtração dos mesmos. Utiliza a função somaBN passando o segundo valor com sinal trocado (usando a função auxiliar 'changeSign') para executar a subtração.

        Caso de teste: subBN [1,0] [2,0] -> [-1,0]
                       subBN [-1,0] [2,0] -> [-3,0]
                       subBN [-1,0] [-2,0] -> [1,0]
                       subBN [1,0] [-2,0] -> [3,0]

* multBN:  
Função que recebe dois BigNumbers e realiza a multiplicação dos mesmos. Foram utilizadas guardas para cobrir todos os casos possíveis de inputs e as funções auxiliares 'changeSign' e 'multBN'', que recebe os dois valores e um acumulador. As guardas existentes consideram: caso os dois números sejam positivos (passa para multBN' os dois valores e [0] como acumulador), caso ambos sejam negativos  (passa para multBN' os dois valores com sinais trocados e [0] como acumulador) ou caso um deles seja negativo e o outro positivo (passa para multBN' os dois valores, sendo o valor negativo sendo passado com o sinal trocado e [0] como acumulador).

        Caso de teste: multBN [1,0] [2,0] -> [2,0,0]
                       multBN [-1,0] [2,0] -> [-2,0,0]
                       multBN [-1,0] [-2,0] -> [2,0,0]
                       multBN [1,0] [-2,0] -> [-2,0,0]

* divBN:  
Função que recebe dois BigNumbers e realiza a divisão dos mesmos. Utilizamos guardas para cobrir todos os casos possíveis de inputs: caso o divisor seja [0], o função retorna um error avisando que não é possível realizar divisões por 0. Ela retorna um tuplo com resultado da operação e o resto. Foram usadas as funções auxiliares 'equalOrBiggerBN' e 'divBN''.

        Caso de teste: divBN [2,0] [4] -> ([5],[0])
                       divBN [1,0] [3] -> ([3], [1])

* safeDivBN:  
Função que recebe dois dois BigNumbers e realiza a divisão dos mesmos. É semelhante a divBN, com o diferencial que utiliza o monad Maybe, de modo que não retorna um erro caso o input seja uma divisão por [0]. 

        Caso de teste: divBN [2,0] [0] -> Nothing
                       divBN [2,0] [4] -> ([5],[0])

#### Funções Auxiliares:

* remove0:  
Remove os zeros iniciais em um BigNumber

        Caso de teste: remove0 [0,0,1] -> [1]
                      
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

        Caso de teste: bnToInteger [3,0] -> 30
                       bnToInteger [1,0,0] -> 100


## Questão 4
