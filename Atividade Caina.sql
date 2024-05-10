--DDL
-- Criando a tabela alunos
CREATE TABLE alunos (
	cpf int primary key,
	nome varchar(50) not null,
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(20)
);

ALTER TABLE alunos ALTER COLUMN	cpf TYPE varchar(15)

CREATE TABLE telefones (
	cpf varchar(15) REFERENCES alunos,
	ddd int,
	numero int 
)

ALTER TABLE telefones ADD cod_pais int

CREATE TABLE emails (
	cpf varchar(15) REFERENCES alunos,
	email varchar(50),
	dominio varchar(20)
)

ALTER TABLE emails ALTER COLUMN email TYPE varchar(64)

CREATE TABLE departamentos (
	id_dpto serial PRIMARY KEY,
	sigla_dpto varchar(4),
	nome_dpto varchar(10)
)

CREATE TABLE cursos (
	id_curso serial PRIMARY KEY,
	nome_curso varchar(10),
	id_dpto serial REFERENCES departamentos
)


CREATE TABLE matriculas (
	ra serial PRIMARY KEY,
	cpf varchar(15) REFERENCES alunos,
	status varchar(10),
	id_curso int REFERENCES cursos
)

CREATE TABLE disciplinas (
	id_disciplinas serial PRIMARY KEY,
	nome_disciplina varchar(10),
	optativa boolean
)

ALTER TABLE disciplinas ALTER COLUMN nome_disciplina TYPE varchar (20)

ALTER TABLE disciplinas RENAME COLUMN id_disciplinas TO id_disciplina

CREATE TABLE cursos_disciplinas (
	id_curso serial REFERENCES cursos,
	id_disciplina serial REFERENCES disciplinas
)

CREATE TABLE matrículas_disciplinas (
	ra serial REFERENCES matriculas,
	id_disciplina serial REFERENCES disciplinas 
)

--DML
--Povoando as tabelas

INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, estado, cep, pais) VALUES
(12345678901, 'João Silva', 25, 'Rua A', '123', 'Centro', 'São Paulo', 'SP', 123456, 'Brasil'),
(98765432102, 'Maria Santos', 22, 'Rua B', '456', 'Vila Nova', 'Rio de Janeiro', 'RJ', 654321, 'Brasil'),
(45678912303, 'Pedro Oliveira', 30, 'Av. C', '789', 'Jardim', 'Belo Horizonte', 'MG', 789123, 'Brasil'),
(32165498704, 'Ana Costa', 28, 'Rua D', '1011', 'Centro', 'Porto Alegre', 'RS', 456789, 'Brasil'),
(65498732105, 'Carlos Silva', 35, 'Rua E', '1314', 'Campo Grande', 'Salvador', 'BA', 987654, 'Brasil'),
(78912345606, 'Juliana Pereira', 20, 'Rua F', '1516', 'Boa Vista', 'Curitiba', 'PR', 654987, 'Brasil'),
(15975345607, 'Lucas Souza', 24, 'Av. G', '1718', 'Santo Antônio', 'Recife', 'PE', 321654, 'Brasil'),
(35715975308, 'Fernanda Lima', 27, 'Rua H', '1920', 'Centro', 'Fortaleza', 'CE', 159753, 'Brasil'),
(25836914709, 'Gustavo Santos', 29, 'Rua I', '2122', 'Vila Isabel', 'Manaus', 'AM', 357159, 'Brasil'),
(12345678910, 'Luana Oliveira', 26, 'Rua J', '2324', 'Boa Viagem', 'Natal', 'RN', 258369, 'Brasil'),
(98765432111, 'Marcos Silva', 32, 'Av. K', '2526', 'Liberdade', 'Belém', 'PA', 123456, 'Brasil'),
(45678912312, 'Renata Costa', 23, 'Rua L', '2728', 'Petrópolis', 'Vitória', 'ES', 987654, 'Brasil'),
(32165498713, 'Paulo Oliveira', 31, 'Rua M', '2930', 'São Cristóvão', 'Florianópolis', 'SC', 456789, 'Brasil'),
(65498732114, 'Larissa Almeida', 21, 'Av. N', '3132', 'Centro', 'Maceió', 'AL', 321654, 'Brasil'),
(78912345615, 'Daniel Pereira', 33, 'Rua O', '3334', 'Boa Vista', 'João Pessoa', 'PB', 654987, 'Brasil'),
(15975345616, 'Roberta Santos', 25, 'Rua P', '3536', 'Vila Nova', 'Cuiabá', 'MT', 789123, 'Brasil'),
(35715975317, 'Eduardo Lima', 22, 'Av. Q', '3738', 'Centro', 'Teresina', 'PI', 159753, 'Brasil'),
(25836914718, 'Aline Souza', 28, 'Rua R', '3940', 'Jardim', 'Campo Grande', 'MS', 357159, 'Brasil'),
(12345678919, 'Vinícius Costa', 30, 'Rua S', '4142', 'Santo Antônio', 'Porto Velho', 'RO', 258369, 'Brasil'),
(98765432120, 'Camila Oliveira', 24, 'Av. T', '4344', 'Centro', 'Aracaju', 'SE', 123456, 'Brasil'),
(45678912321, 'José Silva', 26, 'Rua U', '4546', 'Boa Viagem', 'Palmas', 'TO', 987654, 'Brasil'),
(32165498722, 'Mariana Santos', 29, 'Rua V', '4748', 'Centro', 'Macapá', 'AP', 456789, 'Brasil'),
(65498732123, 'Rafael Oliveira', 27, 'Av. W', '4950', 'Vila Isabel', 'Porto Alegre', 'RS', 321654, 'Brasil'),
(78912345624, 'Carolina Lima', 31, 'Rua X', '5152', 'Petrópolis', 'Rio Branco', 'AC', 654987, 'Brasil'),
(15975345625, 'Fábio Santos', 23, 'Rua Y', '5354', 'São Cristóvão', 'Curitiba', 'PR', 789123, 'Brasil'),
(35715975326, 'Vanessa Costa', 28, 'Av. Z', '5556', 'Centro', 'Salvador', 'BA', 159753, 'Brasil'),
(25836914727, 'Leandro Oliveira', 32, 'Rua A1', '5758', 'Liberdade', 'Manaus', 'AM', 357159, 'Brasil'),
(12345678928, 'Amanda Silva', 25, 'Rua B1', '5960', 'Vila Nova', 'Belém', 'PA', 258369, 'Brasil'),
(98765432129, 'Ricardo Lima', 30, 'Av. C1', '6162', 'Centro', 'Vitória', 'ES', 123456, 'Brasil'),
(45678912330, 'Gabriela Costa', 22, 'Rua D1', '6364', 'Boa Vista', 'Florianópolis', 'SC', 987654, 'Brasil'),
(32165498731, 'Diego Oliveira', 26, 'Rua E1', '6566', 'Vila Isabel', 'Maceió', 'AL', 456789, 'Brasil'),
(65498732132, 'Patrícia Santos', 27, 'Av. F1', '6768', 'Jardim', 'João Pessoa', 'PB', 321654, 'Brasil'),
(78912345633, 'Guilherme Lima', 33, 'Rua G1', '6970', 'Centro', 'Cuiabá', 'MT', 654987, 'Brasil'),
(15975345634, 'Natália Costa', 24, 'Rua H1', '7172', 'Boa Viagem', 'Teresina', 'PI', 789123, 'Brasil'),
(35715975335, 'Thiago Oliveira', 29, 'Av. I1', '7374', 'Santo Antônio', 'Campo Grande', 'MS', 159753, 'Brasil'),
(25836914736, 'Isabela Santos', 31, 'Rua J1', '7576', 'Centro', 'Porto Velho', 'RO', 357159, 'Brasil'),
(12345678937, 'Felipe Lima', 26, 'Av. K1', '7778', 'Vila Nova', 'Aracaju', 'SE', 258369, 'Brasil'),
(98765432138, 'Luiza Costa', 28, 'Rua L1', '7980', 'Centro', 'Palmas', 'TO', 123456, 'Brasil'),
(45678912339, 'Thales Oliveira', 32, 'Rua M1', '8182', 'Boa Viagem', 'Macapá', 'AP', 987654, 'Brasil'),
(32165498740, 'Raquel Santos', 25, 'Av. N1', '8384', 'Liberdade', 'Porto Alegre', 'RS', 456789, 'Brasil'),
(65498732141, 'Leonardo Lima', 27, 'Rua O1', '8586', 'Centro', 'Rio Branco', 'AC', 321654, 'Brasil'),
(78912345642, 'Tatiane Costa', 30, 'Av. P1', '8788', 'Petrópolis', 'Curitiba', 'PR', 654987, 'Brasil'),
(15975345643, 'Bruno Oliveira', 23, 'Rua Q1', '8990', 'São Cristóvão', 'Salvador', 'BA', 789123, 'Brasil'),
(35715975344, 'Carla Santos', 28, 'Av. R1', '9192', 'Centro', 'Natal', 'RN', 159753, 'Brasil'),
(25836914745, 'Henrique Lima', 31, 'Rua S1', '9394', 'Petrópolis', 'Belém', 'PA', 357159, 'Brasil'),
(12345678946, 'Mariana Costa', 24, 'Av. T1', '9596', 'Vila Nova', 'Vitória', 'ES', 258369, 'Brasil'),
(98765432147, 'Roberto Oliveira', 27, 'Rua U1', '9798', 'Centro', 'Florianópolis', 'SC', 123456, 'Brasil'),
(45678912348, 'Bianca Santos', 33, 'Av. V1', '99100', 'Boa Viagem', 'Maceió', 'AL', 987654, 'Brasil'),
(32165498749, 'William Lima', 26, 'Rua X1', '101102', 'Vila Isabel', 'João Pessoa', 'PB', 456789, 'Brasil'),
(65498732150, 'Marcela Costa', 29, 'Av. Y1', '103104', 'Centro', 'Cuiabá', 'MT', 321654, 'Brasil');

SELECT * FROM ALUNOS

INSERT INTO departamentos (sigla_dpto, nome_dpto) VALUES
('SAUD','SAUDE'),
('TECN','TECNOLOGIA'),
('ENGE','ENGENHARIA'),
('HUMA','HUMANAS')

ALTER TABLE cursos ALTER COLUMN nome_curso TYPE varchar(50)

INSERT INTO cursos (nome_curso, id_dpto) VALUES
('Medicina', 1),
('Enfermagem', 1),
('Nutrição', 1),
('Ciência da Computação', 2),
('Engenharia de Software', 2),
('Inteligência Artificial', 2),
('Engenharia Civil', 3),
('Engenharia Elétrica', 3),
('Engenharia Mecânica', 3),
('Psicologia', 4),
('História', 4),
('Sociologia', 4);
 
INSERT INTO matriculas (cpf,status,id_curso) VALUES
(12345678901, 'ativo', 1),
(32165498704, 'ativo',5),
(65498732105, 'inativo',5),
(65498732150, 'formado',7),
(35715975335, 'ativo',12),
(12345678937, 'formado',7),
(98765432138, 'inativo',10),
(12345678946, 'formado',10),
(45678912348, 'ativo',11),
(35715975335, 'formado',2),
(25836914745, 'inativo',4)
 
INSERT INTO disciplinas (nome_disciplina, optativa) VALUES
('Anatomia', FALSE),
('Citologia', FALSE),    
('Cálculo I', FALSE)    ,
('Cálculo II', FALSE),
('Física I', FALSE),
('Física II', FALSE),
('Direito I', FALSE),
('Direito II', FALSE),
('Economia I', FALSE),
('Sociologia I', FALSE),
('Engenharia I', FALSE),
('Engenharia II', FALSE);
    
	
--DQL
--Especificando a tabela

--1.Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT *FROM alunos
WHERE ra = 'ra_do_aluno' OR nome = 'nome do aluno';

--2.Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT cursos.nome_cursoFROM cursos
INNER JOIN departamentos ON cursos.id_dpto = departamentos.id_dpto
WHERE departamentos.nome_dpto = 'nome do departamento';

--3.Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT cursos.nome_cursoFROM cursos
INNER JOIN cursos_disciplinas ON cursos.id_curso = cursos_disciplinas.id_curso
INNER JOIN disciplinas ON cursos_disciplinas.id_disciplina = disciplinas.id_disciplina
WHERE disciplinas.nome_disciplina = 'nome da disciplina';

--4.Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT disciplinas.nome_disciplinaFROM disciplinas
INNER JOIN matrículas_disciplinas ON disciplinas.id_disciplina = matrículas_disciplinas.id_disciplina
INNER JOIN matriculas ON matrículas_disciplinas.ra = matriculas.ra
WHERE matriculas.cpf = 'cpf do aluno';

--5.Filtrar todos os alunos matriculados em um determinado curso.
SELECT *FROM alunos
INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
INNER JOIN cursos ON matriculas.id_curso = cursos.id_curso
WHERE cursos.nome_curso = 'nome do curso';

--6.Filtrar todos os alunos matriculados em determinada disciplina.SELECT *
FROM alunosINNER JOIN matrículas_disciplinas ON alunos.ra = matrículas_disciplinas.ra
INNER JOIN disciplinas ON matrículas_disciplinas.id_disciplina = disciplinas.id_disciplina
WHERE disciplinas.nome_disciplina = 'nome da disciplina';

--7.Filtrar alunos formados.
SELECT *FROM alunos
INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
WHERE matriculas.status = 'formado';

--8.Filtrar alunos ativos.
SELECT *FROM alunos
INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
WHERE matriculas.status = 'ativo';

--9.Apresentar a quantidade de alunos ativos por curso.
SELECT cursos.nome_curso, COUNT(*) as quantidade_alunos_ativosFROM cursos
INNER JOIN matriculas ON cursos.id_curso = matriculas.id_curso
WHERE matriculas.status = 'ativo'
GROUP BY cursos.nome_curso;

--10.Apresentar a quantidade de alunos ativos por disciplina.
SELECT disciplinas.nome_disciplina, COUNT(*) as quantidade_alunos_ativosFROM disciplinas
INNER JOIN matrículas_disciplinas ON disciplinas.id_disciplina = matrículas_disciplinas.id_disciplina
INNER JOIN matriculas ON matrículas_disciplinas.ra = matriculas.ra
WHERE matriculas.status = 'ativo'
GROUP BY disciplinas.nome_disciplina;
