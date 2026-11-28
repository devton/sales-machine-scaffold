# Sistema: a máquina de vendas da Nortecontábil como spec

**Este arquivo é uma especificação, não infraestrutura: nada é aplicado ou executado.**

`sales-machine.hcl` descreve a máquina **pronta e rodando**: quem faz o quê, quando, com quais
entradas, saídas e pontos de revisão humana. HCL é usado só como linguagem legível e parseável.

## Blocos

| Bloco | O que é |
|---|---|
| `spec` | cabeçalho: produto, versão, data, agente operador |
| `agent` | agentes (operator, auditor): o que leem, escrevem, nunca fazem, a quem escalam |
| `role` | pessoas: dono, conteúdo, vendas, sucesso do cliente, produto |
| `source` | entradas: pedidos, planilha de marcos, etiquetas do atendimento, workspace |
| `event` | marcos com o que cada um registra |
| `stage` | os 6 estágios com entrada, saída, valor, métrica e dono |
| `lane` / `signal` | as duas faixas internas e o sinal de compra de cada uma |
| `loop` | segmentos, indicações, conteúdo |
| `workflow` / `step` | trabalhos recorrentes com passos, saídas e gate |
| `routine` | quando cada workflow roda (horário de São Paulo ou evento) |
| `gate`, `metric`, `rule`, `handoff` | checagens, fórmulas, regras e entregas para pessoas |

## Como ler referências

`tipo.nome` (ex.: `signal.pronto_assistido`) aponta para o bloco `tipo "nome"` declarado no mesmo arquivo.

## Como validar

Qualquer parser de HCL lê o arquivo; nenhuma ferramenta é necessária para usá-lo. Nesta rodada
ele passou no self-check do skill (chaves e aspas balanceadas, só blocos permitidos, toda
referência declarada, sem `${`, URLs ou segredos) e foi parseado com `python-hcl2`.
