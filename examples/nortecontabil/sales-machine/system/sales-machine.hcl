# Nortecontábil sales machine, as an agent-operated system.
# Written by the sales-machine-scaffold `system-spec` workflow on 2026-11-28.

spec "sales_machine" {
  product  = "Nortecontábil"
  version  = "0.1.0"
  date     = "2026-11-28"
  access   = "open"
  language = "pt-BR"
  operator = agent.operator
  note     = "Specification only. Not infrastructure. Nothing here is executed."
}

# Agents

agent "operator" {
  purpose      = "Lê pedidos e marcos, mede a máquina, rascunha conteúdo e páginas, prepara o resumo diário para vendas e atualiza o relatório"
  reads        = [source.pedidos, source.marcos, source.atendimento, source.workspace]
  writes       = ["sales-machine/"]
  never        = [rule.no_publish_without_review, rule.never_say, rule.no_contact, rule.no_names, rule.regulated]
  escalates_to = role.owner
}

agent "auditor" {
  purpose      = "Roda value-audit em todo rascunho e o self-check do spec antes de qualquer hand-off"
  reads        = [source.workspace]
  writes       = ["sales-machine/audit/findings.json"]
  never        = [rule.facts_only]
  escalates_to = role.owner
}

# People

role "owner" {
  owns     = ["config.json", "preços e planos", "diga / nunca diga", "lista a confirmar"]
  approves = [handoff.report, handoff.instrumentation]
}

role "content" {
  owns     = ["artigos", "páginas de segmento", "landing", "tom"]
  approves = [handoff.articles, handoff.pages]
}

role "sales" {
  owns     = ["resposta aos pedidos", "propostas", "contrato"]
  approves = [handoff.lead]
}

role "success" {
  owns = ["contador de referência", "onboarding", "indicações", "dúvidas frequentes"]
}

role "product" {
  owns = ["formulário ou cadastro", "WhatsApp", "planilha ou CRM de marcos", "instrumentação"]
}

# Sources

source "pedidos" {
  kind            = "form"
  path_or_channel = "<destino do formulário ou do cadastro, a confirmar G-09>"
  refresh         = "on event"
}

source "marcos" {
  kind            = "sheet"
  path_or_channel = "<planilha ou CRM com um pedido por linha>"
  refresh         = "daily"
}

source "atendimento" {
  kind            = "chat"
  path_or_channel = "<WhatsApp da Nortecontábil, só etiquetas de tema, sem conteúdo pessoal>"
  refresh         = "weekly"
}

source "workspace" {
  kind            = "files"
  path_or_channel = "sales-machine/"
  refresh         = "on change"
}

# Events

event "conteudo_publicado" {
  captures = ["peça", "segmento", "persona", "utm"]
}

event "visita_site" {
  captures = ["página", "utm", "ref"]
}

event "pedido_proposta" {
  captures = ["objetivo", "faixa", "segmento", "cidade", "cnpj se troca", "como conheceu", "ref"]
}

event "proposta_enviada" {
  captures = ["plano indicado", "enquadramento sugerido", "hora"]
}

event "proposta_entendida" {
  captures = ["resposta da pessoa", "hora"]
}

event "contrato_assinado" {
  captures = ["plano", "hora"]
}

event "primeiro_pagamento" {
  captures = ["hora"]
}

event "cliente_60_dias" {
  captures = ["duas competências sem atraso"]
}

event "indicacao_feita" {
  captures = ["ref", "segmento"]
}

# Stages

stage "alimentar" {
  order  = 1
  entry  = event.conteudo_publicado
  exit   = event.visita_site
  value  = ["Reduced anxiety", "Time savings", "Expertise"]
  metric = metric.visitas_por_peca
  owner  = role.content
}

stage "atrair" {
  order  = 2
  entry  = event.visita_site
  exit   = event.pedido_proposta
  value  = ["Time savings", "Reduced effort", "Reduced anxiety"]
  metric = metric.visita_para_pedido
  owner  = role.content
}

stage "ativar" {
  order  = 3
  entry  = event.pedido_proposta
  exit   = event.proposta_entendida
  value  = ["Reduced effort", "Simplification", "Decreased hassles", "Reduced anxiety"]
  metric = metric.pedido_para_proposta_entendida
  owner  = role.sales
}

stage "qualificar" {
  order  = 4
  entry  = event.proposta_entendida
  exit   = [signal.pronto_autoatendimento, signal.pronto_assistido]
  lanes  = [lane.por_conta_propria, lane.com_o_contador]
  value  = ["Time savings", "Expertise", "Responsiveness", "Risk reduction"]
  metric = metric.proposta_para_sinal
  owner  = role.sales
}

stage "converter" {
  order  = 5
  entry  = [signal.pronto_autoatendimento, signal.pronto_assistido]
  exit   = event.primeiro_pagamento
  value  = ["Risk reduction", "Transparency", "Commitment", "Reduced anxiety"]
  metric = metric.sinal_para_cliente
  owner  = role.sales
}

stage "retroalimentar" {
  order  = 6
  entry  = event.cliente_60_dias
  exit   = event.indicacao_feita
  value  = ["Network expansion", "Connection", "Reputational assurance"]
  metric = metric.pedidos_por_coorte
  owner  = role.success
  feeds  = stage.alimentar
}

# Lanes and signals (internal only)

lane "por_conta_propria" {
  personas = ["prestador-pj", "mei-limite"]
  path     = ["pedido com faixa", "proposta com plano indicado", "escolhe o plano", "envia documentos"]
  signal   = signal.pronto_autoatendimento
}

lane "com_o_contador" {
  personas = ["troca-contador"]
  path     = ["pedido com CNPJ", "conferência de pendências", "conversa de 15 minutos"]
  signal   = signal.pronto_assistido
}

signal "pronto_autoatendimento" {
  when = "[a confirmar] escolheu o plano e enviou os documentos"
  then = workflow.lead_handoff
}

signal "pronto_assistido" {
  when = "[a confirmar] troca com CNPJ, ou sócio/funcionário, ou faixa mais alta"
  then = workflow.lead_handoff
}

# Loops

loop "segmentos" {
  steps  = ["cliente informa o segmento", "juntamos o que se repete no segmento", "página e guia do segmento atraem pares", "pares pedem proposta e informam o segmento"]
  owner  = role.content
  metric = metric.pedidos_por_coorte
  feeds  = stage.alimentar
}

loop "indicacoes" {
  steps  = ["cliente com 60 dias recebe link pessoal", "manda para um colega", "colega pede proposta pelo link", "colega vira cliente e recebe o próprio link"]
  owner  = role.success
  metric = metric.pedidos_por_coorte
  feeds  = stage.atrair
}

loop "conteudo" {
  steps  = ["dúvidas reais anonimizadas", "viram artigos e FAQ", "trazem visitas e pedidos", "novos clientes trazem novas dúvidas"]
  owner  = role.content
  metric = metric.pedidos_por_coorte
  feeds  = stage.alimentar
}

# Workflows of the running machine

workflow "lead_handoff" {
  inputs = [source.pedidos, source.marcos]

  step "resumir" {
    does = "Para cada sinal novo, escreve um resumo: objetivo, faixa, segmento, pendências vistas, plano indicado"
    uses = [rule.no_names, rule.regulated]
  }

  step "entregar" {
    does = "Entrega o resumo ao contador de vendas; não fala com a pessoa"
    uses = [rule.no_contact]
  }

  outputs     = ["sales-machine/leads/<date>.md"]
  review_gate = gate.lead
}

workflow "daily_followup" {
  inputs = [source.marcos]

  step "achar_parados" {
    does = "Lista pedidos sem proposta há mais de 1 dia útil e propostas sem resposta há mais de 2 dias úteis"
  }

  step "sugerir_mensagem" {
    does = "Sugere a mensagem de lembrete por estágio para vendas enviar"
    uses = [rule.cta, rule.never_say]
  }

  outputs     = ["sales-machine/followup/<date>.md"]
  review_gate = gate.lead
}

workflow "article_batch" {
  inputs = [source.atendimento, "articles/index.json", "positioning.md"]

  step "pick_gaps" {
    does = "Cobertura persona x estágio x loop x valor; escolhe as lacunas e as dúvidas mais frequentes"
  }

  step "draft" {
    does = "Escreve artigos prontos em pt-BR com valor, gancho de loop, CTA e FAQ"
    uses = [rule.cta, rule.never_say, rule.regulated]
  }

  outputs     = ["articles/<date>/*.md"]
  review_gate = gate.content
}

workflow "segment_page" {
  inputs = [source.pedidos, "landing/"]

  step "rank" {
    does = "Ordena segmentos por pedidos e clientes do mês"
  }

  step "draft_page" {
    does = "Escreve a spec da página do segmento que falta"
    uses = [rule.no_names, rule.facts_only]
  }

  outputs     = ["landing/integration-segmento-<slug>.md"]
  review_gate = gate.content
}

workflow "metrics_review" {
  inputs = [source.marcos]

  step "measure" {
    does = "Calcula conversão e tempo entre estágios e pedidos por coorte por loop"
  }

  outputs     = ["sales-machine/metrics/<week>.md"]
  review_gate = gate.report
}

workflow "report_refresh" {
  inputs = [source.workspace]

  step "rebuild" {
    does = "Regenera o relatório HTML autocontido"
  }

  outputs     = ["report/sales-machine-report.html"]
  review_gate = gate.report
}

# Routines

routine "lead_on_signal" {
  on          = signal.pronto_autoatendimento
  agent       = agent.operator
  runs        = workflow.lead_handoff
  delivers_to = handoff.lead
}

routine "lead_on_assisted" {
  on          = signal.pronto_assistido
  agent       = agent.operator
  runs        = workflow.lead_handoff
  delivers_to = handoff.lead
}

routine "daily_followup" {
  schedule    = "daily 08:30 America/Sao_Paulo"
  agent       = agent.operator
  runs        = workflow.daily_followup
  delivers_to = handoff.lead
}

routine "weekly_articles" {
  schedule    = "weekly tue 09:00 America/Sao_Paulo"
  agent       = agent.operator
  runs        = workflow.article_batch
  delivers_to = handoff.articles
}

routine "monthly_segment" {
  schedule    = "monthly day 1 09:00 America/Sao_Paulo"
  agent       = agent.operator
  runs        = workflow.segment_page
  delivers_to = handoff.pages
}

routine "weekly_metrics" {
  schedule    = "weekly mon 08:00 America/Sao_Paulo"
  agent       = agent.operator
  runs        = workflow.metrics_review
  delivers_to = handoff.report
}

routine "report_after_change" {
  on          = event.conteudo_publicado
  agent       = agent.auditor
  runs        = workflow.report_refresh
  delivers_to = handoff.report
}

# Gates

gate "content" {
  checks  = ["só fatos do ledger confirmados", "2-4 elementos de valor, 1 de nível 3/4", "gancho de loop", "FAQ", "CTA Receber minha proposta", "nada de nunca-diga", "temas regulados só pela regra"]
  on_fail = "corrige, ou registra FAIL e entrega mesmo assim marcado"
}

gate "lead" {
  checks  = ["sem dado pessoal além do necessário", "sem promessa de imposto menor", "plano indicado pela faixa"]
  on_fail = "devolve ao operador"
}

gate "report" {
  checks  = ["self-check sem recurso externo", "contagens batem com audit/findings.json"]
  on_fail = "corrige antes de entregar"
}

# Metrics

metric "visitas_por_peca" {
  formula = "visitas_com_utm_da_peca / pecas_publicadas"
  per     = "peça"
}

metric "visita_para_pedido" {
  formula = "pedido_proposta / visita_site"
  per     = "100 visitas"
}

metric "pedido_para_proposta_entendida" {
  formula = "proposta_entendida / pedido_proposta"
  per     = "100 pedidos"
}

metric "proposta_para_sinal" {
  formula = "sinais / proposta_entendida"
  per     = "100 propostas, por faixa"
}

metric "sinal_para_cliente" {
  formula = "primeiro_pagamento / sinais"
  per     = "100 sinais"
}

metric "pedidos_por_coorte" {
  formula = "novos pedidos atribuídos à coorte / clientes da coorte"
  per     = "loop, mensal"
}

# Rules

rule "cta" {
  text = "Todo CTA principal é Receber minha proposta; o secundário é Falar no WhatsApp"
}

rule "never_say" {
  text = "Nada de config.neverSay: preços até confirmação, grátis, pague menos imposto, prazos fixos, números sem dado, robô, textos do site de referência"
}

rule "regulated" {
  text = "CRC, enquadramento, LGPD e prazo de abertura só como a regra de config.regulatedTopics"
}

rule "facts_only" {
  text = "Só fatos F- do ledger; P- só depois do ok do dono"
}

rule "no_names" {
  text = "Nenhum nome de cliente; segmentos sim, pessoas não"
}

rule "no_contact" {
  text = "O agente nunca escreve para leads ou clientes; só prepara para pessoas enviarem"
}

rule "no_publish_without_review" {
  text = "Nada é publicado sem passar por um gate e por uma pessoa"
}

# Hand-offs

handoff "lead" {
  from     = agent.operator
  to       = role.sales
  artifact = "sales-machine/leads/<date>.md"
  when     = "after gate.lead passes"
}

handoff "articles" {
  from     = agent.operator
  to       = role.content
  artifact = "articles/<date>/*.md"
  when     = "after gate.content passes"
}

handoff "pages" {
  from     = agent.operator
  to       = role.content
  artifact = "landing/*.md"
  when     = "after gate.content passes"
}

handoff "report" {
  from     = agent.auditor
  to       = role.owner
  artifact = "report/sales-machine-report.html"
  when     = "after gate.report passes"
}

handoff "instrumentation" {
  from     = agent.operator
  to       = role.product
  artifact = "loops.md (instrumentação necessária)"
  when     = "on change of loops.md"
}
