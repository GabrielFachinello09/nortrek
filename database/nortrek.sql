--
-- PostgreSQL database dump
--

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: carrinho; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carrinho (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer DEFAULT 1 NOT NULL,
    adicionado_em timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT carrinho_quantidade_check CHECK ((quantidade > 0))
);

--
-- Name: carrinho_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carrinho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.carrinho_id_seq OWNED BY public.carrinho.id;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(255) NOT NULL,
    telefone character varying(20),
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    perfil character varying(20) DEFAULT 'cliente'::character varying NOT NULL
);

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;

--
-- Name: produtos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    marca character varying(60),
    categoria character varying(50),
    descricao text,
    preco numeric(10,2) NOT NULL,
    estoque integer DEFAULT 0 NOT NULL,
    avaliacao numeric(2,1),
    imagem character varying(255),
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT produtos_avaliacao_check CHECK (((avaliacao >= (0)::numeric) AND (avaliacao <= (5)::numeric)))
);

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;

--
-- Name: carrinho id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carrinho ALTER COLUMN id SET DEFAULT nextval('public.carrinho_id_seq'::regclass);

--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);

--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);

--
-- Data for Name: carrinho; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carrinho (id, cliente_id, produto_id, quantidade, adicionado_em) FROM stdin;
\.

--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clientes (id, nome, email, senha, telefone, criado_em, perfil) FROM stdin;
1	Ana Souza	ana.souza@exemplo.com	$2y$12$ExemploHashSenhaAdmin123456789	(19) 98888-1111	2026-10-13 09:00:00.000000	admin
2	Carlos Silva	carlos.silva@exemplo.com	$2y$12$ExemploHashSenhaCliente987654321	(19) 97777-2222	2026-10-13 09:30:00.000000	cliente
\.

--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produtos (id, nome, marca, categoria, descricao, preco, estoque, avaliacao, imagem, criado_em) FROM stdin;
1	Barraca Expedition 4 Pessoas	Expedition	barracas	Barraca de montagem rápida com estrutura em alumínio, janelas com tela mosquiteira e sobreteto impermeável.	899.90	8	4.7	prod_6ac52a6f2610a.jpg	2026-10-13 10:24:18.458993
2	Mochila Cargueira Expedition 65L	Expedition	mochilas	Mochila cargueira de 65 litros com barrigueira acolchoada, porta-garrafa lateral e costas ventiladas.	549.90	15	4.8	prod_6ac52bb2e3ce1.jpg	2026-10-13 10:24:18.458993
3	Lanterna de Cabeça Expedition 1000 Lumens	Expedition	iluminacao	Lanterna de cabeça em LED com 1000 lúmens, alça elástica ajustável e corpo resistente a respingos.	129.90	30	4.6	prod_6ac52d4c91c06.jpg	2026-10-13 10:24:18.458993
\.

--
-- Name: carrinho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carrinho_id_seq', 1, false);

--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clientes_id_seq', 2, true);

--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produtos_id_seq', 3, true);

--
-- Name: carrinho carrinho_cliente_id_produto_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_cliente_id_produto_id_key UNIQUE (cliente_id, produto_id);

--
-- Name: carrinho carrinho_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_pkey PRIMARY KEY (id);

--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);

--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);

--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);

--
-- Name: carrinho carrinho_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;

--
-- Name: carrinho carrinho_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON DELETE CASCADE;

--
-- PostgreSQL database dump complete
--
