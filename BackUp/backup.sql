--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-12 17:11:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 243 (class 1255 OID 73902)
-- Name: adduserandgrantrole(text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.adduserandgrantrole(IN username text, IN userpassword text, IN userfunc text)
    LANGUAGE plpgsql
    AS $$	
DECLARE 
	grantRole text; 
BEGIN 

	grantRole := 'role_' || userFunc; 

	 -- Cria um usuário no PostgreSQL com o nome e senha fornecidos
    EXECUTE format('CREATE USER %I WITH PASSWORD %L', userName, userPassword);

    -- Concede permissões com base na função (role)
    EXECUTE format('GRANT %I TO %I', grantRole, userName);

	  IF userFunc IN ('gerente', 'admin') THEN
        EXECUTE format('ALTER USER %I CREATEROLE', userName);
    END IF;
	
END; 
$$;


ALTER PROCEDURE public.adduserandgrantrole(IN username text, IN userpassword text, IN userfunc text) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 41032)
-- Name: adduserandgrantrole(integer, text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.adduserandgrantrole(IN userid integer, IN username text, IN userpassword text, IN userfunc text)
    LANGUAGE plpgsql
    AS $$	
DECLARE 
	grantRole text; 
BEGIN 

	grantRole := 'role_' || userFunc; 
	INSERT INTO tb_usuarios (userId, nome, senha, funcao ) values (DEFAULT, userName, userPassword, userFunc ); 
 	
	 -- Cria um usuário no PostgreSQL com o nome e senha fornecidos
    EXECUTE format('CREATE USER %I WITH PASSWORD %L', userName, userPassword);

    -- Concede permissões com base na função (role)
    EXECUTE format('GRANT %I TO %I', grantRole, userName);

	  IF userFunc IN ('gerente', 'admin') THEN
        EXECUTE format('ALTER USER %I CREATEROLE', userName);
    END IF;
	
END; 
$$;


ALTER PROCEDURE public.adduserandgrantrole(IN userid integer, IN username text, IN userpassword text, IN userfunc text) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 73903)
-- Name: adduserandgrantrole(text, text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.adduserandgrantrole(IN username text, IN usercpf text, IN userpassword text, IN userfunc text)
    LANGUAGE plpgsql
    AS $$	
DECLARE 
	grantRole text; 
BEGIN 

	grantRole := 'role_' || userFunc; 
	INSERT INTO tb_funcionarios (fun_codigo, fun_nome, fun_cpf, fun_senha, fun_funcao) values
	(DEFAULT, userName, userCpf, userPassword, userFunc ); 

	 -- Cria um usuário no PostgreSQL com o nome e senha fornecidos
    EXECUTE format('CREATE USER %I WITH PASSWORD %L', userName, userPassword);

    -- Concede permissões com base na função (role)
    EXECUTE format('GRANT %I TO %I', grantRole, userName);

	  IF userFunc IN ('gerente', 'admin') THEN
        EXECUTE format('ALTER USER %I CREATEROLE', userName);
    END IF;
	
END; 
$$;


ALTER PROCEDURE public.adduserandgrantrole(IN username text, IN usercpf text, IN userpassword text, IN userfunc text) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 73822)
-- Name: adduserandgrantrole(integer, text, text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.adduserandgrantrole(IN usercodigo integer, IN username text, IN usercpf text, IN userpassword text, IN userfunc text)
    LANGUAGE plpgsql
    AS $$	
DECLARE 
	grantRole text; 
BEGIN 

	grantRole := 'role_' || userFunc; 
	INSERT INTO tb_funcionarios (fun_codigo, fun_nome, fun_cpf, fun_senha, fun_funcao) values (userCodigo, userName, userCpf, userPassword, userFunc ); 
 	
	 -- Cria um usuário no PostgreSQL com o nome e senha fornecidos
    EXECUTE format('CREATE USER %I WITH PASSWORD %L', userName, userPassword);

    -- Concede permissões com base na função (role)
    EXECUTE format('GRANT %I TO %I WITH ADMIN OPTION', grantRole, userName);

	  IF userFunc IN ('gerente', 'admin') THEN
        EXECUTE format('ALTER USER %I CREATEROLE', userName);
    END IF;
	
END; 
$$;


ALTER PROCEDURE public.adduserandgrantrole(IN usercodigo integer, IN username text, IN usercpf text, IN userpassword text, IN userfunc text) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 73820)
-- Name: addvenda(integer, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.addvenda(p_total integer, funcionario_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    venda_id INTEGER;
BEGIN
	INSERT INTO tb_vendas VALUES (DEFAULT, NOW(), p_total, funcionario_id) RETURNING ven_codigo INTO venda_id;
    
    RETURN venda_id;

END;
$$;


ALTER FUNCTION public.addvenda(p_total integer, funcionario_id bigint) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 73819)
-- Name: addvenda(bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.addvenda(p_total bigint, funcionario_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    venda_id INTEGER;
BEGIN
	INSERT INTO tb_vendas VALUES (DEFAULT, NOW(), p_total, funcionario_id) RETURNING ven_codigo INTO venda_id;
    
    RETURN venda_id;

END;
$$;


ALTER FUNCTION public.addvenda(p_total bigint, funcionario_id bigint) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 73821)
-- Name: addvenda(numeric, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.addvenda(p_total numeric, funcionario_id bigint) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    venda_id INTEGER;
BEGIN
	INSERT INTO tb_vendas VALUES (DEFAULT, NOW(), p_total, funcionario_id) RETURNING ven_codigo INTO venda_id;
    
    RETURN venda_id;

END;
$$;


ALTER FUNCTION public.addvenda(p_total numeric, funcionario_id bigint) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 73916)
-- Name: editarusuario(integer, text, text, text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.editarusuario(IN usercodigo integer, IN newuser text, IN usercpf text, IN usersenha text, IN userfunc text, IN revoke_func text)
    LANGUAGE plpgsql
    AS $$ 
DECLARE
    role_func TEXT;
    role_revoke TEXT;
    currentUser TEXT; -- Variável para armazenar o nome atual do usuário
BEGIN
        -- Definição das variáveis com concatenação
        role_func := 'role_' || userFunc;
        role_revoke := 'role_' || revoke_func;

        -- Obtém o nome atual do usuário da tabela tb_funcionarios
        SELECT fun_nome INTO currentUser
        FROM tb_funcionarios
        WHERE fun_codigo = userCodigo;

        -- Atualizando informações nas tabelas
        UPDATE tb_funcionarios 
        SET fun_nome = newUser, 
            fun_cpf = userCpf, 
            fun_senha = userSenha, 
            fun_funcao = userFunc 
        WHERE fun_codigo = userCodigo; 

        -- Modifica o nome do usuário no PostgreSQL, se necessário
        IF currentUser <> newUser THEN
            EXECUTE format('ALTER ROLE %I RENAME TO %I', currentUser, newUser);  
            currentUser := newUser; -- Atualiza a variável currentUser
        END IF;

        -- Modificando privilégios 
        IF role_func <> role_revoke THEN
            EXECUTE format('REVOKE %I FROM %I', role_revoke, currentUser); -- Revoga a função antiga
            EXECUTE format('GRANT %I TO %I', role_func, currentUser); -- Concede a nova função
        END IF;

    EXCEPTION
        WHEN OTHERS THEN
            -- Em caso de erro, desfaz a transação
            
            -- Relança a exceção para que o chamador saiba que houve um erro
            RAISE EXCEPTION 'Erro durante a execução da transação: %', SQLERRM;
  
END; 
$$;


ALTER PROCEDURE public.editarusuario(IN usercodigo integer, IN newuser text, IN usercpf text, IN usersenha text, IN userfunc text, IN revoke_func text) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 57384)
-- Name: finalizarcompra(bigint, integer, double precision, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.finalizarcompra(idprod bigint, qtd integer, valorparcial double precision, funid bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE 
    valorTotal DOUBLE PRECISION := qtd * valorParcial;
    venCodigo BIGINT;
BEGIN
    -- Atualizar a quantidade do produto no estoque
    UPDATE tb_produtos 
    SET pro_quantidade = pro_quantidade - qtd 
    WHERE pro_codigo = idProd; 

    -- Inserir a venda e capturar o ID gerado
    INSERT INTO tb_vendas (data_venda, valor_total, fun_id)
    VALUES (NOW(), valorTotal, funId)
    RETURNING ven_codigo INTO venCodigo;

    -- Retornar o código da venda inserida
    RETURN venCodigo;
END; 
$$;


ALTER FUNCTION public.finalizarcompra(idprod bigint, qtd integer, valorparcial double precision, funid bigint) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 41051)
-- Name: removeruser(integer, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.removeruser(IN userid integer, IN username text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    EXECUTE format('DROP USER IF EXISTS %I', userName);
    EXECUTE format('DELETE FROM tb_funcionarios WHERE fun_codigo = %L', userId);

END;
$$;


ALTER PROCEDURE public.removeruser(IN userid integer, IN username text) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 24689)
-- Name: validar_cpf(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_cpf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Verifica se o CPF tem exatamente 11 caracteres ou se é composto apenas por zeros
    IF LENGTH(NEW.fun_cpf) <> 11 OR NEW.fun_cpf = '00000000000' THEN
        RAISE EXCEPTION 'CPF inválido!';
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.validar_cpf() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 73888)
-- Name: tb_fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_fornecedores (
    for_codigo bigint NOT NULL,
    for_descricao character varying(45)
);


ALTER TABLE public.tb_fornecedores OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 73887)
-- Name: tb_fornecedores_for_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_fornecedores_for_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_fornecedores_for_codigo_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_fornecedores_for_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_fornecedores_for_codigo_seq OWNED BY public.tb_fornecedores.for_codigo;


--
-- TOC entry 226 (class 1259 OID 73895)
-- Name: tb_funcionarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_funcionarios (
    fun_codigo bigint NOT NULL,
    fun_nome character varying(45),
    fun_cpf character varying(45),
    fun_senha character varying(45),
    fun_funcao character varying(45)
);


ALTER TABLE public.tb_funcionarios OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 73894)
-- Name: tb_funcionarios_fun_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_funcionarios_fun_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_funcionarios_fun_codigo_seq OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_funcionarios_fun_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_funcionarios_fun_codigo_seq OWNED BY public.tb_funcionarios.fun_codigo;


--
-- TOC entry 222 (class 1259 OID 57363)
-- Name: tb_itens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_itens (
    ite_codigo bigint NOT NULL,
    ite_quantidade integer,
    ite_valor_parcial numeric(7,2),
    tb_produtos_pro_codigo bigint,
    tb_vendas_ven_codigo bigint
);


ALTER TABLE public.tb_itens OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 57362)
-- Name: tb_itens_ite_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_itens_ite_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_itens_ite_codigo_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_itens_ite_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_itens_ite_codigo_seq OWNED BY public.tb_itens.ite_codigo;


--
-- TOC entry 218 (class 1259 OID 49201)
-- Name: tb_produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_produtos (
    pro_codigo bigint NOT NULL,
    pro_descricao character varying(45),
    pro_valor numeric(7,2),
    pro_quantidade integer,
    tb_fornecedor_for_codigo bigint
);


ALTER TABLE public.tb_produtos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49200)
-- Name: tb_produtos_pro_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_produtos_pro_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_produtos_pro_codigo_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_produtos_pro_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_produtos_pro_codigo_seq OWNED BY public.tb_produtos.pro_codigo;


--
-- TOC entry 220 (class 1259 OID 57351)
-- Name: tb_vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_vendas (
    ven_codigo bigint NOT NULL,
    ven_horario timestamp without time zone,
    ven_valor_total numeric(7,2),
    tb_funcionarios_fun_codigo bigint
);


ALTER TABLE public.tb_vendas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 57350)
-- Name: tb_vendas_ven_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_vendas_ven_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tb_vendas_ven_codigo_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_vendas_ven_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_vendas_ven_codigo_seq OWNED BY public.tb_vendas.ven_codigo;


--
-- TOC entry 4776 (class 2604 OID 73891)
-- Name: tb_fornecedores for_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_fornecedores ALTER COLUMN for_codigo SET DEFAULT nextval('public.tb_fornecedores_for_codigo_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 73898)
-- Name: tb_funcionarios fun_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_funcionarios ALTER COLUMN fun_codigo SET DEFAULT nextval('public.tb_funcionarios_fun_codigo_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 57366)
-- Name: tb_itens ite_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_itens ALTER COLUMN ite_codigo SET DEFAULT nextval('public.tb_itens_ite_codigo_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 49204)
-- Name: tb_produtos pro_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_produtos ALTER COLUMN pro_codigo SET DEFAULT nextval('public.tb_produtos_pro_codigo_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 57354)
-- Name: tb_vendas ven_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vendas ALTER COLUMN ven_codigo SET DEFAULT nextval('public.tb_vendas_ven_codigo_seq'::regclass);


--
-- TOC entry 4942 (class 0 OID 73888)
-- Dependencies: 224
-- Data for Name: tb_fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_fornecedores (for_codigo, for_descricao) FROM stdin;
\.


--
-- TOC entry 4944 (class 0 OID 73895)
-- Dependencies: 226
-- Data for Name: tb_funcionarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_funcionarios (fun_codigo, fun_nome, fun_cpf, fun_senha, fun_funcao) FROM stdin;
1	juan	12345678910	12345	admin
8	maria	74185296365	123	gerente
13	carlos	15987463212	123	funcionario
15	postgres	12345678910	root	admin
\.


--
-- TOC entry 4940 (class 0 OID 57363)
-- Dependencies: 222
-- Data for Name: tb_itens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_itens (ite_codigo, ite_quantidade, ite_valor_parcial, tb_produtos_pro_codigo, tb_vendas_ven_codigo) FROM stdin;
38	3	16.50	10	35
39	5	50.00	9	35
40	4	22.00	10	36
41	4	40.00	9	36
42	4	22.00	10	37
43	1	10.00	9	37
44	5	27.50	10	38
45	1	5.50	10	39
46	1	5.50	10	40
47	1	5.50	10	40
48	3	16.50	10	41
49	3	30.00	9	41
50	3	10.00	9	42
51	3	5.50	10	42
52	5	10.00	9	43
53	3	10.00	9	43
54	2	10.00	9	44
55	2	5.50	10	44
56	3	5.50	10	45
57	3	10.00	9	45
58	5	5.50	10	46
59	3	10.00	9	46
60	4	10.00	9	47
61	3	5.50	10	47
62	3	5.50	10	48
63	5	5.50	10	49
64	3	5.50	10	50
65	3	10.00	9	51
66	3	5.50	10	52
67	3	10.00	9	53
68	3	10.00	9	54
69	3	5.50	10	55
70	3	5.50	10	56
71	1	10.00	9	57
72	1	10.00	9	58
73	1	5.50	10	59
74	1	5.50	10	60
75	3	25.00	9	61
76	3	15.00	10	61
77	3	15.00	10	62
78	2	25.00	9	62
\.


--
-- TOC entry 4936 (class 0 OID 49201)
-- Dependencies: 218
-- Data for Name: tb_produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_produtos (pro_codigo, pro_descricao, pro_valor, pro_quantidade, tb_fornecedor_for_codigo) FROM stdin;
10	chocolate	15.00	3	2
9	brahma	25.00	18	1
\.


--
-- TOC entry 4938 (class 0 OID 57351)
-- Dependencies: 220
-- Data for Name: tb_vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_vendas (ven_codigo, ven_horario, ven_valor_total, tb_funcionarios_fun_codigo) FROM stdin;
35	2025-02-10 22:38:26.313427	299.50	1
36	2025-02-10 22:49:40.195206	248.00	1
37	2025-02-10 22:51:51.971834	98.00	1
38	2025-02-10 22:53:14.946815	137.50	1
39	2025-02-10 22:54:10.53044	5.50	1
40	2025-02-10 22:55:03.993537	11.00	1
41	2025-02-10 22:56:01.917866	139.50	1
42	2025-02-10 23:02:31.147157	46.50	1
43	2025-02-10 23:03:07.081401	80.00	1
44	2025-02-10 23:03:24.610301	31.00	1
45	2025-02-11 00:21:33.686201	46.50	1
46	2025-02-11 00:29:36.129394	57.50	1
47	2025-02-11 00:29:36.849427	56.50	8
48	2025-02-11 00:33:11.10981	16.50	8
49	2025-02-11 00:33:12.712186	27.50	1
50	2025-02-11 00:43:39.108986	16.50	1
51	2025-02-11 00:43:40.240558	30.00	8
52	2025-02-11 00:44:20.04262	16.50	1
53	2025-02-11 00:44:39.458346	30.00	8
54	2025-02-11 00:44:48.66394	30.00	1
55	2025-02-11 00:47:49.484267	16.50	8
56	2025-02-11 00:47:50.133761	16.50	1
57	2025-02-11 00:48:33.10047	10.00	1
58	2025-02-11 00:48:32.170395	10.00	8
59	2025-02-11 00:57:36.082247	5.50	1
60	2025-02-11 00:57:36.792737	5.50	8
61	2025-02-12 00:09:18.033921	120.00	1
62	2025-02-12 01:15:12.906264	95.00	1
\.


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 223
-- Name: tb_fornecedores_for_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_fornecedores_for_codigo_seq', 1, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 225
-- Name: tb_funcionarios_fun_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_funcionarios_fun_codigo_seq', 15, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 221
-- Name: tb_itens_ite_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_itens_ite_codigo_seq', 78, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 217
-- Name: tb_produtos_pro_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_produtos_pro_codigo_seq', 11, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 219
-- Name: tb_vendas_ven_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_vendas_ven_codigo_seq', 62, true);


--
-- TOC entry 4785 (class 2606 OID 73893)
-- Name: tb_fornecedores tb_fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_fornecedores
    ADD CONSTRAINT tb_fornecedores_pkey PRIMARY KEY (for_codigo);


--
-- TOC entry 4787 (class 2606 OID 73900)
-- Name: tb_funcionarios tb_funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_funcionarios
    ADD CONSTRAINT tb_funcionarios_pkey PRIMARY KEY (fun_codigo);


--
-- TOC entry 4783 (class 2606 OID 57368)
-- Name: tb_itens tb_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_itens
    ADD CONSTRAINT tb_itens_pkey PRIMARY KEY (ite_codigo);


--
-- TOC entry 4779 (class 2606 OID 49206)
-- Name: tb_produtos tb_produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_produtos
    ADD CONSTRAINT tb_produtos_pkey PRIMARY KEY (pro_codigo);


--
-- TOC entry 4781 (class 2606 OID 57356)
-- Name: tb_vendas tb_vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_vendas
    ADD CONSTRAINT tb_vendas_pkey PRIMARY KEY (ven_codigo);


--
-- TOC entry 4788 (class 2606 OID 57369)
-- Name: tb_itens tb_itens_tb_produtos_pro_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_itens
    ADD CONSTRAINT tb_itens_tb_produtos_pro_codigo_fkey FOREIGN KEY (tb_produtos_pro_codigo) REFERENCES public.tb_produtos(pro_codigo);


--
-- TOC entry 4789 (class 2606 OID 57374)
-- Name: tb_itens tb_itens_tb_vendas_ven_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_itens
    ADD CONSTRAINT tb_itens_tb_vendas_ven_codigo_fkey FOREIGN KEY (tb_vendas_ven_codigo) REFERENCES public.tb_vendas(ven_codigo);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE tb_fornecedores; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_fornecedores TO role_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_fornecedores TO role_gerente;


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 223
-- Name: SEQUENCE tb_fornecedores_for_codigo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.tb_fornecedores_for_codigo_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.tb_fornecedores_for_codigo_seq TO role_gerente;


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE tb_funcionarios; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_funcionarios TO role_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_funcionarios TO role_gerente;


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 225
-- Name: SEQUENCE tb_funcionarios_fun_codigo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.tb_funcionarios_fun_codigo_seq TO role_admin;
GRANT SELECT,USAGE ON SEQUENCE public.tb_funcionarios_fun_codigo_seq TO role_gerente;


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE tb_itens; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_itens TO role_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_itens TO role_gerente;
GRANT SELECT,INSERT ON TABLE public.tb_itens TO role_funcionario;


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQUENCE tb_itens_ite_codigo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_itens_ite_codigo_seq TO role_funcionario;
GRANT ALL ON SEQUENCE public.tb_itens_ite_codigo_seq TO role_admin;
GRANT ALL ON SEQUENCE public.tb_itens_ite_codigo_seq TO role_gerente;


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE tb_produtos; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.tb_produtos TO role_gerente;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_produtos TO role_fornecedores;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_produtos TO role_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_produtos TO role_funcionario;


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE tb_produtos_pro_codigo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_produtos_pro_codigo_seq TO role_fornecedores;


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE tb_vendas; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_vendas TO role_admin;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tb_vendas TO role_gerente;
GRANT INSERT ON TABLE public.tb_vendas TO role_funcionario;


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE tb_vendas_ven_codigo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_vendas_ven_codigo_seq TO role_admin;
GRANT ALL ON SEQUENCE public.tb_vendas_ven_codigo_seq TO role_gerente;
GRANT SELECT,USAGE ON SEQUENCE public.tb_vendas_ven_codigo_seq TO role_funcionario;


-- Completed on 2025-02-12 17:12:48

--
-- PostgreSQL database dump complete
--

