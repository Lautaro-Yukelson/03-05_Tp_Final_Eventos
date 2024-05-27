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

CREATE SCHEMA public;

ALTER SCHEMA public OWNER TO pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_order integer
);

ALTER TABLE public.event_categories OWNER TO postgres;

ALTER TABLE public.event_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

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

ALTER TABLE public.event_enrollments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying(255) NOT NULL,
    full_address character varying(255) NOT NULL,
    max_capacity integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    id_creator_user integer NOT NULL
);

ALTER TABLE public.event_locations OWNER TO postgres;

ALTER TABLE public.event_locations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);

ALTER TABLE public.event_tags OWNER TO postgres;

ALTER TABLE public.event_tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    id_event_category integer NOT NULL,
    id_event_location integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    duration_in_minutes integer NOT NULL,
    price double precision NOT NULL,
    enabled_for_enrollment boolean NOT NULL,
    max_assistance integer NOT NULL,
    id_creator_user integer NOT NULL
);

ALTER TABLE public.events OWNER TO postgres;

ALTER TABLE public.events ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    id_province integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);

ALTER TABLE public.locations OWNER TO postgres;

ALTER TABLE public.locations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    display_order integer
);

ALTER TABLE public.provinces OWNER TO postgres;

ALTER TABLE public.provinces ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);

ALTER TABLE public.tags OWNER TO postgres;

ALTER TABLE public.tags ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);

ALTER TABLE public.users OWNER TO postgres;

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

INSERT INTO public.event_categories (id, name, display_order) OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencias', 1);
INSERT INTO public.event_categories (id, name, display_order) OVERRIDING SYSTEM VALUE VALUES (2, 'Talleres', 2);
INSERT INTO public.event_categories (id, name, display_order) OVERRIDING SYSTEM VALUE VALUES (3, 'Seminarios', 3);
INSERT INTO public.event_categories (id, name, display_order) OVERRIDING SYSTEM VALUE VALUES (4, 'Webinars', 4);

INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 'Interesado en nuevas tecnologías', '2024-06-01 10:00:00', true, 'Muy informativo', 5);
INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) OVERRIDING SYSTEM VALUE VALUES (2, 2, 2, 'Quiero aprender a programar', '2024-06-05 11:00:00', true, 'Excelente taller', 4);
INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, 'Interesado en salud', '2024-06-10 12:00:00', false, 'No pude asistir', 3);
INSERT INTO public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) OVERRIDING SYSTEM VALUE VALUES (4, 4, 4, 'Interesado en finanzas', '2024-06-15 13:00:00', true, 'Muy útil', 5);

INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Centro de Convenciones', 'Calle Falsa 123', 500, -34.6037, -58.3816, 1);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Sala de Conferencias', 'Calle Real 456', 200, -34.6118, -58.4173, 2);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Auditorio Central', 'Av. Siempreviva 789', 300, -34.6090, -58.3900, 3);
INSERT INTO public.event_locations (id, id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (4, 4, 'Espacio Cultural', 'Boulevard Ficticio 1011', 100, -34.6158, -58.4333, 4);

INSERT INTO public.event_tags (id, id_event, id_tag) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.event_tags (id, id_event, id_tag) OVERRIDING SYSTEM VALUE VALUES (2, 1, 3);
INSERT INTO public.event_tags (id, id_event, id_tag) OVERRIDING SYSTEM VALUE VALUES (3, 2, 1);
INSERT INTO public.event_tags (id, id_event, id_tag) OVERRIDING SYSTEM VALUE VALUES (4, 3, 2);
INSERT INTO public.event_tags (id, id_event, id_tag) OVERRIDING SYSTEM VALUE VALUES (5, 4, 4);

INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (1, 'Conferencia de Tecnología', 'Una conferencia sobre los últimos avances en tecnología.', 1, 1, '2024-06-01 10:00:00', 90, 50.0, true, 100, 1);
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (2, 'Taller de Programación', 'Un taller práctico para aprender a programar.', 2, 2, '2024-06-05 11:00:00', 120, 30.0, true, 50, 2);
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (3, 'Seminario de Salud', 'Un seminario sobre la importancia de la salud.', 3, 3, '2024-06-10 12:00:00', 60, 20.0, true, 75, 3);
INSERT INTO public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, enabled_for_enrollment, max_assistance, id_creator_user) OVERRIDING SYSTEM VALUE VALUES (4, 'Webinar de Finanzas', 'Un webinar sobre la gestión de finanzas personales.', 4, 4, '2024-06-15 13:00:00', 45, 0.0, true, 150, 4);

INSERT INTO public.locations (id, name, id_province, latitude, longitude) OVERRIDING SYSTEM VALUE VALUES (1, 'Buenos Aires', 1, -34.6037, -58.3816);
INSERT INTO public.locations (id, name, id_province, latitude, longitude) OVERRIDING SYSTEM VALUE VALUES (2, 'Córdoba', 2, -31.4201, -64.1888);
INSERT INTO public.locations (id, name, id_province, latitude, longitude) OVERRIDING SYSTEM VALUE VALUES (3, 'Rosario', 3, -32.9442, -60.6505);
INSERT INTO public.locations (id, name, id_province, latitude, longitude) OVERRIDING SYSTEM VALUE VALUES (4, 'Mendoza', 4, -32.8894, -68.8458);

INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) OVERRIDING SYSTEM VALUE VALUES (1, 'BA', 'Buenos Aires', -34.6037, -58.3816, 1);
INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) OVERRIDING SYSTEM VALUE VALUES (2, 'CD', 'Córdoba', -31.4201, -64.1888, 2);
INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) OVERRIDING SYSTEM VALUE VALUES (3, 'RS', 'Rosario', -32.9442, -60.6505, 3);
INSERT INTO public.provinces (id, name, full_name, latitude, longitude, display_order) OVERRIDING SYSTEM VALUE VALUES (4, 'MD', 'Mendoza', -32.8894, -68.8458, 4);

INSERT INTO public.tags (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Tecnología');
INSERT INTO public.tags (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Salud');
INSERT INTO public.tags (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Innovación');
INSERT INTO public.tags (id, name) OVERRIDING SYSTEM VALUE VALUES (4, 'Finanzas');

INSERT INTO public.users (id, first_name, last_name, username, password) OVERRIDING SYSTEM VALUE VALUES (1, 'Juan', 'Pérez', 'juanp', 'password123');
INSERT INTO public.users (id, first_name, last_name, username, password) OVERRIDING SYSTEM VALUE VALUES (2, 'María', 'García', 'mariag', 'password123');
INSERT INTO public.users (id, first_name, last_name, username, password) OVERRIDING SYSTEM VALUE VALUES (3, 'Carlos', 'López', 'carlosl', 'password123');
INSERT INTO public.users (id, first_name, last_name, username, password) OVERRIDING SYSTEM VALUE VALUES (4, 'Ana', 'Martínez', 'anam', 'password123');

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_event FOREIGN KEY (id_event) REFERENCES public.events(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES public.users(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_category FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_location FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id);

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT fk_location FOREIGN KEY (id_location) REFERENCES public.locations(id);

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_province FOREIGN KEY (id_province) REFERENCES public.provinces(id);

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_tag FOREIGN KEY (id_tag) REFERENCES public.tags(id);

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_event FOREIGN KEY (id_event) REFERENCES public.events(id) ON DELETE CASCADE;
