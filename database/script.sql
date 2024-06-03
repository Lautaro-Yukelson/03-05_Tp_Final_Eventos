--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-06-03 10:36:13

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
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: event_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    display_order integer
);


ALTER TABLE public.event_categories OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16402)
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
-- TOC entry 217 (class 1259 OID 16403)
-- Name: event_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer NOT NULL,
    description text NOT NULL,
    registration_date_time timestamp without time zone NOT NULL,
    attended boolean NOT NULL,
    observations text,
    rating integer NOT NULL
);


ALTER TABLE public.event_enrollments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16408)
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
-- TOC entry 219 (class 1259 OID 16409)
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
-- TOC entry 220 (class 1259 OID 16414)
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
-- TOC entry 221 (class 1259 OID 16415)
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16418)
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
-- TOC entry 223 (class 1259 OID 16419)
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
-- TOC entry 224 (class 1259 OID 16424)
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
-- TOC entry 225 (class 1259 OID 16425)
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
-- TOC entry 226 (class 1259 OID 16430)
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
-- TOC entry 227 (class 1259 OID 16431)
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
-- TOC entry 228 (class 1259 OID 16436)
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
-- TOC entry 229 (class 1259 OID 16437)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16440)
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
-- TOC entry 231 (class 1259 OID 16441)
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
-- TOC entry 232 (class 1259 OID 16446)
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
-- TOC entry 4843 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencias', 1);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (2, 'Talleres', 2);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (3, 'Seminarios', 3);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (4, 'Webinars', 4);


--
-- TOC entry 4845 (class 0 OID 16403)
-- Dependencies: 217
-- Data for Name: event_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 'Interesado en nuevas tecnologías', '2024-06-01 10:00:00', true, 'Muy informativo', 5);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (2, 2, 2, 'Quiero aprender a programar', '2024-06-05 11:00:00', true, 'Excelente taller', 4);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, 'Interesado en salud', '2024-06-10 12:00:00', false, 'No pude asistir', 3);
INSERT INTO public.event_enrollments OVERRIDING SYSTEM VALUE VALUES (4, 4, 4, 'Interesado en finanzas', '2024-06-15 13:00:00', true, 'Muy útil', 5);


--
-- TOC entry 4847 (class 0 OID 16409)
-- Dependencies: 219
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Centro de Convenciones', 'Calle Falsa 123', 500, -34.6037, -58.3816, 1);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Sala de Conferencias', 'Calle Real 456', 200, -34.6118, -58.4173, 2);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Auditorio Central', 'Av. Siempreviva 789', 300, -34.6090, -58.3900, 3);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (4, 4, 'Espacio Cultural', 'Boulevard Ficticio 1011', 100, -34.6158, -58.4333, 4);


--
-- TOC entry 4849 (class 0 OID 16415)
-- Dependencies: 221
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (2, 1, 3);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (3, 2, 1);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (4, 3, 2);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (5, 4, 4);


--
-- TOC entry 4851 (class 0 OID 16419)
-- Dependencies: 223
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencia de Tecnología', 'Una conferencia sobre los últimos avances en tecnología.', 1, 1, '2024-06-01 10:00:00', 90, 50, true, 100, 1, 100);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (2, 'Taller de Programación', 'Un taller práctico para aprender a programar.', 2, 2, '2024-06-05 11:00:00', 120, 30, true, 50, 2, 100);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (3, 'Seminario de Salud', 'Un seminario sobre la importancia de la salud.', 3, 3, '2024-06-10 12:00:00', 60, 20, true, 75, 3, 100);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (4, 'Webinar de Finanzas', 'Un webinar sobre la gestión de finanzas personales.', 4, 4, '2024-06-15 13:00:00', 45, 0, true, 150, 4, 100);


--
-- TOC entry 4853 (class 0 OID 16425)
-- Dependencies: 225
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (1, 'Buenos Aires', 1, -34.6037, -58.3816);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (2, 'Córdoba', 2, -31.4201, -64.1888);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (3, 'Rosario', 3, -32.9442, -60.6505);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (4, 'Mendoza', 4, -32.8894, -68.8458);


--
-- TOC entry 4855 (class 0 OID 16431)
-- Dependencies: 227
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (1, 'BA', 'Buenos Aires', -34.6037, -58.3816, 1);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (2, 'CD', 'Córdoba', -31.4201, -64.1888, 2);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (3, 'RS', 'Rosario', -32.9442, -60.6505, 3);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (4, 'MD', 'Mendoza', -32.8894, -68.8458, 4);


--
-- TOC entry 4857 (class 0 OID 16437)
-- Dependencies: 229
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (1, 'Tecnología');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (2, 'Salud');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (3, 'Innovación');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (4, 'Finanzas');


--
-- TOC entry 4859 (class 0 OID 16441)
-- Dependencies: 231
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 'Juan', 'Pérez', 'juanp@gmail.com', 'password123');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 'María', 'García', 'mariag@gmail.com', 'password123');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (3, 'Carlos', 'López', 'carlosl@gmail.com', 'password123');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (4, 'Ana', 'Martínez', 'anam@gmail.com', 'password123');


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 216
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_categories_id_seq', 1, false);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 218
-- Name: event_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_enrollments_id_seq', 1, false);


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 220
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_locations_id_seq', 1, false);


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 222
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 1, false);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 224
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 226
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 228
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 230
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 232
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4675 (class 2606 OID 16460)
-- Name: event_categories event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 16448)
-- Name: event_enrollments event_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 16462)
-- Name: event_locations event_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 16464)
-- Name: event_tags event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 16450)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 16452)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 16454)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 16456)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 16458)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4692 (class 2606 OID 16465)
-- Name: event_enrollments fk_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_event FOREIGN KEY (id_event) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- TOC entry 4695 (class 2606 OID 16500)
-- Name: event_tags fk_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_event FOREIGN KEY (id_event) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- TOC entry 4697 (class 2606 OID 16475)
-- Name: events fk_event_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_category FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id);


--
-- TOC entry 4698 (class 2606 OID 16480)
-- Name: events fk_event_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_location FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id);


--
-- TOC entry 4694 (class 2606 OID 16485)
-- Name: event_locations fk_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT fk_location FOREIGN KEY (id_location) REFERENCES public.locations(id);


--
-- TOC entry 4699 (class 2606 OID 16490)
-- Name: locations fk_province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_province FOREIGN KEY (id_province) REFERENCES public.provinces(id);


--
-- TOC entry 4696 (class 2606 OID 16495)
-- Name: event_tags fk_tag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_tag FOREIGN KEY (id_tag) REFERENCES public.tags(id);


--
-- TOC entry 4693 (class 2606 OID 16470)
-- Name: event_enrollments fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2024-06-03 10:36:13

--
-- PostgreSQL database dump complete
--

