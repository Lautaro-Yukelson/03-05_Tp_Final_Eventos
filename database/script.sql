--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-12 22:34:12

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16474)
-- Name: event_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.event_categories OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16473)
-- Name: event_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.event_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16420)
-- Name: event_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer NOT NULL,
    description integer,
    registration_date_time timestamp without time zone NOT NULL,
    attended boolean NOT NULL,
    observations character varying(255),
    rating integer NOT NULL
);


ALTER TABLE public.event_enrollments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16427)
-- Name: event_enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.event_enrollments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16465)
-- Name: event_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying(25) NOT NULL,
    full_address character(50) NOT NULL,
    max_capacity integer NOT NULL,
    latitude character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    id_creator_user integer NOT NULL
);


ALTER TABLE public.event_locations OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16464)
-- Name: event_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.event_locations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16435)
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16434)
-- Name: event_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.event_tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description character varying(255),
    id_event_location integer NOT NULL,
    start_date date NOT NULL,
    duration_in_minutes integer,
    price integer NOT NULL,
    enabled_for_enrollment boolean NOT NULL,
    max_assistance integer NOT NULL,
    id_creator_user integer NOT NULL,
    id_event_category integer NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16419)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.events ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16482)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    id_province integer NOT NULL,
    latitude integer NOT NULL,
    longitude integer NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16481)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.locations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16490)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    full_name character varying(200) NOT NULL,
    latitude integer NOT NULL,
    longitude integer NOT NULL,
    display_order integer
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16489)
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.provinces ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16441)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16440)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16449)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    username character varying(25) NOT NULL,
    password character varying(25) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16448)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4902 (class 0 OID 16474)
-- Dependencies: 228
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencia', 1);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (2, 'Taller', 2);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (3, 'Seminario', 3);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (4, 'Curso', 4);


--
-- TOC entry 4891 (class 0 OID 16420)
-- Dependencies: 217
-- Data for Name: event_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, NULL, '2024-05-15 10:00:00', true, NULL, 5);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (2, 2, 2, NULL, '2024-05-16 14:00:00', true, NULL, 4);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, NULL, '2024-05-17 09:30:00', false, NULL, 0);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (4, 1, 4, NULL, '2024-05-15 10:05:00', true, NULL, 3);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (5, 2, 5, NULL, '2024-05-16 14:10:00', true, NULL, 5);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (6, 3, 6, NULL, '2024-05-17 09:35:00', false, NULL, 0);


--
-- TOC entry 4900 (class 0 OID 16465)
-- Dependencies: 226
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Salón de Eventos A', 'Calle 123, Ciudad                                 ', 100, '-34.6037', '-58.3816', 1);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Centro de Convenciones B', 'Avenida Principal 456, Ciudad                     ', 150, '-34.6118', '-58.4173', 2);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Auditorio C', 'Calle Principal 789, Ciudad                       ', 80, '-34.6155', '-58.5734', 3);


--
-- TOC entry 4894 (class 0 OID 16435)
-- Dependencies: 220
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (3, 2, 2);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (4, 3, 3);


--
-- TOC entry 4889 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencia de Marketing', 'Aprende sobre las últimas tendencias de marketing.', 1, '2024-05-15', 90, 100, true, 100, 1, 1);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (2, 'Taller de Diseño Gráfico', 'Desarrolla tus habilidades en diseño gráfico.', 2, '2024-05-16', 120, 150, true, 150, 2, 2);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (3, 'Seminario de Programación', 'Descubre las nuevas tecnologías en el mundo de la programación.', 3, '2024-05-17', 180, 200, true, 80, 3, 3);


--
-- TOC entry 4904 (class 0 OID 16482)
-- Dependencies: 230
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (1, 'Ciudad A', 3, -35, -58);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (2, 'Ciudad B', 3, -35, -58);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (3, 'Ciudad C', 3, -35, -59);


--
-- TOC entry 4906 (class 0 OID 16490)
-- Dependencies: 232
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (2, 'Ciudad Autónoma de Buenos Aires', 'Ciudad Autónoma de Buenos Aires', -35, -58, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (3, 'Buenos Aires', 'Provincia de Buenos Aires', -37, -61, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (4, 'Catamarca', 'Provincia de Catamarca', -27, -67, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (5, 'Córdoba', 'Provincia de Córdoba', -32, -64, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (6, 'Corrientes', 'Provincia de Corrientes', -29, -58, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (7, 'Chaco', 'Provincia del Chaco', -26, -61, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (8, 'Chubut', 'Provincia del Chubut', -44, -69, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (9, 'Entre Ríos', 'Provincia de Entre Ríos', -32, -59, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (10, 'Formosa', 'Provincia de Formosa', -25, -60, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (11, 'Jujuy', 'Provincia de Jujuy', -23, -66, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (12, 'La Pampa', 'Provincia de La Pampa', -37, -65, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (13, 'La Rioja', 'Provincia de La Rioja', -30, -67, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (14, 'Mendoza', 'Provincia de Mendoza', -35, -69, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (15, 'Misiones', 'Provincia de Misiones', -27, -55, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (16, 'Neuquén', 'Provincia del Neuquén', -39, -70, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (17, 'Río Negro', 'Provincia de Río Negro', -40, -67, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (18, 'Salta', 'Provincia de Salta', -24, -65, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (19, 'San Juan', 'Provincia de San Juan', -31, -69, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (20, 'San Luis', 'Provincia de San Luis', -34, -66, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (21, 'Santa Cruz', 'Provincia de Santa Cruz', -49, -70, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (22, 'Santa Fe', 'Provincia de Santa Fe', -31, -61, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (23, 'Santiago del Estero', 'Provincia de Santiago del Estero', -28, -63, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (24, 'Tucumán', 'Provincia de Tucumán', -27, -65, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (25, 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 'Provincia de Tierra del Fuego, Antártida e Islas del Atlántico Sur', -83, -51, NULL);


--
-- TOC entry 4896 (class 0 OID 16441)
-- Dependencies: 222
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (1, 'Marketing');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (2, 'Diseño');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (3, 'Programación');


--
-- TOC entry 4898 (class 0 OID 16449)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 'Juan', 'Pérez', 'juanperez', 'contraseña1');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 'María', 'Gómez', 'mariagomez', 'contraseña2');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (3, 'Luis', 'López', 'luislopez', 'contraseña3');


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 227
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_categories_id_seq', 4, true);


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_enrollments_id_seq', 6, true);


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 225
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_locations_id_seq', 3, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 219
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 4, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 216
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 3, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 229
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 3, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 231
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 25, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 221
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 3, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 4741 (class 2606 OID 16480)
-- Name: event_categories event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 16426)
-- Name: event_enrollments event_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 16471)
-- Name: event_locations event_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 16439)
-- Name: event_tags event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 16416)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16488)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16496)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 16447)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 16455)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2024-05-12 22:34:12

--
-- PostgreSQL database dump complete
--

