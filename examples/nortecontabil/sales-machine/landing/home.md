# Spec de landing: Home de vendas (nortecontabil `[a confirmar: domínio]`)

Workflow: `landing`. Data: 2026-11-28. Entradas: `positioning.md`, `product-map.md`,
`config.json`, `../sources/reference-notes.md` (só estrutura).

Construída como página real em `../../site/index.html` (hand-off de conteúdo -> produto, feito
nesta rodada a pedido do dono). Tudo que é `[a confirmar]` aparece na página como marcação visível.

## 1. Páginas atuais

Não há site da Nortecontábil nas fontes. A estrutura abaixo segue a ordem que o setor já usa
(`reference-notes.md`), com texto, identidade e oferta próprios.

## 2. Spec da home

| # | Seção | Copy | Fato | Elemento de valor |
|---|---|---|---|---|
| 1 | Cabeçalho | Logo Nortecontábil · Abrir empresa · Trocar de contador · Sair do MEI · Planos · Dúvidas · botão **Receber minha proposta** | F-001, F-004 | — |
| 2 | Eyebrow | Contabilidade online para quem presta serviço como PJ | F-005 | (categoria) |
| 3 | Hero | Contabilidade online com um contador que te responde. | positioning A | Reduced anxiety (4) |
| 4 | Sub-linha | A gente cuida do imposto, das guias e dos prazos da sua empresa. Você fala direto com o seu contador e volta a cuidar do seu trabalho. | P-004, P-005 | Time savings (3) |
| 5 | CTAs | **Receber minha proposta** (primário) · Falar no WhatsApp (secundário) | config.access | Reduced effort (3) |
| 6 | Chips | Contador de verdade · Guias no WhatsApp · Enquadramento certo · Plano pela sua faixa | positioning §4 | Expertise, Time savings, Transparency |
| 7 | Visual do produto | Mock de conversa de WhatsApp: contador avisa que a guia do mês está pronta, com valor e vencimento **de exemplo** e o rótulo "exemplo". | P-005 | Reduced anxiety (4) |
| 8 | O que você precisa? (3 cards) | **Abrir minha empresa**: o enquadramento certo desde o primeiro dia. · **Trocar de contador**: a gente fala com o anterior e confere as pendências. · **Sair do MEI**: na hora certa, antes de virar multa. Cada card abre o formulário com o objetivo já marcado. | F-004, P-001, P-002, P-003 | Decreased hassles (3), Risk reduction (3) |
| 9 | Como funciona (4 passos) | 1. Conte o que precisa (2 minutos). 2. Seu contador responde com a proposta e o enquadramento explicado. 3. Você escolhe o plano e manda os documentos. 4. A gente assume: guias, notas e prazos. | P-001, P-010, R-04 | Simplification (3) |
| 10 | Todo mês, sem você correr atrás | Imposto calculado e guia no WhatsApp · Pró-labore e obrigações em dia · Notas fiscais `[a confirmar P-006]` · Relatório simples do mês · Revisão do enquadramento quando o faturamento muda | P-005, P-006, P-007 | Organization (3), Information (3) |
| 11 | Para quem é (segmentos) | Devs e tecnologia · Designers e criativos · Consultores · Profissionais liberais · Outros prestadores de serviço. Rodapé: "Sua atividade não está aqui? Pergunte para o seu contador." | F-005, G-08 | Reach (3) |
| 12 | Planos | Seletor "Quanto sua empresa fatura por mês?" com 3 faixas `[a confirmar G-01]`; destaca o plano recomendado. Cards **Essencial / Crescer / Completo** `[a confirmar nomes]` com "R$ — /mês `[a confirmar]`" e o que muda entre eles; lista "Em todos os planos". Linha: "Valores e o que está incluso ficam escritos na sua proposta." | F-006, P-008, P-009 | Transparency (3), Flexibility (3) |
| 13 | Quem cuida de você | Espaço para foto, nome e CRC do contador responsável `[a confirmar R-01, G-07]`. Copy: "Sua empresa tem um contador de referência. Ele conhece o seu caso e é ele quem responde." | P-004, R-01 | Expertise (3), Reduced anxiety (4) |
| 14 | Depoimentos | **Slot vazio** com aviso interno: só publicar depoimentos reais com autorização (G-07). | hard rule 4 | Reputational assurance (4) |
| 15 | Dúvidas | 6 perguntas (abaixo) + "Ainda com dúvida? Falar no WhatsApp". | — | Information (3) |
| 16 | Formulário | Título "Receber minha proposta". Campos: o que precisa, nome, WhatsApp, e-mail, faixa de faturamento, atividade, CNPJ (só troca), como conheceu. Frase LGPD (R-03). **Modo de entrada trocável (G-09).** | F-007 (aberto), R-03 | Reduced effort (3) |
| 17 | CTA final | Seu norte para abrir, organizar e crescer sua empresa. **Receber minha proposta** · Falar no WhatsApp | positioning B | Vision (5) |
| 18 | Rodapé | Nortecontábil · razão social `[a confirmar]` · CNPJ `[a confirmar]` · CRC `[a confirmar]` · endereço `[a confirmar]` · contato `[a confirmar]` · Política de privacidade | R-01, G-02 | Risk reduction (3) |

Sem preço publicado, sem rótulo de faixa interna, um CTA primário.

## 3. FAQ

| Pergunta | Resposta | Fato |
|---|---|---|
| Quanto tempo leva para abrir minha empresa? | Depende da prefeitura e da Junta Comercial da sua cidade. A estimativa vem na sua proposta. | R-04 |
| Como funciona a troca de contador? | Você assina com a gente, nós pedimos os documentos ao contador atual, conferimos pendências e assumimos a partir da competência combinada. | P-002 |
| Sou MEI e passei do limite. E agora? | Conte quanto faturou no ano. O contador diz se precisa sair agora e qual enquadramento faz sentido. | P-003 |
| Vou pagar menos imposto? | Você vai pagar o imposto certo, no enquadramento certo para a sua atividade e faturamento, dentro da lei. | R-02 |
| Tem fidelidade? | `[a confirmar P-009]` | P-009 |
| Como falo com o meu contador? | Pelo WhatsApp, em horário comercial `[a confirmar horário e prazo de resposta]`. | P-004 |

## 4. Escolha: modo de entrada (G-09, decisão do dono)

- **A.** Formulário curto -> contador responde no WhatsApp com a proposta.
- **B.** Cadastro direto num sistema (`[a confirmar: qual]`), plano escolhido na tela seguinte.
- **C.** Os dois: formulário para quem quer conversar, cadastro para quem quer resolver sozinho.

**Recomendação: A agora, C quando houver sistema.** A funciona sem nenhum software novo e combina
com o diferencial "contador que responde"; o formulário já pede tudo que B precisaria. A página
troca de modo mudando só o objeto `ENTRADA` em `site/index.html`.
