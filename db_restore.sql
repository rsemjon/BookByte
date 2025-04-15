--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-15 19:31:44

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 26332)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26339)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26364)
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
-- TOC entry 228 (class 1259 OID 26363)
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
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 227 (class 1259 OID 26356)
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
-- TOC entry 226 (class 1259 OID 26347)
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
-- TOC entry 225 (class 1259 OID 26346)
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
-- TOC entry 4978 (class 0 OID 0)
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
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 235 (class 1259 OID 26403)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint,
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    email_address character varying(255),
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    postal_code character varying(255) NOT NULL,
    order_status character varying(255) NOT NULL,
    payment_method character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT orders_order_status_check CHECK (((order_status)::text = ANY ((ARRAY['FINISHED'::character varying, 'IN_PROGRESS'::character varying])::text[]))),
    CONSTRAINT orders_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['CASH'::character varying, 'CREDIT_CARD'::character varying, 'ONLINE_PAYMENT'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 26402)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 234
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 237 (class 1259 OID 26419)
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_products (
    id bigint NOT NULL,
    product_id bigint,
    order_id bigint,
    quantity integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.orders_products OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26418)
-- Name: orders_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_products_id_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 236
-- Name: orders_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_products_id_seq OWNED BY public.orders_products.id;


--
-- TOC entry 221 (class 1259 OID 26316)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 26391)
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
-- TOC entry 232 (class 1259 OID 26390)
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
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 232
-- Name: product_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_image_id_seq OWNED BY public.product_image.id;


--
-- TOC entry 231 (class 1259 OID 26378)
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
-- TOC entry 230 (class 1259 OID 26377)
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
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 222 (class 1259 OID 26323)
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
-- TOC entry 220 (class 1259 OID 26306)
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
-- TOC entry 219 (class 1259 OID 26305)
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
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4754 (class 2604 OID 26367)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 26350)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 25564)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 26406)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 26422)
-- Name: orders_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products ALTER COLUMN id SET DEFAULT nextval('public.orders_products_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 26394)
-- Name: product_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image ALTER COLUMN id SET DEFAULT nextval('public.product_image_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 26381)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 26309)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4956 (class 0 OID 26332)
-- Dependencies: 223
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4957 (class 0 OID 26339)
-- Dependencies: 224
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4962 (class 0 OID 26364)
-- Dependencies: 229
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4960 (class 0 OID 26356)
-- Dependencies: 227
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4959 (class 0 OID 26347)
-- Dependencies: 226
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4951 (class 0 OID 25561)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (11, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (12, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations VALUES (13, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (14, '2025_04_04_154907_modify_users_table', 1);
INSERT INTO public.migrations VALUES (15, '2025_04_04_160709_create_products_table', 1);
INSERT INTO public.migrations VALUES (16, '2025_04_04_162733_create_product_image_table', 1);
INSERT INTO public.migrations VALUES (17, '2025_04_15_160344_create_orders_table', 1);
INSERT INTO public.migrations VALUES (18, '2025_04_15_170104_create_orders_products_table', 1);


--
-- TOC entry 4968 (class 0 OID 26403)
-- Dependencies: 235
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4970 (class 0 OID 26419)
-- Dependencies: 237
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4954 (class 0 OID 26316)
-- Dependencies: 221
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4966 (class 0 OID 26391)
-- Dependencies: 233
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_image VALUES (1, 1, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (2, 1, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (3, 2, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (4, 2, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (5, 3, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (6, 3, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (7, 4, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (8, 4, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (9, 5, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (10, 5, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (11, 6, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (12, 6, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (13, 7, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (14, 7, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (15, 8, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (16, 8, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (17, 9, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (18, 9, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (19, 10, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (20, 10, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (21, 11, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (22, 11, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (23, 12, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (24, 12, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (25, 13, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (26, 13, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (27, 14, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (28, 14, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (29, 15, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (30, 15, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (31, 16, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (32, 16, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (33, 17, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (34, 17, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (35, 18, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (36, 18, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (37, 19, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (38, 19, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (39, 20, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (40, 20, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (41, 21, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (42, 21, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (43, 22, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (44, 22, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (45, 23, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (46, 23, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (47, 24, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (48, 24, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (49, 25, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (50, 25, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (51, 26, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (52, 26, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (53, 27, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (54, 27, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (55, 28, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (56, 28, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (57, 29, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (58, 29, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (59, 30, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (60, 30, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (61, 31, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (62, 31, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (63, 32, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (64, 32, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (65, 33, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (66, 33, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (67, 34, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (68, 34, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (69, 35, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (70, 35, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (71, 36, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (72, 36, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (73, 37, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (74, 37, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (75, 38, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (76, 38, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (77, 39, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (78, 39, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (79, 40, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (80, 40, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (81, 41, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (82, 41, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (83, 42, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (84, 42, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (85, 43, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (86, 43, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (87, 44, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (88, 44, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (89, 45, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (90, 45, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (91, 46, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (92, 46, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (93, 47, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (94, 47, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (95, 48, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (96, 48, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (97, 49, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (98, 49, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (99, 50, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (100, 50, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (101, 51, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (102, 51, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (103, 52, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (104, 52, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (105, 53, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (106, 53, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (107, 54, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (108, 54, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (109, 55, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (110, 55, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (111, 56, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (112, 56, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (113, 57, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (114, 57, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (115, 58, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (116, 58, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (117, 59, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (118, 59, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (119, 60, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (120, 60, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (121, 61, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (122, 61, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (123, 62, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (124, 62, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (125, 63, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (126, 63, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (127, 64, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (128, 64, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (129, 65, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (130, 65, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (131, 66, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (132, 66, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (133, 67, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (134, 67, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (135, 68, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (136, 68, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (137, 69, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (138, 69, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (139, 70, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (140, 70, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (141, 71, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (142, 71, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (143, 72, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (144, 72, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (145, 73, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (146, 73, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (147, 74, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (148, 74, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (149, 75, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (150, 75, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (151, 76, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (152, 76, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (153, 77, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (154, 77, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (155, 78, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (156, 78, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (157, 79, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (158, 79, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (159, 80, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (160, 80, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (161, 81, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (162, 81, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (163, 82, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (164, 82, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (165, 83, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (166, 83, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (167, 84, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (168, 84, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (169, 85, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (170, 85, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (171, 86, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (172, 86, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (173, 87, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (174, 87, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (175, 88, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (176, 88, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (177, 89, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (178, 89, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (179, 90, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (180, 90, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (181, 91, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (182, 91, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (183, 92, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (184, 92, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (185, 93, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (186, 93, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (187, 94, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (188, 94, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (189, 95, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (190, 95, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (191, 96, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (192, 96, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (193, 97, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (194, 97, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (195, 98, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (196, 98, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (197, 99, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (198, 99, '/product_images/circle2.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (199, 100, '/product_images/circle1.jpg', NULL, NULL);
INSERT INTO public.product_image VALUES (200, 100, '/product_images/circle2.jpg', NULL, NULL);


--
-- TOC entry 4964 (class 0 OID 26378)
-- Dependencies: 231
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'Ratione quia qui.', 'George Orwell', 'Voluptates eum est et eum. Provident illo earum suscipit officiis sunt et culpa. Quia ut velit corrupti esse soluta occaecati. Odio id unde ut accusamus aspernatur consequuntur pariatur quo.', 'Science Fiction', 'russian', 73.08, 7, 372, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (2, 'Quisquam unde et autem.', 'George Orwell', 'Illo est nobis nam vero quas rerum corrupti molestiae. Perspiciatis molestiae odit ea ad. Et modi ut atque alias.', 'Science Fiction', 'german', 58.63, 50, 469, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (3, 'Autem vitae corporis accusamus.', 'George Orwell', 'Iure molestiae repellendus laboriosam repellendus nihil. Est rerum omnis labore expedita omnis in necessitatibus. Consectetur et sequi amet molestiae quos iste aliquid.', 'Science Fiction', 'english', 30.42, 20, 339, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (4, 'Iusto voluptate et illum.', 'Jozef Karika', 'Ea dolorem dicta iusto qui similique aut atque eveniet. Provident est magnam error mollitia culpa. Soluta deleniti molestiae enim qui quia quisquam commodi debitis.', 'Classic', 'slovak', 82.28, 39, 80, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (5, 'Blanditiis nulla inventore et.', 'Jozef Karika', 'Quam impedit qui omnis aut consequatur. Modi hic est saepe quam. Eos consequuntur velit ab accusamus.', 'Science Fiction', 'russian', 79.40, 8, 36, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (6, 'Maiores sint in omnis provident.', 'Philip K. Dick', 'Quasi nemo eos ut quia iste iusto. Consequuntur voluptatem ut non corporis dolorum. Quod blanditiis quia quo sed odit.', 'Horror', 'slovak', 43.29, 0, 470, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (7, 'Iusto id ea.', 'Philip K. Dick', 'Quod unde ut nihil ea nulla aperiam. Nulla qui dolor nulla rem. Sit aperiam exercitationem voluptatem voluptates. Eos veniam sint tempore hic laudantium accusantium laboriosam.', 'Horror', 'russian', 10.08, 42, 399, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (8, 'Ab sit ratione cupiditate.', 'Dominik Dan', 'Ab id dolores quia enim. Voluptas alias maiores aut rerum aut. Suscipit deserunt quae recusandae quia. Est sed autem magnam provident quaerat a.', 'Detective', 'russian', 32.74, 21, 10, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (9, 'Eaque odio saepe eius magnam.', 'George Orwell', 'Ipsum occaecati facere dolorem corporis beatae maxime nisi id. Maxime iure et perspiciatis non sint. Qui dolorem ad labore. Nesciunt exercitationem aut omnis sunt quo ea aspernatur.', 'Science Fiction', 'english', 92.02, 30, 88, '2025-04-15 17:26:51', '2025-04-15 17:26:51');
INSERT INTO public.products VALUES (10, 'Minus enim debitis.', 'Jozef Karika', 'Illum voluptas molestiae ut ut. Non dolores dolores ut omnis. Et eos et doloremque quasi cum quisquam.', 'Detective', 'german', 9.95, 0, 241, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (11, 'Voluptatem id vitae ipsum.', 'Dominik Dan', 'Sapiente quo et qui officiis saepe vel excepturi. Adipisci et recusandae iusto in aliquam sit perspiciatis. Fuga sit blanditiis amet deleniti.', 'Detective', 'german', 95.19, 2, 165, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (12, 'Nisi a voluptatibus.', 'Jozef Karika', 'Ducimus non et provident sunt dolores. Quaerat harum molestiae distinctio. Est quo autem maxime placeat enim voluptas. Unde commodi doloremque quod sed dolorem.', 'Detective', 'english', 46.59, 3, 299, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (13, 'Voluptatem odio perferendis sunt.', 'Dominik Dan', 'Eveniet voluptates fugiat atque temporibus ipsa. Aperiam dolores et odit. In est sunt est dolor rerum harum sunt odit. Non sunt odit eos nihil ex molestiae doloribus.', 'Classic', 'russian', 94.37, 40, 330, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (14, 'Hic exercitationem dolore.', 'Dominik Dan', 'Quaerat nam saepe alias nihil libero omnis et. Magni quia a in vero vitae. Facilis facilis aspernatur necessitatibus excepturi occaecati aliquid voluptates.', 'Science Fiction', 'russian', 6.61, 50, 349, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (15, 'Maxime commodi est.', 'Dominik Dan', 'Quas adipisci quas ut aspernatur distinctio officiis at eaque. Omnis delectus veritatis rerum molestias quia voluptatibus. Esse occaecati natus qui ex eum.', 'Science Fiction', 'slovak', 42.18, 46, 198, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (16, 'Magnam sed neque et et.', 'Philip K. Dick', 'Eos autem est soluta hic. Nihil quae molestiae reprehenderit quod unde. Facere molestias numquam quam fuga ut. Sit eveniet eveniet quasi sit.', 'Classic', 'english', 57.79, 42, 455, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (17, 'Sint et dignissimos ut.', 'Jozef Karika', 'Laborum id aliquid numquam ex. Rerum voluptatem eum quae. Fuga minus architecto qui ut exercitationem. Aut perferendis architecto explicabo quia tempore ut.', 'Science Fiction', 'english', 66.76, 41, 20, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (18, 'Nihil nemo iste.', 'Jozef Karika', 'In nobis corrupti culpa sed sit omnis. Totam quas nihil sint repudiandae et eos sit. Pariatur quibusdam sed magni beatae soluta assumenda. Eum adipisci maxime nam amet maiores.', 'Science Fiction', 'russian', 10.98, 18, 318, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (19, 'Quo est fuga impedit dolorem.', 'Dominik Dan', 'Dolores eaque error aut labore eveniet et. Consequatur suscipit qui esse ipsam eaque architecto excepturi. Eos nemo voluptate quo et debitis.', 'Detective', 'russian', 87.94, 0, 397, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (20, 'Ipsum voluptatum officia quo sint.', 'Philip K. Dick', 'Aut eaque molestias at expedita dolor odit. Voluptates perspiciatis consequatur quae ab maxime atque. Reiciendis sint sequi praesentium ad sapiente. Voluptatem rem aut adipisci quidem et eum cumque.', 'Science Fiction', 'russian', 55.74, 45, 45, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (21, 'Necessitatibus vitae qui quis fugit.', 'George Orwell', 'Enim incidunt atque laborum aperiam ad fuga dicta. Delectus nam et et sunt et sit. Debitis est facilis quia. Facere nesciunt accusamus magni vitae perferendis.', 'Horror', 'slovak', 79.62, 32, 220, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (22, 'Vitae quis iusto.', 'George Orwell', 'Tempore inventore est veniam officia a. Rerum neque iure vitae. Libero voluptates dignissimos id quam eligendi. Consequatur et aut saepe cupiditate quo.', 'Detective', 'english', 66.84, 25, 370, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (23, 'Mollitia modi sunt.', 'George Orwell', 'Voluptatem enim voluptas non quidem. Debitis ab totam maxime. Ab nam laudantium illo qui. Temporibus delectus minima facere at iure veritatis maiores.', 'Classic', 'english', 50.09, 2, 168, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (24, 'Voluptas aut voluptas officiis repellat.', 'Jozef Karika', 'Harum facilis rem eum quia quam facere. Odio adipisci quasi et ratione beatae quis labore. Quasi rerum vel pariatur laudantium soluta minima enim. Modi perspiciatis quis ipsam veniam.', 'Science Fiction', 'english', 64.88, 26, 455, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (25, 'Quis veritatis hic sed.', 'Jozef Karika', 'Velit omnis quidem sint earum magnam placeat est. Animi maxime earum quibusdam perspiciatis voluptatum magni. Cumque aspernatur ab facilis pariatur.', 'Horror', 'russian', 13.36, 31, 217, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (26, 'Quis itaque inventore.', 'George Orwell', 'Sit distinctio accusamus omnis aliquid sapiente omnis omnis. Unde ducimus minus similique enim sint sit ipsa. Unde rerum voluptas quam ut neque.', 'Science Fiction', 'slovak', 50.77, 37, 323, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (27, 'Et id dolores ullam neque.', 'Philip K. Dick', 'Sed assumenda molestiae alias qui praesentium enim atque. Odio non rerum ad velit dolorum. Dolorem provident ipsum nemo pariatur adipisci.', 'Science Fiction', 'slovak', 55.16, 31, 36, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (28, 'Consectetur nisi quisquam.', 'Philip K. Dick', 'Molestiae deserunt maxime placeat commodi molestiae reprehenderit a. Occaecati quaerat suscipit sapiente recusandae quod. Autem qui dolor facere in facere quia et.', 'Detective', 'german', 53.95, 45, 42, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (29, 'Provident consectetur cupiditate.', 'Jozef Karika', 'Et voluptatem quidem distinctio praesentium amet praesentium aliquam. Temporibus voluptatem fugiat exercitationem ut odio ipsa. Modi doloribus magnam nihil ad dolorem dolorem veritatis.', 'Science Fiction', 'english', 81.01, 37, 372, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (30, 'Quos ipsa rerum molestiae iusto.', 'Jozef Karika', 'Et doloribus asperiores fugit eum animi. Non exercitationem eum sed est. Laboriosam nulla quam et.', 'Science Fiction', 'german', 72.06, 40, 3, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (31, 'Quo rem occaecati.', 'George Orwell', 'Excepturi neque sapiente vel incidunt expedita voluptate. Et eum sed sapiente tempore nobis odit ut. Esse earum enim similique quasi quia voluptatem esse. Eius nihil suscipit necessitatibus et.', 'Classic', 'slovak', 90.04, 20, 383, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (32, 'Odio nihil sunt aut.', 'George Orwell', 'Enim aut excepturi aliquam porro earum facilis ea. Facere quia et in eveniet excepturi. Sit ullam enim nisi voluptate quia quia velit maiores.', 'Horror', 'german', 36.34, 43, 104, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (33, 'Et dolores beatae debitis.', 'Jozef Karika', 'Quas quia non ex. Quibusdam quibusdam illum commodi mollitia. Minima in et enim corporis et necessitatibus consequatur. Ut sed perspiciatis dolores.', 'Classic', 'slovak', 76.93, 20, 11, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (34, 'Quisquam eos facilis quis.', 'George Orwell', 'Non corrupti culpa ut labore officiis consequatur minima qui. Et placeat eum amet nulla. Non in dolores fugit. Magni esse illo ad dolorum. Ad rerum molestiae vel nihil vero harum officia tenetur.', 'Detective', 'german', 86.64, 22, 395, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (35, 'Adipisci nobis sint.', 'Dominik Dan', 'Dolore sapiente sapiente ex aliquid autem mollitia. Natus provident omnis vel est fugit eum repudiandae. Deserunt adipisci et magni et repellat. Ea est minus nobis culpa.', 'Detective', 'slovak', 6.22, 42, 400, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (36, 'Necessitatibus voluptas nisi error.', 'Dominik Dan', 'Error in ea sed qui. Maxime tempora illo facilis et. Sint animi qui quia commodi laboriosam eum est. Nam perspiciatis porro ut vero eum sapiente.', 'Classic', 'russian', 98.16, 21, 25, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (37, 'Culpa unde aliquam.', 'George Orwell', 'Blanditiis in molestiae sint facilis. Quis id minus aut. Ducimus qui est est non qui sunt doloribus. Maiores omnis et sit voluptas autem.', 'Science Fiction', 'russian', 92.25, 7, 428, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (38, 'Architecto facere voluptatibus quia.', 'George Orwell', 'Sed repellendus illum rem enim tempora. Ad aut aut non voluptas porro omnis. A nulla facere magnam iste atque. Voluptas molestiae voluptatem voluptatem consequatur quos facilis.', 'Detective', 'german', 19.40, 33, 13, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (39, 'Deserunt omnis ipsum.', 'Dominik Dan', 'Quia velit omnis ut voluptas atque perferendis. Impedit illo sit quis sit voluptate. Sunt nam at vel est. Placeat et dignissimos voluptatibus voluptatibus consequatur et numquam accusamus.', 'Classic', 'english', 59.87, 18, 468, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (40, 'Rem quia.', 'George Orwell', 'Aut omnis tempora qui. Quaerat autem ea cumque iusto esse quos molestiae. Vel ut voluptatem quia perferendis. Quisquam saepe omnis veritatis veritatis porro aut officiis.', 'Horror', 'russian', 56.53, 42, 283, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (41, 'Facilis culpa quo.', 'Jozef Karika', 'Ea saepe sit dolorem. Quasi in voluptatem laboriosam eaque sed dolor autem eos. Numquam aut omnis officia omnis fuga.', 'Detective', 'german', 78.13, 20, 458, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (42, 'Voluptatum sit vel.', 'Philip K. Dick', 'Voluptatum voluptas tenetur ducimus. Repellendus fuga nulla atque saepe et animi assumenda. Tempora ratione repellat quia dolor soluta. Harum ea ex quis doloremque.', 'Science Fiction', 'russian', 61.12, 7, 161, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (43, 'Aut a culpa minima.', 'Dominik Dan', 'Eaque quaerat voluptas quo illo. Odio blanditiis eius quas temporibus at. Voluptas mollitia voluptatem odio quia. Praesentium est illum ratione ea pariatur.', 'Classic', 'slovak', 67.38, 35, 105, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (44, 'Distinctio delectus cum pariatur.', 'Jozef Karika', 'Sunt delectus veniam rem ullam. Asperiores dignissimos ut et veritatis illo inventore. Deleniti cumque iusto officia aliquid consequatur asperiores a.', 'Horror', 'english', 64.02, 36, 273, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (45, 'Magni aut corporis mollitia porro.', 'Dominik Dan', 'Omnis voluptatem repudiandae nesciunt tempore debitis qui consequatur. In nemo nemo vero accusamus. Ut aut assumenda tempore.', 'Science Fiction', 'russian', 59.74, 16, 441, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (46, 'Cumque qui magni nisi.', 'Dominik Dan', 'Doloribus consectetur eaque molestias architecto est. Exercitationem harum veritatis iusto et.', 'Detective', 'english', 82.19, 11, 316, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (47, 'Dolores sit ad doloremque.', 'Jozef Karika', 'Quo ea nihil odit aliquid quia et eos. Dolorum iste non iusto dolor. Dolores sunt et et neque doloremque.', 'Horror', 'german', 95.83, 1, 391, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (48, 'Error eaque tenetur.', 'Jozef Karika', 'Vel modi asperiores modi doloribus repudiandae. Fugit et recusandae nulla. Sed tenetur vitae assumenda reiciendis molestiae. Labore quibusdam eos fugit dolores quibusdam unde vel dolore.', 'Horror', 'german', 18.36, 40, 68, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (49, 'Est expedita.', 'Jozef Karika', 'Eveniet nobis consectetur quibusdam. Iusto voluptatum vel et et. Magni laborum dolorem et illum quibusdam qui hic. Iste amet consectetur ipsam doloremque qui.', 'Detective', 'english', 97.18, 27, 161, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (50, 'Nisi fugit unde.', 'George Orwell', 'Porro quae dolor tempora et ut. Consequatur labore et harum id. Consequatur ut omnis accusantium amet tenetur ut sequi. In officiis aliquid voluptatibus minima.', 'Detective', 'slovak', 52.92, 36, 52, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (51, 'Repellendus culpa.', 'George Orwell', 'Autem amet qui id tempora aliquid eius. Aut ea assumenda consequatur perspiciatis vero et recusandae. Est maxime voluptas omnis reiciendis voluptates enim et. Perferendis dolorem ipsam fuga aut quam.', 'Science Fiction', 'english', 72.02, 29, 200, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (52, 'Veniam nobis deleniti sint.', 'George Orwell', 'Et commodi officiis nobis a dolorem. Quasi tenetur sed aspernatur quo ut. Quo officia eius hic ea quasi quo.', 'Horror', 'english', 58.51, 22, 156, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (53, 'In nam quia.', 'George Orwell', 'Et amet placeat necessitatibus ab recusandae et. Ea sint est nemo enim consequatur et esse. Rem vitae dolorem est magni temporibus nemo. Qui necessitatibus quisquam a dolorem cum est hic.', 'Science Fiction', 'slovak', 87.79, 41, 326, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (54, 'Expedita saepe aut veniam.', 'Philip K. Dick', 'Eveniet explicabo dolores ea ut vitae non. Ducimus voluptas nisi nihil possimus. Doloribus aspernatur earum et facilis accusamus.', 'Detective', 'russian', 17.06, 32, 315, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (55, 'Cupiditate soluta quos.', 'Jozef Karika', 'Animi iste sunt labore non. Ut est nobis autem laboriosam accusamus sunt et. Ea cum accusantium impedit et fuga exercitationem non.', 'Horror', 'english', 56.38, 29, 481, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (56, 'Animi consequatur minima.', 'George Orwell', 'Ut non quae sunt aperiam. Possimus et aut sit qui praesentium. Velit impedit non eius ut.', 'Classic', 'russian', 22.04, 37, 262, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (57, 'Laudantium occaecati et nam.', 'Dominik Dan', 'Consequatur maiores commodi et sed magnam. Vero dolore dolor dolorem voluptate quod qui. Perspiciatis perspiciatis soluta veniam voluptas. Et voluptas rerum similique.', 'Detective', 'german', 8.18, 36, 90, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (58, 'Dolor et non.', 'Philip K. Dick', 'Vero repudiandae et asperiores rerum voluptatem. Reprehenderit suscipit et aut qui corporis.', 'Science Fiction', 'russian', 51.86, 35, 20, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (59, 'Amet est dolores sed.', 'Philip K. Dick', 'Est ut quas voluptas quisquam consequatur qui expedita. Natus aliquam soluta deleniti. Possimus quos ea eos repellendus dolore.', 'Horror', 'slovak', 66.31, 27, 324, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (60, 'Qui doloribus tempore.', 'Dominik Dan', 'Est exercitationem tenetur ad rerum natus consequatur. Sequi dignissimos ut facilis possimus perspiciatis.', 'Classic', 'russian', 12.51, 41, 276, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (61, 'Aut vero perspiciatis praesentium.', 'Jozef Karika', 'Id ut quidem dolores et. Exercitationem est quod quos eaque. Vel beatae delectus qui doloremque dolor voluptatem id. Perferendis et dolor ut eos.', 'Horror', 'slovak', 10.74, 23, 199, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (62, 'Facere quis et.', 'Philip K. Dick', 'Earum delectus deserunt iusto nobis ex harum. Numquam dolores tenetur et et aut cum commodi. Sint earum eum qui commodi sed dolore molestiae. Exercitationem omnis facilis rem sunt illo.', 'Classic', 'german', 86.69, 38, 129, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (63, 'Quia itaque fugiat porro.', 'Jozef Karika', 'Voluptates aut beatae expedita. Ipsa perferendis maxime vitae perferendis esse quia eos. Ad nam non earum molestias ducimus numquam blanditiis.', 'Detective', 'german', 10.73, 46, 164, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (64, 'Nihil ea cum voluptatibus.', 'Philip K. Dick', 'Voluptatem temporibus quam sequi omnis ea omnis. Aut est officiis dolor.', 'Detective', 'english', 21.05, 15, 350, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (65, 'Aut rerum aspernatur enim.', 'Dominik Dan', 'Sunt quo voluptatem voluptas laboriosam. Odit repudiandae nemo voluptas cumque suscipit explicabo. Eos corporis esse tempore.', 'Detective', 'english', 57.42, 34, 243, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (66, 'Et dolores iusto.', 'George Orwell', 'Aut et nesciunt quo inventore laborum sapiente voluptas. Suscipit sit dolore quibusdam fugiat nobis non. Commodi libero perferendis asperiores vitae. Sequi eveniet molestiae non repellendus.', 'Detective', 'german', 85.88, 46, 263, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (67, 'Et voluptas voluptatem.', 'Dominik Dan', 'Modi sed non est recusandae. Et et error quos praesentium atque qui. Autem mollitia et omnis et dolores optio qui. Suscipit eum id consequatur laudantium nam sunt aspernatur.', 'Science Fiction', 'german', 58.93, 32, 182, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (68, 'Est pariatur libero.', 'Dominik Dan', 'Omnis quia voluptates id cupiditate. Qui culpa sapiente aut dolorem aperiam consequuntur ducimus. Sed eveniet aut nobis enim voluptates. Sed consectetur voluptas animi ducimus eos.', 'Science Fiction', 'russian', 65.54, 29, 331, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (69, 'Nihil quia nisi atque.', 'Philip K. Dick', 'Ab dolorem dolorem libero et fugit sapiente qui. Consectetur quod iusto laboriosam cupiditate similique quasi est. Voluptatum praesentium rerum aut natus. Et aliquid quisquam molestiae dolores autem.', 'Detective', 'english', 35.96, 35, 360, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (70, 'Voluptatem sed exercitationem.', 'Jozef Karika', 'Enim rerum molestiae porro nesciunt ducimus praesentium dolorum. Voluptatem voluptas pariatur tenetur omnis voluptates esse est.', 'Horror', 'german', 7.47, 35, 36, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (71, 'Et sed nam et.', 'Dominik Dan', 'Ducimus quis qui ullam possimus voluptatem exercitationem non. Magni vel ipsam dicta deleniti. Et laudantium consequatur voluptatem cupiditate quis voluptas.', 'Classic', 'english', 5.96, 48, 468, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (72, 'Molestiae suscipit qui.', 'Philip K. Dick', 'Non beatae consequatur eius eligendi molestias ipsam quia. Laborum aspernatur alias odit ullam perspiciatis dolore qui. Error omnis accusamus aliquam.', 'Classic', 'english', 16.52, 43, 209, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (73, 'Non debitis tempore.', 'Philip K. Dick', 'Repellat non dolorem aperiam ipsa doloribus vel voluptatem. Magni officiis provident dolores doloremque. Provident aut atque assumenda. Mollitia culpa quidem earum rerum.', 'Horror', 'english', 78.31, 20, 377, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (74, 'Pariatur sunt ipsum vitae.', 'Philip K. Dick', 'Dolor voluptates impedit enim quia et est excepturi. Ipsam aut distinctio maiores velit. Vel sit error quia molestiae voluptatem delectus.', 'Horror', 'german', 73.75, 18, 98, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (75, 'Consectetur dolore rerum.', 'George Orwell', 'Nobis accusamus ipsum tenetur facere qui. Reiciendis rerum quisquam natus tempore. Totam praesentium quas ut quisquam id voluptatibus.', 'Science Fiction', 'slovak', 15.09, 5, 33, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (76, 'Dicta vel laborum quae.', 'George Orwell', 'Nihil aut molestias quidem possimus rerum molestiae. Soluta eaque sint quidem. Possimus incidunt tempore illo quos. Reprehenderit et quo veritatis ex accusantium sunt.', 'Horror', 'slovak', 7.20, 16, 299, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (77, 'Facere quis vel modi.', 'George Orwell', 'Ut numquam deserunt quos corporis esse culpa laboriosam. Voluptas aspernatur et sed debitis illum optio necessitatibus. Corporis consequatur omnis fuga optio.', 'Science Fiction', 'russian', 69.32, 13, 0, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (78, 'Deserunt tenetur quis.', 'Philip K. Dick', 'Dolor reprehenderit est quia et nobis incidunt delectus. Eius aut consequuntur nemo. Fugiat maiores dolor fugiat voluptatibus veniam qui.', 'Classic', 'russian', 22.22, 33, 260, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (79, 'Ipsum sapiente.', 'Dominik Dan', 'Mollitia ab tenetur hic maiores. Quas consequuntur sed repellat velit. Ut perferendis minus optio veniam aspernatur. Dolor voluptas ea aspernatur voluptas aut.', 'Classic', 'slovak', 56.01, 10, 408, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (80, 'Dolorem perferendis delectus.', 'George Orwell', 'Unde nostrum labore ad aliquid omnis consectetur harum. Autem aut dicta quia. Voluptas fuga doloribus distinctio sequi quisquam nulla.', 'Detective', 'english', 49.68, 25, 322, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (81, 'Minus ab sit.', 'George Orwell', 'Quo suscipit reprehenderit voluptas corrupti quidem ut ratione est. Commodi quos aliquid magnam nesciunt ipsa natus quod. Dolor doloribus inventore sit consequatur excepturi saepe esse sint.', 'Science Fiction', 'english', 86.34, 22, 385, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (82, 'Iste quia vero aut.', 'Philip K. Dick', 'Sed labore et inventore in. Libero labore perferendis inventore vel laboriosam aliquid. Repellendus voluptatem voluptatem dolor accusantium nulla labore.', 'Classic', 'english', 97.21, 1, 444, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (83, 'Deserunt quidem iure.', 'George Orwell', 'Aut nobis non aut neque architecto cum. Debitis iure ut at. Sit ut animi quo quisquam sed ex. Eum unde eos perferendis et doloremque.', 'Detective', 'russian', 50.28, 17, 443, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (84, 'Molestias et et explicabo.', 'Philip K. Dick', 'Nam harum natus placeat quisquam impedit optio et. Rerum excepturi illum molestias sed. Vero laborum ut magni est minus saepe.', 'Detective', 'slovak', 54.73, 37, 129, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (85, 'Est culpa dolorem.', 'George Orwell', 'Minus eos in enim voluptatibus. Rerum voluptas eius eos. Provident ad sit asperiores ut dolores dolore a.', 'Classic', 'slovak', 88.46, 44, 105, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (86, 'Explicabo dicta qui sunt.', 'George Orwell', 'Harum et placeat error enim ex sapiente. Omnis soluta illo fugiat maxime. Impedit ea voluptatem et mollitia possimus. Est nostrum sapiente quo ipsam dolorem officiis.', 'Classic', 'slovak', 38.77, 34, 307, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (87, 'Sint possimus architecto.', 'George Orwell', 'Ab odit repellendus ut nihil. Eius non numquam qui consequuntur commodi rerum nihil architecto. Sit debitis laudantium non rerum iusto. Quis qui reiciendis recusandae rerum.', 'Science Fiction', 'english', 65.74, 49, 168, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (88, 'Ipsa asperiores qui voluptas.', 'Philip K. Dick', 'Ea rerum perferendis dignissimos eos. Corrupti qui mollitia recusandae cupiditate quia et occaecati. Laboriosam velit vero accusamus labore quo est quia laboriosam.', 'Classic', 'german', 90.20, 39, 463, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (89, 'Aut amet ut numquam vel.', 'Dominik Dan', 'Eaque veniam et modi molestiae aliquid. Consequatur molestias quidem necessitatibus.', 'Horror', 'slovak', 94.30, 43, 244, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (90, 'Fuga omnis.', 'Jozef Karika', 'Et porro quis dolore nostrum. Et quidem sequi architecto. Ut quasi amet ea delectus excepturi illo quia. Facere ea incidunt vel sed enim vero neque.', 'Classic', 'english', 69.40, 11, 248, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (91, 'Incidunt aut quaerat occaecati.', 'Jozef Karika', 'Illo ea incidunt sed et unde nulla quibusdam quae. Ipsa omnis accusamus natus. Rem ut neque porro illum quam voluptas aut. Sed alias nihil unde aut.', 'Science Fiction', 'slovak', 61.15, 6, 247, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (92, 'At mollitia ab.', 'Philip K. Dick', 'Odit occaecati consequatur debitis. Recusandae eos quia beatae sunt nesciunt saepe.', 'Science Fiction', 'slovak', 82.04, 34, 379, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (93, 'Inventore amet delectus.', 'Philip K. Dick', 'Voluptatem magnam aliquam minima. Sed dicta hic nemo nihil. Voluptatem voluptate illum quas dolore. Repellendus enim ut culpa ducimus natus.', 'Detective', 'russian', 5.41, 49, 189, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (94, 'Qui dolor quia voluptatem quod.', 'George Orwell', 'Omnis incidunt accusamus maxime et veritatis. Possimus hic laudantium soluta tempora. Qui non repellendus soluta voluptas alias molestiae rerum. Nisi facere autem ducimus dolor dolorem.', 'Science Fiction', 'slovak', 19.34, 13, 373, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (95, 'Officia ex ex voluptate.', 'Philip K. Dick', 'Adipisci commodi accusamus molestias sint voluptatem. Natus quos exercitationem sit. Fugit ut debitis quo dolorem saepe corrupti. Id eius sapiente ut deserunt.', 'Horror', 'slovak', 35.30, 10, 245, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (96, 'Officia aut quo voluptatem.', 'George Orwell', 'Sit mollitia ut velit et pariatur. Corporis ut et qui. Aliquam itaque iusto quia dolore esse.', 'Horror', 'german', 89.59, 26, 415, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (97, 'Quia officia consequuntur.', 'Jozef Karika', 'Et voluptate dolores nihil voluptatibus optio consequatur hic. Eaque magni optio nihil non. Et sunt aliquam vel optio dolor consectetur autem at.', 'Detective', 'slovak', 62.23, 38, 275, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (98, 'Nihil et qui quo.', 'Philip K. Dick', 'Quo nostrum adipisci quaerat inventore sit perferendis incidunt. Sunt nisi at vel ratione enim perspiciatis. Non vel saepe animi molestias. Harum expedita laborum placeat.', 'Horror', 'german', 13.35, 33, 282, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (99, 'Unde perspiciatis aspernatur.', 'Jozef Karika', 'Omnis velit sunt sunt qui quis modi. Molestias corrupti id molestiae labore et dolores eum. Sequi ad illum magnam neque sunt asperiores deserunt eius.', 'Classic', 'slovak', 76.54, 6, 180, '2025-04-15 17:26:52', '2025-04-15 17:26:52');
INSERT INTO public.products VALUES (100, 'Reprehenderit voluptatum incidunt voluptas.', 'Dominik Dan', 'Quisquam eaque cumque deleniti ratione aut. Veritatis aperiam dignissimos et et repudiandae quos.', 'Classic', 'russian', 40.46, 48, 191, '2025-04-15 17:26:52', '2025-04-15 17:26:52');


--
-- TOC entry 4955 (class 0 OID 26323)
-- Dependencies: 222
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sessions VALUES ('h9tRpHL6qxt4b8tsXLWNwXyAIXuneCEWgP0TEvJ4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36 Edg/135.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1RsTExTdlY0QVl0NnUwZEdVcldjdXdaNUlkdkZmeVEwcWJFeHJjTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cz9wYWdlPTIwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1744738094);


--
-- TOC entry 4953 (class 0 OID 26306)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Test User', 'test@example.com', '2025-04-15 17:26:13', '$2y$12$Zut7vI3GZ9gf/HjSWI7M7et1uB9k9TVneeDA6r1xYyV98enGan/tm', 'CoqRNKzagf', '2025-04-15 17:26:13', '2025-04-15 17:26:13', NULL, NULL, NULL, 'user');


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 234
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 236
-- Name: orders_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_products_id_seq', 1, false);


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 232
-- Name: product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_image_id_seq', 200, true);


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 100, true);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 4783 (class 2606 OID 26345)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4781 (class 2606 OID 26338)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4790 (class 2606 OID 26372)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 26374)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4788 (class 2606 OID 26362)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 26354)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 25566)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 26412)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 26425)
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 26322)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4796 (class 2606 OID 26396)
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 26389)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 26329)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 26315)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4773 (class 2606 OID 26313)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4786 (class 1259 OID 26355)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4776 (class 1259 OID 26331)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4779 (class 1259 OID 26330)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4803 (class 2606 OID 26431)
-- Name: orders_products orders_products_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 4804 (class 2606 OID 26426)
-- Name: orders_products orders_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4802 (class 2606 OID 26413)
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4801 (class 2606 OID 26397)
-- Name: product_image product_image_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


-- Completed on 2025-04-15 19:31:44

--
-- PostgreSQL database dump complete
--

