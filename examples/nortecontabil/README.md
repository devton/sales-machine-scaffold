# Nortecontábil: sales machine + landing de vendas

O skill sales-machine-scaffold rodado para a **Nortecontábil**, contabilidade online para quem
presta serviço como PJ. Data: 2026-11-28. Idioma: pt-BR.

**Comece por aqui:**
- `site/index.html`: a landing de vendas pronta (abre offline, um arquivo só).
- `sales-machine/report/sales-machine-report.html`: o relatório da máquina inteira.

Itens em amarelo na landing e `[a confirmar]` nos arquivos esperam dado do dono. A lista completa
está no fim do relatório.

## Fontes (o que a rodada leu)

| Caminho | O que é |
|---|---|
| `sources/owner-answers.md` | Pedido e respostas do dono |
| `sources/reference-notes.md` | Estrutura de oferta e funil de uma contabilidade online de referência. **Só inspiração**: nenhum texto, marca, número ou imagem foi reaproveitado |

## Comandos rodados e o que escreveram

| Comando | Saída |
|---|---|
| `setup` | `sales-machine/config.json` |
| `explore` | `sales-machine/product-map.md`: serviços, mapa de valor, livro de fatos (F-/P-/R-), lacunas G-01 a G-09 |
| `position` | `sales-machine/positioning.md` |
| `machine` | `sales-machine/machine.md` |
| `loops` | `sales-machine/loops.md` (segmentos, indicações, conteúdo) |
| `landing` | `sales-machine/landing/`: home, 3 personas, 1 segmento |
| `value-audit` | `sales-machine/audit/findings.json` |
| `system-spec` | `sales-machine/system/` |
| `report` | `sales-machine/report/sales-machine-report.html` |
| (hand-off) | `site/index.html`, construída a partir de `landing/home.md` a pedido do dono |
| `article-ideas`, `manual` | **ainda não rodados** (próxima rodada) |

## Como este caso muda o template

- **É um serviço, não um software.** Não há código, docs ou flags: o livro de fatos separa o que o
  dono confirmou (`F-`) do que é proposta desta rodada (`P-`, vai ao ar só depois do ok).
- **O "teste sem risco" é a proposta.** A pessoa recebe o enquadramento explicado antes de pagar.
- **Integrações viram segmentos.** O loop que compõe numa contabilidade é o de atividades atendidas
  (devs, designers, consultores...), não o de provedores.

## Trocar a forma de entrada do cliente

Ainda em aberto (G-09). Na landing, mude só o objeto `ENTRADA` no fim de `site/index.html`:

```js
var ENTRADA = {
  modo: "formulario",   // "formulario" | "cadastro" | "ambos"
  whatsapp: "",         // ex.: "5511999999999"
  formEndpoint: "",     // URL que recebe o pedido em JSON
  cadastroUrl: "",      // URL do cadastro no sistema
  respostaEm: "N horas úteis"
};
```

Sem `whatsapp` e sem `formEndpoint`, o envio só mostra a confirmação e registra o pedido no
console (modo de revisão).
