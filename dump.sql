--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

-- Started on 2022-10-14 16:02:14 -03

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
-- TOC entry 4 (class 2615 OID 18326242)
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA heroku_ext;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 18394660)
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 18394659)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 214
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 213 (class 1259 OID 18394648)
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "userId" integer NOT NULL,
    "viewCount" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18394647)
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 212
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- TOC entry 211 (class 1259 OID 18394636)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18394635)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4167 (class 2604 OID 18475946)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 4165 (class 2604 OID 18475947)
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- TOC entry 4163 (class 2604 OID 18475948)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4328 (class 0 OID 18394660)
-- Dependencies: 215
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessions (id, "userId", token, "createdAt") FROM stdin;
8	2	34b1f0da-4ab8-4df4-9ac3-6fc6a97ec433	2022-10-12 20:14:28.093697
9	1	0c9c0c51-25ff-407e-8c3b-cf419c4c11fd	2022-10-12 20:14:31.902035
10	4	6e17ec3d-712b-46f5-aa8e-b24cc22e55da	2022-10-13 20:19:58.977181
11	3	ddcdb1cc-73ed-4889-aff4-eaed281227ba	2022-10-13 20:20:02.875543
12	11	5c77d011-5aa3-41f3-93cd-f171da71158b	2022-10-14 14:51:31.546646
18	13	fd2e8d00-168c-4c98-a8f9-feaa0be64bf5	2022-10-14 15:00:20.394442
\.


--
-- TOC entry 4326 (class 0 OID 18394648)
-- Dependencies: 213
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.urls (id, "shortUrl", url, "userId", "viewCount", "createdAt") FROM stdin;
4	5cc5be487b	https://www.tripadvisor.com/Restaurants-g303293-zfp10606-Fortaleza_State_of_Ceara.html	4	0	2022-10-13 20:22:53.504746
5	91f859cb61	https://www.tripadvisor.com/Restaurants-g303293-zfp10606-Fortaleza_State_of_Ceara.html	4	0	2022-10-13 20:23:02.878598
7	1b2e1e5df6	https://i.ytimg.com/vi/C6RUp21s6BQ/maxresdefault.jpg	4	3	2022-10-13 20:29:34.059771
6	590ee77a4b	https://www.tripadvisor.com/Restaurants-g303293-zfp10606-Fortaleza_State_of_Ceara.html	4	4	2022-10-13 20:23:04.210138
8	dab460773a	https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DC6RUp21s6BQ&psig=AOvVaw2AD1rcywAipF6cWVUhy8Hm&ust=1665779319398000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCIDt2NaF3voCFQAAAAAdAAAAABAE	4	2	2022-10-13 20:32:50.874057
1	e4b9ddcf23	https://google.com/	2	3	2022-10-13 14:44:33.443874
9	6ee6ab13d2	https://www.youtube.com/watch?v=C6RUp21s6BQ	4	2	2022-10-13 20:33:34.087585
11	523b06faa3	httbootcampra.notion.site/Materiais-038b870362b744d88c047f4e4e8beb46	1	0	2022-10-14 15:02:12.364589
2	f110fb28d4	https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.surrenderat20.net%2F2022%2F09%2F927-pbe-update-tft-highlights-tentative.html&psig=AOvVaw3Bee94bLMvB_36R4A4EiF2&ust=1665767731955000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCOj2vcfa3foCFQAAAAAdAAAAABAE	2	5	2022-10-13 17:18:35.011564
12	9089bc707c	https://google.com.br	1	0	2022-10-14 15:04:52.303743
\.


--
-- TOC entry 4324 (class 0 OID 18394636)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, "createdAt") FROM stdin;
1	João	joao@driven.com.br	$2b$10$JI7Rf77yJe910YeVM8U9lOPsPsy6.RtARSG55Vb65yoUl4/ij9at2	2022-10-12 16:21:19.342909
2	João	joa@driven.com.br	$2b$10$OJyfE2fwvnBxlNkTfb0FsuJC.FoPb9y6TSi4UtynR2.s8sqweG4ou	2022-10-12 20:07:33.427912
3	Ana	ana@driven.com.br	$2b$10$X3TrSux8DQNPIzW1PyjXW.bCJLmWerBaPsv9/Ix5vzCXJYBuKU6mW	2022-10-13 20:19:35.803911
4	Melissa	mel@driven.com.br	$2b$10$efLBkYuq/ytHm/HfxHkhXO9u5BAtJvTUhlb7uM0/OXFir3XC3ESHq	2022-10-13 20:19:44.422342
5	Amelie	amelie@driven.com.br	$2b$10$pQrciO2IUPU7ugu9KITYQ.vP9oBYGDwvnrXShKlAl.l6K0qgScTXK	2022-10-14 14:47:21.843341
6	Joana	joana@driven.com.br	$2b$10$8kG3VrQ5Zu9.MEIWcInkEugVQg6gwzGuT08NlptI1sbFHi5ViYvce	2022-10-14 14:47:33.418773
7	Carlos	carlos@driven.com.br	$2b$10$gPC0djXZnFMPprqNrFWKX.fpEUFDl9yLLq8bIddCMExhZtangh0TW	2022-10-14 14:47:44.816527
8	Flavia	Flavia@driven.com.br	$2b$10$9zpBCrmzTjwSX/DC9iEd5OD3ziHUl2egH0EJD2Qih6xNHzgk0Qivi	2022-10-14 14:48:00.409248
9	Fabio	fabio@driven.com.br	$2b$10$5OpiZGnLy0oWDU9946P2A.r7VgLeXrA5Pc67qM6gEYW5csorBfIly	2022-10-14 14:48:08.367417
10	Alexandre	alex@driven.com.br	$2b$10$Y/Wd3QVxiz84dgGs7aDBDOhegoeQ09gzhBfPPC.QLAi96KEUrmqbK	2022-10-14 14:48:16.777494
11	Karina	karina@driven.com.br	$2b$10$WgS20uhViGcs1Mc.L1H9yuX7E30RmmbulFuuegATdEXociMCfH2Oe	2022-10-14 14:48:27.225332
12	Karin	karin@driven.com.br	$2b$10$2QdqVfbvN0DKlu0JG21VQunmfN9hjBo0piAWhKo6PurEVcQiNxTSq	2022-10-14 14:52:50.571243
13	Kari	kari@driven.com.br	$2b$10$D0Xdp66W9Vy67R6J78ZDKulm0GW8E8FCeH1wjlxOZOXHXzTbdLg.6	2022-10-14 14:53:59.515255
\.


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 214
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 18, true);


--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 212
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- TOC entry 4177 (class 2606 OID 18394668)
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- TOC entry 4179 (class 2606 OID 18394672)
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- TOC entry 4181 (class 2606 OID 18394670)
-- Name: sessions sessions_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_key" UNIQUE ("userId");


--
-- TOC entry 4173 (class 2606 OID 18394656)
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- TOC entry 4175 (class 2606 OID 18394658)
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- TOC entry 4169 (class 2606 OID 18394646)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4171 (class 2606 OID 18394644)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 4183 (class 2606 OID 18394678)
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- TOC entry 4182 (class 2606 OID 18394673)
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


-- Completed on 2022-10-14 16:02:24 -03

--
-- PostgreSQL database dump complete
--

