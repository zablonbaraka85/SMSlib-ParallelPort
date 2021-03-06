--
-- Name: saved_calculations; Type: TABLE; ; Tablespace: 
--

CREATE TABLE saved_calculations (
    id numeric,
    title character varying(100),
    url character varying(5000)
);


--
-- Name: saved_calculations_seq; Type: SEQUENCE; 
--

CREATE SEQUENCE saved_calculations_seq
    START WITH 4
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: saved_calculations_seq; Type: SEQUENCE SET; 
--

SELECT pg_catalog.setval('saved_calculations_seq', 4, false);


--
-- Name: saved_reports; Type: TABLE; ; Tablespace: 
--

CREATE TABLE saved_reports (
    id numeric NOT NULL,
    title character varying(100),
    staff_id numeric,
    php_self character varying(5000),
    search_php_self character varying(5000),
    search_vars character varying(5000)
);


--
-- Name: saved_reports_seq; Type: SEQUENCE; 
--

CREATE SEQUENCE saved_reports_seq
    START WITH 4
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: saved_reports_seq; Type: SEQUENCE SET; 
--

SELECT pg_catalog.setval('saved_reports_seq', 4, false);


--
-- Data for Name: profile_exceptions; Type: TABLE DATA; 
--

INSERT INTO profile_exceptions (profile_id, modname, can_use, can_edit) VALUES (
1, 'State_Reports/SavedReports.php', 'Y', 'Y');
INSERT INTO profile_exceptions (profile_id, modname, can_use, can_edit) VALUES (
1, 'State_Reports/Calculations.php', 'Y', 'Y');
INSERT INTO profile_exceptions (profile_id, modname, can_use, can_edit) VALUES (
1, 'State_Reports/CalculationsReports.php', 'Y', 'Y');

