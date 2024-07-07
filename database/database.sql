--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-07 17:22:06

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

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 18139)
-- Name: event_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    display_order integer
);


ALTER TABLE public.event_categories OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18144)
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
-- TOC entry 217 (class 1259 OID 18145)
-- Name: event_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer NOT NULL,
    description text,
    registration_date_time timestamp without time zone DEFAULT now() NOT NULL,
    attended boolean DEFAULT false NOT NULL,
    observations text,
    rating integer
);


ALTER TABLE public.event_enrollments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18150)
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
-- TOC entry 219 (class 1259 OID 18151)
-- Name: event_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying NOT NULL,
    full_address character varying NOT NULL,
    max_capacity integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    id_creator_user integer NOT NULL
);


ALTER TABLE public.event_locations OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18156)
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
-- TOC entry 221 (class 1259 OID 18157)
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18160)
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
-- TOC entry 223 (class 1259 OID 18161)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    id_event_category integer NOT NULL,
    id_event_location integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    duration_in_minutes integer NOT NULL,
    price double precision NOT NULL,
    enabled_for_enrollment boolean NOT NULL,
    max_assistance integer NOT NULL,
    id_creator_user integer NOT NULL,
    max_capacity integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18166)
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
-- TOC entry 225 (class 1259 OID 18167)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying NOT NULL,
    id_province integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18172)
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
-- TOC entry 227 (class 1259 OID 18173)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying NOT NULL,
    full_name character varying NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    display_order integer
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18178)
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
-- TOC entry 229 (class 1259 OID 18179)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18184)
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
-- TOC entry 231 (class 1259 OID 18185)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18190)
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
-- TOC entry 4899 (class 0 OID 18139)
-- Dependencies: 215
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_categories (id, name, display_order) FROM stdin;
1	Conferencias	1
2	Talleres	2
3	Seminarios	3
4	Webinars	4
\.


--
-- TOC entry 4901 (class 0 OID 18145)
-- Dependencies: 217
-- Data for Name: event_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) FROM stdin;
2	2	2	Quiero aprender a programar	2024-06-05 11:00:00	t	Excelente taller	4
3	3	3	Interesado en salud	2024-06-10 12:00:00	f	No pude asistir	3
4	4	4	Interesado en finanzas	2024-06-15 13:00:00	t	Muy útil	5
\.


--
-- TOC entry 4903 (class 0 OID 18151)
-- Dependencies: 219
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) FROM stdin;
1	1	Centro de Convenciones	Calle Falsa 123	500	-34.6037	-58.3816	1
2	2	Sala de Conferencias	Calle Real 456	200	-34.6118	-58.4173	2
3	3	Auditorio Central	Av. Siempreviva 789	300	-34.6090	-58.3900	3
4	4	Espacio Cultural	Boulevard Ficticio 1011	100	-34.6158	-58.4333	4
\.


--
-- TOC entry 4905 (class 0 OID 18157)
-- Dependencies: 221
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_tags (id, id_event, id_tag) FROM stdin;
1	1	1
2	1	3
3	2	1
4	3	2
5	4	4
\.


--
-- TOC entry 4907 (class 0 OID 18161)
-- Dependencies: 223
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user, max_capacity) FROM stdin;
1	Conferencia de Tecnología	Una conferencia sobre los últimos avances en tecnología.	1	1	2024-12-12 00:00:00	90	50	t	100	1	100
2	Taller de Programación	Un taller práctico para aprender a programar.	2	2	2024-12-12 00:00:00	120	30	t	50	2	100
3	Seminario de Salud	Un seminario sobre la importancia de la salud.	3	3	2024-12-12 00:00:00	60	20	t	75	3	100
4	Webinar de Finanzas	Un webinar sobre la gestión de finanzas personales.	4	4	2024-12-12 00:00:00	45	0	t	150	4	100
5	Confera de logía	Una conferencia sobre las últimas tendencias en tecnología.	2	1	2024-12-12 00:00:00	120	50	t	100	150	\N
\.


--
-- TOC entry 4909 (class 0 OID 18167)
-- Dependencies: 225
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, id_province, latitude, longitude) FROM stdin;
1	Buenos Aires	1	-34.6037	-58.3816
2	Córdoba	2	-31.4201	-64.1888
3	Rosario	3	-32.9442	-60.6505
4	Mendoza	4	-32.8894	-68.8458
\.


--
-- TOC entry 4911 (class 0 OID 18173)
-- Dependencies: 227
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, name, full_name, latitude, longitude, display_order) FROM stdin;
1	BA	Buenos Aires	-34.6037	-58.3816	1
2	CD	Córdoba	-31.4201	-64.1888	2
3	RS	Rosario	-32.9442	-60.6505	3
4	MD	Mendoza	-32.8894	-68.8458	4
\.


--
-- TOC entry 4913 (class 0 OID 18179)
-- Dependencies: 229
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name) FROM stdin;
1	Tecnología
2	Salud
3	Innovación
4	Finanzas
\.


--
-- TOC entry 4915 (class 0 OID 18185)
-- Dependencies: 231
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, username, password) FROM stdin;
1	Juan	Pérez	juanp@gmail.com	password123
2	María	García	mariag@gmail.com	password123
3	Carlos	López	carlosl@gmail.com	password123
4	Ana	Martínez	anam@gmail.com	password123
5	Lautaro	Yukelson	lautiyuke@gmail.com	lauti123
\.


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 216
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_categories_id_seq', 4, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_enrollments_id_seq', 5, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 220
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_locations_id_seq', 4, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 222
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 5, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 224
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 5, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 226
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 4, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 228
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 4, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 230
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 4, true);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 232
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 4731 (class 2606 OID 18192)
-- Name: event_categories event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 18194)
-- Name: event_enrollments event_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 18196)
-- Name: event_locations event_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 18198)
-- Name: event_tags event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 18200)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 18202)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 18204)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 18206)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 18208)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4748 (class 2606 OID 18209)
-- Name: event_enrollments fk_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_event FOREIGN KEY (id_event) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- TOC entry 4751 (class 2606 OID 18214)
-- Name: event_tags fk_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_event FOREIGN KEY (id_event) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- TOC entry 4753 (class 2606 OID 18219)
-- Name: events fk_event_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_category FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id);


--
-- TOC entry 4754 (class 2606 OID 18224)
-- Name: events fk_event_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_location FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id);


--
-- TOC entry 4750 (class 2606 OID 18229)
-- Name: event_locations fk_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT fk_location FOREIGN KEY (id_location) REFERENCES public.locations(id);


--
-- TOC entry 4755 (class 2606 OID 18234)
-- Name: locations fk_province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_province FOREIGN KEY (id_province) REFERENCES public.provinces(id);


--
-- TOC entry 4752 (class 2606 OID 18239)
-- Name: event_tags fk_tag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_tag FOREIGN KEY (id_tag) REFERENCES public.tags(id);


--
-- TOC entry 4749 (class 2606 OID 18244)
-- Name: event_enrollments fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2024-07-07 17:22:06

--
-- PostgreSQL database dump complete
--

