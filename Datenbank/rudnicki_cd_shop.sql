--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: rudnicki_cd_shop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rudnicki_cd_shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';


ALTER DATABASE rudnicki_cd_shop OWNER TO postgres;

\connect rudnicki_cd_shop

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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    "ID" bigint NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Mail" character varying(30) NOT NULL,
    "Passwort" character varying(20) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: Admin_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Admin_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Admin_ID_seq" OWNER TO postgres;

--
-- Name: Admin_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Admin_ID_seq" OWNED BY public.admin."ID";


--
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    id integer NOT NULL,
    titel character varying NOT NULL,
    artist character varying NOT NULL,
    typ character varying NOT NULL,
    preis numeric NOT NULL,
    stueckzahl integer NOT NULL,
    rating integer NOT NULL,
    pic character varying NOT NULL,
    CONSTRAINT nochmal CHECK ((stueckzahl > 0)),
    CONSTRAINT prufen CHECK ((preis > (0)::numeric)),
    CONSTRAINT stars CHECK (((rating <= 5) AND (rating >= 0)))
);


ALTER TABLE public.album OWNER TO postgres;

--
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.album_id_seq OWNER TO postgres;

--
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.album_id_seq OWNED BY public.album.id;


--
-- Name: lied; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lied (
    lied_id integer NOT NULL,
    fk_album_id integer NOT NULL,
    titel character varying NOT NULL,
    laenge interval NOT NULL
);


ALTER TABLE public.lied OWNER TO postgres;

--
-- Name: lied_lied_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lied_lied_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lied_lied_id_seq OWNER TO postgres;

--
-- Name: lied_lied_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lied_lied_id_seq OWNED BY public.lied.lied_id;


--
-- Name: admin ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN "ID" SET DEFAULT nextval('public."Admin_ID_seq"'::regclass);


--
-- Name: album id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album ALTER COLUMN id SET DEFAULT nextval('public.album_id_seq'::regclass);


--
-- Name: lied lied_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lied ALTER COLUMN lied_id SET DEFAULT nextval('public.lied_lied_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin VALUES (1, 'Wiktor Rudnicki', 'rudnicki.w01@htlwienwest.at', 'Test1234');
INSERT INTO public.admin VALUES (2, 'Random User', 'random@gmail.com', 'Test4321');


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.album VALUES (1, 'Mm...Food', 'MF Doom', 'Vinyl', 34.99, 6, 5, 'food.png');
INSERT INTO public.album VALUES (2, 'Are You Experienced', 'Jimi Hendrix', 'Vinyl', 99.99, 2, 5, 'exp.png');
INSERT INTO public.album VALUES (3, 'Dire Straits', 'Dire Straits', 'CD', 14.99, 12, 5, 'straitso.png');
INSERT INTO public.album VALUES (4, 'Piece of Mind', 'Iron Maiden', 'Vinyl', 66.60, 10, 4, 'peace.png');
INSERT INTO public.album VALUES (5, 'Rumours', 'Fleetwood Mac', 'CD', 11.99, 25, 4, 'rum.png');
INSERT INTO public.album VALUES (6, 'Lady Pank', 'Lady Pank', 'CD', 78.99, 3, 5, 'lad.png');


--
-- Data for Name: lied; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lied VALUES (1, 1, 'One Beer', '00:04:18');
INSERT INTO public.lied VALUES (2, 1, 'Deep Fried Frenz', '00:04:59');
INSERT INTO public.lied VALUES (3, 2, 'Purple Haze', '00:02:51');
INSERT INTO public.lied VALUES (4, 2, 'Stone Free', '00:03:36');
INSERT INTO public.lied VALUES (5, 3, 'Sultans of Swing', '00:05:48');
INSERT INTO public.lied VALUES (6, 3, 'Water of Love', '00:05:25');
INSERT INTO public.lied VALUES (7, 4, 'The Trooper', '00:04:12');
INSERT INTO public.lied VALUES (8, 4, 'Revelations', '00:06:49');
INSERT INTO public.lied VALUES (9, 5, 'Dreams', '00:04:17');
INSERT INTO public.lied VALUES (10, 5, 'The Chain', '00:04:29');
INSERT INTO public.lied VALUES (11, 6, 'Mniej niż zero', '00:03:58');
INSERT INTO public.lied VALUES (12, 6, 'Kryzysowa narzeczona', '00:04:00');


--
-- Name: Admin_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Admin_ID_seq"', 2, true);


--
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_id_seq', 6, true);


--
-- Name: lied_lied_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lied_lied_id_seq', 12, true);


--
-- Name: admin ID_Check; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT "ID_Check" PRIMARY KEY ("ID");


--
-- Name: album album_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pk PRIMARY KEY (id);


--
-- Name: lied lied_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lied
    ADD CONSTRAINT lied_pk PRIMARY KEY (lied_id);


--
-- Name: album_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX album_id_uindex ON public.album USING btree (id);


--
-- Name: lied_lied_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lied_lied_id_uindex ON public.lied USING btree (lied_id);


--
-- Name: lied lied_album_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lied
    ADD CONSTRAINT lied_album_id_fk FOREIGN KEY (fk_album_id) REFERENCES public.album(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

