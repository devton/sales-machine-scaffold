# Máquina de vendas: Nortecontábil

Workflow: `machine`. Data: 2026-11-28. Entradas: `positioning.md`, `product-map.md`, `config.json`.

**Como este produto muda o template.** É um serviço de assinatura: o "produto" que a pessoa
experimenta antes de pagar é a **proposta com diagnóstico** (qual enquadramento, o que muda, quanto
custa o plano). O estágio 03 é receber e entender a proposta; o 05 é assinar o contrato e pagar a
primeira mensalidade. A forma de entrada (formulário + WhatsApp, cadastro direto, ou os dois) está
em aberto (G-09); os eventos abaixo valem para as duas, com o nome do canal trocável.

## Estágios

### 01 Alimentar (Feed)
- **Entrada:** `conteudo_publicado` (artigo, post, vídeo curto, página de segmento).
- **Saída:** `visita_site` vinda desse conteúdo (UTM).
- **Cada persona acha o seu caso:** prestador PJ -> "Abrir CNPJ como prestador: o que decidir antes";
  MEI -> "Passei do limite do MEI: e agora?"; troca -> "Como trocar de contador sem perder prazo".
- **Valor:** Reduced anxiety, Time savings, Expertise.
- **Métrica:** visitas por peça publicada.
- **Dono:** conteúdo.

### 02 Atrair (Attract)
- **Entrada:** `visita_site`.
- **Saída:** `pedido_proposta` (formulário enviado ou cadastro iniciado, conforme G-09).
- **O que capturamos:** o que precisa (abrir / trocar / sair do MEI / outro), faixa de faturamento,
  atividade, cidade, CNPJ (só troca), **como conheceu** (alimenta o loop de indicações) e
  **segmento** (alimenta o loop de segmentos).
- **Confirmação:** tela de obrigado + mensagem automática no canal escolhido dizendo quando o
  contador responde `[a confirmar: N horas úteis, P-010]`.
- **Valor:** Time savings, Reduced effort, Reduced anxiety.
- **Métrica:** pedidos por 100 visitas.
- **Dono:** conteúdo (página) + vendas (resposta).

### 03 Ativar (Activate)
- **Entrada:** `pedido_proposta`.
- **Saída:** `proposta_entendida`: a pessoa respondeu à proposta (pergunta, aceite ou ajuste).
- **Experimentar sem risco:** a proposta já traz o diagnóstico (enquadramento sugerido e por quê,
  pendências que vimos, o que muda no imposto em palavras) antes de qualquer pagamento.
- **O objetivo escolhe o caminho:** abrir -> checklist de documentos de abertura; trocar ->
  checklist do que pedir ao contador atual; MEI -> "precisa sair agora?" + data limite.
- **Valor:** Reduced effort, Simplification, Decreased hassles, Reduced anxiety.
- **Métrica:** propostas respondidas por 100 pedidos; tempo até a primeira resposta do contador.
- **Dono:** vendas.

### 04 Qualificar (Qualify)

Duas faixas, separadas aqui. Internas; a página nunca mostra.

**Por conta própria** (prestador PJ, MEI-limite):
1. Pedido com faixa de faturamento e atividade.
2. Proposta com plano recomendado pela faixa.
3. Escolhe o plano e envia os documentos do checklist.
- **Sinal `pronto_autoatendimento`:** `[a confirmar]` proposto: escolheu o plano **e** enviou os
  documentos (ou, sem sistema, mandou os documentos no WhatsApp).

**Com o contador** (troca de contador, empresa com sócio/funcionário, faixa mais alta):
1. Pedido com CNPJ.
2. Conferência rápida de pendências pelo CNPJ (certidões, situação do Simples) `[a confirmar: o que
   o time consegue ver só com o CNPJ]`.
3. Conversa de 15 minutos (ligação ou áudio) com o contador.
- **Sinal `pronto_assistido`:** pediu troca informando o CNPJ **ou** tem sócio/funcionário **ou**
  está na faixa mais alta.

Temas regulados só onde precisam: prazo de abertura (R-04) no checklist de abertura; enquadramento
(R-02) na proposta.

- **Valor (por conta própria):** Time savings, Configurability, Simplification.
- **Valor (com o contador):** Expertise, Responsiveness, Risk reduction, Transparency.
- **Métrica:** sinal por faixa por 100 propostas; dias da proposta ao sinal.
- **Dono:** vendas.

### 05 Converter (Convert)
- **Entrada:** `pronto_autoatendimento` ou `pronto_assistido`.
- **Saída:** `cliente`: contrato assinado **e** primeira mensalidade paga.
- **O time fala com quem já entendeu:** o contador já tem objetivo, faixa, atividade e pendências.
- **Depois do sim (onboarding):** abertura -> acompanhar até o CNPJ sair; troca -> assumir na
  próxima competência; MEI -> data do desenquadramento combinada.
- **Valor:** Risk reduction, Transparency, Commitment, Reduced anxiety.
- **Métrica:** clientes por 100 sinais; dias do pedido ao contrato.
- **Dono:** vendas -> sucesso do cliente (contador de referência).

### 06 Retroalimentar (Feed back)
- **Entrada:** `cliente` com 60 dias (duas competências fechadas sem atraso).
- **Saída:** `indicacao_feita`, `depoimento_dado` ou `segmento_informado`.
- Os três loops estão em `loops.md`: **segmentos**, **indicações**, **conteúdo**.
- **Valor:** Network expansion, Connection, Reputational assurance.
- **Métrica:** novos pedidos por coorte mensal de clientes, por loop.
- **Dono:** sucesso do cliente + conteúdo.

## Retenção (expandir / manter)
- Lembrete de vencimento de cada guia; relatório mensal simples (P-007); revisão de enquadramento
  quando a faixa de faturamento muda (vira upgrade de plano, não surpresa).
- **Valor:** Organization, Information, Scalability.
- **Métrica:** cancelamentos por 100 clientes/mês; mudanças de faixa.

## Motor (só especificação)

Uma checagem diária por pedido/cliente que:
1. registra cada marco com a hora real (`pedido_proposta`, `proposta_enviada`, `proposta_entendida`,
   sinal, `contrato_assinado`, `primeiro_pagamento`);
2. manda a mensagem certa por estágio (lembrete se a proposta não foi respondida em 2 dias úteis;
   checklist de documentos se o plano foi escolhido e faltam documentos);
3. mede conversão e tempo entre estágios.

Sem sistema hoje (G-05): a primeira versão pode ser uma planilha com uma linha por pedido e as
colunas dos marcos acima; o agente lê e escreve só o relatório.

## Métricas

| Métrica | Fórmula | Por |
|---|---|---|
| visita_para_pedido | pedidos / visitas | 100 visitas |
| pedido_para_proposta_entendida | propostas respondidas / pedidos | 100 pedidos |
| tempo_primeira_resposta | mediana (proposta_enviada - pedido_proposta) | horas úteis |
| proposta_para_sinal | sinais / propostas | 100 propostas, por faixa |
| sinal_para_cliente | clientes / sinais | 100 sinais |
| pedido_para_cliente_dias | mediana (contrato - pedido) | dias |
| pedidos_por_coorte | novos pedidos atribuídos a clientes da coorte / clientes da coorte | por loop, mensal |
| cancelamento | cancelados / ativos | 100 clientes/mês |

## Diagrama (nós e arestas)

Nós: `01 Alimentar`, `02 Atrair`, `03 Ativar`, `04a Por conta própria`, `04b Com o contador`,
`05 Converter`, `06 Retroalimentar`.

Arestas: 01->02, 02->03, 03->04a, 03->04b, 04a->05, 04b->05, 05->06, 06->01 (loops).
