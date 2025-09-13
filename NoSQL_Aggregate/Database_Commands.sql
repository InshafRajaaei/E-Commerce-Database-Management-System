--
-- PostgreSQL database dump
--

\restrict PJPSWCD1nbe6LmSIea6C7huQIxcMRGwqDb1HmdHDFkxCv5uHKbK0rS43hcS0jCe

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Name: customer_ee00; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_ee00 (
    customer_id integer NOT NULL,
    customer_data jsonb
);


ALTER TABLE public.customer_ee00 OWNER TO postgres;

--
-- Data for Name: customer_ee00; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_ee00 (customer_id, customer_data) FROM stdin;
1	{"email": "alice.j@example.com", "phone": "123-456-7890", "lastName": "Johnson", "firstName": "Alice", "registrationDate": "2024-01-15"}
2	{"email": "bob.smith@example.com", "phone": "123-456-7891", "lastName": "Smith", "firstName": "Bob", "registrationDate": "2024-02-20"}
3	{"email": "charlie.b@example.com", "phone": "123-456-7892", "lastName": "Brown", "firstName": "Charlie"}
4	{"email": "diana.p@example.com", "address": "123 Main St, Anytown", "lastName": "Prince", "firstName": "Diana"}
5	{"email": "evan.lee@example.com", "isVIP": true, "lastName": "Lee", "firstName": "Evan", "registrationDate": "2024-04-22"}
6	{"email": "fiona.c@example.com", "orders": 5, "lastName": "Campbell", "firstName": "Fiona"}
7	{"email": "george.h@example.com", "phone": "123-456-7893", "lastName": "Harrison", "firstName": "George"}
8	{"email": "hannah.m@example.com", "isVIP": false, "lastName": "Montana", "firstName": "Hannah", "registrationDate": "2024-06-01"}
9	{"email": "isaac.n@example.com", "orders": 2, "lastName": "Newton", "firstName": "Isaac", "lastOrderDate": "2024-05-10"}
10	{"email": "jack.s@example.com", "isVIP": true, "lastName": "Sparrow", "firstName": "Jack", "registrationDate": "2024-06-15"}
\.


--
-- Name: customer_ee00 customer_ee00_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ee00
    ADD CONSTRAINT customer_ee00_pkey PRIMARY KEY (customer_id);


--
-- PostgreSQL database dump complete
--

\unrestrict PJPSWCD1nbe6LmSIea6C7huQIxcMRGwqDb1HmdHDFkxCv5uHKbK0rS43hcS0jCe

