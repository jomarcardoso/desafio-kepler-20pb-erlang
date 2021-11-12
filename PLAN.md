# Planejamento 1

## start

- Uma lista oxigênios
- Uma lista de hidroênios
- Uma lista de oxigênios energizados
- Uma lista de hidrogênios energizados

Função recursiva, a cada X segundos randomiza 1 ou 2, dependendo de cada um, gera oxigenio ou hidrogenio

Usando o numero, vai pra um if que guarda o Pid gerado na lista correspondente.

Moléculas são geradas com o tempo de energização passado como parâmetro junto com o pid do processo principal,
e começam um sleep assim que nascem

Após o sleep, mandam uma mensagem para o processo principal com o seu próprio Pid

Processo principal adiciona o Pid recebido na moléculas energizada e verifica se tem células suficientes
pra combinar em água

# Planejamento 2

- start: principal chama a função que produz átomos (gerador)
- gerador: gera um átomo PID e se chama novamente
- gerador: PID do átomo aguarda e manda mensagem pro start que está energizado
- start: adiciona os energizados a lista

# Planejamento 3

- Processo principal gera um processo produtor de átomos.
- Processo produtor gera átomos que podem ser oxigênio ou hidrogênio, passando para eles um tempo entre 10s e 30s como parâmetro
- Átomos dão um sleep pelo tempo passado na criação, e enviam seu PID e tipo de átomo para o processo principal
- Processo principal adiciona o PID recebido à lista respectiva ao tipo de átomo
- Processo principal verifica se há átomos suficientes para gerar uma molécula a cada mensagem recebida
