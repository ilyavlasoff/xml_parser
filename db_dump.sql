--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-2.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- Name: articles; Type: TABLE; Schema: public; Owner: xmluser
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title text,
    link text,
    description text,
    author character varying(100),
    category character varying(100),
    pubdate timestamp without time zone,
    guid text
);


ALTER TABLE public.articles OWNER TO xmluser;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: xmluser
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO xmluser;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmluser
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: cpu; Type: TABLE; Schema: public; Owner: xmluser
--

CREATE TABLE public.cpu (
    id integer NOT NULL,
    title text,
    link text,
    description text,
    author character varying(100),
    category character varying(100),
    pubdate timestamp without time zone,
    guid text
);


ALTER TABLE public.cpu OWNER TO xmluser;

--
-- Name: cpu_id_seq; Type: SEQUENCE; Schema: public; Owner: xmluser
--

CREATE SEQUENCE public.cpu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cpu_id_seq OWNER TO xmluser;

--
-- Name: cpu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmluser
--

ALTER SEQUENCE public.cpu_id_seq OWNED BY public.cpu.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: xmluser
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title text,
    link text,
    description text,
    author character varying(100),
    category character varying(100),
    pubdate timestamp without time zone,
    guid text
);


ALTER TABLE public.news OWNER TO xmluser;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: xmluser
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO xmluser;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmluser
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: xmluser
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: cpu id; Type: DEFAULT; Schema: public; Owner: xmluser
--

ALTER TABLE ONLY public.cpu ALTER COLUMN id SET DEFAULT nextval('public.cpu_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: xmluser
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: xmluser
--

COPY public.articles (id, title, link, description, author, category, pubdate, guid) FROM stdin;
\.


--
-- Data for Name: cpu; Type: TABLE DATA; Schema: public; Owner: xmluser
--

COPY public.cpu (id, title, link, description, author, category, pubdate, guid) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: xmluser
--

COPY public.news (id, title, link, description, author, category, pubdate, guid) FROM stdin;
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmluser
--

SELECT pg_catalog.setval('public.articles_id_seq', 450, true);


--
-- Name: cpu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmluser
--

SELECT pg_catalog.setval('public.cpu_id_seq', 150, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmluser
--

SELECT pg_catalog.setval('public.news_id_seq', 100, true);


--
-- PostgreSQL database dump complete
--

