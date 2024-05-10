--DDL
--Criando as tabelas

CREATE TABLE alunos(
	cpf varchar(15) PRIMARY KEY,
	nome_aluno varchar(50) NOT NULL,
	numero varchar(10),
	idade int,
	rua text,
	bairro varchar(20),
	cidade varchar(20),
	UF varchar(2),
	cep int,
	pais varchar(20)
);

CREATE TABLE telefone(
	cpf varchar(15) REFERENCES alunos,
    numero varchar(15)
);

CREATE TABLE emails(
	cpf varchar(15) REFERENCES alunos,
	email varchar(80),
	dominio varchar (20)
);

CREATE TABLE departamentos(
	id_dpto SERIAL PRIMARY KEY,
	sigla_dpto varchar(4),
	nome_dpto varchar(10)
);

CREATE TABLE cursos(
	id_cursos SERIAL PRIMARY KEY,
	nome_curso varchar (10),
	id_dpto SERIAL REFERENCES departamentos
);

CREATE TABLE matriculas(
	ra SERIAL PRIMARY KEY,
    cpf varchar(15) REFERENCES alunos,
	status varchar(10),
	id_curso SERIAL REFERENCES cursos
);

CREATE TABLE disciplinas (
	id_disciplina SERIAL PRIMARY KEY,
	nome_disciplina varchar(20),
	optativa boolean
);

CREATE TABLE cursos_disciplinas(
	id_curso SERIAL REFERENCES cursos,
	id_disciplina SERIAL REFERENCES disciplinas
);

CREATE TABLE matriculas_disciplinas(
	ra SERIAL REFERENCES matriculas,
	id_disciplinas SERIAL REFERENCES disciplinas
);

--DML
--Povoando as tabelas

INSERT INTO alunos (cpf, nome_aluno, idade, rua, numero, bairro, cidade, UF, cep, pais) VALUES
    ('12345678901', 'Bruno Sakamoto', 24, 'Rua A', '100', 'Bairro A', 'Cidade A', 'SP', 12345000, 'Brasil'),
    ('12345678902', 'Pablo Domingues', 22, 'Rua B', '200', 'Bairro B', 'Cidade B', 'RJ', 22345678, 'Brasil'),
    ('12345678903', 'Joao Pedro', 24, 'Rua C', '300', 'Bairro C', 'Cidade C', 'MG', 32345678, 'Brasil'),
    ('12345678904', 'Samuel Silva', 23, 'Rua D', '400', 'Bairro D', 'Cidade D', 'BA', 42345678, 'Brasil'),
    ('12345678905', 'Pedro Santos', 25, 'Rua E', '500', 'Bairro E', 'Cidade E', 'PR', 52345678, 'Brasil'),
    ('12345678906', 'Laura Lima', 21, 'Rua F', '600', 'Bairro F', 'Cidade F', 'PE', 62345678, 'Brasil'),
    ('12345678907', 'Lucas Mendes', 24, 'Rua G', '700', 'Bairro G', 'Cidade G', 'RS', 72345678, 'Brasil'),
    ('12345678908', 'Isabela Rocha', 23, 'Rua H', '800', 'Bairro H', 'Cidade H', 'GO', 82345678, 'Brasil'),
    ('12345678909', 'Gabriel Moreira', 20, 'Rua I', '900', 'Bairro I', 'Cidade I', 'SP', 92345678, 'Brasil'),
    ('12345678910', 'Carolina Reis', 22, 'Rua J', '1000', 'Bairro J', 'Cidade J', 'MG', 10123456, 'Brasil');

INSERT INTO telefone (cpf, numero) VALUES
    ('12345678901', 551199887766),
    ('12345678902', 552198765432),
    ('12345678903', 553191234567),
    ('12345678904', 557197654321),
    ('12345678905', 554196385274),
    ('12345678906', 558198653214),
    ('12345678907', 555197415326),
    ('12345678908', 556293516274),
    ('12345678909', 551197423165),
    ('12345678910', 553197684532);
	
INSERT INTO emails (cpf, email, dominio) VALUES
    ('12345678901', 'bruno.sakamoto@gmail.com', 'gmail.com'),
    ('12345678902', 'pablo.domingues@yahoo.com', 'yahoo.com'),
    ('12345678903', 'joao.pedro@outlook.com', 'outlook.com'),
    ('12345678904', 'samuel.silva@gmail.com', 'gmail.com'),
    ('12345678905', 'pedro.santos@hotmail.com', 'hotmail.com'),
    ('12345678906', 'laura.lima@yahoo.com', 'yahoo.com'),
    ('12345678907', 'lucas.mendes@outlook.com', 'outlook.com'),
    ('12345678908', 'isabela.rocha@gmail.com', 'gmail.com'),
    ('12345678909', 'gabriel.moreira@hotmail.com', 'hotmail.com'),
    ('12345678910', 'carolina.reis@outlook.com', 'outlook.com');
	
INSERT INTO departamentos (sigla_dpto, nome_dpto) VALUES
    ('SAUD', 'SAÚDE'),
    ('TECN', 'TECNOLOGIA'),
    ('ENGE', 'ENGENHARIA'),
    ('HUMA', 'HUMANAS');
   
INSERT INTO cursos (nome_curso, id_dpto) VALUES
    ('Medicina', 1),  
    ('Enfermagem', 1),
    ('Cálculo', 2), 
    ('Algoritmos', 2),
    ('Física', 2),
    ('Química', 2),
    ('Direito', 3), 
    ('Economia', 3),
    ('Sociologia', 3),
    ('Civil', 4), 
    ('Elétrica', 4),
    ('Mecânica', 4);

INSERT INTO matriculas (cpf, status, id_curso) VALUES
    ('12345678901', 'Ativo', 1), 
    ('12345678902', 'Inativo', 2), 
    ('12345678903', 'Ativo', 3), 
    ('12345678903', 'Ativo', 4), 
    ('12345678905', 'Ativo', 5), 
    ('12345678906', 'Inativo', 6), 
    ('12345678907', 'Ativo', 7), 
    ('12345678908', 'Formado0', 8), 
    ('12345678909', 'Formado', 9), 
    ('12345678905', 'Ativo', 10); 

INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
    ('Anatomia', FALSE),
    ('Citologia', FALSE),
    ('Cálculo I', FALSE),
    ('Cálculo II', FALSE),
    ('Física I', FALSE),
    ('Física II', FALSE),
    ('Direito I', FALSE),
    ('Direito II', FALSE),
    ('Economia I', FALSE),
    ('Sociologia I', FALSE),
    ('Engenharia I', FALSE),
    ('Engenharia II', FALSE);
	
INSERT INTO cursos_disciplinas (id_curso, id_disciplina) VALUES
    (1, 1),
    (1, 2), 
    (3, 3), 
    (3, 4), 
    (5, 5), 
    (5, 6), 
    (7, 7), 
    (7, 8), 
    (8, 9),
    (9, 10), 
    (10, 11),
    (10, 12); 
	
INSERT INTO matriculas_disciplinas (ra, id_disciplinas) VALUES
    (1, 1),
    (1, 2),
    (3, 3),
    (3, 4),
    (5, 5),
    (5, 6),
    (7, 7),
    (7, 8),
    (8, 9),
    (9, 10),
    (10, 11),
    (10, 12);
	
--DQL
--Achando informações específicas
--Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT alunos.cpf, alunos.nome_aluno, alunos.data_nasc, alunos.idade, alunos.rua, alunos.rua, alunos.bairro, alunos.cidade, alunos.UF, alunos.cep, alunos.pais
FROM alunos FULL JOIN matriculas USING (cpf)  
WHERE ra = '2'

--Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT cursos.id_cursos, cursos.nome_curso FROM cursos 
FULL JOIN departamentos USING (id_dpto)  
WHERE nome_dpto = 'SAÚDE'

--Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT cursos.nome_curso, cursos.id_cursos FROM disciplinas 
FULL JOIN cursos_disciplinas ON disciplinas.id_disciplina = cursos_disciplinas.id_disciplina
FULL JOIN cursos ON cursos_disciplinas.id_curso = cursos.id_cursos
WHERE disciplinas.nome_disciplina = 'Anatomia';

--Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT disciplinas.nome_disciplina, disciplinas.optativa FROM alunos INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
INNER JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra
INNER JOIN disciplinas ON matriculas_disciplinas.id_disciplinas = disciplinas.id_disciplina
WHERE alunos.cpf = '12345678901';

--Filtrar todos os alunos matriculados em um determinado curso.
SELECT alunos.cpf, alunos.nome_aluno, alunos.data_nasc, alunos.idade FROM alunos 
INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
INNER JOIN cursos ON matriculas.id_curso = cursos.id_cursos
WHERE cursos.nome_curso = 'Medicina' ;

--Filtrar todos os alunos matriculados em determinada disciplina.
SELECT alunos.cpf, alunos.nome_aluno, alunos.data_nasc, alunos.idade FROM alunos 
FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
FULL JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra
FULL JOIN disciplinas ON matriculas_disciplinas.id_disciplinas = disciplinas.id_disciplina
WHERE disciplinas.nome_disciplina = 'Engenharia I';

--Filtrar alunos formados.
SELECT alunos.nome_aluno, matriculas.status FROM alunos 
FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
WHERE matriculas.status = 'Formado'

--Filtrar alunos ativos.
SELECT * FROM alunos WHERE cpf IN 
(SELECT cpf FROM matriculas WHERE status = 'Ativo');

--Apresentar a quantidade de alunos ativos por curso.
SELECT cursos.nome_curso, COUNT(alunos.cpf) AS quantidade_alunos_ativos FROM alunos 
FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
FULL JOIN cursos ON matriculas.id_curso = cursos.id_cursos
WHERE matriculas.status = 'Ativo' GROUP BY cursos.nome_curso;

--Apresentar a quantidade de alunos ativos por disciplina.
SELECT disciplinas.nome_disciplina, COUNT(alunos.cpf) AS quantidade_alunos_ativosFROM alunos 
INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
INNER JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra
INNER JOIN disciplinas ON matriculas_disciplinas.id_disciplinas = disciplinas.id_disciplina
WHERE matriculas.status = 'Ativo' 
GROUP BY disciplinas.nome_disciplina;

