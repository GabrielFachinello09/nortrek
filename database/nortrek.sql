--
-- PostgreSQL database dump
--

\restrict MybcMezjm0W9aejVDdfqIWtaNCvgVJLtkKXzBl3B5zUJimngJyhQp00l5rCGtfx

-- Dumped from database version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)

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


--
-- Name: carrinho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

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


--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

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


--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

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
2	Carlos Silva	carlos.silva@exemplo.com	$2y$12$ExemploHashSenhaCliente987654321	(19) 97777-2222	2026-10-13 09:30:00	cliente
1	Ana Souza	ana.souza@exemplo.com	$2y$12$ExemploHashSenhaAdmin123456789	(19) 98888-1111	2026-10-13 09:00:00	cliente
3	lee young ji	leeYoungJi@leeYoungJi.com	$2y$12$iBooBZBma6zaT8qea0CBZu4/9e1zKIKRTNncB7CWhL7tjwNGEyyPO	(19) 99999-9999	2026-10-13 12:04:42.300074	cliente
4	narin 	narin@narin.com	$2y$12$6gQebWRdNfUfI7NkrNuBXOKYFuiajx2h1oKrAkgoh6se9NK8fwHy6	(19) 99999-9999	2026-10-13 12:20:14.157188	cliente
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produtos (id, nome, marca, categoria, descricao, preco, estoque, avaliacao, imagem, criado_em) FROM stdin;
1	Mochila Cargueira Expedition 65L	Expedition	mochilas	Mochila cargueira de 65 litros com barrigueira acolchoada, porta-garrafa lateral e costas ventiladas.	549.90	15	4.8	prod_6ac52bb2e3ce1.jpg	2026-10-13 12:22:34.424834
2	Lanterna de Cabeça Expedition 1000 Lumens	Expedition	iluminacao	Lanterna de cabeça em LED com 1000 lúmens, alça elástica ajustável e corpo resistente a respingos.	129.90	30	4.6	prod_6ac52d4c91c06.jpg	2026-10-13 12:22:34.424834
3	Fogareiro Portátil a Gás Expedition	Expedition	cozinha	Fogareiro compacto com acendimento rápido e suporte dobrável, acoplado diretamente ao cartucho de gás.	189.90	20	4.5	prod_6ac52e165656d.jpg	2026-10-13 12:22:34.424834
4	Jaqueta Corta-Vento Impermeável	Nortrek	vestuario	Jaqueta anorak com capuz ajustável, bolso canguru e tecido impermeável respirável.	399.90	12	4.7	prod_6ac52fdc16856.jpg	2026-10-13 12:22:34.424834
5	Canivete Multifuncional 15 Funções	Nortrek	acessorios	Canivete em aço inox com lâmina, serra, tesoura, abridor e saca-rolhas, cabo emborrachado verde.	149.90	25	4.8	prod_6ac53314aa246.jpg	2026-10-13 12:22:34.424834
6	Bota de Trekking Camuflada	Nortrek	trilhas	Bota de cano alto com solado Vibram de alta aderência, couro resistente e forro impermeável.	699.90	10	4.9	prod_6ac5369b30a3b.jpg	2026-10-13 12:22:34.424834
7	Saco de Dormir Thermo 5°C	Nortrek	camping	Saco de dormir tipo envelope com conforto térmico até 5°C e capuz ajustável.	279.90	18	4.6	prod_6ac537e58f5f4.jpg	2026-10-13 12:22:34.424834
8	Jogo de Panelas Camping 5 Peças	Nortrek	cozinha	Kit com panelas e frigideiras antiaderentes de alumínio com tampas de vidro, leve para acampamento.	329.90	9	4.4	prod_6ac53a576ff1f.jpg	2026-10-13 12:22:34.424834
9	Par de Bastões de Caminhada	Nortrek	trilhas	Bastões telescópicos de alumínio com empunhadura em cortiça e travas rápidas.	219.90	22	4.7	prod_6ac53aa096d18.jpg	2026-10-13 12:22:34.424834
10	Isolante Térmico EVA Aluminizado	Nortrek	camping	Colchonete isolante enrolável com face aluminizada, ideal para usar sob o saco de dormir.	89.90	40	4.3	prod_6ac53adf0815d.jpg	2026-10-13 12:22:34.424834
11	Garrafa Térmica Inox 1L	Eco-Flow	equipamentos	Garrafa térmica de aço inox com tampa-copo e alça, mantém a temperatura por até 24 horas.	159.90	28	4.8	prod_6ac53caed3f22.jpg	2026-10-13 12:22:34.424834
12	Garrafa com Filtro Purificador	Nortrek	equipamentos	Garrafa portátil com filtro que purifica água de rios e fontes, com mosquetão para prender na mochila.	199.90	16	4.5	prod_6ac53dc98e7f3.jpg	2026-10-13 12:22:34.424834
\.


--
-- Name: carrinho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carrinho_id_seq', 1, false);


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clientes_id_seq', 4, true);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produtos_id_seq', 12, true);


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

\unrestrict MybcMezjm0W9aejVDdfqIWtaNCvgVJLtkKXzBl3B5zUJimngJyhQp00l5rCGtfx

