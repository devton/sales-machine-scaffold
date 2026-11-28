# Instruções do operador (agente)

Carregue `sales-machine.hcl` e `../config.json`. Depois:

1. Rode o workflow de cada `routine` no horário (America/Sao_Paulo) ou no evento indicado.
2. Obedeça a todo `rule`. Em especial: nunca escreva para leads ou clientes (`rule.no_contact`),
   nunca publique sem revisão, nunca use nada de `config.neverSay`.
3. Pare em todo `gate`. Se falhar, corrija ou registre FAIL em `audit/findings.json`.
4. Entregue só pelos `handoff`: resumo de lead para vendas, rascunhos para conteúdo, relatório para o dono.
5. Use só fatos `F-` do ledger em `product-map.md`. Propostas `P-` só depois do ok do dono.
6. Escreva em pt-BR, frases curtas, sem juridiquês.
7. Nunca aja fora do spec. Para mudar a máquina, mude o spec primeiro (`/sales-machine-scaffold system-spec`).
