# Loops de crescimento: Nortecontábil

Workflow: `loops`. Data: 2026-11-28. Entradas: `machine.md`, `config.integrations`, `config.loops`.

O template fala em loop de **integrações** (provedores). Para uma contabilidade, o equivalente que
compõe é o de **segmentos**: cada atividade bem atendida vira página, conteúdo e indicação dentro
da mesma comunidade. Prioridade: **segmentos** e **indicações**; conteúdo é o mais lento.

## 1. Loop de segmentos (o mais forte)

1. O cliente informa a atividade/segmento no pedido (dev, designer, consultor, saúde...).
2. A gente junta o que se repete nesse segmento (enquadramento comum, dúvidas, documentos) e
   escreve uma página de segmento e um guia.
3. A página e o guia atraem outros profissionais do mesmo segmento (busca, comunidades, grupos).
4. Eles pedem proposta e informam o segmento -> volta ao 1.

- **Dono:** conteúdo (páginas) + contador de referência (o que se repete).
- **Prioridade:** pelos segmentos com mais pedidos e clientes. Ponto de partida proposto: devs e
  profissionais de tecnologia, consultores, designers `[a confirmar: segmentos que a Nortecontábil
  atende bem, G-08]`.
- **Regra:** a página nomeia o segmento, nunca o cliente.

## 2. Loop de indicações

1. Cliente com 60 dias sem atraso recebe um link de indicação pessoal.
2. Ele manda para um colega (sócio, amigo do mesmo ramo).
3. O colega pede proposta pelo link; o pedido chega marcado e o contador responde primeiro.
4. O colega vira cliente e recebe o próprio link -> volta ao 1.

- **Dono:** sucesso do cliente.
- **Benefício para quem indica:** `[a confirmar: existe? qual? não publicar valor até o dono decidir]`.
  Sem benefício, o gancho é "seu colega fala com o mesmo contador que você".

## 3. Loop de conteúdo

1. Dúvidas reais que chegam no atendimento (anonimizadas).
2. Viram artigos curtos, posts e respostas de FAQ.
3. Trazem visitas e pedidos (01 -> 02).
4. Novos clientes trazem novas dúvidas -> volta ao 1.

- **Dono:** conteúdo.

## Métrica

`pedidos_por_coorte`: novos pedidos por coorte mensal de clientes, por loop.

## Instrumentação necessária

| O que guardar | Onde | Loop | Existe? | Dono |
|---|---|---|---|---|
| "Como conheceu" + UTM no pedido | formulário / cadastro | conteúdo, indicações | não (G-03, G-09) | produto |
| Segmento/atividade no pedido | formulário / cadastro | segmentos | não | produto |
| Código de indicação no link | formulário / cadastro | indicações | não | produto |
| Data de cada marco (pedido, proposta, contrato, pagamento) | planilha ou CRM | todos | não (G-05) | vendas |
| Dúvidas frequentes etiquetadas por tema | WhatsApp / atendimento | conteúdo | não | sucesso do cliente |

## Regra para todo conteúdo

Toda peça dá à pessoa um motivo para alimentar um loop: dizer o segmento, indicar um colega ou
começar pelo checklist do seu caso, não só "pedir proposta".
