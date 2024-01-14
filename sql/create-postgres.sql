--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-02-17 07:37:03

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA IF NOT EXISTS public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL primary key,
    first_name character varying(50),
    last_name character varying(50),
    rewards_points numeric(10,0),
    registration_date timestamp without time zone
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16402)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL primary key,
    first_name character varying(50),
    last_name character varying(50),
    hire_date timestamp without time zone
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL primary key,
    order_date timestamp without time zone,
    customer_id integer,
    foreign key (customer_id)
        references public.customers (id)
        on delete cascade
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16405)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL primary key,
    sku character varying(50),
    name character varying(50),
    description text,
    unit_price numeric(10,0)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL primary key,
    order_id integer,
    product_id integer,
    quantity integer,
    foreign key (product_id)
        references public.products (id)
        on delete cascade,
    foreign key (order_id)
        references public.orders (id)
        on delete cascade
);

ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 3330 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, rewards_points, registration_date) FROM stdin;
1	Robin	Padilla	0	2022-06-01 00:00:00
2	Loren	Legarda	0	2022-06-01 00:00:00
3	Raffy	Tulfo	0	2022-06-01 00:00:00
4	Sherwin	Gatchalian	0	2022-06-01 00:00:00
5	Francis	Escudero	0	2022-06-01 00:00:00
6	Mark	Villar	0	2022-06-01 00:00:00
7	Alan Peter	Cayetano	0	2022-06-01 00:00:00
8	Juan Miguel	Zubiri	0	2022-06-01 00:00:00
9	Joel	Villanueva	0	2022-06-01 00:00:00
10	JV	Ejercito	0	2022-06-01 00:00:00
11	Risa	Hontiveros	0	2022-06-01 00:00:00
12	Jinggoy	Estrada	0	2022-06-01 00:00:00
\.


--
-- TOC entry 3331 (class 0 OID 16402)
-- Dependencies: 215
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, first_name, last_name, hire_date) FROM stdin;
\.

--
-- TOC entry 3333 (class 0 OID 16410)
-- Dependencies: 217
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, order_date, customer_id) FROM stdin;
1001	2022-07-01 00:00:00	6
1002	2022-07-01 00:00:00	2
1003	2022-07-01 00:00:00	10
1004	2022-07-01 00:00:00	6
1005	2022-07-01 00:00:00	2
1006	2022-07-02 00:00:00	3
1007	2022-07-02 00:00:00	4
1008	2022-07-02 00:00:00	11
1009	2022-07-03 00:00:00	5
1010	2022-07-03 00:00:00	4
1011	2022-07-03 00:00:00	3
1012	2022-07-04 00:00:00	5
1013	2022-07-04 00:00:00	4
1014	2022-07-04 00:00:00	12
1015	2022-07-05 00:00:00	7
1016	2022-07-05 00:00:00	8
1017	2022-07-05 00:00:00	4
1018	2022-07-06 00:00:00	10
1019	2022-07-06 00:00:00	7
1020	2022-07-06 00:00:00	10
1021	2022-07-07 00:00:00	9
1022	2022-07-07 00:00:00	4
1023	2022-07-07 00:00:00	9
1024	2022-07-08 00:00:00	4
1025	2022-07-08 00:00:00	10
1026	2022-07-08 00:00:00	9
1027	2022-07-09 00:00:00	4
1028	2022-07-09 00:00:00	1
\.


--
-- TOC entry 3332 (class 0 OID 16405)
-- Dependencies: 216
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, sku, name, description, unit_price) FROM stdin;
1	AMERICANO	Long Black	Diluted Black Coffee (a.k.a. Long Black)	160
2	BREWED	Brewed Coffee	Just Coffee!	100
3	CAPPUCCINO	Cappuccino	Frothy Coffee!	130
4	DALGONA	Dalgona	Lockdown Coffee!	170
5	ESPRESSO	Espresso	Strong black coffee!	100
6	LATTE	Latte	Milky Coffee!	200
7	MACCHIATO	Macchiato	Foam topped coffee!	190
\.

--
-- TOC entry 3334 (class 0 OID 16413)
-- Dependencies: 218
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, quantity) FROM stdin;
10001	1001	5	1
10002	1002	5	2
10003	1002	1	1
10004	1003	5	2
10005	1003	2	1
10006	1004	5	2
10007	1004	2	1
10008	1004	2	1
10009	1005	5	1
10010	1005	2	1
10011	1005	2	1
10012	1006	5	3
10013	1006	2	3
10014	1007	5	2
10015	1007	1	1
10016	1008	1	2
10017	1008	2	1
10018	1008	3	1
10019	1008	4	1
10020	1008	5	1
10021	1009	1	1
10022	1009	2	1
10023	1009	4	1
10024	1009	5	1
10025	1010	1	1
10026	1010	2	1
10027	1010	4	1
10028	1010	5	1
10029	1011	6	1
10030	1011	7	1
10031	1011	1	1
10032	1011	5	3
10033	1012	6	1
10034	1012	7	1
10035	1012	1	1
10036	1012	5	3
10037	1013	1	1
10038	1013	2	1
10039	1013	3	1
10040	1013	5	2
10041	1014	1	1
10042	1014	2	1
10043	1014	3	1
10044	1014	5	2
10045	1015	1	1
10046	1015	2	1
10047	1015	3	1
10048	1015	5	2
10049	1016	1	1
10050	1016	2	1
10051	1016	3	1
10052	1016	5	2
10053	1017	1	1
10054	1017	2	1
10055	1017	3	1
10056	1017	5	2
10057	1018	1	1
10058	1018	2	1
10059	1018	3	1
10060	1018	5	2
10061	1019	1	1
10062	1019	2	1
10063	1019	3	1
10064	1019	5	2
10065	1020	1	1
10066	1020	2	1
10067	1020	3	1
10068	1020	5	2
10069	1021	1	1
10070	1021	2	1
10071	1021	3	1
10072	1021	5	2
10073	1022	1	1
10074	1022	2	1
10075	1022	3	1
10076	1022	5	2
10077	1023	1	1
10078	1023	2	1
10079	1023	3	1
10080	1023	5	2
10081	1024	1	1
10082	1024	2	1
10083	1024	3	1
10084	1024	5	2
10085	1025	1	1
10086	1025	2	1
10087	1025	3	1
10088	1025	5	2
10089	1026	1	1
10090	1026	2	1
10091	1026	3	1
10092	1026	5	2
10093	1027	1	1
10094	1027	2	1
10095	1027	3	1
10096	1027	5	2
10097	1028	1	1
10098	1028	2	1
10099	1028	3	1
10100	1028	5	2
\.

-- Completed on 2023-02-17 07:37:03

--
-- PostgreSQL database dump complete
--

