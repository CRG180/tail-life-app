--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9
-- Dumped by pg_dump version 13.9

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO rootuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO rootuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO rootuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO rootuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO rootuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO rootuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO rootuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO rootuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO rootuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO rootuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO rootuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO rootuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO rootuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO rootuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO rootuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO rootuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO rootuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO rootuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO rootuser;

--
-- Name: leaderSignUp_event; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_event" (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description character varying(1000),
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    alternate_leader_id bigint,
    "eventType_id" bigint NOT NULL,
    primary_leader_id bigint
);


ALTER TABLE public."leaderSignUp_event" OWNER TO rootuser;

--
-- Name: leaderSignUp_event_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_event_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_event_id_seq" OWNED BY public."leaderSignUp_event".id;


--
-- Name: leaderSignUp_eventdocument; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_eventdocument" (
    id bigint NOT NULL,
    attachment character varying(100) NOT NULL,
    event_parent_id bigint NOT NULL,
    document_name character varying(200)
);


ALTER TABLE public."leaderSignUp_eventdocument" OWNER TO rootuser;

--
-- Name: leaderSignUp_eventdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_eventdocument_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_eventdocument_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_eventdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_eventdocument_id_seq" OWNED BY public."leaderSignUp_eventdocument".id;


--
-- Name: leaderSignUp_eventtype; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_eventtype" (
    id bigint NOT NULL,
    event_category character varying(200) NOT NULL
);


ALTER TABLE public."leaderSignUp_eventtype" OWNER TO rootuser;

--
-- Name: leaderSignUp_eventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_eventtype_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_eventtype_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_eventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_eventtype_id_seq" OWNED BY public."leaderSignUp_eventtype".id;


--
-- Name: leaderSignUp_group; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_group" (
    id bigint NOT NULL,
    group_name character varying(200) NOT NULL
);


ALTER TABLE public."leaderSignUp_group" OWNER TO rootuser;

--
-- Name: leaderSignUp_group_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_group_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_group_id_seq" OWNED BY public."leaderSignUp_group".id;


--
-- Name: leaderSignUp_subevent; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_subevent" (
    id bigint NOT NULL,
    description text,
    alternate_leader_id bigint,
    event_parent_id bigint NOT NULL,
    primary_leader_id bigint,
    group_id bigint
);


ALTER TABLE public."leaderSignUp_subevent" OWNER TO rootuser;

--
-- Name: leaderSignUp_subevent_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_subevent_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_subevent_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_subevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_subevent_id_seq" OWNED BY public."leaderSignUp_subevent".id;


--
-- Name: leaderSignUp_trailguideleader; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_trailguideleader" (
    id bigint NOT NULL,
    phone_number character varying(31),
    user_id integer
);


ALTER TABLE public."leaderSignUp_trailguideleader" OWNER TO rootuser;

--
-- Name: leaderSignUp_trailguideleader_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_trailguideleader_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_trailguideleader_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_trailguideleader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_trailguideleader_id_seq" OWNED BY public."leaderSignUp_trailguideleader".id;


--
-- Name: leaderSignUp_trailman; Type: TABLE; Schema: public; Owner: rootuser
--

CREATE TABLE public."leaderSignUp_trailman" (
    id bigint NOT NULL,
    last_name character varying(200) NOT NULL,
    first_name character varying(200) NOT NULL,
    middle_initial character varying(5),
    email_address character varying(254),
    phone_number character varying(31),
    birth_day date
);


ALTER TABLE public."leaderSignUp_trailman" OWNER TO rootuser;

--
-- Name: leaderSignUp_trailman_id_seq; Type: SEQUENCE; Schema: public; Owner: rootuser
--

CREATE SEQUENCE public."leaderSignUp_trailman_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."leaderSignUp_trailman_id_seq" OWNER TO rootuser;

--
-- Name: leaderSignUp_trailman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rootuser
--

ALTER SEQUENCE public."leaderSignUp_trailman_id_seq" OWNED BY public."leaderSignUp_trailman".id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: leaderSignUp_event id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_event" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_event_id_seq"'::regclass);


--
-- Name: leaderSignUp_eventdocument id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_eventdocument" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_eventdocument_id_seq"'::regclass);


--
-- Name: leaderSignUp_eventtype id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_eventtype" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_eventtype_id_seq"'::regclass);


--
-- Name: leaderSignUp_group id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_group" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_group_id_seq"'::regclass);


--
-- Name: leaderSignUp_subevent id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_subevent" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_subevent_id_seq"'::regclass);


--
-- Name: leaderSignUp_trailguideleader id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_trailguideleader" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_trailguideleader_id_seq"'::regclass);


--
-- Name: leaderSignUp_trailman id; Type: DEFAULT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_trailman" ALTER COLUMN id SET DEFAULT nextval('public."leaderSignUp_trailman_id_seq"'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add sample	7	add_sample
26	Can change sample	7	change_sample
27	Can delete sample	7	delete_sample
28	Can view sample	7	view_sample
29	Can add trailman	8	add_trailman
30	Can change trailman	8	change_trailman
31	Can delete trailman	8	delete_trailman
32	Can view trailman	8	view_trailman
33	Can add trail guide leader	9	add_trailguideleader
34	Can change trail guide leader	9	change_trailguideleader
35	Can delete trail guide leader	9	delete_trailguideleader
36	Can view trail guide leader	9	view_trailguideleader
37	Can add event type	10	add_eventtype
38	Can change event type	10	change_eventtype
39	Can delete event type	10	delete_eventtype
40	Can view event type	10	view_eventtype
41	Can add sub event	11	add_subevent
42	Can change sub event	11	change_subevent
43	Can delete sub event	11	delete_subevent
44	Can view sub event	11	view_subevent
45	Can add event	12	add_event
46	Can change event	12	change_event
47	Can delete event	12	delete_event
48	Can view event	12	view_event
49	Can add group	13	add_group
50	Can change group	13	change_group
51	Can delete group	13	delete_group
52	Can view group	13	view_group
53	Can add event document	14	add_eventdocument
54	Can change event document	14	change_eventdocument
55	Can delete event document	14	delete_eventdocument
56	Can view event document	14	view_eventdocument
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$iHKCP26v1DjYWVWYSgM9wU$/ai3dzMoMs6S2QJeibjKOw/0sanCgLGT1U9aFZRnOkU=	2022-12-27 19:24:09.575525+00	f	crg180	Charles	Gallagher	charles.gallagher07@gmail.com	f	t	2022-12-27 19:24:09.33615+00
1	pbkdf2_sha256$260000$5jaE20ffsngGyHwSfRbQND$h6kOWAGWaKESSd2Wsa1N/WWNADrfJJZp/Eyvi0wSMSI=	2023-01-09 03:13:47.141931+00	t	crg	Charles	Doe	crg@vt.edu	t	t	2022-12-27 19:21:31+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-12-27 19:32:03.078345+00	1	f	1	[{"added": {}}]	13	1
2	2022-12-27 19:32:15.649368+00	1	Foxes	2	[{"changed": {"fields": ["Group name"]}}]	13	1
3	2022-12-27 19:32:42.493462+00	2	Hawks A	1	[{"added": {}}]	13	1
4	2022-12-27 19:32:46.656273+00	3	Hawks B	1	[{"added": {}}]	13	1
5	2022-12-27 19:32:53.100451+00	4	Mountain Lions	1	[{"added": {}}]	13	1
6	2022-12-27 19:33:11.909387+00	1	Week Day Meeting	1	[{"added": {}}]	10	1
7	2022-12-27 19:33:22.802871+00	2	Award Ceremony	1	[{"added": {}}]	10	1
8	2022-12-27 19:34:26.183561+00	1	Science of Weather	1	[{"added": {}}]	12	1
9	2022-12-27 19:34:40.19997+00	1	Foxes Science of Weather	1	[{"added": {}}]	11	1
10	2022-12-27 19:34:49.414146+00	2	Hawks A Science of Weather	1	[{"added": {}}]	11	1
11	2022-12-27 19:35:00.461381+00	3	Hawks B Science of Weather	1	[{"added": {}}]	11	1
12	2022-12-27 19:35:11.741402+00	4	Mountain Lions Science of Weather	1	[{"added": {}}]	11	1
13	2022-12-27 20:02:02.196294+00	1	crg	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
14	2022-12-29 03:03:28.514315+00	4	leaderSignUp.group.None Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
15	2022-12-29 03:03:33.257455+00	3	leaderSignUp.group.None Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
16	2022-12-29 03:03:38.981286+00	2	leaderSignUp.group.None Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
17	2022-12-29 03:03:44.905592+00	1	leaderSignUp.group.None Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
18	2022-12-29 03:31:10.971509+00	4	Foxes Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
19	2022-12-29 03:31:22.578584+00	3	Hawks A Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
20	2022-12-29 03:31:28.567174+00	2	Hawks B Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
21	2022-12-29 03:31:34.305232+00	1	Mountain Lions Science of Weather	2	[{"changed": {"fields": ["Group"]}}]	11	1
22	2022-12-31 18:34:13.782999+00	14	nothing test99	3		12	1
23	2022-12-31 18:34:13.787054+00	13	nothing test	3		12	1
24	2022-12-31 18:34:13.788077+00	12	next test99999	3		12	1
25	2022-12-31 18:34:13.789057+00	11	next test	3		12	1
26	2022-12-31 18:34:13.790053+00	10	next test	3		12	1
27	2022-12-31 18:34:13.79119+00	9	next test	3		12	1
28	2022-12-31 18:34:13.792688+00	8	testfdsaf	3		12	1
29	2022-12-31 18:34:13.793768+00	7	testfdsaf	3		12	1
30	2022-12-31 18:34:13.794762+00	6	nklnk	3		12	1
31	2022-12-31 18:34:13.795714+00	5	test 5	3		12	1
32	2022-12-31 18:34:13.79668+00	4	test 5	3		12	1
33	2022-12-31 18:34:13.797647+00	3	test2	3		12	1
34	2022-12-31 18:34:13.798628+00	2	test	3		12	1
35	2023-01-01 18:56:09.617343+00	28	see what	3		12	1
36	2023-01-01 18:56:09.621996+00	27	see what	3		12	1
37	2023-01-01 18:56:09.62326+00	26	see what	3		12	1
38	2023-01-01 18:56:09.624427+00	25	see what	3		12	1
39	2023-01-01 18:56:09.625576+00	24	see what	3		12	1
40	2023-01-01 18:56:09.627524+00	23	test again	3		12	1
41	2023-01-01 18:56:09.628717+00	22	with only some	3		12	1
42	2023-01-01 18:56:09.629998+00	21	with only some	3		12	1
43	2023-01-01 18:56:09.631318+00	20	with only some	3		12	1
44	2023-01-01 18:56:09.632373+00	19	let go come on	3		12	1
45	2023-01-01 18:56:09.633426+00	18	test	3		12	1
46	2023-01-01 18:56:09.634515+00	17	tets	3		12	1
47	2023-01-01 18:56:09.635746+00	16	test 2	3		12	1
48	2023-01-01 18:56:09.636781+00	15	Hello	3		12	1
49	2023-01-02 21:59:52.921126+00	1	John, Doe	2	[{"changed": {"fields": ["Phone number"]}}]	9	1
50	2023-01-09 02:14:07.165035+00	1	eventDocument object (1)	1	[{"added": {}}]	14	1
51	2023-01-09 02:14:16.219249+00	2	eventDocument object (2)	1	[{"added": {}}]	14	1
52	2023-01-09 02:57:12.91105+00	2	eventDocument object (2)	2	[{"changed": {"fields": ["Document name"]}}]	14	1
53	2023-01-09 02:57:23.120521+00	1	eventDocument object (1)	2	[{"changed": {"fields": ["Document name"]}}]	14	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	leaderSignUp	sample
8	leaderSignUp	trailman
9	leaderSignUp	trailguideleader
10	leaderSignUp	eventtype
11	leaderSignUp	subevent
12	leaderSignUp	event
13	leaderSignUp	group
14	leaderSignUp	eventdocument
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-27 19:20:31.014089+00
2	auth	0001_initial	2022-12-27 19:20:31.163718+00
3	admin	0001_initial	2022-12-27 19:20:31.198126+00
4	admin	0002_logentry_remove_auto_add	2022-12-27 19:20:31.210092+00
5	admin	0003_logentry_add_action_flag_choices	2022-12-27 19:20:31.221511+00
6	contenttypes	0002_remove_content_type_name	2022-12-27 19:20:31.247191+00
7	auth	0002_alter_permission_name_max_length	2022-12-27 19:20:31.260652+00
8	auth	0003_alter_user_email_max_length	2022-12-27 19:20:31.277468+00
9	auth	0004_alter_user_username_opts	2022-12-27 19:20:31.289739+00
10	auth	0005_alter_user_last_login_null	2022-12-27 19:20:31.302197+00
11	auth	0006_require_contenttypes_0002	2022-12-27 19:20:31.306547+00
12	auth	0007_alter_validators_add_error_messages	2022-12-27 19:20:31.318049+00
13	auth	0008_alter_user_username_max_length	2022-12-27 19:20:31.337567+00
14	auth	0009_alter_user_last_name_max_length	2022-12-27 19:20:31.352235+00
15	auth	0010_alter_group_name_max_length	2022-12-27 19:20:31.368049+00
16	auth	0011_update_proxy_permissions	2022-12-27 19:20:31.380121+00
17	auth	0012_alter_user_first_name_max_length	2022-12-27 19:20:31.393209+00
18	sessions	0001_initial	2022-12-27 19:20:31.41319+00
19	leaderSignUp	0001_initial	2022-12-27 19:20:53.22585+00
20	leaderSignUp	0002_auto_20221228_2348	2022-12-28 23:48:11.633085+00
21	leaderSignUp	0003_auto_20221229_0330	2022-12-29 03:30:12.833966+00
22	leaderSignUp	0004_alter_trailguideleader_phone_number	2023-01-09 00:13:42.064689+00
23	leaderSignUp	0005_auto_20230109_0207	2023-01-09 02:07:26.653925+00
24	leaderSignUp	0006_eventdocument_document_name	2023-01-09 02:55:49.662641+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
jgjk3ttuk518jhzjcvleywcoy8g67ovg	eyJpbnZhbGlkX3VzZXIiOjF9:1pFRNF:-FUq_Yx5rOxuoU_HfuLccdDd7h-7xD639eR_r8Xcd8s	2023-01-25 03:01:57.434047+00
\.


--
-- Data for Name: leaderSignUp_event; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_event" (id, title, description, start, "end", alternate_leader_id, "eventType_id", primary_leader_id) FROM stdin;
1	Science of Weather	First lesson in the science and technology branch. The lesson is based on the science of weather.	2023-01-10 18:30:00+00	2023-01-10 20:00:00+00	\N	1	\N
29	Is this working	I hope so	2023-01-01 00:00:00+00	2023-01-01 00:00:00+00	\N	1	\N
\.


--
-- Data for Name: leaderSignUp_eventdocument; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_eventdocument" (id, attachment, event_parent_id, document_name) FROM stdin;
2	sci_tech_2_science_in_weather.pdf	1	Science in weather
1	science_and_Technology_step_02_Science_in_weather_lesson_plan.pdf	1	Science in weather lesson plan
\.


--
-- Data for Name: leaderSignUp_eventtype; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_eventtype" (id, event_category) FROM stdin;
1	Week Day Meeting
2	Award Ceremony
\.


--
-- Data for Name: leaderSignUp_group; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_group" (id, group_name) FROM stdin;
1	Foxes
2	Hawks A
3	Hawks B
4	Mountain Lions
\.


--
-- Data for Name: leaderSignUp_subevent; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_subevent" (id, description, alternate_leader_id, event_parent_id, primary_leader_id, group_id) FROM stdin;
3		\N	1	\N	2
2		\N	1	\N	3
36	\N	\N	29	\N	1
37	\N	\N	29	\N	2
1		2	1	\N	4
4		1	1	2	1
\.


--
-- Data for Name: leaderSignUp_trailguideleader; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_trailguideleader" (id, phone_number, user_id) FROM stdin;
2		2
1	+17816853333	1
\.


--
-- Data for Name: leaderSignUp_trailman; Type: TABLE DATA; Schema: public; Owner: rootuser
--

COPY public."leaderSignUp_trailman" (id, last_name, first_name, middle_initial, email_address, phone_number, birth_day) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 53, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: leaderSignUp_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_event_id_seq"', 29, true);


--
-- Name: leaderSignUp_eventdocument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_eventdocument_id_seq"', 2, true);


--
-- Name: leaderSignUp_eventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_eventtype_id_seq"', 2, true);


--
-- Name: leaderSignUp_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_group_id_seq"', 4, true);


--
-- Name: leaderSignUp_subevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_subevent_id_seq"', 39, true);


--
-- Name: leaderSignUp_trailguideleader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_trailguideleader_id_seq"', 2, true);


--
-- Name: leaderSignUp_trailman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rootuser
--

SELECT pg_catalog.setval('public."leaderSignUp_trailman_id_seq"', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: leaderSignUp_event leaderSignUp_event_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_event"
    ADD CONSTRAINT "leaderSignUp_event_pkey" PRIMARY KEY (id);


--
-- Name: leaderSignUp_eventdocument leaderSignUp_eventdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_eventdocument"
    ADD CONSTRAINT "leaderSignUp_eventdocument_pkey" PRIMARY KEY (id);


--
-- Name: leaderSignUp_eventtype leaderSignUp_eventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_eventtype"
    ADD CONSTRAINT "leaderSignUp_eventtype_pkey" PRIMARY KEY (id);


--
-- Name: leaderSignUp_group leaderSignUp_group_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_group"
    ADD CONSTRAINT "leaderSignUp_group_pkey" PRIMARY KEY (id);


--
-- Name: leaderSignUp_subevent leaderSignUp_subevent_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_subevent"
    ADD CONSTRAINT "leaderSignUp_subevent_pkey" PRIMARY KEY (id);


--
-- Name: leaderSignUp_trailguideleader leaderSignUp_trailguideleader_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_trailguideleader"
    ADD CONSTRAINT "leaderSignUp_trailguideleader_pkey" PRIMARY KEY (id);


--
-- Name: leaderSignUp_trailguideleader leaderSignUp_trailguideleader_user_id_key; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_trailguideleader"
    ADD CONSTRAINT "leaderSignUp_trailguideleader_user_id_key" UNIQUE (user_id);


--
-- Name: leaderSignUp_trailman leaderSignUp_trailman_pkey; Type: CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_trailman"
    ADD CONSTRAINT "leaderSignUp_trailman_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: leaderSignUp_event_alternate_leader_id_46b4c341; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_event_alternate_leader_id_46b4c341" ON public."leaderSignUp_event" USING btree (alternate_leader_id);


--
-- Name: leaderSignUp_event_eventType_id_4906430e; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_event_eventType_id_4906430e" ON public."leaderSignUp_event" USING btree ("eventType_id");


--
-- Name: leaderSignUp_event_primary_leader_id_6ba275e3; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_event_primary_leader_id_6ba275e3" ON public."leaderSignUp_event" USING btree (primary_leader_id);


--
-- Name: leaderSignUp_eventdocument_event_parent_id_01276497; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_eventdocument_event_parent_id_01276497" ON public."leaderSignUp_eventdocument" USING btree (event_parent_id);


--
-- Name: leaderSignUp_subevent_alternate_leader_id_80c66ad1; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_subevent_alternate_leader_id_80c66ad1" ON public."leaderSignUp_subevent" USING btree (alternate_leader_id);


--
-- Name: leaderSignUp_subevent_event_parent_id_25b79cfc; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_subevent_event_parent_id_25b79cfc" ON public."leaderSignUp_subevent" USING btree (event_parent_id);


--
-- Name: leaderSignUp_subevent_group_id_20bb4175; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_subevent_group_id_20bb4175" ON public."leaderSignUp_subevent" USING btree (group_id);


--
-- Name: leaderSignUp_subevent_primary_leader_id_ef84ad2b; Type: INDEX; Schema: public; Owner: rootuser
--

CREATE INDEX "leaderSignUp_subevent_primary_leader_id_ef84ad2b" ON public."leaderSignUp_subevent" USING btree (primary_leader_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_event leaderSignUp_event_alternate_leader_id_46b4c341_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_event"
    ADD CONSTRAINT "leaderSignUp_event_alternate_leader_id_46b4c341_fk_leaderSig" FOREIGN KEY (alternate_leader_id) REFERENCES public."leaderSignUp_trailguideleader"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_event leaderSignUp_event_eventType_id_4906430e_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_event"
    ADD CONSTRAINT "leaderSignUp_event_eventType_id_4906430e_fk_leaderSig" FOREIGN KEY ("eventType_id") REFERENCES public."leaderSignUp_eventtype"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_event leaderSignUp_event_primary_leader_id_6ba275e3_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_event"
    ADD CONSTRAINT "leaderSignUp_event_primary_leader_id_6ba275e3_fk_leaderSig" FOREIGN KEY (primary_leader_id) REFERENCES public."leaderSignUp_trailguideleader"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_eventdocument leaderSignUp_eventdo_event_parent_id_01276497_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_eventdocument"
    ADD CONSTRAINT "leaderSignUp_eventdo_event_parent_id_01276497_fk_leaderSig" FOREIGN KEY (event_parent_id) REFERENCES public."leaderSignUp_event"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_subevent leaderSignUp_subeven_alternate_leader_id_80c66ad1_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_subevent"
    ADD CONSTRAINT "leaderSignUp_subeven_alternate_leader_id_80c66ad1_fk_leaderSig" FOREIGN KEY (alternate_leader_id) REFERENCES public."leaderSignUp_trailguideleader"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_subevent leaderSignUp_subeven_event_parent_id_25b79cfc_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_subevent"
    ADD CONSTRAINT "leaderSignUp_subeven_event_parent_id_25b79cfc_fk_leaderSig" FOREIGN KEY (event_parent_id) REFERENCES public."leaderSignUp_event"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_subevent leaderSignUp_subeven_group_id_20bb4175_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_subevent"
    ADD CONSTRAINT "leaderSignUp_subeven_group_id_20bb4175_fk_leaderSig" FOREIGN KEY (group_id) REFERENCES public."leaderSignUp_group"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_subevent leaderSignUp_subeven_primary_leader_id_ef84ad2b_fk_leaderSig; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_subevent"
    ADD CONSTRAINT "leaderSignUp_subeven_primary_leader_id_ef84ad2b_fk_leaderSig" FOREIGN KEY (primary_leader_id) REFERENCES public."leaderSignUp_trailguideleader"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: leaderSignUp_trailguideleader leaderSignUp_trailguideleader_user_id_869fa563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: rootuser
--

ALTER TABLE ONLY public."leaderSignUp_trailguideleader"
    ADD CONSTRAINT "leaderSignUp_trailguideleader_user_id_869fa563_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

