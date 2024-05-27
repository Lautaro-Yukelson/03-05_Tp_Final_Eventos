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
    enables_for_enrollment boolean NOT NULL,
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

SELECT pg_catalog.setval('public.event_categories_id_seq', 1, false);

SELECT pg_catalog.setval('public.event_enrollments_id_seq', 1, false);

SELECT pg_catalog.setval('public.event_locations_id_seq', 1, false);

SELECT pg_catalog.setval('public.event_tags_id_seq', 1, false);

SELECT pg_catalog.setval('public.events_id_seq', 1, false);

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);

SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);

SELECT pg_catalog.setval('public.users_id_seq', 1, false);

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);

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

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_event_enrollments_events_id FOREIGN KEY (id_event) REFERENCES public.events(id);

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT fk_event_enrollments_user_id FOREIGN KEY (id_user) REFERENCES public.users(id);

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT fk_event_locations_locations_id FOREIGN KEY (id_location) REFERENCES public.locations(id);

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_event_tags_events_id FOREIGN KEY (id_event) REFERENCES public.events(id);

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT fk_event_tags_tags_id FOREIGN KEY (id_tag) REFERENCES public.tags(id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_event_category_id FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_event_locations_id FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id);

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_users_id FOREIGN KEY (id_creator_user) REFERENCES public.users(id);

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_locations_provinces_id FOREIGN KEY (id_province) REFERENCES public.provinces(id) NOT VALID;