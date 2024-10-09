drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from pizzas;

alter table pizzas add column custo decimal(15,2);

update pizzas set custo = valor * 0.60;


-- selecionar pizzas com valor > q $17,00
select * from pizzas where valor > 17;

-- selecionar tabelas com valor > ou = $17,00
select * from pizzas where valor >= 17;

-- valor inferior a 17
select * from pizzas where valor < 17;

-- valor = 17
select * from pizzas where valor = 17;

-- diferente de 17
select	*	from pizzas where valor != 17;
select	*	from pizzas where valor <> 17;

-- pizzas com valor nuulo
select * from pizzas where valor is null;

-- pizzas com valor +15 e -20
select * from pizzas where valor >15 and valor <20;

-- pizzas com valores maior e menor que 17
select * from pizzas where valor < 17 or valor > 17;

-- valores não maior ou não menor que 17
select * from pizzas where not (valor < 17 or valor > 17);

--  todas as pizzas com valores na faixa de 17 a 20,00
select * from pizzas where valor >= 17 and valor <=20;
select * from pizzas where valor between 17 and 20;

-- selecionar pizzas com valores fora da faixa de 17 e 20
select * from pizzas where not (valor < 17 or valor > 20);
select * from pizzas where valor not between 17 and 20;
select * from pizzas where not valor (valor >=17 and valor <=20);

-- valores iguais a 15 e 20
select * from pizzas where valor = 15 or valor = 20;
select * from pizzas where valor in (15, 20);

-- valores diferentes de 15 e 20
select * from pizzas where valor != 15 and valor != 20;
select * from pizzas where valor not in (15,20);

-- pizza com  valor nulo
select * from pizzas where valor is not null;

-- pizzas que comecem com a Letra E
select * from pizzas where nome like 'e%';

-- pizzas que terminam com a letra A
select * from pizzas where nome like '%a';

-- pizzas com nome que tenha letra 'a'
select * from pizzas where nome like '%a';

-- cláusula order by
-- order by <coluna 1> [asc/desc], <coluna n> [asc/desc];


-- listar colunas da tabela pizza em ordem alfabética crescente;
select * from pizzas order by nome asc;

-- listar pizzas em ordem decrescente 
select * from pizzas order by nome desc;

-- listar nome e valor das pizzas em ordem decrescente
select * from pizzas order by valor desc, nome asc;

-- limite de exibição
select * from pizzas where valor > 17 limit 2;

-- selecionar apenas valores distintos (diferentes)
select distinct valor from pizzas order by valor;

/* - COUNT -> contar numero de linhas
   - AVG (coluna) -> média dos valores da coluna
   - MAX (coluna) -> maior valor da coluna
   - MIN (coluna) -> menor valor da coluna
   - SUM (coluna) -> soma dos valores da coluna    */
    
  
  -- contar quantas pizzas
    select count(*) from pizzas;
    select count(nome) from pizzas;
    select count(valor) from pizzas;
    
    -- qual é a média do valor das pizzas?
    select avg(valor) as media from pizzas;
    select avg(valor) as media from pizzas where nome like '%esa';
    
    
    
    -- Qual é o valor da pizza mais cara do cardápio da pizzaria?
    select max(valor) from pizzas;
    
    -- Qual é o velor da pizza mais barata do cardápio da pizzaria?
    select min(valor) from pizzas;
    
    -- Qual é o valor total do pedido número 7?
    select sum(valor) from itens_pedido where pedido_id = 7;
    
    select pedido_id as pedido, sum(valor) as 'valor pedido' from itens_pedido group by pedido_id;
    
    select pedido_id as pedido, sum(valor) as 'valor pedido', avg(quantidade) as 'qtde pizzas', avg(valor) as media, sum(valor) / sum(quantidade) as 'valor medio'
    from itens_pedido group by pedido_id;
    
    
    
    
   -- união de tabelas
   
   -- Na dúvida colocar o inner join - se precisar troque 

   -- inner join (mais usado) = retorn registros quando há pelo menos uma correspondência em ambas tabelas
    select * from clientes as c inner join pedidos as pedidos on pedidos.cliente_id = clientes.id;
    
    
    -- left join (algo q não exista) --> retorna os registros da tabela da esquerda (1° tabela mencionada) e os registros correspondem a segunda tabela da direita (2° tabela mencionada)
    select clientes.id as id_clientes, nome, telefone, pedidos.id as pedido, valor from clientes left join pedidos on pedidos.cliente_id = clientes.id;
    
    
    -- right join --> retorna todos os registros da tablea da direita(2° tabela)
    select clientes.id as id_cliente, nome, telefone, pedidos.id as pedido, valor from clientes right join pedidos on pedidos.cliente_id = clientes.id;
    
    
    -- quantidade de pedidos realizados por cliente, exibir nome e quantidade de pedidos
    select nome, telefone, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by nome, telefone;
    
    
    
    -- quantos pedidos foram feitos no total?
    select count(pedido_id) from itens_pedido where pedido_id;
    
    -- quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
    select nome, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id group by 'Alexandre Santos';
    
    -- Qual o valor total de todos os pedidos feitos até agora?
    select sum(valor) from itens_pedido where pedido_id;
    
    
    --  ATIVIDADES  -////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    -- QUESTÃO 1      -->  Liste todos os pedidos com o nome do cliente correspondente.
    select * from pedidos;
    select clientes.nome, pedidos.id as pedido from pedidos inner join clientes on pedidos.cliente_id = clientes.id;
    

   -- QUESTÃO 2  -->      Quantos pedidos foram feitos no total?
   select count(*) from itens_pedido;
   
   -- QUESTÃO 3    -->  Liste os pedidos feitos após '2016-12-15' com o nome do cliente.
    select * from pedidos;
    select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos inner join clientes on pedidos.cliente_id = clientes.id where data > '2016-12-15';
    
    -- QUESTÃO 4  -->  Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
       select nome, count(pedidos.id) from clientes left join pedidos on clientes.id = pedidos.cliente_id where nome = 'Alexandre Santos' group by nome;
       
    -- QUESTÃO 5  -->  Liste todos os pedidos e seus respectivos clientes, incluindo pedidos feitos por clientes  que foram excluídos da tabela clientes                                                                   
	select nome, count(pedidos.id) from clientes inner join pedidos on clientes.id = pedidos.cliente_id group by valor;

    -- QUESTÃO 6   -->   Qual o valor total de todos os pedidos feitos até agora?
	select sum(valor) from itens_pedido where pedido_id;
    
    -- QUESTÃO 7  -->   Qual o total gasto por cada cliente?
     select clientes.id as id_clientes, nome, valor from clientes right join pedidos on pedidos.cliente_id = clientes.id;
    
    -- QUESTÃO 8
       select clientes.nome, pedidos.id as pedido, pedidos.data, pedidos.valor from clientes inner join pedidos on 
       pedidos.cliente_id = clientes.id where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';
       
       -- QUESTÃO 9
       select avg(valor) as media from pedidos;
       
     -- QUESTÃO 10
	select clientes.id, clientes.nome, sum(valor) as valor_total from pedidos right join clientes on clientes.id = pedidos.cliente_id group by clientes.id, clientes.nome;
    
    -- QUESTÃO 11
       select * from itens_pedido;
       select max(valor) from itens_pedido;
      
    -- QUESTÃO 12
       select min(valor) from itens_pedido;
    
    -- QUESTÃO 13
        select pedidos.id as clientes, nome, pedidos.id as pedido from clientes left join pedidos on pedidos.cliente_id = clientes.id;
    
    -- QUESTÃO 14
       select pedidos.id as clientes, nome, pedidos.id as pedido, max(valor) from clientes left join pedidos on pedidos.cliente_id = clientes.id;
       select * from pedidos;
       select * from clientes;
       
    -- QUESTÃO 15
       select count(distinct pedido_id) as total_pedidos, avg(quantidade) as media_pizzas from itens_pedido;
    
    -- QUESTÃO 16
    select * from itens_pedido;
    select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedido from itens_pedido inner join pedidos on itens_pedido.pedido_id = pedidos.id 
    inner join clientes on pedidos.cliente_id = clientes.id where clientes.nome = 'Bruna Dantas';
    
    -- QUESTÃO 17
    select pedidos.id as clientes, nome, pedidos.id as pedido, max(valor), min(valor) from clientes left join 
    pedidos on pedidos.cliente_id = clientes.id where clientes.nome = 'Laura Madureira';
    
     -- QUESTÃO 18
    select clientes.nome, sum(quantidade) as total_pizzas from itens_pedido inner join pedidos on itens_pedido.pedido_id = pedidos.id
    inner join clientes on pedidos.cliente_id = clientes.id
    group by clientes.nome;
    select * from pedidos;
    
    -- QUESTÃO 19
    select pedidos.id as clientes, nome, pedidos.id as pedido, min(valor) from clientes left join pedidos on pedidos.cliente_id = clientes.id;
    
    -- QUESTÃO 20
    select clientes.nome, count(pedidos.id) as total_pedidos from pedidos right join clientes on clientes.id group by clientes.id, clientes.nome;
    
    -- QUESTÃO 21
    
    -- QUESTÃO 22
    select nome, pedidos.id as pedido, pedidos.valor from clientes inner join pedidos on pedidos.cliente_id = clientes.id order by valor desc limit 3;
    
    
    
    
    
