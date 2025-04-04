--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-04 22:13:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 223 (class 1259 OID 25594)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25601)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25626)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25625)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 227 (class 1259 OID 25618)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25609)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25608)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 218 (class 1259 OID 25561)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25560)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 221 (class 1259 OID 25578)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25670)
-- Name: product_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_image (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_image OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25669)
-- Name: product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_image_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 234
-- Name: product_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_image_id_seq OWNED BY public.product_image.id;


--
-- TOC entry 233 (class 1259 OID 25653)
-- Name: product_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_user (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_user OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25652)
-- Name: product_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_user_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 232
-- Name: product_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_user_id_seq OWNED BY public.product_user.id;


--
-- TOC entry 231 (class 1259 OID 25640)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    description text NOT NULL,
    genre character varying(255) NOT NULL,
    language character varying(255) NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    in_stock integer DEFAULT 0 NOT NULL,
    total_purchased integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT products_language_check CHECK (((language)::text = ANY ((ARRAY['slovak'::character varying, 'russian'::character varying, 'english'::character varying, 'german'::character varying])::text[])))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25639)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 222 (class 1259 OID 25585)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25568)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    last_name character varying(255),
    birth_date date,
    phone_number character varying(255),
    role character varying(255) DEFAULT 'user'::character varying NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['user'::character varying, 'admin'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25567)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4749 (class 2604 OID 25629)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 25612)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 25564)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 25673)
-- Name: product_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image ALTER COLUMN id SET DEFAULT nextval('public.product_image_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 25656)
-- Name: product_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_user ALTER COLUMN id SET DEFAULT nextval('public.product_user_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 25643)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 25571)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4944 (class 0 OID 25594)
-- Dependencies: 223
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 25601)
-- Dependencies: 224
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 25626)
-- Dependencies: 229
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4948 (class 0 OID 25618)
-- Dependencies: 227
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 25609)
-- Dependencies: 226
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 25561)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_04_04_154907_modify_users_table	2
5	2025_04_04_160709_create_products_table	3
6	2025_04_04_162154_create_product_user_table	4
7	2025_04_04_162733_create_product_image_table	5
\.


--
-- TOC entry 4942 (class 0 OID 25578)
-- Dependencies: 221
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 25670)
-- Dependencies: 235
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_image (id, product_id, image, created_at, updated_at) FROM stdin;
1	1	/product_images/circle1.jpg	\N	\N
2	1	/product_images/circle2.jpg	\N	\N
3	2	/product_images/circle1.jpg	\N	\N
4	2	/product_images/circle2.jpg	\N	\N
5	3	/product_images/circle1.jpg	\N	\N
6	3	/product_images/circle2.jpg	\N	\N
7	4	/product_images/circle1.jpg	\N	\N
8	4	/product_images/circle2.jpg	\N	\N
9	5	/product_images/circle1.jpg	\N	\N
10	5	/product_images/circle2.jpg	\N	\N
11	6	/product_images/circle1.jpg	\N	\N
12	6	/product_images/circle2.jpg	\N	\N
13	7	/product_images/circle1.jpg	\N	\N
14	7	/product_images/circle2.jpg	\N	\N
15	8	/product_images/circle1.jpg	\N	\N
16	8	/product_images/circle2.jpg	\N	\N
17	9	/product_images/circle1.jpg	\N	\N
18	9	/product_images/circle2.jpg	\N	\N
19	10	/product_images/circle1.jpg	\N	\N
20	10	/product_images/circle2.jpg	\N	\N
21	11	/product_images/circle1.jpg	\N	\N
22	11	/product_images/circle2.jpg	\N	\N
23	12	/product_images/circle1.jpg	\N	\N
24	12	/product_images/circle2.jpg	\N	\N
25	13	/product_images/circle1.jpg	\N	\N
26	13	/product_images/circle2.jpg	\N	\N
27	14	/product_images/circle1.jpg	\N	\N
28	14	/product_images/circle2.jpg	\N	\N
29	15	/product_images/circle1.jpg	\N	\N
30	15	/product_images/circle2.jpg	\N	\N
31	16	/product_images/circle1.jpg	\N	\N
32	16	/product_images/circle2.jpg	\N	\N
33	17	/product_images/circle1.jpg	\N	\N
34	17	/product_images/circle2.jpg	\N	\N
35	18	/product_images/circle1.jpg	\N	\N
36	18	/product_images/circle2.jpg	\N	\N
37	19	/product_images/circle1.jpg	\N	\N
38	19	/product_images/circle2.jpg	\N	\N
39	20	/product_images/circle1.jpg	\N	\N
40	20	/product_images/circle2.jpg	\N	\N
41	21	/product_images/circle1.jpg	\N	\N
42	21	/product_images/circle2.jpg	\N	\N
43	22	/product_images/circle1.jpg	\N	\N
44	22	/product_images/circle2.jpg	\N	\N
45	23	/product_images/circle1.jpg	\N	\N
46	23	/product_images/circle2.jpg	\N	\N
47	24	/product_images/circle1.jpg	\N	\N
48	24	/product_images/circle2.jpg	\N	\N
49	25	/product_images/circle1.jpg	\N	\N
50	25	/product_images/circle2.jpg	\N	\N
51	26	/product_images/circle1.jpg	\N	\N
52	26	/product_images/circle2.jpg	\N	\N
53	27	/product_images/circle1.jpg	\N	\N
54	27	/product_images/circle2.jpg	\N	\N
55	28	/product_images/circle1.jpg	\N	\N
56	28	/product_images/circle2.jpg	\N	\N
57	29	/product_images/circle1.jpg	\N	\N
58	29	/product_images/circle2.jpg	\N	\N
59	30	/product_images/circle1.jpg	\N	\N
60	30	/product_images/circle2.jpg	\N	\N
61	31	/product_images/circle1.jpg	\N	\N
62	31	/product_images/circle2.jpg	\N	\N
63	32	/product_images/circle1.jpg	\N	\N
64	32	/product_images/circle2.jpg	\N	\N
65	33	/product_images/circle1.jpg	\N	\N
66	33	/product_images/circle2.jpg	\N	\N
67	34	/product_images/circle1.jpg	\N	\N
68	34	/product_images/circle2.jpg	\N	\N
69	35	/product_images/circle1.jpg	\N	\N
70	35	/product_images/circle2.jpg	\N	\N
71	36	/product_images/circle1.jpg	\N	\N
72	36	/product_images/circle2.jpg	\N	\N
73	37	/product_images/circle1.jpg	\N	\N
74	37	/product_images/circle2.jpg	\N	\N
75	38	/product_images/circle1.jpg	\N	\N
76	38	/product_images/circle2.jpg	\N	\N
77	39	/product_images/circle1.jpg	\N	\N
78	39	/product_images/circle2.jpg	\N	\N
79	40	/product_images/circle1.jpg	\N	\N
80	40	/product_images/circle2.jpg	\N	\N
81	41	/product_images/circle1.jpg	\N	\N
82	41	/product_images/circle2.jpg	\N	\N
83	42	/product_images/circle1.jpg	\N	\N
84	42	/product_images/circle2.jpg	\N	\N
85	43	/product_images/circle1.jpg	\N	\N
86	43	/product_images/circle2.jpg	\N	\N
87	44	/product_images/circle1.jpg	\N	\N
88	44	/product_images/circle2.jpg	\N	\N
89	45	/product_images/circle1.jpg	\N	\N
90	45	/product_images/circle2.jpg	\N	\N
91	46	/product_images/circle1.jpg	\N	\N
92	46	/product_images/circle2.jpg	\N	\N
93	47	/product_images/circle1.jpg	\N	\N
94	47	/product_images/circle2.jpg	\N	\N
95	48	/product_images/circle1.jpg	\N	\N
96	48	/product_images/circle2.jpg	\N	\N
97	49	/product_images/circle1.jpg	\N	\N
98	49	/product_images/circle2.jpg	\N	\N
99	50	/product_images/circle1.jpg	\N	\N
100	50	/product_images/circle2.jpg	\N	\N
101	51	/product_images/circle1.jpg	\N	\N
102	51	/product_images/circle2.jpg	\N	\N
103	52	/product_images/circle1.jpg	\N	\N
104	52	/product_images/circle2.jpg	\N	\N
105	53	/product_images/circle1.jpg	\N	\N
106	53	/product_images/circle2.jpg	\N	\N
107	54	/product_images/circle1.jpg	\N	\N
108	54	/product_images/circle2.jpg	\N	\N
109	55	/product_images/circle1.jpg	\N	\N
110	55	/product_images/circle2.jpg	\N	\N
111	56	/product_images/circle1.jpg	\N	\N
112	56	/product_images/circle2.jpg	\N	\N
113	57	/product_images/circle1.jpg	\N	\N
114	57	/product_images/circle2.jpg	\N	\N
115	58	/product_images/circle1.jpg	\N	\N
116	58	/product_images/circle2.jpg	\N	\N
117	59	/product_images/circle1.jpg	\N	\N
118	59	/product_images/circle2.jpg	\N	\N
119	60	/product_images/circle1.jpg	\N	\N
120	60	/product_images/circle2.jpg	\N	\N
121	61	/product_images/circle1.jpg	\N	\N
122	61	/product_images/circle2.jpg	\N	\N
123	62	/product_images/circle1.jpg	\N	\N
124	62	/product_images/circle2.jpg	\N	\N
125	63	/product_images/circle1.jpg	\N	\N
126	63	/product_images/circle2.jpg	\N	\N
127	64	/product_images/circle1.jpg	\N	\N
128	64	/product_images/circle2.jpg	\N	\N
129	65	/product_images/circle1.jpg	\N	\N
130	65	/product_images/circle2.jpg	\N	\N
131	66	/product_images/circle1.jpg	\N	\N
132	66	/product_images/circle2.jpg	\N	\N
133	67	/product_images/circle1.jpg	\N	\N
134	67	/product_images/circle2.jpg	\N	\N
135	68	/product_images/circle1.jpg	\N	\N
136	68	/product_images/circle2.jpg	\N	\N
137	69	/product_images/circle1.jpg	\N	\N
138	69	/product_images/circle2.jpg	\N	\N
139	70	/product_images/circle1.jpg	\N	\N
140	70	/product_images/circle2.jpg	\N	\N
141	71	/product_images/circle1.jpg	\N	\N
142	71	/product_images/circle2.jpg	\N	\N
143	72	/product_images/circle1.jpg	\N	\N
144	72	/product_images/circle2.jpg	\N	\N
145	73	/product_images/circle1.jpg	\N	\N
146	73	/product_images/circle2.jpg	\N	\N
147	74	/product_images/circle1.jpg	\N	\N
148	74	/product_images/circle2.jpg	\N	\N
149	75	/product_images/circle1.jpg	\N	\N
150	75	/product_images/circle2.jpg	\N	\N
151	76	/product_images/circle1.jpg	\N	\N
152	76	/product_images/circle2.jpg	\N	\N
153	77	/product_images/circle1.jpg	\N	\N
154	77	/product_images/circle2.jpg	\N	\N
155	78	/product_images/circle1.jpg	\N	\N
156	78	/product_images/circle2.jpg	\N	\N
157	79	/product_images/circle1.jpg	\N	\N
158	79	/product_images/circle2.jpg	\N	\N
159	80	/product_images/circle1.jpg	\N	\N
160	80	/product_images/circle2.jpg	\N	\N
161	81	/product_images/circle1.jpg	\N	\N
162	81	/product_images/circle2.jpg	\N	\N
163	82	/product_images/circle1.jpg	\N	\N
164	82	/product_images/circle2.jpg	\N	\N
165	83	/product_images/circle1.jpg	\N	\N
166	83	/product_images/circle2.jpg	\N	\N
167	84	/product_images/circle1.jpg	\N	\N
168	84	/product_images/circle2.jpg	\N	\N
169	85	/product_images/circle1.jpg	\N	\N
170	85	/product_images/circle2.jpg	\N	\N
171	86	/product_images/circle1.jpg	\N	\N
172	86	/product_images/circle2.jpg	\N	\N
173	87	/product_images/circle1.jpg	\N	\N
174	87	/product_images/circle2.jpg	\N	\N
175	88	/product_images/circle1.jpg	\N	\N
176	88	/product_images/circle2.jpg	\N	\N
177	89	/product_images/circle1.jpg	\N	\N
178	89	/product_images/circle2.jpg	\N	\N
179	90	/product_images/circle1.jpg	\N	\N
180	90	/product_images/circle2.jpg	\N	\N
181	91	/product_images/circle1.jpg	\N	\N
182	91	/product_images/circle2.jpg	\N	\N
183	92	/product_images/circle1.jpg	\N	\N
184	92	/product_images/circle2.jpg	\N	\N
185	93	/product_images/circle1.jpg	\N	\N
186	93	/product_images/circle2.jpg	\N	\N
187	94	/product_images/circle1.jpg	\N	\N
188	94	/product_images/circle2.jpg	\N	\N
189	95	/product_images/circle1.jpg	\N	\N
190	95	/product_images/circle2.jpg	\N	\N
191	96	/product_images/circle1.jpg	\N	\N
192	96	/product_images/circle2.jpg	\N	\N
193	97	/product_images/circle1.jpg	\N	\N
194	97	/product_images/circle2.jpg	\N	\N
195	98	/product_images/circle1.jpg	\N	\N
196	98	/product_images/circle2.jpg	\N	\N
197	99	/product_images/circle1.jpg	\N	\N
198	99	/product_images/circle2.jpg	\N	\N
199	100	/product_images/circle1.jpg	\N	\N
200	100	/product_images/circle2.jpg	\N	\N
\.


--
-- TOC entry 4954 (class 0 OID 25653)
-- Dependencies: 233
-- Data for Name: product_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_user (id, user_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 25640)
-- Dependencies: 231
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, author, description, genre, language, price, in_stock, total_purchased, created_at, updated_at) FROM stdin;
1	Assumenda aut mollitia alias.	Jody Botsford	Voluptatibus provident vel rem nobis perferendis. Vel optio deserunt est non a quasi sint eius.	beatae	slovak	44.07	29	437	2025-04-04 17:04:39	2025-04-04 17:04:39
2	Modi perferendis aut qui.	Miss Lavina Brekke	In dignissimos facere dolore ea vel non quo. Omnis occaecati beatae suscipit qui quo illo. Id atque dolor aperiam voluptas ab voluptate eum.	soluta	english	72.37	40	288	2025-04-04 17:04:39	2025-04-04 17:04:39
3	Modi labore sed et.	Jana Rosenbaum	Id itaque delectus iste quos sint. Et expedita illo illum eius ullam. Delectus labore enim atque. Voluptatem non illo facilis voluptate repellat laboriosam.	est	english	37.60	43	316	2025-04-04 17:04:39	2025-04-04 17:04:39
4	Quia dolor laborum.	Eveline Runte DDS	Blanditiis voluptates sunt ut et aperiam eaque. Laudantium expedita odit vel aliquam accusantium ducimus. Nam nobis non sed minus et. Et reprehenderit aut dolores ut.	adipisci	english	98.56	27	337	2025-04-04 17:04:39	2025-04-04 17:04:39
5	Aut non ipsa.	Dr. Kelvin Lehner	Explicabo tempore dolorem tempora quas eos numquam quo. Reiciendis quia quia doloribus quidem officiis blanditiis. Quia iste est aut sit.	aut	russian	56.07	28	471	2025-04-04 17:04:39	2025-04-04 17:04:39
6	Enim praesentium cum.	Jovan Kub	Eos eum magni ipsum. Quis aut quae ex rem. Iure labore ea quia et.	aut	german	35.71	33	437	2025-04-04 17:04:39	2025-04-04 17:04:39
7	Quod et.	Theresa Mayer	Iure quis perspiciatis rem nobis. Consequatur odio earum sit magnam error necessitatibus dolorem. Est consequatur facere ullam nihil. Quia est blanditiis incidunt ipsa sed.	facere	slovak	48.80	2	237	2025-04-04 17:04:39	2025-04-04 17:04:39
8	Nemo voluptates et velit.	Dr. Ramiro Runolfsdottir III	Tempora nulla fugiat sequi quia fuga enim. Quod autem id in impedit provident sed. Autem qui repellat modi voluptatum aut ullam. Sit dolor ea nesciunt repellendus.	aut	english	73.80	22	352	2025-04-04 17:04:39	2025-04-04 17:04:39
9	Soluta iste.	Maymie Hirthe	Quisquam nemo non beatae. Aut illo quia enim velit eligendi praesentium nostrum.	ut	english	44.84	38	32	2025-04-04 17:04:39	2025-04-04 17:04:39
10	Nulla omnis sapiente.	Mrs. Alize Weber Jr.	Aperiam unde est tempora. Hic pariatur dicta debitis voluptatem. Iure ut dolore nihil alias. Incidunt officia qui voluptas voluptas nam maxime omnis. Consequatur ab qui blanditiis qui.	quas	russian	18.04	50	448	2025-04-04 17:04:39	2025-04-04 17:04:39
11	Cumque ut praesentium dolores.	Taurean Bednar II	Voluptatem quidem nisi sequi quasi vitae magnam. Voluptatibus quis et voluptatibus alias quaerat. Sequi voluptatem enim voluptatem minus corporis a consequuntur.	impedit	german	56.85	11	464	2025-04-04 17:04:39	2025-04-04 17:04:39
12	Dolorem a iste et.	Scarlett Langosh	Libero aperiam beatae soluta doloribus. Est et et quia omnis facere ut in. Dolores est sint consectetur atque distinctio maxime eos. Doloremque et dignissimos sit nihil est ut.	nam	slovak	16.76	44	378	2025-04-04 17:04:39	2025-04-04 17:04:39
13	Rem beatae nihil magnam sapiente.	Prof. Janae Hudson Sr.	Ipsam quas minima quod consequatur et. Dolorum aliquid alias fuga ut officia facilis fugit iusto. Inventore architecto debitis dolore quidem. Aut cupiditate delectus sit veniam.	qui	slovak	56.82	3	201	2025-04-04 17:04:39	2025-04-04 17:04:39
14	Libero dolores ducimus.	Lizzie Abshire	Nemo et sunt ut rerum nam ut consectetur. Ut occaecati omnis voluptates quia. Dolor commodi deserunt reiciendis eum doloribus.	quia	slovak	63.39	25	91	2025-04-04 17:04:39	2025-04-04 17:04:39
15	Suscipit incidunt aspernatur incidunt.	Tod Williamson	Consequatur atque illo quis aliquid. Ut eos consequatur deleniti maiores. Non nesciunt labore molestiae aliquam non. Corporis vero suscipit ut error praesentium.	consectetur	slovak	12.39	50	185	2025-04-04 17:04:39	2025-04-04 17:04:39
16	Qui sint et est eum.	Bradly Dietrich	Voluptatum repudiandae similique quis libero modi ad. Voluptas qui quia ea eveniet facere. Illo velit sit ea consequatur sed.	pariatur	german	90.91	18	88	2025-04-04 17:04:39	2025-04-04 17:04:39
17	Similique dolorem esse.	Mrs. Adela Bashirian	Distinctio dignissimos officiis sed ipsum pariatur voluptas. Accusamus commodi nemo vel ad. Dicta molestias maiores ducimus voluptatem.	quod	slovak	26.81	39	172	2025-04-04 17:04:39	2025-04-04 17:04:39
18	Cum aspernatur dolorem.	Ahmad Bergstrom	Ad velit delectus quia. Reprehenderit maiores tempore in. Minus recusandae voluptatem qui iure earum. Et placeat magni beatae voluptas quisquam. Quasi recusandae dolorum saepe quod quae.	possimus	german	21.81	36	314	2025-04-04 17:04:39	2025-04-04 17:04:39
19	Velit molestiae corporis.	Michael Paucek	Deleniti voluptas laudantium reiciendis aut dolorem animi vel. Voluptatum illo autem fugit. Iure sint cumque voluptas magni sint.	a	english	25.22	37	392	2025-04-04 17:04:39	2025-04-04 17:04:39
20	Provident error deleniti vitae.	Caleb Emmerich	Et voluptatem quis ipsa voluptatem. Tempora expedita quod qui consequatur est molestias. Dolorum dolor est aliquam exercitationem. Sit velit voluptatem numquam placeat recusandae architecto mollitia.	atque	german	49.39	28	58	2025-04-04 17:04:39	2025-04-04 17:04:39
21	Minima consequatur voluptatem repellendus.	Dr. Dean Boehm	Velit sint eveniet fuga quia. Harum voluptates facilis harum aut placeat accusamus. Aspernatur qui consequatur accusamus facilis. Dolores officiis aut praesentium earum qui omnis.	laborum	russian	14.18	7	50	2025-04-04 17:04:39	2025-04-04 17:04:39
22	Nihil sunt corporis.	Darby Roberts PhD	Ut sit quis dolorem quibusdam rerum. Velit quo unde doloremque voluptatem. Nihil nihil et odit dolore tempora autem voluptas. Quis ratione magnam magni sit.	esse	german	24.59	2	479	2025-04-04 17:04:39	2025-04-04 17:04:39
23	Est quidem recusandae sit.	Vivien Hayes	Deserunt sint dicta repudiandae repellat. Enim impedit atque cupiditate et.	omnis	slovak	34.98	9	125	2025-04-04 17:04:39	2025-04-04 17:04:39
24	Recusandae consequuntur perspiciatis.	Bart Runolfsson PhD	Temporibus incidunt est impedit mollitia quod maiores sunt. Sit quisquam quis voluptatem et at ea maxime. Doloremque aliquid tempora quis sit omnis incidunt. Nisi rerum eligendi debitis et ut nulla.	hic	russian	15.15	46	302	2025-04-04 17:04:39	2025-04-04 17:04:39
25	Harum est eaque eius hic.	Antonina Schamberger	Est quasi nobis consequuntur quae. Reprehenderit ipsa neque autem rerum dolores similique et. Facere ea et a consequuntur ducimus sunt. Ut explicabo illo qui alias numquam ut sapiente.	reiciendis	german	23.65	4	92	2025-04-04 17:04:39	2025-04-04 17:04:39
26	Et ducimus mollitia.	Cordia Daniel	Vero esse quas ut cum possimus non doloribus. Exercitationem nobis quis perspiciatis rerum itaque occaecati. Sed quibusdam temporibus dolor minima fuga nobis. Ut et ut mollitia.	quia	german	83.75	36	162	2025-04-04 17:04:39	2025-04-04 17:04:39
27	Ut placeat molestias corrupti.	Kenyon Leannon	Et dolor accusamus a porro eius ad earum doloribus. Ut est voluptatem ut et quis molestias.	praesentium	slovak	13.77	7	309	2025-04-04 17:04:39	2025-04-04 17:04:39
28	Quia dolor veritatis aut.	Rhea Schmitt	Aut totam officiis voluptatibus harum deserunt nulla. Deserunt et fugiat doloribus ex repellat. Est voluptates dolore enim quia impedit et quis.	dignissimos	english	82.69	18	163	2025-04-04 17:04:39	2025-04-04 17:04:39
29	Et itaque excepturi quasi.	Krystel Gorczany DVM	Rem voluptas dolorem sunt optio. Nemo deleniti qui sit quam. Rem quod voluptas rerum est laboriosam.	et	english	43.68	21	423	2025-04-04 17:04:39	2025-04-04 17:04:39
30	In fugiat saepe quia.	Mr. Rupert Lind III	Deserunt ullam beatae id voluptatem enim doloremque. Et vel cumque ea earum odit blanditiis. Et dolor doloremque illo et excepturi.	consequatur	slovak	87.33	45	165	2025-04-04 17:04:39	2025-04-04 17:04:39
31	In nobis.	Marianna Quitzon	Incidunt facilis sit temporibus quis labore exercitationem. Sed pariatur sapiente quia. Laudantium doloribus aut magnam exercitationem exercitationem.	quia	slovak	93.18	34	345	2025-04-04 17:04:39	2025-04-04 17:04:39
32	Est laborum quidem distinctio.	Demarcus Bosco PhD	Exercitationem rerum nihil cupiditate quam consequatur id. Odit nostrum magni qui nemo. Qui accusamus sit cupiditate laborum vero cumque sed.	aut	russian	28.20	6	83	2025-04-04 17:04:39	2025-04-04 17:04:39
33	Illum in suscipit provident itaque.	Guido Medhurst	In voluptatum nam iusto doloremque. Laborum exercitationem non sapiente expedita quasi. Pariatur eveniet quidem sit quod repellat.	quis	german	85.11	42	338	2025-04-04 17:04:39	2025-04-04 17:04:39
34	Iure fuga.	Evalyn Haag	Ut voluptatem dolorum et nulla. Aut laudantium ducimus aperiam qui ut. Et qui qui dolorum doloribus accusantium.	doloremque	russian	41.65	19	485	2025-04-04 17:04:39	2025-04-04 17:04:39
35	Ducimus neque ex.	Prof. Chet Schaefer	Et alias dolores similique ea sunt. Laboriosam non rerum exercitationem labore debitis. Repellendus fugit necessitatibus nemo neque.	voluptas	english	25.79	49	187	2025-04-04 17:04:39	2025-04-04 17:04:39
36	Aut dicta vel.	Theodore Schamberger	Nihil omnis doloremque consectetur. Dolorum enim fugit at libero. Aut suscipit non eos commodi et assumenda esse impedit. Non laborum qui quis aut earum.	libero	german	92.93	41	101	2025-04-04 17:04:39	2025-04-04 17:04:39
37	Cum ea perferendis atque.	Jaden Mayer	Tempora voluptatem architecto a animi distinctio nemo a voluptate. Dolor aliquid iste est odit. Voluptatem temporibus deleniti quia.	aut	slovak	41.39	34	269	2025-04-04 17:04:39	2025-04-04 17:04:39
38	Animi rerum.	Miss Bonnie Gislason	Facilis expedita consequatur dolor. Repellendus et consequatur voluptas voluptas. Sunt dolorum labore et possimus praesentium. Ab nesciunt sed quos dolore sunt ipsum saepe.	aut	slovak	58.28	11	42	2025-04-04 17:04:39	2025-04-04 17:04:39
39	Voluptate omnis molestias.	Christelle Hansen	Numquam maiores alias dolor et et. Voluptatum impedit maxime et reiciendis voluptas sint perferendis corporis. Aut magni deserunt qui quidem recusandae ea.	voluptas	russian	61.58	31	405	2025-04-04 17:04:39	2025-04-04 17:04:39
40	Voluptatem id repellat omnis.	Patrick Ernser	Dolorum excepturi debitis iure vel ipsa neque totam. Qui nulla quidem aspernatur officiis officia. Quidem labore ut qui libero necessitatibus minima.	in	german	79.53	43	114	2025-04-04 17:04:39	2025-04-04 17:04:39
41	Expedita tempora reprehenderit.	Mrs. Victoria Ortiz PhD	Voluptas accusantium magnam deleniti harum autem facere. Qui rem sint laborum rerum. Illum cum maiores nihil repellendus.	quisquam	german	62.18	3	454	2025-04-04 17:04:39	2025-04-04 17:04:39
42	Consectetur minima similique vero.	Carleton Connelly	Enim ducimus et qui ducimus maxime ut. Molestiae impedit facilis dolores similique itaque sequi hic quas. Qui ab rem animi et.	perferendis	english	17.33	39	98	2025-04-04 17:04:39	2025-04-04 17:04:39
43	Atque quia sed.	Jermaine O'Conner PhD	Id quaerat blanditiis quod. Aut vel ipsam nemo ut. Velit explicabo quidem sint quis.	dolores	german	81.46	32	241	2025-04-04 17:04:39	2025-04-04 17:04:39
44	Nam id consequatur reprehenderit aut.	Priscilla McKenzie	Et aut est ea voluptatem velit ut ea. Illo voluptatem officiis esse a. Sit assumenda nihil laboriosam quo repudiandae et dolorem.	aut	english	30.25	27	62	2025-04-04 17:04:39	2025-04-04 17:04:39
45	Et quo aliquid consequatur.	Mr. Orval Bahringer	Quasi et dolorum natus et omnis quia. Animi numquam exercitationem iusto. Omnis est ullam et voluptas ut. Eum iure autem iusto rerum odit odio. Eaque et dicta sed et quis quam deserunt molestias.	distinctio	english	97.54	42	468	2025-04-04 17:04:39	2025-04-04 17:04:39
46	Excepturi tempora magni.	Kraig Grady	Ipsum quidem velit quaerat modi quia quod soluta. Earum ducimus ratione qui quibusdam error est at neque. Praesentium officia aut blanditiis dolor consectetur.	illo	russian	14.90	8	293	2025-04-04 17:04:39	2025-04-04 17:04:39
47	Delectus nesciunt laboriosam optio non.	Miss Nyasia Mitchell V	Consequatur placeat at officiis voluptate magni eius in officiis. Voluptates saepe in explicabo in voluptatem ut expedita. Consequatur non quia nemo voluptas.	ut	slovak	94.25	30	235	2025-04-04 17:04:39	2025-04-04 17:04:39
48	Aspernatur illo.	Dr. Horace Kris	Consequuntur aut qui quo ut quis. Sit tempore amet perferendis. Necessitatibus sunt quia et quia quod. Esse nostrum voluptatem quia sed cumque dolores.	et	german	29.48	11	44	2025-04-04 17:04:39	2025-04-04 17:04:39
49	Et dolorem dolores consequuntur.	Demond Torphy	Sint maxime qui voluptas tempora. Omnis maxime autem laborum et aperiam. Alias omnis dolor corporis aut.	ratione	slovak	27.31	10	158	2025-04-04 17:04:39	2025-04-04 17:04:39
50	Soluta quod commodi eum non.	Jany Hahn I	Maxime ut enim autem. Rem vero eos est aut ut excepturi. Molestiae delectus dignissimos eveniet tempore non omnis optio. Excepturi modi sit non rerum deserunt consequatur. Est qui omnis veniam.	nobis	german	96.96	0	122	2025-04-04 17:04:39	2025-04-04 17:04:39
51	Quas cum.	Dr. Tad Hyatt MD	Voluptas deleniti sed autem earum quos praesentium praesentium. At vitae rerum natus et nisi. Commodi quod voluptatem quod doloremque adipisci ea enim.	explicabo	german	10.32	35	483	2025-04-04 17:04:39	2025-04-04 17:04:39
52	Facere laboriosam dolores quidem.	Tony Walsh	Aut error fugit harum qui adipisci magnam est eius. Aliquam sit corporis consequatur molestiae id velit. In sequi nostrum totam porro aut. Ut atque est itaque consequatur reprehenderit aut.	illum	slovak	6.74	31	31	2025-04-04 17:04:39	2025-04-04 17:04:39
53	Eum eligendi repudiandae.	Ms. Laurianne McLaughlin V	Placeat optio qui qui dolores. Atque facere rerum et rerum. Reiciendis quo quod beatae. Blanditiis laudantium et animi ipsam veniam provident beatae.	eligendi	german	77.73	16	48	2025-04-04 17:04:39	2025-04-04 17:04:39
54	Amet ad illo.	Flossie Kub Sr.	Illo tempore minus quia sit aliquid. Eum et est sed odio. Fugit excepturi dolor facere quia eum.	sed	german	79.54	38	47	2025-04-04 17:04:39	2025-04-04 17:04:39
55	Eos et asperiores quia.	Marielle Zieme	Fugit dicta officia neque. In sit magnam qui necessitatibus nihil ut non. Quibusdam aut ratione reprehenderit ut explicabo cumque quasi iure. Est quaerat quod voluptate fugit qui possimus.	voluptates	english	40.44	13	431	2025-04-04 17:04:39	2025-04-04 17:04:39
56	Explicabo sed cum.	Waldo Wisoky DDS	Quos aut perferendis natus assumenda et voluptates. Ullam mollitia atque tempore autem sequi quos. Omnis nihil iste neque odio porro. Nihil aliquid aut totam necessitatibus.	consequatur	russian	99.59	39	301	2025-04-04 17:04:39	2025-04-04 17:04:39
57	Rerum sint vel.	Elda Abbott V	Et iste ex voluptate eveniet voluptatem dolores quibusdam. Id in sapiente culpa atque modi sunt amet. Possimus modi temporibus unde quas quos autem.	rerum	slovak	41.85	18	374	2025-04-04 17:04:39	2025-04-04 17:04:39
58	Est officia illo tenetur.	Jane Dach	Vel aut dolorem et doloribus ipsum ut. Eos saepe ipsum veniam quis quia qui. Eveniet hic ut et maxime quod minus vitae voluptas.	ea	slovak	15.54	15	77	2025-04-04 17:04:39	2025-04-04 17:04:39
59	Provident possimus molestiae.	Prof. Columbus Parker	Sint aperiam ratione ea. Ipsam rerum quidem iusto perspiciatis. Natus velit quas soluta et est corporis. Ipsa quae explicabo enim sit quo.	quia	slovak	40.49	1	138	2025-04-04 17:04:39	2025-04-04 17:04:39
60	Aliquam blanditiis ex molestiae.	Miss Florence Kulas	Earum aut et incidunt voluptatibus fuga adipisci recusandae eum. Autem aut vel aut et. Eius pariatur labore rem ducimus sint eos. Nesciunt et dignissimos ea molestias doloribus dolorum.	optio	russian	63.51	41	474	2025-04-04 17:04:39	2025-04-04 17:04:39
61	Minus earum iusto repudiandae.	Mr. Alejandrin Grimes Jr.	Provident aut pariatur rem consequatur perferendis rem id. Aspernatur sed et consequuntur aliquid. Dolor ipsam asperiores sequi odit.	doloremque	english	27.66	13	19	2025-04-04 17:04:39	2025-04-04 17:04:39
62	Nostrum aut doloribus quam.	Clovis Stoltenberg	Aliquam quibusdam qui et ab praesentium. Dolores consequatur voluptates cumque dolore repellat maiores dolorum. Sit error quia et rerum.	eum	slovak	77.69	7	273	2025-04-04 17:04:39	2025-04-04 17:04:39
63	Labore est provident.	Mr. Hilton Tremblay	Neque sint et vero tempore optio. Rerum minima omnis blanditiis. Aut accusamus quia ipsam eum. Earum id ex omnis inventore sunt.	consectetur	slovak	24.29	27	403	2025-04-04 17:04:39	2025-04-04 17:04:39
64	Quod veritatis quia natus.	Prof. Savion Reinger DVM	Quia quam consequatur a aut temporibus veniam. Voluptatem aperiam et ut est nobis labore. Explicabo non et aperiam sit nam aut ipsum enim. Praesentium tenetur occaecati porro odio est.	amet	german	34.06	16	323	2025-04-04 17:04:39	2025-04-04 17:04:39
65	Ab quidem.	Ms. Aileen Miller	Consequatur libero ut beatae minima. Qui voluptas laudantium ducimus est quia aperiam sit. Suscipit qui minima illum dolorum maxime eum quos pariatur.	animi	slovak	54.76	8	463	2025-04-04 17:04:39	2025-04-04 17:04:39
66	Cum optio autem.	Chester Bogisich	Tempore eum voluptatem doloremque reprehenderit quae deleniti. Rerum in dicta consequuntur adipisci tenetur. Ut atque aut reprehenderit ducimus ad omnis aliquid.	laborum	slovak	52.09	24	181	2025-04-04 17:04:39	2025-04-04 17:04:39
67	Alias quia exercitationem.	Esta Bernier	Beatae aut fugiat accusamus officiis officia ratione. Reprehenderit error explicabo accusamus quo odio dolore. Vel totam ut praesentium et et omnis veniam.	necessitatibus	russian	58.99	33	416	2025-04-04 17:04:39	2025-04-04 17:04:39
68	Et assumenda dolorem.	Eleanora Rosenbaum	Reiciendis vitae sed qui. Assumenda quae animi autem occaecati sit. Et libero consectetur accusamus aliquid. Et enim ut impedit qui expedita possimus eveniet accusantium.	officia	german	10.27	36	445	2025-04-04 17:04:39	2025-04-04 17:04:39
69	Possimus velit.	Prof. Aurore Marks	Hic commodi similique repellat. Voluptatem voluptatum et asperiores placeat distinctio doloribus aut voluptas. Est quibusdam rerum quisquam rem cumque.	et	german	46.56	29	477	2025-04-04 17:04:39	2025-04-04 17:04:39
70	Dolores quasi dolores.	Ara Collier II	Perferendis voluptatum odit et possimus quo. Natus nulla neque qui necessitatibus. Sit omnis exercitationem quod ea sint nulla rerum nulla. Sunt repudiandae modi omnis cumque.	magni	english	79.50	6	379	2025-04-04 17:04:39	2025-04-04 17:04:39
71	Quia sit pariatur.	Idell Reichert III	Ex temporibus expedita velit minima dolorem dicta dolores. Et sint ullam et eius nam esse. Hic vitae quas ut non ullam qui ab. Corrupti sit quia veniam eum dolorem. Aut autem ipsam enim nesciunt.	quis	russian	30.87	30	478	2025-04-04 17:04:39	2025-04-04 17:04:39
72	Qui porro omnis.	Ms. Alexandrine Nolan	Consequatur dolorem necessitatibus minima dolores est accusantium quo voluptates. Mollitia cupiditate optio cum quo quo enim sit praesentium.	ratione	slovak	53.75	18	238	2025-04-04 17:04:39	2025-04-04 17:04:39
73	Id voluptas et.	Mrs. Vivienne Dare IV	Ipsa optio a et. Id aut accusantium minima. Dolore eligendi adipisci molestiae dolorem sit vitae architecto.	distinctio	russian	74.55	22	416	2025-04-04 17:04:39	2025-04-04 17:04:39
74	Voluptas eius suscipit sunt.	Daisha Hoppe	Explicabo consequatur eum magnam quidem cupiditate quo doloremque. Labore quia voluptates porro doloremque omnis et odit. Aut eligendi eaque similique aut quam.	explicabo	german	35.50	33	142	2025-04-04 17:04:39	2025-04-04 17:04:39
75	Commodi autem quas optio deserunt.	Chadrick Reynolds	Minus quasi sint qui laboriosam molestiae illum. Ratione at non minima aliquid est animi maxime. Et maxime nesciunt error qui debitis.	iste	german	11.93	38	259	2025-04-04 17:04:39	2025-04-04 17:04:39
76	Nihil voluptatem quibusdam.	Tierra Spinka	Cupiditate molestiae explicabo recusandae numquam vel. Eligendi ea autem ad harum quidem. Numquam voluptatem hic adipisci voluptatum sint.	nobis	german	33.29	29	346	2025-04-04 17:04:39	2025-04-04 17:04:39
77	Voluptatibus temporibus voluptas a.	Cecile Brekke Jr.	Consectetur rerum occaecati omnis rerum dolore quam delectus. Quod sed est rem facilis labore est. Eos quia corporis beatae. Eligendi dolor ipsum cupiditate dolore nostrum harum.	deleniti	german	75.09	32	369	2025-04-04 17:04:39	2025-04-04 17:04:39
78	Deleniti quia velit.	Mrs. Aliza Prosacco	Cum consequuntur velit dolores laboriosam. Fugiat omnis error quae dolores quam alias natus. Accusamus rerum amet quaerat voluptas et quia nam.	perferendis	slovak	44.19	50	357	2025-04-04 17:04:39	2025-04-04 17:04:39
79	Voluptatem illum rerum tempora.	Mr. Jimmie Maggio	Id corporis ipsa in consequuntur. At expedita soluta est quis sint sunt. Alias consequatur officiis qui unde. Qui hic sunt aspernatur enim.	dicta	slovak	87.71	16	335	2025-04-04 17:04:39	2025-04-04 17:04:39
80	Ut cupiditate voluptatem deleniti.	Zelda Gorczany	Saepe aliquid et nihil aut perspiciatis et aut. Voluptas quo nihil id quas totam.	et	english	98.70	8	278	2025-04-04 17:04:39	2025-04-04 17:04:39
81	Et et quidem iste.	Blake Lubowitz	Modi in nemo nihil. Provident et voluptatem cumque et. Rerum non placeat quia laboriosam.	et	russian	5.15	19	341	2025-04-04 17:04:39	2025-04-04 17:04:39
82	Qui ipsum dolorem iure.	Arturo Heller	Eveniet mollitia earum minima impedit. Autem natus non aut. Molestias quasi placeat hic corrupti. Sunt quidem similique magni voluptatem id.	voluptas	english	82.56	15	393	2025-04-04 17:04:39	2025-04-04 17:04:39
83	Sint laboriosam mollitia et.	Nicolette Champlin IV	Repellat enim debitis doloribus repudiandae. Unde molestiae voluptatum nobis maxime. Voluptate ut consequatur consequatur recusandae nesciunt corrupti vel.	qui	english	56.00	38	345	2025-04-04 17:04:39	2025-04-04 17:04:39
84	Dolor et rerum.	Kylee Kihn	Ratione tempora odio assumenda sequi molestiae ut eum. Quia corrupti et quasi repudiandae eum laboriosam. Eaque deleniti laborum fuga id repellendus voluptas.	sunt	english	18.38	19	228	2025-04-04 17:04:39	2025-04-04 17:04:39
85	Deleniti assumenda pariatur et.	Mr. Damon Blanda	Vero mollitia non voluptas ut non quis rerum. Tenetur exercitationem voluptatem eaque.	sunt	english	74.79	23	27	2025-04-04 17:04:39	2025-04-04 17:04:39
86	Consequuntur inventore sed et.	Lou Yundt	Nulla quaerat autem ea quisquam esse modi. Quia deleniti autem nam veritatis eos enim recusandae. Esse illo et labore quibusdam quia odit necessitatibus.	pariatur	german	79.26	35	342	2025-04-04 17:04:39	2025-04-04 17:04:39
87	Illo voluptatum omnis eos.	Miss Willow Howell II	Quaerat libero et et adipisci commodi numquam. Ea aut aut sit velit aspernatur. Quis distinctio eius distinctio commodi at modi.	aut	russian	57.68	45	352	2025-04-04 17:04:39	2025-04-04 17:04:39
88	Dolores et quae aut et.	Rupert Bashirian	Ducimus blanditiis qui earum sapiente magnam. Quis rerum eveniet ipsum explicabo. Omnis possimus ut illum at non ut.	et	german	99.37	44	487	2025-04-04 17:04:39	2025-04-04 17:04:39
89	Aut vitae.	Mike Pfannerstill	Dolorum illum facilis explicabo voluptatum molestias eligendi tempore. Ex qui dolorem et assumenda mollitia. Quia omnis animi minus possimus porro a dolor. Sunt ea doloribus impedit est.	sed	english	43.43	25	435	2025-04-04 17:04:39	2025-04-04 17:04:39
90	Error fugiat voluptas soluta.	Dr. Frederik Kohler	Dolor id explicabo laudantium voluptas aut. Consequatur laudantium tenetur nemo velit ullam nesciunt numquam. Consequatur qui vel perferendis odit.	aut	german	21.15	23	488	2025-04-04 17:04:39	2025-04-04 17:04:39
91	Dignissimos deserunt ut non.	Leila Williamson	Praesentium placeat repudiandae non. Reprehenderit cum nostrum nihil. Cum saepe deleniti mollitia natus aut at qui.	voluptas	slovak	98.44	41	460	2025-04-04 17:04:39	2025-04-04 17:04:39
92	Nemo dolorum exercitationem ea.	Seth Ortiz	Nemo iste fugit aut dignissimos. Earum sint veritatis pariatur ea id. Aliquid voluptatem eveniet nihil assumenda. Perspiciatis omnis velit ea amet ad omnis repudiandae.	vero	english	40.36	11	25	2025-04-04 17:04:39	2025-04-04 17:04:39
93	Ducimus qui cumque inventore.	Mr. Dustin Fisher Sr.	Ipsum suscipit dolorem natus voluptatibus vitae quidem. Quia deserunt libero magni nemo hic. Qui aut amet asperiores pariatur sequi.	harum	russian	87.40	44	5	2025-04-04 17:04:39	2025-04-04 17:04:39
94	Voluptas quisquam aut.	Cora Luettgen	Ut iusto est quis deleniti. Qui deleniti quaerat est alias. Rerum dolores et aut numquam voluptate enim. Commodi sed doloremque nulla ex praesentium.	beatae	slovak	38.39	1	489	2025-04-04 17:04:39	2025-04-04 17:04:39
95	Adipisci sed occaecati.	Chelsie Wuckert	Ab nisi sed quo mollitia rerum. Incidunt est delectus cupiditate quas quaerat. Voluptatibus sit earum et temporibus eveniet. Libero et ex est ea perspiciatis laborum provident.	accusamus	slovak	29.51	5	261	2025-04-04 17:04:39	2025-04-04 17:04:39
96	Asperiores in.	Sister Boyle	Ut animi excepturi in labore omnis soluta. Excepturi eius accusantium aut eveniet explicabo quis. Blanditiis et doloremque suscipit dolore aut officia. Officiis recusandae eius necessitatibus error.	assumenda	english	59.58	37	17	2025-04-04 17:04:39	2025-04-04 17:04:39
97	Fugit quos alias odit.	Willy Wilderman	Eum beatae ex blanditiis officiis. Aut excepturi culpa ratione quia eius. Vero quasi amet dolores sit vero provident quo. Asperiores adipisci deserunt ut cum accusamus.	repellendus	russian	58.56	33	427	2025-04-04 17:04:39	2025-04-04 17:04:39
98	Iure qui officia.	Haylee Okuneva	Et quia numquam deserunt voluptatem. Magnam quod possimus praesentium. Placeat velit sequi blanditiis odio alias perferendis ut. Blanditiis ipsum id sed ut ab dolores.	rerum	english	72.16	39	135	2025-04-04 17:04:39	2025-04-04 17:04:39
99	Nulla consectetur aliquam.	Miss Lurline Windler	In aut nam asperiores perspiciatis. Est laboriosam consequuntur omnis. Iure in praesentium blanditiis voluptatem.	repudiandae	english	90.90	47	137	2025-04-04 17:04:39	2025-04-04 17:04:39
100	Exercitationem qui.	Michael Moore	Aliquid nisi neque nesciunt porro. Ipsa hic aut eaque in voluptatem. Necessitatibus tempore et ut doloremque maiores pariatur. Animi assumenda at aperiam.	culpa	german	90.17	11	282	2025-04-04 17:04:39	2025-04-04 17:04:39
\.


--
-- TOC entry 4943 (class 0 OID 25585)
-- Dependencies: 222
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
UbLAU9oxg1YLDwYicVUursyEh52OxkUbfOCWNSM2	8	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiakVXcGFKN3FmTEFZaXJZNGE2ZmxPSlYwV2plRDQ3OHJOM1ZOVWQ3WiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cz9sYW5ndWFnZSU1QjAlNUQ9U2xvdmFrIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODt9	1743797040
\.


--
-- TOC entry 4941 (class 0 OID 25568)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, last_name, birth_date, phone_number, role) FROM stdin;
2	Rado	test@gmail.com	\N	$2y$12$FYVdwxKW/1AqQj3IpGUBuOWDIw.oZEdCEB41zeXlsOaqHlfar7/Kq	\N	2025-04-04 10:30:52	2025-04-04 10:30:52	\N	\N	\N	user
5	t2	test1@gmail.com	\N	$2y$12$N5gUELu6QWuXQhjYH4LXfuIMXyl7LUFMjxIWzU0f8lcg.ntsr8RY2	\N	2025-04-04 15:15:35	2025-04-04 15:15:35	\N	\N	\N	user
6	t1	test2@gmail.com	\N	$2y$12$tICHth7j0HyUVEizUJ3Ls.PexAqD52p4YvlHUIBcb76T4FBGC4CDi	\N	2025-04-04 15:26:31	2025-04-04 15:26:31	\N	\N	\N	user
7	admin	admin@gmail.com	\N	$2y$12$GcLVO9SmvUy.IHZhYFUe2epWwb1iKU7Zrzzfbdj1P7J9p7iJJ5c8i	\N	2025-04-04 15:39:58	2025-04-04 15:39:58	\N	\N	\N	user
8	t3	test3@gmail.com	\N	$2y$12$qC9crri6pGlj8Qrn9q2Hp.6lzyDxDykokj7V2DftBbcRu0JmlA5/m	\N	2025-04-04 15:59:41	2025-04-04 15:59:41	\N	\N	\N	user
\.


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 234
-- Name: product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_image_id_seq', 200, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 232
-- Name: product_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_user_id_seq', 1, false);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 100, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- TOC entry 4774 (class 2606 OID 25607)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4772 (class 2606 OID 25600)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4781 (class 2606 OID 25634)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 25636)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4779 (class 2606 OID 25624)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 25616)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 25566)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 25584)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4789 (class 2606 OID 25675)
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 25658)
-- Name: product_user product_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_user
    ADD CONSTRAINT product_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 25651)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 25591)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4762 (class 2606 OID 25577)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4764 (class 2606 OID 25575)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 1259 OID 25617)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4767 (class 1259 OID 25593)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4770 (class 1259 OID 25592)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4792 (class 2606 OID 25676)
-- Name: product_image product_image_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4790 (class 2606 OID 25664)
-- Name: product_user product_user_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_user
    ADD CONSTRAINT product_user_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4791 (class 2606 OID 25659)
-- Name: product_user product_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_user
    ADD CONSTRAINT product_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-04-04 22:13:49

--
-- PostgreSQL database dump complete
--

