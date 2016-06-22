--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: maloka; Tablespace: 
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nombre character varying(50),
    estado character(1)
);


ALTER TABLE categoria OWNER TO maloka;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: maloka
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_seq OWNER TO maloka;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maloka
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- Name: cuenta; Type: TABLE; Schema: public; Owner: maloka; Tablespace: 
--

CREATE TABLE cuenta (
    id integer NOT NULL,
    saldo integer,
    fecha_creacion date,
    numero_cuenta character varying(30),
    estado character(1),
    id_usuario integer
);


ALTER TABLE cuenta OWNER TO maloka;

--
-- Name: cuenta_id_seq; Type: SEQUENCE; Schema: public; Owner: maloka
--

CREATE SEQUENCE cuenta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cuenta_id_seq OWNER TO maloka;

--
-- Name: cuenta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maloka
--

ALTER SEQUENCE cuenta_id_seq OWNED BY cuenta.id;


--
-- Name: item; Type: TABLE; Schema: public; Owner: maloka; Tablespace: 
--

CREATE TABLE item (
    id integer NOT NULL,
    titulo character varying(500),
    descripcion character varying(800),
    costo integer,
    imagen character varying(1000),
    negociable character(1),
    estado character(1),
    id_categoria integer
);


ALTER TABLE item OWNER TO maloka;

--
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: maloka
--

CREATE SEQUENCE item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_id_seq OWNER TO maloka;

--
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maloka
--

ALTER SEQUENCE item_id_seq OWNED BY item.id;


--
-- Name: parametro; Type: TABLE; Schema: public; Owner: maloka; Tablespace: 
--

CREATE TABLE parametro (
    id integer NOT NULL,
    campo character varying(30),
    valor character varying(50),
    descripcion character varying(500)
);


ALTER TABLE parametro OWNER TO maloka;

--
-- Name: parametros_id_seq; Type: SEQUENCE; Schema: public; Owner: maloka
--

CREATE SEQUENCE parametros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parametros_id_seq OWNER TO maloka;

--
-- Name: parametros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maloka
--

ALTER SEQUENCE parametros_id_seq OWNED BY parametro.id;


--
-- Name: transaccion; Type: TABLE; Schema: public; Owner: maloka; Tablespace: 
--

CREATE TABLE transaccion (
    id integer NOT NULL,
    cuenta_origen character varying(30),
    cuenta_destino character varying(30),
    monto integer,
    fecha_operacion date,
    id_item integer,
    id_cuenta integer
);


ALTER TABLE transaccion OWNER TO maloka;

--
-- Name: transaccion_id_seq; Type: SEQUENCE; Schema: public; Owner: maloka
--

CREATE SEQUENCE transaccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transaccion_id_seq OWNER TO maloka;

--
-- Name: transaccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maloka
--

ALTER SEQUENCE transaccion_id_seq OWNED BY transaccion.id;


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: maloka
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO maloka;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: maloka; Tablespace: 
--

CREATE TABLE usuario (
    id integer DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    paterno character varying(30),
    materno character varying(30),
    nombres character varying(30),
    email character varying(30),
    celular integer,
    ubicacion character varying(100),
    estado character(1)
);


ALTER TABLE usuario OWNER TO maloka;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY cuenta ALTER COLUMN id SET DEFAULT nextval('cuenta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY parametro ALTER COLUMN id SET DEFAULT nextval('parametros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY transaccion ALTER COLUMN id SET DEFAULT nextval('transaccion_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: maloka
--

COPY categoria (id, nombre, estado) FROM stdin;
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maloka
--

SELECT pg_catalog.setval('categoria_id_seq', 1, false);


--
-- Data for Name: cuenta; Type: TABLE DATA; Schema: public; Owner: maloka
--

COPY cuenta (id, saldo, fecha_creacion, numero_cuenta, estado, id_usuario) FROM stdin;
\.


--
-- Name: cuenta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maloka
--

SELECT pg_catalog.setval('cuenta_id_seq', 1, false);


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: maloka
--

COPY item (id, titulo, descripcion, costo, imagen, negociable, estado, id_categoria) FROM stdin;
\.


--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maloka
--

SELECT pg_catalog.setval('item_id_seq', 1, false);


--
-- Data for Name: parametro; Type: TABLE DATA; Schema: public; Owner: maloka
--

COPY parametro (id, campo, valor, descripcion) FROM stdin;
1	salario_minimo	450	Es el salario minimo nacional
3	deuda_max	0,5	Es la capacidad maxima de endeudamiento con relacion al salario minimo nacional
4	acumulacion_max	1	Es la capacidad maxima de acumulacion de saldo
6	e	\N	\N
5	tiempo_max_no_uso_item	6	Es el tiempo maximo de no hacer uso de un item. Tiempo en meses. Pasado este tiempo el item podria ser dado de baja.
\.


--
-- Name: parametros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maloka
--

SELECT pg_catalog.setval('parametros_id_seq', 6, true);


--
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: maloka
--

COPY transaccion (id, cuenta_origen, cuenta_destino, monto, fecha_operacion, id_item, id_cuenta) FROM stdin;
\.


--
-- Name: transaccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maloka
--

SELECT pg_catalog.setval('transaccion_id_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: maloka
--

COPY usuario (id, paterno, materno, nombres, email, celular, ubicacion, estado) FROM stdin;
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maloka
--

SELECT pg_catalog.setval('usuario_id_seq', 1, false);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: maloka; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: cuenta_pkey; Type: CONSTRAINT; Schema: public; Owner: maloka; Tablespace: 
--

ALTER TABLE ONLY cuenta
    ADD CONSTRAINT cuenta_pkey PRIMARY KEY (id);


--
-- Name: item_pkey; Type: CONSTRAINT; Schema: public; Owner: maloka; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: parametro_pkey; Type: CONSTRAINT; Schema: public; Owner: maloka; Tablespace: 
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametro_pkey PRIMARY KEY (id);


--
-- Name: transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: maloka; Tablespace: 
--

ALTER TABLE ONLY transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: maloka; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: cuenta_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY cuenta
    ADD CONSTRAINT cuenta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: item_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES categoria(id);


--
-- Name: transaccion_id_cuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY transaccion
    ADD CONSTRAINT transaccion_id_cuenta_fkey FOREIGN KEY (id_cuenta) REFERENCES cuenta(id);


--
-- Name: transaccion_id_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: maloka
--

ALTER TABLE ONLY transaccion
    ADD CONSTRAINT transaccion_id_item_fkey FOREIGN KEY (id_item) REFERENCES item(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

