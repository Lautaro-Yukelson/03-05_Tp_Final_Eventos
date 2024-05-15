--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-05-13 18:31:15

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

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    display_order integer NOT NULL
);


ALTER TABLE public.event_categories OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17030)
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
-- TOC entry 217 (class 1259 OID 17031)
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
-- TOC entry 218 (class 1259 OID 17034)
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
-- TOC entry 219 (class 1259 OID 17035)
-- Name: event_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying(250) NOT NULL,
    full_address character(500) NOT NULL,
    max_capacity integer NOT NULL,
    latitude character varying(500) NOT NULL,
    longitude character varying(500) NOT NULL,
    id_creator_user integer NOT NULL
);


ALTER TABLE public.event_locations OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17038)
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
-- TOC entry 221 (class 1259 OID 17039)
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17042)
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
-- TOC entry 223 (class 1259 OID 17043)
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
-- TOC entry 224 (class 1259 OID 17046)
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
-- TOC entry 225 (class 1259 OID 17047)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    id_province integer NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17052)
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
-- TOC entry 227 (class 1259 OID 17053)
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
-- TOC entry 228 (class 1259 OID 17056)
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
-- TOC entry 229 (class 1259 OID 17057)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17060)
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
-- TOC entry 231 (class 1259 OID 17061)
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
-- TOC entry 232 (class 1259 OID 17064)
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
-- TOC entry 4889 (class 0 OID 17027)
-- Dependencies: 215
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencia', 1);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (2, 'Taller', 2);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (3, 'Seminario', 3);
INSERT INTO public.event_categories OVERRIDING SYSTEM VALUE VALUES (4, 'Curso', 4);


--
-- TOC entry 4891 (class 0 OID 17031)
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
-- TOC entry 4893 (class 0 OID 17035)
-- Dependencies: 219
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (4, 7, 'Carhué', 'Carhué                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 150, '-37.179481506347656', '-62.75999069213867', 2);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (5, 8, 'Colonia San Miguel Arcángel', 'Colonia San Miguel Arcángel                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 100, '-37.44901657104492', '-63.117156982421875', 3);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (6, 9, 'Delfín Huer', 'Delfín Huer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 80, '-37.32110595703125', '-63.2343864440918', 4);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (7, 10, 'Espartillar', 'Espartillar                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 120, '-37.3574104309082', '-62.43838119506836', 5);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (8, 11, 'Esteban Agustín Gascón', 'Esteban Agustín Gascón                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 90, '-37.45583724975586', '-63.254310607910156', 6);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (9, 12, 'La Pala', 'La Pala                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 70, '-36.66392135620117', '-63.3664665222168', 7);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (10, 13, 'Maza', 'Maza                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 100, '-36.800315856933594', '-63.33928298950195', 8);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (11, 14, 'Rivera', 'Rivera                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 80, '-37.16059494018555', '-63.241790771484375', 9);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (12, 15, 'Villa Margarita', 'Villa Margarita                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', 150, '-37.46135330200195', '-63.24217224121094', 10);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (3, 6, 'Ciudad de Buenos Aires', 'Ciudad de Buenos Aires                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 200, '-34.60841751098633', '-58.372135162353516', 1);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (13, 16, 'Adolfo Gonzales Chaves', 'Adolfo Gonzales Chaves                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 120, '-38.032371520996094', '-60.09939193725586', 11);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (14, 17, 'De La Garma', 'De La Garma                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 100, '-37.9665412902832', '-60.416786193847656', 12);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (15, 18, 'Juan E. Barra', 'Juan E. Barra                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 80, '-37.820037841796875', '-60.4820556640625', 13);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (16, 19, 'Vásquez', 'Vásquez                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 70, '-38.17580032348633', '-60.16979217529297', 14);
INSERT INTO public.event_locations OVERRIDING SYSTEM VALUE VALUES (17, 20, 'Alberti', 'Alberti                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 90, '-35.03157424926758', '-60.2802848815918', 15);


--
-- TOC entry 4895 (class 0 OID 17039)
-- Dependencies: 221
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (3, 2, 2);
INSERT INTO public.event_tags OVERRIDING SYSTEM VALUE VALUES (4, 3, 3);


--
-- TOC entry 4897 (class 0 OID 17043)
-- Dependencies: 223
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencia de Marketing', 'Aprende sobre las últimas tendencias de marketing.', 1, '2024-05-15', 90, 100, true, 100, 1, 1);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (2, 'Taller de Diseño Gráfico', 'Desarrolla tus habilidades en diseño gráfico.', 2, '2024-05-16', 120, 150, true, 150, 2, 2);
INSERT INTO public.events OVERRIDING SYSTEM VALUE VALUES (3, 'Seminario de Programación', 'Descubre las nuevas tecnologías en el mundo de la programación.', 3, '2024-05-17', 180, 200, true, 80, 3, 3);


--
-- TOC entry 4899 (class 0 OID 17047)
-- Dependencies: 225
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (6, 'Ciudad de Buenos Aires', 2, -34.60841751098633, -58.372135162353516);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (7, 'Carhué', 6, -37.179481506347656, -62.75999069213867);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (8, 'Colonia San Miguel Arcángel', 6, -37.44901657104492, -63.117156982421875);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (9, 'Delfín Huer', 6, -37.32110595703125, -63.2343864440918);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (10, 'Espartillar', 6, -37.3574104309082, -62.43838119506836);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (11, 'Esteban Agustín Gascón', 6, -37.45583724975586, -63.254310607910156);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (12, 'La Pala', 6, -36.66392135620117, -63.3664665222168);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (13, 'Maza', 6, -36.800315856933594, -63.33928298950195);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (14, 'Rivera', 6, -37.16059494018555, -63.241790771484375);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (15, 'Villa Margarita', 6, -37.46135330200195, -63.24217224121094);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (16, 'Adolfo nzales Chaves', 6, -38.032371520996094, -60.09939193725586);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (17, 'De La Garma', 6, -37.9665412902832, -60.416786193847656);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (18, 'Juan E. Barra', 6, -37.820037841796875, -60.4820556640625);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (19, 'Vásquez', 6, -38.17580032348633, -60.16979217529297);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (20, 'Alberti', 6, -35.03157424926758, -60.2802848815918);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (21, 'Coronel Seguí', 6, -34.86743927001953, -60.39297103881836);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (22, 'Mechita', 6, -35.067386627197266, -60.40342712402344);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (23, 'Pla', 6, -35.122894287109375, -60.22191619873047);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (24, 'Villa Grisolía', 6, -35.11000061035156, -60.07021713256836);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (25, 'Villa María', 6, -34.88822555541992, -60.34748077392578);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (26, 'Villa Ortiz', 6, -34.84453582763672, -60.30630111694336);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (27, 'Almirante Brown', 6, -34.79801559448242, -58.38433074951172);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (28, 'Avellaneda', 6, -34.66269302368164, -58.36516571044922);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (29, 'Ayacucho', 6, -37.15275955200195, -58.488380432128906);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (30, 'La Constancia', 6, -37.22634506225586, -58.76010513305664);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (31, 'Solanet', 6, -36.84287643432617, -58.5081672668457);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (32, 'Udaquiola', 6, -36.5623664855957, -58.53469467163086);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (33, 'Ariel', 6, -36.53142166137695, -59.9217529296875);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (34, 'Azul', 6, -36.77744674682617, -59.863441467285156);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (35, 'Cacharí', 6, -36.37667465209961, -59.50460433959961);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (36, 'Chillar', 6, -37.31280517578125, -59.985164642333984);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (37, '16 de Julio', 6, -37.20051574707031, -60.16465377807617);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (38, 'Bahía Blanca', 6, -38.71760559082031, -62.265445709228516);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (39, 'Cabildo', 6, -38.48515319824219, -61.89375305175781);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (40, 'General Daniel Cerri', 6, -38.719364166259766, -62.39530944824219);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (41, 'Balcarce', 6, -37.84638214111328, -58.255489349365234);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (42, 'Los Pinos', 6, -37.942710876464844, -58.324275970458984);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (43, 'Napaleofú', 6, -37.623069763183594, -58.746368408203125);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (44, 'Ramos Otero', 6, -37.5408935546875, -58.340606689453125);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (45, 'San Agustín', 6, -38.01411056518555, -58.355934143066406);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (46, 'Villa Laguna La Brava', 6, -37.86122131347656, -57.98101043701172);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (47, 'Baradero', 6, -33.807071685791016, -59.502227783203125);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (48, 'Irineo Portela', 6, -33.97983169555664, -59.67012023925781);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (49, 'Santa Coloma', 6, -34.06087112426758, -59.56021499633789);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (50, 'Villa Alsina', 6, -33.90766143798828, -59.390647888183594);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (51, 'Arrecifes', 6, -34.0675163269043, -60.10869216918945);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (52, 'Todd', 6, -34.03355407714844, -60.155269622802734);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (53, 'Viña', 6, -33.99237823486328, -60.226417541503906);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (54, 'Barker', 6, -37.6396598815918, -59.39112854003906);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (55, 'Benito Juárez', 6, -37.674285888671875, -59.804805755615234);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (56, 'López', 6, -37.55228042602539, -59.62776565551758);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (57, 'Tedín Uriburu', 6, -37.36427307128906, -59.76020431518555);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (58, 'Villa Cacique', 6, -37.67622375488281, -59.39618682861328);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (59, 'Berazategui', 6, -34.76979064941406, -58.22614288330078);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (60, 'Berisso', 6, -34.867462158203125, -57.888648986816406);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (61, 'Hale', 6, -36.0020637512207, -60.855491638183594);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (62, 'Juan F. Ibarra', 6, -36.34714889526367, -61.25403594970703);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (63, 'Paula', 6, -36.503570556640625, -61.02482986450195);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (64, 'Pirovano', 6, -36.51015853881836, -61.555519104003906);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (65, 'San Carlos de Bolívar', 6, -36.22987747192383, -61.11391830444336);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (66, 'Urdampilleta', 6, -36.431617736816406, -61.420101165771484);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (67, 'Villa Lynch Pueyrredón', 6, -36.601531982421875, -61.36366653442383);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (68, 'Bragado', 6, -35.11556625366211, -60.48965072631836);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (69, 'Comodoro Py', 6, -35.32255554199219, -60.52138137817383);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (70, 'General O''Brien', 6, -34.905609130859375, -60.760501861572266);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (71, 'Irala', 6, -34.77020263671875, -60.69102096557617);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (72, 'La Limpia', 6, -35.08009719848633, -60.591190338134766);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (73, 'Juan F. Salaberry', 6, -35.061614990234375, -60.70475387573242);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (74, 'Mechita', 6, -35.07337951660156, -60.41181564331055);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (75, 'Olascoaga', 6, -35.237396240234375, -60.6110725402832);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (76, 'Warnes', 6, -34.910133361816406, -60.5389518737793);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (77, 'Altamirano', 6, -35.361000061035156, -58.15115737915039);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (78, 'Barrio Las londrinas', 6, -35.0011100769043, -58.13054656982422);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (79, 'Barrio Los Bosquecitos', 6, -35.10377502441406, -58.18486785888672);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (80, 'Barrio Parque Las Acacias', 6, -35.09857940673828, -58.27725601196289);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (81, 'Coronel Brandsen', 6, -35.16796112060547, -58.23733139038086);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (82, 'Gómez', 6, -35.067543029785156, -58.166038513183594);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (83, 'Jeppener', 6, -35.27770233154297, -58.198143005371094);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (84, 'Oliden', 6, -35.18448257446289, -57.949073791503906);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (85, 'Samborombón', 6, -35.21940231323242, -58.28099060058594);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (86, 'Los Cardales', 6, -34.313777923583984, -58.98479080200195);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (87, 'Barrio Los Pioneros (Barrio Tavella)', 6, -34.252525329589844, -58.95974349975586);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (88, 'Alejandro Petión', 6, -34.97761154174805, -58.6745491027832);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (89, 'Barrio El Taladro', 6, -35.07145309448242, -58.86531066894531);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (90, 'Cañuelas', 6, -35.05384063720703, -58.76198959350586);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (91, 'bernador Udaondo', 6, -35.30267333984375, -58.595977783203125);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (92, 'Santa Rosa', 6, -34.960845947265625, -58.728763580322266);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (93, 'Uribelarrea', 6, -35.12382888793945, -58.89203643798828);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (94, 'Vicente Casares', 6, -34.965538024902344, -58.65184020996094);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (95, 'Capitán Sarmiento', 6, -34.17127990722656, -59.79359817504883);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (96, 'La Luisa', 6, -34.12956619262695, -59.92641830444336);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (97, 'Bellocq', 6, -35.91661834716797, -61.534114837646484);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (98, 'Cadret', 6, -35.771549224853516, -61.335777282714844);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (99, 'Carlos Casares', 6, -35.622474670410156, -61.36549377441406);
INSERT INTO public.locations OVERRIDING SYSTEM VALUE VALUES (100, 'Colonia Mauricio', 6, -35.52444076538086, -61.43709182739258);


--
-- TOC entry 4901 (class 0 OID 17053)
-- Dependencies: 227
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (2, 'juanchilandia', 'pepelandiaaadejuanchi', -35, -58, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (3, 'Ciudad Autónoma de Buenos Aires', 'Ciudad Autónoma de Buenos Aires', -35, -58, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (4, 'Buenos Aires', 'Provincia de Buenos Aires', -37, -61, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (5, 'Catamarca', 'Provincia de Catamarca', -27, -67, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (6, 'Córdoba', 'Provincia de Córdoba', -32, -64, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (7, 'Corrientes', 'Provincia de Corrientes', -29, -58, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (8, 'Chaco', 'Provincia del Chaco', -26, -61, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (9, 'Chubut', 'Provincia del Chubut', -44, -69, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (10, 'Entre Ríos', 'Provincia de Entre Ríos', -32, -59, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (11, 'Formosa', 'Provincia de Formosa', -25, -60, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (12, 'Jujuy', 'Provincia de Jujuy', -23, -66, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (13, 'La Pampa', 'Provincia de La Pampa', -37, -65, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (14, 'La Rioja', 'Provincia de La Rioja', -30, -67, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (15, 'Mendoza', 'Provincia de Mendoza', -35, -69, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (16, 'Misiones', 'Provincia de Misiones', -27, -55, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (17, 'Neuquén', 'Provincia del Neuquén', -39, -70, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (18, 'Río Negro', 'Provincia de Río Negro', -40, -67, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (19, 'Salta', 'Provincia de Salta', -24, -65, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (20, 'San Juan', 'Provincia de San Juan', -31, -69, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (21, 'San Luis', 'Provincia de San Luis', -34, -66, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (22, 'Santa Cruz', 'Provincia de Santa Cruz', -49, -70, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (23, 'Santa Fe', 'Provincia de Santa Fe', -31, -61, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (24, 'Santiago del Estero', 'Provincia de Santiago del Estero', -28, -63, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (25, 'Tucumán', 'Provincia de Tucumán', -27, -65, NULL);
INSERT INTO public.provinces OVERRIDING SYSTEM VALUE VALUES (26, 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 'Provincia de Tierra del Fuego, Antártida e Islas del Atlántico Sur', -83, -51, NULL);


--
-- TOC entry 4903 (class 0 OID 17057)
-- Dependencies: 229
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (1, 'Marketing');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (2, 'Diseño');
INSERT INTO public.tags OVERRIDING SYSTEM VALUE VALUES (3, 'Programación');


--
-- TOC entry 4905 (class 0 OID 17061)
-- Dependencies: 231
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 'Juan', 'Pérez', 'juanperez', 'contraseña1');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 'María', 'Gómez', 'mariagomez', 'contraseña2');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (3, 'Luis', 'López', 'luislopez', 'contraseña3');


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 216
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
-- Dependencies: 220
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_locations_id_seq', 17, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 222
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 4, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 224
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 3, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 226
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 4042, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 228
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 26, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 230
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 3, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 232
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 4729 (class 2606 OID 17066)
-- Name: event_categories event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 17068)
-- Name: event_enrollments event_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 17070)
-- Name: event_locations event_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 17072)
-- Name: event_tags event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 17074)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 17076)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 17078)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 17080)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 17082)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2024-05-13 18:31:15

--
-- PostgreSQL database dump complete
--

