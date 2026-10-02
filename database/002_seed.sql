INSERT INTO departments (name, manager_name, areas) VALUES
('Comercial & Experiência','Coordenação Comercial','["Atendimento","Orçamentos","Cerimonial","Pós-evento"]'),
('Produção Gastronômica','Líder de Produção','["Cozinha","Salgados","Doceria","Produção Eventos"]'),
('Operações & Eventos','Líder de Operações','["Estoque","Logística","Montagem","Equipe Eventos"]'),
('Administrativo / Financeiro','Gerência Geral','["Financeiro","Compras","Contratos"]'),
('RH','Gestão de Pessoas','["Escala","Extras","Treinamentos"]');
INSERT INTO users (name, initials, department_id, role_name, manager_name) VALUES
('Maria Alves','MA',2,'Doceria','Líder de Produção'),('Pedro Lima','PE',2,'Salgados','Líder de Produção'),('João Santos','JO',3,'Operações • Líder','Líder de Operações'),('Sarah Costa','SA',5,'Gestão de Pessoas','Gerência Geral'),('Alisson','AS',4,'Gerência Geral',NULL);
INSERT INTO events (client_name,event_type,event_date,event_time,venue,guest_count,commercial_owner,amount,status,preparation_percent) VALUES
('João & Ana','Casamento','2026-10-10','18:00:00','Maison Bleu',200,'Comercial 01',34800,'Orçamento aprovado',82),
('Medicina','Formatura','2026-10-11','20:00:00','Spazzio',500,'Comercial 02',0,'Em preparação',58),
('Tech Summit','Corporativo','2026-10-17','09:00:00','Centro de Convenções',250,'Comercial 01',0,'Em preparação',36);
INSERT INTO tasks (title,department_id,assignee_id,event_id,validator_name,priority,status,due_at,description,completed_at) VALUES
('Validar checklist do casamento João & Ana',3,3,1,'Líder de Operações','Alta','A fazer','2026-10-01 09:00:00','Validar checklist operacional.',NULL),
('Reunião rápida com Produção',2,1,1,'Líder de Produção','Média','Concluída','2026-10-01 10:30:00','Alinhamento operacional.','2026-10-01 10:45:00'),
('Revisar escala da formatura',5,4,2,'Gestão de Pessoas','Alta','Em andamento','2026-10-01 14:00:00','Confirmar equipe.',NULL),
('Organização do estoque',3,3,1,'Líder de Operações','Média','Em validação','2026-10-01 17:00:00','Organizar materiais.',NULL),
('Checklist da rouparia',3,3,1,'Líder de Operações','Média','Em validação','2026-10-01 17:00:00','Conferir rouparia.',NULL);
