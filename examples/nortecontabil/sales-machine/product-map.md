# Mapa do produto: Nortecontábil

Workflow: `explore`. Data: 2026-11-28. Fontes: `config.sources` (`../sources/owner-answers.md`,
`../sources/reference-notes.md`).

**Como este produto muda o template.** A Nortecontábil é um **serviço** (contabilidade online por
assinatura), não um software com código, docs e flags. Ainda não há site, sistema, tabela de preços
nem registro publicados nas fontes. Por isso:

- Quase tudo abaixo é **proposto** (status `a confirmar`): é a oferta que o setor usa, desenhada
  para a Nortecontábil, esperando o ok do dono.
- O site de referência serve só de inspiração de **estrutura**; ele nunca é fonte de fato sobre a
  Nortecontábil, e nenhum texto, preço ou número dele é reaproveitado.
- O "UI real" (hard rule 10) aqui é o formulário, a mensagem de WhatsApp e a proposta. Os nomes
  abaixo são os que a landing desta rodada usa; mudam se o dono mudar.

## 1. Superfícies

| Superfície | O que a pessoa vê ou faz | Status | Fonte |
|---|---|---|---|
| Landing de vendas | `site/index.html` (construída nesta rodada a partir de `landing/home.md`) | proposto | esta rodada |
| Formulário "Receber minha proposta" | nome, WhatsApp, e-mail, o que precisa, faixa de faturamento, atividade, CNPJ (só na troca) | proposto; entrada em aberto (F-007, G-09) | `reference-notes.md` (fluxo típico) |
| Simulador de imposto | faixa de faturamento + tipo de atividade -> qual enquadramento olhar e por quê | proposto, **sem números** até o contador validar as alíquotas | `reference-notes.md` |
| WhatsApp | mensagem pré-preenchida por contexto (abrir, trocar, MEI, dúvida) | proposto `[a confirmar: número]` | `reference-notes.md` |
| Proposta | plano recomendado pela faixa, o que inclui, prazos estimados | proposto | — |
| Área do cliente / sistema | `[a confirmar: existe? qual?]` | desconhecido | — |

## 2. Serviços

| # | Serviço (como a landing chama) | Trabalho que resolve | Persona | Status | Evidência |
|---|---|---|---|---|---|
| 1 | Abrir minha empresa | Abrir CNPJ com o enquadramento certo (tipo de empresa, atividade, regime) | prestador-pj | confirmado (F-004) | `owner-answers.md` resposta 1 |
| 2 | Trocar de contador | Migrar a contabilidade sem perder prazo, guia ou documento | troca-contador | confirmado (F-004) | `owner-answers.md` resposta 1 |
| 3 | Sair do MEI | Desenquadrar o MEI que passou (ou vai passar) do limite | mei-limite | confirmado (F-004) | `owner-answers.md` resposta 1 |
| 4 | Contabilidade mensal | Impostos calculados e guias enviadas, folha de pró-labore, obrigações em dia | todas | confirmado (F-004) | `owner-answers.md` resposta 1 |
| 5 | Notas fiscais | Emissão ou orientação de emissão de NFS-e | prestador-pj | `[a confirmar: quem emite]` | — |
| 6 | Extrato organizado e relatórios | Conciliação da conta PJ e relatório mensal (DRE simples) | troca-contador | `[a confirmar]` | — |
| 7 | Serviços avulsos | Alterações contratuais, certidões, alvarás | todas | `[a confirmar: lista e valores]` | — |
| 8 | Planos por faixa de faturamento | Mensalidade que acompanha o tamanho da empresa | todas | estrutura confirmada (F-006), **valores `[a confirmar]`** | `reference-notes.md` |

## 3. Integrações (canais e provedores)

| Provedor | O que a pessoa faz com ele | Status |
|---|---|---|
| WhatsApp | tira dúvida, recebe guia e lembrete de vencimento | `[a confirmar]` |
| Emissor de NFS-e da prefeitura | nota emitida pela Nortecontábil ou pelo cliente | `[a confirmar]` |
| Contas PJ (bancos digitais) | extrato para conciliação (OFX, Open Finance ou envio manual) | `[a confirmar]` |

## 4. Mapa de valor (Elements of Value)

| Elemento (nível) | O que na oferta entrega | Prova |
|---|---|---|
| Reduced anxiety (4) | "Seu contador" com nome e canal direto; guias chegam antes do vencimento | P-004, P-005 |
| Time savings (3) | Guias prontas no WhatsApp; nada de calcular imposto | P-005 |
| Decreased hassles (3) | Troca de contador: a gente pede os documentos ao contador anterior | P-002 |
| Expertise (3) | Enquadramento escolhido por contador registrado no CRC | P-001, R-01 |
| Transparency (3) | Plano por faixa de faturamento; o que está incluso escrito na proposta | P-008 |
| Responsiveness (3) | Resposta no WhatsApp em horário comercial `[a confirmar: prazo]` | P-004 |
| Risk reduction (3) | Conferência de pendências (guias, certidões) na entrada | P-002 |
| Simplification (3) | Uma mensalidade, um canal, um contador | P-008, P-004 |
| Flexibility (3) | Sem fidelidade `[a confirmar]` | P-009 |

Não usar: Acceptable price (nunca vender preço), Regulatory compliance (é piso, não argumento),
Stability (sem histórico), Social responsibility (sem fonte).

## 5. Primeira experiência (first run)

Proposta, a confirmar com o dono:

1. A pessoa escolhe o que precisa (abrir / trocar / sair do MEI / outro) e a faixa de faturamento.
2. O formulário pede só nome, WhatsApp e e-mail (e o CNPJ na troca).
3. Em até `[a confirmar]` horas úteis, um contador responde no WhatsApp com a proposta: plano
   recomendado pela faixa, o que está incluso, próximos passos e prazo estimado.
4. **Primeiro momento de valor:** a pessoa entende em uma mensagem qual enquadramento faz sentido
   para ela e por quê, antes de pagar qualquer coisa.

## 6. Livro de fatos (fact ledger)

`F-` = fato confirmado pelo dono. `P-` = proposta desta rodada, só vai para o ar depois do ok do
dono. `R-` = regra de tema regulado (config).

| Id | Afirmação | Fonte | Status |
|---|---|---|---|
| F-001 | A marca é Nortecontábil | `owner-answers.md` 2026-11-28 | confirmado |
| F-002 | O modelo é uma contabilidade online parecida com a referência, para uso próprio | `owner-answers.md` 2026-11-28 | confirmado |
| F-003 | Primeiros entregáveis: sales machine e landing de vendas | `owner-answers.md` 2026-11-28 | confirmado |
| F-004 | Serviços: abrir empresa, trocar de contador, sair do MEI, contabilidade mensal | `owner-answers.md` resposta 1 | confirmado |
| F-005 | Público principal: prestador de serviço PJ (dev, consultor, profissional liberal) | `owner-answers.md` resposta 1 | confirmado |
| F-006 | Mensalidade por faixa de faturamento (valores e faixas em aberto) | `owner-answers.md` resposta 1 | confirmado (estrutura) |
| F-007 | Entrada do cliente: **em aberto** (formulário + WhatsApp não confirmado; cadastro direto é a alternativa) | `owner-answers.md` resposta 2 | a confirmar |
| F-008 | Identidade: azul-marinho + verde, ideia de "norte"/bússola (logo oficial em aberto) | `owner-answers.md` resposta 1 | confirmado (paleta) |
| P-001 | Abrimos empresa com enquadramento escolhido junto com o contador | proposta | a confirmar |
| P-002 | Na troca, pedimos os documentos ao contador anterior e conferimos pendências antes de assumir | proposta | a confirmar |
| P-003 | Ajudamos o MEI que passou do limite a sair do MEI no momento certo | proposta | a confirmar |
| P-004 | Cada empresa tem um contador de referência, com atendimento pelo WhatsApp | proposta | a confirmar |
| P-005 | Guias de imposto chegam prontas pelo WhatsApp antes do vencimento | proposta | a confirmar |
| P-006 | Notas fiscais de serviço: emissão ou orientação | proposta | a confirmar |
| P-007 | Relatório mensal simples (quanto entrou, quanto saiu, quanto foi de imposto) | proposta | a confirmar |
| P-008 | Planos mensais por faixa de faturamento; o que inclui fica escrito na proposta | proposta | a confirmar (valores e faixas) |
| P-009 | Sem fidelidade, com aviso prévio para cancelar | proposta | a confirmar |
| P-010 | Proposta enviada em até N horas úteis | proposta | a confirmar (N) |
| R-01 | Contador responsável registrado no CRC | `config.regulatedTopics` | a confirmar (nome, nº) |
| R-02 | Enquadramento correto dentro da lei; imposto depende de atividade e faturamento | `config.regulatedTopics` | regra |
| R-03 | Uso dos dados do formulário (LGPD) | `config.regulatedTopics` | a confirmar (e-mail) |
| R-04 | Prazo de abertura depende de prefeitura e Junta Comercial | `config.regulatedTopics` | regra |

## 7. Lacunas

| Id | Lacuna | Quem resolve |
|---|---|---|
| G-01 | Preços, faixas de faturamento e o que cada plano inclui | dono |
| G-02 | Razão social, CNPJ, CRC e contador responsável (obrigatórios no rodapé) | dono |
| G-03 | WhatsApp, e-mail, endereço; para onde o formulário envia (planilha, CRM, e-mail) | dono + produto |
| G-09 | Como o cliente entra: formulário + WhatsApp com pessoa, cadastro direto num sistema, ou os dois (F-007) | dono |
| G-04 | Logo oficial (paleta azul-marinho + verde confirmada, F-008) | dono |
| G-05 | Sistema/área do cliente: existe? Emite nota? Lê extrato? | dono + produto |
| G-06 | Alíquotas para o simulador: só publicar números validados por contador | contador responsável |
| G-07 | Prova social: avaliações, depoimentos reais, fotos da equipe | dono + conteúdo |
| G-08 | Segmentos que a Nortecontábil atende bem (CNAEs aceitos) | dono |
