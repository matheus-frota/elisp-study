;; 1.1 Lisp Lists
;; * Uma lista lisp é separada por 'espaço em branco'
;; * Os valores dentro de uma lista em lisp é chamado de 'átomo'.
;;   Exemplo: Números(12, 37, 1729, ...), Símbolos(+, -, foo, ...),
;;            String("oi meus amigos.", "hello world!")

;; Exemplos:
'(rose violet daisy buttercup)
(+ 2 2)
'(this list has (a list inside of it))
'(this list includes "text between quotation marks.")

;; 1.2 Executar um programa
;; * Para executar um programa basta executar: C-x C-e
;; * Em lisp qualquer lista é um programa esperando ser executado.
;; * O apostrofe, ', que foi colocado em algumas listas  é chamado de
;;   quote ou "citação", quando ele precede uma lista ele diz ao lisp
;;   para toma-la como uma escrita. Caso não tenha e alguma lista tiver
;;   algum símbolo no início(comando especial) como (+ 2 2) ele vai
;;   executar essa instrução para o resto da lista. E isso é uma função.

;; Exemplos:
(+ 2 2)
'(this is a quoted list)


;; 1.3 Generate an Error Message
;; * A leitura do buffer de erro do emacs é lido de baixo para cima.
;; * Ao executar o comando C-x C-e, ele chama de forma iterativa o
;;   comando 'eval-last-sexp', ou seja, ele serve para avaliar a última
;;   expressão simbólica que é a expressão imediatamente antes do cursor.
;; * QUando executamos uma expressão simbólica e ela é uma função, é
;;   necessário que o primeiro átomo seja um simbulo que execute alguma
;;   coisa, como por exemplo o + ou uma função personalizada.

;; Exemplo
(foo is a not quoted list)


;; 1.4 Symbol Names and Function Definitions
;; * Em Lisp um conjunto de instruções pode ser anexado a vários nomes.
;;   Exemplo: simbolo + ou plus para se referir a soma de valores.
;; * Um símbolo pode ter apenas uma definição de função associada a ele.
;; * Em Emacs lisp é comum nomear os simbolos de maneira que identifique
;;   a parte do Emacs a qual a função pertence. Exemplo: Funções que
;;   lidam com leitura de e-mail começam com 'rmail-' ou lidam com
;;   Textinfo começam com 'textinfo-'


;; 1.5 The Lisp Interpreter
;; * Complications:
;;     first: Além das listas o interpretador lisp pode avaliar um
;;            símbolo que não está entre aspas e não possui parênteses
;;            ao redor. O interpretador determinará isso como uma
;;            variável.
;;     second: A utilização de algumas funções incomuns que não
;;            funcionam da maneira usual. As funções especiais.
;;     third: Os macros são diferentes das funções comuns e também
;;            das funções especiais.
;;     fourth: Se o interpretador lisp não estiver olhando uma forma
;;            especial, e se for parte de uma lista, o interpretador
;;            primeiro verifica se a lista tem uma lista dentro dela.
;;            Se houver uma lista interna, ele vai executar ela primeiro
;;            e esse ciclo se repete até executar tudo. [REF: Exemplo].
;;            Caso contrário, o interpretador trabalha da esquerda para
;;            direita, de uma expressão para outra.
;; * Byte Compiling: O interpretador de lisp é capaz de interpretar dois
;;                   tipos de código:  humanly readable code e o
;;                   byte compiled code. O código compilado por bytes é
;;                   mais rápido que o código legivel a humanos, e a
;;                   extensão .elc e .el, respectivamente é usada por
;;                   eles. Posso compilar o código por bytes utilizando
;;                   o 'byte-compile-file'.

;; Exemplo:
;; Etapas da execução:
;;  Nessa operação primeiro é feito RESULTADO: (- 3 1) -> 2
;;  e depois (+ 1 2 3 RESULTADO) -> 8.
(+
 1 2 3
   (- 3 1)
   )


;; 1.6 Evaluation
;; * Ao avaliar uma expressão simbólica o interpretador Lisp geralmente
;;   retorna um valor e/ou executa um efeito colateral e se caso
;;   aconteça algo ele produz um erro.


;; 1.7 Variables
;; * Uma variável em Lisp é um símbolo que tem algum valor. Podendo ser
;;   um símbolo, número, lista ou string.
;; * No exemplo (fill-column) ao executar essa lista vamos receber um
;;   erro dizendo que essa função está vazia.
;; * No exemplo (+ 2 2) ao executar a função com o cursor após o símbolo
;;   vamos receber uma mensagem de erro para a função sem seus valores
;;   de variável.

;; Exemplo:
fill-column
(fill-column)
(+ 2 2)


;; 1.8 Arguments
;; * (funcao argumento1 argumento2 ...)

;; Exemplos de funções
;; 1.8.1 Testando tipos de dados diferentes nas funções
(+ 2 2) ;; resultado: 4
(concat "abc" "def") ;; resultado: abcdef
(substring "Testando a função!" 6 8) ;; resultado: do
;; 1.8.2 Argumento como variável ou lista.
(+ 2 fill-column) ;; resultado: 74
(concat "The " (number-to-string (+ 2 fill-column)) " red foxes.") ;; The 74 red foxes.
;; 1.8.3 Número variável de argumentos
;; Funções sem argumentos
(+) ;; resultado: 0
(*) ;; resultado: 1
;; Funções com 1 argumento
(+ 3) ;; resultado: 3
(* 3) ;; resultado: 3
;; Funções com 3 argumentos
(+ 3 4 5) ;; resultado: 12
(* 3 4 5) ;; resultado: 60
;; 1.8.4 Argumento com tipo errado
(+ 1 'hello) ;; Retorna erro de execução acusando que tipo a função recebe.
;; 1.8.5 Função message
(message "Hello world!")
(message "The name of this buffer is: %s" (buffer-name))
(message "The value of fill-column is: %d" fill-column)
(message "There are %d %s in the office!"
         (- fill-column 10) "pink elephants")
(message "He saw %d %s %f"
         (- fill-column 32)
         (concat "red "
                 (substring
                  "The quick brown foxes jumped." 16 21)
                 " leaping.")
         10.2)

;; 1.9 Setting the Value of a Variable
;; * Para se passar valor a uma variável em Lisp nós utilizamos as funções
;;   'set' e 'setq'.
;; * Usando 'set':

;; Exemplo:
;; 1.9.1 Usando o 'set'
(set 'flowers '(rose violet daisy buttercup))
flowers
'flowers
