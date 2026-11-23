# Manual de marca e vendas: workflow-blueprint

Workflow: `manual`. Data: 2026-11-23. Idioma do time: pt-BR (`config.language.team`).
Os textos públicos continuam em inglês (`config.language.content`); as frases entre aspas abaixo
são as que vão para o público.

## Parte 1. Posicionamento

### Quem somos

workflow-blueprint é uma meta-skill para agentes de código: um conjunto de arquivos markdown que o
agente instala e segue para escrever as skills do próprio projeto do usuário. Em vez de um
`AGENTS.md` gigante, o agente passa a ter um caderno: uma página curta por parte do código, um
índice na frente, e uma regra nova a cada revisão.

A promessa: **"We teach your agent to keep a notebook of your project, so you stop explaining the
same rules every session."**

### Para quem falamos primeiro

Para a pessoa desenvolvedora que trabalha com um agente de código todo dia, num repositório com
vários módulos. Ela perde tempo reexplicando as mesmas regras a cada sessão, ou mantém um
`AGENTS.md` enorme que custa tokens em toda tarefa e esconde a regra que importa.

Depois dela, e nessa ordem: tech leads de times que usam agentes, e engenheiros de plataforma e
segurança.

### As personas, de dois jeitos

**Por conta própria**
- *Dev com agente de código:* quer parar de reexplicar o projeto. Primeiro valor: a segunda
  tarefa já abre só o contrato certo, sem pedir contexto.
- *Engenharia de plataforma e segurança:* quer que mudanças de infra e checagens de segurança
  sigam sempre os mesmos passos, com rollback. Primeiro valor: um contrato de Trivy ou Kubernetes
  copiado roda o gate no repositório dela.

**Com o mantenedor**
- *Tech lead:* quer que o agente de cada pessoa do time siga as mesmas regras, revisadas como
  código. Primeiro valor: o primeiro pull request em que uma lição do agente é revisada por uma pessoa.

Essa divisão é interna. Nenhuma página fala em "self-serve" ou "assistido".

### Princípios

1. Vendemos a facilidade da **segunda** execução, não da primeira.
2. Mostramos os arquivos de verdade antes de prometer qualquer coisa.
3. Falamos do trabalho da pessoa, não do nome da funcionalidade.
4. Frases curtas, sem hype, sem números que não podemos mostrar.
5. Todo convite é o mesmo: **"Install the blueprint"** com o comando
   `npx skills add devton/agentic-workflow-blueprint`.

### Fatos de destaque

| Rótulo público | O que quer dizer para quem decide |
|---|---|
| One page per task | O agente lê só o contrato que precisa |
| One setup prompt | Digita `blueprint this project.` e responde cinco perguntas |
| Learns from review | O que a revisão pegou vira regra no contrato |
| Lessons you can read | Markdown no repositório, revisado em pull request |
| No "done" without a gate | Todo contrato termina em checagens de passa/falha |

### Pode dizer / nunca diga

| Nunca diga | Diga |
|---|---|
| preço, plano, "free", "trial" | nada; o convite é o comando de instalação |
| "open source", qualquer licença | "repositório público no GitHub" (não há LICENSE ainda, a confirmar) |
| "economiza X% de tokens" | "lê só a página que precisa" |
| "treina o seu agente" | "escreve lições no seu repositório" |
| "funciona com qualquer agente" | "markdown no seu repositório" (até confirmar Claude, Codex, Cursor) |
| nome de cliente, empresa ou contribuidor | "um time", "um contribuidor" |
| o nome completo do dono | "@devton" |
| `html-manual` | (não citar; foi removido) |
| "Sign up free", "Request a demo", "Join the waitlist" | "Install the blueprint" |

Tema sensível: os workflows de segurança são sempre descritos como "checagens autorizadas em
sistemas que você possui ou tem permissão para testar". Nunca como conformidade.

## Parte 2. A máquina

### Etapa por etapa

1. **01 Alimentar.** Artigos, páginas de workflow e notas de release levam cada persona ao seu caso.
2. **02 Atrair.** A pessoa instala com `npx skills add`. Hoje não sabemos quem instalou; a proposta
   é um modelo de issue "Which workflow do you need?" ao lado do comando.
3. **03 Ativar.** A pessoa digita `blueprint this project.` e o agente gera `skills/<projeto>/`.
   A proposta é um repositório de exemplo (a loja do site) para ver antes de mexer no próprio código.
4. **04 Qualificar.** Por conta própria: primeira tarefa roteada, primeira lição, segunda lição.
   Com o mantenedor: o time roda `plan-to-blueprint` e pede ou envia um workflow no GitHub.
5. **05 Converter.** Adoção: o caderno continua vivo depois de 60 dias, ou o workflow do time é
   publicado. Se existe oferta paga aqui é decisão do dono (a confirmar).
6. **06 Realimentar.** Os loops abaixo trazem a próxima leva.

### Loops

- **Integrações:** a pessoa diz que ferramentas usa, entra um contrato para a ferramenta, a página
  dessa ferramenta atrai outros usuários dela. É o mais forte, e já aconteceu uma vez com o
  catálogo de infra e segurança.
- **Convites:** o caderno vai junto com o repositório; quem clona recebe e instala em outro repo.
- **Conteúdo:** lições reais, anonimizadas, viram exemplos e artigos.

### Quem faz o quê

| Papel | Cuida de | Entrega para |
|---|---|---|
| Conteúdo e marca | artigos, páginas, tom | páginas prontas para o mantenedor |
| Mantenedor (vendas + sucesso) | issues, pedidos de workflow, times | pedidos de integração para produto |
| Produto | o fluxo de instalação, os contratos, o repo de exemplo | notas de release para conteúdo |
| Agente operador | rascunhos, análises, auditoria, relatório | o relatório para o dono |

Hoje esses papéis são a mesma pessoa (@devton). A separação serve para saber que chapéu está
sendo usado em cada entrega.

### O que medimos

Conversão entre etapas a cada 100 instalações, dias entre etapas, força de cada loop (novas
instalações por leva mensal de adotantes) e cobertura de valor por persona. Quase nada disso tem
dado hoje: a primeira tarefa do produto é ligar a instrumentação listada em `loops.md`.
