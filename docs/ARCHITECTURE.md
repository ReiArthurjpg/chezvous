# Arquitetura e levantamento

## Levantamento do sistema original

O repositório possuía apenas `chez_vous_gestao_prototipo.html` (610 linhas) e um README. Era uma SPA estática sem PHP, banco, endpoints, autenticação, sessões, dependências, assets externos, Docker ou variáveis de ambiente. Não havia queries SQL, API, upload persistido nem dados reais.

As nove áreas preservadas são: Visão geral, Eventos, Produção, Tarefas, Agenda, Processos & Rotinas, Reuniões, Equipe e Departamentos. O protótipo também continha navegação entre painéis, modal de novo evento, modal de nova tarefa, marcação visual de tarefa, abas do dossiê, menu móvel e filtros/botões apenas visuais. As regras inferíveis são: um evento nasce de orçamento aprovado; tarefas possuem setor, responsável, evento, prioridade, prazo e validador; uma tarefa em validação pode ser concluída por validação; e produção/agenda usam eventos e tarefas.

Botões de criar produção, compromisso, processo, reunião, colaborador e departamento já eram inertes, sem formulário, endpoint ou especificação de dados. Foram preservados como áreas de visualização; a implementação não inventa regras para eles.

## FDD

`src/Features` é o limite dos domínios funcionais. `Events` e `Tasks` possuem repositórios próprios e são persistentes; as demais features possuem suas views no mesmo domínio e são alimentadas por suas dependências reais. `src/Shared` reúne infraestrutura reutilizável (PDO, CSRF e views); `src/Config` carrega ambiente; `public` é o único document root. Controllers/rotas são centralizados em `public/index.php` enquanto o projeto ainda possui uma única interface; a próxima extração deve manter cada rota no domínio correspondente, sem migrar regras aos templates.

## Banco e segurança

`database/001_schema.sql` cria departamentos, usuários, eventos e tarefas com FKs e índices. `002_seed.sql` contém exclusivamente dados demonstrativos. O Docker executa esses arquivos somente em banco vazio, portanto não remove dados existentes. PDO usa prepared statements, saída HTML passa por escaping, POST exige token CSRF e upload limita extensão permitida/nome aleatório. Não existia autenticação no protótipo, portanto não foi simulada; proteção por perfil será uma feature Auth futura.

## Rotas

`/?page=dashboard|events|production|tasks|agenda|processes|meetings|team|departments`; `?page=events&new=1` e `?page=tasks&new=1` exibem os formulários. POSTs criam evento/tarefa, concluem tarefa ou validam tarefa. Página desconhecida retorna 404 e mostra o dashboard.

## Nova feature

Crie `src/Features/Nome/{Views,Services,Repositories,Models}` conforme o domínio precisar; mantenha SQL no repositório, regra no serviço, entrada na rota/controlador e HTML na view. Adicione migração aditiva numerada em `database/`; não altere migrations já aplicadas em produção.
