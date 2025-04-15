--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-15 14:55:39

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



--
-- TOC entry 4945 (class 0 OID 25601)
-- Dependencies: 224
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4950 (class 0 OID 25626)
-- Dependencies: 229
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4948 (class 0 OID 25618)
-- Dependencies: 227
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4947 (class 0 OID 25609)
-- Dependencies: 226
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4939 (class 0 OID 25561)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (4, '2025_04_04_154907_modify_users_table', 2);
INSERT INTO public.migrations VALUES (5, '2025_04_04_160709_create_products_table', 3);
INSERT INTO public.migrations VALUES (6, '2025_04_04_162154_create_product_user_table', 4);
INSERT INTO public.migrations VALUES (7, '2025_04_04_162733_create_product_image_table', 5);


--
-- TOC entry 4942 (class 0 OID 25578)
-- Dependencies: 221
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4956 (class 0 OID 25670)
-- Dependencies: 235
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_image VALUES (1, 2, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (2, 2, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (3, 3, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (4, 3, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (5, 4, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (6, 4, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (7, 5, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (8, 5, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (9, 6, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (10, 6, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (11, 7, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (12, 7, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (13, 8, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (14, 8, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (15, 9, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (16, 9, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (17, 10, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (18, 10, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (19, 11, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (20, 11, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (21, 12, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (22, 12, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (23, 13, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (24, 13, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (25, 14, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (26, 14, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (27, 15, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (28, 15, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (29, 16, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (30, 16, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (31, 17, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (32, 17, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (33, 18, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (34, 18, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (35, 19, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (36, 19, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (37, 20, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (38, 20, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (39, 21, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (40, 21, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (41, 22, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (42, 22, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (43, 23, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (44, 23, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (45, 24, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (46, 24, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (47, 25, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (48, 25, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (49, 26, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (50, 26, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (51, 27, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (52, 27, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (53, 28, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (54, 28, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (55, 29, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (56, 29, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (57, 30, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (58, 30, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (59, 31, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (60, 31, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (61, 32, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (62, 32, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (63, 33, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (64, 33, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (65, 34, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (66, 34, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (67, 35, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (68, 35, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (69, 36, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (70, 36, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (71, 37, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (72, 37, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (73, 38, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (74, 38, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (75, 39, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (76, 39, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (77, 40, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (78, 40, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (79, 41, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (80, 41, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (81, 42, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (82, 42, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (83, 43, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (84, 43, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (85, 44, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (86, 44, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (87, 45, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (88, 45, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (89, 46, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (90, 46, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (91, 47, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (92, 47, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (93, 48, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (94, 48, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (95, 49, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (96, 49, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (97, 50, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (98, 50, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (99, 51, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (100, 51, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (101, 52, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (102, 52, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (103, 53, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (104, 53, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (105, 54, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (106, 54, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (107, 55, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (108, 55, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (109, 56, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (110, 56, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (111, 57, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (112, 57, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (113, 58, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (114, 58, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (115, 59, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (116, 59, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (117, 60, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (118, 60, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (119, 61, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (120, 61, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (121, 62, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (122, 62, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (123, 63, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (124, 63, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (125, 64, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (126, 64, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (127, 65, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (128, 65, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (129, 66, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (130, 66, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (131, 67, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (132, 67, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (133, 68, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (134, 68, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (135, 69, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (136, 69, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (137, 70, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (138, 70, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (139, 71, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (140, 71, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (141, 72, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (142, 72, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (143, 73, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (144, 73, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (145, 74, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (146, 74, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (147, 75, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (148, 75, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (149, 76, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (150, 76, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (151, 77, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (152, 77, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (153, 78, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (154, 78, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (155, 79, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (156, 79, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (157, 80, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (158, 80, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (159, 81, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (160, 81, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (161, 82, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (162, 82, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (163, 83, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (164, 83, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (165, 84, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (166, 84, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (167, 85, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (168, 85, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (169, 86, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (170, 86, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (171, 87, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (172, 87, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (173, 88, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (174, 88, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (175, 89, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (176, 89, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (177, 90, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (178, 90, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (179, 91, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (180, 91, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (181, 92, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (182, 92, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (183, 93, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (184, 93, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (185, 94, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (186, 94, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (187, 95, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (188, 95, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (189, 96, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (190, 96, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (191, 97, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (192, 97, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (193, 98, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (194, 98, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (195, 99, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (196, 99, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (197, 100, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (198, 100, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (199, 101, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (200, 101, '/product_images/circle2.jpg', NULL, NULL);


--
-- TOC entry 4954 (class 0 OID 25653)
-- Dependencies: 233
-- Data for Name: product_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4952 (class 0 OID 25640)
-- Dependencies: 231
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (2, 'Temporibus distinctio magnam.', 'George Orwell', 'Hic amet nostrum officiis ad quia. Voluptatem voluptatem ducimus quis reprehenderit. Nobis ut sunt ratione dolorem et natus.', 'Detective', 'english', 53.01, 23, 108, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (3, 'Veniam sed architecto.', 'Jozef Karika', 'Fuga molestiae omnis inventore omnis recusandae. A sint fugiat impedit laborum quaerat quo. Maxime sunt tempore eum. Aliquam et qui quis.', 'Science Fiction', 'english', 84.73, 47, 17, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (4, 'Aut tenetur expedita.', 'Dominik Dan', 'Sit eum ullam perspiciatis quod nemo adipisci aliquid. Illo asperiores odio eveniet officiis. Autem quo ullam ipsam velit culpa id aliquid.', 'Horror', 'slovak', 37.60, 26, 428, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (5, 'Voluptatibus quibusdam.', 'Dominik Dan', 'Ad ut consequuntur ullam ut quas. Itaque rem neque laudantium excepturi qui. Qui consequatur cumque esse.', 'Science Fiction', 'russian', 80.55, 33, 333, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (6, 'Officia enim et.', 'Philip K. Dick', 'Labore assumenda quidem id error quaerat fuga. Est quo sit pariatur suscipit voluptatem. Pariatur exercitationem magni odit sunt fuga.', 'Classic', 'slovak', 9.82, 0, 439, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (7, 'Cupiditate deserunt pariatur.', 'Dominik Dan', 'Repellendus eum blanditiis deleniti nihil accusantium facere cumque. Est hic totam sunt voluptates pariatur tempora repellendus. Veritatis aut laboriosam quia animi.', 'Horror', 'russian', 33.72, 45, 54, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (8, 'Quia veniam assumenda.', 'Dominik Dan', 'Debitis eum adipisci perferendis occaecati. Error blanditiis dolores ea molestiae incidunt. Fugiat qui eum doloremque architecto fugit. Ullam cum rerum debitis vel quia.', 'Detective', 'slovak', 38.69, 4, 94, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (9, 'Voluptatum fugit.', 'Jozef Karika', 'Id reiciendis et aliquid dolor cumque nam iste. Omnis ea delectus eius tenetur accusamus. Tempora ipsum sit sed quos aut enim eos. Dolorem aut impedit placeat velit. Ratione in ut odit autem.', 'Horror', 'slovak', 86.00, 14, 373, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (10, 'Ex sapiente quasi dolores.', 'George Orwell', 'Sunt iste rerum perspiciatis omnis inventore. Molestiae saepe quo exercitationem assumenda sapiente aut. Eveniet dolores distinctio doloremque in id quaerat odio minus. Libero aut eum et vel.', 'Classic', 'german', 23.28, 30, 329, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (11, 'Cum et sequi sint.', 'George Orwell', 'Molestias in voluptatem et fugiat rerum non. Accusamus consectetur sit et molestias ut aspernatur. Blanditiis rem est harum. Perspiciatis quasi vero inventore est.', 'Science Fiction', 'slovak', 28.72, 50, 105, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (12, 'Quo quasi.', 'Dominik Dan', 'Voluptatibus voluptas dolorem in quisquam dolorem. Unde odio dolor qui quo sed veniam. Illum inventore aliquam et odio qui enim. Ab voluptas ullam sit.', 'Classic', 'english', 74.95, 45, 273, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (13, 'Consequuntur laudantium debitis.', 'George Orwell', 'Similique omnis nemo sit voluptatem aut officia. Aut repellendus labore sunt repellat dicta beatae aut. Fugiat earum illo et quas ut sed nihil aut. Error doloribus voluptates et rerum.', 'Science Fiction', 'russian', 74.71, 40, 345, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (14, 'Atque enim aut.', 'Dominik Dan', 'Rerum nisi et reiciendis fugiat nisi. Saepe eos ipsa excepturi et. Similique sapiente voluptates inventore laboriosam necessitatibus sit.', 'Science Fiction', 'german', 82.13, 29, 362, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (15, 'Ea quo aliquam similique.', 'George Orwell', 'Eligendi quia autem ut quo ut velit amet. Et provident fugiat repellat enim dolorem omnis. Cumque sed mollitia occaecati autem beatae. Quas officia dicta sed aut voluptate omnis et.', 'Horror', 'russian', 60.16, 49, 288, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (16, 'Facilis in quia inventore incidunt.', 'Jozef Karika', 'Dolor ut eos amet pariatur iure sed labore quia. Ab numquam libero cum et illum laborum nihil. Provident non vero placeat cumque sit accusamus et. Ut ullam temporibus et eum sit.', 'Classic', 'german', 5.43, 22, 339, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (17, 'Quam id maiores.', 'Philip K. Dick', 'Ut culpa reprehenderit sapiente eos quidem ex. Soluta placeat voluptas vel mollitia. Ad ut dolor fuga aut sequi vel. Excepturi veniam quasi minima.', 'Classic', 'russian', 99.82, 22, 82, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (18, 'Beatae veritatis quidem hic.', 'Jozef Karika', 'Et quidem cumque aut sint ea tempore. Cupiditate enim ad qui consequatur consequatur et et rem. Voluptatum laboriosam quaerat deserunt voluptate quam architecto et molestiae. Est magni sint nam.', 'Horror', 'english', 77.72, 46, 395, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (19, 'Nesciunt sed ipsa adipisci.', 'Dominik Dan', 'Rerum consequuntur quo excepturi est. Pariatur ducimus sed quia esse praesentium nostrum sunt dignissimos. Unde possimus adipisci eum totam ut. Explicabo quas voluptas vero illum et.', 'Detective', 'slovak', 73.80, 48, 76, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (20, 'Rerum tenetur exercitationem.', 'Jozef Karika', 'Aut et autem omnis et placeat. Aliquid voluptatum nihil voluptatem ipsam eos. Ea error asperiores reiciendis. Aut porro omnis officia fuga odit corrupti qui.', 'Horror', 'russian', 62.98, 14, 469, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (21, 'Tenetur culpa quis accusamus.', 'Jozef Karika', 'Rem hic in magnam tempora recusandae ex quia. Quos optio dicta quia placeat. Id unde itaque unde distinctio. Atque modi iusto praesentium est. Animi accusamus at fugiat officiis.', 'Detective', 'russian', 47.57, 36, 283, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (22, 'Sunt dolor et.', 'Jozef Karika', 'Qui quam dolores nihil nisi. Rerum quo fugiat quia explicabo. Eligendi minima et quos exercitationem. Enim expedita eum ut nisi unde est minus.', 'Classic', 'english', 46.00, 17, 38, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (23, 'Aliquid impedit qui quo.', 'Jozef Karika', 'Dolor repellat pariatur amet quas atque. Autem explicabo cum libero aliquid perferendis pariatur. Nulla minima dolorum est quo repellat. Quia nam ut ab vel.', 'Science Fiction', 'english', 64.73, 4, 423, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (24, 'Quaerat aut voluptatem consequatur.', 'Dominik Dan', 'In fugiat aut eos. Praesentium nesciunt quod aperiam suscipit maiores. Enim aliquid ipsa dolorem labore omnis in.', 'Detective', 'german', 60.70, 6, 74, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (25, 'Sit ea consequatur.', 'George Orwell', 'In reprehenderit enim exercitationem et animi. Ea cumque et impedit hic voluptatem voluptatem. Omnis pariatur sit et eos quia non vitae. Aliquam in sint quis ea eos laudantium praesentium.', 'Horror', 'russian', 83.95, 8, 429, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (26, 'Dolores odit minus quis.', 'Jozef Karika', 'Mollitia asperiores perspiciatis est distinctio ad. Animi sequi et rerum necessitatibus delectus. Voluptatem non at quis neque cupiditate qui. Eius qui delectus qui et.', 'Detective', 'english', 14.45, 6, 329, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (27, 'Reiciendis consectetur dolores.', 'Jozef Karika', 'Tenetur ut itaque eius maxime sint a cumque. Rem et sunt placeat et.', 'Science Fiction', 'slovak', 5.85, 35, 371, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (28, 'Aut adipisci repudiandae.', 'Philip K. Dick', 'Tempora ullam ipsa odit voluptatum tempora quam. Inventore laudantium et qui ipsum. Nihil commodi modi dolores natus.', 'Classic', 'german', 99.63, 30, 386, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (29, 'Ea a non.', 'George Orwell', 'Natus reprehenderit et quis. Quae aperiam autem quia. Ratione est laborum nulla enim sed. Ad mollitia earum tempora unde accusantium facere facilis ex.', 'Horror', 'german', 80.46, 35, 120, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (30, 'Vero sed enim.', 'Philip K. Dick', 'Harum non enim veritatis tenetur. Necessitatibus consectetur hic quod ratione et placeat in.', 'Horror', 'english', 93.69, 20, 319, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (31, 'Optio quis officiis.', 'Jozef Karika', 'Rem quasi et enim fuga a omnis. Omnis quod quasi ut nisi cupiditate dolorum. Natus dolores ut est deserunt porro ut. Ut porro nostrum labore inventore dicta.', 'Detective', 'german', 77.50, 5, 365, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (32, 'Maxime dicta.', 'Philip K. Dick', 'Enim unde id deleniti adipisci et aut et. Voluptate adipisci ut laboriosam quae delectus. Quia animi illo nobis quam.', 'Classic', 'slovak', 28.24, 7, 335, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (33, 'Incidunt modi minus est.', 'Philip K. Dick', 'Quo ratione sit ut velit velit consequatur. Aut est cupiditate laborum velit quod. Sed et omnis tempore possimus.', 'Detective', 'russian', 57.49, 2, 205, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (34, 'Ea rerum illum.', 'Jozef Karika', 'Fugiat quos qui debitis occaecati alias. Rem autem ratione earum accusamus sed est est. Ut amet quo non id commodi.', 'Classic', 'german', 45.90, 49, 438, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (35, 'Non dolores ut totam.', 'Philip K. Dick', 'Nihil animi dolore numquam dolores dolore harum. Aut ducimus est consectetur velit.', 'Classic', 'russian', 72.24, 2, 395, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (36, 'Iusto eum nostrum.', 'George Orwell', 'Et vero aut consequatur cumque incidunt sit omnis. Molestias non quis culpa quis maxime quibusdam. Sed provident blanditiis repellat magnam.', 'Science Fiction', 'russian', 79.95, 47, 253, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (37, 'Porro nobis dicta quidem modi.', 'Jozef Karika', 'Sapiente ut voluptas possimus odio. Non mollitia modi mollitia cupiditate hic.', 'Horror', 'german', 30.38, 29, 337, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (38, 'Quis ut qui.', 'Jozef Karika', 'Nemo ipsam totam explicabo. Officiis ipsa nisi et vel quia et magni. Culpa veniam suscipit in ratione voluptas.', 'Classic', 'russian', 27.45, 23, 138, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (39, 'Possimus veritatis.', 'Jozef Karika', 'Quae vitae maiores numquam est eos. Aut voluptatum nulla et id. Atque ut qui qui molestiae quo.', 'Detective', 'russian', 38.33, 9, 198, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (40, 'Autem atque quidem.', 'Philip K. Dick', 'Repudiandae alias perspiciatis nostrum omnis nostrum et nihil. Est nostrum quod ducimus nostrum ea. Adipisci illum dicta consequuntur natus suscipit.', 'Classic', 'german', 26.39, 40, 280, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (41, 'Sunt ut.', 'Dominik Dan', 'At et sed optio voluptate consequuntur ut ab. In beatae similique sit qui nulla autem et. Modi itaque nisi voluptatem esse sunt. Incidunt ex sit omnis quis quas.', 'Detective', 'german', 10.08, 3, 109, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (42, 'Iste dolor odit eius.', 'George Orwell', 'Enim id debitis laboriosam in hic. Dolores enim dolorem quos laborum ab et. Provident consequuntur voluptatem pariatur dolor.', 'Classic', 'slovak', 10.58, 13, 488, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (43, 'Ex sed.', 'Dominik Dan', 'Tempore laboriosam deleniti accusantium ut cumque magnam est. Eum cum ut hic est. Provident dolores et quisquam dolorem. Labore laudantium qui molestiae tempore vel.', 'Horror', 'german', 70.73, 19, 297, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (44, 'Ea illo nisi quo.', 'George Orwell', 'Tempora sequi perferendis molestiae incidunt. Et ut et impedit vel eos sed numquam nihil. Maiores ex id sint nam voluptate.', 'Detective', 'german', 45.83, 41, 25, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (45, 'Eum reprehenderit nostrum vel.', 'Philip K. Dick', 'Laudantium commodi sed qui facilis. Quas fugit qui soluta voluptatum quos. Nihil autem nisi ea quaerat deleniti reiciendis. Necessitatibus corrupti quis ipsum molestiae.', 'Detective', 'german', 63.06, 33, 476, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (46, 'Quisquam fugiat at sequi veniam.', 'Dominik Dan', 'Quia est cum dolores est. Quia aut qui pariatur. Nihil cupiditate earum ut cumque sed rerum non fugit. Consequatur qui corrupti ad officia voluptatem tempora minima repellat.', 'Horror', 'german', 74.55, 16, 221, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (47, 'Adipisci vitae natus alias.', 'Philip K. Dick', 'Quas totam exercitationem libero distinctio voluptatem natus reprehenderit quia. Error et repellat ut consequatur. Voluptates fuga reiciendis vel inventore.', 'Detective', 'slovak', 58.21, 15, 450, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (48, 'Maxime quas odit.', 'Dominik Dan', 'Dolor consequuntur ut eos et tempora amet. Est aut praesentium laudantium illum sint. Corporis dicta excepturi iure et impedit quia est.', 'Science Fiction', 'slovak', 56.91, 33, 25, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (49, 'Perferendis aut cupiditate.', 'Jozef Karika', 'Iste praesentium provident omnis eum et doloremque earum recusandae. Consequuntur molestiae quae unde est aut est esse. Incidunt placeat repellendus ut quod suscipit sapiente.', 'Classic', 'russian', 20.03, 27, 31, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (50, 'Officiis id quia.', 'Philip K. Dick', 'Eveniet est quia tempora provident ut ipsa labore quisquam. Ex qui explicabo quia error eos nisi maiores. Ducimus sint corporis nam voluptatum sit ab. Explicabo quis iure voluptate.', 'Classic', 'slovak', 22.18, 18, 142, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (51, 'Quae corrupti qui.', 'Dominik Dan', 'Neque accusamus omnis hic est. Perferendis reiciendis molestiae dolores repudiandae architecto. Dolore in labore doloremque.', 'Classic', 'german', 62.67, 36, 347, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (52, 'Aperiam quidem deserunt velit.', 'Dominik Dan', 'Dicta nisi eum est. Recusandae voluptas magnam natus voluptatem fuga laborum deleniti.', 'Classic', 'german', 62.58, 33, 484, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (53, 'Enim esse assumenda et sed.', 'George Orwell', 'Eveniet doloribus neque ex. Magni eum natus animi quis.', 'Horror', 'german', 86.86, 16, 448, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (54, 'At architecto.', 'Dominik Dan', 'Rerum iusto sequi perspiciatis minus. Est quae vero est amet quas voluptas ipsa. Iste et repellat commodi quas odit libero. Assumenda omnis id necessitatibus omnis aut et sint.', 'Classic', 'russian', 14.69, 31, 80, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (55, 'Quis quod corporis.', 'Dominik Dan', 'Sapiente maxime incidunt rerum. Repellat quisquam accusamus rerum qui.', 'Detective', 'russian', 55.75, 31, 141, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (56, 'Voluptates id voluptatum deserunt eos.', 'George Orwell', 'Qui quis quaerat quo et minus doloremque. Aliquam et laboriosam enim voluptate. Earum voluptatibus vel veritatis ducimus sequi perspiciatis.', 'Science Fiction', 'german', 95.41, 30, 38, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (57, 'Quisquam veritatis officia.', 'Philip K. Dick', 'Quaerat ratione consequuntur aut reprehenderit illum aut aperiam. Doloribus ad dolores quia sunt sequi. Quia tempore deserunt sequi et enim qui labore.', 'Detective', 'russian', 19.03, 18, 267, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (58, 'Maxime sint adipisci.', 'Dominik Dan', 'Provident est ratione libero quidem nostrum autem. Maxime quia sunt autem provident quo sit et. Minus sit nihil dolor.', 'Detective', 'slovak', 26.78, 45, 467, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (59, 'Dolorem quia dolorem.', 'Philip K. Dick', 'Nostrum enim id unde temporibus doloribus perferendis. Neque illo id suscipit aliquid consequuntur similique et. Voluptas nostrum molestiae magnam voluptates nostrum accusamus.', 'Science Fiction', 'english', 5.17, 34, 246, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (60, 'Temporibus et fugiat dignissimos.', 'Jozef Karika', 'Aut sit quia iure libero alias commodi sint voluptatum. Laborum iste nihil magni nihil officia odit error. Eaque sit qui possimus velit.', 'Horror', 'russian', 27.22, 5, 168, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (61, 'Impedit excepturi expedita cum iste.', 'Dominik Dan', 'Error numquam rerum dolor cum necessitatibus qui rerum. Natus minima beatae culpa assumenda fugit eveniet. Nobis quae et maxime illum recusandae voluptas corrupti.', 'Horror', 'english', 29.41, 40, 215, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (62, 'Assumenda sint dolores perferendis.', 'Philip K. Dick', 'Nulla soluta consequuntur et quos beatae ipsum recusandae. Quia sed veniam deserunt laboriosam omnis. Officiis voluptatum omnis saepe quaerat et non sed.', 'Horror', 'german', 31.82, 7, 329, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (63, 'Ipsum voluptas.', 'George Orwell', 'Aliquam placeat dolores ab vel id nobis. Et id sit iusto. Doloribus consectetur dolores dolorem delectus voluptatem. Voluptatibus dolorem labore repudiandae tenetur.', 'Horror', 'english', 17.72, 12, 365, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (64, 'Facilis quis omnis at.', 'Philip K. Dick', 'Omnis dignissimos ipsam ut deserunt hic veniam. Et explicabo illo dolorem esse. A culpa et eveniet repudiandae.', 'Science Fiction', 'slovak', 41.93, 40, 286, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (65, 'Rem delectus omnis.', 'George Orwell', 'Nemo praesentium beatae libero. Et culpa incidunt aut. Numquam eum a optio quia officia est tenetur magni. Aut eos placeat quae quis ad architecto quo. Placeat qui et magni quo libero dolorem ipsum.', 'Classic', 'russian', 53.53, 19, 329, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (66, 'Est quae temporibus.', 'Philip K. Dick', 'Dolore vitae earum quo eligendi nam consequuntur itaque. Sunt delectus aperiam officiis animi id molestiae. Et ut facere molestiae et. Architecto minima harum odio soluta excepturi.', 'Science Fiction', 'slovak', 96.03, 30, 185, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (67, 'Doloribus rem quia quidem sint.', 'George Orwell', 'Nam quo voluptatem eum ullam tempore asperiores. Molestias consequatur quae quod reiciendis. Facilis et aut aliquam aliquam architecto voluptatem. Quisquam at voluptatem quasi non.', 'Classic', 'russian', 67.17, 40, 249, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (68, 'Omnis est sed in.', 'George Orwell', 'Quasi repudiandae consectetur totam neque atque ab. Quo veniam modi assumenda provident. Vel velit expedita nulla molestiae officiis minima deleniti.', 'Science Fiction', 'german', 35.57, 13, 8, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (69, 'Neque numquam dolorum rerum quo.', 'George Orwell', 'Occaecati culpa earum tempora aperiam. Autem qui est nobis quidem sint non. Quis tempora nihil dolor ea consequatur.', 'Science Fiction', 'russian', 73.30, 47, 229, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (70, 'Non debitis recusandae saepe.', 'George Orwell', 'Vel praesentium aut aut maiores. Sed tempore est eos facilis beatae rerum quod. Deleniti quis voluptate aperiam ipsum ea quia. Sunt qui qui quasi est. Culpa et esse totam et repudiandae.', 'Classic', 'russian', 66.11, 16, 77, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (71, 'Velit sed sunt cum.', 'Dominik Dan', 'Consequatur numquam ex illum qui. Soluta quam facilis consectetur qui nobis eos eligendi est. Quod eius ratione mollitia harum. Totam sunt ut repudiandae dolore sit aut aut.', 'Horror', 'german', 25.08, 27, 360, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (72, 'Ut nam autem.', 'Philip K. Dick', 'Optio quia fugiat et veniam. Exercitationem tempore delectus possimus sunt. Iure est error voluptatem nihil.', 'Detective', 'german', 61.06, 37, 465, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (73, 'Tempore enim accusantium est.', 'Philip K. Dick', 'Cumque accusamus quaerat expedita similique iure incidunt. Non consequatur consequatur iusto sit. Eum aut qui labore qui nihil.', 'Horror', 'slovak', 47.20, 24, 156, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (74, 'Quis minima non.', 'Dominik Dan', 'Veniam dolorem omnis commodi libero aliquam et impedit. Doloribus quibusdam debitis velit. Vero iste earum laborum iste officiis. Iure qui corporis veritatis.', 'Classic', 'slovak', 39.47, 16, 216, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (75, 'Est quo consequatur dolorem.', 'Philip K. Dick', 'Non repellat ipsa et aliquid ut in. Cupiditate tempora ea magni qui est dolor. Dolore incidunt qui non debitis. Quo doloremque qui illum et. Quo perspiciatis consequuntur molestias fugit.', 'Horror', 'slovak', 11.62, 3, 276, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (76, 'Dolor vel commodi eum.', 'Jozef Karika', 'Ipsam corrupti culpa voluptates esse a. Aspernatur dicta magnam quia quo sequi sit. Fugiat rerum inventore et molestiae nihil.', 'Classic', 'german', 42.94, 21, 123, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (77, 'Quia veritatis.', 'George Orwell', 'Vel voluptatibus quo quisquam consequuntur deleniti ut. Eaque consequatur quasi earum sint nobis. Aliquam minus dolores nulla qui voluptatem fuga.', 'Science Fiction', 'russian', 85.04, 46, 291, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (78, 'Eaque itaque minus incidunt nostrum.', 'Philip K. Dick', 'Sequi consectetur perspiciatis amet quia laudantium doloremque. Aspernatur culpa aut est nobis modi et. Aut suscipit velit aut eius qui inventore ea.', 'Classic', 'german', 69.47, 28, 405, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (79, 'Aut velit.', 'George Orwell', 'Fuga vero atque numquam quod sapiente cumque optio. Occaecati enim vero fugit tenetur velit et et. Possimus maiores magni qui voluptatem.', 'Detective', 'russian', 56.27, 3, 438, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (80, 'Minus est quam voluptatem.', 'Philip K. Dick', 'Sint deleniti tempora ea odit eos et placeat. Velit libero saepe et totam aut omnis. Nam iusto omnis qui qui tenetur aut aut labore. Sed adipisci ex accusantium.', 'Science Fiction', 'slovak', 40.71, 2, 231, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (81, 'Explicabo nulla vel veniam.', 'George Orwell', 'Delectus nisi harum ut et delectus voluptatem. Adipisci est iusto in eligendi aut.', 'Classic', 'russian', 50.92, 8, 176, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (82, 'Quibusdam sint ad quibusdam aliquam.', 'Dominik Dan', 'Ut repudiandae unde fuga qui repellat cupiditate dolorem. Est dolorum quo molestias suscipit fugiat harum tenetur. Quasi mollitia sit sed nihil animi fugiat.', 'Classic', 'english', 32.74, 14, 82, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (83, 'Est doloremque reiciendis.', 'Jozef Karika', 'Maxime vel rem nesciunt ex reiciendis. Unde aspernatur sed sequi nisi. Ut fuga eius animi similique. Et unde nihil quos vitae consequatur eum. Ut quos et accusamus.', 'Detective', 'russian', 60.65, 14, 495, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (84, 'Sunt numquam quia autem.', 'Dominik Dan', 'Delectus eos consectetur dolorem maiores consectetur atque non praesentium. Deserunt maiores odit optio vel facere modi. Eum corrupti sequi ea. Voluptas dolores cum voluptatem totam iure soluta sint.', 'Detective', 'russian', 71.22, 2, 86, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (85, 'Dolorem asperiores.', 'Dominik Dan', 'Non est sint et eos et. Illo est esse aut fugit velit sapiente quis. Iure corrupti voluptas inventore ratione dolorum. Provident saepe unde consequatur recusandae consequatur minima iste.', 'Horror', 'english', 42.26, 27, 162, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (86, 'Delectus corporis doloremque modi.', 'George Orwell', 'Quisquam ex optio praesentium ad corporis excepturi nobis. In earum recusandae aut accusantium. Qui fugit et et adipisci velit consequuntur.', 'Detective', 'slovak', 84.83, 19, 373, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (87, 'Nemo qui.', 'Dominik Dan', 'Tempore delectus quisquam qui dolorem suscipit nostrum iste. Nesciunt ea non nemo eaque veniam veniam. Ut accusantium voluptatem harum. Enim dolorem tempore doloremque accusantium excepturi cum.', 'Classic', 'russian', 67.62, 9, 236, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (88, 'Molestiae vel alias sunt.', 'Philip K. Dick', 'Alias officia facilis consectetur blanditiis. Quidem molestias deleniti rerum consequatur. Modi qui incidunt id aliquam recusandae fuga cupiditate.', 'Horror', 'slovak', 58.59, 45, 395, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (89, 'Maxime id necessitatibus.', 'Dominik Dan', 'Distinctio dolorem voluptatem nobis voluptas fugiat. Quo ratione dignissimos tempora rem rerum qui. Sit ut quidem commodi sit et. Veniam tempore illum possimus nemo.', 'Science Fiction', 'german', 46.96, 39, 152, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (90, 'Quia consequatur fuga.', 'Philip K. Dick', 'Error veritatis sunt et iste quam. Similique repellat neque laboriosam nihil voluptatem ut et molestiae. Aut itaque quisquam voluptatem debitis commodi.', 'Detective', 'russian', 80.23, 19, 432, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (91, 'Maiores sunt id voluptatem.', 'Dominik Dan', 'Enim sunt natus quas cupiditate non aut dolorem. Aperiam nisi nihil ullam sunt sed dolorum. Qui ullam illo aspernatur quis delectus in.', 'Science Fiction', 'russian', 98.22, 12, 215, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (92, 'Magnam cupiditate veritatis.', 'Jozef Karika', 'Ipsam dolores excepturi fugiat facilis officia. Sit ab magni repellendus non. Odit delectus sapiente qui. Facere mollitia excepturi alias et sapiente harum.', 'Detective', 'english', 28.92, 20, 436, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (93, 'Unde iure aut.', 'Philip K. Dick', 'Ducimus qui itaque quia sunt rem modi. Dolore explicabo itaque quia sequi. Qui qui quia rem magnam animi veniam amet. Et et ut rerum voluptas aut aut aut.', 'Classic', 'slovak', 64.77, 28, 89, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (94, 'Aut earum.', 'Philip K. Dick', 'Vitae et quis tempora explicabo. Dignissimos ut placeat amet impedit incidunt occaecati doloribus tempore. Harum sed quo quia facere cum blanditiis maiores.', 'Horror', 'english', 74.01, 17, 289, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (95, 'Excepturi dolores odit nisi.', 'Jozef Karika', 'Libero perferendis minus assumenda quaerat voluptatem ipsum. Omnis doloribus maxime est ratione at deserunt dolor.', 'Classic', 'slovak', 39.26, 6, 478, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (96, 'Incidunt cum.', 'Jozef Karika', 'Impedit porro sed ut enim et facere voluptate. Sit consequuntur harum eum ut autem nostrum vel. Ipsum ab optio quidem et id. Voluptatem suscipit et est nisi quas minima.', 'Detective', 'german', 36.11, 14, 280, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (97, 'Consequatur ut accusantium quo.', 'Jozef Karika', 'Nihil dolorem laudantium ut ab et rerum. Temporibus error consequatur deserunt dolor totam. Iusto fugiat consectetur exercitationem tenetur aut.', 'Classic', 'english', 28.92, 0, 456, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (98, 'Eligendi perspiciatis veritatis voluptatem.', 'Dominik Dan', 'Esse molestiae aliquid sed rerum. Unde ducimus soluta nihil illum quos. Voluptatem eum quia nihil et culpa. Ducimus sed nisi ut sed.', 'Science Fiction', 'slovak', 71.71, 34, 106, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (99, 'Quos aperiam doloremque.', 'Philip K. Dick', 'Vero ea quia assumenda architecto. Aut illo delectus est. Eius quisquam nostrum veritatis est at.', 'Science Fiction', 'russian', 49.83, 50, 13, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (100, 'Quia sequi quo quaerat.', 'Dominik Dan', 'Nostrum quaerat amet rem deleniti. Velit suscipit commodi et laboriosam ea. Ea explicabo et unde praesentium voluptas.', 'Classic', 'slovak', 64.50, 34, 34, '2025-04-05 14:42:28', '2025-04-05 14:42:28');
INSERT INTO public.products VALUES (101, 'Provident minima rerum voluptatum.', 'George Orwell', 'Molestiae facere odio voluptatem. Eum et beatae ipsum mollitia officiis voluptatum occaecati porro. Ipsa qui quisquam at enim tempore maxime. Reiciendis sed eaque earum cumque aliquam ut.', 'Horror', 'slovak', 46.81, 40, 356, '2025-04-05 14:42:28', '2025-04-05 14:42:28');


--
-- TOC entry 4943 (class 0 OID 25585)
-- Dependencies: 222
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sessions VALUES ('0336ccfY373ypBQoo5pUK3Hw7MACetb5PQbV8qiw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk0zbjZWRjhING1hYjFWR1VSTlZKNHpjS3k0bTJTS1B6QVluZ3Z0TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0LzkwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744720322);
INSERT INTO public.sessions VALUES ('bXE3IVYojSJGm1i3dfo8Qv9dSgaS9cqxjDaDBl62', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFhEdkJveUNieEtVY0JqelM2cFpzWmROMDJwNEVLUWx6OEJRd3RocSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cz9wYWdlPTMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744388931);
INSERT INTO public.sessions VALUES ('oJD3uzWSaD9SRhEb5sivzfskWYQzZMlkIdjg6miQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHlQTW9NclpyS0VqVVZtTmFWbUI1d0NYZVpuVlo3ejRQMlhyc0JsQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cz9wYWdlPTMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744389011);
INSERT INTO public.sessions VALUES ('asYKLnptH0gr0yRtLUa4Ok6U3emeCRvFfbVXAKpY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmd1c2JmdmQ0VzAwYzBJWmZ4cDYxTWk4SHVobEZZT3U0Z0FrSHFkMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cz9wYWdlPTIwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744402701);
INSERT INTO public.sessions VALUES ('bzkQu8lgvPchg3HxxrQlwBnwaxFhUHAEjf5jyL9b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2dXbTB1b1dhQXBpVEM2RTRITDdNOXE3aDJFQ0dvTHRvaFRpRVhlUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cz9zb3J0T3B0aW9uPWJlc3RzZWxsZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744402944);


--
-- TOC entry 4941 (class 0 OID 25568)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (2, 'Rado', 'test@gmail.com', NULL, '$2y$12$FYVdwxKW/1AqQj3IpGUBuOWDIw.oZEdCEB41zeXlsOaqHlfar7/Kq', NULL, '2025-04-04 10:30:52', '2025-04-04 10:30:52', NULL, NULL, NULL, 'user');
INSERT INTO public.users VALUES (5, 't2', 'test1@gmail.com', NULL, '$2y$12$N5gUELu6QWuXQhjYH4LXfuIMXyl7LUFMjxIWzU0f8lcg.ntsr8RY2', NULL, '2025-04-04 15:15:35', '2025-04-04 15:15:35', NULL, NULL, NULL, 'user');
INSERT INTO public.users VALUES (6, 't1', 'test2@gmail.com', NULL, '$2y$12$tICHth7j0HyUVEizUJ3Ls.PexAqD52p4YvlHUIBcb76T4FBGC4CDi', NULL, '2025-04-04 15:26:31', '2025-04-04 15:26:31', NULL, NULL, NULL, 'user');
INSERT INTO public.users VALUES (7, 'admin', 'admin@gmail.com', NULL, '$2y$12$GcLVO9SmvUy.IHZhYFUe2epWwb1iKU7Zrzzfbdj1P7J9p7iJJ5c8i', NULL, '2025-04-04 15:39:58', '2025-04-04 15:39:58', NULL, NULL, NULL, 'user');
INSERT INTO public.users VALUES (8, 't3', 'test3@gmail.com', NULL, '$2y$12$qC9crri6pGlj8Qrn9q2Hp.6lzyDxDykokj7V2DftBbcRu0JmlA5/m', NULL, '2025-04-04 15:59:41', '2025-04-04 15:59:41', NULL, NULL, NULL, 'user');


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

SELECT pg_catalog.setval('public.products_id_seq', 101, true);


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


-- Completed on 2025-04-15 14:55:39

--
-- PostgreSQL database dump complete
--

