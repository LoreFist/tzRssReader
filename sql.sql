--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: feed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE feed (
    id bigint NOT NULL,
    source_id bigint NOT NULL,
    title character varying(255),
    link character varying(4000),
    description character varying(4000),
    author character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.feed OWNER TO postgres;

--
-- Name: feed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feed_id_seq OWNER TO postgres;

--
-- Name: feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE feed_id_seq OWNED BY feed.id;


--
-- Name: sf_guard_forgot_password; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_forgot_password (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    unique_key character varying(255),
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_forgot_password OWNER TO postgres;

--
-- Name: sf_guard_forgot_password_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sf_guard_forgot_password_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sf_guard_forgot_password_id_seq OWNER TO postgres;

--
-- Name: sf_guard_forgot_password_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sf_guard_forgot_password_id_seq OWNED BY sf_guard_forgot_password.id;


--
-- Name: sf_guard_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_group (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(1000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_group OWNER TO postgres;

--
-- Name: sf_guard_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sf_guard_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sf_guard_group_id_seq OWNER TO postgres;

--
-- Name: sf_guard_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sf_guard_group_id_seq OWNED BY sf_guard_group.id;


--
-- Name: sf_guard_group_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_group_permission (
    group_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_group_permission OWNER TO postgres;

--
-- Name: sf_guard_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_permission (
    id bigint NOT NULL,
    name character varying(255),
    description character varying(1000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_permission OWNER TO postgres;

--
-- Name: sf_guard_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sf_guard_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sf_guard_permission_id_seq OWNER TO postgres;

--
-- Name: sf_guard_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sf_guard_permission_id_seq OWNED BY sf_guard_permission.id;


--
-- Name: sf_guard_remember_key; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_remember_key (
    id bigint NOT NULL,
    user_id bigint,
    remember_key character varying(32),
    ip_address character varying(50),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_remember_key OWNER TO postgres;

--
-- Name: sf_guard_remember_key_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sf_guard_remember_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sf_guard_remember_key_id_seq OWNER TO postgres;

--
-- Name: sf_guard_remember_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sf_guard_remember_key_id_seq OWNED BY sf_guard_remember_key.id;


--
-- Name: sf_guard_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_user (
    id bigint NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email_address character varying(255) NOT NULL,
    username character varying(128) NOT NULL,
    algorithm character varying(128) DEFAULT 'sha1'::character varying NOT NULL,
    salt character varying(128),
    password character varying(128),
    is_active boolean DEFAULT true,
    is_super_admin boolean DEFAULT false,
    last_login timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_user OWNER TO postgres;

--
-- Name: sf_guard_user_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_user_group (
    user_id bigint NOT NULL,
    group_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_user_group OWNER TO postgres;

--
-- Name: sf_guard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sf_guard_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sf_guard_user_id_seq OWNER TO postgres;

--
-- Name: sf_guard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sf_guard_user_id_seq OWNED BY sf_guard_user.id;


--
-- Name: sf_guard_user_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sf_guard_user_permission (
    user_id bigint NOT NULL,
    permission_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sf_guard_user_permission OWNER TO postgres;

--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE source (
    id bigint NOT NULL,
    title character varying(255),
    description character varying(4000),
    link character varying(255) NOT NULL,
    author character varying(255),
    language character varying(100),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_id_seq OWNER TO postgres;

--
-- Name: source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE source_id_seq OWNED BY source.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feed ALTER COLUMN id SET DEFAULT nextval('feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_forgot_password ALTER COLUMN id SET DEFAULT nextval('sf_guard_forgot_password_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_group ALTER COLUMN id SET DEFAULT nextval('sf_guard_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_permission ALTER COLUMN id SET DEFAULT nextval('sf_guard_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_remember_key ALTER COLUMN id SET DEFAULT nextval('sf_guard_remember_key_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_user ALTER COLUMN id SET DEFAULT nextval('sf_guard_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY source ALTER COLUMN id SET DEFAULT nextval('source_id_seq'::regclass);


--
-- Data for Name: feed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY feed (id, source_id, title, link, description, author, created_at, updated_at) FROM stdin;
\.


--
-- Name: feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('feed_id_seq', 1, false);


--
-- Data for Name: sf_guard_forgot_password; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_forgot_password (id, user_id, unique_key, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: sf_guard_forgot_password_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sf_guard_forgot_password_id_seq', 1, false);


--
-- Data for Name: sf_guard_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_group (id, name, description, created_at, updated_at) FROM stdin;
1	admin	Administrator group	2013-02-03 16:34:12	2013-02-03 16:34:12
\.


--
-- Name: sf_guard_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sf_guard_group_id_seq', 1, true);


--
-- Data for Name: sf_guard_group_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_group_permission (group_id, permission_id, created_at, updated_at) FROM stdin;
1	1	2013-02-03 16:34:13	2013-02-03 16:34:13
\.


--
-- Data for Name: sf_guard_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_permission (id, name, description, created_at, updated_at) FROM stdin;
1	admin	Administrator permission	2013-02-03 16:34:12	2013-02-03 16:34:12
\.


--
-- Name: sf_guard_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sf_guard_permission_id_seq', 1, true);


--
-- Data for Name: sf_guard_remember_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_remember_key (id, user_id, remember_key, ip_address, created_at, updated_at) FROM stdin;
\.


--
-- Name: sf_guard_remember_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sf_guard_remember_key_id_seq', 1, false);


--
-- Data for Name: sf_guard_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_user (id, first_name, last_name, email_address, username, algorithm, salt, password, is_active, is_super_admin, last_login, created_at, updated_at) FROM stdin;
1	John	Doe	john.doe@gmail.com	admin	sha1	9b879393e2746ff65b4183faf7035519	79f7ac6ee1f26ee688a1f6cc28df96e499a9feff	t	t	2013-02-03 16:34:21	2013-02-03 16:34:13	2013-02-03 16:34:21
\.


--
-- Data for Name: sf_guard_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_user_group (user_id, group_id, created_at, updated_at) FROM stdin;
1	1	2013-02-03 16:34:13	2013-02-03 16:34:13
\.


--
-- Name: sf_guard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sf_guard_user_id_seq', 1, true);


--
-- Data for Name: sf_guard_user_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sf_guard_user_permission (user_id, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY source (id, title, description, link, author, language, created_at, updated_at) FROM stdin;
\.


--
-- Name: source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('source_id_seq', 1, false);


--
-- Name: feed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY feed
    ADD CONSTRAINT feed_pkey PRIMARY KEY (id);


--
-- Name: sf_guard_forgot_password_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_forgot_password
    ADD CONSTRAINT sf_guard_forgot_password_pkey PRIMARY KEY (id);


--
-- Name: sf_guard_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_group
    ADD CONSTRAINT sf_guard_group_name_key UNIQUE (name);


--
-- Name: sf_guard_group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_group_permission
    ADD CONSTRAINT sf_guard_group_permission_pkey PRIMARY KEY (group_id, permission_id);


--
-- Name: sf_guard_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_group
    ADD CONSTRAINT sf_guard_group_pkey PRIMARY KEY (id);


--
-- Name: sf_guard_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_permission
    ADD CONSTRAINT sf_guard_permission_name_key UNIQUE (name);


--
-- Name: sf_guard_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_permission
    ADD CONSTRAINT sf_guard_permission_pkey PRIMARY KEY (id);


--
-- Name: sf_guard_remember_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_remember_key
    ADD CONSTRAINT sf_guard_remember_key_pkey PRIMARY KEY (id);


--
-- Name: sf_guard_user_email_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_user
    ADD CONSTRAINT sf_guard_user_email_address_key UNIQUE (email_address);


--
-- Name: sf_guard_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_user_group
    ADD CONSTRAINT sf_guard_user_group_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: sf_guard_user_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_user_permission
    ADD CONSTRAINT sf_guard_user_permission_pkey PRIMARY KEY (user_id, permission_id);


--
-- Name: sf_guard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_user
    ADD CONSTRAINT sf_guard_user_pkey PRIMARY KEY (id);


--
-- Name: sf_guard_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sf_guard_user
    ADD CONSTRAINT sf_guard_user_username_key UNIQUE (username);


--
-- Name: source_link_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_link_key UNIQUE (link);


--
-- Name: source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_pkey PRIMARY KEY (id);


--
-- Name: is_active_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX is_active_idx ON sf_guard_user USING btree (is_active);


--
-- Name: feed_source_id_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feed
    ADD CONSTRAINT feed_source_id_source_id FOREIGN KEY (source_id) REFERENCES source(id);


--
-- Name: sf_guard_forgot_password_user_id_sf_guard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_forgot_password
    ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;


--
-- Name: sf_guard_group_permission_group_id_sf_guard_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_group_permission
    ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;


--
-- Name: sf_guard_group_permission_permission_id_sf_guard_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_group_permission
    ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;


--
-- Name: sf_guard_remember_key_user_id_sf_guard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_remember_key
    ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;


--
-- Name: sf_guard_user_group_group_id_sf_guard_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_user_group
    ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;


--
-- Name: sf_guard_user_group_user_id_sf_guard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_user_group
    ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;


--
-- Name: sf_guard_user_permission_permission_id_sf_guard_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_user_permission
    ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;


--
-- Name: sf_guard_user_permission_user_id_sf_guard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sf_guard_user_permission
    ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;


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

