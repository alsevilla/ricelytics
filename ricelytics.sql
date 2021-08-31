--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: ricelytics; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ricelytics WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE ricelytics OWNER TO postgres;

\connect ricelytics

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: ids_ecosystem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ids_ecosystem (
    id bigint NOT NULL,
    eco character varying(1) NOT NULL,
    "ecoName" character varying(255) NOT NULL
);


ALTER TABLE public.ids_ecosystem OWNER TO postgres;

--
-- Name: ids_ecosystem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ids_ecosystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ids_ecosystem_id_seq OWNER TO postgres;

--
-- Name: ids_ecosystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ids_ecosystem_id_seq OWNED BY public.ids_ecosystem.id;


--
-- Name: ids_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ids_location (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    "locName" character varying(255),
    parent smallint,
    sort smallint
);


ALTER TABLE public.ids_location OWNER TO postgres;

--
-- Name: ids_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ids_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ids_location_id_seq OWNER TO postgres;

--
-- Name: ids_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ids_location_id_seq OWNED BY public.ids_location.id;


--
-- Name: kpi_costs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_costs (
    id bigint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "costProduction" numeric(10,2),
    "locCode" smallint NOT NULL
);


ALTER TABLE public.kpi_costs OWNER TO postgres;

--
-- Name: kpi_costs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_costs_id_seq OWNER TO postgres;

--
-- Name: kpi_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_costs_id_seq OWNED BY public.kpi_costs.id;


--
-- Name: kpi_costscom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_costscom (
    id bigint NOT NULL,
    "locName" character varying(255),
    year character varying(4),
    "materialInputs" numeric(10,2),
    "hiredLabor" numeric(10,2),
    "OFELabor" numeric(10,2),
    machine numeric(10,2),
    irrigation numeric(10,2),
    "landRent" numeric(10,2),
    "interestCapital" numeric(10,2),
    "otherInputs" numeric(10,2)
);


ALTER TABLE public.kpi_costscom OWNER TO postgres;

--
-- Name: kpi_costscom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_costscom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_costscom_id_seq OWNER TO postgres;

--
-- Name: kpi_costscom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_costscom_id_seq OWNED BY public.kpi_costscom.id;


--
-- Name: kpi_cpi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_cpi (
    id bigint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "cpiAll" numeric(5,2),
    "cpiFood" numeric(5,2),
    "cpiRice" numeric(5,2),
    "locCode" smallint NOT NULL
);


ALTER TABLE public.kpi_cpi OWNER TO postgres;

--
-- Name: kpi_cpi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_cpi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_cpi_id_seq OWNER TO postgres;

--
-- Name: kpi_cpi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_cpi_id_seq OWNED BY public.kpi_cpi.id;


--
-- Name: kpi_npk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_npk (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    eco character varying(1),
    nperha numeric(10,2),
    pperha numeric(10,2),
    kperha numeric(10,2)
);


ALTER TABLE public.kpi_npk OWNER TO postgres;

--
-- Name: kpi_npk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_npk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_npk_id_seq OWNER TO postgres;

--
-- Name: kpi_npk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_npk_id_seq OWNED BY public.kpi_npk.id;


--
-- Name: kpi_pay; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_pay (
    id bigint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    semester character varying(1),
    eco character varying(1),
    "estProduction" numeric(10,2),
    "areaHarv" numeric(10,2),
    "yieldEst" numeric(10,2),
    "locCode" smallint NOT NULL
);


ALTER TABLE public.kpi_pay OWNER TO postgres;

--
-- Name: kpi_pay_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_pay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_pay_id_seq OWNER TO postgres;

--
-- Name: kpi_pay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_pay_id_seq OWNED BY public.kpi_pay.id;


--
-- Name: kpi_percapita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_percapita (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "PerCapitaKg" numeric(10,2),
    "PerCapitaGram" numeric(10,2)
);


ALTER TABLE public.kpi_percapita OWNER TO postgres;

--
-- Name: kpi_percapita_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_percapita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_percapita_id_seq OWNER TO postgres;

--
-- Name: kpi_percapita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_percapita_id_seq OWNED BY public.kpi_percapita.id;


--
-- Name: kpi_pop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_pop (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    population numeric(12,2)
);


ALTER TABLE public.kpi_pop OWNER TO postgres;

--
-- Name: kpi_pop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_pop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_pop_id_seq OWNER TO postgres;

--
-- Name: kpi_pop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_pop_id_seq OWNED BY public.kpi_pop.id;


--
-- Name: kpi_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_prices (
    id bigint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "farmgatePrice" numeric(10,2),
    "wholesalePrice" numeric(10,2),
    "retailPrice" numeric(10,2),
    "locCode" smallint NOT NULL,
    "WholesaleSpPrice" numeric(10,2),
    "retailSpPrice" numeric(10,2)
);


ALTER TABLE public.kpi_prices OWNER TO postgres;

--
-- Name: kpi_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_prices_id_seq OWNER TO postgres;

--
-- Name: kpi_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_prices_id_seq OWNED BY public.kpi_prices.id;


--
-- Name: kpi_sua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_sua (
    id bigint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "SUBeginningStocks" numeric(10,2),
    "SUProduction" numeric(10,2),
    "SUImports" numeric(10,2),
    "UTExports" numeric(10,2),
    "UTSeeds" numeric(10,2),
    "UTFeedsWaste" numeric(10,2),
    "UTProcessing" numeric(10,2),
    "UTEndingStocks" numeric(10,2),
    "UTPerCapitaKg" numeric(10,2),
    "UTPerCapitaGram" numeric(10,2),
    "locCode" smallint NOT NULL
);


ALTER TABLE public.kpi_sua OWNER TO postgres;

--
-- Name: kpi_sua_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_sua_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_sua_id_seq OWNER TO postgres;

--
-- Name: kpi_sua_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_sua_id_seq OWNED BY public.kpi_sua.id;


--
-- Name: kpi_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kpi_value (
    id bigint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "palayValue" numeric(10,2),
    "agriValue" numeric(10,2),
    "gdpValue" numeric(10,2),
    "locCode" smallint NOT NULL
);


ALTER TABLE public.kpi_value OWNER TO postgres;

--
-- Name: kpi_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kpi_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_value_id_seq OWNER TO postgres;

--
-- Name: kpi_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kpi_value_id_seq OWNED BY public.kpi_value.id;


--
-- Name: rb_farm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rb_farm (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    eco character varying(1),
    "aveFarmSize" numeric(10,2),
    "tstatusOwned" numeric(10,0),
    "tstatusAmort" numeric(10,0),
    "tstatusLessee" numeric(10,0),
    "tstatusTenant" numeric(10,0),
    "tstatusOthers" numeric(10,0),
    "areaLessOne" numeric(10,0),
    "areaOneTwo" numeric(10,0),
    "areaTwoThree" numeric(10,0),
    "areaMoreThree" numeric(10,0)
);


ALTER TABLE public.rb_farm OWNER TO postgres;

--
-- Name: rb_farm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rb_farm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rb_farm_id_seq OWNER TO postgres;

--
-- Name: rb_farm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rb_farm_id_seq OWNED BY public.rb_farm.id;


--
-- Name: rb_income; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rb_income (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    eco character varying(1),
    "monthlyIncome" numeric(10,0),
    "riceSource" numeric(10,0),
    "vegetableSource" numeric(10,0),
    "selfEmployesSource" numeric(10,0),
    "liveStockSource" numeric(10,0),
    "salarySource" numeric(10,0),
    "otheSource" numeric(10,0),
    "abovePovertyShare" numeric(10,0),
    "belowPovertShare" numeric(10,0)
);


ALTER TABLE public.rb_income OWNER TO postgres;

--
-- Name: rb_income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rb_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rb_income_id_seq OWNER TO postgres;

--
-- Name: rb_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rb_income_id_seq OWNED BY public.rb_income.id;


--
-- Name: rb_socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rb_socio (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    eco character varying(1),
    count integer,
    age numeric(10,0),
    "sexMale" numeric(10,0),
    "sexFemale" numeric(10,0),
    "cstatusSingle" numeric(10,0),
    "cstatusMarried" numeric(10,0),
    "cstatusWidow" numeric(10,0),
    "cstatusSeparated" numeric(10,0),
    "yrsSchooling" numeric(10,0),
    "yrsFarmExp" numeric(10,0),
    "hhSize" numeric(10,0),
    "orgMember" numeric(10,0),
    "withTraining" numeric(10,0)
);


ALTER TABLE public.rb_socio OWNER TO postgres;

--
-- Name: rb_socio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rb_socio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rb_socio_id_seq OWNER TO postgres;

--
-- Name: rb_socio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rb_socio_id_seq OWNED BY public.rb_socio.id;


--
-- Name: rb_ycost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rb_ycost (
    id bigint NOT NULL,
    "locCode" smallint NOT NULL,
    "locType" character varying(1),
    year character varying(4),
    "yieldEst" numeric(12,2),
    costperkg numeric(12,2)
);


ALTER TABLE public.rb_ycost OWNER TO postgres;

--
-- Name: rb_ycost_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rb_ycost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rb_ycost_id_seq OWNER TO postgres;

--
-- Name: rb_ycost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rb_ycost_id_seq OWNED BY public.rb_ycost.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: ids_ecosystem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ids_ecosystem ALTER COLUMN id SET DEFAULT nextval('public.ids_ecosystem_id_seq'::regclass);


--
-- Name: ids_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ids_location ALTER COLUMN id SET DEFAULT nextval('public.ids_location_id_seq'::regclass);


--
-- Name: kpi_costs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_costs ALTER COLUMN id SET DEFAULT nextval('public.kpi_costs_id_seq'::regclass);


--
-- Name: kpi_costscom id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_costscom ALTER COLUMN id SET DEFAULT nextval('public.kpi_costscom_id_seq'::regclass);


--
-- Name: kpi_cpi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_cpi ALTER COLUMN id SET DEFAULT nextval('public.kpi_cpi_id_seq'::regclass);


--
-- Name: kpi_npk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_npk ALTER COLUMN id SET DEFAULT nextval('public.kpi_npk_id_seq'::regclass);


--
-- Name: kpi_pay id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_pay ALTER COLUMN id SET DEFAULT nextval('public.kpi_pay_id_seq'::regclass);


--
-- Name: kpi_percapita id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_percapita ALTER COLUMN id SET DEFAULT nextval('public.kpi_percapita_id_seq'::regclass);


--
-- Name: kpi_pop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_pop ALTER COLUMN id SET DEFAULT nextval('public.kpi_pop_id_seq'::regclass);


--
-- Name: kpi_prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_prices ALTER COLUMN id SET DEFAULT nextval('public.kpi_prices_id_seq'::regclass);


--
-- Name: kpi_sua id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_sua ALTER COLUMN id SET DEFAULT nextval('public.kpi_sua_id_seq'::regclass);


--
-- Name: kpi_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_value ALTER COLUMN id SET DEFAULT nextval('public.kpi_value_id_seq'::regclass);


--
-- Name: rb_farm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_farm ALTER COLUMN id SET DEFAULT nextval('public.rb_farm_id_seq'::regclass);


--
-- Name: rb_income id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_income ALTER COLUMN id SET DEFAULT nextval('public.rb_income_id_seq'::regclass);


--
-- Name: rb_socio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_socio ALTER COLUMN id SET DEFAULT nextval('public.rb_socio_id_seq'::regclass);


--
-- Name: rb_ycost id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_ycost ALTER COLUMN id SET DEFAULT nextval('public.rb_ycost_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
25	Can add ids_ecosystem	7	add_ids_ecosystem
26	Can change ids_ecosystem	7	change_ids_ecosystem
27	Can delete ids_ecosystem	7	delete_ids_ecosystem
28	Can view ids_ecosystem	7	view_ids_ecosystem
29	Can add ids_location	8	add_ids_location
30	Can change ids_location	8	change_ids_location
31	Can delete ids_location	8	delete_ids_location
32	Can view ids_location	8	view_ids_location
33	Can add kpi_value	9	add_kpi_value
34	Can change kpi_value	9	change_kpi_value
35	Can delete kpi_value	9	delete_kpi_value
36	Can view kpi_value	9	view_kpi_value
37	Can add kpi_sua	10	add_kpi_sua
38	Can change kpi_sua	10	change_kpi_sua
39	Can delete kpi_sua	10	delete_kpi_sua
40	Can view kpi_sua	10	view_kpi_sua
41	Can add kpi_prices	11	add_kpi_prices
42	Can change kpi_prices	11	change_kpi_prices
43	Can delete kpi_prices	11	delete_kpi_prices
44	Can view kpi_prices	11	view_kpi_prices
45	Can add kpi_pay	12	add_kpi_pay
46	Can change kpi_pay	12	change_kpi_pay
47	Can delete kpi_pay	12	delete_kpi_pay
48	Can view kpi_pay	12	view_kpi_pay
49	Can add kpi_cpi	13	add_kpi_cpi
50	Can change kpi_cpi	13	change_kpi_cpi
51	Can delete kpi_cpi	13	delete_kpi_cpi
52	Can view kpi_cpi	13	view_kpi_cpi
53	Can add kpi_costs	14	add_kpi_costs
54	Can change kpi_costs	14	change_kpi_costs
55	Can delete kpi_costs	14	delete_kpi_costs
56	Can view kpi_costs	14	view_kpi_costs
57	Can add kpi_costscom	15	add_kpi_costscom
58	Can change kpi_costscom	15	change_kpi_costscom
59	Can delete kpi_costscom	15	delete_kpi_costscom
60	Can view kpi_costscom	15	view_kpi_costscom
61	Can add kpi_npk	16	add_kpi_npk
62	Can change kpi_npk	16	change_kpi_npk
63	Can delete kpi_npk	16	delete_kpi_npk
64	Can view kpi_npk	16	view_kpi_npk
65	Can add kpi_percapita	17	add_kpi_percapita
66	Can change kpi_percapita	17	change_kpi_percapita
67	Can delete kpi_percapita	17	delete_kpi_percapita
68	Can view kpi_percapita	17	view_kpi_percapita
69	Can add rb_farm	18	add_rb_farm
70	Can change rb_farm	18	change_rb_farm
71	Can delete rb_farm	18	delete_rb_farm
72	Can view rb_farm	18	view_rb_farm
73	Can add rb_income	19	add_rb_income
74	Can change rb_income	19	change_rb_income
75	Can delete rb_income	19	delete_rb_income
76	Can view rb_income	19	view_rb_income
77	Can add rb_socio	20	add_rb_socio
78	Can change rb_socio	20	change_rb_socio
79	Can delete rb_socio	20	delete_rb_socio
80	Can view rb_socio	20	view_rb_socio
81	Can add kpi_pop	21	add_kpi_pop
82	Can change kpi_pop	21	change_kpi_pop
83	Can delete kpi_pop	21	delete_kpi_pop
84	Can view kpi_pop	21	view_kpi_pop
85	Can add rb_ycost	22	add_rb_ycost
86	Can change rb_ycost	22	change_rb_ycost
87	Can delete rb_ycost	22	delete_rb_ycost
88	Can view rb_ycost	22	view_rb_ycost
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	dashboard	ids_ecosystem
8	dashboard	ids_location
9	dashboard	kpi_value
10	dashboard	kpi_sua
11	dashboard	kpi_prices
12	dashboard	kpi_pay
13	dashboard	kpi_cpi
14	dashboard	kpi_costs
15	dashboard	kpi_costscom
16	dashboard	kpi_npk
17	dashboard	kpi_percapita
18	dashboard	rb_farm
19	dashboard	rb_income
20	dashboard	rb_socio
21	dashboard	kpi_pop
22	dashboard	rb_ycost
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-07-07 16:13:02.213494+08
2	auth	0001_initial	2021-07-07 16:13:02.398238+08
3	admin	0001_initial	2021-07-07 16:13:02.435515+08
4	admin	0002_logentry_remove_auto_add	2021-07-07 16:13:02.442188+08
5	admin	0003_logentry_add_action_flag_choices	2021-07-07 16:13:02.447855+08
6	contenttypes	0002_remove_content_type_name	2021-07-07 16:13:02.460255+08
7	auth	0002_alter_permission_name_max_length	2021-07-07 16:13:02.467235+08
8	auth	0003_alter_user_email_max_length	2021-07-07 16:13:02.473219+08
9	auth	0004_alter_user_username_opts	2021-07-07 16:13:02.479313+08
10	auth	0005_alter_user_last_login_null	2021-07-07 16:13:02.485241+08
11	auth	0006_require_contenttypes_0002	2021-07-07 16:13:02.487238+08
12	auth	0007_alter_validators_add_error_messages	2021-07-07 16:13:02.494247+08
13	auth	0008_alter_user_username_max_length	2021-07-07 16:13:02.513518+08
14	auth	0009_alter_user_last_name_max_length	2021-07-07 16:13:02.520878+08
15	auth	0010_alter_group_name_max_length	2021-07-07 16:13:02.526847+08
16	auth	0011_update_proxy_permissions	2021-07-07 16:13:02.533833+08
17	auth	0012_alter_user_first_name_max_length	2021-07-07 16:13:02.539788+08
18	dashboard	0001_initial	2021-07-07 16:13:02.676913+08
19	sessions	0001_initial	2021-07-07 16:13:02.703909+08
20	dashboard	0002_auto_20210707_1646	2021-07-07 16:46:53.196281+08
21	dashboard	0003_auto_20210708_0914	2021-07-08 09:14:23.114193+08
22	dashboard	0004_auto_20210708_1048	2021-07-08 10:48:45.643996+08
23	dashboard	0005_auto_20210708_1141	2021-07-08 11:41:43.187329+08
24	dashboard	0006_kpi_costscom_kpi_npk_kpi_percapita_rb_farm_rb_income_rb_socio	2021-07-08 14:53:18.051708+08
25	dashboard	0007_kpi_pop	2021-07-13 15:50:00.20482+08
26	dashboard	0008_alter_kpi_pop_population	2021-07-13 15:52:20.312333+08
27	dashboard	0009_rb_ycost	2021-07-19 10:49:56.099318+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: ids_ecosystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ids_ecosystem (id, eco, "ecoName") FROM stdin;
0	0	Lowland rainfed
1	1	Irrigated
2	2	All Ecosystems
3	3	Upland
\.


--
-- Data for Name: ids_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ids_location (id, "locCode", "locType", "locName", parent, sort) FROM stdin;
1	1	1	Ilocos Region	\N	2
2	2	1	Cagayan Valley	\N	4
3	3	1	Central Luzon	\N	5
4	4	1	CALABARZON	\N	6
5	5	1	Bicol Region	\N	8
6	6	1	Western Visayas	\N	9
7	7	1	Central Visayas	\N	10
8	8	1	Eastern Visayas	\N	11
9	9	1	Zamboanga Peninsula	\N	12
10	10	1	Northern Mindanao	\N	13
11	11	1	Davao Region	\N	14
12	12	1	SOCCSKSARGEN	\N	15
13	13	1	Metro Manila	\N	1
14	14	1	CAR	\N	3
15	15	1	BARMM	\N	17
16	16	1	CARAGA	\N	16
17	17	1	MIMAROPA	\N	7
18	19	1	Southern Tagalog	\N	\N
19	1	2	Abra	14	\N
20	2	2	Agusan del Norte	16	\N
21	3	2	Agusan del Sur	16	\N
22	4	2	Aklan	6	\N
23	5	2	Albay	5	\N
24	6	2	Antique	6	\N
25	7	2	Basilan	15	\N
26	8	2	Bataan	3	\N
27	9	2	Batanes	2	\N
28	10	2	Batangas	4	\N
29	11	2	Benguet	14	\N
30	12	2	Bohol	7	\N
31	13	2	Bukidnon	10	\N
32	14	2	Bulacan	3	\N
33	15	2	Cagayan	2	\N
34	16	2	Camarines Norte	5	\N
35	17	2	Camarines Sur	5	\N
36	18	2	Camiguin	10	\N
37	19	2	Capiz	6	\N
38	20	2	Catanduanes	5	\N
39	21	2	Cavite	4	\N
40	22	2	Cebu	7	\N
41	23	2	Davao del Norte	11	\N
42	24	2	Davao del Sur	11	\N
43	25	2	Davao Oriental	11	\N
44	26	2	Eastern Samar	8	\N
45	27	2	Ifugao	14	\N
46	28	2	Ilocos Norte	1	\N
47	29	2	Ilocos Sur	1	\N
48	30	2	Iloilo	6	\N
49	31	2	Isabela	2	\N
50	32	2	Kalinga	14	\N
51	33	2	La Union	1	\N
52	34	2	Laguna	4	\N
53	35	2	Lanao Del Norte	10	\N
54	36	2	Lanao Del Sur	15	\N
55	37	2	Leyte	8	\N
56	39	2	Maguindanao	15	\N
57	40	2	Marinduque	17	\N
58	41	2	Masbate	5	\N
59	42	2	Misamis Occidental	10	\N
60	43	2	Misamis Oriental	10	\N
61	44	2	Mountain Province	14	\N
62	45	2	Negros Occidental	6	\N
63	46	2	Negros Oriental	7	\N
64	47	2	North Cotabato	12	\N
65	48	2	Northern Samar	8	\N
66	49	2	Nueva Ecija	3	\N
67	50	2	Nueva Vizcaya	2	\N
68	51	2	Occidental Mindoro	17	\N
69	52	2	Oriental Mindoro	17	\N
70	53	2	Palawan	17	\N
71	54	2	Pampanga	3	\N
72	55	2	Pangasinan	1	\N
73	56	2	Quezon	4	\N
74	57	2	Quirino	2	\N
75	58	2	Rizal	4	\N
76	59	2	Romblon	17	\N
77	60	2	Western Samar	8	\N
78	61	2	Siquijor	7	\N
79	62	2	Sorsogon	5	\N
80	63	2	South Cotabato	12	\N
81	64	2	Southern Leyte	8	\N
82	65	2	Sultan Kudarat	12	\N
83	66	2	Sulu	15	\N
84	67	2	Surigao Del Norte	16	\N
85	68	2	Surigao Del Sur	16	\N
86	69	2	Tarlac	3	\N
87	70	2	Tawi-Tawi	15	\N
88	71	2	Zambales	3	\N
89	72	2	Zamboanga del Norte	9	\N
90	73	2	Zamboanga del Sur	9	\N
91	77	2	Aurora	3	\N
92	78	2	Biliran	8	\N
93	79	2	Guimaras	6	\N
94	80	2	Sarangani	12	\N
95	81	2	Apayao	14	\N
96	82	2	Davao de Oro	11	\N
97	83	2	Zamboanga Sibugay	9	\N
98	85	2	Dinagat Islands	16	\N
99	86	2	Davao Occidental	11	\N
100	87	2	Kalinga-Apayao	14	\N
101	999	2	Philippines	\N	\N
102	2	3	Davao City	24	\N
103	32	3	Zamboanga City	73	\N
\.


--
-- Data for Name: kpi_costs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_costs (id, "locType", year, "costProduction", "locCode") FROM stdin;
1	2	1991	9273.04	999
2	2	1992	\N	999
3	2	1993	\N	999
4	2	1994	\N	999
5	2	1995	16588.34	999
6	2	1996	18472.34	999
7	2	1997	19446.00	999
8	2	1998	20292.36	999
9	2	1999	20459.52	999
10	2	2000	21495.08	999
11	2	2001	22149.62	999
12	2	2002	21864.00	999
13	2	2003	22874.00	999
14	2	2004	25256.00	999
15	2	2005	27925.00	999
16	2	2006	28622.00	999
17	2	2007	30580.00	999
18	2	2008	37197.00	999
19	2	2009	37716.00	999
20	2	2010	39300.00	999
21	2	2011	41179.00	999
22	2	2012	42475.00	999
23	2	2013	42061.00	999
24	2	2014	48684.00	999
25	2	2015	42382.00	999
26	2	2016	42708.28	999
27	2	2017	44241.52	999
28	2	2018	47674.91	999
29	2	2019	45302.00	999
30	1	2019	48098.00	14
31	1	2019	62659.00	1
32	1	2019	60353.00	2
33	1	2019	56928.00	3
34	1	2019	49837.00	4
35	1	2019	55989.00	17
36	1	2019	40251.00	6
37	1	2019	49919.00	7
38	1	2019	50867.00	9
39	1	2019	54260.00	10
40	1	2019	61819.00	11
41	1	2019	44831.00	12
42	1	2019	41438.00	16
43	1	2019	33517.00	15
\.


--
-- Data for Name: kpi_costscom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_costscom (id, "locName", year, "materialInputs", "hiredLabor", "OFELabor", machine, irrigation, "landRent", "interestCapital", "otherInputs") FROM stdin;
1	Philippines	2000	13.00	37.00	16.00	7.00	2.00	16.00	7.00	2.00
2	Philippines	2001	14.00	36.00	16.00	8.00	2.00	15.00	7.00	2.00
3	Philippines	2002	18.00	34.00	12.00	6.00	2.00	18.00	6.00	4.00
4	Philippines	2003	21.00	30.00	13.00	6.00	2.00	18.00	6.00	4.00
5	Philippines	2004	22.00	31.00	12.00	6.00	2.00	17.00	6.00	4.00
6	Philippines	2005	24.00	30.00	11.00	6.00	2.00	17.00	6.00	4.00
7	Philippines	2006	23.00	30.00	12.00	6.00	2.00	17.00	6.00	4.00
8	Philippines	2007	22.00	31.00	12.00	6.00	2.00	17.00	6.00	4.00
9	Philippines	2008	24.00	31.00	11.00	5.00	2.00	18.00	6.00	3.00
10	Philippines	2009	21.00	31.00	10.00	7.00	2.00	16.00	6.00	7.00
11	Philippines	2010	19.00	31.00	12.00	7.00	2.00	16.00	6.00	7.00
12	Philippines	2011	20.00	31.00	12.00	7.00	2.00	15.00	6.00	7.00
13	Philippines	2012	20.00	33.00	12.00	7.00	2.00	16.00	3.00	7.00
14	Philippines	2013	20.00	37.00	9.00	7.00	1.00	19.00	3.00	4.00
15	Philippines	2014	18.00	39.00	10.00	6.00	1.00	19.00	3.00	4.00
16	Philippines	2015	18.00	37.00	13.00	7.00	1.00	16.00	4.00	4.00
17	Philippines	2016	18.00	37.00	13.00	7.00	1.00	16.00	4.00	4.00
18	Philippines	2017	16.00	38.00	13.00	7.00	1.00	17.00	4.00	4.00
19	Philippines	2018	16.00	38.00	13.00	7.00	1.00	17.00	4.00	4.00
20	Philippines	2019	16.00	38.00	14.00	7.00	1.00	15.00	5.00	4.00
\.


--
-- Data for Name: kpi_cpi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_cpi (id, "locType", year, "cpiAll", "cpiFood", "cpiRice", "locCode") FROM stdin;
1	2	1994	38.94	38.90	39.34	999
2	2	1995	41.62	42.00	44.69	999
3	2	1996	45.07	46.56	52.84	999
4	2	1997	47.62	47.99	52.60	999
5	2	1998	52.09	51.95	54.48	999
6	2	1999	55.28	54.45	55.77	999
7	2	2000	58.92	56.11	56.74	999
8	2	2001	62.11	58.12	57.49	999
9	2	2002	63.80	59.25	58.85	999
10	2	2003	65.23	59.77	59.56	999
11	2	2004	68.37	63.45	61.01	999
12	2	2005	72.88	67.46	65.10	999
13	2	2006	76.86	70.87	67.70	999
14	2	2007	79.13	73.54	69.94	999
15	2	2008	85.60	83.43	85.42	999
16	2	2009	89.21	88.78	92.11	999
17	2	2010	92.58	92.43	95.16	999
18	2	2011	96.95	97.66	99.15	999
19	2	2012	100.00	100.00	100.00	999
20	2	2013	102.60	102.60	103.60	999
21	2	2014	106.30	108.90	115.00	999
22	2	2015	107.00	110.90	115.40	999
23	2	2016	108.40	112.80	114.80	999
24	2	2017	111.50	116.40	115.90	999
25	2	2018	117.30	124.10	122.50	999
26	2	2019	120.20	126.30	118.80	999
27	2	2020	123.30	129.80	115.70	999
\.


--
-- Data for Name: kpi_npk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_npk (id, "locCode", "locType", year, eco, nperha, pperha, kperha) FROM stdin;
1	1	2	2019	2	74.94	6.76	12.12
2	1	2	2019	1	80.76	6.49	11.25
3	1	2	2019	0	62.57	7.35	13.97
4	2	2	2019	2	43.66	6.24	5.39
5	2	2	2019	1	43.91	6.28	5.42
6	2	2	2019	0	42.59	6.08	5.29
7	2	3	2019	2	56.49	4.44	6.78
8	2	3	2019	1	68.89	5.19	7.35
9	2	3	2019	0	40.49	3.28	6.24
10	3	2	2019	2	46.37	3.64	5.40
11	3	2	2019	1	41.69	3.91	5.82
12	3	2	2019	0	52.03	3.52	5.21
13	4	2	2019	2	53.99	4.54	8.10
14	4	2	2019	1	59.02	5.70	9.72
15	4	2	2019	0	49.43	3.49	6.64
16	5	2	2019	2	68.34	6.37	11.67
17	5	2	2019	1	72.70	6.93	12.73
18	5	2	2019	0	49.12	3.90	7.00
19	6	2	2019	2	78.21	7.19	10.13
20	6	2	2019	1	80.36	7.12	10.59
21	6	2	2019	0	77.99	7.58	9.91
22	7	2	2019	2	17.93	1.78	3.39
23	7	2	2019	1	19.78	1.91	3.63
24	7	2	2019	0	11.40	1.16	2.21
25	8	2	2019	2	104.93	9.17	17.44
26	8	2	2019	1	105.23	9.18	17.46
27	8	2	2019	0	83.37	8.49	16.15
28	10	2	2019	2	90.27	4.07	7.75
29	10	2	2019	1	96.81	5.62	10.69
30	10	2	2019	0	61.58	2.19	4.17
31	11	2	2019	2	77.91	9.34	17.77
32	11	2	2019	1	79.53	9.38	17.84
33	11	2	2019	0	60.39	8.98	17.09
34	12	2	2019	2	58.83	11.43	21.16
35	12	2	2019	1	66.23	12.52	23.28
36	12	2	2019	0	48.35	9.88	18.16
37	13	2	2019	2	70.39	7.88	6.31
38	13	2	2019	1	70.68	7.68	6.06
39	13	2	2019	0	69.73	9.83	8.34
40	14	2	2019	2	68.13	11.69	16.40
41	14	2	2019	1	70.81	11.95	16.92
42	14	2	2019	0	51.94	10.12	13.31
43	15	2	2019	2	97.45	9.56	8.81
44	15	2	2019	1	102.48	10.23	8.86
45	15	2	2019	0	74.87	6.51	8.63
46	16	2	2019	2	65.85	8.50	10.43
47	16	2	2019	1	63.62	8.03	9.07
48	16	2	2019	0	70.37	9.46	13.20
49	17	2	2019	2	73.18	9.52	12.27
50	17	2	2019	1	76.14	10.26	12.46
51	17	2	2019	0	66.25	7.51	12.09
52	18	2	2019	2	91.63	8.95	14.65
53	18	2	2019	1	91.63	8.95	14.65
54	18	2	2019	0	\N	\N	\N
55	19	2	2019	2	63.52	8.10	8.99
56	19	2	2019	1	67.08	9.41	11.62
57	19	2	2019	0	62.67	7.64	7.99
58	20	2	2019	2	38.74	3.05	5.81
59	20	2	2019	1	36.88	2.69	5.12
60	20	2	2019	0	41.24	3.54	6.74
61	21	2	2019	2	81.46	2.95	5.49
62	21	2	2019	1	82.33	2.97	5.66
63	21	2	2019	0	76.87	4.32	3.89
64	22	2	2019	2	91.62	10.25	17.15
65	22	2	2019	1	92.07	10.41	17.36
66	22	2	2019	0	85.15	7.86	14.23
67	23	2	2019	2	73.99	6.17	9.31
68	23	2	2019	1	75.46	6.26	9.41
69	23	2	2019	0	57.53	5.21	8.20
70	24	2	2019	2	124.89	8.65	15.34
71	24	2	2019	1	124.89	8.65	15.34
72	24	2	2019	0	\N	\N	\N
73	25	2	2019	2	70.85	6.36	8.63
74	25	2	2019	1	72.18	6.77	8.78
75	25	2	2019	0	65.42	4.68	8.00
76	26	2	2019	2	20.09	3.64	6.30
77	26	2	2019	1	33.23	6.20	9.54
78	26	2	2019	0	15.13	2.67	5.08
79	27	2	2019	2	58.74	5.69	9.72
80	27	2	2019	1	58.97	5.85	10.07
81	27	2	2019	0	55.13	2.20	1.72
82	28	2	2019	2	119.18	11.53	20.33
83	28	2	2019	1	121.32	11.73	20.73
84	28	2	2019	0	116.48	11.14	19.36
85	29	2	2019	2	144.13	16.27	18.73
86	29	2	2019	1	152.26	16.20	22.05
87	29	2	2019	0	130.74	16.54	13.21
88	30	2	2019	2	72.69	7.08	9.78
89	30	2	2019	1	77.13	8.09	10.81
90	30	2	2019	0	69.83	6.43	9.12
91	31	2	2019	2	96.32	10.82	11.30
92	31	2	2019	1	97.79	11.12	11.79
93	31	2	2019	0	76.32	6.54	4.53
94	32	2	2019	2	121.62	7.17	9.72
95	32	2	2019	1	121.50	7.06	9.39
96	32	2	2019	0	144.53	12.49	23.76
97	32	3	2019	2	72.45	6.83	10.44
98	32	3	2019	1	72.36	5.94	9.88
99	32	3	2019	0	83.95	9.89	11.86
100	33	2	2019	2	83.96	5.82	9.35
101	33	2	2019	1	85.61	5.63	8.67
102	33	2	2019	0	80.84	6.18	10.63
103	34	2	2019	2	88.43	5.17	9.60
104	34	2	2019	1	88.41	5.13	9.51
105	34	2	2019	0	89.73	8.97	17.07
106	35	2	2019	2	79.56	5.93	8.72
107	35	2	2019	1	78.31	6.10	9.00
108	35	2	2019	0	92.22	4.90	7.05
109	36	2	2019	2	74.24	8.20	7.37
110	36	2	2019	1	66.08	4.44	4.74
111	36	2	2019	0	80.30	9.40	8.71
112	37	2	2019	2	43.82	4.22	7.94
113	37	2	2019	1	48.67	4.67	8.75
114	37	2	2019	0	32.41	3.17	6.02
115	38	2	2019	2	62.06	5.52	9.13
116	38	2	2019	1	74.88	7.08	7.61
117	38	2	2019	0	60.05	5.32	10.12
118	40	2	2019	2	47.69	5.56	5.98
119	40	2	2019	1	55.56	6.73	7.63
120	40	2	2019	0	32.81	3.35	2.86
121	41	2	2019	2	50.08	4.05	5.24
122	41	2	2019	1	41.23	5.09	7.08
123	41	2	2019	0	52.72	3.74	4.70
124	42	2	2019	2	70.87	8.57	9.22
125	42	2	2019	1	71.96	8.71	9.50
126	42	2	2019	0	54.26	6.49	4.81
127	43	2	2019	2	83.71	6.48	8.95
128	43	2	2019	1	84.71	6.53	8.99
129	43	2	2019	0	68.31	6.11	8.96
130	44	2	2019	2	19.52	2.95	5.25
131	44	2	2019	1	20.27	3.03	5.55
132	44	2	2019	0	23.74	4.28	5.98
133	45	2	2019	2	74.92	10.25	9.67
134	45	2	2019	1	80.12	11.17	10.47
135	45	2	2019	0	66.92	8.73	8.30
136	46	2	2019	2	76.93	11.36	10.79
137	46	2	2019	1	79.55	11.45	10.96
138	46	2	2019	0	68.14	11.06	10.24
139	47	2	2019	2	65.59	7.46	7.18
140	47	2	2019	1	66.40	7.86	8.10
141	47	2	2019	0	64.09	6.33	4.50
142	48	2	2019	2	18.79	1.72	3.15
143	48	2	2019	1	20.03	2.16	3.72
144	48	2	2019	0	18.63	1.66	3.07
145	49	2	2019	2	99.61	15.06	18.48
146	49	2	2019	1	99.43	15.18	18.75
147	49	2	2019	0	102.02	13.43	14.90
148	50	2	2019	2	115.00	11.98	16.86
149	50	2	2019	1	117.03	12.13	17.00
150	50	2	2019	0	64.98	8.36	13.35
151	51	2	2019	2	85.44	7.41	13.55
152	51	2	2019	1	86.08	7.26	13.11
153	51	2	2019	0	86.93	8.18	15.35
154	52	2	2019	2	86.80	9.57	16.78
155	52	2	2019	1	86.39	10.22	17.87
156	52	2	2019	0	89.38	5.42	9.89
157	53	2	2019	2	106.27	14.34	16.01
158	53	2	2019	1	121.46	16.07	17.73
159	53	2	2019	0	86.41	12.26	13.87
160	54	2	2019	2	132.84	9.06	15.73
161	54	2	2019	1	133.04	9.07	15.74
162	54	2	2019	0	52.68	8.21	13.36
163	55	2	2019	2	80.25	5.82	10.10
164	55	2	2019	1	77.82	5.58	9.25
165	55	2	2019	0	85.82	6.36	12.04
166	56	2	2019	2	78.93	5.98	10.55
167	56	2	2019	1	96.71	7.19	13.14
168	56	2	2019	0	45.91	3.73	5.74
169	57	2	2019	2	87.19	14.05	10.47
170	57	2	2019	1	87.94	14.30	10.67
171	57	2	2019	0	75.09	10.00	7.22
172	58	2	2019	2	68.66	4.23	8.05
173	58	2	2019	1	69.44	4.02	7.64
174	58	2	2019	0	63.31	5.73	10.90
175	59	2	2019	2	84.11	7.92	14.63
176	59	2	2019	1	91.39	8.87	16.16
177	59	2	2019	0	15.58	6.81	12.84
178	60	2	2019	2	20.23	3.19	3.61
179	60	2	2019	1	23.34	3.03	3.61
180	60	2	2019	0	19.96	3.20	3.60
181	61	2	2019	2	74.46	8.40	15.67
182	61	2	2019	1	74.92	8.26	15.48
183	61	2	2019	0	68.41	10.23	18.16
184	62	2	2019	2	56.12	7.68	10.79
185	62	2	2019	1	54.02	7.18	10.00
186	62	2	2019	0	62.53	9.23	13.21
187	63	2	2019	2	91.65	7.68	13.29
188	63	2	2019	1	92.67	7.52	13.11
189	63	2	2019	0	89.24	9.07	15.15
190	64	2	2019	2	72.99	8.33	12.05
191	64	2	2019	1	74.25	8.38	12.05
192	64	2	2019	0	57.43	7.64	12.02
193	65	2	2019	2	84.71	3.40	5.83
194	65	2	2019	1	87.80	3.44	5.78
195	65	2	2019	0	74.60	3.21	6.07
196	67	2	2019	2	99.19	12.39	19.66
197	67	2	2019	1	40.99	3.36	6.40
198	67	2	2019	0	32.17	3.62	6.88
199	68	2	2019	2	\N	\N	\N
200	68	2	2019	1	69.29	10.05	15.36
201	68	2	2019	0	42.70	6.74	8.55
202	69	2	2019	2	78.55	7.30	12.59
203	69	2	2019	1	78.04	7.27	12.45
204	69	2	2019	0	86.40	7.80	14.70
205	71	2	2019	2	96.09	10.52	18.39
206	71	2	2019	1	101.49	11.13	19.48
207	71	2	2019	0	81.48	8.89	15.47
208	72	2	2019	2	77.45	13.04	8.92
209	72	2	2019	1	67.32	11.41	8.53
210	72	2	2019	0	86.99	14.57	9.29
211	73	2	2019	2	63.46	7.47	4.26
212	73	2	2019	1	58.55	6.76	3.22
213	73	2	2019	0	77.28	9.41	7.26
214	77	2	2019	2	67.50	8.86	14.71
215	77	2	2019	1	67.34	8.84	14.70
216	77	2	2019	0	71.60	9.26	14.92
217	78	2	2019	2	74.91	13.51	9.07
218	78	2	2019	1	74.91	13.51	9.07
219	78	2	2019	0	\N	\N	\N
220	79	2	2019	2	48.37	10.81	12.81
221	79	2	2019	1	45.99	10.50	10.81
222	79	2	2019	0	49.00	10.89	13.33
223	80	2	2019	2	61.03	7.28	9.21
224	80	2	2019	1	60.57	7.57	9.07
225	80	2	2019	0	65.02	6.15	9.41
226	81	2	2019	2	80.82	7.42	13.04
227	81	2	2019	1	83.60	7.74	14.31
228	81	2	2019	0	69.15	6.05	7.71
229	82	2	2019	2	60.12	5.54	7.86
230	82	2	2019	1	62.64	5.90	8.33
231	82	2	2019	0	46.99	3.67	5.41
232	83	2	2019	2	89.33	10.64	13.25
233	83	2	2019	1	99.66	12.16	14.75
234	83	2	2019	0	83.80	9.82	12.47
\.


--
-- Data for Name: kpi_pay; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_pay (id, "locType", year, semester, eco, "estProduction", "areaHarv", "yieldEst", "locCode") FROM stdin;
1	1	1987	1	0	4185.00	2190.00	1.91	1
2	1	1987	1	1	138345.00	51310.00	2.70	1
3	1	1987	1	2	142530.00	53500.00	2.66	1
4	1	1987	2	0	217211.00	109260.00	1.99	1
5	1	1987	2	1	322840.00	117850.00	2.74	1
6	1	1987	2	2	540051.00	227110.00	2.38	1
7	1	1988	1	0	783.00	670.00	1.17	1
8	1	1988	1	1	140695.00	50530.00	2.78	1
9	1	1988	1	2	141478.00	51200.00	2.76	1
10	1	1988	2	0	361439.00	142820.00	2.53	1
11	1	1988	2	1	338394.00	118250.00	2.86	1
12	1	1988	2	2	699833.00	261070.00	2.68	1
13	1	1989	1	0	154.00	60.00	2.57	1
14	1	1989	1	1	141013.00	51580.00	2.73	1
15	1	1989	1	2	141167.00	51640.00	2.73	1
16	1	1989	2	0	346569.00	140940.00	2.46	1
17	1	1989	2	1	298087.00	105950.00	2.81	1
18	1	1989	2	2	644656.00	246890.00	2.61	1
19	1	1990	1	0	283.00	110.00	2.57	1
20	1	1990	1	1	139660.00	51940.00	2.69	1
21	1	1990	1	2	139943.00	52050.00	2.69	1
22	1	1990	2	0	370395.00	137940.00	2.69	1
23	1	1990	2	1	337353.00	116500.00	2.90	1
24	1	1990	2	2	707748.00	254440.00	2.78	1
25	1	1991	1	0	287.00	110.00	2.61	1
26	1	1991	1	1	147383.00	50420.00	2.92	1
27	1	1991	1	2	147670.00	50530.00	2.92	1
28	1	1991	2	0	380105.00	139990.00	2.72	1
29	1	1991	2	1	370809.00	121730.00	3.05	1
30	1	1991	2	2	750914.00	261720.00	2.87	1
31	1	1992	1	0	1656.00	570.00	2.91	1
32	1	1992	1	1	122253.00	42980.00	2.84	1
33	1	1992	1	2	123909.00	43550.00	2.85	1
34	1	1992	2	0	369447.00	143300.00	2.58	1
35	1	1992	2	1	332765.00	118300.00	2.81	1
36	1	1992	2	2	702212.00	261600.00	2.68	1
37	1	1993	1	0	240.00	80.00	3.00	1
38	1	1993	1	1	126906.00	46330.00	2.74	1
39	1	1993	1	2	127146.00	46410.00	2.74	1
40	1	1993	2	0	358217.00	143750.00	2.49	1
41	1	1993	2	1	352890.00	120160.00	2.94	1
42	1	1993	2	2	711107.00	263910.00	2.69	1
43	1	1994	1	0	\N	\N	\N	1
44	1	1994	1	1	156375.00	52590.00	2.97	1
45	1	1994	1	2	156375.00	52590.00	2.97	1
46	1	1994	2	0	382207.00	146190.00	2.61	1
47	1	1994	2	1	378888.00	119120.00	3.18	1
48	1	1994	2	2	761095.00	265310.00	2.87	1
49	1	1995	1	0	\N	\N	\N	1
50	1	1995	1	1	144513.00	51540.00	2.80	1
51	1	1995	1	2	144513.00	51540.00	2.80	1
52	1	1995	2	0	348200.00	144679.00	2.41	1
53	1	1995	2	1	393804.00	126745.00	3.11	1
54	1	1995	2	2	742004.00	271424.00	2.73	1
55	1	1996	1	0	135.00	50.00	2.70	1
56	1	1996	1	1	192359.00	62247.00	3.09	1
57	1	1996	1	2	192494.00	62297.00	3.09	1
58	1	1996	2	0	333284.00	132044.00	2.52	1
59	1	1996	2	1	466828.00	143008.00	3.26	1
60	1	1996	2	2	800112.00	275052.00	2.91	1
61	1	1997	1	0	83.00	32.00	2.59	1
62	1	1997	1	1	217370.00	67149.00	3.24	1
63	1	1997	1	2	217453.00	67181.00	3.24	1
64	1	1997	2	0	342630.00	132321.00	2.59	1
65	1	1997	2	1	516670.00	143916.00	3.59	1
66	1	1997	2	2	859300.00	276237.00	3.11	1
67	1	1998	1	0	\N	\N	\N	1
68	1	1998	1	1	166249.00	51989.00	3.20	1
69	1	1998	1	2	166249.00	51989.00	3.20	1
70	1	1998	2	0	256307.00	115023.00	2.23	1
71	1	1998	2	1	431561.00	135083.00	3.19	1
72	1	1998	2	2	687868.00	250106.00	2.75	1
73	1	1999	1	0	2250.00	900.00	2.50	1
74	1	1999	1	1	258529.00	72069.00	3.59	1
75	1	1999	1	2	260779.00	72969.00	3.57	1
76	1	1999	2	0	275792.00	101245.00	2.72	1
77	1	1999	2	1	545317.00	159677.00	3.42	1
78	1	1999	2	2	821109.00	260922.00	3.15	1
79	1	2000	1	0	719.00	283.00	2.54	1
80	1	2000	1	1	253676.00	69335.00	3.66	1
81	1	2000	1	2	254395.00	69618.00	3.65	1
82	1	2000	2	0	354308.00	121369.00	2.92	1
83	1	2000	2	1	599187.00	160230.00	3.74	1
84	1	2000	2	2	953495.00	281599.00	3.39	1
85	1	2001	1	0	1441.00	488.00	2.95	1
86	1	2001	1	1	269471.00	71012.00	3.79	1
87	1	2001	1	2	270912.00	71500.00	3.79	1
88	1	2001	2	0	356908.00	118483.00	3.01	1
89	1	2001	2	1	599407.00	162808.00	3.68	1
90	1	2001	2	2	956315.00	281291.00	3.40	1
91	1	2002	1	0	1196.00	420.00	2.85	1
92	1	2002	1	1	237874.00	69939.00	3.40	1
93	1	2002	1	2	239070.00	70359.00	3.40	1
94	1	2002	2	0	366498.00	120986.00	3.03	1
95	1	2002	2	1	616724.00	162783.00	3.79	1
96	1	2002	2	2	983222.00	283769.00	3.46	1
97	1	2003	1	0	867.00	300.00	2.89	1
98	1	2003	1	1	238667.00	66368.00	3.60	1
99	1	2003	1	2	239534.00	66668.00	3.59	1
100	1	2003	2	0	394595.00	119499.00	3.30	1
101	1	2003	2	1	670245.00	168193.00	3.98	1
102	1	2003	2	2	1064840.00	287692.00	3.70	1
103	1	2004	1	0	1172.00	395.00	2.97	1
104	1	2004	1	1	269316.00	71316.00	3.78	1
105	1	2004	1	2	270488.00	71711.00	3.77	1
106	1	2004	2	0	382088.00	118643.00	3.22	1
107	1	2004	2	1	664998.00	172691.00	3.85	1
108	1	2004	2	2	1047086.00	291334.00	3.59	1
109	1	2005	1	0	1143.00	378.00	3.02	1
110	1	2005	1	1	265330.00	69722.00	3.81	1
111	1	2005	1	2	266473.00	70100.00	3.80	1
112	1	2005	2	0	398866.00	117069.00	3.41	1
113	1	2005	2	1	717538.00	174986.00	4.10	1
114	1	2005	2	2	1116404.00	292055.00	3.82	1
115	1	2006	1	0	1279.00	398.00	3.21	1
116	1	2006	1	1	282998.00	70437.00	4.02	1
117	1	2006	1	2	284277.00	70835.00	4.01	1
118	1	2006	2	0	550126.00	138070.00	3.98	1
119	1	2006	2	1	762765.00	167521.00	4.55	1
120	1	2006	2	2	1312891.00	305591.00	4.30	1
121	1	2007	1	0	1236.00	370.00	3.34	1
122	1	2007	1	1	284246.00	70670.00	4.02	1
123	1	2007	1	2	285482.00	71040.00	4.02	1
124	1	2007	2	0	563036.00	139152.00	4.05	1
125	1	2007	2	1	793783.00	167169.00	4.75	1
126	1	2007	2	2	1356819.00	306321.00	4.43	1
127	1	2008	1	0	1469.00	418.00	3.51	1
128	1	2008	1	1	309630.00	75599.00	4.10	1
129	1	2008	1	2	311099.00	76017.00	4.09	1
130	1	2008	2	0	576533.00	141311.00	4.08	1
131	1	2008	2	1	803997.00	171435.00	4.69	1
132	1	2008	2	2	1380530.00	312746.00	4.41	1
133	1	2009	1	0	1341.00	387.00	3.47	1
134	1	2009	1	1	350444.00	84825.00	4.13	1
135	1	2009	1	2	351785.00	85212.00	4.13	1
136	1	2009	2	0	421310.00	133388.00	3.16	1
137	1	2009	2	1	578620.00	170739.00	3.39	1
138	1	2009	2	2	999930.00	304127.00	3.29	1
139	1	2010	1	0	1366.00	401.00	3.41	1
140	1	2010	1	1	362514.00	88976.00	4.07	1
141	1	2010	1	2	363880.00	89377.00	4.07	1
142	1	2010	2	0	448714.00	132952.00	3.38	1
143	1	2010	2	1	745779.00	171781.00	4.34	1
144	1	2010	2	2	1194493.00	304733.00	3.92	1
145	1	2011	1	0	1573.00	437.00	3.60	1
146	1	2011	1	1	391899.00	90459.00	4.33	1
147	1	2011	1	2	393472.00	90896.00	4.33	1
148	1	2011	2	0	456993.00	128347.00	3.56	1
149	1	2011	2	1	752349.00	173174.00	4.34	1
150	1	2011	2	2	1209342.00	301521.00	4.01	1
151	1	2012	1	0	1951.00	518.00	3.77	1
152	1	2012	1	1	437365.00	96076.00	4.55	1
153	1	2012	1	2	439316.00	96594.00	4.55	1
154	1	2012	2	0	490089.00	129280.00	3.79	1
155	1	2012	2	1	808290.00	177295.00	4.56	1
156	1	2012	2	2	1298379.00	306575.00	4.24	1
157	1	2013	1	0	1695.00	463.00	3.66	1
158	1	2013	1	1	428965.00	97203.00	4.41	1
159	1	2013	1	2	430660.00	97666.00	4.41	1
160	1	2013	2	0	478325.00	126601.00	3.78	1
161	1	2013	2	1	841072.00	182546.00	4.61	1
162	1	2013	2	2	1319397.00	309147.00	4.27	1
163	1	2014	1	0	1976.00	526.00	3.76	1
164	1	2014	1	1	457172.00	101541.00	4.50	1
165	1	2014	1	2	459148.00	102067.00	4.50	1
166	1	2014	2	0	488789.00	126070.00	3.88	1
167	1	2014	2	1	848292.00	184282.00	4.60	1
168	1	2014	2	2	1337081.00	310352.00	4.31	1
169	1	2015	1	0	1841.00	478.00	3.85	1
170	1	2015	1	1	466957.00	102400.00	4.56	1
171	1	2015	1	2	468798.00	102878.00	4.56	1
172	1	2015	2	0	484705.00	126518.00	3.83	1
173	1	2015	2	1	823618.00	183540.00	4.49	1
174	1	2015	2	2	1308323.00	310058.00	4.22	1
175	1	2016	1	0	1952.00	516.00	3.78	1
176	1	2016	1	1	455718.00	100046.00	4.56	1
177	1	2016	1	2	457670.00	100562.00	4.55	1
178	1	2016	2	0	497981.00	126447.00	3.94	1
179	1	2016	2	1	849475.00	185626.00	4.58	1
180	1	2016	2	2	1347456.00	312073.00	4.32	1
181	1	2017	1	0	1466.00	358.00	4.09	1
182	1	2017	1	1	490865.00	102872.00	4.77	1
183	1	2017	1	2	492331.00	103230.00	4.77	1
184	1	2017	2	0	510382.00	125897.00	4.05	1
185	1	2017	2	1	869339.00	182691.00	4.76	1
186	1	2017	2	2	1379721.00	308588.00	4.47	1
187	1	2018	1	0	1201.00	276.00	4.35	1
188	1	2018	1	1	488907.00	100845.00	4.85	1
189	1	2018	1	2	490108.00	101121.00	4.85	1
190	1	2018	2	0	463609.00	124194.00	3.73	1
191	1	2018	2	1	766326.52	180666.39	4.24	1
192	1	2018	2	2	1229935.52	304860.39	4.03	1
193	1	2019	1	0	1495.00	374.00	4.00	1
194	1	2019	1	1	487360.00	101824.68	4.79	1
195	1	2019	1	2	488855.00	102198.68	4.78	1
196	1	2019	2	0	500058.37	123821.66	4.04	1
197	1	2019	2	1	862352.00	181119.00	4.76	1
198	1	2019	2	2	1362410.37	304940.66	4.47	1
199	1	2020	1	0	1092.00	251.00	4.35	1
200	1	2020	1	1	493795.85	101648.00	4.86	1
201	1	2020	1	2	494887.85	101899.00	4.86	1
202	1	2020	2	0	516458.00	123834.00	4.17	1
203	1	2020	2	1	891316.00	181968.00	4.90	1
204	1	2020	2	2	1407774.00	305802.00	4.60	1
205	2	1987	1	0	\N	\N	\N	1
206	2	1987	1	1	6920.00	3450.00	2.01	1
207	2	1987	1	2	6920.00	3450.00	2.01	1
208	2	1987	2	0	6928.00	7250.00	0.96	1
209	2	1987	2	1	9237.00	5170.00	1.79	1
210	2	1987	2	2	16165.00	12420.00	1.30	1
211	2	1988	1	0	\N	\N	\N	1
212	2	1988	1	1	7009.00	3430.00	2.04	1
213	2	1988	1	2	7009.00	3430.00	2.04	1
214	2	1988	2	0	14893.00	8800.00	1.69	1
215	2	1988	2	1	9255.00	4690.00	1.97	1
216	2	1988	2	2	24148.00	13490.00	1.79	1
217	2	1989	1	0	\N	\N	\N	1
218	2	1989	1	1	8154.00	3890.00	2.10	1
219	2	1989	1	2	8154.00	3890.00	2.10	1
220	2	1989	2	0	10086.00	7860.00	1.28	1
221	2	1989	2	1	9269.00	4830.00	1.92	1
222	2	1989	2	2	19355.00	12690.00	1.53	1
223	2	1990	1	0	\N	\N	\N	1
224	2	1990	1	1	7646.00	3920.00	1.95	1
225	2	1990	1	2	7646.00	3920.00	1.95	1
226	2	1990	2	0	9587.00	7800.00	1.23	1
227	2	1990	2	1	8404.00	4890.00	1.72	1
228	2	1990	2	2	17991.00	12690.00	1.42	1
229	2	1991	1	0	\N	\N	\N	1
230	2	1991	1	1	7409.00	3890.00	1.90	1
231	2	1991	1	2	7409.00	3890.00	1.90	1
232	2	1991	2	0	8083.00	6900.00	1.17	1
233	2	1991	2	1	8617.00	4580.00	1.88	1
234	2	1991	2	2	16700.00	11480.00	1.45	1
235	2	1992	1	0	\N	\N	\N	1
236	2	1992	1	1	7339.00	3640.00	2.02	1
237	2	1992	1	2	7339.00	3640.00	2.02	1
238	2	1992	2	0	6426.00	6170.00	1.04	1
239	2	1992	2	1	6718.00	4590.00	1.46	1
240	2	1992	2	2	13144.00	10760.00	1.22	1
241	2	1993	1	0	\N	\N	\N	1
242	2	1993	1	1	6672.00	3520.00	1.90	1
243	2	1993	1	2	6672.00	3520.00	1.90	1
244	2	1993	2	0	8350.00	6360.00	1.31	1
245	2	1993	2	1	8849.00	4640.00	1.91	1
246	2	1993	2	2	17199.00	11000.00	1.56	1
247	2	1994	1	0	\N	\N	\N	1
248	2	1994	1	1	5401.00	2760.00	1.96	1
249	2	1994	1	2	5401.00	2760.00	1.96	1
250	2	1994	2	0	9710.00	6820.00	1.42	1
251	2	1994	2	1	9229.00	4850.00	1.90	1
252	2	1994	2	2	18939.00	11670.00	1.62	1
253	2	1995	1	0	\N	\N	\N	1
254	2	1995	1	1	6842.00	3510.00	1.95	1
255	2	1995	1	2	6842.00	3510.00	1.95	1
256	2	1995	2	0	7673.00	4970.00	1.54	1
257	2	1995	2	1	14794.00	8270.00	1.79	1
258	2	1995	2	2	22467.00	13240.00	1.70	1
259	2	1996	1	0	\N	\N	\N	1
260	2	1996	1	1	6463.00	3390.00	1.91	1
261	2	1996	1	2	6463.00	3390.00	1.91	1
262	2	1996	2	0	7821.00	4350.00	1.80	1
263	2	1996	2	1	20526.00	8940.00	2.30	1
264	2	1996	2	2	28347.00	13290.00	2.13	1
265	2	1997	1	0	\N	\N	\N	1
266	2	1997	1	1	8312.00	3530.00	2.35	1
267	2	1997	1	2	8312.00	3530.00	2.35	1
268	2	1997	2	0	7853.00	4440.00	1.77	1
269	2	1997	2	1	18874.00	8490.00	2.22	1
270	2	1997	2	2	26727.00	12930.00	2.07	1
271	2	1998	1	0	\N	\N	\N	1
272	2	1998	1	1	6492.00	3080.00	2.11	1
273	2	1998	1	2	6492.00	3080.00	2.11	1
274	2	1998	2	0	6843.00	4270.00	1.60	1
275	2	1998	2	1	17896.00	8450.00	2.12	1
276	2	1998	2	2	24739.00	12720.00	1.94	1
277	2	1999	1	0	\N	\N	\N	1
278	2	1999	1	1	8775.00	3330.00	2.64	1
279	2	1999	1	2	8775.00	3330.00	2.64	1
280	2	1999	2	0	10461.00	4080.00	2.56	1
281	2	1999	2	1	24931.00	8652.00	2.88	1
282	2	1999	2	2	35392.00	12732.00	2.78	1
283	2	2000	1	0	\N	\N	\N	1
284	2	2000	1	1	10068.00	3500.00	2.88	1
285	2	2000	1	2	10068.00	3500.00	2.88	1
286	2	2000	2	0	8473.00	4086.00	2.07	1
287	2	2000	2	1	25340.00	8646.00	2.93	1
288	2	2000	2	2	33813.00	12732.00	2.66	1
289	2	2001	1	0	\N	\N	\N	1
290	2	2001	1	1	9681.00	3520.00	2.75	1
291	2	2001	1	2	9681.00	3520.00	2.75	1
292	2	2001	2	0	8856.00	4086.00	2.17	1
293	2	2001	2	1	26110.00	8666.00	3.01	1
294	2	2001	2	2	34966.00	12752.00	2.74	1
295	2	2002	1	0	\N	\N	\N	1
296	2	2002	1	1	10199.00	3520.00	2.90	1
297	2	2002	1	2	10199.00	3520.00	2.90	1
298	2	2002	2	0	8350.00	4142.00	2.02	1
299	2	2002	2	1	24932.00	8816.00	2.83	1
300	2	2002	2	2	33282.00	12958.00	2.57	1
301	2	2003	1	0	\N	\N	\N	1
302	2	2003	1	1	10648.00	3686.00	2.89	1
303	2	2003	1	2	10648.00	3686.00	2.89	1
304	2	2003	2	0	9298.00	4146.00	2.24	1
305	2	2003	2	1	26810.00	8780.00	3.05	1
306	2	2003	2	2	36108.00	12926.00	2.79	1
307	2	2004	1	0	\N	\N	\N	1
308	2	2004	1	1	11281.00	3847.00	2.93	1
309	2	2004	1	2	11281.00	3847.00	2.93	1
310	2	2004	2	0	9632.00	4129.00	2.33	1
311	2	2004	2	1	27426.00	8795.00	3.12	1
312	2	2004	2	2	37058.00	12924.00	2.87	1
313	2	2005	1	0	\N	\N	\N	1
314	2	2005	1	1	12295.00	3864.00	3.18	1
315	2	2005	1	2	12295.00	3864.00	3.18	1
316	2	2005	2	0	10019.00	4148.00	2.42	1
317	2	2005	2	1	28291.00	8788.00	3.22	1
318	2	2005	2	2	38310.00	12936.00	2.96	1
319	2	2006	1	0	\N	\N	\N	1
320	2	2006	1	1	12978.00	3880.00	3.34	1
321	2	2006	1	2	12978.00	3880.00	3.34	1
322	2	2006	2	0	10354.00	4149.00	2.50	1
323	2	2006	2	1	29657.00	8804.00	3.37	1
324	2	2006	2	2	40011.00	12953.00	3.09	1
325	2	2007	1	0	\N	\N	\N	1
326	2	2007	1	1	13507.00	3884.00	3.48	1
327	2	2007	1	2	13507.00	3884.00	3.48	1
328	2	2007	2	0	25896.00	9895.00	2.62	1
329	2	2007	2	1	33598.00	9836.00	3.42	1
330	2	2007	2	2	59494.00	19731.00	3.02	1
331	2	2008	1	0	\N	\N	\N	1
332	2	2008	1	1	13982.00	3944.00	3.55	1
333	2	2008	1	2	13982.00	3944.00	3.55	1
334	2	2008	2	0	26943.00	8920.00	3.02	1
335	2	2008	2	1	34603.00	9831.00	3.52	1
336	2	2008	2	2	61546.00	18751.00	3.28	1
337	2	2009	1	0	\N	\N	\N	1
338	2	2009	1	1	17992.00	4919.00	3.66	1
339	2	2009	1	2	17992.00	4919.00	3.66	1
340	2	2009	2	0	25626.00	8920.00	2.87	1
341	2	2009	2	1	32684.00	9836.00	3.32	1
342	2	2009	2	2	58310.00	18756.00	3.11	1
343	2	2010	1	0	\N	\N	\N	1
344	2	2010	1	1	18011.00	4919.00	3.66	1
345	2	2010	1	2	18011.00	4919.00	3.66	1
346	2	2010	2	0	25955.00	8910.00	2.91	1
347	2	2010	2	1	33645.00	9844.00	3.42	1
348	2	2010	2	2	59600.00	18754.00	3.18	1
349	2	2011	1	0	\N	\N	\N	1
350	2	2011	1	1	18864.00	4955.00	3.81	1
351	2	2011	1	2	18864.00	4955.00	3.81	1
352	2	2011	2	0	27055.00	9078.00	2.98	1
353	2	2011	2	1	34509.00	9849.00	3.50	1
354	2	2011	2	2	61564.00	18927.00	3.25	1
355	2	2012	1	0	\N	\N	\N	1
356	2	2012	1	1	19525.00	5066.00	3.85	1
357	2	2012	1	2	19525.00	5066.00	3.85	1
358	2	2012	2	0	27114.00	9108.00	2.98	1
359	2	2012	2	1	35694.00	9849.00	3.62	1
360	2	2012	2	2	62808.00	18957.00	3.31	1
361	2	2013	1	0	\N	\N	\N	1
362	2	2013	1	1	19656.00	5071.00	3.88	1
363	2	2013	1	2	19656.00	5071.00	3.88	1
364	2	2013	2	0	24805.00	9111.00	2.72	1
365	2	2013	2	1	34983.00	9849.00	3.55	1
366	2	2013	2	2	59788.00	18960.00	3.15	1
367	2	2014	1	0	\N	\N	\N	1
368	2	2014	1	1	19666.00	5091.00	3.86	1
369	2	2014	1	2	19666.00	5091.00	3.86	1
370	2	2014	2	0	23137.00	9106.00	2.54	1
371	2	2014	2	1	32697.00	9859.00	3.32	1
372	2	2014	2	2	55834.00	18965.00	2.94	1
373	2	2015	1	0	\N	\N	\N	1
374	2	2015	1	1	19635.00	5101.00	3.85	1
375	2	2015	1	2	19635.00	5101.00	3.85	1
376	2	2015	2	0	19396.00	9060.00	2.14	1
377	2	2015	2	1	27685.00	9826.00	2.82	1
378	2	2015	2	2	47081.00	18886.00	2.49	1
379	2	2016	1	0	\N	\N	\N	1
380	2	2016	1	1	17023.00	5089.00	3.35	1
381	2	2016	1	2	17023.00	5089.00	3.35	1
382	2	2016	2	0	20827.00	9074.00	2.30	1
383	2	2016	2	1	27309.00	9830.00	2.78	1
384	2	2016	2	2	48136.00	18904.00	2.55	1
385	2	2017	1	0	0.00	0.00	\N	1
386	2	2017	1	1	18694.00	5089.00	3.67	1
387	2	2017	1	2	18694.00	5089.00	3.67	1
388	2	2017	2	0	21358.00	9080.00	2.35	1
389	2	2017	2	1	29425.00	9845.00	2.99	1
390	2	2017	2	2	50783.00	18925.00	2.68	1
391	2	2018	1	0	0.00	0.00	\N	1
392	2	2018	1	1	16900.00	4650.00	3.63	1
393	2	2018	1	2	16900.00	4650.00	3.63	1
394	2	2018	2	0	19175.00	9061.00	2.12	1
395	2	2018	2	1	26045.00	9830.00	2.65	1
396	2	2018	2	2	45220.00	18891.00	2.39	1
397	2	2019	1	0	0.00	0.00	\N	1
398	2	2019	1	1	17707.00	4650.00	3.81	1
399	2	2019	1	2	17707.00	4650.00	3.81	1
400	2	2019	2	0	25201.69	8993.00	2.80	1
401	2	2019	2	1	39521.00	9899.00	3.99	1
402	2	2019	2	2	64722.69	18892.00	3.43	1
403	2	2020	1	0	0.00	0.00	\N	1
404	2	2020	1	1	18813.00	4650.00	4.05	1
405	2	2020	1	2	18813.00	4650.00	4.05	1
406	2	2020	2	0	27323.60	8833.80	3.09	1
407	2	2020	2	1	37530.50	9898.87	3.79	1
408	2	2020	2	2	64854.10	18732.67	3.46	1
409	1	1987	1	0	21725.00	9160.00	2.37	10
410	1	1987	1	1	86940.00	26200.00	3.32	10
411	1	1987	1	2	108665.00	35360.00	3.07	10
412	1	1987	2	0	22740.00	16450.00	1.38	10
413	1	1987	2	1	161868.00	47410.00	3.41	10
414	1	1987	2	2	184608.00	63860.00	2.89	10
415	1	1988	1	0	7160.00	4010.00	1.79	10
416	1	1988	1	1	113634.00	34210.00	3.32	10
417	1	1988	1	2	120794.00	38220.00	3.16	10
418	1	1988	2	0	34206.00	18260.00	1.87	10
419	1	1988	2	1	160944.00	42780.00	3.76	10
420	1	1988	2	2	195150.00	61040.00	3.20	10
421	1	1989	1	0	21686.00	9560.00	2.27	10
422	1	1989	1	1	141298.00	40340.00	3.50	10
423	1	1989	1	2	162984.00	49900.00	3.27	10
424	1	1989	2	0	27194.00	16400.00	1.66	10
425	1	1989	2	1	207531.00	58560.00	3.54	10
426	1	1989	2	2	234725.00	74960.00	3.13	10
427	1	1990	1	0	5095.00	3040.00	1.68	10
428	1	1990	1	1	123524.00	42670.00	2.89	10
429	1	1990	1	2	128619.00	45710.00	2.81	10
430	1	1990	2	0	25853.00	14440.00	1.79	10
431	1	1990	2	1	211072.00	52630.00	4.01	10
432	1	1990	2	2	236925.00	67070.00	3.53	10
433	1	1991	1	0	4576.00	3320.00	1.38	10
434	1	1991	1	1	138767.00	44710.00	3.10	10
435	1	1991	1	2	143343.00	48030.00	2.98	10
436	1	1991	2	0	48129.00	29100.00	1.65	10
437	1	1991	2	1	223043.00	57020.00	3.91	10
438	1	1991	2	2	271172.00	86120.00	3.15	10
439	1	1992	1	0	2436.00	2270.00	1.07	10
440	1	1992	1	1	97986.00	38000.00	2.58	10
441	1	1992	1	2	100422.00	40270.00	2.49	10
442	1	1992	2	0	27857.00	17200.00	1.62	10
443	1	1992	2	1	225961.00	57360.00	3.94	10
444	1	1992	2	2	253818.00	74560.00	3.40	10
445	1	1993	1	0	3217.00	1910.00	1.68	10
446	1	1993	1	1	145418.00	43630.00	3.33	10
447	1	1993	1	2	148635.00	45540.00	3.26	10
448	1	1993	2	0	28320.00	18570.00	1.53	10
449	1	1993	2	1	249892.00	62220.00	4.02	10
450	1	1993	2	2	278212.00	80790.00	3.44	10
451	1	1994	1	0	14320.00	4520.00	3.17	10
452	1	1994	1	1	168986.00	48740.00	3.47	10
453	1	1994	1	2	183306.00	53260.00	3.44	10
454	1	1994	2	0	42611.00	19660.00	2.17	10
455	1	1994	2	1	273760.00	65640.00	4.17	10
456	1	1994	2	2	316371.00	85300.00	3.71	10
457	1	1995	1	0	3982.00	1646.00	2.42	10
458	1	1995	1	1	239103.00	59249.00	4.04	10
459	1	1995	1	2	243085.00	60895.00	3.99	10
460	1	1995	2	0	37386.00	16968.00	2.20	10
461	1	1995	2	1	230233.00	61748.00	3.73	10
462	1	1995	2	2	267619.00	78716.00	3.40	10
463	1	1996	1	0	4962.00	1977.00	2.51	10
464	1	1996	1	1	219323.00	59316.00	3.70	10
465	1	1996	1	2	224285.00	61293.00	3.66	10
466	1	1996	2	0	41855.00	17555.00	2.38	10
467	1	1996	2	1	186680.00	59056.00	3.16	10
468	1	1996	2	2	228535.00	76611.00	2.98	10
469	1	1997	1	0	5469.00	2281.00	2.40	10
470	1	1997	1	1	191222.00	55321.00	3.46	10
471	1	1997	1	2	196691.00	57602.00	3.41	10
472	1	1997	2	0	34360.00	14629.00	2.35	10
473	1	1997	2	1	180948.00	55186.00	3.28	10
474	1	1997	2	2	215308.00	69815.00	3.08	10
475	1	1998	1	0	2266.00	1038.00	2.18	10
476	1	1998	1	1	191412.00	54600.00	3.51	10
477	1	1998	1	2	193678.00	55638.00	3.48	10
478	1	1998	2	0	31040.00	11907.00	2.61	10
479	1	1998	2	1	202443.00	60455.00	3.35	10
480	1	1998	2	2	233483.00	72362.00	3.23	10
481	1	1999	1	0	6094.00	2359.00	2.58	10
482	1	1999	1	1	213165.00	61137.00	3.49	10
483	1	1999	1	2	219259.00	63496.00	3.45	10
484	1	1999	2	0	35960.00	14012.00	2.57	10
485	1	1999	2	1	224338.00	62828.00	3.57	10
486	1	1999	2	2	260298.00	76840.00	3.39	10
487	1	2000	1	0	7399.00	2806.00	2.64	10
488	1	2000	1	1	226851.00	65187.00	3.48	10
489	1	2000	1	2	234250.00	67993.00	3.45	10
490	1	2000	2	0	30411.00	11367.00	2.68	10
491	1	2000	2	1	234944.00	64860.00	3.62	10
492	1	2000	2	2	265355.00	76227.00	3.48	10
493	1	2001	1	0	10896.00	3630.00	3.00	10
494	1	2001	1	1	251813.00	67291.00	3.74	10
495	1	2001	1	2	262709.00	70921.00	3.70	10
496	1	2001	2	0	36133.00	12364.00	2.92	10
497	1	2001	2	1	232934.00	62922.00	3.70	10
498	1	2001	2	2	269067.00	75286.00	3.57	10
499	1	2002	1	0	8643.00	3508.00	2.46	10
500	1	2002	1	1	226001.00	64175.00	3.52	10
501	1	2002	1	2	234644.00	67683.00	3.47	10
502	1	2002	2	0	39330.00	13954.00	2.82	10
503	1	2002	2	1	258534.00	63310.00	4.08	10
504	1	2002	2	2	297864.00	77264.00	3.86	10
505	1	2003	1	0	4800.00	1818.00	2.64	10
506	1	2003	1	1	218463.00	60121.00	3.63	10
507	1	2003	1	2	223263.00	61939.00	3.60	10
508	1	2003	2	0	30802.00	11901.00	2.59	10
509	1	2003	2	1	235807.00	61626.00	3.83	10
510	1	2003	2	2	266609.00	73527.00	3.63	10
511	1	2004	1	0	5093.00	1970.00	2.59	10
512	1	2004	1	1	211363.00	58517.00	3.61	10
513	1	2004	1	2	216456.00	60487.00	3.58	10
514	1	2004	2	0	33184.00	12349.00	2.69	10
515	1	2004	2	1	216232.00	57098.00	3.79	10
516	1	2004	2	2	249416.00	69447.00	3.59	10
517	1	2005	1	0	1472.00	570.00	2.58	10
518	1	2005	1	1	194784.00	54797.00	3.55	10
519	1	2005	1	2	196256.00	55367.00	3.54	10
520	1	2005	2	0	29237.00	10614.00	2.75	10
521	1	2005	2	1	233517.00	58890.00	3.97	10
522	1	2005	2	2	262754.00	69504.00	3.78	10
523	1	2006	1	0	4113.00	1549.00	2.66	10
524	1	2006	1	1	201389.00	54357.00	3.70	10
525	1	2006	1	2	205502.00	55906.00	3.68	10
526	1	2006	2	0	27400.00	9884.00	2.77	10
527	1	2006	2	1	228387.00	56702.00	4.03	10
528	1	2006	2	2	255787.00	66586.00	3.84	10
529	1	2007	1	0	4485.00	1727.00	2.60	10
530	1	2007	1	1	216031.00	57459.00	3.76	10
531	1	2007	1	2	220516.00	59186.00	3.73	10
532	1	2007	2	0	31385.00	9802.00	3.20	10
533	1	2007	2	1	249991.00	60261.00	4.15	10
534	1	2007	2	2	281376.00	70063.00	4.02	10
535	1	2008	1	0	10226.00	3108.00	3.29	10
536	1	2008	1	1	247831.00	62543.00	3.96	10
537	1	2008	1	2	258057.00	65651.00	3.93	10
538	1	2008	2	0	33081.00	11514.00	2.87	10
539	1	2008	2	1	260108.00	60111.00	4.33	10
540	1	2008	2	2	293189.00	71625.00	4.09	10
541	1	2009	1	0	12297.00	4094.00	3.00	10
542	1	2009	1	1	245886.00	62329.00	3.94	10
543	1	2009	1	2	258183.00	66423.00	3.89	10
544	1	2009	2	0	39395.00	13022.00	3.03	10
545	1	2009	2	1	285719.00	67825.00	4.21	10
546	1	2009	2	2	325114.00	80847.00	4.02	10
547	1	2010	1	0	11228.00	3700.00	3.03	10
548	1	2010	1	1	221033.00	56614.00	3.90	10
549	1	2010	1	2	232261.00	60314.00	3.85	10
550	1	2010	2	0	39519.00	12619.00	3.13	10
551	1	2010	2	1	314662.00	70391.00	4.47	10
552	1	2010	2	2	354181.00	83010.00	4.27	10
553	1	2011	1	0	16676.00	5737.00	2.91	10
554	1	2011	1	1	249759.00	63272.00	3.95	10
555	1	2011	1	2	266435.00	69009.00	3.86	10
556	1	2011	2	0	43203.00	14403.00	3.00	10
557	1	2011	2	1	301352.00	68998.00	4.37	10
558	1	2011	2	2	344555.00	83401.00	4.13	10
559	1	2012	1	0	16810.00	5135.00	3.27	10
560	1	2012	1	1	261814.00	64867.00	4.04	10
561	1	2012	1	2	278624.00	70002.00	3.98	10
562	1	2012	2	0	46112.00	14474.00	3.19	10
563	1	2012	2	1	312612.00	70236.00	4.45	10
564	1	2012	2	2	358724.00	84710.00	4.23	10
565	1	2013	1	0	17852.00	5428.00	3.29	10
566	1	2013	1	1	266835.00	65822.00	4.05	10
567	1	2013	1	2	284687.00	71250.00	4.00	10
568	1	2013	2	0	47367.00	14240.00	3.33	10
569	1	2013	2	1	342849.00	72848.00	4.71	10
570	1	2013	2	2	390216.00	87088.00	4.48	10
571	1	2014	1	0	19667.00	5936.00	3.31	10
572	1	2014	1	1	295680.00	67122.00	4.41	10
573	1	2014	1	2	315347.00	73058.00	4.32	10
574	1	2014	2	0	50983.00	15037.00	3.39	10
575	1	2014	2	1	347434.00	73319.00	4.74	10
576	1	2014	2	2	398417.00	88356.00	4.51	10
577	1	2015	1	0	19193.00	5882.00	3.26	10
578	1	2015	1	1	285569.00	66123.00	4.32	10
579	1	2015	1	2	304762.00	72005.00	4.23	10
580	1	2015	2	0	50401.00	15123.00	3.33	10
581	1	2015	2	1	369957.00	76627.00	4.83	10
582	1	2015	2	2	420358.00	91750.00	4.58	10
583	1	2016	1	0	10171.00	3359.00	3.03	10
584	1	2016	1	1	259658.00	61762.00	4.20	10
585	1	2016	1	2	269829.00	65121.00	4.14	10
586	1	2016	2	0	53408.00	15171.00	3.52	10
587	1	2016	2	1	388047.00	79917.00	4.86	10
588	1	2016	2	2	441455.00	95088.00	4.64	10
589	1	2017	1	0	20701.50	6387.00	3.24	10
590	1	2017	1	1	301311.90	67383.00	4.47	10
591	1	2017	1	2	322013.40	73770.00	4.37	10
592	1	2017	2	0	52949.00	14870.00	3.56	10
593	1	2017	2	1	370771.00	75537.00	4.91	10
594	1	2017	2	2	423720.00	90407.00	4.69	10
595	1	2018	1	0	20823.00	6534.00	3.19	10
596	1	2018	1	1	296624.00	66451.00	4.46	10
597	1	2018	1	2	317447.00	72985.00	4.35	10
598	1	2018	2	0	55139.83	14752.00	3.74	10
599	1	2018	2	1	388813.49	77032.00	5.05	10
600	1	2018	2	2	443953.32	91784.00	4.84	10
601	1	2019	1	0	20606.68	6405.00	3.22	10
602	1	2019	1	1	295142.84	66393.00	4.45	10
603	1	2019	1	2	315749.52	72798.00	4.34	10
604	1	2019	2	0	54518.75	14240.50	3.83	10
605	1	2019	2	1	390870.32	76649.00	5.10	10
606	1	2019	2	2	445389.07	90889.50	4.90	10
607	1	2020	1	0	22298.77	6601.00	3.38	10
608	1	2020	1	1	296954.39	66680.00	4.45	10
609	1	2020	1	2	319253.16	73281.00	4.36	10
610	1	2020	2	0	62804.54	15861.00	3.96	10
611	1	2020	2	1	399767.28	77973.00	5.13	10
612	1	2020	2	2	462571.82	93834.00	4.93	10
613	2	1987	1	0	4280.00	1540.00	2.78	10
614	2	1987	1	1	13410.00	4240.00	3.16	10
615	2	1987	1	2	17690.00	5780.00	3.06	10
616	2	1987	2	0	17589.00	18150.00	0.97	10
617	2	1987	2	1	13538.00	7420.00	1.82	10
618	2	1987	2	2	31127.00	25570.00	1.22	10
619	2	1988	1	0	1165.00	800.00	1.46	10
620	2	1988	1	1	17791.00	5980.00	2.98	10
621	2	1988	1	2	18956.00	6780.00	2.80	10
622	2	1988	2	0	16416.00	20400.00	0.80	10
623	2	1988	2	1	14258.00	8030.00	1.78	10
624	2	1988	2	2	30674.00	28430.00	1.08	10
625	2	1989	1	0	137.00	170.00	0.81	10
626	2	1989	1	1	19073.00	6820.00	2.80	10
627	2	1989	1	2	19210.00	6990.00	2.75	10
628	2	1989	2	0	26908.00	20740.00	1.30	10
629	2	1989	2	1	21241.00	8480.00	2.50	10
630	2	1989	2	2	48149.00	29220.00	1.65	10
631	2	1990	1	0	64.00	130.00	0.49	10
632	2	1990	1	1	27937.00	8880.00	3.15	10
633	2	1990	1	2	28001.00	9010.00	3.11	10
634	2	1990	2	0	25552.00	18980.00	1.35	10
635	2	1990	2	1	27351.00	9800.00	2.79	10
636	2	1990	2	2	52903.00	28780.00	1.84	10
637	2	1991	1	0	139.00	80.00	1.74	10
638	2	1991	1	1	31293.00	9620.00	3.25	10
639	2	1991	1	2	31432.00	9700.00	3.24	10
640	2	1991	2	0	28521.00	17910.00	1.59	10
641	2	1991	2	1	25607.00	8590.00	2.98	10
642	2	1991	2	2	54128.00	26500.00	2.04	10
643	2	1992	1	0	459.00	310.00	1.48	10
644	2	1992	1	1	33234.00	9860.00	3.37	10
645	2	1992	1	2	33693.00	10170.00	3.31	10
646	2	1992	2	0	25751.00	15480.00	1.66	10
647	2	1992	2	1	26077.00	9090.00	2.87	10
648	2	1992	2	2	51828.00	24570.00	2.11	10
649	2	1993	1	0	190.00	100.00	1.90	10
650	2	1993	1	1	20826.00	6920.00	3.01	10
651	2	1993	1	2	21016.00	7020.00	2.99	10
652	2	1993	2	0	15883.00	14610.00	1.09	10
653	2	1993	2	1	22061.00	8050.00	2.74	10
654	2	1993	2	2	37944.00	22660.00	1.67	10
655	2	1994	1	0	936.00	490.00	1.91	10
656	2	1994	1	1	19904.00	5980.00	3.33	10
657	2	1994	1	2	20840.00	6470.00	3.22	10
658	2	1994	2	0	27265.00	19220.00	1.42	10
659	2	1994	2	1	24863.00	7360.00	3.38	10
660	2	1994	2	2	52128.00	26580.00	1.96	10
661	2	1995	1	0	\N	\N	\N	10
662	2	1995	1	1	17887.00	6448.00	2.77	10
663	2	1995	1	2	17887.00	6448.00	2.77	10
664	2	1995	2	0	23635.00	17600.00	1.34	10
665	2	1995	2	1	18678.00	7070.00	2.64	10
666	2	1995	2	2	42313.00	24670.00	1.72	10
667	2	1996	1	0	74.00	90.00	0.82	10
668	2	1996	1	1	20220.00	6620.00	3.05	10
669	2	1996	1	2	20294.00	6710.00	3.02	10
670	2	1996	2	0	15618.00	15580.00	1.00	10
671	2	1996	2	1	21088.00	7000.00	3.01	10
672	2	1996	2	2	36706.00	22580.00	1.63	10
673	2	1997	1	0	\N	\N	\N	10
674	2	1997	1	1	21907.00	6972.00	3.14	10
675	2	1997	1	2	21907.00	6972.00	3.14	10
676	2	1997	2	0	10640.00	11870.00	0.90	10
677	2	1997	2	1	22700.00	7370.00	3.08	10
678	2	1997	2	2	33340.00	19240.00	1.73	10
679	2	1998	1	0	\N	\N	\N	10
680	2	1998	1	1	13142.00	5080.00	2.59	10
681	2	1998	1	2	13142.00	5080.00	2.59	10
682	2	1998	2	0	13143.00	10520.00	1.25	10
683	2	1998	2	1	20978.00	6995.00	3.00	10
684	2	1998	2	2	34121.00	17515.00	1.95	10
685	2	1999	1	0	720.00	600.00	1.20	10
686	2	1999	1	1	15435.00	5230.00	2.95	10
687	2	1999	1	2	16155.00	5830.00	2.77	10
688	2	1999	2	0	16683.00	11400.00	1.46	10
689	2	1999	2	1	25120.00	7060.00	3.56	10
690	2	1999	2	2	41803.00	18460.00	2.26	10
691	2	2000	1	0	1153.00	620.00	1.86	10
692	2	2000	1	1	20828.00	6180.00	3.37	10
693	2	2000	1	2	21981.00	6800.00	3.23	10
694	2	2000	2	0	14123.00	11270.00	1.25	10
695	2	2000	2	1	24327.00	7070.00	3.44	10
696	2	2000	2	2	38450.00	18340.00	2.10	10
697	2	2001	1	0	500.00	300.00	1.67	10
698	2	2001	1	1	21865.00	6154.00	3.55	10
699	2	2001	1	2	22365.00	6454.00	3.47	10
700	2	2001	2	0	11210.00	10590.00	1.06	10
701	2	2001	2	1	24093.00	7090.00	3.40	10
702	2	2001	2	2	35303.00	17680.00	2.00	10
703	2	2002	1	0	288.00	250.00	1.15	10
704	2	2002	1	1	19993.00	6071.00	3.29	10
705	2	2002	1	2	20281.00	6321.00	3.21	10
706	2	2002	2	0	16377.00	10210.00	1.60	10
707	2	2002	2	1	25138.00	7315.00	3.44	10
708	2	2002	2	2	41515.00	17525.00	2.37	10
709	2	2003	1	0	89.00	81.00	1.10	10
710	2	2003	1	1	17402.00	5950.00	2.92	10
711	2	2003	1	2	17491.00	6031.00	2.90	10
712	2	2003	2	0	15825.00	9630.00	1.64	10
713	2	2003	2	1	26656.00	7320.00	3.64	10
714	2	2003	2	2	42481.00	16950.00	2.51	10
715	2	2004	1	0	\N	\N	\N	10
716	2	2004	1	1	18240.00	5804.00	3.14	10
717	2	2004	1	2	18240.00	5804.00	3.14	10
718	2	2004	2	0	14896.00	7165.00	2.08	10
719	2	2004	2	1	27475.00	6610.00	4.16	10
720	2	2004	2	2	42371.00	13775.00	3.08	10
721	2	2005	1	0	\N	\N	\N	10
722	2	2005	1	1	19640.00	4800.00	4.09	10
723	2	2005	1	2	19640.00	4800.00	4.09	10
724	2	2005	2	0	11996.00	4910.00	2.44	10
725	2	2005	2	1	22842.00	5155.00	4.43	10
726	2	2005	2	2	34838.00	10065.00	3.46	10
727	2	2006	1	0	\N	\N	\N	10
728	2	2006	1	1	18700.00	4536.00	4.12	10
729	2	2006	1	2	18700.00	4536.00	4.12	10
730	2	2006	2	0	10078.00	4345.00	2.32	10
731	2	2006	2	1	20698.00	4802.00	4.31	10
732	2	2006	2	2	30776.00	9147.00	3.36	10
733	2	2007	1	0	\N	\N	\N	10
734	2	2007	1	1	13288.00	3250.00	4.09	10
735	2	2007	1	2	13288.00	3250.00	4.09	10
736	2	2007	2	0	13283.00	4410.00	3.01	10
737	2	2007	2	1	23319.00	4810.00	4.85	10
738	2	2007	2	2	36602.00	9220.00	3.97	10
739	2	2008	1	0	316.00	170.00	1.86	10
740	2	2008	1	1	19200.00	4584.00	4.19	10
741	2	2008	1	2	19516.00	4754.00	4.11	10
742	2	2008	2	0	15921.00	4750.00	3.35	10
743	2	2008	2	1	24781.00	5090.00	4.87	10
744	2	2008	2	2	40702.00	9840.00	4.14	10
745	2	2009	1	0	724.00	270.00	2.68	10
746	2	2009	1	1	20578.00	4718.00	4.36	10
747	2	2009	1	2	21302.00	4988.00	4.27	10
748	2	2009	2	0	14533.00	4554.00	3.19	10
749	2	2009	2	1	19965.00	4587.00	4.35	10
750	2	2009	2	2	34498.00	9141.00	3.77	10
751	2	2010	1	0	1642.00	713.00	2.30	10
752	2	2010	1	1	16796.00	4324.00	3.88	10
753	2	2010	1	2	18438.00	5037.00	3.66	10
754	2	2010	2	0	12648.00	3704.00	3.41	10
755	2	2010	2	1	22337.00	4713.00	4.74	10
756	2	2010	2	2	34985.00	8417.00	4.16	10
757	2	2011	1	0	721.00	368.00	1.96	10
758	2	2011	1	1	19455.00	4754.00	4.09	10
759	2	2011	1	2	20176.00	5122.00	3.94	10
760	2	2011	2	0	10865.00	4611.00	2.36	10
761	2	2011	2	1	18528.00	4783.00	3.87	10
762	2	2011	2	2	29393.00	9394.00	3.13	10
763	2	2012	1	0	767.00	330.00	2.32	10
764	2	2012	1	1	18594.00	4963.00	3.75	10
765	2	2012	1	2	19361.00	5293.00	3.66	10
766	2	2012	2	0	8203.00	5098.00	1.61	10
767	2	2012	2	1	15642.00	4287.00	3.65	10
768	2	2012	2	2	23845.00	9385.00	2.54	10
769	2	2013	1	0	706.00	310.00	2.28	10
770	2	2013	1	1	19932.00	5551.00	3.59	10
771	2	2013	1	2	20638.00	5861.00	3.52	10
772	2	2013	2	0	14083.00	5169.00	2.72	10
773	2	2013	2	1	17477.00	4590.00	3.81	10
774	2	2013	2	2	31560.00	9759.00	3.23	10
775	2	2014	1	0	821.00	370.00	2.22	10
776	2	2014	1	1	18287.00	5610.00	3.26	10
777	2	2014	1	2	19108.00	5980.00	3.20	10
778	2	2014	2	0	11735.00	4765.00	2.46	10
779	2	2014	2	1	15532.00	4327.00	3.59	10
780	2	2014	2	2	27267.00	9092.00	3.00	10
781	2	2015	1	0	1288.00	385.00	3.35	10
782	2	2015	1	1	18578.00	5500.00	3.38	10
783	2	2015	1	2	19866.00	5885.00	3.38	10
784	2	2015	2	0	6525.00	3025.00	2.16	10
785	2	2015	2	1	13618.00	4175.00	3.26	10
786	2	2015	2	2	20143.00	7200.00	2.80	10
787	2	2016	1	0	\N	\N	\N	10
788	2	2016	1	1	15771.00	4788.00	3.29	10
789	2	2016	1	2	15771.00	4788.00	3.29	10
790	2	2016	2	0	9725.00	4401.00	2.21	10
791	2	2016	2	1	14301.00	4572.00	3.13	10
792	2	2016	2	2	24026.00	8973.00	2.68	10
793	2	2017	1	0	1452.00	561.00	2.59	10
794	2	2017	1	1	15061.00	4182.00	3.60	10
795	2	2017	1	2	16513.00	4743.00	3.48	10
796	2	2017	2	0	10270.00	4521.00	2.27	10
797	2	2017	2	1	15463.00	3932.00	3.93	10
798	2	2017	2	2	25733.00	8453.00	3.04	10
799	2	2018	1	0	3969.00	1200.00	3.31	10
800	2	2018	1	1	16087.00	4311.00	3.73	10
801	2	2018	1	2	20056.00	5511.00	3.64	10
802	2	2018	2	0	10950.48	4034.00	2.71	10
803	2	2018	2	1	16303.31	3882.00	4.20	10
804	2	2018	2	2	27253.79	7916.00	3.44	10
805	2	2019	1	0	2834.95	1090.00	2.60	10
806	2	2019	1	1	13386.12	3666.00	3.65	10
807	2	2019	1	2	16221.07	4756.00	3.41	10
808	2	2019	2	0	9367.55	4984.00	1.88	10
809	2	2019	2	1	19394.00	4512.56	4.30	10
810	2	2019	2	2	28761.55	9496.56	3.03	10
811	2	2020	1	0	1204.50	536.00	2.25	10
812	2	2020	1	1	10676.00	3618.00	2.95	10
813	2	2020	1	2	11880.50	4154.00	2.86	10
814	2	2020	2	0	7362.00	4453.12	1.65	10
815	2	2020	2	1	13759.00	4174.02	3.30	10
816	2	2020	2	2	21121.00	8627.15	2.45	10
817	1	1987	1	0	30935.00	14720.00	2.10	11
818	1	1987	1	1	143130.00	39220.00	3.65	11
819	1	1987	1	2	174065.00	53940.00	3.23	11
820	1	1987	2	0	65564.00	21070.00	3.11	11
821	1	1987	2	1	163604.00	36140.00	4.53	11
822	1	1987	2	2	229168.00	57210.00	4.01	11
823	1	1988	1	0	43851.00	18570.00	2.36	11
824	1	1988	1	1	153577.00	41830.00	3.67	11
825	1	1988	1	2	197428.00	60400.00	3.27	11
826	1	1988	2	0	63961.00	20940.00	3.05	11
827	1	1988	2	1	174677.00	38590.00	4.53	11
828	1	1988	2	2	238638.00	59530.00	4.01	11
829	1	1989	1	0	50725.00	17760.00	2.86	11
830	1	1989	1	1	172871.00	44280.00	3.90	11
831	1	1989	1	2	223596.00	62040.00	3.60	11
832	1	1989	2	0	85205.00	26330.00	3.24	11
833	1	1989	2	1	167434.00	38430.00	4.36	11
834	1	1989	2	2	252639.00	64760.00	3.90	11
835	1	1990	1	0	34883.00	13210.00	2.64	11
836	1	1990	1	1	188089.00	45980.00	4.09	11
837	1	1990	1	2	222972.00	59190.00	3.77	11
838	1	1990	2	0	67847.00	22530.00	3.01	11
839	1	1990	2	1	224926.00	54240.00	4.15	11
840	1	1990	2	2	292773.00	76770.00	3.81	11
841	1	1991	1	0	39857.00	14850.00	2.68	11
842	1	1991	1	1	196444.00	47310.00	4.15	11
843	1	1991	1	2	236301.00	62160.00	3.80	11
844	1	1991	2	0	28062.00	13870.00	2.02	11
845	1	1991	2	1	196449.00	50230.00	3.91	11
846	1	1991	2	2	224511.00	64100.00	3.50	11
847	1	1992	1	0	4836.00	2740.00	1.76	11
848	1	1992	1	1	126805.00	34730.00	3.65	11
849	1	1992	1	2	131641.00	37470.00	3.51	11
850	1	1992	2	0	20708.00	7620.00	2.72	11
851	1	1992	2	1	150171.00	35690.00	4.21	11
852	1	1992	2	2	170879.00	43310.00	3.95	11
853	1	1993	1	0	18952.00	8170.00	2.32	11
854	1	1993	1	1	142116.00	37040.00	3.84	11
855	1	1993	1	2	161068.00	45210.00	3.56	11
856	1	1993	2	0	21914.00	8620.00	2.54	11
857	1	1993	2	1	149371.00	41630.00	3.59	11
858	1	1993	2	2	171285.00	50250.00	3.41	11
859	1	1994	1	0	10820.00	5620.00	1.93	11
860	1	1994	1	1	170178.00	43760.00	3.89	11
861	1	1994	1	2	180998.00	49380.00	3.67	11
862	1	1994	2	0	10043.00	5300.00	1.89	11
863	1	1994	2	1	175723.00	42930.00	4.09	11
864	1	1994	2	2	185766.00	48230.00	3.85	11
865	1	1995	1	0	14901.00	6520.00	2.29	11
866	1	1995	1	1	165488.00	44760.00	3.70	11
867	1	1995	1	2	180389.00	51280.00	3.52	11
868	1	1995	2	0	23428.00	14158.00	1.65	11
869	1	1995	2	1	177653.00	45533.00	3.90	11
870	1	1995	2	2	201081.00	59691.00	3.37	11
871	1	1996	1	0	18958.00	9142.00	2.07	11
872	1	1996	1	1	173844.00	45667.00	3.81	11
873	1	1996	1	2	192802.00	54809.00	3.52	11
874	1	1996	2	0	30654.00	14231.00	2.15	11
875	1	1996	2	1	165309.00	43328.00	3.82	11
876	1	1996	2	2	195963.00	57559.00	3.40	11
877	1	1997	1	0	22955.00	11145.00	2.06	11
878	1	1997	1	1	163543.00	44121.00	3.71	11
879	1	1997	1	2	186498.00	55266.00	3.37	11
880	1	1997	2	0	14149.00	7466.00	1.90	11
881	1	1997	2	1	166514.00	44934.00	3.71	11
882	1	1997	2	2	180663.00	52400.00	3.45	11
883	1	1998	1	0	7842.00	4471.00	1.75	11
884	1	1998	1	1	146001.00	41490.00	3.52	11
885	1	1998	1	2	153843.00	45961.00	3.35	11
886	1	1998	2	0	13427.00	5431.00	2.47	11
887	1	1998	2	1	172063.00	42727.00	4.03	11
888	1	1998	2	2	185490.00	48158.00	3.85	11
889	1	1999	1	0	20974.00	8584.00	2.44	11
890	1	1999	1	1	158634.00	42565.00	3.73	11
891	1	1999	1	2	179608.00	51149.00	3.51	11
892	1	1999	2	0	23900.00	9436.00	2.53	11
893	1	1999	2	1	182804.00	42623.00	4.29	11
894	1	1999	2	2	206704.00	52059.00	3.97	11
895	1	2000	1	0	20021.00	9301.00	2.15	11
896	1	2000	1	1	158334.00	41228.00	3.84	11
897	1	2000	1	2	178355.00	50529.00	3.53	11
898	1	2000	2	0	15260.00	6904.00	2.21	11
899	1	2000	2	1	194568.00	46915.00	4.15	11
900	1	2000	2	2	209828.00	53819.00	3.90	11
901	1	2001	1	0	20137.00	9803.00	2.05	11
902	1	2001	1	1	169031.00	43103.00	3.92	11
903	1	2001	1	2	189168.00	52906.00	3.58	11
904	1	2001	2	0	19337.00	7645.00	2.53	11
905	1	2001	2	1	193936.00	45405.00	4.27	11
906	1	2001	2	2	213273.00	53050.00	4.02	11
907	1	2002	1	0	18032.00	9559.00	1.89	11
908	1	2002	1	1	174395.00	43453.00	4.01	11
909	1	2002	1	2	192427.00	53012.00	3.63	11
910	1	2002	2	0	25546.00	9295.00	2.75	11
911	1	2002	2	1	222179.00	49412.00	4.50	11
912	1	2002	2	2	247725.00	58707.00	4.22	11
913	1	2003	1	0	24545.00	10398.00	2.36	11
914	1	2003	1	1	182656.00	44409.00	4.11	11
915	1	2003	1	2	207201.00	54807.00	3.78	11
916	1	2003	2	0	27505.00	9488.00	2.90	11
917	1	2003	2	1	224738.00	49482.00	4.54	11
918	1	2003	2	2	252243.00	58970.00	4.28	11
919	1	2004	1	0	26992.00	9438.00	2.86	11
920	1	2004	1	1	193104.00	44660.00	4.32	11
921	1	2004	1	2	220096.00	54098.00	4.07	11
922	1	2004	2	0	22299.00	8048.00	2.77	11
923	1	2004	2	1	237976.00	48651.00	4.89	11
924	1	2004	2	2	260275.00	56699.00	4.59	11
925	1	2005	1	0	15788.00	7607.00	2.08	11
926	1	2005	1	1	196936.00	45106.00	4.37	11
927	1	2005	1	2	212724.00	52713.00	4.04	11
928	1	2005	2	0	21444.00	7929.00	2.70	11
929	1	2005	2	1	235918.00	47732.00	4.94	11
930	1	2005	2	2	257362.00	55661.00	4.62	11
931	1	2006	1	0	23491.00	9397.00	2.50	11
932	1	2006	1	1	201745.00	44872.00	4.50	11
933	1	2006	1	2	225236.00	54269.00	4.15	11
934	1	2006	2	0	24775.00	8121.00	3.05	11
935	1	2006	2	1	226400.00	46602.00	4.86	11
936	1	2006	2	2	251175.00	54723.00	4.59	11
937	1	2007	1	0	19610.00	7429.00	2.64	11
938	1	2007	1	1	193391.00	41680.00	4.64	11
939	1	2007	1	2	213001.00	49109.00	4.34	11
940	1	2007	2	0	20434.00	6236.00	3.28	11
941	1	2007	2	1	193749.00	42142.00	4.60	11
942	1	2007	2	2	214183.00	48378.00	4.43	11
943	1	2008	1	0	20751.00	6527.00	3.18	11
944	1	2008	1	1	181535.00	40668.00	4.46	11
945	1	2008	1	2	202286.00	47195.00	4.29	11
946	1	2008	2	0	20116.00	5750.00	3.50	11
947	1	2008	2	1	196552.00	42307.00	4.65	11
948	1	2008	2	2	216668.00	48057.00	4.51	11
949	1	2009	1	0	19211.00	6005.00	3.20	11
950	1	2009	1	1	178335.00	41597.00	4.29	11
951	1	2009	1	2	197546.00	47602.00	4.15	11
952	1	2009	2	0	18224.00	5588.00	3.26	11
953	1	2009	2	1	208055.00	42978.00	4.84	11
954	1	2009	2	2	226279.00	48566.00	4.66	11
955	1	2010	1	0	17329.00	5942.00	2.92	11
956	1	2010	1	1	182999.00	42249.00	4.33	11
957	1	2010	1	2	200328.00	48191.00	4.16	11
958	1	2010	2	0	18267.00	5650.00	3.23	11
959	1	2010	2	1	184216.00	42060.00	4.38	11
960	1	2010	2	2	202483.00	47710.00	4.24	11
961	1	2011	1	0	17853.00	5984.00	2.98	11
962	1	2011	1	1	179981.00	44884.00	4.01	11
963	1	2011	1	2	197834.00	50868.00	3.89	11
964	1	2011	2	0	19937.00	6480.00	3.08	11
965	1	2011	2	1	198772.00	43335.00	4.59	11
966	1	2011	2	2	218709.00	49815.00	4.39	11
967	1	2012	1	0	23435.00	7623.00	3.07	11
968	1	2012	1	1	190568.00	44614.00	4.27	11
969	1	2012	1	2	214003.00	52237.00	4.10	11
970	1	2012	2	0	19833.00	6831.00	2.90	11
971	1	2012	2	1	214867.00	44925.00	4.78	11
972	1	2012	2	2	234700.00	51756.00	4.53	11
973	1	2013	1	0	22971.00	7452.00	3.08	11
974	1	2013	1	1	177738.00	44434.00	4.00	11
975	1	2013	1	2	200709.00	51886.00	3.87	11
976	1	2013	2	0	21419.00	6903.00	3.10	11
977	1	2013	2	1	199564.00	44505.00	4.48	11
978	1	2013	2	2	220983.00	51408.00	4.30	11
979	1	2014	1	0	24158.00	7688.00	3.14	11
980	1	2014	1	1	199672.00	44881.00	4.45	11
981	1	2014	1	2	223830.00	52569.00	4.26	11
982	1	2014	2	0	21316.00	6891.00	3.09	11
983	1	2014	2	1	207121.00	44362.00	4.67	11
984	1	2014	2	2	228437.00	51253.00	4.46	11
985	1	2015	1	0	18303.00	5947.00	3.08	11
986	1	2015	1	1	197511.00	43392.00	4.55	11
987	1	2015	1	2	215814.00	49339.00	4.37	11
988	1	2015	2	0	14512.00	5296.00	2.74	11
989	1	2015	2	1	211542.00	44585.00	4.74	11
990	1	2015	2	2	226054.00	49881.00	4.53	11
991	1	2016	1	0	13614.00	5051.00	2.70	11
992	1	2016	1	1	172107.00	42430.00	4.06	11
993	1	2016	1	2	185721.00	47481.00	3.91	11
994	1	2016	2	0	18806.00	5675.00	3.31	11
995	1	2016	2	1	213421.00	44633.00	4.78	11
996	1	2016	2	2	232227.00	50308.00	4.62	11
997	1	2017	1	0	18634.00	6648.00	2.80	11
998	1	2017	1	1	178714.00	41901.00	4.27	11
999	1	2017	1	2	197348.00	48549.00	4.06	11
1000	1	2017	2	0	21781.00	7133.00	3.05	11
1001	1	2017	2	1	214536.00	45449.00	4.72	11
1002	1	2017	2	2	236317.00	52582.00	4.49	11
1003	1	2018	1	0	22319.00	6731.00	3.32	11
1004	1	2018	1	1	209816.00	44370.00	4.73	11
1005	1	2018	1	2	232135.00	51101.00	4.54	11
1006	1	2018	2	0	22697.03	7497.00	3.03	11
1007	1	2018	2	1	233272.65	47952.00	4.86	11
1008	1	2018	2	2	255969.68	55449.00	4.62	11
1009	1	2019	1	0	20764.88	6604.00	3.14	11
1010	1	2019	1	1	196886.23	44140.00	4.46	11
1011	1	2019	1	2	217651.11	50744.00	4.29	11
1012	1	2019	2	0	22104.69	6612.00	3.34	11
1013	1	2019	2	1	210612.80	45783.00	4.60	11
1014	1	2019	2	2	232717.49	52395.00	4.44	11
1136	2	2006	1	1	5589.00	2140.00	2.61	11
1015	1	2020	1	0	20875.81	6729.00	3.10	11
1016	1	2020	1	1	199247.45	42275.70	4.71	11
1017	1	2020	1	2	220123.26	49004.70	4.49	11
1018	1	2020	2	0	23570.85	7007.00	3.36	11
1019	1	2020	2	1	223069.58	46907.00	4.76	11
1020	1	2020	2	2	246640.43	53914.00	4.57	11
1021	2	1987	1	0	\N	\N	\N	11
1022	2	1987	1	1	1490.00	980.00	1.52	11
1023	2	1987	1	2	1490.00	980.00	1.52	11
1024	2	1987	2	0	82.00	80.00	1.03	11
1025	2	1987	2	1	3731.00	2340.00	1.59	11
1026	2	1987	2	2	3813.00	2420.00	1.58	11
1027	2	1988	1	0	\N	\N	\N	11
1028	2	1988	1	1	1900.00	1300.00	1.46	11
1029	2	1988	1	2	1900.00	1300.00	1.46	11
1030	2	1988	2	0	310.00	270.00	1.15	11
1031	2	1988	2	1	3789.00	2280.00	1.66	11
1032	2	1988	2	2	4099.00	2550.00	1.61	11
1033	2	1989	1	0	\N	\N	\N	11
1034	2	1989	1	1	2456.00	1520.00	1.62	11
1035	2	1989	1	2	2456.00	1520.00	1.62	11
1036	2	1989	2	0	19.00	10.00	1.90	11
1037	2	1989	2	1	4087.00	2430.00	1.68	11
1038	2	1989	2	2	4106.00	2440.00	1.68	11
1039	2	1990	1	0	\N	\N	\N	11
1040	2	1990	1	1	2849.00	1760.00	1.62	11
1041	2	1990	1	2	2849.00	1760.00	1.62	11
1042	2	1990	2	0	9.00	10.00	0.90	11
1043	2	1990	2	1	3106.00	1840.00	1.69	11
1044	2	1990	2	2	3115.00	1850.00	1.68	11
1045	2	1991	1	0	\N	\N	\N	11
1046	2	1991	1	1	2013.00	1340.00	1.50	11
1047	2	1991	1	2	2013.00	1340.00	1.50	11
1048	2	1991	2	0	18.00	10.00	1.80	11
1049	2	1991	2	1	3193.00	1650.00	1.94	11
1050	2	1991	2	2	3211.00	1660.00	1.93	11
1051	2	1992	1	0	\N	\N	\N	11
1052	2	1992	1	1	3911.00	1760.00	2.22	11
1053	2	1992	1	2	3911.00	1760.00	2.22	11
1054	2	1992	2	0	\N	\N	\N	11
1055	2	1992	2	1	3644.00	1670.00	2.18	11
1056	2	1992	2	2	3644.00	1670.00	2.18	11
1057	2	1993	1	0	\N	\N	\N	11
1058	2	1993	1	1	5313.00	1990.00	2.67	11
1059	2	1993	1	2	5313.00	1990.00	2.67	11
1060	2	1993	2	0	18.00	10.00	1.80	11
1061	2	1993	2	1	3883.00	1640.00	2.37	11
1062	2	1993	2	2	3901.00	1650.00	2.36	11
1063	2	1994	1	0	106.00	70.00	1.51	11
1064	2	1994	1	1	4329.00	1790.00	2.42	11
1065	2	1994	1	2	4435.00	1860.00	2.38	11
1066	2	1994	2	0	1249.00	910.00	1.37	11
1067	2	1994	2	1	4242.00	2070.00	2.05	11
1068	2	1994	2	2	5491.00	2980.00	1.84	11
1069	2	1995	1	0	200.00	150.00	1.33	11
1070	2	1995	1	1	3101.00	1730.00	1.79	11
1071	2	1995	1	2	3301.00	1880.00	1.76	11
1072	2	1995	2	0	1212.00	746.00	1.62	11
1073	2	1995	2	1	4047.00	2186.00	1.85	11
1074	2	1995	2	2	5259.00	2932.00	1.79	11
1075	2	1996	1	0	162.00	120.00	1.35	11
1076	2	1996	1	1	3494.00	1776.00	1.97	11
1077	2	1996	1	2	3656.00	1896.00	1.93	11
1078	2	1996	2	0	1208.00	786.00	1.54	11
1079	2	1996	2	1	4391.00	2318.00	1.89	11
1080	2	1996	2	2	5599.00	3104.00	1.80	11
1081	2	1997	1	0	\N	\N	\N	11
1082	2	1997	1	1	3470.00	1669.00	2.08	11
1083	2	1997	1	2	3470.00	1669.00	2.08	11
1084	2	1997	2	0	945.00	636.00	1.49	11
1085	2	1997	2	1	4844.00	2515.00	1.93	11
1086	2	1997	2	2	5789.00	3151.00	1.84	11
1087	2	1998	1	0	\N	\N	\N	11
1088	2	1998	1	1	2853.00	1564.00	1.82	11
1089	2	1998	1	2	2853.00	1564.00	1.82	11
1090	2	1998	2	0	598.00	488.00	1.23	11
1091	2	1998	2	1	4302.00	2252.00	1.91	11
1092	2	1998	2	2	4900.00	2740.00	1.79	11
1093	2	1999	1	0	\N	\N	\N	11
1094	2	1999	1	1	3628.00	1703.00	2.13	11
1095	2	1999	1	2	3628.00	1703.00	2.13	11
1096	2	1999	2	0	838.00	596.00	1.41	11
1097	2	1999	2	1	5025.00	2582.00	1.95	11
1098	2	1999	2	2	5863.00	3178.00	1.84	11
1099	2	2000	1	0	\N	\N	\N	11
1100	2	2000	1	1	4090.00	1931.00	2.12	11
1101	2	2000	1	2	4090.00	1931.00	2.12	11
1102	2	2000	2	0	1419.00	971.00	1.46	11
1103	2	2000	2	1	5530.00	2692.00	2.05	11
1104	2	2000	2	2	6949.00	3663.00	1.90	11
1105	2	2001	1	0	\N	\N	\N	11
1106	2	2001	1	1	4185.00	1952.00	2.14	11
1107	2	2001	1	2	4185.00	1952.00	2.14	11
1108	2	2001	2	0	1237.00	916.00	1.35	11
1109	2	2001	2	1	6510.00	3064.00	2.12	11
1110	2	2001	2	2	7747.00	3980.00	1.95	11
1111	2	2002	1	0	\N	\N	\N	11
1112	2	2002	1	1	4869.00	1953.00	2.49	11
1113	2	2002	1	2	4869.00	1953.00	2.49	11
1114	2	2002	2	0	1262.00	760.00	1.66	11
1115	2	2002	2	1	7729.00	3145.00	2.46	11
1116	2	2002	2	2	8991.00	3905.00	2.30	11
1117	2	2003	1	0	\N	\N	\N	11
1118	2	2003	1	1	3965.00	1826.00	2.17	11
1119	2	2003	1	2	3965.00	1826.00	2.17	11
1120	2	2003	2	0	1140.00	754.00	1.51	11
1121	2	2003	2	1	6964.00	3067.00	2.27	11
1122	2	2003	2	2	8104.00	3821.00	2.12	11
1123	2	2004	1	0	\N	\N	\N	11
1124	2	2004	1	1	4778.00	2030.00	2.35	11
1125	2	2004	1	2	4778.00	2030.00	2.35	11
1126	2	2004	2	0	1320.00	760.00	1.74	11
1127	2	2004	2	1	7761.00	3120.00	2.49	11
1128	2	2004	2	2	9081.00	3880.00	2.34	11
1129	2	2005	1	0	\N	\N	\N	11
1130	2	2005	1	1	5333.00	2072.00	2.57	11
1131	2	2005	1	2	5333.00	2072.00	2.57	11
1132	2	2005	2	0	1384.00	780.00	1.77	11
1133	2	2005	2	1	7947.00	3160.00	2.51	11
1134	2	2005	2	2	9331.00	3940.00	2.37	11
1135	2	2006	1	0	\N	\N	\N	11
1137	2	2006	1	2	5589.00	2140.00	2.61	11
1138	2	2006	2	0	1412.00	780.00	1.81	11
1139	2	2006	2	1	8766.00	3160.00	2.77	11
1140	2	2006	2	2	10178.00	3940.00	2.58	11
1141	2	2007	1	0	\N	\N	\N	11
1142	2	2007	1	1	5796.00	2160.00	2.68	11
1143	2	2007	1	2	5796.00	2160.00	2.68	11
1144	2	2007	2	0	2091.00	1010.00	2.07	11
1145	2	2007	2	1	8915.00	3180.00	2.80	11
1146	2	2007	2	2	11006.00	4190.00	2.63	11
1147	2	2008	1	0	\N	\N	\N	11
1148	2	2008	1	1	6121.00	2124.00	2.88	11
1149	2	2008	1	2	6121.00	2124.00	2.88	11
1150	2	2008	2	0	2030.00	1010.00	2.01	11
1151	2	2008	2	1	8991.00	3180.00	2.83	11
1152	2	2008	2	2	11021.00	4190.00	2.63	11
1153	2	2009	1	0	\N	\N	\N	11
1154	2	2009	1	1	6433.00	2219.00	2.90	11
1155	2	2009	1	2	6433.00	2219.00	2.90	11
1156	2	2009	2	0	1851.00	1006.00	1.84	11
1157	2	2009	2	1	7937.00	3011.00	2.64	11
1158	2	2009	2	2	9788.00	4017.00	2.44	11
1159	2	2010	1	0	\N	\N	\N	11
1160	2	2010	1	1	5760.00	2126.00	2.71	11
1161	2	2010	1	2	5760.00	2126.00	2.71	11
1162	2	2010	2	0	1937.00	1006.00	1.93	11
1163	2	2010	2	1	8083.00	3062.00	2.64	11
1164	2	2010	2	2	10020.00	4068.00	2.46	11
1165	2	2011	1	0	\N	\N	\N	11
1166	2	2011	1	1	5758.00	2094.00	2.75	11
1167	2	2011	1	2	5758.00	2094.00	2.75	11
1168	2	2011	2	0	1752.00	913.00	1.92	11
1169	2	2011	2	1	8280.00	2987.00	2.77	11
1170	2	2011	2	2	10032.00	3900.00	2.57	11
1171	2	2012	1	0	\N	\N	\N	11
1172	2	2012	1	1	6115.00	2180.00	2.81	11
1173	2	2012	1	2	6115.00	2180.00	2.81	11
1174	2	2012	2	0	2136.00	1086.00	1.97	11
1175	2	2012	2	1	8445.00	3020.00	2.80	11
1176	2	2012	2	2	10581.00	4106.00	2.58	11
1177	2	2013	1	0	\N	\N	\N	11
1178	2	2013	1	1	6144.00	2180.00	2.82	11
1179	2	2013	1	2	6144.00	2180.00	2.82	11
1180	2	2013	2	0	2196.00	1086.00	2.02	11
1181	2	2013	2	1	9151.00	3020.00	3.03	11
1182	2	2013	2	2	11347.00	4106.00	2.76	11
1183	2	2014	1	0	\N	\N	\N	11
1184	2	2014	1	1	6478.00	2180.00	2.97	11
1185	2	2014	1	2	6478.00	2180.00	2.97	11
1186	2	2014	2	0	2154.00	1086.00	1.98	11
1187	2	2014	2	1	8723.00	3020.00	2.89	11
1188	2	2014	2	2	10877.00	4106.00	2.65	11
1189	2	2015	1	0	\N	\N	\N	11
1190	2	2015	1	1	6891.00	2180.00	3.16	11
1191	2	2015	1	2	6891.00	2180.00	3.16	11
1192	2	2015	2	0	2239.00	1084.00	2.07	11
1193	2	2015	2	1	9014.00	3020.00	2.98	11
1194	2	2015	2	2	11253.00	4104.00	2.74	11
1195	2	2016	1	0	\N	\N	\N	11
1196	2	2016	1	1	6639.00	2195.00	3.02	11
1197	2	2016	1	2	6639.00	2195.00	3.02	11
1198	2	2016	2	0	2557.00	1288.00	1.99	11
1199	2	2016	2	1	8949.00	3081.00	2.90	11
1200	2	2016	2	2	11506.00	4369.00	2.63	11
1201	2	2017	1	0	0.00	0.00	\N	11
1202	2	2017	1	1	8144.00	2639.00	3.09	11
1203	2	2017	1	2	8144.00	2639.00	3.09	11
1204	2	2017	2	0	2460.00	1221.00	2.01	11
1205	2	2017	2	1	9672.00	3116.00	3.10	11
1206	2	2017	2	2	12132.00	4337.00	2.80	11
1207	2	2018	1	0	0.00	0.00	\N	11
1208	2	2018	1	1	8425.00	2722.00	3.10	11
1209	2	2018	1	2	8425.00	2722.00	3.10	11
1210	2	2018	2	0	2328.00	1221.00	1.91	11
1211	2	2018	2	1	9164.68	3155.00	2.90	11
1212	2	2018	2	2	11492.68	4376.00	2.63	11
1213	2	2019	1	0	0.00	0.00	\N	11
1214	2	2019	1	1	8311.33	2722.00	3.05	11
1215	2	2019	1	2	8311.33	2722.00	3.05	11
1216	2	2019	2	0	2370.00	1221.00	1.94	11
1217	2	2019	2	1	9766.60	3181.00	3.07	11
1218	2	2019	2	2	12136.60	4402.00	2.76	11
1219	2	2020	1	0	0.00	0.00	\N	11
1220	2	2020	1	1	8558.00	2722.00	3.14	11
1221	2	2020	1	2	8558.00	2722.00	3.14	11
1222	2	2020	2	0	2729.00	1221.00	2.24	11
1223	2	2020	2	1	10420.29	3181.00	3.28	11
1224	2	2020	2	2	13149.29	4402.00	2.99	11
1225	1	1987	1	0	28880.00	15290.00	1.89	12
1226	1	1987	1	1	179035.00	53990.00	3.32	12
1227	1	1987	1	2	207915.00	69280.00	3.00	12
1228	1	1987	2	0	125532.00	44530.00	2.82	12
1229	1	1987	2	1	319552.00	82880.00	3.86	12
1230	1	1987	2	2	445084.00	127410.00	3.49	12
1231	1	1988	1	0	39217.00	18390.00	2.13	12
1232	1	1988	1	1	193907.00	56310.00	3.44	12
1233	1	1988	1	2	233124.00	74700.00	3.12	12
1234	1	1988	2	0	117110.00	41730.00	2.81	12
1235	1	1988	2	1	332167.00	85030.00	3.91	12
1236	1	1988	2	2	449277.00	126760.00	3.54	12
1237	1	1989	1	0	42226.00	16840.00	2.51	12
1238	1	1989	1	1	239026.00	71700.00	3.33	12
1239	1	1989	1	2	281252.00	88540.00	3.18	12
1240	1	1989	2	0	119694.00	42870.00	2.79	12
1241	1	1989	2	1	277817.00	66750.00	4.16	12
1242	1	1989	2	2	397511.00	109620.00	3.63	12
1243	1	1990	1	0	23203.00	9610.00	2.41	12
1244	1	1990	1	1	184709.00	58120.00	3.18	12
1245	1	1990	1	2	207912.00	67730.00	3.07	12
1246	1	1990	2	0	102471.00	44620.00	2.30	12
1247	1	1990	2	1	207277.00	55430.00	3.74	12
1248	1	1990	2	2	309748.00	100050.00	3.10	12
1249	1	1991	1	0	16896.00	8070.00	2.09	12
1250	1	1991	1	1	177822.00	56400.00	3.15	12
1251	1	1991	1	2	194718.00	64470.00	3.02	12
1252	1	1991	2	0	109163.00	45890.00	2.38	12
1253	1	1991	2	1	239828.00	57820.00	4.15	12
1254	1	1991	2	2	348991.00	103710.00	3.37	12
1255	1	1992	1	0	2342.00	1730.00	1.35	12
1256	1	1992	1	1	142028.00	47530.00	2.99	12
1257	1	1992	1	2	144370.00	49260.00	2.93	12
1258	1	1992	2	0	85358.00	41350.00	2.06	12
1259	1	1992	2	1	269816.00	67510.00	4.00	12
1260	1	1992	2	2	355174.00	108860.00	3.26	12
1261	1	1993	1	0	16434.00	6690.00	2.46	12
1262	1	1993	1	1	197460.00	61830.00	3.19	12
1263	1	1993	1	2	213894.00	68520.00	3.12	12
1264	1	1993	2	0	71061.00	38540.00	1.84	12
1265	1	1993	2	1	282283.00	77680.00	3.63	12
1266	1	1993	2	2	353344.00	116220.00	3.04	12
1267	1	1994	1	0	40169.00	16870.00	2.38	12
1268	1	1994	1	1	205401.00	62910.00	3.26	12
1269	1	1994	1	2	245570.00	79780.00	3.08	12
1270	1	1994	2	0	133835.00	53700.00	2.49	12
1271	1	1994	2	1	310964.00	84850.00	3.66	12
1272	1	1994	2	2	444799.00	138550.00	3.21	12
1273	1	1995	1	0	28863.00	14910.00	1.94	12
1274	1	1995	1	1	235955.00	73100.00	3.23	12
1275	1	1995	1	2	264818.00	88010.00	3.01	12
1276	1	1995	2	0	206092.00	72653.00	2.84	12
1277	1	1995	2	1	356640.00	93669.00	3.81	12
1278	1	1995	2	2	562732.00	166322.00	3.38	12
1279	1	1996	1	0	83154.00	31354.00	2.65	12
1280	1	1996	1	1	348524.00	107836.00	3.23	12
1281	1	1996	1	2	431678.00	139190.00	3.10	12
1282	1	1996	2	0	159614.00	63007.00	2.53	12
1283	1	1996	2	1	396254.00	122264.00	3.24	12
1284	1	1996	2	2	555868.00	185271.00	3.00	12
1285	1	1997	1	0	72472.00	30409.00	2.38	12
1286	1	1997	1	1	281708.00	95528.00	2.95	12
1287	1	1997	1	2	354180.00	125937.00	2.81	12
1288	1	1997	2	0	98012.00	49547.00	1.98	12
1289	1	1997	2	1	445685.00	132239.00	3.37	12
1290	1	1997	2	2	543697.00	181786.00	2.99	12
1291	1	1998	1	0	9492.00	5190.00	1.83	12
1292	1	1998	1	1	217641.00	77328.00	2.81	12
1293	1	1998	1	2	227133.00	82518.00	2.75	12
1294	1	1998	2	0	105362.00	44470.00	2.37	12
1295	1	1998	2	1	380487.00	114366.00	3.33	12
1296	1	1998	2	2	485849.00	158836.00	3.06	12
1297	1	1999	1	0	54686.00	27121.00	2.02	12
1298	1	1999	1	1	345977.00	125941.00	2.75	12
1299	1	1999	1	2	400663.00	153062.00	2.62	12
1300	1	1999	2	0	97825.00	43342.00	2.26	12
1301	1	1999	2	1	442476.00	140249.00	3.15	12
1302	1	1999	2	2	540301.00	183591.00	2.94	12
1303	1	2000	1	0	56747.00	20593.00	2.76	12
1304	1	2000	1	1	402231.00	121243.00	3.32	12
1305	1	2000	1	2	458978.00	141836.00	3.24	12
1306	1	2000	2	0	98109.00	39706.00	2.47	12
1307	1	2000	2	1	487707.00	139964.00	3.48	12
1308	1	2000	2	2	585816.00	179670.00	3.26	12
1309	1	2001	1	0	39577.00	14949.00	2.65	12
1310	1	2001	1	1	399651.00	116535.00	3.43	12
1311	1	2001	1	2	439228.00	131484.00	3.34	12
1312	1	2001	2	0	103111.00	39800.00	2.59	12
1313	1	2001	2	1	520881.00	143604.00	3.63	12
1314	1	2001	2	2	623992.00	183404.00	3.40	12
1315	1	2002	1	0	45640.00	18059.00	2.53	12
1316	1	2002	1	1	402865.00	119026.00	3.38	12
1317	1	2002	1	2	448505.00	137085.00	3.27	12
1318	1	2002	2	0	103882.00	40114.00	2.59	12
1319	1	2002	2	1	508529.00	137433.00	3.70	12
1320	1	2002	2	2	612411.00	177547.00	3.45	12
1321	1	2003	1	0	25974.00	10998.00	2.36	12
1322	1	2003	1	1	376749.00	111114.00	3.39	12
1323	1	2003	1	2	402723.00	122112.00	3.30	12
1324	1	2003	2	0	109245.00	44407.00	2.46	12
1325	1	2003	2	1	513067.00	139724.00	3.67	12
1326	1	2003	2	2	622312.00	184131.00	3.38	12
1327	1	2004	1	0	40094.00	16788.00	2.39	12
1328	1	2004	1	1	379069.00	112996.00	3.35	12
1329	1	2004	1	2	419163.00	129784.00	3.23	12
1330	1	2004	2	0	118243.00	47539.00	2.49	12
1331	1	2004	2	1	559729.00	147779.00	3.79	12
1332	1	2004	2	2	677972.00	195318.00	3.47	12
1333	1	2005	1	0	31811.00	13179.00	2.41	12
1334	1	2005	1	1	364469.00	102866.00	3.54	12
1335	1	2005	1	2	396280.00	116045.00	3.41	12
1336	1	2005	2	0	131237.00	46999.00	2.79	12
1337	1	2005	2	1	562588.00	147821.00	3.81	12
1338	1	2005	2	2	693825.00	194820.00	3.56	12
1339	1	2006	1	0	50055.00	18997.00	2.63	12
1340	1	2006	1	1	392404.00	108706.00	3.61	12
1341	1	2006	1	2	442459.00	127703.00	3.46	12
1342	1	2006	2	0	137360.00	48949.00	2.81	12
1343	1	2006	2	1	566401.00	143226.00	3.95	12
1344	1	2006	2	2	703761.00	192175.00	3.66	12
1345	1	2007	1	0	38149.00	16321.00	2.34	12
1346	1	2007	1	1	393288.00	107829.00	3.65	12
1347	1	2007	1	2	431437.00	124150.00	3.48	12
1348	1	2007	2	0	156153.00	52512.00	2.97	12
1349	1	2007	2	1	599098.00	151679.00	3.95	12
1350	1	2007	2	2	755251.00	204191.00	3.70	12
1351	1	2008	1	0	69362.00	24371.00	2.85	12
1352	1	2008	1	1	433190.00	120489.00	3.60	12
1353	1	2008	1	2	502552.00	144860.00	3.47	12
1354	1	2008	2	0	167005.00	54863.00	3.04	12
1355	1	2008	2	1	565200.00	146680.00	3.85	12
1356	1	2008	2	2	732205.00	201543.00	3.63	12
1357	1	2009	1	0	85887.00	29930.00	2.87	12
1358	1	2009	1	1	434263.00	118943.00	3.65	12
1359	1	2009	1	2	520150.00	148873.00	3.49	12
1360	1	2009	2	0	146158.00	52704.00	2.77	12
1361	1	2009	2	1	562732.00	148091.00	3.80	12
1362	1	2009	2	2	708890.00	200795.00	3.53	12
1363	1	2010	1	0	42751.00	18286.00	2.34	12
1364	1	2010	1	1	385278.00	111498.00	3.46	12
1365	1	2010	1	2	428029.00	129784.00	3.30	12
1366	1	2010	2	0	157321.00	53573.00	2.94	12
1367	1	2010	2	1	599846.00	146460.00	4.10	12
1368	1	2010	2	2	757167.00	200033.00	3.79	12
1369	1	2011	1	0	67751.00	25274.00	2.68	12
1370	1	2011	1	1	435155.00	118866.00	3.66	12
1371	1	2011	1	2	502906.00	144140.00	3.49	12
1372	1	2011	2	0	158788.00	55041.00	2.88	12
1373	1	2011	2	1	582454.00	144439.00	4.03	12
1374	1	2011	2	2	741242.00	199480.00	3.72	12
1375	1	2012	1	0	81844.00	29220.00	2.80	12
1376	1	2012	1	1	444732.00	117000.00	3.80	12
1377	1	2012	1	2	526576.00	146220.00	3.60	12
1378	1	2012	2	0	160096.00	53378.00	3.00	12
1379	1	2012	2	1	584229.00	146387.00	3.99	12
1380	1	2012	2	2	744325.00	199765.00	3.73	12
1381	1	2013	1	0	78466.00	27165.00	2.89	12
1382	1	2013	1	1	457002.00	118631.00	3.85	12
1383	1	2013	1	2	535468.00	145796.00	3.67	12
1384	1	2013	2	0	167321.00	53058.00	3.15	12
1385	1	2013	2	1	644857.00	151492.00	4.26	12
1386	1	2013	2	2	812178.00	204550.00	3.97	12
1387	1	2014	1	0	79572.00	26223.00	3.03	12
1388	1	2014	1	1	463889.00	115379.00	4.02	12
1389	1	2014	1	2	543461.00	141602.00	3.84	12
1390	1	2014	2	0	169791.00	54460.00	3.12	12
1391	1	2014	2	1	651597.00	150844.00	4.32	12
1392	1	2014	2	2	821388.00	205304.00	4.00	12
1393	1	2015	1	0	64026.00	23208.00	2.76	12
1394	1	2015	1	1	429555.00	110649.00	3.88	12
1395	1	2015	1	2	493581.00	133857.00	3.69	12
1396	1	2015	2	0	158172.00	53004.00	2.98	12
1397	1	2015	2	1	639891.00	153077.00	4.18	12
1398	1	2015	2	2	798063.00	206081.00	3.87	12
1399	1	2016	1	0	44740.00	18203.00	2.46	12
1400	1	2016	1	1	324214.00	93660.00	3.46	12
1401	1	2016	1	2	368954.00	111863.00	3.30	12
1402	1	2016	2	0	152755.00	48322.00	3.16	12
1403	1	2016	2	1	678933.00	155505.00	4.37	12
1404	1	2016	2	2	831688.00	203827.00	4.08	12
1405	1	2017	1	0	62991.00	23900.00	2.64	12
1406	1	2017	1	1	442886.00	121147.00	3.66	12
1407	1	2017	1	2	505877.00	145047.00	3.49	12
1408	1	2017	2	0	154944.00	50297.00	3.08	12
1409	1	2017	2	1	658684.00	155833.00	4.23	12
1410	1	2017	2	2	813628.00	206130.00	3.95	12
1411	1	2018	1	0	63194.00	24401.00	2.59	12
1412	1	2018	1	1	454648.00	121581.00	3.74	12
1413	1	2018	1	2	517842.00	145982.00	3.55	12
1414	1	2018	2	0	157920.70	50469.00	3.13	12
1415	1	2018	2	1	667362.00	152029.25	4.39	12
1416	1	2018	2	2	825282.70	202498.25	4.08	12
1417	1	2019	1	0	46094.47	20597.00	2.24	12
1418	1	2019	1	1	411501.84	114994.11	3.58	12
1419	1	2019	1	2	457596.31	135591.11	3.37	12
1420	1	2019	2	0	132992.00	46174.66	2.88	12
1421	1	2019	2	1	596691.00	142407.00	4.19	12
1422	1	2019	2	2	729683.00	188581.66	3.87	12
1423	1	2020	1	0	55286.43	22087.00	2.50	12
1424	1	2020	1	1	427124.61	114872.98	3.72	12
1425	1	2020	1	2	482411.04	136959.98	3.52	12
1426	1	2020	2	0	149079.40	49767.98	3.00	12
1427	1	2020	2	1	632626.26	147958.84	4.28	12
1428	1	2020	2	2	781705.66	197726.82	3.95	12
1429	2	1987	1	0	32530.00	31370.00	1.04	12
1430	2	1987	1	1	10825.00	7120.00	1.52	12
1431	2	1987	1	2	43355.00	38490.00	1.13	12
1432	2	1987	2	0	31009.00	26800.00	1.16	12
1433	2	1987	2	1	11076.00	7060.00	1.57	12
1434	2	1987	2	2	42085.00	33860.00	1.24	12
1435	2	1988	1	0	10764.00	16790.00	0.64	12
1436	2	1988	1	1	10795.00	6880.00	1.57	12
1437	2	1988	1	2	21559.00	23670.00	0.91	12
1438	2	1988	2	0	39576.00	30490.00	1.30	12
1439	2	1988	2	1	12282.00	6440.00	1.91	12
1440	2	1988	2	2	51858.00	36930.00	1.40	12
1441	2	1989	1	0	45557.00	37290.00	1.22	12
1442	2	1989	1	1	16424.00	8430.00	1.95	12
1443	2	1989	1	2	61981.00	45720.00	1.36	12
1444	2	1989	2	0	40553.00	33590.00	1.21	12
1445	2	1989	2	1	11676.00	5260.00	2.22	12
1446	2	1989	2	2	52229.00	38850.00	1.34	12
1447	2	1990	1	0	25044.00	25930.00	0.97	12
1448	2	1990	1	1	10841.00	6840.00	1.58	12
1449	2	1990	1	2	35885.00	32770.00	1.10	12
1450	2	1990	2	0	26741.00	24730.00	1.08	12
1451	2	1990	2	1	8383.00	5810.00	1.44	12
1452	2	1990	2	2	35124.00	30540.00	1.15	12
1453	2	1991	1	0	43058.00	34270.00	1.26	12
1454	2	1991	1	1	12990.00	7340.00	1.77	12
1455	2	1991	1	2	56048.00	41610.00	1.35	12
1456	2	1991	2	0	27284.00	27770.00	0.98	12
1457	2	1991	2	1	10238.00	6610.00	1.55	12
1458	2	1991	2	2	37522.00	34380.00	1.09	12
1459	2	1992	1	0	17289.00	22040.00	0.78	12
1460	2	1992	1	1	11312.00	7010.00	1.61	12
1461	2	1992	1	2	28601.00	29050.00	0.98	12
1462	2	1992	2	0	21511.00	19210.00	1.12	12
1463	2	1992	2	1	10727.00	5720.00	1.88	12
1464	2	1992	2	2	32238.00	24930.00	1.29	12
1465	2	1993	1	0	42055.00	35390.00	1.19	12
1466	2	1993	1	1	15972.00	7920.00	2.02	12
1467	2	1993	1	2	58027.00	43310.00	1.34	12
1468	2	1993	2	0	48811.00	31220.00	1.56	12
1469	2	1993	2	1	16570.00	6500.00	2.55	12
1470	2	1993	2	2	65381.00	37720.00	1.73	12
1471	2	1994	1	0	51027.00	35930.00	1.42	12
1472	2	1994	1	1	22015.00	8710.00	2.53	12
1473	2	1994	1	2	73042.00	44640.00	1.64	12
1474	2	1994	2	0	46152.00	30820.00	1.50	12
1475	2	1994	2	1	21050.00	8380.00	2.51	12
1476	2	1994	2	2	67202.00	39200.00	1.71	12
1477	2	1995	1	0	49875.00	33250.00	1.50	12
1478	2	1995	1	1	22623.00	8250.00	2.74	12
1479	2	1995	1	2	72498.00	41500.00	1.75	12
1480	2	1995	2	0	53822.00	32620.00	1.65	12
1481	2	1995	2	1	26040.00	8680.00	3.00	12
1482	2	1995	2	2	79862.00	41300.00	1.93	12
1483	2	1996	1	0	55740.00	34628.00	1.61	12
1484	2	1996	1	1	26550.00	9080.00	2.92	12
1485	2	1996	1	2	82290.00	43708.00	1.88	12
1486	2	1996	2	0	43546.00	26330.00	1.65	12
1487	2	1996	2	1	32932.00	10880.00	3.03	12
1488	2	1996	2	2	76478.00	37210.00	2.06	12
1489	2	1997	1	0	53702.00	31190.00	1.72	12
1490	2	1997	1	1	32407.00	10440.00	3.10	12
1491	2	1997	1	2	86109.00	41630.00	2.07	12
1492	2	1997	2	0	41620.00	25745.00	1.62	12
1493	2	1997	2	1	34230.00	11500.00	2.98	12
1494	2	1997	2	2	75850.00	37245.00	2.04	12
1495	2	1998	1	0	6232.00	6232.00	1.00	12
1496	2	1998	1	1	17530.00	7435.00	2.36	12
1497	2	1998	1	2	23762.00	13667.00	1.74	12
1498	2	1998	2	0	17277.00	11140.00	1.55	12
1499	2	1998	2	1	19594.00	6993.00	2.80	12
1500	2	1998	2	2	36871.00	18133.00	2.03	12
1501	2	1999	1	0	42342.00	24670.00	1.72	12
1502	2	1999	1	1	32006.00	11898.00	2.69	12
1503	2	1999	1	2	74348.00	36568.00	2.03	12
1504	2	1999	2	0	37694.00	24500.00	1.54	12
1505	2	1999	2	1	27320.00	10270.00	2.66	12
1506	2	1999	2	2	65014.00	34770.00	1.87	12
1507	2	2000	1	0	44265.00	29510.00	1.50	12
1508	2	2000	1	1	29089.00	10745.00	2.71	12
1509	2	2000	1	2	73354.00	40255.00	1.82	12
1510	2	2000	2	0	36672.00	22438.00	1.63	12
1511	2	2000	2	1	32845.00	11190.00	2.94	12
1512	2	2000	2	2	69517.00	33628.00	2.07	12
1513	2	2001	1	0	43783.00	28045.00	1.56	12
1514	2	2001	1	1	35629.00	12091.00	2.95	12
1515	2	2001	1	2	79412.00	40136.00	1.98	12
1516	2	2001	2	0	31881.00	18610.00	1.71	12
1517	2	2001	2	1	37652.00	12169.00	3.09	12
1518	2	2001	2	2	69533.00	30779.00	2.26	12
1519	2	2002	1	0	46520.00	30906.00	1.51	12
1520	2	2002	1	1	33429.00	10581.00	3.16	12
1521	2	2002	1	2	79949.00	41487.00	1.93	12
1522	2	2002	2	0	31863.00	18490.00	1.72	12
1523	2	2002	2	1	32969.00	10440.00	3.16	12
1524	2	2002	2	2	64832.00	28930.00	2.24	12
1525	2	2003	1	0	8599.00	7575.00	1.14	12
1526	2	2003	1	1	35859.00	13460.00	2.66	12
1527	2	2003	1	2	44458.00	21035.00	2.11	12
1528	2	2003	2	0	33377.00	21098.00	1.58	12
1529	2	2003	2	1	38451.00	12055.00	3.19	12
1530	2	2003	2	2	71828.00	33153.00	2.17	12
1531	2	2004	1	0	22918.00	14515.00	1.58	12
1532	2	2004	1	1	41669.00	13050.00	3.19	12
1533	2	2004	1	2	64587.00	27565.00	2.34	12
1534	2	2004	2	0	43012.00	22006.00	1.95	12
1535	2	2004	2	1	42927.00	13534.00	3.17	12
1536	2	2004	2	2	85939.00	35540.00	2.42	12
1537	2	2005	1	0	20221.00	12196.00	1.66	12
1538	2	2005	1	1	37134.00	11932.00	3.11	12
1539	2	2005	1	2	57355.00	24128.00	2.38	12
1540	2	2005	2	0	35928.00	19133.00	1.88	12
1541	2	2005	2	1	39348.00	12515.00	3.14	12
1542	2	2005	2	2	75276.00	31648.00	2.38	12
1543	2	2006	1	0	39768.00	25000.00	1.59	12
1544	2	2006	1	1	42502.00	14000.00	3.04	12
1545	2	2006	1	2	82270.00	39000.00	2.11	12
1546	2	2006	2	0	38996.00	20537.00	1.90	12
1547	2	2006	2	1	41431.00	12922.00	3.21	12
1548	2	2006	2	2	80427.00	33459.00	2.40	12
1549	2	2007	1	0	25023.00	19702.00	1.27	12
1550	2	2007	1	1	36030.00	14147.00	2.55	12
1551	2	2007	1	2	61053.00	33849.00	1.80	12
1552	2	2007	2	0	50770.00	22107.00	2.30	12
1553	2	2007	2	1	51618.00	14585.00	3.54	12
1554	2	2007	2	2	102388.00	36692.00	2.79	12
1555	2	2008	1	0	54916.00	23220.00	2.37	12
1556	2	2008	1	1	53902.00	15330.00	3.52	12
1557	2	2008	1	2	108818.00	38550.00	2.82	12
1558	2	2008	2	0	52436.00	21520.00	2.44	12
1559	2	2008	2	1	57447.00	15993.00	3.59	12
1560	2	2008	2	2	109883.00	37513.00	2.93	12
1561	2	2009	1	0	51377.00	21898.00	2.35	12
1562	2	2009	1	1	49025.00	14988.00	3.27	12
1563	2	2009	1	2	100402.00	36886.00	2.72	12
1564	2	2009	2	0	45806.00	21551.00	2.13	12
1565	2	2009	2	1	49237.00	16185.00	3.04	12
1566	2	2009	2	2	95043.00	37736.00	2.52	12
1567	2	2010	1	0	41261.00	21070.00	1.96	12
1568	2	2010	1	1	47803.00	17080.00	2.80	12
1569	2	2010	1	2	89064.00	38150.00	2.33	12
1570	2	2010	2	0	43639.00	18502.00	2.36	12
1571	2	2010	2	1	58471.00	18306.00	3.19	12
1572	2	2010	2	2	102110.00	36808.00	2.77	12
1573	2	2011	1	0	46519.00	21325.00	2.18	12
1574	2	2011	1	1	54035.00	17625.00	3.07	12
1575	2	2011	1	2	100554.00	38950.00	2.58	12
1576	2	2011	2	0	55323.00	19688.00	2.81	12
1577	2	2011	2	1	75692.00	19203.00	3.94	12
1578	2	2011	2	2	131015.00	38891.00	3.37	12
1579	2	2012	1	0	50512.00	20826.00	2.43	12
1580	2	2012	1	1	57233.00	18183.00	3.15	12
1581	2	2012	1	2	107745.00	39009.00	2.76	12
1582	2	2012	2	0	53269.00	19233.00	2.77	12
1583	2	2012	2	1	76822.00	18984.00	4.05	12
1584	2	2012	2	2	130091.00	38217.00	3.40	12
1585	2	2013	1	0	56268.00	21273.00	2.65	12
1586	2	2013	1	1	65460.00	18448.00	3.55	12
1587	2	2013	1	2	121728.00	39721.00	3.06	12
1588	2	2013	2	0	54276.00	18892.00	2.87	12
1589	2	2013	2	1	80401.00	19144.00	4.20	12
1590	2	2013	2	2	134677.00	38036.00	3.54	12
1591	2	2014	1	0	54696.00	20729.00	2.64	12
1592	2	2014	1	1	63346.00	18525.00	3.42	12
1593	2	2014	1	2	118042.00	39254.00	3.01	12
1594	2	2014	2	0	55274.00	18673.00	2.96	12
1595	2	2014	2	1	81737.00	19203.00	4.26	12
1596	2	2014	2	2	137011.00	37876.00	3.62	12
1597	2	2015	1	0	50862.00	20251.00	2.51	12
1598	2	2015	1	1	61624.00	18382.00	3.35	12
1599	2	2015	1	2	112486.00	38633.00	2.91	12
1600	2	2015	2	0	56353.00	17804.00	3.17	12
1601	2	2015	2	1	83977.00	18823.00	4.46	12
1602	2	2015	2	2	140330.00	36627.00	3.83	12
1603	2	2016	1	0	25027.00	13890.00	1.80	12
1604	2	2016	1	1	50586.00	18277.00	2.77	12
1605	2	2016	1	2	75613.00	32167.00	2.35	12
1606	2	2016	2	0	31500.00	10087.00	3.12	12
1607	2	2016	2	1	53890.00	13152.00	4.10	12
1608	2	2016	2	2	85390.00	23239.00	3.67	12
1609	2	2017	1	0	47402.00	17121.00	2.77	12
1610	2	2017	1	1	66079.00	19706.00	3.35	12
1611	2	2017	1	2	113481.00	36827.00	3.08	12
1612	2	2017	2	0	48023.00	16855.00	2.85	12
1613	2	2017	2	1	77224.00	18907.00	4.08	12
1614	2	2017	2	2	125247.00	35762.00	3.50	12
1615	2	2018	1	0	45063.00	15334.00	2.94	12
1616	2	2018	1	1	78545.00	22287.00	3.52	12
1617	2	2018	1	2	123608.00	37621.00	3.29	12
1618	2	2018	2	0	41015.00	15437.00	2.66	12
1619	2	2018	2	1	60925.00	17059.00	3.57	12
1620	2	2018	2	2	101940.00	32496.00	3.14	12
1621	2	2019	1	0	29315.00	14911.00	1.97	12
1622	2	2019	1	1	61381.00	21718.00	2.83	12
1623	2	2019	1	2	90696.00	36629.00	2.48	12
1624	2	2019	2	0	25953.00	10063.00	2.58	12
1625	2	2019	2	1	36756.00	10708.00	3.43	12
1626	2	2019	2	2	62709.00	20771.00	3.02	12
1627	2	2020	1	0	19835.08	10639.00	1.86	12
1628	2	2020	1	1	56370.70	19949.00	2.83	12
1629	2	2020	1	2	76205.78	30588.00	2.49	12
1630	2	2020	2	0	46926.00	16127.00	2.91	12
1631	2	2020	2	1	65701.00	18294.00	3.59	12
1632	2	2020	2	2	112627.00	34421.00	3.27	12
1633	2	1987	1	0	18505.00	8060.00	2.30	13
1634	2	1987	1	1	38280.00	10970.00	3.49	13
1635	2	1987	1	2	56785.00	19030.00	2.98	13
1636	2	1987	2	0	15905.00	11060.00	1.44	13
1637	2	1987	2	1	102581.00	23870.00	4.30	13
1638	2	1987	2	2	118486.00	34930.00	3.39	13
1639	2	1988	1	0	5600.00	3340.00	1.68	13
1640	2	1988	1	1	66574.00	18720.00	3.56	13
1641	2	1988	1	2	72174.00	22060.00	3.27	13
1642	2	1988	2	0	19239.00	10190.00	1.89	13
1643	2	1988	2	1	93854.00	20580.00	4.56	13
1644	2	1988	2	2	113093.00	30770.00	3.68	13
1645	2	1989	1	0	20606.00	9110.00	2.26	13
1646	2	1989	1	1	81590.00	20420.00	4.00	13
1647	2	1989	1	2	102196.00	29530.00	3.46	13
1648	2	1989	2	0	19743.00	11950.00	1.65	13
1649	2	1989	2	1	142608.00	34970.00	4.08	13
1650	2	1989	2	2	162351.00	46920.00	3.46	13
1651	2	1990	1	0	4544.00	2780.00	1.63	13
1652	2	1990	1	1	69649.00	21340.00	3.26	13
1653	2	1990	1	2	74193.00	24120.00	3.08	13
1654	2	1990	2	0	20706.00	10570.00	1.96	13
1655	2	1990	2	1	156733.00	36800.00	4.26	13
1656	2	1990	2	2	177439.00	47370.00	3.75	13
1657	2	1991	1	0	2962.00	2290.00	1.29	13
1658	2	1991	1	1	76547.00	23850.00	3.21	13
1659	2	1991	1	2	79509.00	26140.00	3.04	13
1660	2	1991	2	0	37952.00	24140.00	1.57	13
1661	2	1991	2	1	146574.00	36020.00	4.07	13
1662	2	1991	2	2	184526.00	60160.00	3.07	13
1663	2	1992	1	0	1913.00	2000.00	0.96	13
1664	2	1992	1	1	52652.00	23980.00	2.20	13
1665	2	1992	1	2	54565.00	25980.00	2.10	13
1666	2	1992	2	0	21017.00	13410.00	1.57	13
1667	2	1992	2	1	153339.00	38120.00	4.02	13
1668	2	1992	2	2	174356.00	51530.00	3.38	13
1669	2	1993	1	0	2544.00	1560.00	1.63	13
1670	2	1993	1	1	86710.00	25060.00	3.46	13
1671	2	1993	1	2	89254.00	26620.00	3.35	13
1672	2	1993	2	0	19180.00	13250.00	1.45	13
1673	2	1993	2	1	169135.00	40260.00	4.20	13
1674	2	1993	2	2	188315.00	53510.00	3.52	13
1675	2	1994	1	0	10612.00	3110.00	3.41	13
1676	2	1994	1	1	96459.00	26460.00	3.65	13
1677	2	1994	1	2	107071.00	29570.00	3.62	13
1678	2	1994	2	0	13009.00	8180.00	1.59	13
1679	2	1994	2	1	174664.00	41390.00	4.22	13
1680	2	1994	2	2	187673.00	49570.00	3.79	13
1681	2	1995	1	0	1567.00	500.00	3.13	13
1682	2	1995	1	1	137264.00	33811.00	4.06	13
1683	2	1995	1	2	138831.00	34311.00	4.05	13
1684	2	1995	2	0	8451.00	5026.00	1.68	13
1685	2	1995	2	1	131710.00	32795.00	4.02	13
1686	2	1995	2	2	140161.00	37821.00	3.71	13
1687	2	1996	1	0	1998.00	714.00	2.80	13
1688	2	1996	1	1	130692.00	33124.00	3.95	13
1689	2	1996	1	2	132690.00	33838.00	3.92	13
1690	2	1996	2	0	7706.00	4404.00	1.75	13
1691	2	1996	2	1	89362.00	29342.00	3.05	13
1692	2	1996	2	2	97068.00	33746.00	2.88	13
1693	2	1997	1	0	1766.00	746.00	2.37	13
1694	2	1997	1	1	100737.00	28710.00	3.51	13
1695	2	1997	1	2	102503.00	29456.00	3.48	13
1696	2	1997	2	0	4615.00	2919.00	1.58	13
1697	2	1997	2	1	91855.00	26499.00	3.47	13
1698	2	1997	2	2	96470.00	29418.00	3.28	13
1699	2	1998	1	0	787.00	382.00	2.06	13
1700	2	1998	1	1	104250.00	27655.00	3.77	13
1701	2	1998	1	2	105037.00	28037.00	3.75	13
1702	2	1998	2	0	4571.00	2287.00	2.00	13
1703	2	1998	2	1	101558.00	29425.00	3.45	13
1704	2	1998	2	2	106129.00	31712.00	3.35	13
1705	2	1999	1	0	1723.00	699.00	2.46	13
1706	2	1999	1	1	126336.00	33016.00	3.83	13
1707	2	1999	1	2	128059.00	33715.00	3.80	13
1708	2	1999	2	0	4371.00	2549.00	1.71	13
1709	2	1999	2	1	122141.00	32600.00	3.75	13
1710	2	1999	2	2	126512.00	35149.00	3.60	13
1711	2	2000	1	0	857.00	393.00	2.18	13
1712	2	2000	1	1	131485.00	35955.00	3.66	13
1713	2	2000	1	2	132342.00	36348.00	3.64	13
1714	2	2000	2	0	3067.00	1728.00	1.77	13
1715	2	2000	2	1	120411.00	32434.00	3.71	13
1716	2	2000	2	2	123478.00	34162.00	3.61	13
1717	2	2001	1	0	1214.00	472.00	2.57	13
1718	2	2001	1	1	131222.00	35163.00	3.73	13
1719	2	2001	1	2	132436.00	35635.00	3.72	13
1720	2	2001	2	0	3376.00	2121.00	1.59	13
1721	2	2001	2	1	104878.00	29533.00	3.55	13
1722	2	2001	2	2	108254.00	31654.00	3.42	13
1723	2	2002	1	0	1695.00	707.00	2.40	13
1724	2	2002	1	1	118056.00	33213.00	3.55	13
1725	2	2002	1	2	119751.00	33920.00	3.53	13
1726	2	2002	2	0	4045.00	1750.00	2.31	13
1727	2	2002	2	1	129187.00	30727.00	4.20	13
1728	2	2002	2	2	133232.00	32477.00	4.10	13
1729	2	2003	1	0	536.00	234.00	2.29	13
1730	2	2003	1	1	107511.00	29151.00	3.69	13
1731	2	2003	1	2	108047.00	29385.00	3.68	13
1732	2	2003	2	0	3889.00	1737.00	2.24	13
1733	2	2003	2	1	116021.00	30570.00	3.80	13
1734	2	2003	2	2	119910.00	32307.00	3.71	13
1735	2	2004	1	0	740.00	360.00	2.06	13
1736	2	2004	1	1	99606.00	27441.00	3.63	13
1737	2	2004	1	2	100346.00	27801.00	3.61	13
1738	2	2004	2	0	3552.00	1963.00	1.81	13
1739	2	2004	2	1	112944.00	30575.00	3.69	13
1740	2	2004	2	2	116496.00	32538.00	3.58	13
1741	2	2005	1	0	313.00	158.00	1.98	13
1742	2	2005	1	1	97340.00	27211.00	3.58	13
1743	2	2005	1	2	97653.00	27369.00	3.57	13
1744	2	2005	2	0	4650.00	1990.00	2.34	13
1745	2	2005	2	1	126568.00	31944.00	3.96	13
1746	2	2005	2	2	131218.00	33934.00	3.87	13
1747	2	2006	1	0	1629.00	748.00	2.18	13
1748	2	2006	1	1	102761.00	27651.00	3.72	13
1749	2	2006	1	2	104390.00	28399.00	3.68	13
1750	2	2006	2	0	5459.00	2127.00	2.57	13
1751	2	2006	2	1	129680.00	32170.00	4.03	13
1752	2	2006	2	2	135139.00	34297.00	3.94	13
1753	2	2007	1	0	1565.00	755.00	2.07	13
1754	2	2007	1	1	106266.00	28600.00	3.72	13
1755	2	2007	1	2	107831.00	29355.00	3.67	13
1756	2	2007	2	0	11803.00	3476.00	3.40	13
1757	2	2007	2	1	146964.00	34567.00	4.25	13
1758	2	2007	2	2	158767.00	38043.00	4.17	13
1759	2	2008	1	0	7141.00	2060.00	3.47	13
1760	2	2008	1	1	137374.00	35544.00	3.86	13
1761	2	2008	1	2	144515.00	37604.00	3.84	13
1762	2	2008	2	0	10756.00	3373.00	3.19	13
1763	2	2008	2	1	142025.00	31957.00	4.44	13
1764	2	2008	2	2	152781.00	35330.00	4.32	13
1765	2	2009	1	0	8773.00	2675.00	3.28	13
1766	2	2009	1	1	142761.00	35952.00	3.97	13
1767	2	2009	1	2	151534.00	38627.00	3.92	13
1768	2	2009	2	0	14533.00	4408.00	3.30	13
1769	2	2009	2	1	164474.00	38673.00	4.25	13
1770	2	2009	2	2	179007.00	43081.00	4.16	13
1771	2	2010	1	0	8015.00	2553.00	3.14	13
1772	2	2010	1	1	122850.00	31384.00	3.91	13
1773	2	2010	1	2	130865.00	33937.00	3.86	13
1774	2	2010	2	0	16903.00	5346.00	3.16	13
1775	2	2010	2	1	188744.00	41278.00	4.57	13
1776	2	2010	2	2	205647.00	46624.00	4.41	13
1777	2	2011	1	0	11971.00	4069.00	2.94	13
1778	2	2011	1	1	141668.00	35974.00	3.94	13
1779	2	2011	1	2	153639.00	40043.00	3.84	13
1780	2	2011	2	0	19497.00	6490.00	3.00	13
1781	2	2011	2	1	180351.00	40902.00	4.41	13
1782	2	2011	2	2	199848.00	47392.00	4.22	13
1783	2	2012	1	0	11741.00	3487.00	3.37	13
1784	2	2012	1	1	149197.00	37159.00	4.02	13
1785	2	2012	1	2	160938.00	40646.00	3.96	13
1786	2	2012	2	0	21039.00	6597.00	3.19	13
1787	2	2012	2	1	191244.00	41732.00	4.58	13
1788	2	2012	2	2	212283.00	48329.00	4.39	13
1789	2	2013	1	0	13247.00	4023.00	3.29	13
1790	2	2013	1	1	149302.00	37952.00	3.93	13
1791	2	2013	1	2	162549.00	41975.00	3.87	13
1792	2	2013	2	0	22754.00	6556.00	3.47	13
1793	2	2013	2	1	215188.00	44043.00	4.89	13
1794	2	2013	2	2	237942.00	50599.00	4.70	13
1795	2	2014	1	0	14350.00	4418.00	3.25	13
1796	2	2014	1	1	178668.00	39891.00	4.48	13
1797	2	2014	1	2	193018.00	44309.00	4.36	13
1798	2	2014	2	0	25474.00	7200.00	3.54	13
1799	2	2014	2	1	208149.00	42666.00	4.88	13
1800	2	2014	2	2	233623.00	49866.00	4.69	13
1801	2	2015	1	0	14172.00	4430.00	3.20	13
1802	2	2015	1	1	168468.00	38968.00	4.32	13
1803	2	2015	1	2	182640.00	43398.00	4.21	13
1804	2	2015	2	0	26049.00	7502.00	3.47	13
1805	2	2015	2	1	227886.00	45761.00	4.98	13
1806	2	2015	2	2	253935.00	53263.00	4.77	13
1807	2	2016	1	0	6084.00	2165.00	2.81	13
1808	2	2016	1	1	147644.00	35430.00	4.17	13
1809	2	2016	1	2	153728.00	37595.00	4.09	13
1810	2	2016	2	0	29647.00	8030.00	3.69	13
1811	2	2016	2	1	241741.00	48403.00	4.99	13
1812	2	2016	2	2	271388.00	56433.00	4.81	13
1813	2	2017	1	0	15557.00	4910.00	3.17	13
1814	2	2017	1	1	180065.00	39554.00	4.55	13
1815	2	2017	1	2	195622.00	44464.00	4.40	13
1816	2	2017	2	0	30939.00	8275.00	3.74	13
1817	2	2017	2	1	230541.00	45363.00	5.08	13
1818	2	2017	2	2	261480.00	53638.00	4.87	13
1819	2	2018	1	0	15444.00	4970.00	3.11	13
1820	2	2018	1	1	178938.00	39368.00	4.55	13
1821	2	2018	1	2	194382.00	44338.00	4.38	13
1822	2	2018	2	0	33822.83	8495.00	3.98	13
1823	2	2018	2	1	241968.85	45666.00	5.30	13
1824	2	2018	2	2	275791.68	54161.00	5.09	13
1825	2	2019	1	0	15409.85	4920.00	3.13	13
1826	2	2019	1	1	176569.00	39327.00	4.49	13
1827	2	2019	1	2	191978.85	44247.00	4.34	13
1828	2	2019	2	0	34812.20	8603.50	4.05	13
1829	2	2019	2	1	242677.00	45674.00	5.31	13
1830	2	2019	2	2	277489.20	54277.50	5.11	13
1831	2	2020	1	0	16295.12	4922.00	3.31	13
1832	2	2020	1	1	173260.89	38906.00	4.45	13
1833	2	2020	1	2	189556.01	43828.00	4.32	13
1834	2	2020	2	0	41946.52	9898.00	4.24	13
1835	2	2020	2	1	253195.00	47079.00	5.38	13
1836	2	2020	2	2	295141.52	56977.00	5.18	13
1837	1	1987	1	0	1905.00	880.00	2.16	14
1838	1	1987	1	1	63155.00	24170.00	2.61	14
1839	1	1987	1	2	65060.00	25050.00	2.60	14
1840	1	1987	2	0	15734.00	12210.00	1.29	14
1841	1	1987	2	1	81672.00	30480.00	2.68	14
1842	1	1987	2	2	97406.00	42690.00	2.28	14
1843	1	1988	1	0	4399.00	2380.00	1.85	14
1844	1	1988	1	1	82615.00	29390.00	2.81	14
1845	1	1988	1	2	87014.00	31770.00	2.74	14
1846	1	1988	2	0	24861.00	14220.00	1.75	14
1847	1	1988	2	1	74568.00	27810.00	2.68	14
1848	1	1988	2	2	99429.00	42030.00	2.37	14
1849	1	1989	1	0	2725.00	1610.00	1.69	14
1850	1	1989	1	1	65223.00	23020.00	2.83	14
1851	1	1989	1	2	67948.00	24630.00	2.76	14
1852	1	1989	2	0	17720.00	11580.00	1.53	14
1853	1	1989	2	1	77581.00	28390.00	2.73	14
1854	1	1989	2	2	95301.00	39970.00	2.38	14
1855	1	1990	1	0	2500.00	1200.00	2.08	14
1856	1	1990	1	1	54372.00	20960.00	2.59	14
1857	1	1990	1	2	56872.00	22160.00	2.57	14
1858	1	1990	2	0	15489.00	11010.00	1.41	14
1859	1	1990	2	1	93224.00	31400.00	2.97	14
1860	1	1990	2	2	108713.00	42410.00	2.56	14
1861	1	1991	1	0	824.00	480.00	1.72	14
1862	1	1991	1	1	59442.00	22000.00	2.70	14
1863	1	1991	1	2	60266.00	22480.00	2.68	14
1864	1	1991	2	0	12733.00	9140.00	1.39	14
1865	1	1991	2	1	79560.00	27710.00	2.87	14
1866	1	1991	2	2	92293.00	36850.00	2.50	14
1867	1	1992	1	0	165.00	130.00	1.27	14
1868	1	1992	1	1	61396.00	21330.00	2.88	14
1869	1	1992	1	2	61561.00	21460.00	2.87	14
1870	1	1992	2	0	11142.00	8480.00	1.31	14
1871	1	1992	2	1	83769.00	30050.00	2.79	14
1872	1	1992	2	2	94911.00	38530.00	2.46	14
1873	1	1993	1	0	392.00	230.00	1.70	14
1874	1	1993	1	1	61225.00	21020.00	2.91	14
1875	1	1993	1	2	61617.00	21250.00	2.90	14
1876	1	1993	2	0	11237.00	8200.00	1.37	14
1877	1	1993	2	1	94107.00	30130.00	3.12	14
1878	1	1993	2	2	105344.00	38330.00	2.75	14
1879	1	1994	1	0	1571.00	640.00	2.45	14
1880	1	1994	1	1	82202.00	27500.00	2.99	14
1881	1	1994	1	2	83773.00	28140.00	2.98	14
1882	1	1994	2	0	14384.00	10220.00	1.41	14
1883	1	1994	2	1	93051.00	29870.00	3.12	14
1884	1	1994	2	2	107435.00	40090.00	2.68	14
1885	1	1995	1	0	1132.00	580.00	1.95	14
1886	1	1995	1	1	75912.00	29560.00	2.57	14
1887	1	1995	1	2	77044.00	30140.00	2.56	14
1888	1	1995	2	0	13187.00	8272.00	1.59	14
1889	1	1995	2	1	102990.00	37975.00	2.71	14
1890	1	1995	2	2	116177.00	46247.00	2.51	14
1891	1	1996	1	0	827.00	457.00	1.81	14
1892	1	1996	1	1	90906.00	29126.00	3.12	14
1893	1	1996	1	2	91733.00	29583.00	3.10	14
1894	1	1996	2	0	13058.00	7340.00	1.78	14
1895	1	1996	2	1	104689.00	38686.00	2.71	14
1896	1	1996	2	2	117747.00	46026.00	2.56	14
1897	1	1997	1	0	941.00	392.00	2.40	14
1898	1	1997	1	1	96792.00	30792.00	3.14	14
1899	1	1997	1	2	97733.00	31184.00	3.13	14
1900	1	1997	2	0	13040.00	7286.00	1.79	14
1901	1	1997	2	1	107750.00	38799.00	2.78	14
1902	1	1997	2	2	120790.00	46085.00	2.62	14
1903	1	1998	1	0	63.00	28.00	2.25	14
1904	1	1998	1	1	69656.00	25558.00	2.73	14
1905	1	1998	1	2	69719.00	25586.00	2.72	14
1906	1	1998	2	0	11642.00	7233.00	1.61	14
1907	1	1998	2	1	88607.00	38210.00	2.32	14
1908	1	1998	2	2	100249.00	45443.00	2.21	14
1909	1	1999	1	0	325.00	132.00	2.46	14
1910	1	1999	1	1	95639.00	28949.00	3.30	14
1911	1	1999	1	2	95964.00	29081.00	3.30	14
1912	1	1999	2	0	15349.00	7086.00	2.17	14
1913	1	1999	2	1	110057.00	38396.00	2.87	14
1914	1	1999	2	2	125406.00	45482.00	2.76	14
1915	1	2000	1	0	2911.00	1181.00	2.46	14
1916	1	2000	1	1	102529.00	29421.00	3.48	14
1917	1	2000	1	2	105440.00	30602.00	3.45	14
1918	1	2000	2	0	28590.00	13476.00	2.12	14
1919	1	2000	2	1	121790.00	41006.00	2.97	14
1920	1	2000	2	2	150380.00	54482.00	2.76	14
1921	1	2001	1	0	3506.00	1248.00	2.81	14
1922	1	2001	1	1	132950.00	36623.00	3.63	14
1923	1	2001	1	2	136456.00	37871.00	3.60	14
1924	1	2001	2	0	25606.00	12200.00	2.10	14
1925	1	2001	2	1	152233.00	47946.00	3.18	14
1926	1	2001	2	2	177839.00	60146.00	2.96	14
1927	1	2002	1	0	2942.00	1121.00	2.62	14
1928	1	2002	1	1	123514.00	35874.00	3.44	14
1929	1	2002	1	2	126456.00	36995.00	3.42	14
1930	1	2002	2	0	25088.00	11957.00	2.10	14
1931	1	2002	2	1	152811.00	47279.00	3.23	14
1932	1	2002	2	2	177899.00	59236.00	3.00	14
1933	1	2003	1	0	3805.00	1343.00	2.83	14
1934	1	2003	1	1	122278.00	35911.00	3.41	14
1935	1	2003	1	2	126083.00	37254.00	3.38	14
1936	1	2003	2	0	24836.00	10953.00	2.27	14
1937	1	2003	2	1	149857.00	46224.00	3.24	14
1938	1	2003	2	2	174693.00	57177.00	3.06	14
1939	1	2004	1	0	4598.00	1510.00	3.05	14
1940	1	2004	1	1	151733.00	37791.00	4.02	14
1941	1	2004	1	2	156331.00	39301.00	3.98	14
1942	1	2004	2	0	29087.00	11434.00	2.54	14
1943	1	2004	2	1	170459.00	49436.00	3.45	14
1944	1	2004	2	2	199546.00	60870.00	3.28	14
1945	1	2005	1	0	5160.00	1657.00	3.11	14
1946	1	2005	1	1	150215.00	37944.00	3.96	14
1947	1	2005	1	2	155375.00	39601.00	3.92	14
1948	1	2005	2	0	28876.00	11259.00	2.56	14
1949	1	2005	2	1	170178.00	48515.00	3.51	14
1950	1	2005	2	2	199054.00	59774.00	3.33	14
1951	1	2006	1	0	6054.00	1900.00	3.19	14
1952	1	2006	1	1	171790.00	39966.00	4.30	14
1953	1	2006	1	2	177844.00	41866.00	4.25	14
1954	1	2006	2	0	30196.00	11345.00	2.66	14
1955	1	2006	2	1	189300.00	50810.00	3.73	14
1956	1	2006	2	2	219496.00	62155.00	3.53	14
1957	1	2007	1	0	5941.00	1903.00	3.12	14
1958	1	2007	1	1	178296.00	40952.00	4.35	14
1959	1	2007	1	2	184237.00	42855.00	4.30	14
1960	1	2007	2	0	67122.00	25415.00	2.64	14
1961	1	2007	2	1	184952.00	49865.00	3.71	14
1962	1	2007	2	2	252074.00	75280.00	3.35	14
1963	1	2008	1	0	5867.00	1924.00	3.05	14
1964	1	2008	1	1	185041.00	42375.00	4.37	14
1965	1	2008	1	2	190908.00	44299.00	4.31	14
1966	1	2008	2	0	67007.00	24881.00	2.69	14
1967	1	2008	2	1	187241.00	50636.00	3.70	14
1968	1	2008	2	2	254248.00	75517.00	3.37	14
1969	1	2009	1	0	5683.00	1803.00	3.15	14
1970	1	2009	1	1	185110.00	42203.00	4.39	14
1971	1	2009	1	2	190793.00	44006.00	4.34	14
1972	1	2009	2	0	63132.00	24300.00	2.60	14
1973	1	2009	2	1	177731.00	51062.00	3.48	14
1974	1	2009	2	2	240863.00	75362.00	3.20	14
1975	1	2010	1	0	4858.00	1721.00	2.82	14
1976	1	2010	1	1	154578.00	40595.00	3.81	14
1977	1	2010	1	2	159436.00	42316.00	3.77	14
1978	1	2010	2	0	60214.00	24071.00	2.50	14
1979	1	2010	2	1	180765.00	50670.00	3.57	14
1980	1	2010	2	2	240979.00	74741.00	3.22	14
1981	1	2011	1	0	5369.00	1701.00	3.16	14
1982	1	2011	1	1	179715.00	42506.00	4.23	14
1983	1	2011	1	2	185084.00	44207.00	4.19	14
1984	1	2011	2	0	58923.00	24035.00	2.45	14
1985	1	2011	2	1	184942.00	50537.00	3.66	14
1986	1	2011	2	2	243865.00	74572.00	3.27	14
1987	1	2012	1	0	5568.00	1701.00	3.27	14
1988	1	2012	1	1	181605.00	41765.00	4.35	14
1989	1	2012	1	2	187173.00	43466.00	4.31	14
1990	1	2012	2	0	61935.00	24331.00	2.55	14
1991	1	2012	2	1	204353.00	52303.00	3.91	14
1992	1	2012	2	2	266288.00	76634.00	3.47	14
1993	1	2013	1	0	5693.00	1701.00	3.35	14
1994	1	2013	1	1	187394.00	42866.00	4.37	14
1995	1	2013	1	2	193087.00	44567.00	4.33	14
1996	1	2013	2	0	59806.00	23866.00	2.51	14
1997	1	2013	2	1	207277.00	51486.00	4.03	14
1998	1	2013	2	2	267083.00	75352.00	3.54	14
1999	1	2014	1	0	5916.00	1654.00	3.58	14
2000	1	2014	1	1	192111.00	42897.00	4.48	14
2001	1	2014	1	2	198027.00	44551.00	4.44	14
2002	1	2014	2	0	56961.00	23521.00	2.42	14
2003	1	2014	2	1	197621.00	50404.40	3.92	14
2004	1	2014	2	2	254582.00	73925.40	3.44	14
2005	1	2015	1	0	6196.00	1705.00	3.63	14
2006	1	2015	1	1	191938.00	42900.00	4.47	14
2007	1	2015	1	2	198134.00	44605.00	4.44	14
2008	1	2015	2	0	48868.00	23256.00	2.10	14
2009	1	2015	2	1	153909.00	43621.00	3.53	14
2010	1	2015	2	2	202777.00	66877.00	3.03	14
2011	1	2016	1	0	5746.00	1670.00	3.44	14
2012	1	2016	1	1	185551.00	42487.00	4.37	14
2013	1	2016	1	2	191297.00	44157.00	4.33	14
2014	1	2016	2	0	42608.00	20964.00	2.03	14
2015	1	2016	2	1	148943.00	45519.00	3.27	14
2016	1	2016	2	2	191551.00	66483.00	2.88	14
2017	1	2017	1	0	5396.00	1327.00	4.07	14
2018	1	2017	1	1	206543.00	44573.00	4.63	14
2019	1	2017	1	2	211939.00	45900.00	4.62	14
2020	1	2017	2	0	50052.00	22023.00	2.27	14
2021	1	2017	2	1	183015.00	47632.00	3.84	14
2022	1	2017	2	2	233067.00	69655.00	3.35	14
2023	1	2018	1	0	4286.00	1130.00	3.79	14
2024	1	2018	1	1	199254.00	44337.00	4.49	14
2025	1	2018	1	2	203540.00	45467.00	4.48	14
2026	1	2018	2	0	37533.62	19837.00	1.89	14
2027	1	2018	2	1	150030.98	46083.00	3.26	14
2028	1	2018	2	2	187564.60	65920.00	2.85	14
2029	1	2019	1	0	1846.00	1082.00	1.71	14
2030	1	2019	1	1	185766.14	44342.00	4.19	14
2031	1	2019	1	2	187612.14	45424.00	4.13	14
2032	1	2019	2	0	53102.22	19369.00	2.74	14
2033	1	2019	2	1	177606.22	45970.00	3.86	14
2034	1	2019	2	2	230708.44	65339.00	3.53	14
2035	1	2020	1	0	4992.22	1130.00	4.42	14
2036	1	2020	1	1	138670.15	33203.54	4.18	14
2037	1	2020	1	2	143662.37	34333.54	4.18	14
2038	1	2020	2	0	55036.71	20499.80	2.68	14
2039	1	2020	2	1	177774.40	47728.85	3.72	14
2040	1	2020	2	2	232811.11	68228.65	3.41	14
2041	2	1987	1	0	160.00	60.00	2.67	14
2042	2	1987	1	1	107050.00	29320.00	3.65	14
2043	2	1987	1	2	107210.00	29380.00	3.65	14
2044	2	1987	2	0	100643.00	31180.00	3.23	14
2045	2	1987	2	1	100254.00	27490.00	3.65	14
2046	2	1987	2	2	200897.00	58670.00	3.42	14
2047	2	1988	1	0	40.00	20.00	2.00	14
2048	2	1988	1	1	93646.00	25900.00	3.62	14
2049	2	1988	1	2	93686.00	25920.00	3.61	14
2050	2	1988	2	0	93086.00	29740.00	3.13	14
2051	2	1988	2	1	96481.00	27510.00	3.51	14
2052	2	1988	2	2	189567.00	57250.00	3.31	14
2053	2	1989	1	0	\N	\N	\N	14
2054	2	1989	1	1	105035.00	27720.00	3.79	14
2055	2	1989	1	2	105035.00	27720.00	3.79	14
2056	2	1989	2	0	92775.00	25740.00	3.60	14
2057	2	1989	2	1	144673.00	31170.00	4.64	14
2058	2	1989	2	2	237448.00	56910.00	4.17	14
2059	2	1990	1	0	\N	\N	\N	14
2060	2	1990	1	1	73753.00	20610.00	3.58	14
2061	2	1990	1	2	73753.00	20610.00	3.58	14
2062	2	1990	2	0	101446.00	26720.00	3.80	14
2063	2	1990	2	1	150736.00	31780.00	4.74	14
2064	2	1990	2	2	252182.00	58500.00	4.31	14
2065	2	1991	1	0	\N	\N	\N	14
2066	2	1991	1	1	120963.00	30460.00	3.97	14
2067	2	1991	1	2	120963.00	30460.00	3.97	14
2068	2	1991	2	0	86837.00	26940.00	3.22	14
2069	2	1991	2	1	103383.00	26410.00	3.91	14
2070	2	1991	2	2	190220.00	53350.00	3.57	14
2071	2	1992	1	0	\N	\N	\N	14
2072	2	1992	1	1	114828.00	31710.00	3.62	14
2073	2	1992	1	2	114828.00	31710.00	3.62	14
2074	2	1992	2	0	74654.00	22550.00	3.31	14
2075	2	1992	2	1	114581.00	29280.00	3.91	14
2076	2	1992	2	2	189235.00	51830.00	3.65	14
2077	2	1993	1	0	\N	\N	\N	14
2078	2	1993	1	1	103400.00	28000.00	3.69	14
2079	2	1993	1	2	103400.00	28000.00	3.69	14
2080	2	1993	2	0	63167.00	22790.00	2.77	14
2081	2	1993	2	1	84047.00	25380.00	3.31	14
2082	2	1993	2	2	147214.00	48170.00	3.06	14
2083	2	1994	1	0	336.00	150.00	2.24	14
2084	2	1994	1	1	104163.00	28400.00	3.67	14
2085	2	1994	1	2	104499.00	28550.00	3.66	14
2086	2	1994	2	0	62993.00	21780.00	2.89	14
2087	2	1994	2	1	100713.00	27260.00	3.69	14
2088	2	1994	2	2	163706.00	49040.00	3.34	14
2089	2	1995	1	0	\N	\N	\N	14
2090	2	1995	1	1	85940.00	24740.00	3.47	14
2091	2	1995	1	2	85940.00	24740.00	3.47	14
2092	2	1995	2	0	63125.00	24615.00	2.56	14
2093	2	1995	2	1	78657.00	27510.00	2.86	14
2094	2	1995	2	2	141782.00	52125.00	2.72	14
2095	2	1996	1	0	750.00	350.00	2.14	14
2096	2	1996	1	1	100145.00	27717.00	3.61	14
2097	2	1996	1	2	100895.00	28067.00	3.59	14
2098	2	1996	2	0	56886.00	22638.00	2.51	14
2099	2	1996	2	1	93514.00	27961.00	3.34	14
2100	2	1996	2	2	150400.00	50599.00	2.97	14
2101	2	1997	1	0	941.00	400.00	2.35	14
2102	2	1997	1	1	97259.00	25341.00	3.84	14
2103	2	1997	1	2	98200.00	25741.00	3.81	14
2104	2	1997	2	0	69706.00	22400.00	3.11	14
2105	2	1997	2	1	110498.00	28176.00	3.92	14
2106	2	1997	2	2	180204.00	50576.00	3.56	14
2107	2	1998	1	0	110.00	50.00	2.20	14
2108	2	1998	1	1	12669.00	4207.00	3.01	14
2109	2	1998	1	2	12779.00	4257.00	3.00	14
2110	2	1998	2	0	53493.00	20203.00	2.65	14
2111	2	1998	2	1	53002.00	16397.00	3.23	14
2112	2	1998	2	2	106495.00	36600.00	2.91	14
2113	2	1999	1	0	2437.00	700.00	3.48	14
2114	2	1999	1	1	117482.00	30389.00	3.87	14
2115	2	1999	1	2	119919.00	31089.00	3.86	14
2116	2	1999	2	0	57385.00	20630.00	2.78	14
2117	2	1999	2	1	82490.00	26111.00	3.16	14
2118	2	1999	2	2	139875.00	46741.00	2.99	14
2119	2	2000	1	0	150.00	50.00	3.00	14
2120	2	2000	1	1	102790.00	27050.00	3.80	14
2121	2	2000	1	2	102940.00	27100.00	3.80	14
2122	2	2000	2	0	53279.00	19150.00	2.78	14
2123	2	2000	2	1	83082.00	26710.00	3.11	14
2124	2	2000	2	2	136361.00	45860.00	2.97	14
2125	2	2001	1	0	2768.00	750.00	3.69	14
2126	2	2001	1	1	106506.00	26270.00	4.05	14
2127	2	2001	1	2	109274.00	27020.00	4.04	14
2128	2	2001	2	0	72079.00	20304.00	3.55	14
2129	2	2001	2	1	98745.00	26410.00	3.74	14
2130	2	2001	2	2	170824.00	46714.00	3.66	14
2131	2	2002	1	0	1662.00	475.00	3.50	14
2132	2	2002	1	1	116984.00	27850.00	4.20	14
2133	2	2002	1	2	118646.00	28325.00	4.19	14
2134	2	2002	2	0	78982.00	20200.00	3.91	14
2135	2	2002	2	1	111313.00	26275.00	4.24	14
2136	2	2002	2	2	190295.00	46475.00	4.09	14
2137	2	2003	1	0	\N	\N	\N	14
2138	2	2003	1	1	94885.00	26753.00	3.55	14
2139	2	2003	1	2	94885.00	26753.00	3.55	14
2140	2	2003	2	0	71468.00	20200.00	3.54	14
2141	2	2003	2	1	108080.00	26028.00	4.15	14
2142	2	2003	2	2	179548.00	46228.00	3.88	14
2143	2	2004	1	0	\N	\N	\N	14
2144	2	2004	1	1	107594.00	26590.00	4.05	14
2145	2	2004	1	2	107594.00	26590.00	4.05	14
2146	2	2004	2	0	80210.00	20100.00	3.99	14
2147	2	2004	2	1	104806.00	24975.00	4.20	14
2148	2	2004	2	2	185016.00	45075.00	4.10	14
2149	2	2005	1	0	\N	\N	\N	14
2150	2	2005	1	1	117130.00	26400.00	4.44	14
2151	2	2005	1	2	117130.00	26400.00	4.44	14
2152	2	2005	2	0	78822.00	20050.00	3.93	14
2153	2	2005	2	1	110402.00	24653.00	4.48	14
2154	2	2005	2	2	189224.00	44703.00	4.23	14
2155	2	2006	1	0	2228.00	632.00	3.53	14
2156	2	2006	1	1	121424.00	26213.00	4.63	14
2157	2	2006	1	2	123652.00	26845.00	4.61	14
2158	2	2006	2	0	73082.00	19312.00	3.78	14
2159	2	2006	2	1	111768.00	26319.00	4.25	14
2160	2	2006	2	2	184850.00	45631.00	4.05	14
2161	2	2007	1	0	\N	\N	\N	14
2162	2	2007	1	1	110797.00	25736.00	4.31	14
2163	2	2007	1	2	110797.00	25736.00	4.31	14
2164	2	2007	2	0	79350.00	20664.00	3.84	14
2165	2	2007	2	1	114702.00	27285.00	4.20	14
2166	2	2007	2	2	194052.00	47949.00	4.05	14
2167	2	2008	1	0	\N	\N	\N	14
2168	2	2008	1	1	133872.00	29773.00	4.50	14
2169	2	2008	1	2	133872.00	29773.00	4.50	14
2170	2	2008	2	0	85244.00	21311.00	4.00	14
2171	2	2008	2	1	133985.00	30031.00	4.46	14
2172	2	2008	2	2	219229.00	51342.00	4.27	14
2173	2	2009	1	0	\N	\N	\N	14
2174	2	2009	1	1	141215.00	31434.00	4.49	14
2175	2	2009	1	2	141215.00	31434.00	4.49	14
2176	2	2009	2	0	65312.00	21386.00	3.05	14
2177	2	2009	2	1	93750.00	27105.00	3.46	14
2178	2	2009	2	2	159062.00	48491.00	3.28	14
2179	2	2010	1	0	\N	\N	\N	14
2180	2	2010	1	1	133229.00	31554.00	4.22	14
2181	2	2010	1	2	133229.00	31554.00	4.22	14
2182	2	2010	2	0	63082.00	20144.00	3.13	14
2183	2	2010	2	1	102065.00	27463.00	3.72	14
2184	2	2010	2	2	165147.00	47607.00	3.47	14
2185	2	2011	1	0	\N	\N	\N	14
2186	2	2011	1	1	130685.00	31785.00	4.11	14
2187	2	2011	1	2	130685.00	31785.00	4.11	14
2188	2	2011	2	0	36873.00	11960.00	3.08	14
2189	2	2011	2	1	60049.00	16474.00	3.65	14
2190	2	2011	2	2	96922.00	28434.00	3.41	14
2191	2	2012	1	0	\N	\N	\N	14
2192	2	2012	1	1	162333.00	36144.00	4.49	14
2193	2	2012	1	2	162333.00	36144.00	4.49	14
2194	2	2012	2	0	59952.00	14504.00	4.13	14
2195	2	2012	2	1	129022.00	29075.00	4.44	14
2196	2	2012	2	2	188974.00	43579.00	4.34	14
2197	2	2013	1	0	3000.00	750.00	4.00	14
2198	2	2013	1	1	179375.00	38131.00	4.70	14
2199	2	2013	1	2	182375.00	38881.00	4.69	14
2200	2	2013	2	0	56691.00	13865.00	4.09	14
2201	2	2013	2	1	127861.00	29324.00	4.36	14
2202	2	2013	2	2	184552.00	43189.00	4.27	14
2203	2	2014	1	0	3000.00	750.00	4.00	14
2204	2	2014	1	1	175369.00	38116.00	4.60	14
2205	2	2014	1	2	178369.00	38866.00	4.59	14
2206	2	2014	2	0	60702.00	14150.00	4.29	14
2207	2	2014	2	1	133039.00	28943.00	4.60	14
2208	2	2014	2	2	193741.00	43093.00	4.50	14
2209	2	2015	1	0	3023.00	750.00	4.03	14
2210	2	2015	1	1	172757.00	36944.00	4.68	14
2211	2	2015	1	2	175780.00	37694.00	4.66	14
2212	2	2015	2	0	55506.00	13449.00	4.13	14
2213	2	2015	2	1	120151.00	28154.00	4.27	14
2214	2	2015	2	2	175657.00	41603.00	4.22	14
2215	2	2016	1	0	532.00	140.00	3.80	14
2216	2	2016	1	1	176809.00	38589.00	4.58	14
2217	2	2016	1	2	177341.00	38729.00	4.58	14
2218	2	2016	2	0	47968.00	12020.00	3.99	14
2219	2	2016	2	1	134928.00	29977.00	4.50	14
2220	2	2016	2	2	182896.00	41997.00	4.35	14
2221	2	2017	1	0	2400.00	600.00	4.00	14
2222	2	2017	1	1	178584.00	38322.00	4.66	14
2223	2	2017	1	2	180984.00	38922.00	4.65	14
2224	2	2017	2	0	62464.00	14297.00	4.37	14
2225	2	2017	2	1	134640.00	29582.00	4.55	14
2226	2	2017	2	2	197104.00	43879.00	4.49	14
2227	2	2018	1	0	2709.00	602.00	4.50	14
2228	2	2018	1	1	176826.00	39247.00	4.51	14
2229	2	2018	1	2	179535.00	39849.00	4.51	14
2230	2	2018	2	0	54576.00	13257.00	4.12	14
2231	2	2018	2	1	131578.00	29428.00	4.47	14
2232	2	2018	2	2	186154.00	42685.00	4.36	14
2233	2	2019	1	0	1939.98	447.00	4.34	14
2234	2	2019	1	1	178169.81	35819.00	4.97	14
2235	2	2019	1	2	180109.79	36266.00	4.97	14
2236	2	2019	2	0	55655.57	12653.00	4.40	14
2237	2	2019	2	1	132892.79	29071.00	4.57	14
2238	2	2019	2	2	188548.36	41724.00	4.52	14
2239	2	2020	1	0	2255.00	550.00	4.10	14
2240	2	2020	1	1	176144.70	38172.48	4.61	14
2241	2	2020	1	2	178399.70	38722.48	4.61	14
2242	2	2020	2	0	52247.05	12600.00	4.15	14
2243	2	2020	2	1	130607.07	30064.30	4.34	14
2244	2	2020	2	2	182854.12	42664.30	4.29	14
2245	1	1987	1	0	27620.00	16150.00	1.71	15
2246	1	1987	1	1	21455.00	9410.00	2.28	15
2247	1	1987	1	2	49075.00	25560.00	1.92	15
2248	1	1987	2	0	66630.00	39640.00	1.68	15
2249	1	1987	2	1	44393.00	14940.00	2.97	15
2250	1	1987	2	2	111023.00	54580.00	2.03	15
2251	1	1988	1	0	30259.00	16210.00	1.87	15
2252	1	1988	1	1	33805.00	11970.00	2.82	15
2253	1	1988	1	2	64064.00	28180.00	2.27	15
2254	1	1988	2	0	92586.00	52400.00	1.77	15
2255	1	1988	2	1	66424.00	20350.00	3.26	15
2256	1	1988	2	2	159010.00	72750.00	2.19	15
2257	1	1989	1	0	24651.00	14940.00	1.65	15
2258	1	1989	1	1	32682.00	11130.00	2.94	15
2259	1	1989	1	2	57333.00	26070.00	2.20	15
2260	1	1989	2	0	106222.00	55370.00	1.92	15
2261	1	1989	2	1	63330.00	19570.00	3.24	15
2262	1	1989	2	2	169552.00	74940.00	2.26	15
2263	1	1990	1	0	21228.00	11300.00	1.88	15
2264	1	1990	1	1	25825.00	9510.00	2.72	15
2265	1	1990	1	2	47053.00	20810.00	2.26	15
2266	1	1990	2	0	113058.00	70410.00	1.61	15
2267	1	1990	2	1	51230.00	16770.00	3.05	15
2268	1	1990	2	2	164288.00	87180.00	1.88	15
2269	1	1991	1	0	15104.00	6750.00	2.24	15
2270	1	1991	1	1	16372.00	6530.00	2.51	15
2271	1	1991	1	2	31476.00	13280.00	2.37	15
2272	1	1991	2	0	54667.00	39440.00	1.39	15
2273	1	1991	2	1	38875.00	14440.00	2.69	15
2274	1	1991	2	2	93542.00	53880.00	1.74	15
2275	1	1992	1	0	13473.00	6120.00	2.20	15
2276	1	1992	1	1	6904.00	4190.00	1.65	15
2277	1	1992	1	2	20377.00	10310.00	1.98	15
2278	1	1992	2	0	59776.00	33120.00	1.80	15
2279	1	1992	2	1	48605.00	18570.00	2.62	15
2280	1	1992	2	2	108381.00	51690.00	2.10	15
2281	1	1993	1	0	18928.00	10260.00	1.84	15
2282	1	1993	1	1	16866.00	8970.00	1.88	15
2283	1	1993	1	2	35794.00	19230.00	1.86	15
2284	1	1993	2	0	92683.00	62900.00	1.47	15
2285	1	1993	2	1	46885.00	15400.00	3.04	15
2286	1	1993	2	2	139568.00	78300.00	1.78	15
2287	1	1994	1	0	46183.00	22600.00	2.04	15
2288	1	1994	1	1	54199.00	19670.00	2.76	15
2289	1	1994	1	2	100382.00	42270.00	2.37	15
2290	1	1994	2	0	169114.00	87860.00	1.92	15
2291	1	1994	2	1	61258.00	21170.00	2.89	15
2292	1	1994	2	2	230372.00	109030.00	2.11	15
2293	1	1995	1	0	27872.00	17290.00	1.61	15
2294	1	1995	1	1	48565.00	18620.00	2.61	15
2295	1	1995	1	2	76437.00	35910.00	2.13	15
2296	1	1995	2	0	196650.00	102796.00	1.91	15
2297	1	1995	2	1	56753.00	20257.00	2.80	15
2298	1	1995	2	2	253403.00	123053.00	2.06	15
2299	1	1996	1	0	52548.00	28050.00	1.87	15
2300	1	1996	1	1	46617.00	17537.00	2.66	15
2301	1	1996	1	2	99165.00	45587.00	2.18	15
2302	1	1996	2	0	174636.00	96835.00	1.80	15
2303	1	1996	2	1	58082.00	20787.00	2.79	15
2304	1	1996	2	2	232718.00	117622.00	1.98	15
2305	1	1997	1	0	57519.00	32157.00	1.79	15
2306	1	1997	1	1	51609.00	18460.00	2.80	15
2307	1	1997	1	2	109128.00	50617.00	2.16	15
2308	1	1997	2	0	149611.00	78507.00	1.91	15
2309	1	1997	2	1	47806.00	17397.00	2.75	15
2310	1	1997	2	2	197417.00	95904.00	2.06	15
2311	1	1998	1	0	22397.00	17330.00	1.29	15
2312	1	1998	1	1	24819.00	12236.00	2.03	15
2313	1	1998	1	2	47216.00	29566.00	1.60	15
2314	1	1998	2	0	132007.00	70285.00	1.88	15
2315	1	1998	2	1	46524.00	19573.00	2.38	15
2316	1	1998	2	2	178531.00	89858.00	1.99	15
2317	1	1999	1	0	46787.00	25547.00	1.83	15
2318	1	1999	1	1	52146.00	20839.00	2.50	15
2319	1	1999	1	2	98933.00	46386.00	2.13	15
2320	1	1999	2	0	176580.00	84351.00	2.09	15
2321	1	1999	2	1	72972.00	23198.00	3.15	15
2322	1	1999	2	2	249552.00	107549.00	2.32	15
2323	1	2000	1	0	56570.00	26371.00	2.15	15
2324	1	2000	1	1	63732.00	20571.00	3.10	15
2325	1	2000	1	2	120302.00	46942.00	2.56	15
2326	1	2000	2	0	158907.00	80074.00	1.98	15
2327	1	2000	2	1	68340.00	22912.00	2.98	15
2328	1	2000	2	2	227247.00	102986.00	2.21	15
2329	1	2001	1	0	53960.00	27257.00	1.98	15
2330	1	2001	1	1	71668.00	22517.00	3.18	15
2331	1	2001	1	2	125628.00	49774.00	2.52	15
2332	1	2001	2	0	222343.00	88451.00	2.51	15
2333	1	2001	2	1	96588.00	26660.00	3.62	15
2334	1	2001	2	2	318931.00	115111.00	2.77	15
2335	1	2002	1	0	57836.00	32462.00	1.78	15
2336	1	2002	1	1	70655.00	25671.00	2.75	15
2337	1	2002	1	2	128491.00	58133.00	2.21	15
2338	1	2002	2	0	182613.00	85490.00	2.14	15
2339	1	2002	2	1	111476.00	30450.00	3.66	15
2340	1	2002	2	2	294089.00	115940.00	2.54	15
2341	1	2003	1	0	50794.00	35261.00	1.44	15
2342	1	2003	1	1	58367.00	21026.00	2.78	15
2343	1	2003	1	2	109161.00	56287.00	1.94	15
2344	1	2003	2	0	188171.00	84903.00	2.22	15
2345	1	2003	2	1	101646.00	30342.00	3.35	15
2346	1	2003	2	2	289817.00	115245.00	2.51	15
2347	1	2004	1	0	79224.00	38101.00	2.08	15
2348	1	2004	1	1	97833.00	30181.00	3.24	15
2349	1	2004	1	2	177057.00	68282.00	2.59	15
2350	1	2004	2	0	202747.00	91403.00	2.22	15
2351	1	2004	2	1	111100.00	26460.00	4.20	15
2352	1	2004	2	2	313847.00	117863.00	2.66	15
2353	1	2005	1	0	71513.00	36871.00	1.94	15
2354	1	2005	1	1	109049.00	31012.00	3.52	15
2355	1	2005	1	2	180562.00	67883.00	2.66	15
2356	1	2005	2	0	217191.00	97295.00	2.23	15
2357	1	2005	2	1	147458.00	34557.00	4.27	15
2358	1	2005	2	2	364649.00	131852.00	2.77	15
2359	1	2006	1	0	153532.00	67917.00	2.26	15
2360	1	2006	1	1	119040.00	29274.00	4.07	15
2361	1	2006	1	2	272572.00	97191.00	2.80	15
2362	1	2006	2	0	158648.00	68983.00	2.30	15
2363	1	2006	2	1	123050.00	30337.00	4.06	15
2364	1	2006	2	2	281698.00	99320.00	2.84	15
2365	1	2007	1	0	167340.00	76812.00	2.18	15
2366	1	2007	1	1	123112.00	33242.00	3.70	15
2367	1	2007	1	2	290452.00	110054.00	2.64	15
2368	1	2007	2	0	152397.00	51104.00	2.98	15
2369	1	2007	2	1	172931.00	38201.00	4.53	15
2370	1	2007	2	2	325328.00	89305.00	3.64	15
2371	1	2008	1	0	206396.00	76439.00	2.70	15
2372	1	2008	1	1	104794.00	27886.00	3.76	15
2373	1	2008	1	2	311190.00	104325.00	2.98	15
2374	1	2008	2	0	174895.00	60063.00	2.91	15
2375	1	2008	2	1	145606.00	36116.00	4.03	15
2376	1	2008	2	2	320501.00	96179.00	3.33	15
2377	1	2009	1	0	185145.00	73456.00	2.52	15
2378	1	2009	1	1	118906.00	30986.00	3.84	15
2379	1	2009	1	2	304051.00	104442.00	2.91	15
2380	1	2009	2	0	200636.00	78333.00	2.56	15
2381	1	2009	2	1	75060.00	21985.00	3.41	15
2382	1	2009	2	2	275696.00	100318.00	2.75	15
2383	1	2010	1	0	210793.00	81213.00	2.60	15
2384	1	2010	1	1	131142.00	31736.00	4.13	15
2385	1	2010	1	2	341935.00	112949.00	3.03	15
2386	1	2010	2	0	209219.00	76931.00	2.72	15
2387	1	2010	2	1	72189.00	17752.00	4.07	15
2388	1	2010	2	2	281408.00	94683.00	2.97	15
2389	1	2011	1	0	155889.00	65358.00	2.39	15
2390	1	2011	1	1	114677.00	31147.00	3.68	15
2391	1	2011	1	2	270566.00	96505.00	2.80	15
2392	1	2011	2	0	204376.00	77254.00	2.65	15
2393	1	2011	2	1	101931.00	25765.00	3.96	15
2394	1	2011	2	2	306307.00	103019.00	2.97	15
2395	1	2012	1	0	181179.00	80410.00	2.25	15
2396	1	2012	1	1	88080.00	28979.00	3.04	15
2397	1	2012	1	2	269259.00	109389.00	2.46	15
2398	1	2012	2	0	193325.00	72656.00	2.66	15
2399	1	2012	2	1	80176.00	20756.00	3.86	15
2400	1	2012	2	2	273501.00	93412.00	2.93	15
2401	1	2013	1	0	161295.00	71353.00	2.26	15
2402	1	2013	1	1	98365.00	28436.00	3.46	15
2403	1	2013	1	2	259660.00	99789.00	2.60	15
2404	1	2013	2	0	248877.00	97521.00	2.55	15
2405	1	2013	2	1	103546.00	29390.00	3.52	15
2406	1	2013	2	2	352423.00	126911.00	2.78	15
2407	1	2014	1	0	193798.00	91758.00	2.11	15
2408	1	2014	1	1	75636.00	23390.00	3.23	15
2409	1	2014	1	2	269434.00	115148.00	2.34	15
2410	1	2014	2	0	176280.00	68953.00	2.56	15
2411	1	2014	2	1	111435.00	33321.00	3.34	15
2412	1	2014	2	2	287715.00	102274.00	2.81	15
2413	1	2015	1	0	132892.00	70870.00	1.88	15
2414	1	2015	1	1	81774.00	25050.00	3.26	15
2415	1	2015	1	2	214666.00	95920.00	2.24	15
2416	1	2015	2	0	202086.00	76355.00	2.65	15
2417	1	2015	2	1	71463.00	22074.00	3.24	15
2418	1	2015	2	2	273549.00	98429.00	2.78	15
2419	1	2016	1	0	92633.00	52215.00	1.77	15
2420	1	2016	1	1	66026.40	21356.00	3.09	15
2421	1	2016	1	2	158659.40	73571.00	2.16	15
2422	1	2016	2	0	317450.00	120486.00	2.63	15
2423	1	2016	2	1	68377.00	18870.00	3.62	15
2424	1	2016	2	2	385827.00	139356.00	2.77	15
2425	1	2017	1	0	182339.00	72916.00	2.50	15
2426	1	2017	1	1	60286.00	19016.00	3.17	15
2427	1	2017	1	2	242625.00	91932.00	2.64	15
2428	1	2017	2	0	276401.00	112766.00	2.45	15
2429	1	2017	2	1	58958.00	16494.00	3.57	15
2430	1	2017	2	2	335359.00	129260.00	2.59	15
2431	1	2018	1	0	173350.00	72415.00	2.39	15
2432	1	2018	1	1	72862.00	21054.00	3.46	15
2433	1	2018	1	2	246212.00	93469.00	2.63	15
2434	1	2018	2	0	306906.36	113948.00	2.69	15
2435	1	2018	2	1	85278.20	18918.00	4.51	15
2436	1	2018	2	2	392184.56	132866.00	2.95	15
2437	1	2019	1	0	199039.85	68763.00	2.89	15
2438	1	2019	1	1	73466.19	20631.00	3.56	15
2439	1	2019	1	2	272506.04	89394.00	3.05	15
2440	1	2019	2	0	299849.12	96894.47	3.09	15
2441	1	2019	2	1	102405.39	22172.53	4.62	15
2442	1	2019	2	2	402254.51	119067.00	3.38	15
2443	1	2020	1	0	210367.73	84960.82	2.48	15
2444	1	2020	1	1	73563.08	20058.00	3.67	15
2445	1	2020	1	2	283930.81	105018.82	2.70	15
2446	1	2020	2	0	324087.34	103224.00	3.14	15
2447	1	2020	2	1	117075.22	25093.62	4.67	15
2448	1	2020	2	2	441162.56	128317.62	3.44	15
2449	2	1987	1	0	53855.00	37020.00	1.45	15
2450	2	1987	1	1	93960.00	34280.00	2.74	15
2451	2	1987	1	2	147815.00	71300.00	2.07	15
2452	2	1987	2	0	11572.00	8430.00	1.37	15
2453	2	1987	2	1	74018.00	28030.00	2.64	15
2454	2	1987	2	2	85590.00	36460.00	2.35	15
2455	2	1988	1	0	48328.00	27330.00	1.77	15
2456	2	1988	1	1	121624.00	40600.00	3.00	15
2457	2	1988	1	2	169952.00	67930.00	2.50	15
2458	2	1988	2	0	17974.00	9260.00	1.94	15
2459	2	1988	2	1	92227.00	34350.00	2.68	15
2460	2	1988	2	2	110201.00	43610.00	2.53	15
2461	2	1989	1	0	37212.00	22990.00	1.62	15
2462	2	1989	1	1	123591.00	42400.00	2.91	15
2463	2	1989	1	2	160803.00	65390.00	2.46	15
2464	2	1989	2	0	9367.00	7120.00	1.32	15
2465	2	1989	2	1	80454.00	35150.00	2.29	15
2466	2	1989	2	2	89821.00	42270.00	2.12	15
2467	2	1990	1	0	23264.00	16980.00	1.37	15
2468	2	1990	1	1	100480.00	39350.00	2.55	15
2469	2	1990	1	2	123744.00	56330.00	2.20	15
2470	2	1990	2	0	14280.00	9360.00	1.53	15
2471	2	1990	2	1	80634.00	28680.00	2.81	15
2472	2	1990	2	2	94914.00	38040.00	2.50	15
2473	2	1991	1	0	24890.00	15190.00	1.64	15
2474	2	1991	1	1	85759.00	34290.00	2.50	15
2475	2	1991	1	2	110649.00	49480.00	2.24	15
2476	2	1991	2	0	8405.00	6890.00	1.22	15
2477	2	1991	2	1	67103.00	28070.00	2.39	15
2478	2	1991	2	2	75508.00	34960.00	2.16	15
2479	2	1992	1	0	20472.00	14620.00	1.40	15
2480	2	1992	1	1	80116.00	33080.00	2.42	15
2481	2	1992	1	2	100588.00	47700.00	2.11	15
2482	2	1992	2	0	6212.00	5020.00	1.24	15
2483	2	1992	2	1	67042.00	28560.00	2.35	15
2484	2	1992	2	2	73254.00	33580.00	2.18	15
2485	2	1993	1	0	16940.00	12170.00	1.39	15
2486	2	1993	1	1	71752.00	33240.00	2.16	15
2487	2	1993	1	2	88692.00	45410.00	1.95	15
2488	2	1993	2	0	1886.00	1760.00	1.07	15
2489	2	1993	2	1	62147.00	22040.00	2.82	15
2490	2	1993	2	2	64033.00	23800.00	2.69	15
2491	2	1994	1	0	45305.00	24360.00	1.86	15
2492	2	1994	1	1	148664.00	46470.00	3.20	15
2493	2	1994	1	2	193969.00	70830.00	2.74	15
2494	2	1994	2	0	31875.00	16190.00	1.97	15
2495	2	1994	2	1	118837.00	43500.00	2.73	15
2496	2	1994	2	2	150712.00	59690.00	2.52	15
2497	2	1995	1	0	28358.00	22643.00	1.25	15
2498	2	1995	1	1	142527.00	44816.00	3.18	15
2499	2	1995	1	2	170885.00	67459.00	2.53	15
2500	2	1995	2	0	30696.00	14976.00	2.05	15
2501	2	1995	2	1	147422.00	43533.00	3.39	15
2502	2	1995	2	2	178118.00	58509.00	3.04	15
2503	2	1996	1	0	59209.00	31445.00	1.88	15
2504	2	1996	1	1	179701.00	50484.00	3.56	15
2505	2	1996	1	2	238910.00	81929.00	2.92	15
2506	2	1996	2	0	17126.00	10990.00	1.56	15
2507	2	1996	2	1	119419.00	41772.00	2.86	15
2508	2	1996	2	2	136545.00	52762.00	2.59	15
2509	2	1997	1	0	54638.00	27109.00	2.02	15
2510	2	1997	1	1	207517.00	58594.00	3.54	15
2511	2	1997	1	2	262155.00	85703.00	3.06	15
2512	2	1997	2	0	11783.00	7426.00	1.59	15
2513	2	1997	2	1	165624.00	52830.00	3.14	15
2514	2	1997	2	2	177407.00	60256.00	2.94	15
2515	2	1998	1	0	14690.00	12556.00	1.17	15
2516	2	1998	1	1	179645.00	59750.00	3.01	15
2517	2	1998	1	2	194335.00	72306.00	2.69	15
2518	2	1998	2	0	9069.00	6350.00	1.43	15
2519	2	1998	2	1	142829.00	48268.00	2.96	15
2520	2	1998	2	2	151898.00	54618.00	2.78	15
2521	2	1999	1	0	62026.00	32392.00	1.91	15
2522	2	1999	1	1	218049.00	62000.00	3.52	15
2523	2	1999	1	2	280075.00	94392.00	2.97	15
2524	2	1999	2	0	30701.00	17446.00	1.76	15
2525	2	1999	2	1	146561.00	50050.00	2.93	15
2526	2	1999	2	2	177262.00	67496.00	2.63	15
2527	2	2000	1	0	80754.00	37348.00	2.16	15
2528	2	2000	1	1	243780.00	65099.00	3.74	15
2529	2	2000	1	2	324534.00	102447.00	3.17	15
2530	2	2000	2	0	22944.00	11249.00	2.04	15
2531	2	2000	2	1	166122.00	50937.00	3.26	15
2532	2	2000	2	2	189066.00	62186.00	3.04	15
2533	2	2001	1	0	72490.00	33802.00	2.14	15
2534	2	2001	1	1	231711.00	64300.00	3.60	15
2535	2	2001	1	2	304201.00	98102.00	3.10	15
2536	2	2001	2	0	28714.00	12820.00	2.24	15
2537	2	2001	2	1	181076.00	53162.00	3.41	15
2538	2	2001	2	2	209790.00	65982.00	3.18	15
2539	2	2002	1	0	61170.00	31531.00	1.94	15
2540	2	2002	1	1	235769.00	64523.00	3.65	15
2541	2	2002	1	2	296939.00	96054.00	3.09	15
2542	2	2002	2	0	23255.00	10754.00	2.16	15
2543	2	2002	2	1	186842.00	50361.00	3.71	15
2544	2	2002	2	2	210097.00	61115.00	3.44	15
2545	2	2003	1	0	48194.00	25665.00	1.88	15
2546	2	2003	1	1	214871.00	61669.00	3.48	15
2547	2	2003	1	2	263065.00	87334.00	3.01	15
2548	2	2003	2	0	41133.00	17669.00	2.33	15
2549	2	2003	2	1	178686.00	49703.00	3.60	15
2550	2	2003	2	2	219819.00	67372.00	3.26	15
2551	2	2004	1	0	89837.00	36251.00	2.48	15
2552	2	2004	1	1	254878.00	65116.00	3.91	15
2553	2	2004	1	2	344715.00	101367.00	3.40	15
2554	2	2004	2	0	39146.00	16328.00	2.40	15
2555	2	2004	2	1	187339.00	49623.00	3.78	15
2556	2	2004	2	2	226485.00	65951.00	3.43	15
2557	2	2005	1	0	57051.00	29401.00	1.94	15
2558	2	2005	1	1	266298.00	65461.00	4.07	15
2559	2	2005	1	2	323349.00	94862.00	3.41	15
2560	2	2005	2	0	14136.00	5961.00	2.37	15
2561	2	2005	2	1	154321.00	44518.00	3.47	15
2562	2	2005	2	2	168457.00	50479.00	3.34	15
2563	2	2006	1	0	104943.00	37550.00	2.79	15
2564	2	2006	1	1	318561.00	73449.00	4.34	15
2565	2	2006	1	2	423504.00	110999.00	3.82	15
2566	2	2006	2	0	30672.00	12263.00	2.50	15
2567	2	2006	2	1	234743.00	64017.00	3.67	15
2568	2	2006	2	2	265415.00	76280.00	3.48	15
2569	2	2007	1	0	105835.00	37838.00	2.80	15
2570	2	2007	1	1	350961.00	79816.00	4.40	15
2571	2	2007	1	2	456796.00	117654.00	3.88	15
2572	2	2007	2	0	36573.00	14701.00	2.49	15
2573	2	2007	2	1	209192.00	52811.00	3.96	15
2574	2	2007	2	2	245765.00	67512.00	3.64	15
2575	2	2008	1	0	95202.00	38171.00	2.49	15
2576	2	2008	1	1	353030.00	82294.00	4.29	15
2577	2	2008	1	2	448232.00	120465.00	3.72	15
2578	2	2008	2	0	41638.00	19078.00	2.18	15
2579	2	2008	2	1	217302.00	60552.00	3.59	15
2580	2	2008	2	2	258940.00	79630.00	3.25	15
2581	2	2009	1	0	111070.00	38195.00	2.91	15
2582	2	2009	1	1	356617.00	80673.00	4.42	15
2583	2	2009	1	2	467687.00	118868.00	3.93	15
2584	2	2009	2	0	36754.00	17332.00	2.12	15
2585	2	2009	2	1	176872.00	53661.00	3.30	15
2586	2	2009	2	2	213626.00	70993.00	3.01	15
2587	2	2010	1	0	54316.00	32634.00	1.66	15
2588	2	2010	1	1	340669.00	78764.00	4.33	15
2589	2	2010	1	2	394985.00	111398.00	3.55	15
2590	2	2010	2	0	13934.00	9021.00	1.54	15
2591	2	2010	2	1	207402.00	62921.00	3.30	15
2592	2	2010	2	2	221336.00	71942.00	3.08	15
2593	2	2011	1	0	100817.00	36993.00	2.73	15
2594	2	2011	1	1	370154.00	84940.00	4.36	15
2595	2	2011	1	2	470971.00	121933.00	3.86	15
2596	2	2011	2	0	38139.00	15688.00	2.43	15
2597	2	2011	2	1	275512.00	74632.00	3.69	15
2598	2	2011	2	2	313651.00	90320.00	3.47	15
2599	2	2012	1	0	99104.00	34988.00	2.83	15
2600	2	2012	1	1	389244.00	85246.00	4.57	15
2601	2	2012	1	2	488348.00	120234.00	4.06	15
2602	2	2012	2	0	49348.00	17484.00	2.82	15
2603	2	2012	2	1	338025.00	81978.00	4.12	15
2604	2	2012	2	2	387373.00	99462.00	3.89	15
2605	2	2013	1	0	84584.00	30653.00	2.76	15
2606	2	2013	1	1	410877.00	94407.00	4.35	15
2607	2	2013	1	2	495461.00	125060.00	3.96	15
2608	2	2013	2	0	18782.00	9698.00	1.94	15
2609	2	2013	2	1	315494.00	81820.00	3.86	15
2610	2	2013	2	2	334276.00	91518.00	3.65	15
2611	2	2014	1	0	80664.00	33862.00	2.38	15
2612	2	2014	1	1	410559.00	93759.00	4.38	15
2613	2	2014	1	2	491223.00	127621.00	3.85	15
2614	2	2014	2	0	47261.00	16699.00	2.83	15
2615	2	2014	2	1	357096.00	83173.00	4.29	15
2616	2	2014	2	2	404357.00	99872.00	4.05	15
2617	2	2015	1	0	88436.00	30169.00	2.93	15
2618	2	2015	1	1	452043.00	94337.00	4.79	15
2619	2	2015	1	2	540479.00	124506.00	4.34	15
2620	2	2015	2	0	27494.00	14780.00	1.86	15
2621	2	2015	2	1	316361.00	79908.00	3.96	15
2622	2	2015	2	2	343855.00	94688.00	3.63	15
2623	2	2016	1	0	69412.00	24669.00	2.81	15
2624	2	2016	1	1	455471.00	94394.00	4.83	15
2625	2	2016	1	2	524883.00	119063.00	4.41	15
2626	2	2016	2	0	18272.00	11527.00	1.59	15
2627	2	2016	2	1	221148.00	64173.00	3.45	15
2628	2	2016	2	2	239420.00	75700.00	3.16	15
2629	2	2017	1	0	107316.00	31606.00	3.40	15
2630	2	2017	1	1	504903.00	95056.00	5.31	15
2631	2	2017	1	2	612219.00	126662.00	4.83	15
2632	2	2017	2	0	41964.00	15207.00	2.76	15
2633	2	2017	2	1	351937.00	81002.00	4.34	15
2634	2	2017	2	2	393901.00	96209.00	4.09	15
2635	2	2018	1	0	113295.00	31622.00	3.58	15
2636	2	2018	1	1	492173.00	95473.00	5.16	15
2637	2	2018	1	2	605468.00	127095.00	4.76	15
2638	2	2018	2	0	29078.00	11965.00	2.43	15
2639	2	2018	2	1	198395.00	57108.00	3.47	15
2640	2	2018	2	2	227473.00	69073.00	3.29	15
2641	2	2019	1	0	70035.00	23683.00	2.96	15
2642	2	2019	1	1	437101.00	93302.00	4.68	15
2643	2	2019	1	2	507136.00	116985.00	4.34	15
2644	2	2019	2	0	41239.87	14018.00	2.94	15
2645	2	2019	2	1	357218.00	79781.00	4.48	15
2646	2	2019	2	2	398457.87	93799.00	4.25	15
2647	2	2020	1	0	91290.00	27349.00	3.34	15
2648	2	2020	1	1	429783.00	94090.00	4.57	15
2649	2	2020	1	2	521073.00	121439.00	4.29	15
2650	2	2020	2	0	40692.00	13941.00	2.92	15
2651	2	2020	2	1	359998.00	85733.00	4.20	15
2652	2	2020	2	2	400690.00	99674.00	4.02	15
2653	1	1987	1	0	65370.00	31210.00	2.09	16
2654	1	1987	1	1	51295.00	20660.00	2.48	16
2655	1	1987	1	2	116665.00	51870.00	2.25	16
2656	1	1987	2	0	20087.00	9340.00	2.15	16
2657	1	1987	2	1	49562.00	16780.00	2.95	16
2658	1	1987	2	2	69649.00	26120.00	2.67	16
2659	1	1988	1	0	60334.00	25600.00	2.36	16
2660	1	1988	1	1	75393.00	25790.00	2.92	16
2661	1	1988	1	2	135727.00	51390.00	2.64	16
2662	1	1988	2	0	15645.00	7820.00	2.00	16
2663	1	1988	2	1	47213.00	16180.00	2.92	16
2664	1	1988	2	2	62858.00	24000.00	2.62	16
2665	1	1989	1	0	57888.00	27250.00	2.12	16
2666	1	1989	1	1	60749.00	24580.00	2.47	16
2667	1	1989	1	2	118637.00	51830.00	2.29	16
2668	1	1989	2	0	20076.00	9550.00	2.10	16
2669	1	1989	2	1	62282.00	19840.00	3.14	16
2670	1	1989	2	2	82358.00	29390.00	2.80	16
2671	1	1990	1	0	61547.00	26650.00	2.31	16
2672	1	1990	1	1	81386.00	31150.00	2.61	16
2673	1	1990	1	2	142933.00	57800.00	2.47	16
2674	1	1990	2	0	24652.00	10060.00	2.45	16
2675	1	1990	2	1	58332.00	18110.00	3.22	16
2676	1	1990	2	2	82984.00	28170.00	2.95	16
2677	1	1991	1	0	81037.00	31170.00	2.60	16
2678	1	1991	1	1	105301.00	32260.00	3.26	16
2679	1	1991	1	2	186338.00	63430.00	2.94	16
2680	1	1991	2	0	12878.00	6420.00	2.01	16
2681	1	1991	2	1	80242.00	24850.00	3.23	16
2682	1	1991	2	2	93120.00	31270.00	2.98	16
2683	1	1992	1	0	32068.00	16930.00	1.89	16
2684	1	1992	1	1	78918.00	27000.00	2.92	16
2685	1	1992	1	2	110986.00	43930.00	2.53	16
2686	1	1992	2	0	19708.00	7520.00	2.62	16
2687	1	1992	2	1	41756.00	14800.00	2.82	16
2688	1	1992	2	2	61464.00	22320.00	2.75	16
2689	1	1993	1	0	51619.00	21610.00	2.39	16
2690	1	1993	1	1	88079.00	27360.00	3.22	16
2691	1	1993	1	2	139698.00	48970.00	2.85	16
2692	1	1993	2	0	34262.00	12490.00	2.74	16
2693	1	1993	2	1	69081.00	21110.00	3.27	16
2694	1	1993	2	2	103343.00	33600.00	3.08	16
2695	1	1994	1	0	53168.00	27210.00	1.95	16
2696	1	1994	1	1	82796.00	29910.00	2.77	16
2697	1	1994	1	2	135964.00	57120.00	2.38	16
2698	1	1994	2	0	34169.00	15230.00	2.24	16
2699	1	1994	2	1	80916.00	27900.00	2.90	16
2700	1	1994	2	2	115085.00	43130.00	2.67	16
2701	1	1995	1	0	91362.00	40110.00	2.28	16
2702	1	1995	1	1	123867.00	41381.00	2.99	16
2703	1	1995	1	2	215229.00	81491.00	2.64	16
2704	1	1995	2	0	79617.00	30107.00	2.64	16
2705	1	1995	2	1	107513.00	34732.00	3.10	16
2706	1	1995	2	2	187130.00	64839.00	2.89	16
2707	1	1996	1	0	83119.00	40787.00	2.04	16
2708	1	1996	1	1	103168.00	40002.00	2.58	16
2709	1	1996	1	2	186287.00	80789.00	2.31	16
2710	1	1996	2	0	49635.00	23012.00	2.16	16
2711	1	1996	2	1	113775.00	37727.00	3.02	16
2712	1	1996	2	2	163410.00	60739.00	2.69	16
2713	1	1997	1	0	58671.00	30701.00	1.91	16
2714	1	1997	1	1	94682.00	35139.00	2.69	16
2715	1	1997	1	2	153353.00	65840.00	2.33	16
2716	1	1997	2	0	26304.00	13420.00	1.96	16
2717	1	1997	2	1	101313.00	35848.00	2.83	16
2718	1	1997	2	2	127617.00	49268.00	2.59	16
2719	1	1998	1	0	35641.00	20222.00	1.76	16
2720	1	1998	1	1	109679.00	38187.00	2.87	16
2721	1	1998	1	2	145320.00	58409.00	2.49	16
2722	1	1998	2	0	13032.00	5475.00	2.38	16
2723	1	1998	2	1	81597.00	31028.00	2.63	16
2724	1	1998	2	2	94629.00	36503.00	2.59	16
2725	1	1999	1	0	45208.00	23415.00	1.93	16
2726	1	1999	1	1	94800.00	35474.00	2.67	16
2727	1	1999	1	2	140008.00	58889.00	2.38	16
2728	1	1999	2	0	32131.00	14305.00	2.25	16
2729	1	1999	2	1	108070.00	38731.00	2.79	16
2730	1	1999	2	2	140201.00	53036.00	2.64	16
2731	1	2000	1	0	51771.00	24476.00	2.12	16
2732	1	2000	1	1	105275.00	37297.00	2.82	16
2733	1	2000	1	2	157046.00	61773.00	2.54	16
2734	1	2000	2	0	34841.00	15127.00	2.30	16
2735	1	2000	2	1	116179.00	40385.00	2.88	16
2736	1	2000	2	2	151020.00	55512.00	2.72	16
2737	1	2001	1	0	63720.00	26634.00	2.39	16
2738	1	2001	1	1	117752.00	39492.00	2.98	16
2739	1	2001	1	2	181472.00	66126.00	2.74	16
2740	1	2001	2	0	35206.00	15032.00	2.34	16
2741	1	2001	2	1	119687.00	39497.00	3.03	16
2742	1	2001	2	2	154893.00	54529.00	2.84	16
2743	1	2002	1	0	64352.00	27102.00	2.37	16
2744	1	2002	1	1	124922.00	42272.00	2.96	16
2745	1	2002	1	2	189274.00	69374.00	2.73	16
2746	1	2002	2	0	24288.00	11261.00	2.16	16
2747	1	2002	2	1	113508.00	37399.00	3.04	16
2748	1	2002	2	2	137796.00	48660.00	2.83	16
2749	1	2003	1	0	68610.00	26566.00	2.58	16
2750	1	2003	1	1	126776.00	38120.00	3.33	16
2751	1	2003	1	2	195386.00	64686.00	3.02	16
2752	1	2003	2	0	25800.00	10485.00	2.46	16
2753	1	2003	2	1	123520.00	38750.00	3.19	16
2754	1	2003	2	2	149320.00	49235.00	3.03	16
2755	1	2004	1	0	74487.00	28175.00	2.64	16
2756	1	2004	1	1	133863.00	40069.00	3.34	16
2757	1	2004	1	2	208350.00	68244.00	3.05	16
2758	1	2004	2	0	16341.00	6847.00	2.39	16
2759	1	2004	2	1	126938.00	40257.00	3.15	16
2760	1	2004	2	2	143279.00	47104.00	3.04	16
2761	1	2005	1	0	68509.00	25620.00	2.67	16
2762	1	2005	1	1	142037.00	39413.00	3.60	16
2763	1	2005	1	2	210546.00	65033.00	3.24	16
2764	1	2005	2	0	29718.00	10559.00	2.81	16
2765	1	2005	2	1	145699.00	41174.00	3.54	16
2766	1	2005	2	2	175417.00	51733.00	3.39	16
2767	1	2006	1	0	76234.00	27592.00	2.76	16
2768	1	2006	1	1	151608.00	43723.00	3.47	16
2769	1	2006	1	2	227842.00	71315.00	3.19	16
2770	1	2006	2	0	34156.00	12755.00	2.68	16
2771	1	2006	2	1	146776.00	41988.00	3.50	16
2772	1	2006	2	2	180932.00	54743.00	3.31	16
2773	1	2007	1	0	88716.00	28990.00	3.06	16
2774	1	2007	1	1	168188.00	46224.00	3.64	16
2775	1	2007	1	2	256904.00	75214.00	3.42	16
2776	1	2007	2	0	40721.00	14578.00	2.79	16
2777	1	2007	2	1	158213.00	43652.00	3.62	16
2778	1	2007	2	2	198934.00	58230.00	3.42	16
2779	1	2008	1	0	85845.00	29483.00	2.91	16
2780	1	2008	1	1	154745.00	43409.00	3.56	16
2781	1	2008	1	2	240590.00	72892.00	3.30	16
2782	1	2008	2	0	49266.00	19503.00	2.53	16
2783	1	2008	2	1	157461.00	45864.00	3.43	16
2784	1	2008	2	2	206727.00	65367.00	3.16	16
2785	1	2009	1	0	84190.00	32487.00	2.59	16
2786	1	2009	1	1	137646.00	42914.00	3.21	16
2787	1	2009	1	2	221836.00	75401.00	2.94	16
2788	1	2009	2	0	50104.50	18754.00	2.67	16
2789	1	2009	2	1	153610.00	43018.00	3.57	16
2790	1	2009	2	2	203714.50	61772.00	3.30	16
2791	1	2010	1	0	78215.00	28116.00	2.78	16
2792	1	2010	1	1	145202.00	42817.00	3.39	16
2793	1	2010	1	2	223417.00	70933.00	3.15	16
2794	1	2010	2	0	45405.00	17771.00	2.56	16
2795	1	2010	2	1	137049.00	42163.00	3.25	16
2796	1	2010	2	2	182454.00	59934.00	3.04	16
2797	1	2011	1	0	68412.00	27443.00	2.49	16
2798	1	2011	1	1	134704.00	44106.00	3.05	16
2799	1	2011	1	2	203116.00	71549.00	2.84	16
2800	1	2011	2	0	66883.00	26145.00	2.56	16
2801	1	2011	2	1	146998.00	44158.00	3.33	16
2802	1	2011	2	2	213881.00	70303.00	3.04	16
2803	1	2012	1	0	113483.00	42072.00	2.70	16
2804	1	2012	1	1	159418.00	48551.00	3.28	16
2805	1	2012	1	2	272901.00	90623.00	3.01	16
2806	1	2012	2	0	58247.30	23480.00	2.48	16
2807	1	2012	2	1	138056.70	40938.00	3.37	16
2808	1	2012	2	2	196304.00	64418.00	3.05	16
2809	1	2013	1	0	137659.00	44451.00	3.10	16
2810	1	2013	1	1	182180.00	51703.00	3.52	16
2811	1	2013	1	2	319839.00	96154.00	3.33	16
2812	1	2013	2	0	92311.00	32322.00	2.86	16
2813	1	2013	2	1	171688.00	48083.00	3.57	16
2814	1	2013	2	2	263999.00	80405.00	3.28	16
2815	1	2014	1	0	140290.00	45178.00	3.11	16
2816	1	2014	1	1	189975.00	51434.00	3.69	16
2817	1	2014	1	2	330265.00	96612.00	3.42	16
2818	1	2014	2	0	78252.00	28920.00	2.71	16
2819	1	2014	2	1	165982.00	48638.00	3.41	16
2820	1	2014	2	2	244234.00	77558.00	3.15	16
2821	1	2015	1	0	128104.50	45555.00	2.81	16
2822	1	2015	1	1	178875.00	50901.00	3.51	16
2823	1	2015	1	2	306979.50	96456.00	3.18	16
2824	1	2015	2	0	44370.00	19182.95	2.31	16
2825	1	2015	2	1	129962.00	39491.00	3.29	16
2826	1	2015	2	2	174332.00	58673.95	2.97	16
2827	1	2016	1	0	98720.00	36992.00	2.67	16
2828	1	2016	1	1	147729.00	45889.00	3.22	16
2829	1	2016	1	2	246449.00	82881.00	2.97	16
2830	1	2016	2	0	52354.00	20208.00	2.59	16
2831	1	2016	2	1	163379.00	46987.00	3.48	16
2832	1	2016	2	2	215733.00	67195.00	3.21	16
2833	1	2017	1	0	108075.00	38766.00	2.79	16
2834	1	2017	1	1	164156.00	48569.00	3.38	16
2835	1	2017	1	2	272231.00	87335.00	3.12	16
2836	1	2017	2	0	68215.00	26794.00	2.55	16
2837	1	2017	2	1	142229.00	41074.00	3.46	16
2838	1	2017	2	2	210444.00	67868.00	3.10	16
2839	1	2018	1	0	116915.80	40281.00	2.90	16
2840	1	2018	1	1	181962.00	51515.00	3.53	16
2841	1	2018	1	2	298877.80	91796.00	3.26	16
2842	1	2018	2	0	58726.72	23279.00	2.52	16
2843	1	2018	2	1	152466.20	45207.00	3.37	16
2844	1	2018	2	2	211192.92	68486.00	3.08	16
2845	1	2019	1	0	115593.44	41376.01	2.79	16
2846	1	2019	1	1	181412.90	52574.14	3.45	16
2847	1	2019	1	2	297006.34	93950.15	3.16	16
2848	1	2019	2	0	43782.41	17689.00	2.48	16
2849	1	2019	2	1	108581.09	33727.80	3.22	16
2850	1	2019	2	2	152363.50	51416.80	2.96	16
2851	1	2020	1	0	112558.94	36897.00	3.05	16
2852	1	2020	1	1	174230.34	49882.30	3.49	16
2853	1	2020	1	2	286789.28	86779.30	3.30	16
2854	1	2020	2	0	56129.94	21929.24	2.56	16
2855	1	2020	2	1	160411.66	47364.51	3.39	16
2856	1	2020	2	2	216541.60	69293.75	3.12	16
2857	2	1987	1	0	7420.00	3740.00	1.98	16
2858	2	1987	1	1	21410.00	6850.00	3.13	16
2859	2	1987	1	2	28830.00	10590.00	2.72	16
2860	2	1987	2	0	1587.00	770.00	2.06	16
2861	2	1987	2	1	14530.00	5490.00	2.65	16
2862	2	1987	2	2	16117.00	6260.00	2.57	16
2863	2	1988	1	0	6143.00	2710.00	2.27	16
2864	2	1988	1	1	21662.00	7130.00	3.04	16
2865	2	1988	1	2	27805.00	9840.00	2.83	16
2866	2	1988	2	0	2938.00	1750.00	1.68	16
2867	2	1988	2	1	21834.00	7680.00	2.84	16
2868	2	1988	2	2	24772.00	9430.00	2.63	16
2869	2	1989	1	0	4960.00	2590.00	1.92	16
2870	2	1989	1	1	14570.00	5080.00	2.87	16
2871	2	1989	1	2	19530.00	7670.00	2.55	16
2872	2	1989	2	0	4096.00	2400.00	1.71	16
2873	2	1989	2	1	23376.00	7640.00	3.06	16
2874	2	1989	2	2	27472.00	10040.00	2.74	16
2875	2	1990	1	0	6936.00	3360.00	2.06	16
2876	2	1990	1	1	18060.00	5830.00	3.10	16
2877	2	1990	1	2	24996.00	9190.00	2.72	16
2878	2	1990	2	0	2408.00	1680.00	1.43	16
2879	2	1990	2	1	19628.00	6910.00	2.84	16
2880	2	1990	2	2	22036.00	8590.00	2.57	16
2881	2	1991	1	0	5671.00	2700.00	2.10	16
2882	2	1991	1	1	25207.00	7500.00	3.36	16
2883	2	1991	1	2	30878.00	10200.00	3.03	16
2884	2	1991	2	0	4353.00	2710.00	1.61	16
2885	2	1991	2	1	20493.00	7820.00	2.62	16
2886	2	1991	2	2	24846.00	10530.00	2.36	16
2887	2	1992	1	0	8209.00	3580.00	2.29	16
2888	2	1992	1	1	23279.00	8090.00	2.88	16
2889	2	1992	1	2	31488.00	11670.00	2.70	16
2890	2	1992	2	0	1562.00	1110.00	1.41	16
2891	2	1992	2	1	19788.00	8570.00	2.31	16
2892	2	1992	2	2	21350.00	9680.00	2.21	16
2893	2	1993	1	0	3799.00	2420.00	1.57	16
2894	2	1993	1	1	17018.00	6050.00	2.81	16
2895	2	1993	1	2	20817.00	8470.00	2.46	16
2896	2	1993	2	0	725.00	490.00	1.48	16
2897	2	1993	2	1	13768.00	6440.00	2.14	16
2898	2	1993	2	2	14493.00	6930.00	2.09	16
2899	2	1994	1	0	6337.00	3550.00	1.79	16
2900	2	1994	1	1	15725.00	5440.00	2.89	16
2901	2	1994	1	2	22062.00	8990.00	2.45	16
2902	2	1994	2	0	2924.00	1700.00	1.72	16
2903	2	1994	2	1	20090.00	7200.00	2.79	16
2904	2	1994	2	2	23014.00	8900.00	2.59	16
2905	2	1995	1	0	5808.00	3430.00	1.69	16
2906	2	1995	1	1	15024.00	5360.00	2.80	16
2907	2	1995	1	2	20832.00	8790.00	2.37	16
2908	2	1995	2	0	947.00	640.00	1.48	16
2909	2	1995	2	1	14572.00	5880.00	2.48	16
2910	2	1995	2	2	15519.00	6520.00	2.38	16
2911	2	1996	1	0	5683.00	3410.00	1.67	16
2912	2	1996	1	1	15030.00	5680.00	2.65	16
2913	2	1996	1	2	20713.00	9090.00	2.28	16
2914	2	1996	2	0	3729.00	2200.00	1.70	16
2915	2	1996	2	1	16675.00	6250.00	2.67	16
2916	2	1996	2	2	20404.00	8450.00	2.41	16
2917	2	1997	1	0	5403.00	3560.00	1.52	16
2918	2	1997	1	1	18012.00	6100.00	2.95	16
2919	2	1997	1	2	23415.00	9660.00	2.42	16
2920	2	1997	2	0	1813.00	1030.00	1.76	16
2921	2	1997	2	1	11055.00	4320.00	2.56	16
2922	2	1997	2	2	12868.00	5350.00	2.41	16
2923	2	1998	1	0	5115.00	2310.00	2.21	16
2924	2	1998	1	1	14629.00	4510.00	3.24	16
2925	2	1998	1	2	19744.00	6820.00	2.90	16
2926	2	1998	2	0	75.00	60.00	1.25	16
2927	2	1998	2	1	10020.00	5490.00	1.83	16
2928	2	1998	2	2	10095.00	5550.00	1.82	16
2929	2	1999	1	0	5549.00	3520.00	1.58	16
2930	2	1999	1	1	19902.00	6510.00	3.06	16
2931	2	1999	1	2	25451.00	10030.00	2.54	16
2932	2	1999	2	0	6386.00	3530.00	1.81	16
2933	2	1999	2	1	19507.00	6460.00	3.02	16
2934	2	1999	2	2	25893.00	9990.00	2.59	16
2935	2	2000	1	0	6448.00	3900.00	1.65	16
2936	2	2000	1	1	14498.00	6140.00	2.36	16
2937	2	2000	1	2	20946.00	10040.00	2.09	16
2938	2	2000	2	0	4908.00	3300.00	1.49	16
2939	2	2000	2	1	15402.00	5590.00	2.76	16
2940	2	2000	2	2	20310.00	8890.00	2.28	16
2941	2	2001	1	0	8112.00	4360.00	1.86	16
2942	2	2001	1	1	16124.00	5890.00	2.74	16
2943	2	2001	1	2	24236.00	10250.00	2.36	16
2944	2	2001	2	0	3333.00	2150.00	1.55	16
2945	2	2001	2	1	19396.00	6320.00	3.07	16
2946	2	2001	2	2	22729.00	8470.00	2.68	16
2947	2	2002	1	0	7104.00	3910.00	1.82	16
2948	2	2002	1	1	17780.00	5940.00	2.99	16
2949	2	2002	1	2	24884.00	9850.00	2.53	16
2950	2	2002	2	0	2499.00	1470.00	1.70	16
2951	2	2002	2	1	16006.00	5520.00	2.90	16
2952	2	2002	2	2	18505.00	6990.00	2.65	16
2953	2	2003	1	0	5432.00	2880.00	1.89	16
2954	2	2003	1	1	18450.00	5917.00	3.12	16
2955	2	2003	1	2	23882.00	8797.00	2.71	16
2956	2	2003	2	0	1948.00	1158.00	1.68	16
2957	2	2003	2	1	14230.00	5160.00	2.76	16
2958	2	2003	2	2	16178.00	6318.00	2.56	16
2959	2	2004	1	0	9792.00	4110.00	2.38	16
2960	2	2004	1	1	23006.00	6396.00	3.60	16
2961	2	2004	1	2	32798.00	10506.00	3.12	16
2962	2	2004	2	0	3910.00	1994.00	1.96	16
2963	2	2004	2	1	22599.00	7130.00	3.17	16
2964	2	2004	2	2	26509.00	9124.00	2.91	16
2965	2	2005	1	0	10740.00	4096.00	2.62	16
2966	2	2005	1	1	23950.00	6478.00	3.70	16
2967	2	2005	1	2	34690.00	10574.00	3.28	16
2968	2	2005	2	0	7445.00	3555.00	2.09	16
2969	2	2005	2	1	24244.00	6921.00	3.50	16
2970	2	2005	2	2	31689.00	10476.00	3.02	16
2971	2	2006	1	0	10822.00	4092.00	2.64	16
2972	2	2006	1	1	26524.00	6800.00	3.90	16
2973	2	2006	1	2	37346.00	10892.00	3.43	16
2974	2	2006	2	0	6007.00	3010.00	2.00	16
2975	2	2006	2	1	20370.00	6516.00	3.13	16
2976	2	2006	2	2	26377.00	9526.00	2.77	16
2977	2	2007	1	0	9136.00	4060.00	2.25	16
2978	2	2007	1	1	24321.00	6750.00	3.60	16
2979	2	2007	1	2	33457.00	10810.00	3.10	16
2980	2	2007	2	0	5953.00	2465.00	2.42	16
2981	2	2007	2	1	24672.00	6195.00	3.98	16
2982	2	2007	2	2	30625.00	8660.00	3.54	16
2983	2	2008	1	0	9208.00	4342.00	2.12	16
2984	2	2008	1	1	18120.00	5915.00	3.06	16
2985	2	2008	1	2	27328.00	10257.00	2.66	16
2986	2	2008	2	0	12805.00	3720.00	3.44	16
2987	2	2008	2	1	27588.00	6837.00	4.04	16
2988	2	2008	2	2	40393.00	10557.00	3.83	16
2989	2	2009	1	0	11467.00	3774.00	3.04	16
2990	2	2009	1	1	24223.00	6332.00	3.83	16
2991	2	2009	1	2	35690.00	10106.00	3.53	16
2992	2	2009	2	0	11212.00	3794.00	2.96	16
2993	2	2009	2	1	24185.00	6771.00	3.57	16
2994	2	2009	2	2	35397.00	10565.00	3.35	16
2995	2	2010	1	0	10574.00	3867.00	2.73	16
2996	2	2010	1	1	27047.00	6864.00	3.94	16
2997	2	2010	1	2	37621.00	10731.00	3.51	16
2998	2	2010	2	0	9560.00	3394.00	2.82	16
2999	2	2010	2	1	25634.00	6861.00	3.74	16
3000	2	2010	2	2	35194.00	10255.00	3.43	16
3001	2	2011	1	0	12246.00	3884.00	3.15	16
3002	2	2011	1	1	26729.00	6841.00	3.91	16
3003	2	2011	1	2	38975.00	10725.00	3.63	16
3004	2	2011	2	0	13100.00	3879.00	3.38	16
3005	2	2011	2	1	25113.00	6824.00	3.68	16
3006	2	2011	2	2	38213.00	10703.00	3.57	16
3007	2	2012	1	0	12424.00	3884.00	3.20	16
3008	2	2012	1	1	26152.00	6862.00	3.81	16
3009	2	2012	1	2	38576.00	10746.00	3.59	16
3010	2	2012	2	0	16738.00	4798.00	3.49	16
3011	2	2012	2	1	30212.00	7977.00	3.79	16
3012	2	2012	2	2	46950.00	12775.00	3.68	16
3013	2	2013	1	0	13857.00	4489.00	3.09	16
3014	2	2013	1	1	27951.00	7128.00	3.92	16
3015	2	2013	1	2	41808.00	11617.00	3.60	16
3016	2	2013	2	0	16405.00	4805.00	3.41	16
3017	2	2013	2	1	34198.00	8947.00	3.82	16
3018	2	2013	2	2	50603.00	13752.00	3.68	16
3019	2	2014	1	0	18173.00	5720.00	3.18	16
3020	2	2014	1	1	29835.00	7354.00	4.06	16
3021	2	2014	1	2	48008.00	13074.00	3.67	16
3022	2	2014	2	0	16298.00	4555.00	3.58	16
3023	2	2014	2	1	31478.00	7864.00	4.00	16
3024	2	2014	2	2	47776.00	12419.00	3.85	16
3025	2	2015	1	0	18123.00	5280.00	3.43	16
3026	2	2015	1	1	29637.00	7164.00	4.14	16
3027	2	2015	1	2	47760.00	12444.00	3.84	16
3028	2	2015	2	0	11567.00	3145.00	3.68	16
3029	2	2015	2	1	30288.00	7427.00	4.08	16
3030	2	2015	2	2	41855.00	10572.00	3.96	16
3031	2	2016	1	0	14278.00	4614.00	3.09	16
3032	2	2016	1	1	27692.00	7075.00	3.91	16
3033	2	2016	1	2	41970.00	11689.00	3.59	16
3034	2	2016	2	0	15333.00	4229.00	3.63	16
3035	2	2016	2	1	32606.00	7949.00	4.10	16
3036	2	2016	2	2	47939.00	12178.00	3.94	16
3037	2	2017	1	0	22874.00	6442.00	3.55	16
3038	2	2017	1	1	30415.00	7197.00	4.23	16
3039	2	2017	1	2	53289.00	13639.00	3.91	16
3040	2	2017	2	0	14594.00	3839.00	3.80	16
3041	2	2017	2	1	39216.00	9175.00	4.27	16
3042	2	2017	2	2	53810.00	13014.00	4.13	16
3043	2	2018	1	0	24259.00	6452.00	3.76	16
3044	2	2018	1	1	35043.00	7544.00	4.65	16
3045	2	2018	1	2	59302.00	13996.00	4.24	16
3046	2	2018	2	0	13996.58	3463.00	4.04	16
3047	2	2018	2	1	37551.40	7985.00	4.70	16
3048	2	2018	2	2	51547.98	11448.00	4.50	16
3049	2	2019	1	0	15586.68	4723.00	3.30	16
3050	2	2019	1	1	31238.24	7260.00	4.30	16
3051	2	2019	1	2	46824.92	11983.00	3.91	16
3052	2	2019	2	0	14556.00	3587.00	4.06	16
3053	2	2019	2	1	32077.00	6863.00	4.67	16
3054	2	2019	2	2	46633.00	10450.00	4.46	16
3055	2	2020	1	0	21289.70	5633.00	3.78	16
3056	2	2020	1	1	33616.91	6703.00	5.02	16
3057	2	2020	1	2	54906.61	12336.00	4.45	16
3058	2	2020	2	0	16250.15	4187.00	3.88	16
3059	2	2020	2	1	37355.31	8070.00	4.63	16
3060	2	2020	2	2	53605.46	12257.00	4.37	16
3061	1	1987	1	0	47050.00	29260.00	1.61	17
3062	1	1987	1	1	107255.00	42170.00	2.54	17
3063	1	1987	1	2	154305.00	71430.00	2.16	17
3064	1	1987	2	0	196545.00	86690.00	2.27	17
3065	1	1987	2	1	103286.00	41870.00	2.47	17
3066	1	1987	2	2	299831.00	128560.00	2.33	17
3067	1	1988	1	0	53142.00	30240.00	1.76	17
3068	1	1988	1	1	135322.00	42960.00	3.15	17
3069	1	1988	1	2	188464.00	73200.00	2.57	17
3070	1	1988	2	0	203450.00	82560.00	2.46	17
3071	1	1988	2	1	155903.00	53050.00	2.94	17
3072	1	1988	2	2	359353.00	135610.00	2.65	17
3073	1	1989	1	0	57397.00	31250.00	1.84	17
3074	1	1989	1	1	152401.00	45500.00	3.35	17
3075	1	1989	1	2	209798.00	76750.00	2.73	17
3076	1	1989	2	0	167831.00	76220.00	2.20	17
3077	1	1989	2	1	153947.00	57510.00	2.68	17
3078	1	1989	2	2	321778.00	133730.00	2.41	17
3079	1	1990	1	0	29990.00	22180.00	1.35	17
3080	1	1990	1	1	105017.00	38870.00	2.70	17
3081	1	1990	1	2	135007.00	61050.00	2.21	17
3082	1	1990	2	0	190488.00	82360.00	2.31	17
3083	1	1990	2	1	157614.00	53950.00	2.92	17
3084	1	1990	2	2	348102.00	136310.00	2.55	17
3085	1	1991	1	0	55068.00	27330.00	2.01	17
3086	1	1991	1	1	150553.00	50700.00	2.97	17
3087	1	1991	1	2	205621.00	78030.00	2.64	17
3088	1	1991	2	0	205036.00	85610.00	2.40	17
3089	1	1991	2	1	211195.00	70430.00	3.00	17
3090	1	1991	2	2	416231.00	156040.00	2.67	17
3091	1	1992	1	0	42344.00	22200.00	1.91	17
3092	1	1992	1	1	147799.00	52820.00	2.80	17
3093	1	1992	1	2	190143.00	75020.00	2.53	17
3094	1	1992	2	0	195523.00	86220.00	2.27	17
3095	1	1992	2	1	185920.00	66460.00	2.80	17
3096	1	1992	2	2	381443.00	152680.00	2.50	17
3097	1	1993	1	0	29517.00	19110.00	1.54	17
3098	1	1993	1	1	165139.00	54240.00	3.04	17
3099	1	1993	1	2	194656.00	73350.00	2.65	17
3100	1	1993	2	0	189913.00	82730.00	2.30	17
3101	1	1993	2	1	191352.00	65660.00	2.91	17
3102	1	1993	2	2	381265.00	148390.00	2.57	17
3103	1	1994	1	0	93761.00	44770.00	2.09	17
3104	1	1994	1	1	167887.00	52510.00	3.20	17
3105	1	1994	1	2	261648.00	97280.00	2.69	17
3106	1	1994	2	0	196097.00	93820.00	2.09	17
3107	1	1994	2	1	181287.00	59030.00	3.07	17
3108	1	1994	2	2	377384.00	152850.00	2.47	17
3109	1	1995	1	0	64916.00	36010.00	1.80	17
3110	1	1995	1	1	167692.00	55900.00	3.00	17
3111	1	1995	1	2	232608.00	91910.00	2.53	17
3112	1	1995	2	0	190265.00	94278.00	2.02	17
3113	1	1995	2	1	170412.00	61040.00	2.79	17
3114	1	1995	2	2	360677.00	155318.00	2.32	17
3115	1	1996	1	0	68854.00	33856.00	2.03	17
3116	1	1996	1	1	183190.00	58055.00	3.16	17
3117	1	1996	1	2	252044.00	91911.00	2.74	17
3118	1	1996	2	0	172775.00	83512.00	2.07	17
3119	1	1996	2	1	178744.00	66316.00	2.70	17
3120	1	1996	2	2	351519.00	149828.00	2.35	17
3121	1	1997	1	0	68128.00	36898.00	1.85	17
3122	1	1997	1	1	182235.00	58305.00	3.13	17
3123	1	1997	1	2	250363.00	95203.00	2.63	17
3124	1	1997	2	0	187339.00	79038.00	2.37	17
3125	1	1997	2	1	209610.00	70266.00	2.98	17
3126	1	1997	2	2	396949.00	149304.00	2.66	17
3127	1	1998	1	0	44549.00	30209.00	1.47	17
3128	1	1998	1	1	153187.00	54533.00	2.81	17
3129	1	1998	1	2	197736.00	84742.00	2.33	17
3130	1	1998	2	0	136661.00	63775.00	2.14	17
3131	1	1998	2	1	174297.00	61967.00	2.81	17
3132	1	1998	2	2	310958.00	125742.00	2.47	17
3133	1	1999	1	0	82277.00	35816.00	2.30	17
3134	1	1999	1	1	184152.00	57357.00	3.21	17
3135	1	1999	1	2	266429.00	93173.00	2.86	17
3136	1	1999	2	0	207972.00	80726.00	2.58	17
3137	1	1999	2	1	235080.00	72401.00	3.25	17
3138	1	1999	2	2	443052.00	153127.00	2.89	17
3139	1	2000	1	0	88179.00	37791.00	2.33	17
3140	1	2000	1	1	206668.00	62104.00	3.33	17
3141	1	2000	1	2	294847.00	99895.00	2.95	17
3142	1	2000	2	0	225529.00	84825.00	2.66	17
3143	1	2000	2	1	238343.00	72515.00	3.29	17
3144	1	2000	2	2	463872.00	157340.00	2.95	17
3145	1	2001	1	0	92144.00	38323.00	2.40	17
3146	1	2001	1	1	206181.00	61326.00	3.36	17
3147	1	2001	1	2	298325.00	99649.00	2.99	17
3148	1	2001	2	0	218876.00	84086.00	2.60	17
3149	1	2001	2	1	228768.00	71285.00	3.21	17
3150	1	2001	2	2	447644.00	155371.00	2.88	17
3151	1	2002	1	0	95356.00	38081.00	2.50	17
3152	1	2002	1	1	197194.00	59951.00	3.29	17
3153	1	2002	1	2	292550.00	98032.00	2.98	17
3154	1	2002	2	0	245047.00	82744.00	2.96	17
3155	1	2002	2	1	262030.00	74102.00	3.54	17
3156	1	2002	2	2	507077.00	156846.00	3.23	17
3157	1	2003	1	0	86762.00	37000.00	2.34	17
3158	1	2003	1	1	201764.00	61104.00	3.30	17
3159	1	2003	1	2	288526.00	98104.00	2.94	17
3160	1	2003	2	0	244338.00	78689.00	3.11	17
3161	1	2003	2	1	285318.00	77882.00	3.66	17
3162	1	2003	2	2	529656.00	156571.00	3.38	17
3163	1	2004	1	0	94924.00	36718.00	2.59	17
3164	1	2004	1	1	205258.00	58902.00	3.48	17
3165	1	2004	1	2	300182.00	95620.00	3.14	17
3166	1	2004	2	0	229851.00	72628.00	3.16	17
3167	1	2004	2	1	269735.00	74371.00	3.63	17
3168	1	2004	2	2	499586.00	146999.00	3.40	17
3169	1	2005	1	0	91442.00	34140.00	2.68	17
3170	1	2005	1	1	208721.00	57685.00	3.62	17
3171	1	2005	1	2	300163.00	91825.00	3.27	17
3172	1	2005	2	0	206248.00	66266.00	3.11	17
3173	1	2005	2	1	278898.00	72716.00	3.84	17
3174	1	2005	2	2	485146.00	138982.00	3.49	17
3175	1	2006	1	0	92298.00	33476.00	2.76	17
3176	1	2006	1	1	227457.00	58028.00	3.92	17
3177	1	2006	1	2	319755.00	91504.00	3.49	17
3178	1	2006	2	0	213312.00	70834.00	3.01	17
3179	1	2006	2	1	296800.00	76057.00	3.90	17
3180	1	2006	2	2	510112.00	146891.00	3.47	17
3181	1	2007	1	0	100072.00	35751.00	2.80	17
3182	1	2007	1	1	240281.00	60722.00	3.96	17
3183	1	2007	1	2	340353.00	96473.00	3.53	17
3184	1	2007	2	0	225066.00	72575.00	3.10	17
3185	1	2007	2	1	311761.00	78755.00	3.96	17
3186	1	2007	2	2	536827.00	151330.00	3.55	17
3187	1	2008	1	0	94952.00	35191.00	2.70	17
3188	1	2008	1	1	231642.00	64016.00	3.62	17
3189	1	2008	1	2	326594.00	99207.00	3.29	17
3190	1	2008	2	0	231766.00	73609.00	3.15	17
3191	1	2008	2	1	304855.00	81587.00	3.74	17
3192	1	2008	2	2	536621.00	155196.00	3.46	17
3193	1	2009	1	0	87548.00	33735.00	2.60	17
3194	1	2009	1	1	252719.00	72472.00	3.49	17
3195	1	2009	1	2	340267.00	106207.00	3.20	17
3196	1	2009	2	0	246967.00	75053.00	3.29	17
3197	1	2009	2	1	343440.00	90641.00	3.79	17
3198	1	2009	2	2	590407.00	165694.00	3.56	17
3199	1	2010	1	0	63493.00	30211.00	2.10	17
3200	1	2010	1	1	242514.00	73464.00	3.30	17
3201	1	2010	1	2	306007.00	103675.00	2.95	17
3202	1	2010	2	0	199524.00	66161.00	3.02	17
3203	1	2010	2	1	352001.00	92548.00	3.80	17
3204	1	2010	2	2	551525.00	158709.00	3.48	17
3205	1	2011	1	0	92535.00	31565.00	2.93	17
3206	1	2011	1	1	298764.00	81729.00	3.66	17
3207	1	2011	1	2	391299.00	113294.00	3.45	17
3208	1	2011	2	0	223061.00	64434.00	3.46	17
3209	1	2011	2	1	367309.00	93023.00	3.95	17
3210	1	2011	2	2	590370.00	157457.00	3.75	17
3211	1	2012	1	0	93197.00	30705.00	3.04	17
3212	1	2012	1	1	326531.00	83990.00	3.89	17
3213	1	2012	1	2	419728.00	114695.00	3.66	17
3214	1	2012	2	0	225837.00	64877.00	3.48	17
3215	1	2012	2	1	385041.00	101176.00	3.81	17
3216	1	2012	2	2	610878.00	166053.00	3.68	17
3217	1	2013	1	0	75688.00	26303.00	2.88	17
3218	1	2013	1	1	328771.00	85295.00	3.85	17
3219	1	2013	1	2	404459.00	111598.00	3.62	17
3220	1	2013	2	0	231852.00	68182.00	3.40	17
3221	1	2013	2	1	397631.00	103176.00	3.85	17
3222	1	2013	2	2	629483.00	171358.00	3.67	17
3223	1	2014	1	0	77494.00	26680.00	2.90	17
3224	1	2014	1	1	353601.00	87399.00	4.05	17
3225	1	2014	1	2	431095.00	114079.00	3.78	17
3226	1	2014	2	0	225045.00	64760.00	3.48	17
3227	1	2014	2	1	425738.00	102081.00	4.17	17
3228	1	2014	2	2	650783.00	166841.00	3.90	17
3229	1	2015	1	0	72670.00	25868.00	2.81	17
3230	1	2015	1	1	369921.00	91973.00	4.02	17
3231	1	2015	1	2	442591.00	117841.00	3.76	17
3232	1	2015	2	0	217591.00	62208.00	3.50	17
3233	1	2015	2	1	421651.00	103537.00	4.07	17
3234	1	2015	2	2	639242.00	165745.00	3.86	17
3235	1	2016	1	0	49556.00	19026.00	2.60	17
3236	1	2016	1	1	316944.00	84964.00	3.73	17
3237	1	2016	1	2	366500.00	103990.00	3.52	17
3238	1	2016	2	0	239305.00	67790.00	3.53	17
3239	1	2016	2	1	474603.00	116062.00	4.09	17
3240	1	2016	2	2	713908.00	183852.00	3.88	17
3241	1	2017	1	0	80982.00	26058.00	3.11	17
3242	1	2017	1	1	387030.00	92748.00	4.17	17
3243	1	2017	1	2	468012.00	118806.00	3.94	17
3244	1	2017	2	0	233367.00	68505.00	3.41	17
3245	1	2017	2	1	458451.00	115136.00	3.98	17
3246	1	2017	2	2	691818.00	183641.00	3.77	17
3247	1	2018	1	0	90670.00	28260.00	3.21	17
3248	1	2018	1	1	399560.00	97537.00	4.10	17
3249	1	2018	1	2	490230.00	125797.00	3.90	17
3250	1	2018	2	0	245274.25	65858.00	3.72	17
3251	1	2018	2	1	495484.12	115135.00	4.30	17
3252	1	2018	2	2	740758.37	180993.00	4.09	17
3253	1	2019	1	0	87535.50	27917.00	3.14	17
3254	1	2019	1	1	349124.14	92093.47	3.79	17
3255	1	2019	1	2	436659.64	120010.47	3.64	17
3256	1	2019	2	0	248988.79	65625.52	3.79	17
3257	1	2019	2	1	509548.57	114267.00	4.46	17
3258	1	2019	2	2	758537.36	179892.52	4.22	17
3259	1	2020	1	0	91984.38	27235.00	3.38	17
3260	1	2020	1	1	391239.44	89545.00	4.37	17
3261	1	2020	1	2	483223.82	116780.00	4.14	17
3262	1	2020	2	0	225140.84	64149.00	3.51	17
3263	1	2020	2	1	474784.66	112311.60	4.23	17
3264	1	2020	2	2	699925.50	176460.60	3.97	17
3265	2	1987	1	0	26580.00	15530.00	1.71	17
3266	2	1987	1	1	68145.00	29340.00	2.32	17
3267	2	1987	1	2	94725.00	44870.00	2.11	17
3268	2	1987	2	0	61178.00	28570.00	2.14	17
3269	2	1987	2	1	112565.00	39760.00	2.83	17
3270	2	1987	2	2	173743.00	68330.00	2.54	17
3271	2	1988	1	0	45024.00	23390.00	1.92	17
3272	2	1988	1	1	105037.00	40940.00	2.57	17
3273	2	1988	1	2	150061.00	64330.00	2.33	17
3274	2	1988	2	0	60620.00	27630.00	2.19	17
3275	2	1988	2	1	122512.00	45210.00	2.71	17
3276	2	1988	2	2	183132.00	72840.00	2.51	17
3277	2	1989	1	0	37178.00	21720.00	1.71	17
3278	2	1989	1	1	103839.00	45430.00	2.29	17
3279	2	1989	1	2	141017.00	67150.00	2.10	17
3280	2	1989	2	0	52434.00	24680.00	2.12	17
3281	2	1989	2	1	123810.00	42590.00	2.91	17
3282	2	1989	2	2	176244.00	67270.00	2.62	17
3283	2	1990	1	0	31188.00	20200.00	1.54	17
3284	2	1990	1	1	134551.00	43540.00	3.09	17
3285	2	1990	1	2	165739.00	63740.00	2.60	17
3286	2	1990	2	0	50988.00	20200.00	2.52	17
3287	2	1990	2	1	106776.00	30570.00	3.49	17
3288	2	1990	2	2	157764.00	50770.00	3.11	17
3289	2	1991	1	0	32618.00	20160.00	1.62	17
3290	2	1991	1	1	119216.00	42260.00	2.82	17
3291	2	1991	1	2	151834.00	62420.00	2.43	17
3292	2	1991	2	0	74113.00	26010.00	2.85	17
3293	2	1991	2	1	111227.00	29580.00	3.76	17
3294	2	1991	2	2	185340.00	55590.00	3.33	17
3295	2	1992	1	0	51539.00	24750.00	2.08	17
3296	2	1992	1	1	107759.00	34890.00	3.09	17
3297	2	1992	1	2	159298.00	59640.00	2.67	17
3298	2	1992	2	0	51769.00	20960.00	2.47	17
3299	2	1992	2	1	111825.00	28390.00	3.94	17
3300	2	1992	2	2	163594.00	49350.00	3.31	17
3301	2	1993	1	0	37307.00	19600.00	1.90	17
3302	2	1993	1	1	101874.00	34540.00	2.95	17
3303	2	1993	1	2	139181.00	54140.00	2.57	17
3304	2	1993	2	0	48361.00	20090.00	2.41	17
3305	2	1993	2	1	85763.00	26250.00	3.27	17
3306	2	1993	2	2	134124.00	46340.00	2.89	17
3307	2	1994	1	0	21085.00	11110.00	1.90	17
3308	2	1994	1	1	95793.00	34520.00	2.78	17
3309	2	1994	1	2	116878.00	45630.00	2.56	17
3310	2	1994	2	0	54639.00	27510.00	1.99	17
3311	2	1994	2	1	121628.00	40370.00	3.01	17
3312	2	1994	2	2	176267.00	67880.00	2.60	17
3313	2	1995	1	0	20576.00	11720.00	1.76	17
3314	2	1995	1	1	128654.00	43450.00	2.96	17
3315	2	1995	1	2	149230.00	55170.00	2.70	17
3316	2	1995	2	0	30702.00	20640.00	1.49	17
3317	2	1995	2	1	89012.00	37600.00	2.37	17
3318	2	1995	2	2	119714.00	58240.00	2.06	17
3319	2	1996	1	0	50870.00	25530.00	1.99	17
3320	2	1996	1	1	90950.00	38450.00	2.37	17
3321	2	1996	1	2	141820.00	63980.00	2.22	17
3322	2	1996	2	0	43040.00	22530.00	1.91	17
3323	2	1996	2	1	102514.00	41630.00	2.46	17
3324	2	1996	2	2	145554.00	64160.00	2.27	17
3325	2	1997	1	0	31711.00	16320.00	1.94	17
3326	2	1997	1	1	114763.00	43380.00	2.65	17
3327	2	1997	1	2	146474.00	59700.00	2.45	17
3328	2	1997	2	0	47374.00	22250.00	2.13	17
3329	2	1997	2	1	125835.00	45220.00	2.78	17
3330	2	1997	2	2	173209.00	67470.00	2.57	17
3331	2	1998	1	0	16509.00	13220.00	1.25	17
3332	2	1998	1	1	107132.00	40380.00	2.65	17
3333	2	1998	1	2	123641.00	53600.00	2.31	17
3334	2	1998	2	0	18295.00	11740.00	1.56	17
3335	2	1998	2	1	78109.00	30570.00	2.56	17
3336	2	1998	2	2	96404.00	42310.00	2.28	17
3337	2	1999	1	0	49498.00	22290.00	2.22	17
3338	2	1999	1	1	115870.00	45630.00	2.54	17
3339	2	1999	1	2	165368.00	67920.00	2.43	17
3340	2	1999	2	0	56698.00	26620.00	2.13	17
3341	2	1999	2	1	124995.00	46100.00	2.71	17
3342	2	1999	2	2	181693.00	72720.00	2.50	17
3343	2	2000	1	0	41859.00	22230.00	1.88	17
3344	2	2000	1	1	129511.00	46100.00	2.81	17
3345	2	2000	1	2	171370.00	68330.00	2.51	17
3346	2	2000	2	0	40671.00	19780.00	2.06	17
3347	2	2000	2	1	118925.00	47600.00	2.50	17
3348	2	2000	2	2	159596.00	67380.00	2.37	17
3349	2	2001	1	0	39986.00	18660.00	2.14	17
3350	2	2001	1	1	126858.00	45200.00	2.81	17
3351	2	2001	1	2	166844.00	63860.00	2.61	17
3352	2	2001	2	0	42621.00	19230.00	2.22	17
3353	2	2001	2	1	138260.00	50840.00	2.72	17
3354	2	2001	2	2	180881.00	70070.00	2.58	17
3355	2	2002	1	0	37969.00	15800.00	2.40	17
3356	2	2002	1	1	154284.00	45200.00	3.41	17
3357	2	2002	1	2	192253.00	61000.00	3.15	17
3358	2	2002	2	0	67152.00	26390.00	2.54	17
3359	2	2002	2	1	126755.00	42640.00	2.97	17
3360	2	2002	2	2	193907.00	69030.00	2.81	17
3361	2	2003	1	0	37827.00	16408.00	2.31	17
3362	2	2003	1	1	130549.00	42244.00	3.09	17
3363	2	2003	1	2	168376.00	58652.00	2.87	17
3364	2	2003	2	0	48257.00	19312.00	2.50	17
3365	2	2003	2	1	164406.00	50114.00	3.28	17
3366	2	2003	2	2	212663.00	69426.00	3.06	17
3367	2	2004	1	0	40141.00	14939.00	2.69	17
3368	2	2004	1	1	197630.00	49120.00	4.02	17
3369	2	2004	1	2	237771.00	64059.00	3.71	17
3370	2	2004	2	0	52062.00	20001.00	2.60	17
3371	2	2004	2	1	211510.00	58426.00	3.62	17
3372	2	2004	2	2	263572.00	78427.00	3.36	17
3373	2	2005	1	0	42682.00	14955.00	2.85	17
3374	2	2005	1	1	229242.00	56690.00	4.04	17
3375	2	2005	1	2	271924.00	71645.00	3.80	17
3376	2	2005	2	0	63986.00	22760.00	2.81	17
3377	2	2005	2	1	188715.00	52082.00	3.62	17
3378	2	2005	2	2	252701.00	74842.00	3.38	17
3379	2	2006	1	0	43474.00	13830.00	3.14	17
3380	2	2006	1	1	219825.00	54791.00	4.01	17
3381	2	2006	1	2	263299.00	68621.00	3.84	17
3382	2	2006	2	0	39945.00	18060.00	2.21	17
3383	2	2006	2	1	161033.00	49596.00	3.25	17
3384	2	2006	2	2	200978.00	67656.00	2.97	17
3385	2	2007	1	0	34492.00	10926.00	3.16	17
3386	2	2007	1	1	255665.00	62135.00	4.11	17
3387	2	2007	1	2	290157.00	73061.00	3.97	17
3388	2	2007	2	0	66562.00	21219.00	3.14	17
3389	2	2007	2	1	204090.00	52982.00	3.85	17
3390	2	2007	2	2	270652.00	74201.00	3.65	17
3391	2	2008	1	0	35689.00	13197.00	2.70	17
3392	2	2008	1	1	200250.00	53510.00	3.74	17
3393	2	2008	1	2	235939.00	66707.00	3.54	17
3394	2	2008	2	0	71817.00	21219.00	3.38	17
3395	2	2008	2	1	219180.00	55869.00	3.92	17
3396	2	2008	2	2	290997.00	77088.00	3.77	17
3397	2	2009	1	0	54542.00	19375.00	2.82	17
3398	2	2009	1	1	211763.00	55521.00	3.81	17
3399	2	2009	1	2	266305.00	74896.00	3.56	17
3400	2	2009	2	0	60010.00	21841.00	2.75	17
3401	2	2009	2	1	208775.00	61611.00	3.39	17
3402	2	2009	2	2	268785.00	83452.00	3.22	17
3403	2	2010	1	0	31941.00	12607.00	2.53	17
3404	2	2010	1	1	218766.00	61624.00	3.55	17
3405	2	2010	1	2	250707.00	74231.00	3.38	17
3406	2	2010	2	0	74661.00	21669.00	3.45	17
3407	2	2010	2	1	242959.00	62970.00	3.86	17
3408	2	2010	2	2	317620.00	84639.00	3.75	17
3409	2	2011	1	0	55369.00	17287.00	3.20	17
3410	2	2011	1	1	225281.00	59242.00	3.80	17
3411	2	2011	1	2	280650.00	76529.00	3.67	17
3412	2	2011	2	0	70450.00	25023.00	2.82	17
3413	2	2011	2	1	169222.00	49100.00	3.45	17
3414	2	2011	2	2	239672.00	74123.00	3.23	17
3415	2	2012	1	0	54838.00	17145.00	3.20	17
3416	2	2012	1	1	223986.00	59459.00	3.77	17
3417	2	2012	1	2	278824.00	76604.00	3.64	17
3418	2	2012	2	0	73947.00	23294.00	3.17	17
3419	2	2012	2	1	210978.00	56414.00	3.74	17
3420	2	2012	2	2	284925.00	79708.00	3.57	17
3421	2	2013	1	0	65404.80	21425.00	3.05	17
3422	2	2013	1	1	236554.00	59490.00	3.98	17
3423	2	2013	1	2	301958.80	80915.00	3.73	17
3424	2	2013	2	0	71879.00	21055.00	3.41	17
3425	2	2013	2	1	227642.00	57135.00	3.98	17
3426	2	2013	2	2	299521.00	78190.00	3.83	17
3427	2	2014	1	0	55289.00	16840.00	3.28	17
3428	2	2014	1	1	243714.00	59460.00	4.10	17
3429	2	2014	1	2	299003.00	76300.00	3.92	17
3430	2	2014	2	0	67211.00	18330.00	3.67	17
3431	2	2014	2	1	217583.00	51343.00	4.24	17
3432	2	2014	2	2	284794.00	69673.00	4.09	17
3433	2	2015	1	0	57973.00	18092.00	3.20	17
3434	2	2015	1	1	246113.00	61131.00	4.03	17
3435	2	2015	1	2	304086.00	79223.00	3.84	17
3436	2	2015	2	0	71437.00	21945.00	3.26	17
3437	2	2015	2	1	283025.00	70076.00	4.04	17
3438	2	2015	2	2	354462.00	92021.00	3.85	17
3439	2	2016	1	0	78899.00	23244.00	3.39	17
3440	2	2016	1	1	246431.00	61131.00	4.03	17
3441	2	2016	1	2	325330.00	84375.00	3.86	17
3442	2	2016	2	0	65526.00	20853.00	3.14	17
3443	2	2016	2	1	275557.00	75355.00	3.66	17
3444	2	2016	2	2	341083.00	96208.00	3.55	17
3445	2	2017	1	0	68974.00	21032.00	3.28	17
3446	2	2017	1	1	248472.00	62698.00	3.96	17
3447	2	2017	1	2	317446.00	83730.00	3.79	17
3448	2	2017	2	0	75296.00	23086.00	3.26	17
3449	2	2017	2	1	290643.00	76015.00	3.82	17
3450	2	2017	2	2	365939.00	99101.00	3.69	17
3451	2	2018	1	0	71027.00	21551.00	3.30	17
3452	2	2018	1	1	255259.00	63172.00	4.04	17
3453	2	2018	1	2	326286.00	84723.00	3.85	17
3454	2	2018	2	0	72226.00	21300.00	3.39	17
3455	2	2018	2	1	291210.00	73077.00	3.98	17
3456	2	2018	2	2	363436.00	94377.00	3.85	17
3457	2	2019	1	0	55459.00	20225.00	2.74	17
3458	2	2019	1	1	222060.00	63873.00	3.48	17
3459	2	2019	1	2	277519.00	84098.00	3.30	17
3460	2	2019	2	0	69002.00	22315.00	3.09	17
3461	2	2019	2	1	266466.00	68007.00	3.92	17
3462	2	2019	2	2	335468.00	90322.00	3.71	17
3463	2	2020	1	0	86952.00	25737.00	3.38	17
3464	2	2020	1	1	230338.00	56186.00	4.10	17
3465	2	2020	1	2	317290.00	81923.00	3.87	17
3466	2	2020	2	0	79846.00	23731.00	3.36	17
3467	2	2020	2	1	253270.00	67370.00	3.76	17
3468	2	2020	2	2	333116.00	91101.00	3.66	17
3469	2	1987	1	0	\N	\N	\N	18
3470	2	1987	1	1	1060.00	460.00	2.30	18
3471	2	1987	1	2	1060.00	460.00	2.30	18
3472	2	1987	2	0	\N	\N	\N	18
3473	2	1987	2	1	1581.00	520.00	3.04	18
3474	2	1987	2	2	1581.00	520.00	3.04	18
3475	2	1988	1	0	\N	\N	\N	18
3476	2	1988	1	1	1057.00	500.00	2.11	18
3477	2	1988	1	2	1057.00	500.00	2.11	18
3478	2	1988	2	0	\N	\N	\N	18
3479	2	1988	2	1	1610.00	420.00	3.83	18
3480	2	1988	2	2	1610.00	420.00	3.83	18
3481	2	1989	1	0	\N	\N	\N	18
3482	2	1989	1	1	843.00	260.00	3.24	18
3483	2	1989	1	2	843.00	260.00	3.24	18
3484	2	1989	2	0	\N	\N	\N	18
3485	2	1989	2	1	1338.00	460.00	2.91	18
3486	2	1989	2	2	1338.00	460.00	2.91	18
3487	2	1990	1	0	\N	\N	\N	18
3488	2	1990	1	1	1064.00	390.00	2.73	18
3489	2	1990	1	2	1064.00	390.00	2.73	18
3490	2	1990	2	0	\N	\N	\N	18
3491	2	1990	2	1	967.00	320.00	3.02	18
3492	2	1990	2	2	967.00	320.00	3.02	18
3493	2	1991	1	0	\N	\N	\N	18
3494	2	1991	1	1	965.00	280.00	3.45	18
3495	2	1991	1	2	965.00	280.00	3.45	18
3496	2	1991	2	0	\N	\N	\N	18
3497	2	1991	2	1	1042.00	340.00	3.06	18
3498	2	1991	2	2	1042.00	340.00	3.06	18
3499	2	1992	1	0	\N	\N	\N	18
3500	2	1992	1	1	521.00	200.00	2.61	18
3501	2	1992	1	2	521.00	200.00	2.61	18
3502	2	1992	2	0	\N	\N	\N	18
3503	2	1992	2	1	133.00	60.00	2.22	18
3504	2	1992	2	2	133.00	60.00	2.22	18
3505	2	1993	1	0	\N	\N	\N	18
3506	2	1993	1	1	504.00	170.00	2.96	18
3507	2	1993	1	2	504.00	170.00	2.96	18
3508	2	1993	2	0	\N	\N	\N	18
3509	2	1993	2	1	1076.00	310.00	3.47	18
3510	2	1993	2	2	1076.00	310.00	3.47	18
3511	2	1994	1	0	\N	\N	\N	18
3512	2	1994	1	1	1366.00	500.00	2.73	18
3513	2	1994	1	2	1366.00	500.00	2.73	18
3514	2	1994	2	0	\N	\N	\N	18
3515	2	1994	2	1	966.00	460.00	2.10	18
3516	2	1994	2	2	966.00	460.00	2.10	18
3517	2	1995	1	0	\N	\N	\N	18
3518	2	1995	1	1	962.00	375.00	2.57	18
3519	2	1995	1	2	962.00	375.00	2.57	18
3520	2	1995	2	0	\N	\N	\N	18
3521	2	1995	2	1	1689.00	458.00	3.69	18
3522	2	1995	2	2	1689.00	458.00	3.69	18
3523	2	1996	1	0	\N	\N	\N	18
3524	2	1996	1	1	938.00	390.00	2.41	18
3525	2	1996	1	2	938.00	390.00	2.41	18
3526	2	1996	2	0	\N	\N	\N	18
3527	2	1996	2	1	1028.00	353.00	2.91	18
3528	2	1996	2	2	1028.00	353.00	2.91	18
3529	2	1997	1	0	\N	\N	\N	18
3530	2	1997	1	1	1167.00	383.00	3.05	18
3531	2	1997	1	2	1167.00	383.00	3.05	18
3532	2	1997	2	0	\N	\N	\N	18
3533	2	1997	2	1	1111.00	391.00	2.84	18
3534	2	1997	2	2	1111.00	391.00	2.84	18
3535	2	1998	1	0	\N	\N	\N	18
3536	2	1998	1	1	965.00	317.00	3.04	18
3537	2	1998	1	2	965.00	317.00	3.04	18
3538	2	1998	2	0	\N	\N	\N	18
3539	2	1998	2	1	820.00	296.00	2.77	18
3540	2	1998	2	2	820.00	296.00	2.77	18
3541	2	1999	1	0	\N	\N	\N	18
3542	2	1999	1	1	1016.00	311.00	3.27	18
3543	2	1999	1	2	1016.00	311.00	3.27	18
3544	2	1999	2	0	\N	\N	\N	18
3545	2	1999	2	1	1480.00	445.00	3.33	18
3546	2	1999	2	2	1480.00	445.00	3.33	18
3547	2	2000	1	0	\N	\N	\N	18
3548	2	2000	1	1	1034.00	305.00	3.39	18
3549	2	2000	1	2	1034.00	305.00	3.39	18
3550	2	2000	2	0	7.00	10.00	0.70	18
3551	2	2000	2	1	1094.00	346.00	3.16	18
3552	2	2000	2	2	1101.00	356.00	3.09	18
3553	2	2001	1	0	\N	\N	\N	18
3554	2	2001	1	1	1002.00	300.00	3.34	18
3555	2	2001	1	2	1002.00	300.00	3.34	18
3556	2	2001	2	0	18.00	10.00	1.80	18
3557	2	2001	2	1	811.00	265.00	3.06	18
3558	2	2001	2	2	829.00	275.00	3.01	18
3559	2	2002	1	0	\N	\N	\N	18
3560	2	2002	1	1	774.00	233.00	3.32	18
3561	2	2002	1	2	774.00	233.00	3.32	18
3562	2	2002	2	0	9.00	5.00	1.80	18
3563	2	2002	2	1	749.00	238.00	3.15	18
3564	2	2002	2	2	758.00	243.00	3.12	18
3565	2	2003	1	0	\N	\N	\N	18
3566	2	2003	1	1	868.00	241.00	3.60	18
3567	2	2003	1	2	868.00	241.00	3.60	18
3568	2	2003	2	0	9.00	5.00	1.80	18
3569	2	2003	2	1	815.00	261.00	3.12	18
3570	2	2003	2	2	824.00	266.00	3.10	18
3571	2	2004	1	0	\N	\N	\N	18
3572	2	2004	1	1	867.00	253.00	3.43	18
3573	2	2004	1	2	867.00	253.00	3.43	18
3574	2	2004	2	0	12.00	6.00	2.00	18
3575	2	2004	2	1	856.00	251.00	3.41	18
3576	2	2004	2	2	868.00	257.00	3.38	18
3577	2	2005	1	0	4.00	2.00	2.00	18
3578	2	2005	1	1	891.00	245.00	3.64	18
3579	2	2005	1	2	895.00	247.00	3.62	18
3580	2	2005	2	0	7.00	4.00	1.75	18
3581	2	2005	2	1	680.00	212.00	3.21	18
3582	2	2005	2	2	687.00	216.00	3.18	18
3583	2	2006	1	0	1.00	1.00	1.00	18
3584	2	2006	1	1	1013.00	279.00	3.63	18
3585	2	2006	1	2	1014.00	280.00	3.62	18
3586	2	2006	2	0	6.00	4.00	1.50	18
3587	2	2006	2	1	926.00	270.00	3.43	18
3588	2	2006	2	2	932.00	274.00	3.40	18
3589	2	2007	1	0	3.00	2.00	1.50	18
3590	2	2007	1	1	1071.00	282.00	3.80	18
3591	2	2007	1	2	1074.00	284.00	3.78	18
3592	2	2007	2	0	4.00	3.00	1.33	18
3593	2	2007	2	1	995.00	270.00	3.69	18
3594	2	2007	2	2	999.00	273.00	3.66	18
3595	2	2008	1	0	2.00	1.00	2.00	18
3596	2	2008	1	1	1095.00	292.00	3.75	18
3597	2	2008	1	2	1097.00	293.00	3.74	18
3598	2	2008	2	0	7.00	7.00	1.00	18
3599	2	2008	2	1	1181.00	306.00	3.86	18
3600	2	2008	2	2	1188.00	313.00	3.80	18
3601	2	2009	1	0	1.00	1.00	1.00	18
3602	2	2009	1	1	1090.00	292.00	3.73	18
3603	2	2009	1	2	1091.00	293.00	3.72	18
3604	2	2009	2	0	4.00	5.00	0.80	18
3605	2	2009	2	1	1179.00	316.00	3.73	18
3606	2	2009	2	2	1183.00	321.00	3.69	18
3607	2	2010	1	0	6.00	3.00	2.00	18
3608	2	2010	1	1	1157.00	308.00	3.76	18
3609	2	2010	1	2	1163.00	311.00	3.74	18
3610	2	2010	2	0	6.00	3.00	2.00	18
3611	2	2010	2	1	1062.00	292.00	3.64	18
3612	2	2010	2	2	1068.00	295.00	3.62	18
3613	2	2011	1	0	6.00	5.00	1.20	18
3614	2	2011	1	1	1167.00	324.00	3.60	18
3615	2	2011	1	2	1173.00	329.00	3.57	18
3616	2	2011	2	0	6.00	6.00	1.00	18
3617	2	2011	2	1	1198.00	302.00	3.97	18
3618	2	2011	2	2	1204.00	308.00	3.91	18
3619	2	2012	1	0	7.00	4.00	1.75	18
3620	2	2012	1	1	1281.00	327.00	3.92	18
3621	2	2012	1	2	1288.00	331.00	3.89	18
3622	2	2012	2	0	5.00	7.00	0.71	18
3623	2	2012	2	1	1180.00	309.00	3.82	18
3624	2	2012	2	2	1185.00	316.00	3.75	18
3625	2	2013	1	0	5.00	5.00	1.00	18
3626	2	2013	1	1	1280.00	330.00	3.88	18
3627	2	2013	1	2	1285.00	335.00	3.84	18
3628	2	2013	2	0	4.00	6.00	0.67	18
3629	2	2013	2	1	1248.00	317.00	3.94	18
3630	2	2013	2	2	1252.00	323.00	3.88	18
3631	2	2014	1	0	2.00	2.00	1.00	18
3632	2	2014	1	1	1302.00	333.00	3.91	18
3633	2	2014	1	2	1304.00	335.00	3.89	18
3634	2	2014	2	0	1.00	1.00	1.00	18
3635	2	2014	2	1	1269.00	315.00	4.03	18
3636	2	2014	2	2	1270.00	316.00	4.02	18
3637	2	2015	1	0	2.00	3.00	0.67	18
3638	2	2015	1	1	1314.00	334.00	3.93	18
3639	2	2015	1	2	1316.00	337.00	3.91	18
3640	2	2015	2	0	1.00	1.00	1.00	18
3641	2	2015	2	1	1306.00	315.00	4.15	18
3642	2	2015	2	2	1307.00	316.00	4.14	18
3643	2	2016	1	0	\N	\N	\N	18
3644	2	2016	1	1	1108.00	290.00	3.82	18
3645	2	2016	1	2	1108.00	290.00	3.82	18
3646	2	2016	2	0	1.00	1.00	1.00	18
3647	2	2016	2	1	1049.00	251.00	4.18	18
3648	2	2016	2	2	1050.00	252.00	4.17	18
3649	2	2017	1	0	0.00	0.00	\N	18
3650	2	2017	1	1	1284.00	363.00	3.54	18
3651	2	2017	1	2	1284.00	363.00	3.54	18
3652	2	2017	2	0	0.00	0.00	\N	18
3653	2	2017	2	1	702.00	229.00	3.07	18
3654	2	2017	2	2	702.00	229.00	3.07	18
3655	2	2018	1	0	0.00	0.00	\N	18
3656	2	2018	1	1	1343.00	330.00	4.07	18
3657	2	2018	1	2	1343.00	330.00	4.07	18
3658	2	2018	2	0	0.00	0.00	\N	18
3659	2	2018	2	1	995.60	249.00	4.00	18
3660	2	2018	2	2	995.60	249.00	4.00	18
3661	2	2019	1	0	0.00	0.00	\N	18
3662	2	2019	1	1	1242.97	304.00	4.09	18
3663	2	2019	1	2	1242.97	304.00	4.09	18
3664	2	2019	2	0	0.00	0.00	\N	18
3665	2	2019	2	1	795.00	199.00	3.99	18
3666	2	2019	2	2	795.00	199.00	3.99	18
3667	2	2020	1	0	0.00	0.00	\N	18
3668	2	2020	1	1	1011.06	286.00	3.54	18
3669	2	2020	1	2	1011.06	286.00	3.54	18
3670	2	2020	2	0	0.00	0.00	\N	18
3671	2	2020	2	1	1122.10	277.00	4.05	18
3672	2	2020	2	2	1122.10	277.00	4.05	18
3673	2	1987	1	0	81330.00	32900.00	2.47	19
3674	2	1987	1	1	19345.00	6820.00	2.84	19
3675	2	1987	1	2	100675.00	39720.00	2.53	19
3676	2	1987	2	0	102857.00	35510.00	2.90	19
3677	2	1987	2	1	22309.00	5960.00	3.74	19
3678	2	1987	2	2	125166.00	41470.00	3.02	19
3679	2	1988	1	0	74171.00	33820.00	2.19	19
3680	2	1988	1	1	17872.00	5830.00	3.07	19
3681	2	1988	1	2	92043.00	39650.00	2.32	19
3682	2	1988	2	0	95160.00	34580.00	2.75	19
3683	2	1988	2	1	26283.00	6730.00	3.91	19
3684	2	1988	2	2	121443.00	41310.00	2.94	19
3685	2	1989	1	0	79267.00	37330.00	2.12	19
3686	2	1989	1	1	19159.00	6920.00	2.77	19
3687	2	1989	1	2	98426.00	44250.00	2.22	19
3688	2	1989	2	0	65900.00	31730.00	2.08	19
3689	2	1989	2	1	26926.00	8020.00	3.36	19
3690	2	1989	2	2	92826.00	39750.00	2.34	19
3691	2	1990	1	0	58110.00	33870.00	1.72	19
3692	2	1990	1	1	13789.00	5570.00	2.48	19
3693	2	1990	1	2	71899.00	39440.00	1.82	19
3694	2	1990	2	0	73817.00	32780.00	2.25	19
3695	2	1990	2	1	29620.00	8300.00	3.57	19
3696	2	1990	2	2	103437.00	41080.00	2.52	19
3697	2	1991	1	0	73888.00	34740.00	2.13	19
3698	2	1991	1	1	19284.00	7700.00	2.50	19
3699	2	1991	1	2	93172.00	42440.00	2.20	19
3700	2	1991	2	0	90727.00	32840.00	2.76	19
3701	2	1991	2	1	27752.00	7480.00	3.71	19
3702	2	1991	2	2	118479.00	40320.00	2.94	19
3703	2	1992	1	0	79348.00	33010.00	2.40	19
3704	2	1992	1	1	23657.00	7720.00	3.06	19
3705	2	1992	1	2	103005.00	40730.00	2.53	19
3706	2	1992	2	0	85336.00	31880.00	2.68	19
3707	2	1992	2	1	27447.00	7760.00	3.54	19
3708	2	1992	2	2	112783.00	39640.00	2.85	19
3709	2	1993	1	0	109784.00	35680.00	3.08	19
3710	2	1993	1	1	25465.00	7940.00	3.21	19
3711	2	1993	1	2	135249.00	43620.00	3.10	19
3712	2	1993	2	0	82430.00	31470.00	2.62	19
3713	2	1993	2	1	27251.00	7910.00	3.45	19
3714	2	1993	2	2	109681.00	39380.00	2.79	19
3715	2	1994	1	0	75970.00	34550.00	2.20	19
3716	2	1994	1	1	26519.00	9180.00	2.89	19
3717	2	1994	1	2	102489.00	43730.00	2.34	19
3718	2	1994	2	0	89986.00	39320.00	2.29	19
3719	2	1994	2	1	31154.00	9190.00	3.39	19
3720	2	1994	2	2	121140.00	48510.00	2.50	19
3721	2	1995	1	0	85670.00	35810.00	2.39	19
3722	2	1995	1	1	28620.00	9540.00	3.00	19
3723	2	1995	1	2	114290.00	45350.00	2.52	19
3724	2	1995	2	0	94081.00	37840.00	2.49	19
3725	2	1995	2	1	31450.00	9380.00	3.35	19
3726	2	1995	2	2	125531.00	47220.00	2.66	19
3727	2	1996	1	0	76425.00	41050.00	1.86	19
3728	2	1996	1	1	28762.00	11490.00	2.50	19
3729	2	1996	1	2	105187.00	52540.00	2.00	19
3730	2	1996	2	0	100090.00	38902.00	2.57	19
3731	2	1996	2	1	33579.00	9870.00	3.40	19
3732	2	1996	2	2	133669.00	48772.00	2.74	19
3733	2	1997	1	0	70553.00	37328.00	1.89	19
3734	2	1997	1	1	23246.00	8739.00	2.66	19
3735	2	1997	1	2	93799.00	46067.00	2.04	19
3736	2	1997	2	0	90637.00	42862.00	2.11	19
3737	2	1997	2	1	28478.00	10102.00	2.82	19
3738	2	1997	2	2	119115.00	52964.00	2.25	19
3739	2	1998	1	0	69729.00	36859.00	1.89	19
3740	2	1998	1	1	18451.00	7568.00	2.44	19
3741	2	1998	1	2	88180.00	44427.00	1.98	19
3742	2	1998	2	0	95307.00	40908.00	2.33	19
3743	2	1998	2	1	25462.00	7941.00	3.21	19
3744	2	1998	2	2	120769.00	48849.00	2.47	19
3745	2	1999	1	0	95883.00	43430.00	2.21	19
3746	2	1999	1	1	36707.00	11925.00	3.08	19
3747	2	1999	1	2	132590.00	55355.00	2.40	19
3748	2	1999	2	0	84444.00	40426.00	2.09	19
3749	2	1999	2	1	31916.00	10435.00	3.06	19
3750	2	1999	2	2	116360.00	50861.00	2.29	19
3751	2	2000	1	0	94649.00	47669.00	1.99	19
3752	2	2000	1	1	34469.00	12055.00	2.86	19
3753	2	2000	1	2	129118.00	59724.00	2.16	19
3754	2	2000	2	0	95034.00	41993.00	2.26	19
3755	2	2000	2	1	34334.00	11207.00	3.06	19
3756	2	2000	2	2	129368.00	53200.00	2.43	19
3757	2	2001	1	0	82050.00	43231.00	1.90	19
3758	2	2001	1	1	31012.00	11222.00	2.76	19
3759	2	2001	1	2	113062.00	54453.00	2.08	19
3760	2	2001	2	0	109107.00	46225.00	2.36	19
3761	2	2001	2	1	37259.00	11305.00	3.30	19
3762	2	2001	2	2	146366.00	57530.00	2.54	19
3763	2	2002	1	0	97521.00	48874.00	2.00	19
3764	2	2002	1	1	34748.00	11915.00	2.92	19
3765	2	2002	1	2	132269.00	60789.00	2.18	19
3766	2	2002	2	0	108762.00	41597.00	2.61	19
3767	2	2002	2	1	40566.00	12261.00	3.31	19
3768	2	2002	2	2	149328.00	53858.00	2.77	19
3769	2	2003	1	0	92879.00	40252.00	2.31	19
3770	2	2003	1	1	42630.00	14884.00	2.86	19
3771	2	2003	1	2	135509.00	55136.00	2.46	19
3772	2	2003	2	0	110938.00	39642.00	2.80	19
3773	2	2003	2	1	51074.00	14804.00	3.45	19
3774	2	2003	2	2	162012.00	54446.00	2.98	19
3775	2	2004	1	0	88447.00	35383.00	2.50	19
3776	2	2004	1	1	50599.00	13731.00	3.69	19
3777	2	2004	1	2	139046.00	49114.00	2.83	19
3778	2	2004	2	0	115812.00	40868.00	2.83	19
3779	2	2004	2	1	50858.00	14300.00	3.56	19
3780	2	2004	2	2	166670.00	55168.00	3.02	19
3781	2	2005	1	0	91188.00	38101.00	2.39	19
3782	2	2005	1	1	48792.00	13724.00	3.56	19
3783	2	2005	1	2	139980.00	51825.00	2.70	19
3784	2	2005	2	0	118991.00	42207.00	2.82	19
3785	2	2005	2	1	50238.00	14462.00	3.47	19
3786	2	2005	2	2	169229.00	56669.00	2.99	19
3787	2	2006	1	0	88339.00	36186.00	2.44	19
3788	2	2006	1	1	47797.00	13807.00	3.46	19
3789	2	2006	1	2	136136.00	49993.00	2.72	19
3790	2	2006	2	0	115661.00	42062.00	2.75	19
3791	2	2006	2	1	52082.00	14819.00	3.51	19
3792	2	2006	2	2	167743.00	56881.00	2.95	19
3793	2	2007	1	0	85951.00	35216.00	2.44	19
3794	2	2007	1	1	49926.00	13894.00	3.59	19
3795	2	2007	1	2	135877.00	49110.00	2.77	19
3796	2	2007	2	0	113136.00	40819.00	2.77	19
3797	2	2007	2	1	66420.00	17942.00	3.70	19
3798	2	2007	2	2	179556.00	58761.00	3.06	19
3799	2	2008	1	0	70312.00	30635.00	2.30	19
3800	2	2008	1	1	50902.00	14129.00	3.60	19
3801	2	2008	1	2	121214.00	44764.00	2.71	19
3802	2	2008	2	0	126880.00	44408.00	2.86	19
3803	2	2008	2	1	70040.00	18611.00	3.76	19
3804	2	2008	2	2	196920.00	63019.00	3.12	19
3805	2	2009	1	0	87588.00	34636.00	2.53	19
3806	2	2009	1	1	51977.00	13915.00	3.74	19
3807	2	2009	1	2	139565.00	48551.00	2.87	19
3808	2	2009	2	0	158898.00	53226.00	2.99	19
3809	2	2009	2	1	75519.00	19543.00	3.86	19
3810	2	2009	2	2	234417.00	72769.00	3.22	19
3811	2	2010	1	0	73285.00	29211.00	2.51	19
3812	2	2010	1	1	44168.00	11879.00	3.72	19
3813	2	2010	1	2	117453.00	41090.00	2.86	19
3814	2	2010	2	0	151326.00	48667.00	3.11	19
3815	2	2010	2	1	66829.00	17683.00	3.78	19
3816	2	2010	2	2	218155.00	66350.00	3.29	19
3817	2	2011	1	0	87346.00	32969.00	2.65	19
3818	2	2011	1	1	50623.00	13271.00	3.81	19
3819	2	2011	1	2	137969.00	46240.00	2.98	19
3820	2	2011	2	0	155378.00	50325.00	3.09	19
3821	2	2011	2	1	55747.00	14731.00	3.78	19
3822	2	2011	2	2	211125.00	65056.00	3.25	19
3823	2	2012	1	0	89129.00	31189.00	2.86	19
3824	2	2012	1	1	45944.00	12185.00	3.77	19
3825	2	2012	1	2	135073.00	43374.00	3.11	19
3826	2	2012	2	0	166017.00	53506.00	3.10	19
3827	2	2012	2	1	59824.00	15679.00	3.82	19
3828	2	2012	2	2	225841.00	69185.00	3.26	19
3829	2	2013	1	0	80060.00	27830.00	2.88	19
3830	2	2013	1	1	51328.00	13536.00	3.79	19
3831	2	2013	1	2	131388.00	41366.00	3.18	19
3832	2	2013	2	0	144322.00	46848.00	3.08	19
3833	2	2013	2	1	46678.00	12420.00	3.76	19
3834	2	2013	2	2	191000.00	59268.00	3.22	19
3835	2	2014	1	0	64058.00	26469.00	2.42	19
3836	2	2014	1	1	41937.00	12750.00	3.29	19
3837	2	2014	1	2	105995.00	39219.00	2.70	19
3838	2	2014	2	0	122994.00	40019.00	3.07	19
3839	2	2014	2	1	62169.00	16355.00	3.80	19
3840	2	2014	2	2	185163.00	56374.00	3.28	19
3841	2	2015	1	0	53519.00	26770.00	2.00	19
3842	2	2015	1	1	35017.00	14272.00	2.45	19
3843	2	2015	1	2	88536.00	41042.00	2.16	19
3844	2	2015	2	0	105742.00	36250.00	2.92	19
3845	2	2015	2	1	62545.00	16942.00	3.69	19
3846	2	2015	2	2	168287.00	53192.00	3.16	19
3847	2	2016	1	0	62326.00	25950.00	2.40	19
3848	2	2016	1	1	39047.00	14815.00	2.64	19
3849	2	2016	1	2	101373.00	40765.00	2.49	19
3850	2	2016	2	0	113630.00	36635.00	3.10	19
3851	2	2016	2	1	59897.00	15110.00	3.96	19
3852	2	2016	2	2	173527.00	51745.00	3.35	19
3853	2	2017	1	0	93230.00	29764.00	3.13	19
3854	2	2017	1	1	53688.00	15700.00	3.42	19
3855	2	2017	1	2	146918.00	45464.00	3.23	19
3856	2	2017	2	0	141243.00	43675.00	3.23	19
3857	2	2017	2	1	60316.00	15317.00	3.94	19
3858	2	2017	2	2	201559.00	58992.00	3.42	19
3859	2	2018	1	0	95709.00	36168.00	2.65	19
3860	2	2018	1	1	48066.00	16517.00	2.91	19
3861	2	2018	1	2	143775.00	52685.00	2.73	19
3862	2	2018	2	0	143157.00	46547.00	3.08	19
3863	2	2018	2	1	60197.00	15416.00	3.90	19
3864	2	2018	2	2	203354.00	61963.00	3.28	19
3865	2	2019	1	0	85586.00	29689.00	2.88	19
3866	2	2019	1	1	39701.00	13225.00	3.00	19
3867	2	2019	1	2	125287.00	42914.00	2.92	19
3868	2	2019	2	0	119376.00	39147.00	3.05	19
3869	2	2019	2	1	57105.00	15106.00	3.78	19
3870	2	2019	2	2	176481.00	54253.00	3.25	19
3871	2	2020	1	0	126878.61	41025.00	3.09	19
3872	2	2020	1	1	52466.40	14630.00	3.59	19
3873	2	2020	1	2	179345.01	55655.00	3.22	19
3874	2	2020	2	0	121047.00	37449.00	3.23	19
3875	2	2020	2	1	62880.68	16006.00	3.93	19
3876	2	2020	2	2	183927.68	53455.00	3.44	19
3877	1	1987	1	0	83460.00	53070.00	1.57	2
3878	1	1987	1	1	461050.00	139060.00	3.32	2
3879	1	1987	1	2	544510.00	192130.00	2.83	2
3880	1	1987	2	0	23671.00	14770.00	1.60	2
3881	1	1987	2	1	428425.00	126710.00	3.38	2
3882	1	1987	2	2	452096.00	141480.00	3.20	2
3883	1	1988	1	0	68809.00	38050.00	1.81	2
3884	1	1988	1	1	516009.00	150360.00	3.43	2
3885	1	1988	1	2	584818.00	188410.00	3.10	2
3886	1	1988	2	0	34847.00	17530.00	1.99	2
3887	1	1988	2	1	471642.00	135130.00	3.49	2
3888	1	1988	2	2	506489.00	152660.00	3.32	2
3889	1	1989	1	0	62771.00	37360.00	1.68	2
3890	1	1989	1	1	502188.00	148390.00	3.38	2
3891	1	1989	1	2	564959.00	185750.00	3.04	2
3892	1	1989	2	0	47175.00	24290.00	1.94	2
3893	1	1989	2	1	482735.00	148850.00	3.24	2
3894	1	1989	2	2	529910.00	173140.00	3.06	2
3895	1	1990	1	0	41355.00	29220.00	1.42	2
3896	1	1990	1	1	493647.00	140870.00	3.50	2
3897	1	1990	1	2	535002.00	170090.00	3.15	2
3898	1	1990	2	0	46446.00	25960.00	1.79	2
3899	1	1990	2	1	583310.00	151600.00	3.85	2
3900	1	1990	2	2	629756.00	177560.00	3.55	2
3901	1	1991	1	0	47212.00	26050.00	1.81	2
3902	1	1991	1	1	523201.00	143920.00	3.64	2
3903	1	1991	1	2	570413.00	169970.00	3.36	2
3904	1	1991	2	0	29741.00	17240.00	1.73	2
3905	1	1991	2	1	433461.00	138080.00	3.14	2
3906	1	1991	2	2	463202.00	155320.00	2.98	2
3907	1	1992	1	0	33917.00	24580.00	1.38	2
3908	1	1992	1	1	539788.00	144990.00	3.72	2
3909	1	1992	1	2	573705.00	169570.00	3.38	2
3910	1	1992	2	0	24935.00	11770.00	2.12	2
3911	1	1992	2	1	490040.00	144870.00	3.38	2
3912	1	1992	2	2	514975.00	156640.00	3.29	2
3913	1	1993	1	0	29399.00	27610.00	1.06	2
3914	1	1993	1	1	472702.00	134840.00	3.51	2
3915	1	1993	1	2	502101.00	162450.00	3.09	2
3916	1	1993	2	0	10537.00	6610.00	1.59	2
3917	1	1993	2	1	379040.00	125840.00	3.01	2
3918	1	1993	2	2	389577.00	132450.00	2.94	2
3919	1	1994	1	0	74414.00	37060.00	2.01	2
3920	1	1994	1	1	569242.00	157990.00	3.60	2
3921	1	1994	1	2	643656.00	195050.00	3.30	2
3922	1	1994	2	0	64824.00	28730.00	2.26	2
3923	1	1994	2	1	528779.00	155760.00	3.39	2
3924	1	1994	2	2	593603.00	184490.00	3.22	2
3925	1	1995	1	0	43710.00	34067.00	1.28	2
3926	1	1995	1	1	591182.00	168066.00	3.52	2
3927	1	1995	1	2	634892.00	202133.00	3.14	2
3928	1	1995	2	0	51382.00	23726.00	2.17	2
3929	1	1995	2	1	662984.00	177252.00	3.74	2
3930	1	1995	2	2	714366.00	200978.00	3.55	2
3931	1	1996	1	0	93854.00	46937.00	2.00	2
3932	1	1996	1	1	683931.00	175545.00	3.90	2
3933	1	1996	1	2	777785.00	222482.00	3.50	2
3934	1	1996	2	0	40505.00	19981.00	2.03	2
3935	1	1996	2	1	623053.00	171793.00	3.63	2
3936	1	1996	2	2	663558.00	191774.00	3.46	2
3937	1	1997	1	0	87414.00	42839.00	2.04	2
3938	1	1997	1	1	731950.00	185412.00	3.95	2
3939	1	1997	1	2	819364.00	228251.00	3.59	2
3940	1	1997	2	0	24656.00	13461.00	1.83	2
3941	1	1997	2	1	700708.00	186278.00	3.76	2
3942	1	1997	2	2	725364.00	199739.00	3.63	2
3943	1	1998	1	0	17298.00	13959.00	1.24	2
3944	1	1998	1	1	621398.00	180304.00	3.45	2
3945	1	1998	1	2	638696.00	194263.00	3.29	2
3946	1	1998	2	0	10436.00	7161.00	1.46	2
3947	1	1998	2	1	460240.00	156215.00	2.95	2
3948	1	1998	2	2	470676.00	163376.00	2.88	2
3949	1	1999	1	0	114659.00	53847.00	2.13	2
3950	1	1999	1	1	907463.00	221702.00	4.09	2
3951	1	1999	1	2	1022122.00	275549.00	3.71	2
3952	1	1999	2	0	40154.00	22280.00	1.80	2
3953	1	1999	2	1	646533.00	185838.00	3.48	2
3954	1	1999	2	2	686687.00	208118.00	3.30	2
3955	1	2000	1	0	134242.00	60478.00	2.22	2
3956	1	2000	1	1	895488.00	223671.00	4.00	2
3957	1	2000	1	2	1029730.00	284149.00	3.62	2
3958	1	2000	2	0	32691.00	16014.00	2.04	2
3959	1	2000	2	1	722716.00	192770.00	3.75	2
3960	1	2000	2	2	755407.00	208784.00	3.62	2
3961	1	2001	1	0	133612.00	57753.00	2.31	2
3962	1	2001	1	1	906175.00	226628.00	4.00	2
3963	1	2001	1	2	1039787.00	284381.00	3.66	2
3964	1	2001	2	0	38709.00	17575.00	2.20	2
3965	1	2001	2	1	731700.00	196973.00	3.71	2
3966	1	2001	2	2	770409.00	214548.00	3.59	2
3967	1	2002	1	0	115006.00	53419.00	2.15	2
3968	1	2002	1	1	960533.00	240124.00	4.00	2
3969	1	2002	1	2	1075539.00	293543.00	3.66	2
3970	1	2002	2	0	27286.00	12638.00	2.16	2
3971	1	2002	2	1	604750.00	154733.00	3.91	2
3972	1	2002	2	2	632036.00	167371.00	3.78	2
3973	1	2003	1	0	71396.00	35874.00	1.99	2
3974	1	2003	1	1	861901.00	223919.00	3.85	2
3975	1	2003	1	2	933297.00	259793.00	3.59	2
3976	1	2003	2	0	47105.00	20056.00	2.35	2
3977	1	2003	2	1	686082.00	170530.00	4.02	2
3978	1	2003	2	2	733187.00	190586.00	3.85	2
3979	1	2004	1	0	123096.00	48428.00	2.54	2
3980	1	2004	1	1	926308.00	223720.00	4.14	2
3981	1	2004	1	2	1049404.00	272148.00	3.86	2
3982	1	2004	2	0	46992.00	19526.00	2.41	2
3983	1	2004	2	1	795915.00	196921.00	4.04	2
3984	1	2004	2	2	842907.00	216447.00	3.89	2
3985	1	2005	1	0	74042.00	39103.00	1.89	2
3986	1	2005	1	1	928797.00	220214.00	4.22	2
3987	1	2005	1	2	1002839.00	259317.00	3.87	2
3988	1	2005	2	0	19850.00	8414.00	2.36	2
3989	1	2005	2	1	826160.00	206241.00	4.01	2
3990	1	2005	2	2	846010.00	214655.00	3.94	2
3991	1	2006	1	0	130113.00	47647.00	2.73	2
3992	1	2006	1	1	1003574.00	229020.00	4.38	2
3993	1	2006	1	2	1133687.00	276667.00	4.10	2
3994	1	2006	2	0	54977.00	22237.00	2.47	2
3995	1	2006	2	1	765091.00	204689.00	3.74	2
3996	1	2006	2	2	820068.00	226926.00	3.61	2
3997	1	2007	1	0	137135.00	49036.00	2.80	2
3998	1	2007	1	1	1031789.00	235964.00	4.37	2
3999	1	2007	1	2	1168924.00	285000.00	4.10	2
4000	1	2007	2	0	61656.00	24290.00	2.54	2
4001	1	2007	2	1	794665.00	192653.00	4.12	2
4002	1	2007	2	2	856321.00	216943.00	3.95	2
4003	1	2008	1	0	132786.00	50928.00	2.61	2
4004	1	2008	1	1	1033744.00	240541.00	4.30	2
4005	1	2008	1	2	1166530.00	291469.00	4.00	2
4006	1	2008	2	0	75430.00	31273.00	2.41	2
4007	1	2008	2	1	838280.00	214174.00	3.91	2
4008	1	2008	2	2	913710.00	245447.00	3.72	2
4009	1	2009	1	0	157575.00	53481.00	2.95	2
4010	1	2009	1	1	1058767.00	239523.00	4.42	2
4011	1	2009	1	2	1216342.00	293004.00	4.15	2
4012	1	2009	2	0	76912.00	32651.00	2.36	2
4013	1	2009	2	1	783782.00	207660.00	3.77	2
4014	1	2009	2	2	860694.00	240311.00	3.58	2
4015	1	2010	1	0	71964.00	42891.00	1.68	2
4016	1	2010	1	1	859035.00	221513.00	3.88	2
4017	1	2010	1	2	930999.00	264404.00	3.52	2
4018	1	2010	2	0	40673.00	21877.00	1.86	2
4019	1	2010	2	1	774050.00	220070.00	3.52	2
4020	1	2010	2	2	814723.00	241947.00	3.37	2
4021	1	2011	1	0	148652.00	53590.00	2.77	2
4022	1	2011	1	1	1075170.00	245240.00	4.38	2
4023	1	2011	1	2	1223822.00	298830.00	4.10	2
4024	1	2011	2	0	71813.00	30180.00	2.38	2
4025	1	2011	2	1	849131.00	233796.00	3.63	2
4026	1	2011	2	2	920944.00	263976.00	3.49	2
4027	1	2012	1	0	146422.14	51156.75	2.86	2
4028	1	2012	1	1	1116024.03	248693.43	4.49	2
4029	1	2012	1	2	1262446.17	299850.18	4.21	2
4030	1	2012	2	0	101774.73	35899.72	2.83	2
4031	1	2012	2	1	1061315.57	246807.27	4.30	2
4032	1	2012	2	2	1163090.30	282706.99	4.11	2
4033	1	2013	1	0	123594.18	46059.15	2.68	2
4034	1	2013	1	1	1141708.43	260232.43	4.39	2
4035	1	2013	1	2	1265302.61	306291.58	4.13	2
4036	1	2013	2	0	74384.72	28896.77	2.57	2
4037	1	2013	2	1	1083513.00	250106.00	4.33	2
4038	1	2013	2	2	1157897.72	279002.77	4.15	2
4039	1	2014	1	0	122262.80	50397.25	2.43	2
4040	1	2014	1	1	1174704.15	260665.43	4.51	2
4041	1	2014	1	2	1296966.95	311062.68	4.17	2
4042	1	2014	2	0	82374.22	29389.10	2.80	2
4043	1	2014	2	1	1135593.00	251207.98	4.52	2
4044	1	2014	2	2	1217967.22	280597.08	4.34	2
4045	1	2015	1	0	133854.11	47603.71	2.81	2
4046	1	2015	1	1	1252615.34	265666.25	4.71	2
4047	1	2015	1	2	1386469.45	313269.96	4.43	2
4048	1	2015	2	0	52619.83	25319.23	2.08	2
4049	1	2015	2	1	1050558.00	245530.00	4.28	2
4050	1	2015	2	2	1103177.83	270849.23	4.07	2
4051	1	2016	1	0	109653.70	39024.00	2.81	2
4052	1	2016	1	1	1264091.10	267369.45	4.73	2
4053	1	2016	1	2	1373744.80	306393.45	4.48	2
4054	1	2016	2	0	41261.24	21328.64	1.93	2
4055	1	2016	2	1	917648.00	229162.00	4.00	2
4056	1	2016	2	2	958909.24	250490.64	3.83	2
4057	1	2017	1	0	152496.36	46526.70	3.28	2
4058	1	2017	1	1	1331322.00	267848.00	4.97	2
4059	1	2017	1	2	1483818.36	314374.70	4.72	2
4060	1	2017	2	0	75450.15	26969.25	2.80	2
4061	1	2017	2	1	1097710.00	245753.00	4.47	2
4062	1	2017	2	2	1173160.15	272722.25	4.30	2
4063	1	2018	1	0	160573.46	47139.80	3.41	2
4064	1	2018	1	1	1318855.00	265543.00	4.97	2
4065	1	2018	1	2	1479428.46	312682.80	4.73	2
4066	1	2018	2	0	59490.96	23994.98	2.48	2
4067	1	2018	2	1	840852.00	225339.73	3.73	2
4068	1	2018	2	2	900342.96	249334.71	3.61	2
4069	1	2019	1	0	106035.17	36015.00	2.94	2
4070	1	2019	1	1	1258309.68	264749.00	4.75	2
4071	1	2019	1	2	1364344.85	300764.00	4.54	2
4072	1	2019	2	0	76508.49	25888.00	2.96	2
4073	1	2019	2	1	1203849.00	256231.00	4.70	2
4074	1	2019	2	2	1280357.49	282119.00	4.54	2
4075	1	2020	1	0	122321.96	37688.00	3.25	2
4076	1	2020	1	1	1282974.00	268312.00	4.78	2
4077	1	2020	1	2	1405295.96	306000.00	4.59	2
4078	1	2020	2	0	73816.82	25624.00	2.88	2
4079	1	2020	2	1	1166664.00	258093.00	4.52	2
4080	1	2020	2	2	1240480.82	283717.00	4.37	2
4081	2	1987	1	0	23070.00	9520.00	2.42	2
4082	2	1987	1	1	12335.00	4840.00	2.55	2
4083	2	1987	1	2	35405.00	14360.00	2.47	2
4084	2	1987	2	0	5818.00	2550.00	2.28	2
4085	2	1987	2	1	3600.00	1750.00	2.06	2
4086	2	1987	2	2	9418.00	4300.00	2.19	2
4087	2	1988	1	0	17551.00	6560.00	2.68	2
4088	2	1988	1	1	19452.00	5530.00	3.52	2
4089	2	1988	1	2	37003.00	12090.00	3.06	2
4090	2	1988	2	0	3205.00	2100.00	1.53	2
4091	2	1988	2	1	4003.00	1940.00	2.06	2
4092	2	1988	2	2	7208.00	4040.00	1.78	2
4093	2	1989	1	0	21255.00	7730.00	2.75	2
4094	2	1989	1	1	9486.00	3460.00	2.74	2
4095	2	1989	1	2	30741.00	11190.00	2.75	2
4096	2	1989	2	0	3948.00	2170.00	1.82	2
4097	2	1989	2	1	4518.00	2180.00	2.07	2
4098	2	1989	2	2	8466.00	4350.00	1.95	2
4099	2	1990	1	0	18690.00	7230.00	2.59	2
4100	2	1990	1	1	29080.00	8000.00	3.64	2
4101	2	1990	1	2	47770.00	15230.00	3.14	2
4102	2	1990	2	0	3183.00	1300.00	2.45	2
4103	2	1990	2	1	5664.00	1880.00	3.01	2
4104	2	1990	2	2	8847.00	3180.00	2.78	2
4105	2	1991	1	0	35236.00	11250.00	3.13	2
4106	2	1991	1	1	55280.00	13710.00	4.03	2
4107	2	1991	1	2	90516.00	24960.00	3.63	2
4108	2	1991	2	0	3035.00	1280.00	2.37	2
4109	2	1991	2	1	5443.00	2410.00	2.26	2
4110	2	1991	2	2	8478.00	3690.00	2.30	2
4111	2	1992	1	0	3440.00	1500.00	2.29	2
4112	2	1992	1	1	19255.00	5070.00	3.80	2
4113	2	1992	1	2	22695.00	6570.00	3.45	2
4114	2	1992	2	0	40.00	40.00	1.00	2
4115	2	1992	2	1	3835.00	1350.00	2.84	2
4116	2	1992	2	2	3875.00	1390.00	2.79	2
4117	2	1993	1	0	16650.00	5000.00	3.33	2
4118	2	1993	1	1	23855.00	6150.00	3.88	2
4119	2	1993	1	2	40505.00	11150.00	3.63	2
4120	2	1993	2	0	13520.00	5260.00	2.57	2
4121	2	1993	2	1	13400.00	4200.00	3.19	2
4122	2	1993	2	2	26920.00	9460.00	2.85	2
4123	2	1994	1	0	11830.00	3760.00	3.15	2
4124	2	1994	1	1	25525.00	6880.00	3.71	2
4125	2	1994	1	2	37355.00	10640.00	3.51	2
4126	2	1994	2	0	5865.00	2430.00	2.41	2
4127	2	1994	2	1	19061.00	5210.00	3.66	2
4128	2	1994	2	2	24926.00	7640.00	3.26	2
4129	2	1995	1	0	16185.00	4500.00	3.60	2
4130	2	1995	1	1	38235.00	9380.00	4.08	2
4131	2	1995	1	2	54420.00	13880.00	3.92	2
4132	2	1995	2	0	33250.00	9250.00	3.59	2
4133	2	1995	2	1	33348.00	8138.00	4.10	2
4134	2	1995	2	2	66598.00	17388.00	3.83	2
4135	2	1996	1	0	22745.00	8678.00	2.62	2
4136	2	1996	1	1	27459.00	8511.00	3.23	2
4137	2	1996	1	2	50204.00	17189.00	2.92	2
4138	2	1996	2	0	26710.00	8172.00	3.27	2
4139	2	1996	2	1	35368.00	9315.00	3.80	2
4140	2	1996	2	2	62078.00	17487.00	3.55	2
4141	2	1997	1	0	12222.00	4889.00	2.50	2
4142	2	1997	1	1	21087.00	7359.00	2.87	2
4143	2	1997	1	2	33309.00	12248.00	2.72	2
4144	2	1997	2	0	9102.00	3116.00	2.92	2
4145	2	1997	2	1	32038.00	8549.00	3.75	2
4146	2	1997	2	2	41140.00	11665.00	3.53	2
4147	2	1998	1	0	297.00	230.00	1.29	2
4148	2	1998	1	1	13012.00	5685.00	2.29	2
4149	2	1998	1	2	13309.00	5915.00	2.25	2
4150	2	1998	2	0	597.00	170.00	3.51	2
4151	2	1998	2	1	20738.00	5383.00	3.85	2
4152	2	1998	2	2	21335.00	5553.00	3.84	2
4153	2	1999	1	0	6614.00	2775.00	2.38	2
4154	2	1999	1	1	19133.00	6286.00	3.04	2
4155	2	1999	1	2	25747.00	9061.00	2.84	2
4156	2	1999	2	0	7537.00	3388.00	2.22	2
4157	2	1999	2	1	17654.00	6254.00	2.82	2
4158	2	1999	2	2	25191.00	9642.00	2.61	2
4159	2	2000	1	0	11225.00	4798.00	2.34	2
4160	2	2000	1	1	20744.00	6678.00	3.11	2
4161	2	2000	1	2	31969.00	11476.00	2.79	2
4162	2	2000	2	0	5845.00	3180.00	1.84	2
4163	2	2000	2	1	19142.00	7212.00	2.65	2
4164	2	2000	2	2	24987.00	10392.00	2.40	2
4165	2	2001	1	0	16294.00	5730.00	2.84	2
4166	2	2001	1	1	30102.00	8154.00	3.69	2
4167	2	2001	1	2	46396.00	13884.00	3.34	2
4168	2	2001	2	0	7482.00	3315.00	2.26	2
4169	2	2001	2	1	24995.00	8150.00	3.07	2
4170	2	2001	2	2	32477.00	11465.00	2.83	2
4171	2	2002	1	0	18727.00	6226.00	3.01	2
4172	2	2002	1	1	29646.00	8200.00	3.62	2
4173	2	2002	1	2	48373.00	14426.00	3.35	2
4174	2	2002	2	0	2588.00	924.00	2.80	2
4175	2	2002	2	1	26731.00	7435.00	3.60	2
4176	2	2002	2	2	29319.00	8359.00	3.51	2
4177	2	2003	1	0	13109.00	4817.00	2.72	2
4178	2	2003	1	1	25641.00	7173.00	3.57	2
4179	2	2003	1	2	38750.00	11990.00	3.23	2
4180	2	2003	2	0	7280.00	2280.00	3.19	2
4181	2	2003	2	1	28617.00	7840.00	3.65	2
4182	2	2003	2	2	35897.00	10120.00	3.55	2
4183	2	2004	1	0	18909.00	5630.00	3.36	2
4184	2	2004	1	1	31519.00	8277.00	3.81	2
4185	2	2004	1	2	50428.00	13907.00	3.63	2
4186	2	2004	2	0	1967.00	1227.00	1.60	2
4187	2	2004	2	1	31370.00	8280.00	3.79	2
4188	2	2004	2	2	33337.00	9507.00	3.51	2
4189	2	2005	1	0	13060.00	4497.00	2.90	2
4190	2	2005	1	1	30643.00	8121.00	3.77	2
4191	2	2005	1	2	43703.00	12618.00	3.46	2
4192	2	2005	2	0	8170.00	3155.00	2.59	2
4193	2	2005	2	1	30342.00	8212.00	3.69	2
4194	2	2005	2	2	38512.00	11367.00	3.39	2
4195	2	2006	1	0	13037.00	4881.00	2.67	2
4196	2	2006	1	1	33054.00	9148.00	3.61	2
4197	2	2006	1	2	46091.00	14029.00	3.29	2
4198	2	2006	2	0	8064.00	3095.00	2.61	2
4199	2	2006	2	1	31645.00	8375.00	3.78	2
4200	2	2006	2	2	39709.00	11470.00	3.46	2
4201	2	2007	1	0	18355.00	5432.00	3.38	2
4202	2	2007	1	1	34893.00	9050.00	3.86	2
4203	2	2007	1	2	53248.00	14482.00	3.68	2
4204	2	2007	2	0	9498.00	3625.00	2.62	2
4205	2	2007	2	1	33639.00	9100.00	3.70	2
4206	2	2007	2	2	43137.00	12725.00	3.39	2
4207	2	2008	1	0	16745.00	5507.00	3.04	2
4208	2	2008	1	1	33108.00	9058.00	3.66	2
4209	2	2008	1	2	49853.00	14565.00	3.42	2
4210	2	2008	2	0	8726.00	3300.00	2.64	2
4211	2	2008	2	1	31936.00	8680.00	3.68	2
4212	2	2008	2	2	40662.00	11980.00	3.39	2
4213	2	2009	1	0	13103.00	4760.00	2.75	2
4214	2	2009	1	1	27295.00	8470.00	3.22	2
4215	2	2009	1	2	40398.00	13230.00	3.05	2
4216	2	2009	2	0	6171.00	2309.00	2.67	2
4217	2	2009	2	1	29446.00	7943.00	3.71	2
4218	2	2009	2	2	35617.00	10252.00	3.47	2
4219	2	2010	1	0	8827.00	3220.00	2.74	2
4220	2	2010	1	1	27207.00	7333.00	3.71	2
4221	2	2010	1	2	36034.00	10553.00	3.41	2
4222	2	2010	2	0	6413.00	2433.00	2.64	2
4223	2	2010	2	1	25623.00	7448.00	3.44	2
4224	2	2010	2	2	32036.00	9881.00	3.24	2
4225	2	2011	1	0	6626.00	3215.00	2.06	2
4226	2	2011	1	1	23891.00	7984.00	2.99	2
4227	2	2011	1	2	30517.00	11199.00	2.72	2
4228	2	2011	2	0	8061.00	2578.00	3.13	2
4229	2	2011	2	1	32257.00	8950.00	3.60	2
4230	2	2011	2	2	40318.00	11528.00	3.50	2
4231	2	2012	1	0	7938.00	3264.00	2.43	2
4232	2	2012	1	1	31963.00	9839.00	3.25	2
4233	2	2012	1	2	39901.00	13103.00	3.05	2
4234	2	2012	2	0	5974.30	2120.00	2.82	2
4235	2	2012	2	1	27719.70	7897.00	3.51	2
4236	2	2012	2	2	33694.00	10017.00	3.36	2
4237	2	2013	1	0	9154.00	3153.00	2.90	2
4238	2	2013	1	1	37001.00	10762.00	3.44	2
4239	2	2013	1	2	46155.00	13915.00	3.32	2
4240	2	2013	2	0	9827.00	3047.00	3.23	2
4241	2	2013	2	1	39452.00	10306.00	3.83	2
4242	2	2013	2	2	49279.00	13353.00	3.69	2
4243	2	2014	1	0	11057.00	3546.00	3.12	2
4244	2	2014	1	1	39780.00	10586.00	3.76	2
4245	2	2014	1	2	50837.00	14132.00	3.60	2
4246	2	2014	2	0	9429.00	2947.00	3.20	2
4247	2	2014	2	1	39520.00	10390.00	3.80	2
4248	2	2014	2	2	48949.00	13337.00	3.67	2
4249	2	2015	1	0	9407.00	3414.00	2.76	2
4250	2	2015	1	1	33694.00	9983.00	3.38	2
4251	2	2015	1	2	43101.00	13397.00	3.22	2
4252	2	2015	2	0	5346.00	2166.95	2.47	2
4253	2	2015	2	1	27744.00	7800.00	3.56	2
4254	2	2015	2	2	33090.00	9966.95	3.32	2
4255	2	2016	1	0	6292.00	2492.00	2.52	2
4256	2	2016	1	1	32014.00	9782.00	3.27	2
4257	2	2016	1	2	38306.00	12274.00	3.12	2
4258	2	2016	2	0	8258.00	2709.00	3.05	2
4259	2	2016	2	1	40748.00	10785.00	3.78	2
4260	2	2016	2	2	49006.00	13494.00	3.63	2
4261	2	2017	1	0	7848.00	2568.00	3.06	2
4262	2	2017	1	1	36873.00	10329.00	3.57	2
4263	2	2017	1	2	44721.00	12897.00	3.47	2
4264	2	2017	2	0	6894.00	2266.00	3.04	2
4265	2	2017	2	1	29337.00	7927.00	3.70	2
4266	2	2017	2	2	36231.00	10193.00	3.55	2
4267	2	2018	1	0	8933.00	2728.00	3.27	2
4268	2	2018	1	1	39047.00	10422.00	3.75	2
4269	2	2018	1	2	47980.00	13150.00	3.65	2
4270	2	2018	2	0	6418.78	2274.00	2.82	2
4271	2	2018	2	1	26989.00	7173.00	3.76	2
4272	2	2018	2	2	33407.78	9447.00	3.54	2
4273	2	2019	1	0	9380.00	2806.23	3.34	2
4274	2	2019	1	1	38938.00	10179.00	3.83	2
4275	2	2019	1	2	48318.00	12985.23	3.72	2
4276	2	2019	2	0	3731.00	1273.00	2.93	2
4277	2	2019	2	1	26818.00	8062.00	3.33	2
4278	2	2019	2	2	30549.00	9335.00	3.27	2
4279	2	2020	1	0	4388.34	1385.00	3.17	2
4280	2	2020	1	1	28231.96	8079.00	3.49	2
4281	2	2020	1	2	32620.30	9464.00	3.45	2
4282	2	2020	2	0	3308.40	1135.00	2.91	2
4283	2	2020	2	1	34564.72	10229.00	3.38	2
4284	2	2020	2	2	37873.12	11364.00	3.33	2
4285	3	1987	1	0	8870.00	3200.00	2.77	2
4286	3	1987	1	1	5440.00	1740.00	3.13	2
4287	3	1987	1	2	14310.00	4940.00	2.90	2
4288	3	1987	2	0	7167.00	3390.00	2.11	2
4289	3	1987	2	1	5718.00	2060.00	2.78	2
4290	3	1987	2	2	12885.00	5450.00	2.36	2
4291	3	1988	1	0	6006.00	2870.00	2.09	2
4292	3	1988	1	1	8201.00	2410.00	3.40	2
4293	3	1988	1	2	14207.00	5280.00	2.69	2
4294	3	1988	2	0	8231.00	3310.00	2.49	2
4295	3	1988	2	1	8262.00	2160.00	3.83	2
4296	3	1988	2	2	16493.00	5470.00	3.02	2
4297	3	1989	1	0	5599.00	2500.00	2.24	2
4298	3	1989	1	1	9688.00	2790.00	3.47	2
4299	3	1989	1	2	15287.00	5290.00	2.89	2
4300	3	1989	2	0	7657.00	2980.00	2.57	2
4301	3	1989	2	1	9842.00	2560.00	3.84	2
4302	3	1989	2	2	17499.00	5540.00	3.16	2
4303	3	1990	1	0	4246.00	2080.00	2.04	2
4304	3	1990	1	1	7806.00	2290.00	3.41	2
4305	3	1990	1	2	12052.00	4370.00	2.76	2
4306	3	1990	2	0	7502.00	3040.00	2.47	2
4307	3	1990	2	1	7783.00	2240.00	3.47	2
4308	3	1990	2	2	15285.00	5280.00	2.89	2
4309	3	1991	1	0	1318.00	730.00	1.81	2
4310	3	1991	1	1	7048.00	2120.00	3.32	2
4311	3	1991	1	2	8366.00	2850.00	2.94	2
4312	3	1991	2	0	5063.00	2610.00	1.94	2
4313	3	1991	2	1	6830.00	2190.00	3.12	2
4314	3	1991	2	2	11893.00	4800.00	2.48	2
4315	3	1992	1	0	1630.00	720.00	2.26	2
4316	3	1992	1	1	6324.00	1980.00	3.19	2
4317	3	1992	1	2	7954.00	2700.00	2.95	2
4318	3	1992	2	0	4348.00	2340.00	1.86	2
4319	3	1992	2	1	7440.00	2200.00	3.38	2
4320	3	1992	2	2	11788.00	4540.00	2.60	2
4321	3	1993	1	0	4041.00	1700.00	2.38	2
4322	3	1993	1	1	5855.00	1590.00	3.68	2
4323	3	1993	1	2	9896.00	3290.00	3.01	2
4324	3	1993	2	0	5230.00	2300.00	2.27	2
4325	3	1993	2	1	8406.00	2420.00	3.47	2
4326	3	1993	2	2	13636.00	4720.00	2.89	2
4327	3	1994	1	0	2039.00	1340.00	1.52	2
4328	3	1994	1	1	5752.00	1610.00	3.57	2
4329	3	1994	1	2	7791.00	2950.00	2.64	2
4330	3	1994	2	0	3420.00	2620.00	1.31	2
4331	3	1994	2	1	9095.00	2030.00	4.48	2
4332	3	1994	2	2	12515.00	4650.00	2.69	2
4333	3	1995	1	0	4469.00	2280.00	1.96	2
4334	3	1995	1	1	7275.00	2080.00	3.50	2
4335	3	1995	1	2	11744.00	4360.00	2.69	2
4336	3	1995	2	0	13611.00	10835.00	1.26	2
4337	3	1995	2	1	4884.00	1160.00	4.21	2
4338	3	1995	2	2	18495.00	11995.00	1.54	2
4339	3	1996	1	0	6688.00	3216.00	2.08	2
4340	3	1996	1	1	7871.00	2038.00	3.86	2
4341	3	1996	1	2	14559.00	5254.00	2.77	2
4342	3	1996	2	0	16386.00	7703.00	2.13	2
4343	3	1996	2	1	5355.00	1172.00	4.57	2
4344	3	1996	2	2	21741.00	8875.00	2.45	2
4345	3	1997	1	0	8813.00	3527.00	2.50	2
4346	3	1997	1	1	8927.00	2162.00	4.13	2
4347	3	1997	1	2	17740.00	5689.00	3.12	2
4348	3	1997	2	0	7219.00	4282.00	1.69	2
4349	3	1997	2	1	7303.00	1591.00	4.59	2
4350	3	1997	2	2	14522.00	5873.00	2.47	2
4351	3	1998	1	0	1475.00	1341.00	1.10	2
4352	3	1998	1	1	4387.00	1974.00	2.22	2
4353	3	1998	1	2	5862.00	3315.00	1.77	2
4354	3	1998	2	0	7455.00	3500.00	2.13	2
4355	3	1998	2	1	8246.00	2030.00	4.06	2
4356	3	1998	2	2	15701.00	5530.00	2.84	2
4357	3	1999	1	0	8133.00	2439.00	3.33	2
4358	3	1999	1	1	11275.00	2488.00	4.53	2
4359	3	1999	1	2	19408.00	4927.00	3.94	2
4360	3	1999	2	0	10440.00	4925.00	2.12	2
4361	3	1999	2	1	8885.00	2137.00	4.16	2
4362	3	1999	2	2	19325.00	7062.00	2.74	2
4363	3	2000	1	0	7159.00	2927.00	2.45	2
4364	3	2000	1	1	8841.00	2209.00	4.00	2
4365	3	2000	1	2	16000.00	5136.00	3.12	2
4366	3	2000	2	0	7052.00	3666.00	1.92	2
4367	3	2000	2	1	10288.00	2761.00	3.73	2
4368	3	2000	2	2	17340.00	6427.00	2.70	2
4369	3	2001	1	0	7328.00	3150.00	2.33	2
4370	3	2001	1	1	8906.00	2209.00	4.03	2
4371	3	2001	1	2	16234.00	5359.00	3.03	2
4372	3	2001	2	0	10706.00	4263.00	2.51	2
4373	3	2001	2	1	8521.00	2545.00	3.35	2
4374	3	2001	2	2	19227.00	6808.00	2.82	2
4375	3	2002	1	0	6029.00	3307.00	1.82	2
4376	3	2002	1	1	10182.00	2628.00	3.87	2
4377	3	2002	1	2	16211.00	5935.00	2.73	2
4378	3	2002	2	0	12869.00	4606.00	2.79	2
4379	3	2002	2	1	10907.00	2579.00	4.23	2
4380	3	2002	2	2	23776.00	7185.00	3.31	2
4381	3	2003	1	0	7176.00	3210.00	2.24	2
4382	3	2003	1	1	10083.00	2563.00	3.93	2
4383	3	2003	1	2	17259.00	5773.00	2.99	2
4384	3	2003	2	0	11649.00	4458.00	2.61	2
4385	3	2003	2	1	9894.00	2526.00	3.92	2
4386	3	2003	2	2	21543.00	6984.00	3.08	2
4387	3	2004	1	0	6404.00	2205.00	2.90	2
4388	3	2004	1	1	8279.00	1978.00	4.19	2
4389	3	2004	1	2	14683.00	4183.00	3.51	2
4390	3	2004	2	0	8193.00	2996.00	2.73	2
4391	3	2004	2	1	10793.00	2253.00	4.79	2
4392	3	2004	2	2	18986.00	5249.00	3.62	2
4393	3	2005	1	0	4632.00	2065.00	2.24	2
4394	3	2005	1	1	7875.00	1750.00	4.50	2
4395	3	2005	1	2	12507.00	3815.00	3.28	2
4396	3	2005	2	0	6277.00	2917.00	2.15	2
4397	3	2005	2	1	9066.00	2007.00	4.52	2
4398	3	2005	2	2	15343.00	4924.00	3.12	2
4399	3	2006	1	0	7300.00	2870.00	2.54	2
4400	3	2006	1	1	6412.00	1428.00	4.49	2
4401	3	2006	1	2	13712.00	4298.00	3.19	2
4402	3	2006	2	0	6365.00	2553.00	2.49	2
4403	3	2006	2	1	7052.00	1610.00	4.38	2
4404	3	2006	2	2	13417.00	4163.00	3.22	2
4405	3	2007	1	0	5238.00	2178.00	2.40	2
4406	3	2007	1	1	4334.00	1006.00	4.31	2
4407	3	2007	1	2	9572.00	3184.00	3.01	2
4408	3	2007	2	0	3356.00	1197.00	2.80	2
4409	3	2007	2	1	4298.00	964.00	4.46	2
4410	3	2007	2	2	7654.00	2161.00	3.54	2
4411	3	2008	1	0	2302.00	864.00	2.66	2
4412	3	2008	1	1	3666.00	988.00	3.71	2
4413	3	2008	1	2	5968.00	1852.00	3.22	2
4414	3	2008	2	0	3492.00	1146.00	3.05	2
4415	3	2008	2	1	4242.00	967.00	4.39	2
4416	3	2008	2	2	7734.00	2113.00	3.66	2
4417	3	2009	1	0	2234.00	877.00	2.55	2
4418	3	2009	1	1	5558.00	1196.00	4.65	2
4419	3	2009	1	2	7792.00	2073.00	3.76	2
4420	3	2009	2	0	2765.00	1116.00	2.48	2
4421	3	2009	2	1	4495.00	1021.00	4.40	2
4422	3	2009	2	2	7260.00	2137.00	3.40	2
4423	3	2010	1	0	1887.00	872.00	2.16	2
4424	3	2010	1	1	5006.00	1219.00	4.11	2
4425	3	2010	1	2	6893.00	2091.00	3.30	2
4426	3	2010	2	0	2758.00	1079.00	2.56	2
4427	3	2010	2	1	4547.00	993.00	4.58	2
4428	3	2010	2	2	7305.00	2072.00	3.53	2
4429	3	2011	1	0	2799.00	1052.00	2.66	2
4430	3	2011	1	1	4934.00	1124.00	4.39	2
4431	3	2011	1	2	7733.00	2176.00	3.55	2
4432	3	2011	2	0	2866.00	1207.00	2.37	2
4433	3	2011	2	1	4615.00	1022.00	4.52	2
4434	3	2011	2	2	7481.00	2229.00	3.36	2
4435	3	2012	1	0	2937.00	1170.00	2.51	2
4436	3	2012	1	1	5306.00	1218.00	4.36	2
4437	3	2012	1	2	8243.00	2388.00	3.45	2
4438	3	2012	2	0	2635.00	1183.00	2.23	2
4439	3	2012	2	1	4969.00	1120.00	4.44	2
4440	3	2012	2	2	7604.00	2303.00	3.30	2
4441	3	2013	1	0	2842.00	1152.00	2.47	2
4442	3	2013	1	1	5679.00	1286.00	4.42	2
4443	3	2013	1	2	8521.00	2438.00	3.50	2
4444	3	2013	2	0	2443.00	1070.00	2.28	2
4445	3	2013	2	1	5680.00	1286.00	4.42	2
4446	3	2013	2	2	8123.00	2356.00	3.45	2
4447	3	2014	1	0	2782.00	1181.00	2.36	2
4448	3	2014	1	1	5568.00	1316.00	4.23	2
4449	3	2014	1	2	8350.00	2497.00	3.34	2
4450	3	2014	2	0	2657.00	1187.00	2.24	2
4451	3	2014	2	1	5486.00	1233.00	4.45	2
4452	3	2014	2	2	8143.00	2420.00	3.36	2
4453	3	2015	1	0	1911.00	866.00	2.21	2
4454	3	2015	1	1	5294.00	1281.00	4.13	2
4455	3	2015	1	2	7205.00	2147.00	3.36	2
4456	3	2015	2	0	1827.00	875.00	2.09	2
4457	3	2015	2	1	5205.00	1185.00	4.39	2
4458	3	2015	2	2	7032.00	2060.00	3.41	2
4459	3	2016	1	0	777.00	390.00	1.99	2
4460	3	2016	1	1	5308.00	1242.00	4.27	2
4461	3	2016	1	2	6085.00	1632.00	3.73	2
4462	3	2016	2	0	1743.00	843.00	2.07	2
4463	3	2016	2	1	5766.00	1309.00	4.40	2
4464	3	2016	2	2	7509.00	2152.00	3.49	2
4465	3	2017	1	0	1322.00	644.00	2.05	2
4466	3	2017	1	1	5429.00	1244.00	4.36	2
4467	3	2017	1	2	6751.00	1888.00	3.58	2
4468	3	2017	2	0	2041.00	1013.00	2.01	2
4469	3	2017	2	1	5597.00	1263.00	4.43	2
4470	3	2017	2	2	7638.00	2276.00	3.36	2
4471	3	2018	1	0	1961.00	862.00	2.27	2
4472	3	2018	1	1	5421.00	1221.00	4.44	2
4473	3	2018	1	2	7382.00	2083.00	3.54	2
4474	3	2018	2	0	2106.00	1010.00	2.09	2
4475	3	2018	2	1	5904.00	1309.00	4.51	2
4476	3	2018	2	2	8010.00	2319.00	3.45	2
4477	3	2019	1	0	1334.22	599.00	2.23	2
4478	3	2019	1	1	5014.56	1167.00	4.30	2
4479	3	2019	1	2	6348.78	1766.00	3.60	2
4480	3	2019	2	0	1959.44	931.00	2.10	2
4481	3	2019	2	1	5321.99	1228.00	4.33	2
4482	3	2019	2	2	7281.43	2159.00	3.37	2
4483	3	2020	1	0	1706.11	709.00	2.41	2
4484	3	2020	1	1	5386.95	1228.00	4.39	2
4485	3	2020	1	2	7093.06	1937.00	3.66	2
4486	3	2020	2	0	2078.37	936.00	2.22	2
4487	3	2020	2	1	5479.90	1262.00	4.34	2
4488	3	2020	2	2	7558.27	2198.00	3.44	2
4489	2	1987	1	0	7830.00	5430.00	1.44	20
4490	2	1987	1	1	1465.00	880.00	1.66	20
4491	2	1987	1	2	9295.00	6310.00	1.47	20
4492	2	1987	2	0	3528.00	2570.00	1.37	20
4493	2	1987	2	1	1692.00	1060.00	1.60	20
4494	2	1987	2	2	5220.00	3630.00	1.44	20
4495	2	1988	1	0	9336.00	6110.00	1.53	20
4496	2	1988	1	1	3928.00	1990.00	1.97	20
4497	2	1988	1	2	13264.00	8100.00	1.64	20
4498	2	1988	2	0	8060.00	4500.00	1.79	20
4499	2	1988	2	1	3361.00	1690.00	1.99	20
4500	2	1988	2	2	11421.00	6190.00	1.85	20
4501	2	1989	1	0	4420.00	3590.00	1.23	20
4502	2	1989	1	1	3220.00	1860.00	1.73	20
4503	2	1989	1	2	7640.00	5450.00	1.40	20
4504	2	1989	2	0	8227.00	6290.00	1.31	20
4505	2	1989	2	1	5959.00	2570.00	2.32	20
4506	2	1989	2	2	14186.00	8860.00	1.60	20
4507	2	1990	1	0	3311.00	3590.00	0.92	20
4508	2	1990	1	1	4162.00	2510.00	1.66	20
4509	2	1990	1	2	7473.00	6100.00	1.23	20
4510	2	1990	2	0	9370.00	4400.00	2.13	20
4511	2	1990	2	1	4894.00	2660.00	1.84	20
4512	2	1990	2	2	14264.00	7060.00	2.02	20
4513	2	1991	1	0	7839.00	4820.00	1.63	20
4514	2	1991	1	1	7239.00	3140.00	2.31	20
4515	2	1991	1	2	15078.00	7960.00	1.89	20
4516	2	1991	2	0	6759.00	3750.00	1.80	20
4517	2	1991	2	1	6025.00	2810.00	2.14	20
4518	2	1991	2	2	12784.00	6560.00	1.95	20
4519	2	1992	1	0	6459.00	3800.00	1.70	20
4520	2	1992	1	1	5597.00	2420.00	2.31	20
4521	2	1992	1	2	12056.00	6220.00	1.94	20
4522	2	1992	2	0	8368.00	4260.00	1.96	20
4523	2	1992	2	1	4255.00	2000.00	2.13	20
4524	2	1992	2	2	12623.00	6260.00	2.02	20
4525	2	1993	1	0	5170.00	2940.00	1.76	20
4526	2	1993	1	1	6755.00	2680.00	2.52	20
4527	2	1993	1	2	11925.00	5620.00	2.12	20
4528	2	1993	2	0	2958.00	1640.00	1.80	20
4529	2	1993	2	1	3046.00	1390.00	2.19	20
4530	2	1993	2	2	6004.00	3030.00	1.98	20
4531	2	1994	1	0	7585.00	3850.00	1.97	20
4532	2	1994	1	1	4312.00	1650.00	2.61	20
4533	2	1994	1	2	11897.00	5500.00	2.16	20
4534	2	1994	2	0	6449.00	3500.00	1.84	20
4535	2	1994	2	1	3481.00	1560.00	2.23	20
4536	2	1994	2	2	9930.00	5060.00	1.96	20
4537	2	1995	1	0	6027.00	2980.00	2.02	20
4538	2	1995	1	1	5960.00	2630.00	2.27	20
4539	2	1995	1	2	11987.00	5610.00	2.14	20
4540	2	1995	2	0	4806.00	2850.00	1.69	20
4541	2	1995	2	1	4068.00	1970.00	2.06	20
4542	2	1995	2	2	8874.00	4820.00	1.84	20
4543	2	1996	1	0	7163.00	3770.00	1.90	20
4544	2	1996	1	1	5341.00	2250.00	2.37	20
4545	2	1996	1	2	12504.00	6020.00	2.08	20
4546	2	1996	2	0	7362.00	3720.00	1.98	20
4547	2	1996	2	1	7554.00	3630.00	2.08	20
4548	2	1996	2	2	14916.00	7350.00	2.03	20
4549	2	1997	1	0	6196.00	3320.00	1.87	20
4550	2	1997	1	1	6360.00	2420.00	2.63	20
4551	2	1997	1	2	12556.00	5740.00	2.19	20
4552	2	1997	2	0	4225.00	2720.00	1.55	20
4553	2	1997	2	1	4233.00	2120.00	2.00	20
4554	2	1997	2	2	8458.00	4840.00	1.75	20
4555	2	1998	1	0	4257.00	2285.00	1.86	20
4556	2	1998	1	1	4626.00	1985.00	2.33	20
4557	2	1998	1	2	8883.00	4270.00	2.08	20
4558	2	1998	2	0	729.00	540.00	1.35	20
4559	2	1998	2	1	1122.00	665.00	1.69	20
4560	2	1998	2	2	1851.00	1205.00	1.54	20
4561	2	1999	1	0	8655.00	3740.00	2.31	20
4562	2	1999	1	1	4332.00	1770.00	2.45	20
4563	2	1999	1	2	12987.00	5510.00	2.36	20
4564	2	1999	2	0	7899.00	3340.00	2.36	20
4565	2	1999	2	1	7130.00	2650.00	2.69	20
4566	2	1999	2	2	15029.00	5990.00	2.51	20
4567	2	2000	1	0	8673.00	4480.00	1.94	20
4568	2	2000	1	1	4822.00	1980.00	2.44	20
4569	2	2000	1	2	13495.00	6460.00	2.09	20
4570	2	2000	2	0	4623.00	2570.00	1.80	20
4571	2	2000	2	1	3883.00	1540.00	2.52	20
4572	2	2000	2	2	8506.00	4110.00	2.07	20
4573	2	2001	1	0	8781.00	4140.00	2.12	20
4574	2	2001	1	1	5239.00	1910.00	2.74	20
4575	2	2001	1	2	14020.00	6050.00	2.32	20
4576	2	2001	2	0	5861.00	2740.00	2.14	20
4577	2	2001	2	1	4928.00	1830.00	2.69	20
4578	2	2001	2	2	10789.00	4570.00	2.36	20
4579	2	2002	1	0	6776.00	2738.00	2.47	20
4580	2	2002	1	1	5308.00	1977.00	2.68	20
4581	2	2002	1	2	12084.00	4715.00	2.56	20
4582	2	2002	2	0	3993.00	1698.00	2.35	20
4583	2	2002	2	1	6456.00	2450.00	2.64	20
4584	2	2002	2	2	10449.00	4148.00	2.52	20
4585	2	2003	1	0	6825.00	2793.00	2.44	20
4586	2	2003	1	1	8568.00	3030.00	2.83	20
4587	2	2003	1	2	15393.00	5823.00	2.64	20
4588	2	2003	2	0	8373.00	3760.00	2.23	20
4589	2	2003	2	1	6192.00	2350.00	2.63	20
4590	2	2003	2	2	14565.00	6110.00	2.38	20
4591	2	2004	1	0	11284.00	4590.00	2.46	20
4592	2	2004	1	1	5141.00	1813.00	2.84	20
4593	2	2004	1	2	16425.00	6403.00	2.57	20
4594	2	2004	2	0	6359.00	2883.00	2.21	20
4595	2	2004	2	1	5936.00	2120.00	2.80	20
4596	2	2004	2	2	12295.00	5003.00	2.46	20
4597	2	2005	1	0	10995.00	4052.00	2.71	20
4598	2	2005	1	1	5295.00	1750.00	3.03	20
4599	2	2005	1	2	16290.00	5802.00	2.81	20
4600	2	2005	2	0	7726.00	2922.00	2.64	20
4601	2	2005	2	1	5916.00	1932.00	3.06	20
4602	2	2005	2	2	13642.00	4854.00	2.81	20
4603	2	2006	1	0	11217.00	4112.00	2.73	20
4604	2	2006	1	1	6085.00	1952.00	3.12	20
4605	2	2006	1	2	17302.00	6064.00	2.85	20
4606	2	2006	2	0	11416.00	4105.00	2.78	20
4607	2	2006	2	1	6600.00	1980.00	3.33	20
4608	2	2006	2	2	18016.00	6085.00	2.96	20
4609	2	2007	1	0	12047.00	4064.00	2.96	20
4610	2	2007	1	1	8004.00	2392.00	3.35	20
4611	2	2007	1	2	20051.00	6456.00	3.11	20
4612	2	2007	2	0	5594.00	2280.00	2.45	20
4613	2	2007	2	1	7965.00	3328.00	2.39	20
4614	2	2007	2	2	13559.00	5608.00	2.42	20
4615	2	2008	1	0	8044.00	3300.00	2.44	20
4616	2	2008	1	1	8382.00	2337.00	3.59	20
4617	2	2008	1	2	16426.00	5637.00	2.91	20
4618	2	2008	2	0	9777.00	3222.00	3.03	20
4619	2	2008	2	1	10407.00	2741.00	3.80	20
4620	2	2008	2	2	20184.00	5963.00	3.38	20
4621	2	2009	1	0	6239.00	2187.00	2.85	20
4622	2	2009	1	1	11730.00	3409.00	3.44	20
4623	2	2009	1	2	17969.00	5596.00	3.21	20
4624	2	2009	2	0	10823.00	4217.00	2.57	20
4625	2	2009	2	1	9268.00	3180.00	2.91	20
4626	2	2009	2	2	20091.00	7397.00	2.72	20
4627	2	2010	1	0	6085.00	2102.00	2.89	20
4628	2	2010	1	1	8066.00	2406.00	3.35	20
4629	2	2010	1	2	14151.00	4508.00	3.14	20
4630	2	2010	2	0	11301.00	4650.00	2.43	20
4631	2	2010	2	1	9104.00	3082.00	2.95	20
4632	2	2010	2	2	20405.00	7732.00	2.64	20
4633	2	2011	1	0	9372.00	3442.00	2.72	20
4634	2	2011	1	1	8601.00	2530.00	3.40	20
4635	2	2011	1	2	17973.00	5972.00	3.01	20
4636	2	2011	2	0	15858.00	5801.00	2.73	20
4637	2	2011	2	1	10116.00	3379.00	2.99	20
4638	2	2011	2	2	25974.00	9180.00	2.83	20
4639	2	2012	1	0	12109.00	4195.00	2.89	20
4640	2	2012	1	1	8820.00	2830.00	3.12	20
4641	2	2012	1	2	20929.00	7025.00	2.98	20
4642	2	2012	2	0	5367.00	1947.00	2.76	20
4643	2	2012	2	1	6034.00	1952.00	3.09	20
4644	2	2012	2	2	11401.00	3899.00	2.92	20
4645	2	2013	1	0	9296.00	3418.00	2.72	20
4646	2	2013	1	1	8254.00	2630.00	3.14	20
4647	2	2013	1	2	17550.00	6048.00	2.90	20
4648	2	2013	2	0	5087.00	1929.00	2.64	20
4649	2	2013	2	1	6851.00	2362.00	2.90	20
4650	2	2013	2	2	11938.00	4291.00	2.78	20
4651	2	2014	1	0	12204.00	4156.00	2.94	20
4652	2	2014	1	1	11151.00	3317.00	3.36	20
4653	2	2014	1	2	23355.00	7473.00	3.13	20
4654	2	2014	2	0	5567.00	1981.00	2.81	20
4655	2	2014	2	1	6530.00	2044.00	3.19	20
4656	2	2014	2	2	12097.00	4025.00	3.01	20
4657	2	2015	1	0	10390.00	3333.00	3.12	20
4658	2	2015	1	1	8589.00	2409.00	3.57	20
4659	2	2015	1	2	18979.00	5742.00	3.31	20
4660	2	2015	2	0	6453.00	2166.00	2.98	20
4661	2	2015	2	1	10309.00	2755.00	3.74	20
4662	2	2015	2	2	16762.00	4921.00	3.41	20
4663	2	2016	1	0	8720.00	3012.00	2.90	20
4664	2	2016	1	1	10369.00	2865.00	3.62	20
4665	2	2016	1	2	19089.00	5877.00	3.25	20
4666	2	2016	2	0	5407.00	2612.00	2.07	20
4667	2	2016	2	1	9569.00	3146.00	3.04	20
4668	2	2016	2	2	14976.00	5758.00	2.60	20
4669	2	2017	1	0	8746.00	3206.00	2.73	20
4670	2	2017	1	1	9913.00	2865.00	3.46	20
4671	2	2017	1	2	18659.00	6071.00	3.07	20
4672	2	2017	2	0	9524.00	3508.00	2.71	20
4673	2	2017	2	1	9606.00	2770.00	3.47	20
4674	2	2017	2	2	19130.00	6278.00	3.05	20
4675	2	2018	1	0	10185.00	3508.00	2.90	20
4676	2	2018	1	1	10815.00	2869.00	3.77	20
4677	2	2018	1	2	21000.00	6377.00	3.29	20
4678	2	2018	2	0	7600.42	2867.00	2.65	20
4679	2	2018	2	1	11344.46	2889.00	3.93	20
4680	2	2018	2	2	18944.88	5756.00	3.29	20
4681	2	2019	1	0	7323.06	2874.00	2.55	20
4682	2	2019	1	1	7528.00	2224.00	3.38	20
4683	2	2019	1	2	14851.06	5098.00	2.91	20
4684	2	2019	2	0	5659.91	2393.00	2.37	20
4685	2	2019	2	1	6819.71	2453.60	2.78	20
4686	2	2019	2	2	12479.62	4846.60	2.57	20
4687	2	2020	1	0	6194.39	2292.00	2.70	20
4688	2	2020	1	1	7403.78	1934.00	3.83	20
4689	2	2020	1	2	13598.17	4226.00	3.22	20
4690	2	2020	2	0	6855.15	2728.53	2.51	20
4691	2	2020	2	1	6565.77	1960.46	3.35	20
4692	2	2020	2	2	13420.92	4688.99	2.86	20
4693	2	1987	1	0	\N	\N	\N	21
4694	2	1987	1	1	12120.00	4360.00	2.78	21
4695	2	1987	1	2	12120.00	4360.00	2.78	21
4696	2	1987	2	0	3092.00	3050.00	1.01	21
4697	2	1987	2	1	23192.00	8210.00	2.82	21
4698	2	1987	2	2	26284.00	11260.00	2.33	21
4699	2	1988	1	0	156.00	60.00	2.60	21
4700	2	1988	1	1	14850.00	5270.00	2.82	21
4701	2	1988	1	2	15006.00	5330.00	2.82	21
4702	2	1988	2	0	2983.00	2890.00	1.03	21
4703	2	1988	2	1	22014.00	9490.00	2.32	21
4704	2	1988	2	2	24997.00	12380.00	2.02	21
4705	2	1989	1	0	31.00	20.00	1.55	21
4706	2	1989	1	1	16876.00	5490.00	3.07	21
4707	2	1989	1	2	16907.00	5510.00	3.07	21
4708	2	1989	2	0	2023.00	1510.00	1.34	21
4709	2	1989	2	1	30521.00	9220.00	3.31	21
4710	2	1989	2	2	32544.00	10730.00	3.03	21
4711	2	1990	1	0	\N	\N	\N	21
4712	2	1990	1	1	13597.00	4520.00	3.01	21
4713	2	1990	1	2	13597.00	4520.00	3.01	21
4714	2	1990	2	0	7286.00	4660.00	1.56	21
4715	2	1990	2	1	39066.00	9140.00	4.27	21
4716	2	1990	2	2	46352.00	13800.00	3.36	21
4717	2	1991	1	0	\N	\N	\N	21
4718	2	1991	1	1	18444.00	5260.00	3.51	21
4719	2	1991	1	2	18444.00	5260.00	3.51	21
4720	2	1991	2	0	7446.00	4560.00	1.63	21
4721	2	1991	2	1	37301.00	9560.00	3.90	21
4722	2	1991	2	2	44747.00	14120.00	3.17	21
4723	2	1992	1	0	\N	\N	\N	21
4724	2	1992	1	1	17312.00	5120.00	3.38	21
4725	2	1992	1	2	17312.00	5120.00	3.38	21
4726	2	1992	2	0	8294.00	4290.00	1.93	21
4727	2	1992	2	1	35529.00	8570.00	4.15	21
4728	2	1992	2	2	43823.00	12860.00	3.41	21
4729	2	1993	1	0	\N	\N	\N	21
4730	2	1993	1	1	13938.00	4510.00	3.09	21
4731	2	1993	1	2	13938.00	4510.00	3.09	21
4732	2	1993	2	0	5782.00	3610.00	1.60	21
4733	2	1993	2	1	32036.00	8290.00	3.86	21
4734	2	1993	2	2	37818.00	11900.00	3.18	21
4735	2	1994	1	0	\N	\N	\N	21
4736	2	1994	1	1	17915.00	5820.00	3.08	21
4737	2	1994	1	2	17915.00	5820.00	3.08	21
4738	2	1994	2	0	4727.00	4430.00	1.07	21
4739	2	1994	2	1	25600.00	7500.00	3.41	21
4740	2	1994	2	2	30327.00	11930.00	2.54	21
4741	2	1995	1	0	\N	\N	\N	21
4742	2	1995	1	1	15373.00	5150.00	2.99	21
4743	2	1995	1	2	15373.00	5150.00	2.99	21
4744	2	1995	2	0	3617.00	3475.00	1.04	21
4745	2	1995	2	1	16259.00	6372.00	2.55	21
4746	2	1995	2	2	19876.00	9847.00	2.02	21
4747	2	1996	1	0	\N	\N	\N	21
4748	2	1996	1	1	18483.00	5418.00	3.41	21
4749	2	1996	1	2	18483.00	5418.00	3.41	21
4750	2	1996	2	0	4450.00	3240.00	1.37	21
4751	2	1996	2	1	24314.00	7413.00	3.28	21
4752	2	1996	2	2	28764.00	10653.00	2.70	21
4753	2	1997	1	0	\N	\N	\N	21
4754	2	1997	1	1	18317.00	5645.00	3.24	21
4755	2	1997	1	2	18317.00	5645.00	3.24	21
4756	2	1997	2	0	7699.00	3786.00	2.03	21
4757	2	1997	2	1	27615.00	7050.00	3.92	21
4758	2	1997	2	2	35314.00	10836.00	3.26	21
4759	2	1998	1	0	\N	\N	\N	21
4760	2	1998	1	1	14241.00	4800.00	2.97	21
4761	2	1998	1	2	14241.00	4800.00	2.97	21
4762	2	1998	2	0	4890.00	3700.00	1.32	21
4763	2	1998	2	1	20190.00	6405.00	3.15	21
4764	2	1998	2	2	25080.00	10105.00	2.48	21
4765	2	1999	1	0	\N	\N	\N	21
4766	2	1999	1	1	17375.00	5300.00	3.28	21
4767	2	1999	1	2	17375.00	5300.00	3.28	21
4768	2	1999	2	0	7580.00	3800.00	1.99	21
4769	2	1999	2	1	27818.00	7415.00	3.75	21
4770	2	1999	2	2	35398.00	11215.00	3.16	21
4771	2	2000	1	0	\N	\N	\N	21
4772	2	2000	1	1	17842.00	5246.00	3.40	21
4773	2	2000	1	2	17842.00	5246.00	3.40	21
4774	2	2000	2	0	3174.00	2667.00	1.19	21
4775	2	2000	2	1	17660.00	6034.00	2.93	21
4776	2	2000	2	2	20834.00	8701.00	2.39	21
4777	2	2001	1	0	\N	\N	\N	21
4778	2	2001	1	1	21282.00	5450.00	3.90	21
4779	2	2001	1	2	21282.00	5450.00	3.90	21
4780	2	2001	2	0	7515.00	3160.00	2.38	21
4781	2	2001	2	1	25680.00	6624.00	3.88	21
4782	2	2001	2	2	33195.00	9784.00	3.39	21
4783	2	2002	1	0	\N	\N	\N	21
4784	2	2002	1	1	17204.00	5100.00	3.37	21
4785	2	2002	1	2	17204.00	5100.00	3.37	21
4786	2	2002	2	0	6965.00	2850.00	2.44	21
4787	2	2002	2	1	24995.00	6724.00	3.72	21
4788	2	2002	2	2	31960.00	9574.00	3.34	21
4789	2	2003	1	0	\N	\N	\N	21
4790	2	2003	1	1	16585.00	5108.00	3.25	21
4791	2	2003	1	2	16585.00	5108.00	3.25	21
4792	2	2003	2	0	7050.00	2890.00	2.44	21
4793	2	2003	2	1	26244.00	6740.00	3.89	21
4794	2	2003	2	2	33294.00	9630.00	3.46	21
4795	2	2004	1	0	\N	\N	\N	21
4796	2	2004	1	1	19097.00	5000.00	3.82	21
4797	2	2004	1	2	19097.00	5000.00	3.82	21
4798	2	2004	2	0	3584.00	2750.00	1.30	21
4799	2	2004	2	1	29654.00	6740.00	4.40	21
4800	2	2004	2	2	33238.00	9490.00	3.50	21
4801	2	2005	1	0	\N	\N	\N	21
4802	2	2005	1	1	22080.00	5200.00	4.25	21
4803	2	2005	1	2	22080.00	5200.00	4.25	21
4804	2	2005	2	0	4900.00	2600.00	1.88	21
4805	2	2005	2	1	29908.00	6500.00	4.60	21
4806	2	2005	2	2	34808.00	9100.00	3.83	21
4807	2	2006	1	0	\N	\N	\N	21
4808	2	2006	1	1	20475.00	5100.00	4.01	21
4809	2	2006	1	2	20475.00	5100.00	4.01	21
4810	2	2006	2	0	2617.00	2321.00	1.13	21
4811	2	2006	2	1	14525.00	4514.00	3.22	21
4812	2	2006	2	2	17142.00	6835.00	2.51	21
4813	2	2007	1	0	\N	\N	\N	21
4814	2	2007	1	1	18291.00	4550.00	4.02	21
4815	2	2007	1	2	18291.00	4550.00	4.02	21
4816	2	2007	2	0	3939.00	1890.00	2.08	21
4817	2	2007	2	1	16455.00	4380.00	3.76	21
4818	2	2007	2	2	20394.00	6270.00	3.25	21
4819	2	2008	1	0	\N	\N	\N	21
4820	2	2008	1	1	13435.00	3418.00	3.93	21
4821	2	2008	1	2	13435.00	3418.00	3.93	21
4822	2	2008	2	0	4948.00	2083.00	2.38	21
4823	2	2008	2	1	23314.00	5900.00	3.95	21
4824	2	2008	2	2	28262.00	7983.00	3.54	21
4825	2	2009	1	0	\N	\N	\N	21
4826	2	2009	1	1	15474.00	4250.00	3.64	21
4827	2	2009	1	2	15474.00	4250.00	3.64	21
4828	2	2009	2	0	3746.00	1870.00	2.00	21
4829	2	2009	2	1	19899.00	6244.00	3.19	21
4830	2	2009	2	2	23645.00	8114.00	2.91	21
4831	2	2010	1	0	\N	\N	\N	21
4832	2	2010	1	1	16340.00	4231.00	3.86	21
4833	2	2010	1	2	16340.00	4231.00	3.86	21
4834	2	2010	2	0	3439.00	1400.00	2.46	21
4835	2	2010	2	1	26835.00	6299.00	4.26	21
4836	2	2010	2	2	30274.00	7699.00	3.93	21
4837	2	2011	1	0	\N	\N	\N	21
4838	2	2011	1	1	16738.00	4595.00	3.64	21
4839	2	2011	1	2	16738.00	4595.00	3.64	21
4840	2	2011	2	0	3489.00	1867.00	1.87	21
4841	2	2011	2	1	18255.00	6020.00	3.03	21
4842	2	2011	2	2	21744.00	7887.00	2.76	21
4843	2	2012	1	0	\N	\N	\N	21
4844	2	2012	1	1	16566.00	4200.00	3.94	21
4845	2	2012	1	2	16566.00	4200.00	3.94	21
4846	2	2012	2	0	2713.00	1280.00	2.12	21
4847	2	2012	2	1	19216.00	5627.00	3.41	21
4848	2	2012	2	2	21929.00	6907.00	3.17	21
4849	2	2013	1	0	\N	\N	\N	21
4850	2	2013	1	1	16303.00	4275.00	3.81	21
4851	2	2013	1	2	16303.00	4275.00	3.81	21
4852	2	2013	2	0	2804.00	1348.00	2.08	21
4853	2	2013	2	1	23070.00	5876.00	3.93	21
4854	2	2013	2	2	25874.00	7224.00	3.58	21
4855	2	2014	1	0	\N	\N	\N	21
4856	2	2014	1	1	17279.00	4438.00	3.89	21
4857	2	2014	1	2	17279.00	4438.00	3.89	21
4858	2	2014	2	0	1796.00	835.00	2.15	21
4859	2	2014	2	1	27205.00	6510.00	4.18	21
4860	2	2014	2	2	29001.00	7345.00	3.95	21
4861	2	2015	1	0	\N	\N	\N	21
4862	2	2015	1	1	18804.00	4580.00	4.11	21
4863	2	2015	1	2	18804.00	4580.00	4.11	21
4864	2	2015	2	0	1673.00	826.00	2.03	21
4865	2	2015	2	1	21884.00	6228.00	3.51	21
4866	2	2015	2	2	23557.00	7054.00	3.34	21
4867	2	2016	1	0	\N	\N	\N	21
4868	2	2016	1	1	17446.00	4410.00	3.96	21
4869	2	2016	1	2	17446.00	4410.00	3.96	21
4870	2	2016	2	0	1345.00	650.00	2.07	21
4871	2	2016	2	1	16855.00	5512.00	3.06	21
4872	2	2016	2	2	18200.00	6162.00	2.95	21
4873	2	2017	1	0	0.00	0.00	\N	21
4874	2	2017	1	1	16884.00	4250.00	3.97	21
4875	2	2017	1	2	16884.00	4250.00	3.97	21
4876	2	2017	2	0	1389.00	650.00	2.14	21
4877	2	2017	2	1	16459.00	5095.00	3.23	21
4878	2	2017	2	2	17848.00	5745.00	3.11	21
4879	2	2018	1	0	0.00	0.00	\N	21
4880	2	2018	1	1	16817.00	4548.00	3.70	21
4881	2	2018	1	2	16817.00	4548.00	3.70	21
4882	2	2018	2	0	1573.44	651.00	2.42	21
4883	2	2018	2	1	18648.28	5119.00	3.64	21
4884	2	2018	2	2	20221.72	5770.00	3.50	21
4885	2	2019	1	0	0.00	0.00	\N	21
4886	2	2019	1	1	12300.68	3379.00	3.64	21
4887	2	2019	1	2	12300.68	3379.00	3.64	21
4888	2	2019	2	0	1493.85	648.00	2.31	21
4889	2	2019	2	1	16200.08	4078.00	3.97	21
4890	2	2019	2	2	17693.93	4726.00	3.74	21
4891	2	2020	1	0	0.00	0.00	\N	21
4892	2	2020	1	1	11299.60	3112.89	3.63	21
4893	2	2020	1	2	11299.60	3112.89	3.63	21
4894	2	2020	2	0	1211.00	650.00	1.86	21
4895	2	2020	2	1	12116.00	3617.24	3.35	21
4896	2	2020	2	2	13327.00	4267.24	3.12	21
4897	2	1987	1	0	3075.00	3220.00	0.95	22
4898	2	1987	1	1	1890.00	1740.00	1.09	22
4899	2	1987	1	2	4965.00	4960.00	1.00	22
4900	2	1987	2	0	651.00	470.00	1.39	22
4901	2	1987	2	1	3719.00	2440.00	1.52	22
4902	2	1987	2	2	4370.00	2910.00	1.50	22
4903	2	1988	1	0	2053.00	2340.00	0.88	22
4904	2	1988	1	1	2644.00	2500.00	1.06	22
4905	2	1988	1	2	4697.00	4840.00	0.97	22
4906	2	1988	2	0	1468.00	1230.00	1.19	22
4907	2	1988	2	1	3559.00	1950.00	1.83	22
4908	2	1988	2	2	5027.00	3180.00	1.58	22
4909	2	1989	1	0	3317.00	3370.00	0.98	22
4910	2	1989	1	1	1828.00	1550.00	1.18	22
4911	2	1989	1	2	5145.00	4920.00	1.05	22
4912	2	1989	2	0	3705.00	3140.00	1.18	22
4913	2	1989	2	1	3945.00	1860.00	2.12	22
4914	2	1989	2	2	7650.00	5000.00	1.53	22
4915	2	1990	1	0	2091.00	3180.00	0.66	22
4916	2	1990	1	1	2645.00	2130.00	1.24	22
4917	2	1990	1	2	4736.00	5310.00	0.89	22
4918	2	1990	2	0	1393.00	1330.00	1.05	22
4919	2	1990	2	1	5425.00	2880.00	1.88	22
4920	2	1990	2	2	6818.00	4210.00	1.62	22
4921	2	1991	1	0	1411.00	2230.00	0.63	22
4922	2	1991	1	1	2166.00	2200.00	0.98	22
4923	2	1991	1	2	3577.00	4430.00	0.81	22
4924	2	1991	2	0	1870.00	1840.00	1.02	22
4925	2	1991	2	1	4352.00	2680.00	1.62	22
4926	2	1991	2	2	6222.00	4520.00	1.38	22
4927	2	1992	1	0	473.00	690.00	0.69	22
4928	2	1992	1	1	1380.00	1520.00	0.91	22
4929	2	1992	1	2	1853.00	2210.00	0.84	22
4930	2	1992	2	0	561.00	750.00	0.75	22
4931	2	1992	2	1	3037.00	1580.00	1.92	22
4932	2	1992	2	2	3598.00	2330.00	1.54	22
4933	2	1993	1	0	160.00	250.00	0.64	22
4934	2	1993	1	1	2478.00	1940.00	1.28	22
4935	2	1993	1	2	2638.00	2190.00	1.20	22
4936	2	1993	2	0	595.00	350.00	1.70	22
4937	2	1993	2	1	2454.00	1120.00	2.19	22
4938	2	1993	2	2	3049.00	1470.00	2.07	22
4939	2	1994	1	0	744.00	640.00	1.16	22
4940	2	1994	1	1	3606.00	1720.00	2.10	22
4941	2	1994	1	2	4350.00	2360.00	1.84	22
4942	2	1994	2	0	956.00	780.00	1.23	22
4943	2	1994	2	1	4034.00	1610.00	2.51	22
4944	2	1994	2	2	4990.00	2390.00	2.09	22
4945	2	1995	1	0	831.00	760.00	1.09	22
4946	2	1995	1	1	5088.00	1940.00	2.62	22
4947	2	1995	1	2	5919.00	2700.00	2.19	22
4948	2	1995	2	0	1210.00	895.00	1.35	22
4949	2	1995	2	1	4173.00	1535.00	2.72	22
4950	2	1995	2	2	5383.00	2430.00	2.22	22
4951	2	1996	1	0	698.00	580.00	1.20	22
4952	2	1996	1	1	4668.00	1795.00	2.60	22
4953	2	1996	1	2	5366.00	2375.00	2.26	22
4954	2	1996	2	0	1386.00	940.00	1.47	22
4955	2	1996	2	1	5239.00	1911.00	2.74	22
4956	2	1996	2	2	6625.00	2851.00	2.32	22
4957	2	1997	1	0	801.00	681.00	1.18	22
4958	2	1997	1	1	5802.00	2030.00	2.86	22
4959	2	1997	1	2	6603.00	2711.00	2.44	22
4960	2	1997	2	0	455.00	330.00	1.38	22
4961	2	1997	2	1	6375.00	2032.00	3.14	22
4962	2	1997	2	2	6830.00	2362.00	2.89	22
4963	2	1998	1	0	\N	\N	\N	22
4964	2	1998	1	1	3030.00	1500.00	2.02	22
4965	2	1998	1	2	3030.00	1500.00	2.02	22
4966	2	1998	2	0	96.00	60.00	1.60	22
4967	2	1998	2	1	3990.00	1300.00	3.07	22
4968	2	1998	2	2	4086.00	1360.00	3.00	22
4969	2	1999	1	0	1316.00	820.00	1.60	22
4970	2	1999	1	1	6416.00	2310.00	2.78	22
4971	2	1999	1	2	7732.00	3130.00	2.47	22
4972	2	1999	2	0	620.00	390.00	1.59	22
4973	2	1999	2	1	5517.00	1985.00	2.78	22
4974	2	1999	2	2	6137.00	2375.00	2.58	22
4975	2	2000	1	0	538.00	450.00	1.20	22
4976	2	2000	1	1	5748.00	2380.00	2.42	22
4977	2	2000	1	2	6286.00	2830.00	2.22	22
4978	2	2000	2	0	464.00	320.00	1.45	22
4979	2	2000	2	1	6542.00	2390.00	2.74	22
4980	2	2000	2	2	7006.00	2710.00	2.59	22
4981	2	2001	1	0	601.00	410.00	1.47	22
4982	2	2001	1	1	6341.00	2315.00	2.74	22
4983	2	2001	1	2	6942.00	2725.00	2.55	22
4984	2	2001	2	0	320.00	225.00	1.42	22
4985	2	2001	2	1	7551.00	2445.00	3.09	22
4986	2	2001	2	2	7871.00	2670.00	2.95	22
4987	2	2002	1	0	535.00	380.00	1.41	22
4988	2	2002	1	1	6538.00	2290.00	2.86	22
4989	2	2002	1	2	7073.00	2670.00	2.65	22
4990	2	2002	2	0	300.00	200.00	1.50	22
4991	2	2002	2	1	8226.00	2595.00	3.17	22
4992	2	2002	2	2	8526.00	2795.00	3.05	22
4993	2	2003	1	0	96.00	80.00	1.20	22
4994	2	2003	1	1	5338.00	2000.00	2.67	22
4995	2	2003	1	2	5434.00	2080.00	2.61	22
4996	2	2003	2	0	300.00	200.00	1.50	22
4997	2	2003	2	1	8456.00	2680.00	3.16	22
4998	2	2003	2	2	8756.00	2880.00	3.04	22
4999	2	2004	1	0	205.00	160.00	1.28	22
5000	2	2004	1	1	6278.00	2110.00	2.98	22
5001	2	2004	1	2	6483.00	2270.00	2.86	22
5002	2	2004	2	0	358.00	225.00	1.59	22
5003	2	2004	2	1	8066.00	2694.00	2.99	22
5004	2	2004	2	2	8424.00	2919.00	2.89	22
5005	2	2005	1	0	73.00	67.00	1.09	22
5006	2	2005	1	1	4759.00	1879.00	2.53	22
5007	2	2005	1	2	4832.00	1946.00	2.48	22
5008	2	2005	2	0	344.00	215.00	1.60	22
5009	2	2005	2	1	8126.00	2628.00	3.09	22
5010	2	2005	2	2	8470.00	2843.00	2.98	22
5011	2	2006	1	0	149.00	130.00	1.15	22
5012	2	2006	1	1	5796.00	2160.00	2.68	22
5013	2	2006	1	2	5945.00	2290.00	2.60	22
5014	2	2006	2	0	448.00	290.00	1.54	22
5015	2	2006	2	1	7030.00	2494.00	2.82	22
5016	2	2006	2	2	7478.00	2784.00	2.69	22
5017	2	2007	1	0	32.00	30.00	1.07	22
5018	2	2007	1	1	5101.00	1938.00	2.63	22
5019	2	2007	1	2	5133.00	1968.00	2.61	22
5020	2	2007	2	0	556.00	325.00	1.71	22
5021	2	2007	2	1	9080.00	2664.00	3.41	22
5022	2	2007	2	2	9636.00	2989.00	3.22	22
5023	2	2008	1	0	236.00	170.00	1.39	22
5024	2	2008	1	1	6792.00	2120.00	3.20	22
5025	2	2008	1	2	7028.00	2290.00	3.07	22
5026	2	2008	2	0	524.00	300.00	1.75	22
5027	2	2008	2	1	8589.00	2643.00	3.25	22
5028	2	2008	2	2	9113.00	2943.00	3.10	22
5029	2	2009	1	0	267.00	148.00	1.80	22
5030	2	2009	1	1	6673.00	2120.00	3.15	22
5031	2	2009	1	2	6940.00	2268.00	3.06	22
5032	2	2009	2	0	539.00	301.00	1.79	22
5033	2	2009	2	1	8519.00	2610.00	3.26	22
5034	2	2009	2	2	9058.00	2911.00	3.11	22
5035	2	2010	1	0	175.00	105.00	1.67	22
5036	2	2010	1	1	6925.00	2107.00	3.29	22
5037	2	2010	1	2	7100.00	2212.00	3.21	22
5038	2	2010	2	0	628.00	323.00	1.94	22
5039	2	2010	2	1	7587.00	2209.00	3.43	22
5040	2	2010	2	2	8215.00	2532.00	3.24	22
5041	2	2011	1	0	280.00	185.00	1.51	22
5042	2	2011	1	1	7364.00	2280.00	3.23	22
5043	2	2011	1	2	7644.00	2465.00	3.10	22
5044	2	2011	2	0	861.00	432.00	1.99	22
5045	2	2011	2	1	8433.00	2470.00	3.41	22
5046	2	2011	2	2	9294.00	2902.00	3.20	22
5047	2	2012	1	0	402.00	200.00	2.01	22
5048	2	2012	1	1	7177.00	2183.00	3.29	22
5049	2	2012	1	2	7579.00	2383.00	3.18	22
5050	2	2012	2	0	845.00	422.00	2.00	22
5051	2	2012	2	1	8511.00	2475.00	3.44	22
5052	2	2012	2	2	9356.00	2897.00	3.23	22
5053	2	2013	1	0	328.00	180.00	1.82	22
5054	2	2013	1	1	7626.00	2237.00	3.41	22
5055	2	2013	1	2	7954.00	2417.00	3.29	22
5056	2	2013	2	0	839.00	412.00	2.04	22
5057	2	2013	2	1	8867.00	2517.00	3.52	22
5058	2	2013	2	2	9706.00	2929.00	3.31	22
5059	2	2014	1	0	341.00	188.00	1.81	22
5060	2	2014	1	1	7182.00	2121.00	3.39	22
5061	2	2014	1	2	7523.00	2309.00	3.26	22
5062	2	2014	2	0	729.00	359.00	2.03	22
5063	2	2014	2	1	8513.00	2457.00	3.46	22
5064	2	2014	2	2	9242.00	2816.00	3.28	22
5065	2	2015	1	0	275.00	160.00	1.72	22
5066	2	2015	1	1	6763.00	2126.00	3.18	22
5067	2	2015	1	2	7038.00	2286.00	3.08	22
5068	2	2015	2	0	253.00	131.00	1.93	22
5069	2	2015	2	1	7000.00	2063.00	3.39	22
5070	2	2015	2	2	7253.00	2194.00	3.31	22
5071	2	2016	1	0	35.00	20.00	1.75	22
5072	2	2016	1	1	5788.00	1921.00	3.01	22
5073	2	2016	1	2	5823.00	1941.00	3.00	22
5074	2	2016	2	0	376.00	172.00	2.19	22
5075	2	2016	2	1	7347.00	2095.00	3.51	22
5076	2	2016	2	2	7723.00	2267.00	3.41	22
5077	2	2017	1	0	286.00	129.00	2.22	22
5078	2	2017	1	1	6434.00	1892.00	3.40	22
5079	2	2017	1	2	6720.00	2021.00	3.33	22
5080	2	2017	2	0	442.00	202.00	2.19	22
5081	2	2017	2	1	7352.00	2155.00	3.41	22
5082	2	2017	2	2	7794.00	2357.00	3.31	22
5083	2	2018	1	0	362.00	159.00	2.28	22
5084	2	2018	1	1	6549.00	1964.00	3.33	22
5085	2	2018	1	2	6911.00	2123.00	3.26	22
5086	2	2018	2	0	656.00	246.00	2.67	22
5087	2	2018	2	1	6331.00	1895.00	3.34	22
5088	2	2018	2	2	6987.00	2141.00	3.26	22
5089	2	2019	1	0	278.00	129.00	2.16	22
5090	2	2019	1	1	5509.00	1801.00	3.06	22
5091	2	2019	1	2	5787.00	1930.00	3.00	22
5092	2	2019	2	0	392.00	175.00	2.24	22
5093	2	2019	2	1	5230.00	1717.00	3.05	22
5094	2	2019	2	2	5622.00	1892.00	2.97	22
5095	2	2020	1	0	287.00	124.00	2.31	22
5096	2	2020	1	1	4899.00	1510.00	3.24	22
5097	2	2020	1	2	5186.00	1634.00	3.17	22
5098	2	2020	2	0	378.00	180.00	2.10	22
5099	2	2020	2	1	5642.00	1817.00	3.11	22
5100	2	2020	2	2	6020.00	1997.00	3.01	22
5101	2	1987	1	0	16365.00	8490.00	1.93	23
5102	2	1987	1	1	78565.00	22220.00	3.54	23
5103	2	1987	1	2	94930.00	30710.00	3.09	23
5104	2	1987	2	0	52818.00	15320.00	3.45	23
5105	2	1987	2	1	78897.00	17350.00	4.55	23
5106	2	1987	2	2	131715.00	32670.00	4.03	23
5107	2	1988	1	0	35993.00	14220.00	2.53	23
5108	2	1988	1	1	84695.00	22150.00	3.82	23
5109	2	1988	1	2	120688.00	36370.00	3.32	23
5110	2	1988	2	0	49109.00	15300.00	3.21	23
5111	2	1988	2	1	80095.00	18160.00	4.41	23
5112	2	1988	2	2	129204.00	33460.00	3.86	23
5113	2	1989	1	0	42205.00	13710.00	3.08	23
5114	2	1989	1	1	83477.00	22300.00	3.74	23
5115	2	1989	1	2	125682.00	36010.00	3.49	23
5116	2	1989	2	0	68376.00	20800.00	3.29	23
5117	2	1989	2	1	75015.00	18500.00	4.05	23
5118	2	1989	2	2	143391.00	39300.00	3.65	23
5119	2	1990	1	0	24246.00	8850.00	2.74	23
5120	2	1990	1	1	101557.00	25920.00	3.92	23
5121	2	1990	1	2	125803.00	34770.00	3.62	23
5122	2	1990	2	0	39864.00	14630.00	2.72	23
5123	2	1990	2	1	126729.00	30690.00	4.13	23
5124	2	1990	2	2	166593.00	45320.00	3.68	23
5125	2	1991	1	0	32523.00	11370.00	2.86	23
5126	2	1991	1	1	99506.00	25960.00	3.83	23
5127	2	1991	1	2	132029.00	37330.00	3.54	23
5128	2	1991	2	0	17417.00	8050.00	2.16	23
5129	2	1991	2	1	112613.00	30820.00	3.65	23
5130	2	1991	2	2	130030.00	38870.00	3.35	23
5131	2	1992	1	0	1941.00	730.00	2.66	23
5132	2	1992	1	1	64730.00	19120.00	3.39	23
5133	2	1992	1	2	66671.00	19850.00	3.36	23
5134	2	1992	2	0	6042.00	1840.00	3.28	23
5135	2	1992	2	1	84631.00	19630.00	4.31	23
5136	2	1992	2	2	90673.00	21470.00	4.22	23
5137	2	1993	1	0	13357.00	4310.00	3.10	23
5138	2	1993	1	1	78251.00	20320.00	3.85	23
5139	2	1993	1	2	91608.00	24630.00	3.72	23
5140	2	1993	2	0	12452.00	4620.00	2.70	23
5141	2	1993	2	1	81146.00	23930.00	3.39	23
5142	2	1993	2	2	93598.00	28550.00	3.28	23
5143	2	1994	1	0	5996.00	1760.00	3.41	23
5144	2	1994	1	1	102060.00	27320.00	3.74	23
5145	2	1994	1	2	108056.00	29080.00	3.72	23
5146	2	1994	2	0	3170.00	1280.00	2.48	23
5147	2	1994	2	1	91414.00	24550.00	3.72	23
5148	2	1994	2	2	94584.00	25830.00	3.66	23
5149	2	1995	1	0	6632.00	1690.00	3.92	23
5150	2	1995	1	1	94418.00	26440.00	3.57	23
5151	2	1995	1	2	101050.00	28130.00	3.59	23
5152	2	1995	2	0	7630.00	1880.00	4.06	23
5153	2	1995	2	1	97618.00	27160.00	3.59	23
5154	2	1995	2	2	105248.00	29040.00	3.62	23
5155	2	1996	1	0	8100.00	2569.00	3.15	23
5156	2	1996	1	1	91353.00	26221.00	3.48	23
5157	2	1996	1	2	99453.00	28790.00	3.45	23
5158	2	1996	2	0	8397.00	2574.00	3.26	23
5159	2	1996	2	1	93896.00	26489.00	3.54	23
5160	2	1996	2	2	102293.00	29063.00	3.52	23
5161	2	1997	1	0	7349.00	2167.00	3.39	23
5162	2	1997	1	1	92058.00	26188.00	3.52	23
5163	2	1997	1	2	99407.00	28355.00	3.51	23
5164	2	1997	2	0	5922.00	2261.00	2.62	23
5165	2	1997	2	1	86770.00	26187.00	3.31	23
5166	2	1997	2	2	92692.00	28448.00	3.26	23
5167	2	1998	1	0	4772.00	1699.00	2.81	23
5168	2	1998	1	1	82901.00	24319.00	3.41	23
5169	2	1998	1	2	87673.00	26018.00	3.37	23
5170	2	1998	2	0	4866.00	1300.00	3.74	23
5171	2	1998	2	1	92586.00	24980.00	3.71	23
5172	2	1998	2	2	97452.00	26280.00	3.71	23
5173	2	1999	1	0	7340.00	2324.00	3.16	23
5174	2	1999	1	1	82982.00	24083.00	3.45	23
5175	2	1999	1	2	90322.00	26407.00	3.42	23
5176	2	1999	2	0	10031.00	2662.00	3.77	23
5177	2	1999	2	1	91963.00	22865.00	4.02	23
5178	2	1999	2	2	101994.00	25527.00	4.00	23
5179	2	2000	1	0	6093.00	1875.00	3.25	23
5180	2	2000	1	1	79859.00	23039.00	3.47	23
5181	2	2000	1	2	85952.00	24914.00	3.45	23
5182	2	2000	2	0	5184.00	1575.00	3.29	23
5183	2	2000	2	1	101091.00	26490.00	3.82	23
5184	2	2000	2	2	106275.00	28065.00	3.79	23
5185	2	2001	1	0	6713.00	2054.00	3.27	23
5186	2	2001	1	1	90601.00	24538.00	3.69	23
5187	2	2001	1	2	97314.00	26592.00	3.66	23
5188	2	2001	2	0	5727.00	1780.00	3.22	23
5189	2	2001	2	1	100189.00	25292.00	3.96	23
5190	2	2001	2	2	105916.00	27072.00	3.91	23
5191	2	2002	1	0	1544.00	496.00	3.11	23
5192	2	2002	1	1	55125.00	14389.00	3.83	23
5193	2	2002	1	2	56669.00	14885.00	3.81	23
5194	2	2002	2	0	1847.00	481.00	3.84	23
5195	2	2002	2	1	65174.00	15444.00	4.22	23
5196	2	2002	2	2	67021.00	15925.00	4.21	23
5197	2	2003	1	0	2278.00	650.00	3.50	23
5198	2	2003	1	1	62803.00	15747.00	3.99	23
5199	2	2003	1	2	65081.00	16397.00	3.97	23
5200	2	2003	2	0	2717.00	662.00	4.10	23
5201	2	2003	2	1	68924.00	15831.00	4.35	23
5202	2	2003	2	2	71641.00	16493.00	4.34	23
5203	2	2004	1	0	2223.00	607.00	3.66	23
5204	2	2004	1	1	66433.00	15862.00	4.19	23
5205	2	2004	1	2	68656.00	16469.00	4.17	23
5206	2	2004	2	0	2602.00	634.00	4.10	23
5207	2	2004	2	1	75731.00	15764.00	4.80	23
5208	2	2004	2	2	78333.00	16398.00	4.78	23
5209	2	2005	1	0	2021.00	545.00	3.71	23
5210	2	2005	1	1	66801.00	15852.00	4.21	23
5211	2	2005	1	2	68822.00	16397.00	4.20	23
5212	2	2005	2	0	2375.00	564.00	4.21	23
5213	2	2005	2	1	73927.00	15410.00	4.80	23
5214	2	2005	2	2	76302.00	15974.00	4.78	23
5215	2	2006	1	0	1980.00	540.00	3.67	23
5216	2	2006	1	1	64099.00	15558.00	4.12	23
5217	2	2006	1	2	66079.00	16098.00	4.10	23
5218	2	2006	2	0	2146.00	549.00	3.91	23
5219	2	2006	2	1	64308.00	14107.00	4.56	23
5220	2	2006	2	2	66454.00	14656.00	4.53	23
5221	2	2007	1	0	1999.00	515.00	3.88	23
5222	2	2007	1	1	56570.00	13139.00	4.31	23
5223	2	2007	1	2	58569.00	13654.00	4.29	23
5224	2	2007	2	0	4145.00	1109.00	3.74	23
5225	2	2007	2	1	53105.00	13169.00	4.03	23
5226	2	2007	2	2	57250.00	14278.00	4.01	23
5227	2	2008	1	0	2503.00	716.00	3.50	23
5228	2	2008	1	1	54032.00	12940.00	4.18	23
5229	2	2008	1	2	56535.00	13656.00	4.14	23
5230	2	2008	2	0	4505.00	1144.00	3.94	23
5231	2	2008	2	1	60627.00	13760.00	4.41	23
5232	2	2008	2	2	65132.00	14904.00	4.37	23
5233	2	2009	1	0	4506.00	1282.00	3.51	23
5234	2	2009	1	1	51583.00	12824.00	4.02	23
5235	2	2009	1	2	56089.00	14106.00	3.98	23
5236	2	2009	2	0	5991.00	1409.00	4.25	23
5237	2	2009	2	1	66300.00	13872.00	4.78	23
5238	2	2009	2	2	72291.00	15281.00	4.73	23
5239	2	2010	1	0	3329.00	1225.00	2.72	23
5240	2	2010	1	1	51325.00	13428.00	3.82	23
5241	2	2010	1	2	54654.00	14653.00	3.73	23
5242	2	2010	2	0	3392.00	1077.00	3.15	23
5243	2	2010	2	1	52949.00	13096.00	4.04	23
5244	2	2010	2	2	56341.00	14173.00	3.98	23
5245	2	2011	1	0	3759.00	1170.00	3.21	23
5246	2	2011	1	1	53218.00	15232.00	3.49	23
5247	2	2011	1	2	56977.00	16402.00	3.47	23
5248	2	2011	2	0	3649.00	1289.00	2.83	23
5249	2	2011	2	1	55262.00	13867.00	3.99	23
5250	2	2011	2	2	58911.00	15156.00	3.89	23
5251	2	2012	1	0	4728.00	1410.00	3.35	23
5252	2	2012	1	1	55993.00	14982.00	3.74	23
5253	2	2012	1	2	60721.00	16392.00	3.70	23
5254	2	2012	2	0	3672.00	1411.00	2.60	23
5255	2	2012	2	1	69162.00	15347.00	4.51	23
5256	2	2012	2	2	72834.00	16758.00	4.35	23
5257	2	2013	1	0	5032.00	1510.00	3.33	23
5258	2	2013	1	1	51402.00	14907.00	3.45	23
5259	2	2013	1	2	56434.00	16417.00	3.44	23
5260	2	2013	2	0	5708.00	1496.00	3.82	23
5261	2	2013	2	1	60647.00	14868.00	4.08	23
5262	2	2013	2	2	66355.00	16364.00	4.05	23
5263	2	2014	1	0	5008.00	1668.00	3.00	23
5264	2	2014	1	1	54322.00	14694.00	3.70	23
5265	2	2014	1	2	59330.00	16362.00	3.63	23
5266	2	2014	2	0	5156.00	1427.00	3.61	23
5267	2	2014	2	1	59442.00	13565.00	4.38	23
5268	2	2014	2	2	64598.00	14992.00	4.31	23
5269	2	2015	1	0	3795.00	1120.00	3.39	23
5270	2	2015	1	1	52985.00	12544.00	4.22	23
5271	2	2015	1	2	56780.00	13664.00	4.16	23
5272	2	2015	2	0	3379.00	1156.00	2.92	23
5273	2	2015	2	1	65760.00	13706.00	4.80	23
5274	2	2015	2	2	69139.00	14862.00	4.65	23
5275	2	2016	1	0	2815.00	957.00	2.94	23
5276	2	2016	1	1	47557.00	11779.00	4.04	23
5277	2	2016	1	2	50372.00	12736.00	3.96	23
5278	2	2016	2	0	3985.00	1125.00	3.54	23
5279	2	2016	2	1	56266.00	13034.00	4.32	23
5280	2	2016	2	2	60251.00	14159.00	4.26	23
5281	2	2017	1	0	3979.00	1192.00	3.34	23
5282	2	2017	1	1	55422.00	12730.00	4.35	23
5283	2	2017	1	2	59401.00	13922.00	4.27	23
5284	2	2017	2	0	4580.00	1325.00	3.46	23
5285	2	2017	2	1	60664.00	13128.00	4.62	23
5286	2	2017	2	2	65244.00	14453.00	4.51	23
5287	2	2018	1	0	4267.00	1201.00	3.55	23
5288	2	2018	1	1	58926.00	13275.00	4.44	23
5289	2	2018	1	2	63193.00	14476.00	4.37	23
5290	2	2018	2	0	4799.01	1350.00	3.55	23
5291	2	2018	2	1	61640.48	13462.00	4.58	23
5292	2	2018	2	2	66439.49	14812.00	4.49	23
5293	2	2019	1	0	4178.00	1214.00	3.44	23
5294	2	2019	1	1	56789.00	13220.00	4.30	23
5295	2	2019	1	2	60967.00	14434.00	4.22	23
5296	2	2019	2	0	5091.36	1403.00	3.63	23
5297	2	2019	2	1	61346.00	13404.00	4.58	23
5298	2	2019	2	2	66437.36	14807.00	4.49	23
5299	2	2020	1	0	3725.00	1168.00	3.19	23
5300	2	2020	1	1	57851.00	13108.00	4.41	23
5301	2	2020	1	2	61576.00	14276.00	4.31	23
5302	2	2020	2	0	5159.38	1401.00	3.68	23
5303	2	2020	2	1	63002.00	13394.00	4.70	23
5304	2	2020	2	2	68161.38	14795.00	4.61	23
5305	2	1987	1	0	4415.00	1520.00	2.90	24
5306	2	1987	1	1	45870.00	11400.00	4.02	24
5307	2	1987	1	2	50285.00	12920.00	3.89	24
5308	2	1987	2	0	4493.00	2050.00	2.19	24
5309	2	1987	2	1	69060.00	14250.00	4.85	24
5310	2	1987	2	2	73553.00	16300.00	4.51	24
5311	2	1988	1	0	66.00	30.00	2.20	24
5312	2	1988	1	1	47526.00	12970.00	3.66	24
5313	2	1988	1	2	47592.00	13000.00	3.66	24
5314	2	1988	2	0	6621.00	2330.00	2.84	24
5315	2	1988	2	1	71577.00	14750.00	4.85	24
5316	2	1988	2	2	78198.00	17080.00	4.58	24
5317	2	1989	1	0	1286.00	350.00	3.67	24
5318	2	1989	1	1	63416.00	14240.00	4.45	24
5319	2	1989	1	2	64702.00	14590.00	4.43	24
5320	2	1989	2	0	8890.00	2400.00	3.70	24
5321	2	1989	2	1	71653.00	14940.00	4.80	24
5322	2	1989	2	2	80543.00	17340.00	4.64	24
5323	2	1990	1	0	4925.00	1320.00	3.73	24
5324	2	1990	1	1	52195.00	11510.00	4.53	24
5325	2	1990	1	2	57120.00	12830.00	4.45	24
5326	2	1990	2	0	20285.00	4640.00	4.37	24
5327	2	1990	2	1	67277.00	14930.00	4.51	24
5328	2	1990	2	2	87562.00	19570.00	4.47	24
5329	2	1991	1	0	4804.00	1530.00	3.14	24
5330	2	1991	1	1	62306.00	12890.00	4.83	24
5331	2	1991	1	2	67110.00	14420.00	4.65	24
5332	2	1991	2	0	5274.00	3040.00	1.73	24
5333	2	1991	2	1	59091.00	12760.00	4.63	24
5334	2	1991	2	2	64365.00	15800.00	4.07	24
5335	2	1992	1	0	\N	\N	\N	24
5336	2	1992	1	1	36049.00	8940.00	4.03	24
5337	2	1992	1	2	36049.00	8940.00	4.03	24
5338	2	1992	2	0	9661.00	3220.00	3.00	24
5339	2	1992	2	1	44976.00	10700.00	4.20	24
5340	2	1992	2	2	54637.00	13920.00	3.93	24
5341	2	1993	1	0	154.00	180.00	0.86	24
5342	2	1993	1	1	41779.00	11190.00	3.73	24
5343	2	1993	1	2	41933.00	11370.00	3.69	24
5344	2	1993	2	0	1456.00	680.00	2.14	24
5345	2	1993	2	1	46239.00	11980.00	3.86	24
5346	2	1993	2	2	47695.00	12660.00	3.77	24
5347	2	1994	1	0	152.00	40.00	3.80	24
5348	2	1994	1	1	45732.00	11370.00	4.02	24
5349	2	1994	1	2	45884.00	11410.00	4.02	24
5350	2	1994	2	0	753.00	500.00	1.51	24
5351	2	1994	2	1	57831.00	12890.00	4.49	24
5352	2	1994	2	2	58584.00	13390.00	4.38	24
5353	2	1995	1	0	\N	\N	\N	24
5354	2	1995	1	1	45218.00	12370.00	3.66	24
5355	2	1995	1	2	45218.00	12370.00	3.66	24
5356	2	1995	2	0	741.00	543.00	1.36	24
5357	2	1995	2	1	54096.00	12893.00	4.20	24
5358	2	1995	2	2	54837.00	13436.00	4.08	24
5359	2	1996	1	0	268.00	110.00	2.44	24
5360	2	1996	1	1	48377.00	12288.00	3.94	24
5361	2	1996	1	2	48645.00	12398.00	3.92	24
5362	2	1996	2	0	3424.00	2594.00	1.32	24
5363	2	1996	2	1	49291.00	12357.00	3.99	24
5364	2	1996	2	2	52715.00	14951.00	3.53	24
5365	2	1997	1	0	377.00	155.00	2.43	24
5366	2	1997	1	1	41471.00	10746.00	3.86	24
5367	2	1997	1	2	41848.00	10901.00	3.84	24
5368	2	1997	2	0	706.00	292.00	2.42	24
5369	2	1997	2	1	53755.00	13342.00	4.03	24
5370	2	1997	2	2	54461.00	13634.00	3.99	24
5371	2	1998	1	0	\N	\N	\N	24
5372	2	1998	1	1	37018.00	10193.00	3.63	24
5373	2	1998	1	2	37018.00	10193.00	3.63	24
5374	2	1998	2	0	\N	\N	\N	24
5375	2	1998	2	1	54455.00	11826.00	4.60	24
5376	2	1998	2	2	54455.00	11826.00	4.60	24
5377	2	1999	1	0	105.00	35.00	3.00	24
5378	2	1999	1	1	43436.00	11152.00	3.89	24
5379	2	1999	1	2	43541.00	11187.00	3.89	24
5380	2	1999	2	0	1807.00	1099.00	1.64	24
5381	2	1999	2	1	58859.00	12854.00	4.58	24
5382	2	1999	2	2	60666.00	13953.00	4.35	24
5383	2	2000	1	0	68.00	26.00	2.62	24
5384	2	2000	1	1	46239.00	10980.00	4.21	24
5385	2	2000	1	2	46307.00	11006.00	4.21	24
5386	2	2000	2	0	1889.00	1159.00	1.63	24
5387	2	2000	2	1	58740.00	12890.00	4.56	24
5388	2	2000	2	2	60629.00	14049.00	4.32	24
5389	2	2001	1	0	148.00	60.00	2.47	24
5390	2	2001	1	1	45472.00	11248.00	4.04	24
5391	2	2001	1	2	45620.00	11308.00	4.03	24
5392	2	2001	2	0	1829.00	1152.00	1.59	24
5393	2	2001	2	1	61871.00	12620.00	4.90	24
5394	2	2001	2	2	63700.00	13772.00	4.63	24
5395	2	2002	1	0	417.00	135.00	3.09	24
5396	2	2002	1	1	48361.00	11242.00	4.30	24
5397	2	2002	1	2	48778.00	11377.00	4.29	24
5398	2	2002	2	0	4048.00	2143.00	1.89	24
5399	2	2002	2	1	67533.00	13657.00	4.94	24
5400	2	2002	2	2	71581.00	15800.00	4.53	24
5401	2	2003	1	0	437.00	134.00	3.26	24
5402	2	2003	1	1	48576.00	11610.00	4.18	24
5403	2	2003	1	2	49013.00	11744.00	4.17	24
5404	2	2003	2	0	3288.00	1643.00	2.00	24
5405	2	2003	2	1	63586.00	13229.00	4.81	24
5406	2	2003	2	2	66874.00	14872.00	4.50	24
5407	2	2004	1	0	540.00	135.00	4.00	24
5408	2	2004	1	1	52754.00	12309.00	4.29	24
5409	2	2004	1	2	53294.00	12444.00	4.28	24
5410	2	2004	2	0	3293.00	1643.00	2.00	24
5411	2	2004	2	1	65000.00	12981.00	5.01	24
5412	2	2004	2	2	68293.00	14624.00	4.67	24
5413	2	2005	1	0	\N	\N	\N	24
5414	2	2005	1	1	56134.00	12745.00	4.40	24
5415	2	2005	1	2	56134.00	12745.00	4.40	24
5416	2	2005	2	0	2965.00	1675.00	1.77	24
5417	2	2005	2	1	65064.00	12646.00	5.15	24
5418	2	2005	2	2	68029.00	14321.00	4.75	24
5419	2	2006	1	0	\N	\N	\N	24
5420	2	2006	1	1	65637.00	12745.00	5.15	24
5421	2	2006	1	2	65637.00	12745.00	5.15	24
5422	2	2006	2	0	5070.00	1965.00	2.58	24
5423	2	2006	2	1	73117.00	13705.00	5.34	24
5424	2	2006	2	2	78187.00	15670.00	4.99	24
5425	2	2007	1	0	\N	\N	\N	24
5426	2	2007	1	1	66385.00	12910.00	5.14	24
5427	2	2007	1	2	66385.00	12910.00	5.14	24
5428	2	2007	2	0	2700.00	982.00	2.75	24
5429	2	2007	2	1	65808.00	12225.00	5.38	24
5430	2	2007	2	2	68508.00	13207.00	5.19	24
5431	2	2008	1	0	\N	\N	\N	24
5432	2	2008	1	1	60248.00	11988.00	5.03	24
5433	2	2008	1	2	60248.00	11988.00	5.03	24
5434	2	2008	2	0	1606.00	510.00	3.15	24
5435	2	2008	2	1	65622.00	12211.00	5.37	24
5436	2	2008	2	2	67228.00	12721.00	5.28	24
5437	2	2009	1	0	\N	\N	\N	24
5438	2	2009	1	1	59304.00	12211.00	4.86	24
5439	2	2009	1	2	59304.00	12211.00	4.86	24
5440	2	2009	2	0	1328.00	450.00	2.95	24
5441	2	2009	2	1	66888.00	12214.00	5.48	24
5442	2	2009	2	2	68216.00	12664.00	5.39	24
5443	2	2010	1	0	\N	\N	\N	24
5444	2	2010	1	1	53767.00	11966.00	4.49	24
5445	2	2010	1	2	53767.00	11966.00	4.49	24
5446	2	2010	2	0	1326.00	482.00	2.75	24
5447	2	2010	2	1	58888.00	12526.00	4.70	24
5448	2	2010	2	2	60214.00	13008.00	4.63	24
5449	2	2011	1	0	\N	\N	\N	24
5450	2	2011	1	1	57701.00	12683.00	4.55	24
5451	2	2011	1	2	57701.00	12683.00	4.55	24
5452	2	2011	2	0	445.00	530.00	0.84	24
5453	2	2011	2	1	66867.00	12683.00	5.27	24
5454	2	2011	2	2	67312.00	13213.00	5.09	24
5455	2	2012	1	0	\N	\N	\N	24
5456	2	2012	1	1	62930.00	12852.00	4.90	24
5457	2	2012	1	2	62930.00	12852.00	4.90	24
5458	2	2012	2	0	525.00	510.00	1.03	24
5459	2	2012	2	1	72037.00	12853.00	5.60	24
5460	2	2012	2	2	72562.00	13363.00	5.43	24
5461	2	2013	1	0	\N	\N	\N	24
5462	2	2013	1	1	57496.00	12853.00	4.47	24
5463	2	2013	1	2	57496.00	12853.00	4.47	24
5464	2	2013	2	0	778.00	665.00	1.17	24
5465	2	2013	2	1	67982.00	12859.00	5.29	24
5466	2	2013	2	2	68760.00	13524.00	5.08	24
5467	2	2014	1	0	\N	\N	\N	24
5468	2	2014	1	1	67118.00	12859.00	5.22	24
5469	2	2014	1	2	67118.00	12859.00	5.22	24
5470	2	2014	2	0	875.00	678.00	1.29	24
5471	2	2014	2	1	69313.00	13013.00	5.33	24
5472	2	2014	2	2	70188.00	13691.00	5.13	24
5473	2	2015	1	0	\N	\N	\N	24
5474	2	2015	1	1	64380.00	12953.00	4.97	24
5475	2	2015	1	2	64380.00	12953.00	4.97	24
5476	2	2015	2	0	881.00	648.00	1.36	24
5477	2	2015	2	1	71061.00	12859.00	5.53	24
5478	2	2015	2	2	71942.00	13507.00	5.33	24
5479	2	2016	1	0	\N	\N	\N	24
5480	2	2016	1	1	52386.00	13279.00	3.95	24
5481	2	2016	1	2	52386.00	13279.00	3.95	24
5482	2	2016	2	0	595.00	557.00	1.07	24
5483	2	2016	2	1	67824.00	12839.00	5.28	24
5484	2	2016	2	2	68419.00	13396.00	5.11	24
5485	2	2017	1	0	0.00	0.00	\N	24
5486	2	2017	1	1	56331.00	12839.00	4.39	24
5487	2	2017	1	2	56331.00	12839.00	4.39	24
5488	2	2017	2	0	1206.00	1027.00	1.17	24
5489	2	2017	2	1	69325.00	13163.00	5.27	24
5490	2	2017	2	2	70531.00	14190.00	4.97	24
5491	2	2018	1	0	0.00	0.00	\N	24
5492	2	2018	1	1	67607.00	13042.00	5.18	24
5493	2	2018	1	2	67607.00	13042.00	5.18	24
5494	2	2018	2	0	1347.00	1160.00	1.16	24
5495	2	2018	2	1	79808.57	15001.00	5.32	24
5496	2	2018	2	2	81155.57	16161.00	5.02	24
5497	2	2019	1	0	0.00	0.00	\N	24
5498	2	2019	1	1	57484.50	12307.00	4.67	24
5499	2	2019	1	2	57484.50	12307.00	4.67	24
5500	2	2019	2	0	0.00	0.00	\N	24
5501	2	2019	2	1	61082.58	12507.00	4.88	24
5502	2	2019	2	2	61082.58	12507.00	4.88	24
5503	2	2020	1	0	0.00	0.00	\N	24
5504	2	2020	1	1	56050.57	11003.00	5.09	24
5505	2	2020	1	2	56050.57	11003.00	5.09	24
5506	2	2020	2	0	34.00	27.00	1.26	24
5507	2	2020	2	1	67625.14	12925.00	5.23	24
5508	2	2020	2	2	67659.14	12952.00	5.22	24
5509	2	1987	1	0	1285.00	1510.00	0.85	25
5510	2	1987	1	1	13255.00	3860.00	3.43	25
5511	2	1987	1	2	14540.00	5370.00	2.71	25
5512	2	1987	2	0	1086.00	310.00	3.50	25
5513	2	1987	2	1	9929.00	2480.00	4.00	25
5514	2	1987	2	2	11015.00	2790.00	3.95	25
5515	2	1988	1	0	1786.00	1450.00	1.23	25
5516	2	1988	1	1	13155.00	4300.00	3.06	25
5517	2	1988	1	2	14941.00	5750.00	2.60	25
5518	2	1988	2	0	\N	\N	\N	25
5519	2	1988	2	1	14743.00	3520.00	4.19	25
5520	2	1988	2	2	14743.00	3520.00	4.19	25
5521	2	1989	1	0	1635.00	1200.00	1.36	25
5522	2	1989	1	1	16290.00	4950.00	3.29	25
5523	2	1989	1	2	17925.00	6150.00	2.91	25
5524	2	1989	2	0	282.00	150.00	1.88	25
5525	2	1989	2	1	10924.00	2430.00	4.50	25
5526	2	1989	2	2	11206.00	2580.00	4.34	25
5527	2	1990	1	0	1466.00	960.00	1.53	25
5528	2	1990	1	1	26531.00	6260.00	4.24	25
5529	2	1990	1	2	27997.00	7220.00	3.88	25
5530	2	1990	2	0	196.00	220.00	0.89	25
5531	2	1990	2	1	23137.00	6380.00	3.63	25
5532	2	1990	2	2	23333.00	6600.00	3.54	25
5533	2	1991	1	0	1212.00	1220.00	0.99	25
5534	2	1991	1	1	27584.00	6340.00	4.35	25
5535	2	1991	1	2	28796.00	7560.00	3.81	25
5536	2	1991	2	0	308.00	170.00	1.81	25
5537	2	1991	2	1	17915.00	4460.00	4.02	25
5538	2	1991	2	2	18223.00	4630.00	3.94	25
5539	2	1992	1	0	1265.00	1290.00	0.98	25
5540	2	1992	1	1	19702.00	4690.00	4.20	25
5541	2	1992	1	2	20967.00	5980.00	3.51	25
5542	2	1992	2	0	657.00	220.00	2.99	25
5543	2	1992	2	1	13124.00	3160.00	4.15	25
5544	2	1992	2	2	13781.00	3380.00	4.08	25
5545	2	1993	1	0	1400.00	1980.00	0.71	25
5546	2	1993	1	1	16231.00	3940.00	4.12	25
5547	2	1993	1	2	17631.00	5920.00	2.98	25
5548	2	1993	2	0	2776.00	1020.00	2.72	25
5549	2	1993	2	1	13580.00	3300.00	4.12	25
5550	2	1993	2	2	16356.00	4320.00	3.79	25
5551	2	1994	1	0	2633.00	2480.00	1.06	25
5552	2	1994	1	1	16634.00	3460.00	4.81	25
5553	2	1994	1	2	19267.00	5940.00	3.24	25
5554	2	1994	2	0	2700.00	900.00	3.00	25
5555	2	1994	2	1	17383.00	3460.00	5.02	25
5556	2	1994	2	2	20083.00	4360.00	4.61	25
5557	2	1995	1	0	3800.00	2550.00	1.49	25
5558	2	1995	1	1	18577.00	3870.00	4.80	25
5559	2	1995	1	2	22377.00	6420.00	3.49	25
5560	2	1995	2	0	1446.00	900.00	1.61	25
5561	2	1995	2	1	21055.00	4320.00	4.87	25
5562	2	1995	2	2	22501.00	5220.00	4.31	25
5563	2	1996	1	0	3902.00	3247.00	1.20	25
5564	2	1996	1	1	26243.00	5120.00	5.13	25
5565	2	1996	1	2	30145.00	8367.00	3.60	25
5566	2	1996	2	0	2447.00	1360.00	1.80	25
5567	2	1996	2	1	16767.00	3310.00	5.07	25
5568	2	1996	2	2	19214.00	4670.00	4.11	25
5569	2	1997	1	0	6416.00	5296.00	1.21	25
5570	2	1997	1	1	21087.00	5025.00	4.20	25
5571	2	1997	1	2	27503.00	10321.00	2.66	25
5572	2	1997	2	0	302.00	631.00	0.48	25
5573	2	1997	2	1	18686.00	3814.00	4.90	25
5574	2	1997	2	2	18988.00	4445.00	4.27	25
5575	2	1998	1	0	1595.00	1431.00	1.11	25
5576	2	1998	1	1	21695.00	5004.00	4.34	25
5577	2	1998	1	2	23290.00	6435.00	3.62	25
5578	2	1998	2	0	1106.00	631.00	1.75	25
5579	2	1998	2	1	16776.00	3891.00	4.31	25
5580	2	1998	2	2	17882.00	4522.00	3.95	25
5581	2	1999	1	0	5396.00	3786.00	1.43	25
5582	2	1999	1	1	20941.00	4842.00	4.32	25
5583	2	1999	1	2	26337.00	8628.00	3.05	25
5584	2	1999	2	0	1622.00	750.00	2.16	25
5585	2	1999	2	1	23097.00	4767.00	4.85	25
5586	2	1999	2	2	24719.00	5517.00	4.48	25
5587	2	2000	1	0	6701.00	4473.00	1.50	25
5588	2	2000	1	1	23395.00	5000.00	4.68	25
5589	2	2000	1	2	30096.00	9473.00	3.18	25
5590	2	2000	2	0	1135.00	504.00	2.25	25
5591	2	2000	2	1	24449.00	4774.00	5.12	25
5592	2	2000	2	2	25584.00	5278.00	4.85	25
5593	2	2001	1	0	5948.00	4539.00	1.31	25
5594	2	2001	1	1	24052.00	5108.00	4.71	25
5595	2	2001	1	2	30000.00	9647.00	3.11	25
5596	2	2001	2	0	1075.00	450.00	2.39	25
5597	2	2001	2	1	23355.00	4948.00	4.72	25
5598	2	2001	2	2	24430.00	5398.00	4.53	25
5599	2	2002	1	0	6152.00	4438.00	1.39	25
5600	2	2002	1	1	20698.00	4819.00	4.30	25
5601	2	2002	1	2	26850.00	9257.00	2.90	25
5602	2	2002	2	0	1721.00	741.00	2.32	25
5603	2	2002	2	1	29623.00	5818.00	5.09	25
5604	2	2002	2	2	31344.00	6559.00	4.78	25
5605	2	2003	1	0	8430.00	4606.00	1.83	25
5606	2	2003	1	1	21779.00	4533.00	4.80	25
5607	2	2003	1	2	30209.00	9139.00	3.31	25
5608	2	2003	2	0	2813.00	1012.00	2.78	25
5609	2	2003	2	1	28361.00	5677.00	5.00	25
5610	2	2003	2	2	31174.00	6689.00	4.66	25
5611	2	2004	1	0	8621.00	4305.00	2.00	25
5612	2	2004	1	1	21970.00	4720.00	4.65	25
5613	2	2004	1	2	30591.00	9025.00	3.39	25
5614	2	2004	2	0	2600.00	1043.00	2.49	25
5615	2	2004	2	1	29186.00	5735.00	5.09	25
5616	2	2004	2	2	31786.00	6778.00	4.69	25
5617	2	2005	1	0	7073.00	4162.00	1.70	25
5618	2	2005	1	1	24883.00	4804.00	5.18	25
5619	2	2005	1	2	31956.00	8966.00	3.56	25
5620	2	2005	2	0	2807.00	1079.00	2.60	25
5621	2	2005	2	1	30650.00	5901.00	5.19	25
5622	2	2005	2	2	33457.00	6980.00	4.79	25
5623	2	2006	1	0	8246.00	4322.00	1.91	25
5624	2	2006	1	1	24012.00	4904.00	4.90	25
5625	2	2006	1	2	32258.00	9226.00	3.50	25
5626	2	2006	2	0	3095.00	1113.00	2.78	25
5627	2	2006	2	1	30072.00	5929.00	5.07	25
5628	2	2006	2	2	33167.00	7042.00	4.71	25
5629	2	2007	1	0	6499.00	3108.00	2.09	25
5630	2	2007	1	1	23451.00	4667.00	5.02	25
5631	2	2007	1	2	29950.00	7775.00	3.85	25
5632	2	2007	2	0	3164.00	1130.00	2.80	25
5633	2	2007	2	1	30709.00	6039.00	5.09	25
5634	2	2007	2	2	33873.00	7169.00	4.72	25
5635	2	2008	1	0	9534.00	3189.00	2.99	25
5636	2	2008	1	1	25248.00	5110.00	4.94	25
5637	2	2008	1	2	34782.00	8299.00	4.19	25
5638	2	2008	2	0	4147.00	1148.00	3.61	25
5639	2	2008	2	1	27967.00	5588.00	5.00	25
5640	2	2008	2	2	32114.00	6736.00	4.77	25
5641	2	2009	1	0	6606.00	2158.00	3.06	25
5642	2	2009	1	1	24487.00	5576.00	4.39	25
5643	2	2009	1	2	31093.00	7734.00	4.02	25
5644	2	2009	2	0	2849.00	785.00	3.63	25
5645	2	2009	2	1	26824.00	5526.00	4.85	25
5646	2	2009	2	2	29673.00	6311.00	4.70	25
5647	2	2010	1	0	7737.00	2406.00	3.22	25
5648	2	2010	1	1	25493.00	5343.00	4.77	25
5649	2	2010	1	2	33230.00	7749.00	4.29	25
5650	2	2010	2	0	2708.00	778.00	3.48	25
5651	2	2010	2	1	24449.00	5121.00	4.77	25
5652	2	2010	2	2	27157.00	5899.00	4.60	25
5653	2	2011	1	0	5823.00	1961.00	2.97	25
5654	2	2011	1	1	25795.00	5400.00	4.78	25
5655	2	2011	1	2	31618.00	7361.00	4.30	25
5656	2	2011	2	0	4523.00	1287.00	3.51	25
5657	2	2011	2	1	26565.00	5412.00	4.91	25
5658	2	2011	2	2	31088.00	6699.00	4.64	25
5659	2	2012	1	0	7949.00	2643.00	3.01	25
5660	2	2012	1	1	24117.00	5170.00	4.66	25
5661	2	2012	1	2	32066.00	7813.00	4.10	25
5662	2	2012	2	0	4243.00	1330.00	3.19	25
5663	2	2012	2	1	25737.00	5567.00	4.62	25
5664	2	2012	2	2	29980.00	6897.00	4.35	25
5665	2	2013	1	0	7625.00	2529.00	3.02	25
5666	2	2013	1	1	24310.00	5153.00	4.72	25
5667	2	2013	1	2	31935.00	7682.00	4.16	25
5668	2	2013	2	0	4305.00	1275.00	3.38	25
5669	2	2013	2	1	25223.00	5238.00	4.82	25
5670	2	2013	2	2	29528.00	6513.00	4.53	25
5671	2	2014	1	0	9153.00	2809.00	3.26	25
5672	2	2014	1	1	26750.00	5283.00	5.06	25
5673	2	2014	1	2	35903.00	8092.00	4.44	25
5674	2	2014	2	0	3983.00	1214.00	3.28	25
5675	2	2014	2	1	25319.00	5297.00	4.78	25
5676	2	2014	2	2	29302.00	6511.00	4.50	25
5677	2	2015	1	0	7501.00	2399.00	3.13	25
5678	2	2015	1	1	30970.00	6113.00	5.07	25
5679	2	2015	1	2	38471.00	8512.00	4.52	25
5680	2	2015	2	0	2309.00	707.00	3.27	25
5681	2	2015	2	1	28663.00	5930.00	4.83	25
5682	2	2015	2	2	30972.00	6637.00	4.67	25
5683	2	2016	1	0	6597.00	2260.00	2.92	25
5684	2	2016	1	1	29419.00	6160.00	4.78	25
5685	2	2016	1	2	36016.00	8420.00	4.28	25
5686	2	2016	2	0	3095.00	947.00	3.27	25
5687	2	2016	2	1	30041.00	5998.00	5.01	25
5688	2	2016	2	2	33136.00	6945.00	4.77	25
5689	2	2017	1	0	7572.00	2943.00	2.57	25
5690	2	2017	1	1	28546.00	6175.00	4.62	25
5691	2	2017	1	2	36118.00	9118.00	3.96	25
5692	2	2017	2	0	3883.00	1140.00	3.41	25
5693	2	2017	2	1	27631.00	5972.00	4.63	25
5694	2	2017	2	2	31514.00	7112.00	4.43	25
5695	2	2018	1	0	6694.00	2274.00	2.94	25
5696	2	2018	1	1	31162.00	6196.00	5.03	25
5697	2	2018	1	2	37856.00	8470.00	4.47	25
5698	2	2018	2	0	4570.00	1370.00	3.34	25
5699	2	2018	2	1	28780.00	6102.00	4.72	25
5700	2	2018	2	2	33350.00	7472.00	4.46	25
5701	2	2019	1	0	7080.26	2577.00	2.75	25
5702	2	2019	1	1	31291.17	6551.00	4.78	25
5703	2	2019	1	2	38371.43	9128.00	4.20	25
5704	2	2019	2	0	4050.89	1249.00	3.24	25
5705	2	2019	2	1	29024.06	6186.00	4.69	25
5706	2	2019	2	2	33074.95	7435.00	4.45	25
5707	2	2020	1	0	6313.45	2060.00	3.06	25
5708	2	2020	1	1	31187.60	6239.00	5.00	25
5709	2	2020	1	2	37501.05	8299.00	4.52	25
5710	2	2020	2	0	4270.50	1267.00	3.37	25
5711	2	2020	2	1	29595.16	6058.00	4.89	25
5712	2	2020	2	2	33865.66	7325.00	4.62	25
5713	2	1987	1	0	11705.00	7360.00	1.59	26
5714	2	1987	1	1	1525.00	780.00	1.96	26
5715	2	1987	1	2	13230.00	8140.00	1.63	26
5716	2	1987	2	0	2838.00	2600.00	1.09	26
5717	2	1987	2	1	367.00	230.00	1.60	26
5718	2	1987	2	2	3205.00	2830.00	1.13	26
5719	2	1988	1	0	15768.00	8310.00	1.90	26
5720	2	1988	1	1	354.00	130.00	2.72	26
5721	2	1988	1	2	16122.00	8440.00	1.91	26
5722	2	1988	2	0	4931.00	3790.00	1.30	26
5723	2	1988	2	1	323.00	180.00	1.79	26
5724	2	1988	2	2	5254.00	3970.00	1.32	26
5725	2	1989	1	0	10680.00	8340.00	1.28	26
5726	2	1989	1	1	170.00	140.00	1.21	26
5727	2	1989	1	2	10850.00	8480.00	1.28	26
5728	2	1989	2	0	6315.00	4870.00	1.30	26
5729	2	1989	2	1	354.00	210.00	1.69	26
5730	2	1989	2	2	6669.00	5080.00	1.31	26
5731	2	1990	1	0	14734.00	10090.00	1.46	26
5732	2	1990	1	1	323.00	170.00	1.90	26
5733	2	1990	1	2	15057.00	10260.00	1.47	26
5734	2	1990	2	0	6060.00	4430.00	1.37	26
5735	2	1990	2	1	382.00	210.00	1.82	26
5736	2	1990	2	2	6442.00	4640.00	1.39	26
5737	2	1991	1	0	16331.00	11130.00	1.47	26
5738	2	1991	1	1	580.00	280.00	2.07	26
5739	2	1991	1	2	16911.00	11410.00	1.48	26
5740	2	1991	2	0	6447.00	4860.00	1.33	26
5741	2	1991	2	1	456.00	230.00	1.98	26
5742	2	1991	2	2	6903.00	5090.00	1.36	26
5743	2	1992	1	0	16003.00	10720.00	1.49	26
5744	2	1992	1	1	758.00	410.00	1.85	26
5745	2	1992	1	2	16761.00	11130.00	1.51	26
5746	2	1992	2	0	5103.00	4360.00	1.17	26
5747	2	1992	2	1	445.00	230.00	1.93	26
5748	2	1992	2	2	5548.00	4590.00	1.21	26
5749	2	1993	1	0	12330.00	8100.00	1.52	26
5750	2	1993	1	1	726.00	400.00	1.82	26
5751	2	1993	1	2	13056.00	8500.00	1.54	26
5752	2	1993	2	0	5650.00	4460.00	1.27	26
5753	2	1993	2	1	545.00	230.00	2.37	26
5754	2	1993	2	2	6195.00	4690.00	1.32	26
5755	2	1994	1	0	14563.00	8210.00	1.77	26
5756	2	1994	1	1	851.00	410.00	2.08	26
5757	2	1994	1	2	15414.00	8620.00	1.79	26
5758	2	1994	2	0	6869.00	4580.00	1.50	26
5759	2	1994	2	1	583.00	240.00	2.43	26
5760	2	1994	2	2	7452.00	4820.00	1.55	26
5761	2	1995	1	0	14597.00	7692.00	1.90	26
5762	2	1995	1	1	2057.00	846.00	2.43	26
5763	2	1995	1	2	16654.00	8538.00	1.95	26
5764	2	1995	2	0	8066.00	4988.00	1.62	26
5765	2	1995	2	1	1410.00	551.00	2.56	26
5766	2	1995	2	2	9476.00	5539.00	1.71	26
5767	2	1996	1	0	12654.00	7695.00	1.64	26
5768	2	1996	1	1	1790.00	842.00	2.13	26
5769	2	1996	1	2	14444.00	8537.00	1.69	26
5770	2	1996	2	0	8969.00	5100.00	1.76	26
5771	2	1996	2	1	1646.00	640.00	2.57	26
5772	2	1996	2	2	10615.00	5740.00	1.85	26
5773	2	1997	1	0	12860.00	7720.00	1.67	26
5774	2	1997	1	1	1843.00	855.00	2.16	26
5775	2	1997	1	2	14703.00	8575.00	1.71	26
5776	2	1997	2	0	7488.00	4650.00	1.61	26
5777	2	1997	2	1	1375.00	545.00	2.52	26
5778	2	1997	2	2	8863.00	5195.00	1.71	26
5779	2	1998	1	0	11855.00	7656.00	1.55	26
5780	2	1998	1	1	1847.00	865.00	2.14	26
5781	2	1998	1	2	13702.00	8521.00	1.61	26
5782	2	1998	2	0	44.00	90.00	0.49	26
5783	2	1998	2	1	301.00	238.00	1.26	26
5784	2	1998	2	2	345.00	328.00	1.05	26
5785	2	1999	1	0	12649.00	7665.00	1.65	26
5786	2	1999	1	1	2085.00	870.00	2.40	26
5787	2	1999	1	2	14734.00	8535.00	1.73	26
5788	2	1999	2	0	8264.00	4827.00	1.71	26
5789	2	1999	2	1	1758.00	665.00	2.64	26
5790	2	1999	2	2	10022.00	5492.00	1.82	26
5791	2	2000	1	0	14517.00	7716.00	1.88	26
5792	2	2000	1	1	2135.00	833.00	2.56	26
5793	2	2000	1	2	16652.00	8549.00	1.95	26
5794	2	2000	2	0	8338.00	5028.00	1.66	26
5795	2	2000	2	1	1806.00	675.00	2.68	26
5796	2	2000	2	2	10144.00	5703.00	1.78	26
5797	2	2001	1	0	14726.00	7734.00	1.90	26
5798	2	2001	1	1	2169.00	839.00	2.59	26
5799	2	2001	1	2	16895.00	8573.00	1.97	26
5800	2	2001	2	0	8814.00	5024.00	1.75	26
5801	2	2001	2	1	1815.00	677.00	2.68	26
5802	2	2001	2	2	10629.00	5701.00	1.86	26
5803	2	2002	1	0	14887.00	7739.00	1.92	26
5804	2	2002	1	1	2300.00	876.00	2.63	26
5805	2	2002	1	2	17187.00	8615.00	2.00	26
5806	2	2002	2	0	9086.00	5029.00	1.81	26
5807	2	2002	2	1	1943.00	680.00	2.86	26
5808	2	2002	2	2	11029.00	5709.00	1.93	26
5809	2	2003	1	0	15035.00	7748.00	1.94	26
5810	2	2003	1	1	2373.00	879.00	2.70	26
5811	2	2003	1	2	17408.00	8627.00	2.02	26
5812	2	2003	2	0	10305.00	5033.00	2.05	26
5813	2	2003	2	1	2072.00	685.00	3.02	26
5814	2	2003	2	2	12377.00	5718.00	2.16	26
5815	2	2004	1	0	16590.00	7754.00	2.14	26
5816	2	2004	1	1	2693.00	885.00	3.04	26
5817	2	2004	1	2	19283.00	8639.00	2.23	26
5818	2	2004	2	0	10421.00	5037.00	2.07	26
5819	2	2004	2	1	2171.00	691.00	3.14	26
5820	2	2004	2	2	12592.00	5728.00	2.20	26
5821	2	2005	1	0	17350.00	7766.00	2.23	26
5822	2	2005	1	1	3250.00	895.00	3.63	26
5823	2	2005	1	2	20600.00	8661.00	2.38	26
5824	2	2005	2	0	11576.00	5041.00	2.30	26
5825	2	2005	2	1	2546.00	694.00	3.67	26
5826	2	2005	2	2	14122.00	5735.00	2.46	26
5827	2	2006	1	0	19193.00	8176.00	2.35	26
5828	2	2006	1	1	3464.00	916.00	3.78	26
5829	2	2006	1	2	22657.00	9092.00	2.49	26
5830	2	2006	2	0	13930.00	5770.00	2.41	26
5831	2	2006	2	1	2942.00	770.00	3.82	26
5832	2	2006	2	2	16872.00	6540.00	2.58	26
5833	2	2007	1	0	19817.00	8445.00	2.35	26
5834	2	2007	1	1	4670.00	1225.00	3.81	26
5835	2	2007	1	2	24487.00	9670.00	2.53	26
5836	2	2007	2	0	14601.00	5845.00	2.50	26
5837	2	2007	2	1	4646.00	1200.00	3.87	26
5838	2	2007	2	2	19247.00	7045.00	2.73	26
5839	2	2008	1	0	18873.00	8935.00	2.11	26
5840	2	2008	1	1	4744.00	1204.00	3.94	26
5841	2	2008	1	2	23617.00	10139.00	2.33	26
5842	2	2008	2	0	15877.00	5836.00	2.72	26
5843	2	2008	2	1	7659.00	1935.00	3.96	26
5844	2	2008	2	2	23536.00	7771.00	3.03	26
5845	2	2009	1	0	19165.00	9359.00	2.05	26
5846	2	2009	1	1	4549.00	1299.00	3.50	26
5847	2	2009	1	2	23714.00	10658.00	2.22	26
5848	2	2009	2	0	15737.00	5870.00	2.68	26
5849	2	2009	2	1	6840.00	1945.00	3.52	26
5850	2	2009	2	2	22577.00	7815.00	2.89	26
5851	2	2010	1	0	22272.00	10619.00	2.10	26
5852	2	2010	1	1	4745.00	1304.00	3.64	26
5853	2	2010	1	2	27017.00	11923.00	2.27	26
5854	2	2010	2	0	17431.00	5949.00	2.93	26
5855	2	2010	2	1	7347.00	1965.00	3.74	26
5856	2	2010	2	2	24778.00	7914.00	3.13	26
5857	2	2011	1	0	23460.00	10899.00	2.15	26
5858	2	2011	1	1	4370.00	1308.00	3.34	26
5859	2	2011	1	2	27830.00	12207.00	2.28	26
5860	2	2011	2	0	14437.00	4905.00	2.94	26
5861	2	2011	2	1	11365.00	3276.00	3.47	26
5862	2	2011	2	2	25802.00	8181.00	3.15	26
5863	2	2012	1	0	25315.00	11213.00	2.26	26
5864	2	2012	1	1	4415.00	1487.00	2.97	26
5865	2	2012	1	2	29730.00	12700.00	2.34	26
5866	2	2012	2	0	16203.00	4996.00	3.24	26
5867	2	2012	2	1	13480.00	3358.00	4.01	26
5868	2	2012	2	2	29683.00	8354.00	3.55	26
5869	2	2013	1	0	27046.00	11362.00	2.38	26
5870	2	2013	1	1	5085.00	1520.00	3.35	26
5871	2	2013	1	2	32131.00	12882.00	2.49	26
5872	2	2013	2	0	16372.00	5058.00	3.24	26
5873	2	2013	2	1	14722.00	3433.00	4.29	26
5874	2	2013	2	2	31094.00	8491.00	3.66	26
5875	2	2014	1	0	26920.00	11385.00	2.36	26
5876	2	2014	1	1	5508.00	1520.00	3.62	26
5877	2	2014	1	2	32428.00	12905.00	2.51	26
5878	2	2014	2	0	16700.00	5131.00	3.25	26
5879	2	2014	2	1	14477.00	3483.00	4.16	26
5880	2	2014	2	2	31177.00	8614.00	3.62	26
5881	2	2015	1	0	26938.00	11385.00	2.37	26
5882	2	2015	1	1	5127.00	1520.00	3.37	26
5883	2	2015	1	2	32065.00	12905.00	2.48	26
5884	2	2015	2	0	16202.00	5065.00	3.20	26
5885	2	2015	2	1	14121.00	3431.00	4.12	26
5886	2	2015	2	2	30323.00	8496.00	3.57	26
5887	2	2016	1	0	27201.00	11385.00	2.39	26
5888	2	2016	1	1	5133.00	1520.00	3.38	26
5889	2	2016	1	2	32334.00	12905.00	2.51	26
5890	2	2016	2	0	15292.00	5043.00	3.03	26
5891	2	2016	2	1	14276.00	3482.00	4.10	26
5892	2	2016	2	2	29568.00	8525.00	3.47	26
5893	2	2017	1	0	26141.00	12769.00	2.05	26
5894	2	2017	1	1	4977.00	1515.00	3.29	26
5895	2	2017	1	2	31118.00	14284.00	2.18	26
5896	2	2017	2	0	14765.00	4821.00	3.06	26
5897	2	2017	2	1	13871.00	3482.00	3.98	26
5898	2	2017	2	2	28636.00	8303.00	3.45	26
5899	2	2018	1	0	26411.00	12878.00	2.05	26
5900	2	2018	1	1	4751.00	1515.00	3.14	26
5901	2	2018	1	2	31162.00	14393.00	2.17	26
5902	2	2018	2	0	15123.00	4738.00	3.19	26
5903	2	2018	2	1	13303.00	3365.00	3.95	26
5904	2	2018	2	2	28426.00	8103.00	3.51	26
5905	2	2019	1	0	30096.00	12874.00	2.34	26
5906	2	2019	1	1	4706.00	1547.00	3.04	26
5907	2	2019	1	2	34802.00	14421.00	2.41	26
5908	2	2019	2	0	9438.72	3078.58	3.07	26
5909	2	2019	2	1	13273.00	3351.00	3.96	26
5910	2	2019	2	2	22711.72	6429.58	3.53	26
5911	2	2020	1	0	23237.60	11074.00	2.10	26
5912	2	2020	1	1	4289.27	1534.00	2.80	26
5913	2	2020	1	2	27526.87	12608.00	2.18	26
5914	2	2020	2	0	9797.60	3017.00	3.25	26
5915	2	2020	2	1	12872.03	3299.00	3.90	26
5916	2	2020	2	2	22669.63	6316.00	3.59	26
5917	2	1987	1	0	395.00	210.00	1.88	27
5918	2	1987	1	1	15420.00	6020.00	2.56	27
5919	2	1987	1	2	15815.00	6230.00	2.54	27
5920	2	1987	2	0	352.00	330.00	1.07	27
5921	2	1987	2	1	11209.00	3720.00	3.01	27
5922	2	1987	2	2	11561.00	4050.00	2.85	27
5923	2	1988	1	0	146.00	130.00	1.12	27
5924	2	1988	1	1	16124.00	5790.00	2.78	27
5925	2	1988	1	2	16270.00	5920.00	2.75	27
5926	2	1988	2	0	330.00	310.00	1.06	27
5927	2	1988	2	1	10868.00	3230.00	3.36	27
5928	2	1988	2	2	11198.00	3540.00	3.16	27
5929	2	1989	1	0	181.00	140.00	1.29	27
5930	2	1989	1	1	14703.00	5260.00	2.80	27
5931	2	1989	1	2	14884.00	5400.00	2.76	27
5932	2	1989	2	0	\N	\N	\N	27
5933	2	1989	2	1	12460.00	4170.00	2.99	27
5934	2	1989	2	2	12460.00	4170.00	2.99	27
5935	2	1990	1	0	158.00	120.00	1.32	27
5936	2	1990	1	1	11917.00	4090.00	2.91	27
5937	2	1990	1	2	12075.00	4210.00	2.87	27
5938	2	1990	2	0	\N	\N	\N	27
5939	2	1990	2	1	12115.00	4320.00	2.80	27
5940	2	1990	2	2	12115.00	4320.00	2.80	27
5941	2	1991	1	0	124.00	110.00	1.13	27
5942	2	1991	1	1	13300.00	4450.00	2.99	27
5943	2	1991	1	2	13424.00	4560.00	2.94	27
5944	2	1991	2	0	\N	\N	\N	27
5945	2	1991	2	1	5820.00	2660.00	2.19	27
5946	2	1991	2	2	5820.00	2660.00	2.19	27
5947	2	1992	1	0	165.00	130.00	1.27	27
5948	2	1992	1	1	15715.00	5070.00	3.10	27
5949	2	1992	1	2	15880.00	5200.00	3.05	27
5950	2	1992	2	0	\N	\N	\N	27
5951	2	1992	2	1	11914.00	3970.00	3.00	27
5952	2	1992	2	2	11914.00	3970.00	3.00	27
5953	2	1993	1	0	172.00	150.00	1.15	27
5954	2	1993	1	1	15602.00	4430.00	3.52	27
5955	2	1993	1	2	15774.00	4580.00	3.44	27
5956	2	1993	2	0	\N	\N	\N	27
5957	2	1993	2	1	18448.00	4600.00	4.01	27
5958	2	1993	2	2	18448.00	4600.00	4.01	27
5959	2	1994	1	0	198.00	150.00	1.32	27
5960	2	1994	1	1	11165.00	3900.00	2.86	27
5961	2	1994	1	2	11363.00	4050.00	2.81	27
5962	2	1994	2	0	335.00	270.00	1.24	27
5963	2	1994	2	1	20346.00	4950.00	4.11	27
5964	2	1994	2	2	20681.00	5220.00	3.96	27
5965	2	1995	1	0	180.00	150.00	1.20	27
5966	2	1995	1	1	16269.00	5630.00	2.89	27
5967	2	1995	1	2	16449.00	5780.00	2.85	27
5968	2	1995	2	0	490.00	350.00	1.40	27
5969	2	1995	2	1	18870.00	6251.00	3.02	27
5970	2	1995	2	2	19360.00	6601.00	2.93	27
5971	2	1996	1	0	185.00	150.00	1.23	27
5972	2	1996	1	1	20485.00	5323.00	3.85	27
5973	2	1996	1	2	20670.00	5473.00	3.78	27
5974	2	1996	2	0	462.00	350.00	1.32	27
5975	2	1996	2	1	18822.00	6284.00	3.00	27
5976	2	1996	2	2	19284.00	6634.00	2.91	27
5977	2	1997	1	0	188.00	150.00	1.25	27
5978	2	1997	1	1	21336.00	6475.00	3.30	27
5979	2	1997	1	2	21524.00	6625.00	3.25	27
5980	2	1997	2	0	607.00	460.00	1.32	27
5981	2	1997	2	1	19371.00	6589.00	2.94	27
5982	2	1997	2	2	19978.00	7049.00	2.83	27
5983	2	1998	1	0	\N	\N	\N	27
5984	2	1998	1	1	16359.00	5278.00	3.10	27
5985	2	1998	1	2	16359.00	5278.00	3.10	27
5986	2	1998	2	0	988.00	830.00	1.19	27
5987	2	1998	2	1	13896.00	6383.00	2.18	27
5988	2	1998	2	2	14884.00	7213.00	2.06	27
5989	2	1999	1	0	\N	\N	\N	27
5990	2	1999	1	1	21950.00	5855.00	3.75	27
5991	2	1999	1	2	21950.00	5855.00	3.75	27
5992	2	1999	2	0	1330.00	950.00	1.40	27
5993	2	1999	2	1	21935.00	6858.00	3.20	27
5994	2	1999	2	2	23265.00	7808.00	2.98	27
5995	2	2000	1	0	\N	\N	\N	27
5996	2	2000	1	1	23571.00	5980.00	3.94	27
5997	2	2000	1	2	23571.00	5980.00	3.94	27
5998	2	2000	2	0	1344.00	960.00	1.40	27
5999	2	2000	2	1	24224.00	7298.00	3.32	27
6000	2	2000	2	2	25568.00	8258.00	3.10	27
6001	2	2001	1	0	\N	\N	\N	27
6002	2	2001	1	1	18188.00	4667.00	3.90	27
6003	2	2001	1	2	18188.00	4667.00	3.90	27
6004	2	2001	2	0	1429.00	1040.00	1.37	27
6005	2	2001	2	1	26708.00	8621.00	3.10	27
6006	2	2001	2	2	28137.00	9661.00	2.91	27
6007	2	2002	1	0	\N	\N	\N	27
6008	2	2002	1	1	19410.00	5404.00	3.59	27
6009	2	2002	1	2	19410.00	5404.00	3.59	27
6010	2	2002	2	0	1350.00	983.00	1.37	27
6011	2	2002	2	1	23526.00	7820.00	3.01	27
6012	2	2002	2	2	24876.00	8803.00	2.83	27
6013	2	2003	1	0	\N	\N	\N	27
6014	2	2003	1	1	19552.00	5441.00	3.59	27
6015	2	2003	1	2	19552.00	5441.00	3.59	27
6016	2	2003	2	0	1393.00	995.00	1.40	27
6017	2	2003	2	1	24339.00	7481.00	3.25	27
6018	2	2003	2	2	25732.00	8476.00	3.04	27
6019	2	2004	1	0	\N	\N	\N	27
6020	2	2004	1	1	18416.00	5150.00	3.58	27
6021	2	2004	1	2	18416.00	5150.00	3.58	27
6022	2	2004	2	0	1476.00	1006.00	1.47	27
6023	2	2004	2	1	28348.00	8301.00	3.42	27
6024	2	2004	2	2	29824.00	9307.00	3.20	27
6025	2	2005	1	0	\N	\N	\N	27
6026	2	2005	1	1	19256.00	5372.00	3.58	27
6027	2	2005	1	2	19256.00	5372.00	3.58	27
6028	2	2005	2	0	1047.00	727.00	1.44	27
6029	2	2005	2	1	29618.00	8580.00	3.45	27
6030	2	2005	2	2	30665.00	9307.00	3.29	27
6031	2	2006	1	0	\N	\N	\N	27
6032	2	2006	1	1	21069.00	5654.00	3.73	27
6033	2	2006	1	2	21069.00	5654.00	3.73	27
6034	2	2006	2	0	1404.00	727.00	1.93	27
6035	2	2006	2	1	32180.00	9150.00	3.52	27
6036	2	2006	2	2	33584.00	9877.00	3.40	27
6037	2	2007	1	0	\N	\N	\N	27
6038	2	2007	1	1	26362.00	6819.00	3.87	27
6039	2	2007	1	2	26362.00	6819.00	3.87	27
6040	2	2007	2	0	2454.00	1040.00	2.36	27
6041	2	2007	2	1	32231.00	9175.00	3.51	27
6042	2	2007	2	2	34685.00	10215.00	3.40	27
6043	2	2008	1	0	\N	\N	\N	27
6044	2	2008	1	1	28070.00	7014.00	4.00	27
6045	2	2008	1	2	28070.00	7014.00	4.00	27
6046	2	2008	2	0	1868.00	842.00	2.22	27
6047	2	2008	2	1	33608.00	9373.00	3.59	27
6048	2	2008	2	2	35476.00	10215.00	3.47	27
6049	2	2009	1	0	\N	\N	\N	27
6050	2	2009	1	1	28896.00	6914.00	4.18	27
6051	2	2009	1	2	28896.00	6914.00	4.18	27
6052	2	2009	2	0	1852.00	842.00	2.20	27
6053	2	2009	2	1	33288.00	9373.00	3.55	27
6054	2	2009	2	2	35140.00	10215.00	3.44	27
6055	2	2010	1	0	\N	\N	\N	27
6056	2	2010	1	1	23931.00	6759.00	3.54	27
6057	2	2010	1	2	23931.00	6759.00	3.54	27
6058	2	2010	2	0	1868.00	842.00	2.22	27
6059	2	2010	2	1	34551.00	9373.00	3.69	27
6060	2	2010	2	2	36419.00	10215.00	3.57	27
6061	2	2011	1	0	\N	\N	\N	27
6062	2	2011	1	1	25838.00	7015.00	3.68	27
6063	2	2011	1	2	25838.00	7015.00	3.68	27
6064	2	2011	2	0	1701.00	857.00	1.98	27
6065	2	2011	2	1	34364.00	9321.00	3.69	27
6066	2	2011	2	2	36065.00	10178.00	3.54	27
6067	2	2012	1	0	\N	\N	\N	27
6068	2	2012	1	1	23306.00	6085.00	3.83	27
6069	2	2012	1	2	23306.00	6085.00	3.83	27
6070	2	2012	2	0	1805.00	857.00	2.11	27
6071	2	2012	2	1	37354.00	10251.00	3.64	27
6072	2	2012	2	2	39159.00	11108.00	3.53	27
6073	2	2013	1	0	\N	\N	\N	27
6074	2	2013	1	1	27006.00	7015.00	3.85	27
6075	2	2013	1	2	27006.00	7015.00	3.85	27
6076	2	2013	2	0	1813.00	860.00	2.11	27
6077	2	2013	2	1	34560.00	9359.00	3.69	27
6078	2	2013	2	2	36373.00	10219.00	3.56	27
6079	2	2014	1	0	\N	\N	\N	27
6080	2	2014	1	1	27178.00	7040.00	3.86	27
6081	2	2014	1	2	27178.00	7040.00	3.86	27
6082	2	2014	2	0	1813.00	860.00	2.11	27
6083	2	2014	2	1	34085.00	9359.00	3.64	27
6084	2	2014	2	2	35898.00	10219.00	3.51	27
6085	2	2015	1	0	\N	\N	\N	27
6086	2	2015	1	1	27345.00	7040.00	3.88	27
6087	2	2015	1	2	27345.00	7040.00	3.88	27
6088	2	2015	2	0	1811.00	860.00	2.11	27
6089	2	2015	2	1	34206.00	9359.00	3.65	27
6090	2	2015	2	2	36017.00	10219.00	3.52	27
6091	2	2016	1	0	\N	\N	\N	27
6092	2	2016	1	1	26040.00	7040.00	3.70	27
6093	2	2016	1	2	26040.00	7040.00	3.70	27
6094	2	2016	2	0	1764.00	860.00	2.05	27
6095	2	2016	2	1	33062.00	9353.00	3.53	27
6096	2	2016	2	2	34826.00	10213.00	3.41	27
6097	2	2017	1	0	0.00	0.00	\N	27
6098	2	2017	1	1	26564.00	7035.00	3.78	27
6099	2	2017	1	2	26564.00	7035.00	3.78	27
6100	2	2017	2	0	1796.00	860.00	2.09	27
6101	2	2017	2	1	34027.00	9353.00	3.64	27
6102	2	2017	2	2	35823.00	10213.00	3.51	27
6103	2	2018	1	0	0.00	0.00	\N	27
6104	2	2018	1	1	26989.00	7035.00	3.84	27
6105	2	2018	1	2	26989.00	7035.00	3.84	27
6106	2	2018	2	0	1693.00	838.00	2.02	27
6107	2	2018	2	1	31394.60	9347.00	3.36	27
6108	2	2018	2	2	33087.60	10185.00	3.25	27
6109	2	2019	1	0	0.00	0.00	\N	27
6110	2	2019	1	1	26360.00	7152.00	3.69	27
6111	2	2019	1	2	26360.00	7152.00	3.69	27
6112	2	2019	2	0	1939.35	517.00	3.75	27
6113	2	2019	2	1	25640.47	8430.00	3.04	27
6114	2	2019	2	2	27579.82	8947.00	3.08	27
6115	2	2020	1	0	0.00	0.00	\N	27
6116	2	2020	1	1	20444.32	6470.08	3.16	27
6117	2	2020	1	2	20444.32	6470.08	3.16	27
6118	2	2020	2	0	1971.52	533.00	3.70	27
6119	2	2020	2	1	26996.77	8429.74	3.20	27
6120	2	2020	2	2	28968.29	8962.74	3.23	27
6121	2	1987	1	0	975.00	400.00	2.44	28
6122	2	1987	1	1	20330.00	7940.00	2.56	28
6123	2	1987	1	2	21305.00	8340.00	2.55	28
6124	2	1987	2	0	6512.00	3760.00	1.73	28
6125	2	1987	2	1	37476.00	18210.00	2.06	28
6126	2	1987	2	2	43988.00	21970.00	2.00	28
6127	2	1988	1	0	226.00	210.00	1.08	28
6128	2	1988	1	1	24967.00	9180.00	2.72	28
6129	2	1988	1	2	25193.00	9390.00	2.68	28
6130	2	1988	2	0	29544.00	13230.00	2.23	28
6131	2	1988	2	1	55477.00	20470.00	2.71	28
6132	2	1988	2	2	85021.00	33700.00	2.52	28
6133	2	1989	1	0	\N	\N	\N	28
6134	2	1989	1	1	24352.00	9980.00	2.44	28
6135	2	1989	1	2	24352.00	9980.00	2.44	28
6136	2	1989	2	0	23884.00	12510.00	1.91	28
6137	2	1989	2	1	42828.00	16710.00	2.56	28
6138	2	1989	2	2	66712.00	29220.00	2.28	28
6139	2	1990	1	0	\N	\N	\N	28
6140	2	1990	1	1	23628.00	10840.00	2.18	28
6141	2	1990	1	2	23628.00	10840.00	2.18	28
6142	2	1990	2	0	24956.00	11750.00	2.12	28
6143	2	1990	2	1	47157.00	21590.00	2.18	28
6144	2	1990	2	2	72113.00	33340.00	2.16	28
6145	2	1991	1	0	\N	\N	\N	28
6146	2	1991	1	1	26364.00	10100.00	2.61	28
6147	2	1991	1	2	26364.00	10100.00	2.61	28
6148	2	1991	2	0	26194.00	12490.00	2.10	28
6149	2	1991	2	1	61391.00	25590.00	2.40	28
6150	2	1991	2	2	87585.00	38080.00	2.30	28
6151	2	1992	1	0	\N	\N	\N	28
6152	2	1992	1	1	25082.00	10490.00	2.39	28
6153	2	1992	1	2	25082.00	10490.00	2.39	28
6154	2	1992	2	0	19165.00	12380.00	1.55	28
6155	2	1992	2	1	49077.00	25040.00	1.96	28
6156	2	1992	2	2	68242.00	37420.00	1.82	28
6157	2	1993	1	0	\N	\N	\N	28
6158	2	1993	1	1	13189.00	7020.00	1.88	28
6159	2	1993	1	2	13189.00	7020.00	1.88	28
6160	2	1993	2	0	25360.00	12690.00	2.00	28
6161	2	1993	2	1	59903.00	24400.00	2.46	28
6162	2	1993	2	2	85263.00	37090.00	2.30	28
6163	2	1994	1	0	\N	\N	\N	28
6164	2	1994	1	1	18608.00	7220.00	2.58	28
6165	2	1994	1	2	18608.00	7220.00	2.58	28
6166	2	1994	2	0	31622.00	12490.00	2.53	28
6167	2	1994	2	1	72079.00	27010.00	2.67	28
6168	2	1994	2	2	103701.00	39500.00	2.63	28
6169	2	1995	1	0	\N	\N	\N	28
6170	2	1995	1	1	16392.00	7300.00	2.25	28
6171	2	1995	1	2	16392.00	7300.00	2.25	28
6172	2	1995	2	0	27750.00	11130.00	2.49	28
6173	2	1995	2	1	85822.00	29855.00	2.87	28
6174	2	1995	2	2	113572.00	40985.00	2.77	28
6175	2	1996	1	0	\N	\N	\N	28
6176	2	1996	1	1	18574.00	8428.00	2.20	28
6177	2	1996	1	2	18574.00	8428.00	2.20	28
6178	2	1996	2	0	15513.00	6172.00	2.51	28
6179	2	1996	2	1	116449.00	36619.00	3.18	28
6180	2	1996	2	2	131962.00	42791.00	3.08	28
6181	2	1997	1	0	\N	\N	\N	28
6182	2	1997	1	1	26154.00	8650.00	3.02	28
6183	2	1997	1	2	26154.00	8650.00	3.02	28
6184	2	1997	2	0	18396.00	6954.00	2.65	28
6185	2	1997	2	1	126847.00	36303.00	3.49	28
6186	2	1997	2	2	145243.00	43257.00	3.36	28
6187	2	1998	1	0	\N	\N	\N	28
6188	2	1998	1	1	24335.00	7577.00	3.21	28
6189	2	1998	1	2	24335.00	7577.00	3.21	28
6190	2	1998	2	0	13096.00	5654.00	2.32	28
6191	2	1998	2	1	123736.00	36303.00	3.41	28
6192	2	1998	2	2	136832.00	41957.00	3.26	28
6193	2	1999	1	0	875.00	350.00	2.50	28
6194	2	1999	1	1	45455.00	13210.00	3.44	28
6195	2	1999	1	2	46330.00	13560.00	3.42	28
6196	2	1999	2	0	8484.00	3443.00	2.46	28
6197	2	1999	2	1	130525.00	38210.00	3.42	28
6198	2	1999	2	2	139009.00	41653.00	3.34	28
6199	2	2000	1	0	183.00	73.00	2.51	28
6200	2	2000	1	1	44462.00	12384.00	3.59	28
6201	2	2000	1	2	44645.00	12457.00	3.58	28
6202	2	2000	2	0	32421.00	10480.00	3.09	28
6203	2	2000	2	1	146422.00	38210.00	3.83	28
6204	2	2000	2	2	178843.00	48690.00	3.67	28
6205	2	2001	1	0	406.00	133.00	3.05	28
6206	2	2001	1	1	44455.00	12100.00	3.67	28
6207	2	2001	1	2	44861.00	12233.00	3.67	28
6208	2	2001	2	0	32328.00	10542.00	3.07	28
6209	2	2001	2	1	139511.00	39293.00	3.55	28
6210	2	2001	2	2	171839.00	49835.00	3.45	28
6211	2	2002	1	0	802.00	270.00	2.97	28
6212	2	2002	1	1	43511.00	12425.00	3.50	28
6213	2	2002	1	2	44313.00	12695.00	3.49	28
6214	2	2002	2	0	32955.00	10592.00	3.11	28
6440	2	2006	1	1	15561.00	4050.00	3.84	29
6215	2	2002	2	1	148830.00	39298.00	3.79	28
6216	2	2002	2	2	181785.00	49890.00	3.64	28
6217	2	2003	1	0	592.00	200.00	2.96	28
6218	2	2003	1	1	43693.00	11947.00	3.66	28
6219	2	2003	1	2	44285.00	12147.00	3.65	28
6220	2	2003	2	0	34096.00	10612.00	3.21	28
6221	2	2003	2	1	158413.00	39218.00	4.04	28
6222	2	2003	2	2	192509.00	49830.00	3.86	28
6223	2	2004	1	0	612.00	195.00	3.14	28
6224	2	2004	1	1	50529.00	12722.00	3.97	28
6225	2	2004	1	2	51141.00	12917.00	3.96	28
6226	2	2004	2	0	33710.00	10700.00	3.15	28
6227	2	2004	2	1	150636.00	39895.00	3.78	28
6228	2	2004	2	2	184346.00	50595.00	3.64	28
6229	2	2005	1	0	596.00	188.00	3.17	28
6230	2	2005	1	1	42882.00	11453.00	3.74	28
6231	2	2005	1	2	43478.00	11641.00	3.73	28
6232	2	2005	2	0	32960.00	8978.00	3.67	28
6233	2	2005	2	1	176539.00	41581.00	4.25	28
6234	2	2005	2	2	209499.00	50559.00	4.14	28
6235	2	2006	1	0	681.00	208.00	3.27	28
6236	2	2006	1	1	46918.00	11648.00	4.03	28
6237	2	2006	1	2	47599.00	11856.00	4.01	28
6238	2	2006	2	0	48963.00	12107.00	4.04	28
6239	2	2006	2	1	186232.00	38507.00	4.84	28
6240	2	2006	2	2	235195.00	50614.00	4.65	28
6241	2	2007	1	0	704.00	200.00	3.52	28
6242	2	2007	1	1	46118.00	11321.00	4.07	28
6243	2	2007	1	2	46822.00	11521.00	4.06	28
6244	2	2007	2	0	47943.00	11964.00	4.01	28
6245	2	2007	2	1	188067.00	39642.00	4.74	28
6246	2	2007	2	2	236010.00	51606.00	4.57	28
6247	2	2008	1	0	524.00	148.00	3.54	28
6248	2	2008	1	1	49742.00	11801.00	4.22	28
6249	2	2008	1	2	50266.00	11949.00	4.21	28
6250	2	2008	2	0	50268.00	11978.00	4.20	28
6251	2	2008	2	1	199450.00	42268.00	4.72	28
6252	2	2008	2	2	249718.00	54246.00	4.60	28
6253	2	2009	1	0	574.00	160.00	3.59	28
6254	2	2009	1	1	54584.00	12726.00	4.29	28
6255	2	2009	1	2	55158.00	12886.00	4.28	28
6256	2	2009	2	0	39320.00	11427.00	3.44	28
6257	2	2009	2	1	162104.00	41968.00	3.86	28
6258	2	2009	2	2	201424.00	53395.00	3.77	28
6259	2	2010	1	0	599.00	174.00	3.44	28
6260	2	2010	1	1	57801.00	13213.00	4.37	28
6261	2	2010	1	2	58400.00	13387.00	4.36	28
6262	2	2010	2	0	49530.00	11677.00	4.24	28
6263	2	2010	2	1	194004.00	41630.00	4.66	28
6264	2	2010	2	2	243534.00	53307.00	4.57	28
6265	2	2011	1	0	806.00	210.00	3.84	28
6266	2	2011	1	1	60334.00	12972.00	4.65	28
6267	2	2011	1	2	61140.00	13182.00	4.64	28
6268	2	2011	2	0	48799.00	11590.00	4.21	28
6269	2	2011	2	1	196787.00	41710.00	4.72	28
6270	2	2011	2	2	245586.00	53300.00	4.61	28
6271	2	2012	1	0	1038.00	268.00	3.87	28
6272	2	2012	1	1	60880.00	12978.00	4.69	28
6273	2	2012	1	2	61918.00	13246.00	4.67	28
6274	2	2012	2	0	50603.00	11867.00	4.26	28
6275	2	2012	2	1	203191.00	42104.00	4.83	28
6276	2	2012	2	2	253794.00	53971.00	4.70	28
6277	2	2013	1	0	912.00	228.00	4.00	28
6278	2	2013	1	1	64602.00	13553.00	4.77	28
6279	2	2013	1	2	65514.00	13781.00	4.75	28
6280	2	2013	2	0	49426.00	11848.00	4.17	28
6281	2	2013	2	1	203504.00	41806.00	4.87	28
6282	2	2013	2	2	252930.00	53654.00	4.71	28
6283	2	2014	1	0	1069.00	260.00	4.11	28
6284	2	2014	1	1	65733.00	13569.00	4.84	28
6285	2	2014	1	2	66802.00	13829.00	4.83	28
6286	2	2014	2	0	46311.00	11476.00	4.04	28
6287	2	2014	2	1	195204.00	41320.00	4.72	28
6288	2	2014	2	2	241515.00	52796.00	4.57	28
6289	2	2015	1	0	946.00	228.00	4.15	28
6290	2	2015	1	1	66275.00	13810.00	4.80	28
6291	2	2015	1	2	67221.00	14038.00	4.79	28
6292	2	2015	2	0	45692.00	11220.00	4.07	28
6293	2	2015	2	1	200176.00	40975.00	4.89	28
6294	2	2015	2	2	245868.00	52195.00	4.71	28
6295	2	2016	1	0	1148.00	278.00	4.13	28
6296	2	2016	1	1	66003.00	13611.00	4.85	28
6297	2	2016	1	2	67151.00	13889.00	4.83	28
6298	2	2016	2	0	46448.00	11220.00	4.14	28
6299	2	2016	2	1	195889.00	40723.00	4.81	28
6300	2	2016	2	2	242337.00	51943.00	4.67	28
6301	2	2017	1	0	975.00	228.00	4.28	28
6302	2	2017	1	1	69461.00	13877.00	5.01	28
6303	2	2017	1	2	70436.00	14105.00	4.99	28
6304	2	2017	2	0	49298.00	11269.00	4.37	28
6305	2	2017	2	1	210010.00	40924.00	5.13	28
6306	2	2017	2	2	259308.00	52193.00	4.97	28
6307	2	2018	1	0	1201.00	276.00	4.35	28
6308	2	2018	1	1	71922.00	14065.00	5.11	28
6309	2	2018	1	2	73123.00	14341.00	5.10	28
6310	2	2018	2	0	43984.00	11198.00	3.93	28
6311	2	2018	2	1	164455.00	40514.00	4.06	28
6312	2	2018	2	2	208439.00	51712.00	4.03	28
6313	2	2019	1	0	1062.00	251.00	4.23	28
6314	2	2019	1	1	72873.00	14174.00	5.14	28
6315	2	2019	1	2	73935.00	14425.00	5.13	28
6316	2	2019	2	0	48762.00	11157.66	4.37	28
6317	2	2019	2	1	206996.00	40420.00	5.12	28
6318	2	2019	2	2	255758.00	51577.66	4.96	28
6319	2	2020	1	0	1092.00	251.00	4.35	28
6320	2	2020	1	1	74484.85	14262.00	5.22	28
6321	2	2020	1	2	75576.85	14513.00	5.21	28
6322	2	2020	2	0	51037.00	11109.00	4.59	28
6323	2	2020	2	1	215381.00	40591.00	5.31	28
6324	2	2020	2	2	266418.00	51700.00	5.15	28
6325	2	1987	1	0	\N	\N	\N	29
6326	2	1987	1	1	7790.00	3010.00	2.59	29
6327	2	1987	1	2	7790.00	3010.00	2.59	29
6328	2	1987	2	0	15545.00	12380.00	1.26	29
6329	2	1987	2	1	28294.00	12000.00	2.36	29
6330	2	1987	2	2	43839.00	24380.00	1.80	29
6331	2	1988	1	0	\N	\N	\N	29
6332	2	1988	1	1	8736.00	3540.00	2.47	29
6333	2	1988	1	2	8736.00	3540.00	2.47	29
6334	2	1988	2	0	42000.00	19200.00	2.19	29
6335	2	1988	2	1	29297.00	11060.00	2.65	29
6336	2	1988	2	2	71297.00	30260.00	2.36	29
6337	2	1989	1	0	\N	\N	\N	29
6338	2	1989	1	1	8477.00	3510.00	2.42	29
6339	2	1989	1	2	8477.00	3510.00	2.42	29
6340	2	1989	2	0	34237.00	18740.00	1.83	29
6341	2	1989	2	1	25738.00	9860.00	2.61	29
6342	2	1989	2	2	59975.00	28600.00	2.10	29
6343	2	1990	1	0	\N	\N	\N	29
6344	2	1990	1	1	9560.00	3520.00	2.72	29
6345	2	1990	1	2	9560.00	3520.00	2.72	29
6346	2	1990	2	0	43716.00	21100.00	2.07	29
6347	2	1990	2	1	29119.00	8970.00	3.25	29
6348	2	1990	2	2	72835.00	30070.00	2.42	29
6349	2	1991	1	0	\N	\N	\N	29
6350	2	1991	1	1	10644.00	3660.00	2.91	29
6351	2	1991	1	2	10644.00	3660.00	2.91	29
6352	2	1991	2	0	39918.00	19810.00	2.02	29
6353	2	1991	2	1	22824.00	8410.00	2.71	29
6354	2	1991	2	2	62742.00	28220.00	2.22	29
6355	2	1992	1	0	\N	\N	\N	29
6356	2	1992	1	1	10146.00	3720.00	2.73	29
6357	2	1992	1	2	10146.00	3720.00	2.73	29
6358	2	1992	2	0	30347.00	18290.00	1.66	29
6359	2	1992	2	1	20140.00	8360.00	2.41	29
6360	2	1992	2	2	50487.00	26650.00	1.89	29
6361	2	1993	1	0	\N	\N	\N	29
6362	2	1993	1	1	16288.00	6190.00	2.63	29
6363	2	1993	1	2	16288.00	6190.00	2.63	29
6364	2	1993	2	0	42305.00	22990.00	1.84	29
6365	2	1993	2	1	26715.00	9450.00	2.83	29
6366	2	1993	2	2	69020.00	32440.00	2.13	29
6367	2	1994	1	0	\N	\N	\N	29
6368	2	1994	1	1	16750.00	6700.00	2.50	29
6369	2	1994	1	2	16750.00	6700.00	2.50	29
6370	2	1994	2	0	65894.00	26520.00	2.48	29
6371	2	1994	2	1	36886.00	11650.00	3.17	29
6372	2	1994	2	2	102780.00	38170.00	2.69	29
6373	2	1995	1	0	\N	\N	\N	29
6374	2	1995	1	1	13738.00	5430.00	2.53	29
6375	2	1995	1	2	13738.00	5430.00	2.53	29
6376	2	1995	2	0	64013.00	26278.00	2.44	29
6377	2	1995	2	1	36393.00	12535.00	2.90	29
6378	2	1995	2	2	100406.00	38813.00	2.59	29
6379	2	1996	1	0	\N	\N	\N	29
6380	2	1996	1	1	13940.00	5302.00	2.63	29
6381	2	1996	1	2	13940.00	5302.00	2.63	29
6382	2	1996	2	0	72682.00	25449.00	2.86	29
6383	2	1996	2	1	38568.00	11974.00	3.22	29
6384	2	1996	2	2	111250.00	37423.00	2.97	29
6385	2	1997	1	0	\N	\N	\N	29
6386	2	1997	1	1	14120.00	4500.00	3.14	29
6387	2	1997	1	2	14120.00	4500.00	3.14	29
6388	2	1997	2	0	66528.00	25056.00	2.66	29
6389	2	1997	2	1	40062.00	12073.00	3.32	29
6390	2	1997	2	2	106590.00	37129.00	2.87	29
6391	2	1998	1	0	\N	\N	\N	29
6392	2	1998	1	1	10786.00	3779.00	2.85	29
6393	2	1998	1	2	10786.00	3779.00	2.85	29
6394	2	1998	2	0	61168.00	24215.00	2.53	29
6395	2	1998	2	1	40034.00	12702.00	3.15	29
6396	2	1998	2	2	101202.00	36917.00	2.74	29
6397	2	1999	1	0	\N	\N	\N	29
6398	2	1999	1	1	15918.00	4442.00	3.58	29
6399	2	1999	1	2	15918.00	4442.00	3.58	29
6400	2	1999	2	0	71230.00	23934.00	2.98	29
6401	2	1999	2	1	42941.00	12281.00	3.50	29
6402	2	1999	2	2	114171.00	36215.00	3.15	29
6403	2	2000	1	0	\N	\N	\N	29
6404	2	2000	1	1	17211.00	4650.00	3.70	29
6405	2	2000	1	2	17211.00	4650.00	3.70	29
6406	2	2000	2	0	79817.00	24943.00	3.20	29
6407	2	2000	2	1	55084.00	13930.00	3.95	29
6408	2	2000	2	2	134901.00	38873.00	3.47	29
6409	2	2001	1	0	\N	\N	\N	29
6410	2	2001	1	1	19158.00	5063.00	3.78	29
6411	2	2001	1	2	19158.00	5063.00	3.78	29
6412	2	2001	2	0	71626.00	21861.00	3.28	29
6413	2	2001	2	1	57551.00	14720.00	3.91	29
6414	2	2001	2	2	129177.00	36581.00	3.53	29
6415	2	2002	1	0	\N	\N	\N	29
6416	2	2002	1	1	16766.00	4944.00	3.39	29
6417	2	2002	1	2	16766.00	4944.00	3.39	29
6418	2	2002	2	0	73064.00	23782.00	3.07	29
6419	2	2002	2	1	52610.00	14379.00	3.66	29
6420	2	2002	2	2	125674.00	38161.00	3.29	29
6421	2	2003	1	0	\N	\N	\N	29
6422	2	2003	1	1	7362.00	2316.00	3.18	29
6423	2	2003	1	2	7362.00	2316.00	3.18	29
6424	2	2003	2	0	73051.00	22260.00	3.28	29
6425	2	2003	2	1	76521.00	19434.00	3.94	29
6426	2	2003	2	2	149572.00	41694.00	3.59	29
6427	2	2004	1	0	\N	\N	\N	29
6428	2	2004	1	1	15086.00	4244.00	3.55	29
6429	2	2004	1	2	15086.00	4244.00	3.55	29
6430	2	2004	2	0	68095.00	21500.00	3.17	29
6431	2	2004	2	1	72481.00	20389.00	3.55	29
6432	2	2004	2	2	140576.00	41889.00	3.36	29
6433	2	2005	1	0	\N	\N	\N	29
6434	2	2005	1	1	13488.00	4050.00	3.33	29
6435	2	2005	1	2	13488.00	4050.00	3.33	29
6436	2	2005	2	0	76178.00	21700.00	3.51	29
6437	2	2005	2	1	82790.00	20889.00	3.96	29
6438	2	2005	2	2	158968.00	42589.00	3.73	29
6439	2	2006	1	0	\N	\N	\N	29
6441	2	2006	1	2	15561.00	4050.00	3.84	29
6442	2	2006	2	0	90066.00	22256.00	4.05	29
6443	2	2006	2	1	90441.00	20209.00	4.48	29
6444	2	2006	2	2	180507.00	42465.00	4.25	29
6445	2	2007	1	0	\N	\N	\N	29
6446	2	2007	1	1	16250.00	4138.00	3.93	29
6447	2	2007	1	2	16250.00	4138.00	3.93	29
6448	2	2007	2	0	88622.00	21601.00	4.10	29
6449	2	2007	2	1	92622.00	20734.00	4.47	29
6450	2	2007	2	2	181244.00	42335.00	4.28	29
6451	2	2008	1	0	\N	\N	\N	29
6452	2	2008	1	1	17120.00	4161.00	4.11	29
6453	2	2008	1	2	17120.00	4161.00	4.11	29
6454	2	2008	2	0	93566.00	22595.00	4.14	29
6455	2	2008	2	1	91961.00	20302.00	4.53	29
6456	2	2008	2	2	185527.00	42897.00	4.32	29
6457	2	2009	1	0	\N	\N	\N	29
6458	2	2009	1	1	18636.00	4585.00	4.06	29
6459	2	2009	1	2	18636.00	4585.00	4.06	29
6460	2	2009	2	0	78867.00	22381.00	3.52	29
6461	2	2009	2	1	70525.00	19932.00	3.54	29
6462	2	2009	2	2	149392.00	42313.00	3.53	29
6463	2	2010	1	0	\N	\N	\N	29
6464	2	2010	1	1	18130.00	4803.00	3.77	29
6465	2	2010	1	2	18130.00	4803.00	3.77	29
6466	2	2010	2	0	81176.00	22560.00	3.60	29
6467	2	2010	2	1	83876.00	20298.00	4.13	29
6468	2	2010	2	2	165052.00	42858.00	3.85	29
6469	2	2011	1	0	\N	\N	\N	29
6470	2	2011	1	1	18783.00	4544.00	4.13	29
6471	2	2011	1	2	18783.00	4544.00	4.13	29
6472	2	2011	2	0	84213.00	22350.00	3.77	29
6473	2	2011	2	1	88156.00	20850.00	4.23	29
6474	2	2011	2	2	172369.00	43200.00	3.99	29
6475	2	2012	1	0	\N	\N	\N	29
6476	2	2012	1	1	20044.00	4682.00	4.28	29
6477	2	2012	1	2	20044.00	4682.00	4.28	29
6478	2	2012	2	0	88261.00	21275.00	4.15	29
6479	2	2012	2	1	100075.00	21829.00	4.58	29
6480	2	2012	2	2	188336.00	43104.00	4.37	29
6481	2	2013	1	0	\N	\N	\N	29
6482	2	2013	1	1	21191.00	5016.00	4.22	29
6483	2	2013	1	2	21191.00	5016.00	4.22	29
6484	2	2013	2	0	83784.00	20250.00	4.14	29
6485	2	2013	2	1	104327.00	22909.00	4.55	29
6486	2	2013	2	2	188111.00	43159.00	4.36	29
6487	2	2014	1	0	\N	\N	\N	29
6488	2	2014	1	1	23302.00	5197.00	4.48	29
6489	2	2014	1	2	23302.00	5197.00	4.48	29
6490	2	2014	2	0	80714.00	20129.00	4.01	29
6491	2	2014	2	1	101286.00	23064.00	4.39	29
6492	2	2014	2	2	182000.00	43193.00	4.21	29
6493	2	2015	1	0	\N	\N	\N	29
6494	2	2015	1	1	24183.00	5534.00	4.37	29
6495	2	2015	1	2	24183.00	5534.00	4.37	29
6496	2	2015	2	0	83555.00	20197.00	4.14	29
6497	2	2015	2	1	103137.00	22630.00	4.56	29
6498	2	2015	2	2	186692.00	42827.00	4.36	29
6499	2	2016	1	0	\N	\N	\N	29
6500	2	2016	1	1	26124.00	5606.00	4.66	29
6501	2	2016	1	2	26124.00	5606.00	4.66	29
6502	2	2016	2	0	83668.00	19888.00	4.21	29
6503	2	2016	2	1	99927.00	22366.00	4.47	29
6504	2	2016	2	2	183595.00	42254.00	4.35	29
6505	2	2017	1	0	0.00	0.00	\N	29
6506	2	2017	1	1	27662.00	5630.00	4.91	29
6507	2	2017	1	2	27662.00	5630.00	4.91	29
6508	2	2017	2	0	87066.00	18827.00	4.62	29
6509	2	2017	2	1	115500.00	23886.00	4.84	29
6510	2	2017	2	2	202566.00	42713.00	4.74	29
6511	2	2018	1	0	0.00	0.00	\N	29
6512	2	2018	1	1	31122.00	6214.00	5.01	29
6513	2	2018	1	2	31122.00	6214.00	5.01	29
6514	2	2018	2	0	72073.00	18642.00	3.87	29
6515	2	2018	2	1	98797.00	24148.00	4.09	29
6516	2	2018	2	2	170870.00	42790.00	3.99	29
6517	2	2019	1	0	0.00	0.00	\N	29
6518	2	2019	1	1	36188.00	7183.68	5.04	29
6519	2	2019	1	2	36188.00	7183.68	5.04	29
6520	2	2019	2	0	88181.37	18642.00	4.73	29
6521	2	2019	2	1	123757.00	24329.00	5.09	29
6522	2	2019	2	2	211938.37	42971.00	4.93	29
6523	2	2020	1	0	0.00	0.00	\N	29
6524	2	2020	1	1	37065.00	6995.00	5.30	29
6525	2	2020	1	2	37065.00	6995.00	5.30	29
6526	2	2020	2	0	83605.00	18706.00	4.47	29
6527	2	2020	2	1	128501.00	25381.00	5.06	29
6528	2	2020	2	2	212106.00	44087.00	4.81	29
6529	1	1987	1	0	7580.00	3190.00	2.38	3
6530	1	1987	1	1	633705.00	166600.00	3.80	3
6531	1	1987	1	2	641285.00	169790.00	3.78	3
6532	1	1987	2	0	268428.00	114570.00	2.34	3
6533	1	1987	2	1	659478.00	211080.00	3.12	3
6534	1	1987	2	2	927906.00	325650.00	2.85	3
6535	1	1988	1	0	4697.00	2580.00	1.82	3
6536	1	1988	1	1	540751.00	146980.00	3.68	3
6537	1	1988	1	2	545448.00	149560.00	3.65	3
6538	1	1988	2	0	254500.00	119600.00	2.13	3
6539	1	1988	2	1	508178.00	210520.00	2.41	3
6540	1	1988	2	2	762678.00	330120.00	2.31	3
6541	1	1989	1	0	3032.00	1350.00	2.25	3
6542	1	1989	1	1	706630.00	176360.00	4.01	3
6543	1	1989	1	2	709662.00	177710.00	3.99	3
6544	1	1989	2	0	309396.00	117030.00	2.64	3
6545	1	1989	2	1	699344.00	235890.00	2.96	3
6546	1	1989	2	2	1008740.00	352920.00	2.86	3
6547	1	1990	1	0	2678.00	940.00	2.85	3
6548	1	1990	1	1	687436.00	168310.00	4.08	3
6549	1	1990	1	2	690114.00	169250.00	4.08	3
6550	1	1990	2	0	475649.00	135010.00	3.52	3
6551	1	1990	2	1	798156.00	234730.00	3.40	3
6552	1	1990	2	2	1273805.00	369740.00	3.45	3
6553	1	1991	1	0	2063.00	930.00	2.22	3
6554	1	1991	1	1	790083.00	176400.00	4.48	3
6555	1	1991	1	2	792146.00	177330.00	4.47	3
6556	1	1991	2	0	348066.00	124600.00	2.79	3
6557	1	1991	2	1	656447.00	215130.00	3.05	3
6558	1	1991	2	2	1004513.00	339730.00	2.96	3
6559	1	1992	1	0	4722.00	1560.00	3.03	3
6560	1	1992	1	1	670374.00	157850.00	4.25	3
6561	1	1992	1	2	675096.00	159410.00	4.23	3
6562	1	1992	2	0	349720.00	119680.00	2.92	3
6563	1	1992	2	1	763443.00	210500.00	3.63	3
6564	1	1992	2	2	1113163.00	330180.00	3.37	3
6565	1	1993	1	0	4099.00	1370.00	2.99	3
6566	1	1993	1	1	733874.00	174310.00	4.21	3
6567	1	1993	1	2	737973.00	175680.00	4.20	3
6568	1	1993	2	0	386913.00	144080.00	2.69	3
6569	1	1993	2	1	535537.00	177380.00	3.02	3
6570	1	1993	2	2	922450.00	321460.00	2.87	3
6571	1	1994	1	0	3598.00	1260.00	2.86	3
6572	1	1994	1	1	854396.00	211330.00	4.04	3
6573	1	1994	1	2	857994.00	212590.00	4.04	3
6574	1	1994	2	0	341798.00	124990.00	2.73	3
6575	1	1994	2	1	741257.00	213650.00	3.47	3
6576	1	1994	2	2	1083055.00	338640.00	3.20	3
6577	1	1995	1	0	4427.00	1500.00	2.95	3
6578	1	1995	1	1	811124.00	214433.00	3.78	3
6579	1	1995	1	2	815551.00	215933.00	3.78	3
6580	1	1995	2	0	315312.00	118744.00	2.66	3
6581	1	1995	2	1	691226.00	233405.00	2.96	3
6582	1	1995	2	2	1006538.00	352149.00	2.86	3
6583	1	1996	1	0	5190.00	2000.00	2.60	3
6584	1	1996	1	1	862048.00	210375.00	4.10	3
6585	1	1996	1	2	867238.00	212375.00	4.08	3
6586	1	1996	2	0	277848.00	108444.00	2.56	3
6587	1	1996	2	1	806067.00	241662.00	3.34	3
6588	1	1996	2	2	1083915.00	350106.00	3.10	3
6589	1	1997	1	0	6258.00	2387.00	2.62	3
6590	1	1997	1	1	887145.00	210554.00	4.21	3
6591	1	1997	1	2	893403.00	212941.00	4.20	3
6592	1	1997	2	0	322407.00	107029.00	3.01	3
6593	1	1997	2	1	857780.00	242760.00	3.53	3
6594	1	1997	2	2	1180187.00	349789.00	3.37	3
6595	1	1998	1	0	4487.00	1770.00	2.54	3
6596	1	1998	1	1	609019.00	157747.00	3.86	3
6597	1	1998	1	2	613506.00	159517.00	3.85	3
6598	1	1998	2	0	174649.00	78557.00	2.22	3
6599	1	1998	2	1	582105.00	210282.00	2.77	3
6600	1	1998	2	2	756754.00	288839.00	2.62	3
6601	1	1999	1	0	9982.00	3905.00	2.56	3
6602	1	1999	1	1	843124.00	221175.00	3.81	3
6603	1	1999	1	2	853106.00	225080.00	3.79	3
6604	1	1999	2	0	250169.00	91607.00	2.73	3
6605	1	1999	2	1	809460.00	233333.00	3.47	3
6606	1	1999	2	2	1059629.00	324940.00	3.26	3
6607	1	2000	1	0	7902.00	2600.00	3.04	3
6608	1	2000	1	1	930970.00	217790.00	4.27	3
6609	1	2000	1	2	938872.00	220390.00	4.26	3
6610	1	2000	2	0	240217.00	88188.00	2.72	3
6611	1	2000	2	1	781143.00	243683.00	3.21	3
6612	1	2000	2	2	1021360.00	331871.00	3.08	3
6613	1	2001	1	0	8958.00	2792.00	3.21	3
6614	1	2001	1	1	931265.00	216968.00	4.29	3
6615	1	2001	1	2	940223.00	219760.00	4.28	3
6616	1	2001	2	0	298646.00	89920.00	3.32	3
6617	1	2001	2	1	934968.00	248290.00	3.77	3
6618	1	2001	2	2	1233614.00	338210.00	3.65	3
6619	1	2002	1	0	7960.00	2400.00	3.32	3
6620	1	2002	1	1	926910.00	212520.00	4.36	3
6621	1	2002	1	2	934870.00	214920.00	4.35	3
6622	1	2002	2	0	312590.00	86338.00	3.62	3
6623	1	2002	2	1	992919.00	253618.00	3.92	3
6624	1	2002	2	2	1305509.00	339956.00	3.84	3
6625	1	2003	1	0	3511.00	1055.00	3.33	3
6626	1	2003	1	1	992389.00	226449.00	4.38	3
6627	1	2003	1	2	995900.00	227504.00	4.38	3
6628	1	2003	2	0	296042.00	85824.00	3.45	3
6629	1	2003	2	1	1103519.00	256401.00	4.30	3
6630	1	2003	2	2	1399561.00	342225.00	4.09	3
6631	1	2004	1	0	2998.00	867.00	3.46	3
6632	1	2004	1	1	1054971.00	231744.00	4.55	3
6633	1	2004	1	2	1057969.00	232611.00	4.55	3
6634	1	2004	2	0	314341.00	84368.00	3.73	3
6635	1	2004	2	1	1094131.00	248773.00	4.40	3
6636	1	2004	2	2	1408472.00	333141.00	4.23	3
6637	1	2005	1	0	3230.00	925.00	3.49	3
6638	1	2005	1	1	1108128.00	234628.00	4.72	3
6639	1	2005	1	2	1111358.00	235553.00	4.72	3
6640	1	2005	2	0	288129.00	81098.00	3.55	3
6641	1	2005	2	1	1146366.00	254369.00	4.51	3
6642	1	2005	2	2	1434495.00	335467.00	4.28	3
6643	1	2006	1	0	5364.00	1530.00	3.51	3
6644	1	2006	1	1	1099436.00	231102.00	4.76	3
6645	1	2006	1	2	1104800.00	232632.00	4.75	3
6646	1	2006	2	0	307139.00	81884.00	3.75	3
6647	1	2006	2	1	1265694.00	278517.00	4.54	3
6648	1	2006	2	2	1572833.00	360401.00	4.36	3
6649	1	2007	1	0	4492.00	1299.00	3.46	3
6650	1	2007	1	1	1236381.00	251914.00	4.91	3
6651	1	2007	1	2	1240873.00	253213.00	4.90	3
6652	1	2007	2	0	309132.00	83229.00	3.71	3
6653	1	2007	2	1	1392108.00	304471.00	4.57	3
6654	1	2007	2	2	1701240.00	387700.00	4.39	3
6655	1	2008	1	0	2967.00	848.00	3.50	3
6656	1	2008	1	1	1314707.00	263234.00	4.99	3
6657	1	2008	1	2	1317674.00	264082.00	4.99	3
6658	1	2008	2	0	300947.00	85103.00	3.54	3
6659	1	2008	2	1	1395726.00	317124.00	4.40	3
6660	1	2008	2	2	1696673.00	402227.00	4.22	3
6661	1	2009	1	0	3251.00	900.00	3.61	3
6662	1	2009	1	1	1435986.00	279429.00	5.14	3
6663	1	2009	1	2	1439237.00	280329.00	5.13	3
6664	1	2009	2	0	264688.00	83316.00	3.18	3
6665	1	2009	2	1	1101542.00	300476.00	3.67	3
6666	1	2009	2	2	1366230.00	383792.00	3.56	3
6667	1	2010	1	0	2908.00	790.00	3.68	3
6668	1	2010	1	1	1461537.00	285812.00	5.11	3
6669	1	2010	1	2	1464445.00	286602.00	5.11	3
6670	1	2010	2	0	242697.00	81538.00	2.98	3
6671	1	2010	2	1	1251273.00	313761.00	3.99	3
6672	1	2010	2	2	1493970.00	395299.00	3.78	3
6673	1	2011	1	0	3256.00	981.00	3.32	3
6674	1	2011	1	1	1472864.00	290807.00	5.06	3
6675	1	2011	1	2	1476120.00	291788.00	5.06	3
6676	1	2011	2	0	226244.00	71708.00	3.16	3
6677	1	2011	2	1	913719.00	253391.00	3.61	3
6678	1	2011	2	2	1139963.00	325099.00	3.51	3
6679	1	2012	1	0	3688.00	1014.00	3.64	3
6680	1	2012	1	1	1570350.00	303006.00	5.18	3
6681	1	2012	1	2	1574038.00	304020.00	5.18	3
6682	1	2012	2	0	277104.00	74876.00	3.70	3
6683	1	2012	2	1	1369465.00	296885.00	4.61	3
6684	1	2012	2	2	1646569.00	371761.00	4.43	3
6685	1	2013	1	0	6596.00	1733.00	3.81	3
6686	1	2013	1	1	1684448.00	321254.00	5.24	3
6687	1	2013	1	2	1691044.00	322987.00	5.24	3
6688	1	2013	2	0	309110.00	77420.00	3.99	3
6689	1	2013	2	1	1409314.00	310410.00	4.54	3
6690	1	2013	2	2	1718424.00	387830.00	4.43	3
6691	1	2014	1	0	6869.00	1748.00	3.93	3
6692	1	2014	1	1	1847290.00	326342.00	5.66	3
6693	1	2014	1	2	1854159.00	328090.00	5.65	3
6694	1	2014	2	0	335228.00	75491.00	4.44	3
6695	1	2014	2	1	1575763.00	313610.00	5.02	3
6696	1	2014	2	2	1910991.00	389101.00	4.91	3
6697	1	2015	1	0	8105.00	2000.00	4.05	3
6698	1	2015	1	1	1871692.00	321405.00	5.82	3
6699	1	2015	1	2	1879797.00	323405.00	5.81	3
6700	1	2015	2	0	236425.00	74833.00	3.16	3
6701	1	2015	2	1	1188088.00	301408.00	3.94	3
6702	1	2015	2	2	1424513.00	376241.00	3.79	3
6703	1	2016	1	0	3785.00	1145.00	3.31	3
6704	1	2016	1	1	1799977.12	318484.00	5.65	3
6705	1	2016	1	2	1803762.12	319629.00	5.64	3
6706	1	2016	2	0	224258.00	65697.00	3.41	3
6707	1	2016	2	1	1314863.00	318859.00	4.12	3
6708	1	2016	2	2	1539121.00	384556.00	4.00	3
6709	1	2017	1	0	6948.00	1669.00	4.16	3
6710	1	2017	1	1	1786728.00	321064.82	5.57	3
6711	1	2017	1	2	1793676.00	322733.82	5.56	3
6712	1	2017	2	0	285065.00	67429.00	4.23	3
6713	1	2017	2	1	1556066.00	330767.00	4.70	3
6714	1	2017	2	2	1841131.00	398196.00	4.62	3
6715	1	2018	1	0	6186.00	1531.00	4.04	3
6716	1	2018	1	1	1802278.00	325288.00	5.54	3
6717	1	2018	1	2	1808464.00	326819.00	5.53	3
6718	1	2018	2	0	262764.12	63153.00	4.16	3
6719	1	2018	2	1	1543887.00	337732.00	4.57	3
6720	1	2018	2	2	1806651.12	400885.00	4.51	3
6721	1	2019	1	0	4641.98	1128.00	4.12	3
6722	1	2019	1	1	1853603.83	331627.21	5.59	3
6723	1	2019	1	2	1858245.81	332755.21	5.58	3
6724	1	2019	2	0	220901.03	53585.00	4.12	3
6725	1	2019	2	1	1651033.49	344444.21	4.79	3
6726	1	2019	2	2	1871934.52	398029.21	4.70	3
6727	1	2020	1	0	4696.00	1206.00	3.89	3
6728	1	2020	1	1	1761383.00	326135.60	5.40	3
6729	1	2020	1	2	1766079.00	327341.60	5.40	3
6730	1	2020	2	0	209058.05	50402.00	4.15	3
6731	1	2020	2	1	1660010.54	333464.50	4.98	3
6732	1	2020	2	2	1869068.59	383866.50	4.87	3
6733	2	1987	1	0	13465.00	5840.00	2.31	3
6734	2	1987	1	1	7820.00	2160.00	3.62	3
6735	2	1987	1	2	21285.00	8000.00	2.66	3
6736	2	1987	2	0	10204.00	4500.00	2.27	3
6737	2	1987	2	1	12703.00	3650.00	3.48	3
6738	2	1987	2	2	22907.00	8150.00	2.81	3
6739	2	1988	1	0	11445.00	3650.00	3.14	3
6740	2	1988	1	1	12037.00	3100.00	3.88	3
6741	2	1988	1	2	23482.00	6750.00	3.48	3
6742	2	1988	2	0	7980.00	3110.00	2.57	3
6743	2	1988	2	1	12541.00	3300.00	3.80	3
6744	2	1988	2	2	20521.00	6410.00	3.20	3
6745	2	1989	1	0	8368.00	3290.00	2.54	3
6746	2	1989	1	1	13099.00	3680.00	3.56	3
6747	2	1989	1	2	21467.00	6970.00	3.08	3
6748	2	1989	2	0	11727.00	4540.00	2.58	3
6749	2	1989	2	1	14967.00	4720.00	3.17	3
6750	2	1989	2	2	26694.00	9260.00	2.88	3
6751	2	1990	1	0	12874.00	4080.00	3.16	3
6752	2	1990	1	1	10925.00	2810.00	3.89	3
6753	2	1990	1	2	23799.00	6890.00	3.45	3
6754	2	1990	2	0	18326.00	5970.00	3.07	3
6755	2	1990	2	1	22075.00	5940.00	3.72	3
6756	2	1990	2	2	40401.00	11910.00	3.39	3
6757	2	1991	1	0	9965.00	3850.00	2.59	3
6758	2	1991	1	1	8929.00	3140.00	2.84	3
6759	2	1991	1	2	18894.00	6990.00	2.70	3
6760	2	1991	2	0	6850.00	3080.00	2.22	3
6761	2	1991	2	1	13155.00	4170.00	3.15	3
6762	2	1991	2	2	20005.00	7250.00	2.76	3
6763	2	1992	1	0	6238.00	2280.00	2.74	3
6764	2	1992	1	1	10390.00	3220.00	3.23	3
6765	2	1992	1	2	16628.00	5500.00	3.02	3
6766	2	1992	2	0	18446.00	6380.00	2.89	3
6767	2	1992	2	1	10000.00	2500.00	4.00	3
6768	2	1992	2	2	28446.00	8880.00	3.20	3
6769	2	1993	1	0	3715.00	2550.00	1.46	3
6770	2	1993	1	1	17895.00	4250.00	4.21	3
6771	2	1993	1	2	21610.00	6800.00	3.18	3
6772	2	1993	2	0	18814.00	6230.00	3.02	3
6773	2	1993	2	1	15008.00	4650.00	3.23	3
6774	2	1993	2	2	33822.00	10880.00	3.11	3
6775	2	1994	1	0	18578.00	8910.00	2.09	3
6776	2	1994	1	1	22252.00	7810.00	2.85	3
6777	2	1994	1	2	40830.00	16720.00	2.44	3
6778	2	1994	2	0	25370.00	10750.00	2.36	3
6779	2	1994	2	1	24420.00	7790.00	3.13	3
6780	2	1994	2	2	49790.00	18540.00	2.69	3
6781	2	1995	1	0	30556.00	12200.00	2.50	3
6782	2	1995	1	1	29680.00	10800.00	2.75	3
6783	2	1995	1	2	60236.00	23000.00	2.62	3
6784	2	1995	2	0	37684.00	15200.00	2.48	3
6785	2	1995	2	1	33477.00	11640.00	2.88	3
6786	2	1995	2	2	71161.00	26840.00	2.65	3
6787	2	1996	1	0	30722.00	14155.00	2.17	3
6788	2	1996	1	1	30187.00	11162.00	2.70	3
6789	2	1996	1	2	60909.00	25317.00	2.41	3
6790	2	1996	2	0	15044.00	9470.00	1.59	3
6791	2	1996	2	1	32981.00	11089.00	2.97	3
6792	2	1996	2	2	48025.00	20559.00	2.34	3
6793	2	1997	1	0	20475.00	10377.00	1.97	3
6794	2	1997	1	1	26670.00	9043.00	2.95	3
6795	2	1997	1	2	47145.00	19420.00	2.43	3
6796	2	1997	2	0	14632.00	8507.00	1.72	3
6797	2	1997	2	1	30358.00	10850.00	2.80	3
6798	2	1997	2	2	44990.00	19357.00	2.32	3
6799	2	1998	1	0	19346.00	8892.00	2.18	3
6800	2	1998	1	1	45006.00	13178.00	3.42	3
6801	2	1998	1	2	64352.00	22070.00	2.92	3
6802	2	1998	2	0	11923.00	4825.00	2.47	3
6803	2	1998	2	1	29225.00	10956.00	2.67	3
6804	2	1998	2	2	41148.00	15781.00	2.61	3
6805	2	1999	1	0	21230.00	9880.00	2.15	3
6806	2	1999	1	1	33560.00	11985.00	2.80	3
6807	2	1999	1	2	54790.00	21865.00	2.51	3
6808	2	1999	2	0	19856.00	7811.00	2.54	3
6809	2	1999	2	1	41094.00	12935.00	3.18	3
6810	2	1999	2	2	60950.00	20746.00	2.94	3
6811	2	2000	1	0	18035.00	8105.00	2.23	3
6812	2	2000	1	1	39285.00	13435.00	2.92	3
6813	2	2000	1	2	57320.00	21540.00	2.66	3
6814	2	2000	2	0	24967.00	9385.00	2.66	3
6815	2	2000	2	1	48143.00	13750.00	3.50	3
6816	2	2000	2	2	73110.00	23135.00	3.16	3
6817	2	2001	1	0	20715.00	8200.00	2.53	3
6818	2	2001	1	1	36040.00	13205.00	2.73	3
6819	2	2001	1	2	56755.00	21405.00	2.65	3
6820	2	2001	2	0	24470.00	9545.00	2.56	3
6821	2	2001	2	1	53650.00	14940.00	3.59	3
6822	2	2001	2	2	78120.00	24485.00	3.19	3
6823	2	2002	1	0	21295.00	8215.00	2.59	3
6824	2	2002	1	1	38580.00	13535.00	2.85	3
6825	2	2002	1	2	59875.00	21750.00	2.75	3
6826	2	2002	2	0	18960.00	8380.00	2.26	3
6827	2	2002	2	1	48890.00	15420.00	3.17	3
6828	2	2002	2	2	67850.00	23800.00	2.85	3
6829	2	2003	1	0	25369.00	9145.00	2.77	3
6830	2	2003	1	1	46580.00	13525.00	3.44	3
6831	2	2003	1	2	71949.00	22670.00	3.17	3
6832	2	2003	2	0	11647.00	4710.00	2.47	3
6833	2	2003	2	1	43960.00	13920.00	3.16	3
6834	2	2003	2	2	55607.00	18630.00	2.98	3
6835	2	2004	1	0	23519.00	8980.00	2.62	3
6836	2	2004	1	1	45436.00	13570.00	3.35	3
6837	2	2004	1	2	68955.00	22550.00	3.06	3
6838	2	2004	2	0	12746.00	4600.00	2.77	3
6839	2	2004	2	1	52565.00	16025.00	3.28	3
6840	2	2004	2	2	65311.00	20625.00	3.17	3
6841	2	2005	1	0	22650.00	7980.00	2.84	3
6842	2	2005	1	1	48638.00	13280.00	3.66	3
6843	2	2005	1	2	71288.00	21260.00	3.35	3
6844	2	2005	2	0	19826.00	6692.00	2.96	3
6845	2	2005	2	1	64630.00	15810.00	4.09	3
6846	2	2005	2	2	84456.00	22502.00	3.75	3
6847	2	2006	1	0	29493.00	9833.00	3.00	3
6848	2	2006	1	1	52441.00	14240.00	3.68	3
6849	2	2006	1	2	81934.00	24073.00	3.40	3
6850	2	2006	2	0	21500.00	7910.00	2.72	3
6851	2	2006	2	1	56770.00	15650.00	3.63	3
6852	2	2006	2	2	78270.00	23560.00	3.32	3
6853	2	2007	1	0	30981.00	10683.00	2.90	3
6854	2	2007	1	1	59506.00	15754.00	3.78	3
6855	2	2007	1	2	90487.00	26437.00	3.42	3
6856	2	2007	2	0	27708.00	9595.00	2.89	3
6857	2	2007	2	1	64620.00	16695.00	3.87	3
6858	2	2007	2	2	92328.00	26290.00	3.51	3
6859	2	2008	1	0	36100.00	11417.00	3.16	3
6860	2	2008	1	1	59723.00	15383.00	3.88	3
6861	2	2008	1	2	95823.00	26800.00	3.58	3
6862	2	2008	2	0	33335.00	13182.00	2.53	3
6863	2	2008	2	1	68410.00	18100.00	3.78	3
6864	2	2008	2	2	101745.00	31282.00	3.25	3
6865	2	2009	1	0	27866.00	12052.00	2.31	3
6866	2	2009	1	1	50179.00	15276.00	3.28	3
6867	2	2009	1	2	78045.00	27328.00	2.86	3
6868	2	2009	2	0	36311.50	13083.00	2.78	3
6869	2	2009	2	1	62520.00	16219.00	3.85	3
6870	2	2009	2	2	98831.50	29302.00	3.37	3
6871	2	2010	1	0	33368.00	12244.00	2.73	3
6872	2	2010	1	1	56194.00	16819.00	3.34	3
6873	2	2010	1	2	89562.00	29063.00	3.08	3
6874	2	2010	2	0	32161.00	12662.00	2.54	3
6875	2	2010	2	1	53610.00	16680.00	3.21	3
6876	2	2010	2	2	85771.00	29342.00	2.92	3
6877	2	2011	1	0	36045.00	13699.00	2.63	3
6878	2	2011	1	1	54280.00	17150.00	3.17	3
6879	2	2011	1	2	90325.00	30849.00	2.93	3
6880	2	2011	2	0	48314.00	19098.00	2.53	3
6881	2	2011	2	1	56371.00	16532.00	3.41	3
6882	2	2011	2	2	104685.00	35630.00	2.94	3
6883	2	2012	1	0	66167.00	23736.00	2.79	3
6884	2	2012	1	1	66105.00	19006.00	3.48	3
6885	2	2012	1	2	132272.00	42742.00	3.09	3
6886	2	2012	2	0	47715.00	19213.00	2.48	3
6887	2	2012	2	1	60394.00	17279.00	3.50	3
6888	2	2012	2	2	108109.00	36492.00	2.96	3
6889	2	2013	1	0	83931.00	25236.00	3.33	3
6890	2	2013	1	1	73832.00	19250.00	3.84	3
6891	2	2013	1	2	157763.00	44486.00	3.55	3
6892	2	2013	2	0	73976.00	25857.00	2.86	3
6893	2	2013	2	1	73432.00	19667.00	3.73	3
6894	2	2013	2	2	147408.00	45524.00	3.24	3
6895	2	2014	1	0	82452.00	25043.00	3.29	3
6896	2	2014	1	1	77817.00	19694.00	3.95	3
6897	2	2014	1	2	160269.00	44737.00	3.58	3
6898	2	2014	2	0	64042.00	23936.00	2.68	3
6899	2	2014	2	1	67708.00	19300.00	3.51	3
6900	2	2014	2	2	131750.00	43236.00	3.05	3
6901	2	2015	1	0	72650.00	25014.00	2.90	3
6902	2	2015	1	1	74230.00	19618.00	3.78	3
6903	2	2015	1	2	146880.00	44632.00	3.29	3
6904	2	2015	2	0	36204.00	15640.00	2.31	3
6905	2	2015	2	1	50442.00	15158.00	3.33	3
6906	2	2015	2	2	86646.00	30798.00	2.81	3
6907	2	2016	1	0	59507.00	21957.00	2.71	3
6908	2	2016	1	1	56616.00	16135.00	3.51	3
6909	2	2016	1	2	116123.00	38092.00	3.05	3
6910	2	2016	2	0	39607.00	15622.00	2.54	3
6911	2	2016	2	1	66690.00	18577.00	3.59	3
6912	2	2016	2	2	106297.00	34199.00	3.11	3
6913	2	2017	1	0	60999.00	21722.00	2.81	3
6914	2	2017	1	1	70283.00	19284.00	3.64	3
6915	2	2017	1	2	131282.00	41006.00	3.20	3
6916	2	2017	2	0	53958.00	21718.00	2.48	3
6917	2	2017	2	1	62113.00	17325.00	3.59	3
6918	2	2017	2	2	116071.00	39043.00	2.97	3
6919	2	2018	1	0	69023.00	23497.00	2.94	3
6920	2	2018	1	1	72446.00	19498.00	3.72	3
6921	2	2018	1	2	141469.00	42995.00	3.29	3
6922	2	2018	2	0	46224.70	18678.00	2.47	3
6923	2	2018	2	1	71284.85	20259.00	3.52	3
6924	2	2018	2	2	117509.55	38937.00	3.02	3
6925	2	2019	1	0	70163.34	25254.00	2.78	3
6926	2	2019	1	1	71701.50	20579.00	3.48	3
6927	2	2019	1	2	141864.84	45833.00	3.10	3
6928	2	2019	2	0	32949.70	13885.00	2.37	3
6929	2	2019	2	1	39309.60	12115.00	3.24	3
6930	2	2019	2	2	72259.30	26000.00	2.78	3
6931	2	2020	1	0	75033.69	24535.00	3.06	3
6932	2	2020	1	1	74392.00	20610.00	3.61	3
6933	2	2020	1	2	149425.69	45145.00	3.31	3
6934	2	2020	2	0	44069.75	17755.00	2.48	3
6935	2	2020	2	1	75943.00	22600.00	3.36	3
6936	2	2020	2	2	120012.75	40355.00	2.97	3
6937	2	1987	1	0	136590.00	62620.00	2.18	30
6938	2	1987	1	1	72930.00	27300.00	2.67	30
6939	2	1987	1	2	209520.00	89920.00	2.33	30
6940	2	1987	2	0	236224.00	98790.00	2.39	30
6941	2	1987	2	1	88423.00	25160.00	3.51	30
6942	2	1987	2	2	324647.00	123950.00	2.62	30
6943	2	1988	1	0	86004.00	54340.00	1.58	30
6944	2	1988	1	1	82947.00	26710.00	3.11	30
6945	2	1988	1	2	168951.00	81050.00	2.08	30
6946	2	1988	2	0	212751.00	92040.00	2.31	30
6947	2	1988	2	1	123061.00	35660.00	3.45	30
6948	2	1988	2	2	335812.00	127700.00	2.63	30
6949	2	1989	1	0	128128.00	61450.00	2.09	30
6950	2	1989	1	1	77571.00	26840.00	2.89	30
6951	2	1989	1	2	205699.00	88290.00	2.33	30
6952	2	1989	2	0	142677.00	66510.00	2.15	30
6953	2	1989	2	1	120912.00	36090.00	3.35	30
6954	2	1989	2	2	263589.00	102600.00	2.57	30
6955	2	1990	1	0	55222.00	42300.00	1.31	30
6956	2	1990	1	1	35924.00	19840.00	1.81	30
6957	2	1990	1	2	91146.00	62140.00	1.47	30
6958	2	1990	2	0	131513.00	54490.00	2.41	30
6959	2	1990	2	1	129754.00	34050.00	3.81	30
6960	2	1990	2	2	261267.00	88540.00	2.95	30
6961	2	1991	1	0	112456.00	61750.00	1.82	30
6962	2	1991	1	1	75120.00	28340.00	2.65	30
6963	2	1991	1	2	187576.00	90090.00	2.08	30
6964	2	1991	2	0	194342.00	86820.00	2.24	30
6965	2	1991	2	1	118831.00	29100.00	4.08	30
6966	2	1991	2	2	313173.00	115920.00	2.70	30
6967	2	1992	1	0	76708.00	50800.00	1.51	30
6968	2	1992	1	1	67669.00	25870.00	2.62	30
6969	2	1992	1	2	144377.00	76670.00	1.88	30
6970	2	1992	2	0	222598.00	85380.00	2.61	30
6971	2	1992	2	1	193245.00	41330.00	4.68	30
6972	2	1992	2	2	415843.00	126710.00	3.28	30
6973	2	1993	1	0	117742.00	51870.00	2.27	30
6974	2	1993	1	1	124620.00	36220.00	3.44	30
6975	2	1993	1	2	242362.00	88090.00	2.75	30
6976	2	1993	2	0	188520.00	69130.00	2.73	30
6977	2	1993	2	1	278049.00	59620.00	4.66	30
6978	2	1993	2	2	466569.00	128750.00	3.62	30
6979	2	1994	1	0	137774.00	52990.00	2.60	30
6980	2	1994	1	1	146780.00	38550.00	3.81	30
6981	2	1994	1	2	284554.00	91540.00	3.11	30
6982	2	1994	2	0	141421.00	59130.00	2.39	30
6983	2	1994	2	1	243492.00	57870.00	4.21	30
6984	2	1994	2	2	384913.00	117000.00	3.29	30
6985	2	1995	1	0	47275.00	32380.00	1.46	30
6986	2	1995	1	1	110767.00	38660.00	2.87	30
6987	2	1995	1	2	158042.00	71040.00	2.22	30
6988	2	1995	2	0	170874.00	68070.00	2.51	30
6989	2	1995	2	1	224572.00	55240.00	4.07	30
6990	2	1995	2	2	395446.00	123310.00	3.21	30
6991	2	1996	1	0	97586.00	42480.00	2.30	30
6992	2	1996	1	1	162000.00	53410.00	3.03	30
6993	2	1996	1	2	259586.00	95890.00	2.71	30
6994	2	1996	2	0	146753.00	64464.00	2.28	30
6995	2	1996	2	1	202587.00	59900.00	3.38	30
6996	2	1996	2	2	349340.00	124364.00	2.81	30
6997	2	1997	1	0	81381.00	41585.00	1.96	30
6998	2	1997	1	1	127690.00	43843.00	2.91	30
6999	2	1997	1	2	209071.00	85428.00	2.45	30
7000	2	1997	2	0	129304.00	58318.00	2.22	30
7001	2	1997	2	1	212683.00	62812.00	3.39	30
7002	2	1997	2	2	341987.00	121130.00	2.82	30
7003	2	1998	1	0	14631.00	15565.00	0.94	30
7004	2	1998	1	1	73929.00	32669.00	2.26	30
7005	2	1998	1	2	88560.00	48234.00	1.84	30
7006	2	1998	2	0	98467.00	45352.00	2.17	30
7007	2	1998	2	1	154165.00	47104.00	3.27	30
7008	2	1998	2	2	252632.00	92456.00	2.73	30
7009	2	1999	1	0	101927.00	43797.00	2.33	30
7010	2	1999	1	1	177346.00	53437.00	3.32	30
7011	2	1999	1	2	279273.00	97234.00	2.87	30
7012	2	1999	2	0	134222.00	63207.00	2.12	30
7013	2	1999	2	1	188090.00	64225.00	2.93	30
7014	2	1999	2	2	322312.00	127432.00	2.53	30
7015	2	2000	1	0	63414.00	33706.00	1.88	30
7016	2	2000	1	1	139235.00	48046.00	2.90	30
7017	2	2000	1	2	202649.00	81752.00	2.48	30
7018	2	2000	2	0	163884.00	68665.00	2.39	30
7019	2	2000	2	1	232760.00	66957.00	3.48	30
7020	2	2000	2	2	396644.00	135622.00	2.92	30
7021	2	2001	1	0	84869.00	36970.00	2.30	30
7022	2	2001	1	1	142246.00	46086.00	3.09	30
7023	2	2001	1	2	227115.00	83056.00	2.73	30
7024	2	2001	2	0	186072.00	71939.00	2.59	30
7025	2	2001	2	1	222727.00	64201.00	3.47	30
7026	2	2001	2	2	408799.00	136140.00	3.00	30
7027	2	2002	1	0	92451.00	37758.00	2.45	30
7028	2	2002	1	1	160922.00	54651.00	2.94	30
7029	2	2002	1	2	253373.00	92409.00	2.74	30
7030	2	2002	2	0	231885.00	78486.00	2.95	30
7031	2	2002	2	1	250865.00	68823.00	3.65	30
7032	2	2002	2	2	482750.00	147309.00	3.28	30
7033	2	2003	1	0	61717.00	29402.00	2.10	30
7034	2	2003	1	1	146081.00	50438.00	2.90	30
7035	2	2003	1	2	207798.00	79840.00	2.60	30
7036	2	2003	2	0	218958.00	80954.00	2.70	30
7037	2	2003	2	1	302612.00	77588.00	3.90	30
7038	2	2003	2	2	521570.00	158542.00	3.29	30
7039	2	2004	1	0	79364.00	38532.00	2.06	30
7040	2	2004	1	1	182131.00	57048.00	3.19	30
7041	2	2004	1	2	261495.00	95580.00	2.74	30
7042	2	2004	2	0	268554.00	83380.00	3.22	30
7043	2	2004	2	1	298978.00	76008.00	3.93	30
7044	2	2004	2	2	567532.00	159388.00	3.56	30
7045	2	2005	1	0	66087.00	30611.00	2.16	30
7046	2	2005	1	1	172871.00	53695.00	3.22	30
7047	2	2005	1	2	238958.00	84306.00	2.83	30
7048	2	2005	2	0	193266.00	75399.00	2.56	30
7049	2	2005	2	1	238076.00	70381.00	3.38	30
7050	2	2005	2	2	431342.00	145780.00	2.96	30
7051	2	2006	1	0	85743.00	31658.00	2.71	30
7052	2	2006	1	1	202033.00	59668.00	3.39	30
7053	2	2006	1	2	287776.00	91326.00	3.15	30
7054	2	2006	2	0	238933.00	82914.00	2.88	30
7055	2	2006	2	1	327937.00	83022.00	3.95	30
7056	2	2006	2	2	566870.00	165936.00	3.42	30
7057	2	2007	1	0	77139.00	29596.00	2.61	30
7058	2	2007	1	1	145915.00	46091.00	3.17	30
7059	2	2007	1	2	223054.00	75687.00	2.95	30
7060	2	2007	2	0	283259.00	91322.00	3.10	30
7061	2	2007	2	1	317063.00	77106.00	4.11	30
7062	2	2007	2	2	600322.00	168428.00	3.56	30
7063	2	2008	1	0	111354.00	36551.00	3.05	30
7064	2	2008	1	1	235354.00	63022.00	3.73	30
7065	2	2008	1	2	346708.00	99573.00	3.48	30
7066	2	2008	2	0	283325.00	97450.00	2.91	30
7067	2	2008	2	1	312253.00	88600.00	3.52	30
7068	2	2008	2	2	595578.00	186050.00	3.20	30
7069	2	2009	1	0	128511.00	42426.00	3.03	30
7070	2	2009	1	1	209230.00	59126.00	3.54	30
7071	2	2009	1	2	337741.00	101552.00	3.33	30
7072	2	2009	2	0	267634.00	91609.00	2.92	30
7073	2	2009	2	1	338675.00	88749.00	3.82	30
7074	2	2009	2	2	606309.00	180358.00	3.36	30
7075	2	2010	1	0	58872.00	22152.00	2.66	30
7076	2	2010	1	1	114413.00	37004.00	3.09	30
7077	2	2010	1	2	173285.00	59156.00	2.93	30
7078	2	2010	2	0	226692.00	73976.00	3.06	30
7079	2	2010	2	1	259993.00	70304.00	3.70	30
7080	2	2010	2	2	486685.00	144280.00	3.37	30
7081	2	2011	1	0	162415.00	48926.00	3.32	30
7082	2	2011	1	1	213868.00	60000.00	3.56	30
7083	2	2011	1	2	376283.00	108926.00	3.45	30
7084	2	2011	2	0	312607.00	93199.00	3.35	30
7085	2	2011	2	1	270349.00	73752.00	3.67	30
7086	2	2011	2	2	582956.00	166951.00	3.49	30
7087	2	2012	1	0	143133.00	44791.00	3.20	30
7088	2	2012	1	1	177744.00	50601.00	3.51	30
7089	2	2012	1	2	320877.00	95392.00	3.36	30
7090	2	2012	2	0	399423.00	119729.00	3.34	30
7091	2	2012	2	1	275102.00	74414.00	3.70	30
7092	2	2012	2	2	674525.00	194143.00	3.47	30
7093	2	2013	1	0	78442.00	30580.00	2.57	30
7094	2	2013	1	1	148370.00	46339.00	3.20	30
7095	2	2013	1	2	226812.00	76919.00	2.95	30
7096	2	2013	2	0	356308.00	109456.00	3.26	30
7097	2	2013	2	1	239332.00	64416.00	3.72	30
7098	2	2013	2	2	595640.00	173872.00	3.43	30
7099	2	2014	1	0	152921.00	53897.00	2.84	30
7100	2	2014	1	1	165418.00	52290.00	3.16	30
7101	2	2014	1	2	318339.00	106187.00	3.00	30
7102	2	2014	2	0	300459.00	92800.00	3.24	30
7103	2	2014	2	1	227838.00	65282.00	3.49	30
7104	2	2014	2	2	528297.00	158082.00	3.34	30
7105	2	2015	1	0	145334.00	52490.00	2.77	30
7106	2	2015	1	1	161753.00	51363.00	3.15	30
7107	2	2015	1	2	307087.00	103853.00	2.96	30
7108	2	2015	2	0	314472.00	95777.00	3.28	30
7109	2	2015	2	1	255517.00	72324.00	3.53	30
7110	2	2015	2	2	569989.00	168101.00	3.39	30
7111	2	2016	1	0	97210.00	41939.00	2.32	30
7112	2	2016	1	1	122989.00	40842.00	3.01	30
7113	2	2016	1	2	220199.00	82781.00	2.66	30
7114	2	2016	2	0	316048.00	95319.00	3.32	30
7115	2	2016	2	1	213452.00	58730.00	3.63	30
7116	2	2016	2	2	529500.00	154049.00	3.44	30
7117	2	2017	1	0	176361.72	59849.00	2.95	30
7118	2	2017	1	1	169089.00	49583.00	3.41	30
7119	2	2017	1	2	345450.72	109432.00	3.16	30
7120	2	2017	2	0	363899.00	112438.00	3.24	30
7121	2	2017	2	1	227919.00	64680.00	3.52	30
7122	2	2017	2	2	591818.00	177118.00	3.34	30
7123	2	2018	1	0	179613.00	64180.00	2.80	30
7124	2	2018	1	1	156210.00	47622.00	3.28	30
7125	2	2018	1	2	335823.00	111802.00	3.00	30
7126	2	2018	2	0	373744.95	115121.00	3.25	30
7127	2	2018	2	1	229764.00	65188.00	3.52	30
7128	2	2018	2	2	603508.95	180309.00	3.35	30
7129	2	2019	1	0	158211.53	59636.00	2.65	30
7130	2	2019	1	1	140165.00	44441.00	3.15	30
7131	2	2019	1	2	298376.53	104077.00	2.87	30
7132	2	2019	2	0	333764.35	103211.00	3.23	30
7133	2	2019	2	1	205696.00	60555.00	3.40	30
7134	2	2019	2	2	539460.35	163766.00	3.29	30
7135	2	2020	1	0	193528.39	60394.00	3.20	30
7136	2	2020	1	1	158887.99	46893.00	3.39	30
7137	2	2020	1	2	352416.38	107287.00	3.28	30
7138	2	2020	2	0	384529.49	112318.00	3.42	30
7139	2	2020	2	1	256844.00	70893.00	3.62	30
7140	2	2020	2	2	641373.49	183211.00	3.50	30
7141	2	1987	1	0	16425.00	9190.00	1.79	31
7142	2	1987	1	1	302230.00	83410.00	3.62	31
7143	2	1987	1	2	318655.00	92600.00	3.44	31
7144	2	1987	2	0	6873.00	3170.00	2.17	31
7145	2	1987	2	1	294750.00	80050.00	3.68	31
7146	2	1987	2	2	301623.00	83220.00	3.62	31
7147	2	1988	1	0	10905.00	6530.00	1.67	31
7148	2	1988	1	1	313510.00	84400.00	3.71	31
7149	2	1988	1	2	324415.00	90930.00	3.57	31
7150	2	1988	2	0	11898.00	5720.00	2.08	31
7151	2	1988	2	1	319010.00	82100.00	3.89	31
7152	2	1988	2	2	330908.00	87820.00	3.77	31
7153	2	1989	1	0	17037.00	10250.00	1.66	31
7154	2	1989	1	1	297610.00	80830.00	3.68	31
7155	2	1989	1	2	314647.00	91080.00	3.45	31
7156	2	1989	2	0	28474.00	12940.00	2.20	31
7157	2	1989	2	1	335616.00	93160.00	3.60	31
7158	2	1989	2	2	364090.00	106100.00	3.43	31
7159	2	1990	1	0	11896.00	8990.00	1.32	31
7160	2	1990	1	1	321172.00	80090.00	4.01	31
7161	2	1990	1	2	333068.00	89080.00	3.74	31
7162	2	1990	2	0	23135.00	12950.00	1.79	31
7163	2	1990	2	1	425482.00	102250.00	4.16	31
7164	2	1990	2	2	448617.00	115200.00	3.89	31
7165	2	1991	1	0	15257.00	8010.00	1.90	31
7166	2	1991	1	1	356945.00	87060.00	4.10	31
7167	2	1991	1	2	372202.00	95070.00	3.92	31
7168	2	1991	2	0	15774.00	7590.00	2.08	31
7169	2	1991	2	1	306838.00	90750.00	3.38	31
7170	2	1991	2	2	322612.00	98340.00	3.28	31
7171	2	1992	1	0	10911.00	8410.00	1.30	31
7172	2	1992	1	1	392121.00	89670.00	4.37	31
7173	2	1992	1	2	403032.00	98080.00	4.11	31
7174	2	1992	2	0	13690.00	4890.00	2.80	31
7175	2	1992	2	1	343496.00	96010.00	3.58	31
7176	2	1992	2	2	357186.00	100900.00	3.54	31
7177	2	1993	1	0	8265.00	13610.00	0.61	31
7178	2	1993	1	1	328141.00	80500.00	4.08	31
7179	2	1993	1	2	336406.00	94110.00	3.57	31
7180	2	1993	2	0	7223.00	3950.00	1.83	31
7181	2	1993	2	1	239707.00	83030.00	2.89	31
7182	2	1993	2	2	246930.00	86980.00	2.84	31
7183	2	1994	1	0	19650.00	9090.00	2.16	31
7184	2	1994	1	1	344489.00	89050.00	3.87	31
7185	2	1994	1	2	364139.00	98140.00	3.71	31
7186	2	1994	2	0	20561.00	7980.00	2.58	31
7187	2	1994	2	1	317227.00	86290.00	3.68	31
7188	2	1994	2	2	337788.00	94270.00	3.58	31
7189	2	1995	1	0	10003.00	8649.00	1.16	31
7190	2	1995	1	1	361634.00	95835.00	3.77	31
7191	2	1995	1	2	371637.00	104484.00	3.56	31
7192	2	1995	2	0	17303.00	7464.00	2.32	31
7193	2	1995	2	1	410847.00	105114.00	3.91	31
7194	2	1995	2	2	428150.00	112578.00	3.80	31
7195	2	1996	1	0	29636.00	12672.00	2.34	31
7196	2	1996	1	1	416440.00	96752.00	4.30	31
7197	2	1996	1	2	446076.00	109424.00	4.08	31
7198	2	1996	2	0	21003.00	7843.00	2.68	31
7199	2	1996	2	1	403470.00	101961.00	3.96	31
7200	2	1996	2	2	424473.00	109804.00	3.87	31
7201	2	1997	1	0	28827.00	13200.00	2.18	31
7202	2	1997	1	1	436414.00	99067.00	4.41	31
7203	2	1997	1	2	465241.00	112267.00	4.14	31
7204	2	1997	2	0	9638.00	4510.00	2.14	31
7205	2	1997	2	1	432586.00	104759.00	4.13	31
7206	2	1997	2	2	442224.00	109269.00	4.05	31
7207	2	1998	1	0	1248.00	648.00	1.93	31
7208	2	1998	1	1	366736.00	95257.00	3.85	31
7209	2	1998	1	2	367984.00	95905.00	3.84	31
7210	2	1998	2	0	639.00	463.00	1.38	31
7211	2	1998	2	1	215017.00	77599.00	2.77	31
7212	2	1998	2	2	215656.00	78062.00	2.76	31
7213	2	1999	1	0	42129.00	17344.00	2.43	31
7214	2	1999	1	1	574454.00	126348.00	4.55	31
7215	2	1999	1	2	616583.00	143692.00	4.29	31
7216	2	1999	2	0	6672.00	3529.00	1.89	31
7217	2	1999	2	1	396035.00	105055.00	3.77	31
7218	2	1999	2	2	402707.00	108584.00	3.71	31
7219	2	2000	1	0	44984.00	19277.00	2.33	31
7220	2	2000	1	1	540025.00	125906.00	4.29	31
7221	2	2000	1	2	585009.00	145183.00	4.03	31
7222	2	2000	2	0	7976.00	3790.00	2.10	31
7223	2	2000	2	1	441312.00	111167.00	3.97	31
7224	2	2000	2	2	449288.00	114957.00	3.91	31
7225	2	2001	1	0	52592.00	20281.00	2.59	31
7226	2	2001	1	1	557760.00	129628.00	4.30	31
7227	2	2001	1	2	610352.00	149909.00	4.07	31
7228	2	2001	2	0	7961.00	3732.00	2.13	31
7229	2	2001	2	1	430145.00	111139.00	3.87	31
7230	2	2001	2	2	438106.00	114871.00	3.81	31
7231	2	2002	1	0	47078.00	18638.00	2.53	31
7232	2	2002	1	1	617166.00	143708.00	4.29	31
7233	2	2002	1	2	664244.00	162346.00	4.09	31
7234	2	2002	2	0	2951.00	1344.00	2.20	31
7235	2	2002	2	1	287390.00	70550.00	4.07	31
7236	2	2002	2	2	290341.00	71894.00	4.04	31
7237	2	2003	1	0	16969.00	7221.00	2.35	31
7238	2	2003	1	1	537524.00	130462.00	4.12	31
7239	2	2003	1	2	554493.00	137683.00	4.03	31
7240	2	2003	2	0	4517.00	1847.00	2.45	31
7241	2	2003	2	1	379395.00	87732.00	4.32	31
7242	2	2003	2	2	383912.00	89579.00	4.29	31
7243	2	2004	1	0	25265.00	8999.00	2.81	31
7244	2	2004	1	1	545373.00	125696.00	4.34	31
7245	2	2004	1	2	570638.00	134695.00	4.24	31
7246	2	2004	2	0	6383.00	2395.00	2.67	31
7247	2	2004	2	1	484958.00	114275.00	4.24	31
7248	2	2004	2	2	491341.00	116670.00	4.21	31
7249	2	2005	1	0	9673.00	6512.00	1.49	31
7250	2	2005	1	1	543442.00	122681.00	4.43	31
7251	2	2005	1	2	553115.00	129193.00	4.28	31
7252	2	2005	2	0	3953.00	1643.00	2.41	31
7253	2	2005	2	1	532313.00	127926.00	4.16	31
7254	2	2005	2	2	536266.00	129569.00	4.14	31
7255	2	2006	1	0	16958.00	6807.00	2.49	31
7256	2	2006	1	1	551130.00	123077.00	4.48	31
7257	2	2006	1	2	568088.00	129884.00	4.37	31
7258	2	2006	2	0	18172.00	7644.00	2.38	31
7259	2	2006	2	1	401500.00	107779.00	3.73	31
7260	2	2006	2	2	419672.00	115423.00	3.64	31
7261	2	2007	1	0	22487.00	7908.00	2.84	31
7262	2	2007	1	1	547122.00	123178.00	4.44	31
7263	2	2007	1	2	569609.00	131086.00	4.35	31
7264	2	2007	2	0	18594.00	7284.00	2.55	31
7265	2	2007	2	1	448714.00	106840.00	4.20	31
7266	2	2007	2	2	467308.00	114124.00	4.09	31
7267	2	2008	1	0	28035.00	9384.00	2.99	31
7268	2	2008	1	1	540886.00	123957.00	4.36	31
7269	2	2008	1	2	568921.00	133341.00	4.27	31
7270	2	2008	2	0	25374.00	9390.00	2.70	31
7271	2	2008	2	1	469580.00	117487.00	4.00	31
7272	2	2008	2	2	494954.00	126877.00	3.90	31
7273	2	2009	1	0	37195.00	12213.00	3.05	31
7274	2	2009	1	1	555066.00	124024.00	4.48	31
7275	2	2009	1	2	592261.00	136237.00	4.35	31
7276	2	2009	2	0	32615.00	12584.00	2.59	31
7277	2	2009	2	1	459935.00	117608.00	3.91	31
7278	2	2009	2	2	492550.00	130192.00	3.78	31
7279	2	2010	1	0	14554.00	8205.00	1.77	31
7280	2	2010	1	1	408222.00	111463.00	3.66	31
7281	2	2010	1	2	422776.00	119668.00	3.53	31
7282	2	2010	2	0	19743.00	10421.00	1.89	31
7283	2	2010	2	1	423320.00	120975.00	3.50	31
7284	2	2010	2	2	443063.00	131396.00	3.37	31
7285	2	2011	1	0	39767.00	13721.00	2.90	31
7286	2	2011	1	1	559137.00	124913.00	4.48	31
7287	2	2011	1	2	598904.00	138634.00	4.32	31
7288	2	2011	2	0	26346.00	10891.00	2.42	31
7289	2	2011	2	1	443025.00	123507.00	3.59	31
7290	2	2011	2	2	469371.00	134398.00	3.49	31
7291	2	2012	1	0	39497.00	13455.00	2.94	31
7292	2	2012	1	1	574953.00	127929.00	4.49	31
7293	2	2012	1	2	614450.00	141384.00	4.35	31
7294	2	2012	2	0	41767.00	14416.00	2.90	31
7295	2	2012	2	1	560318.00	127349.00	4.40	31
7296	2	2012	2	2	602085.00	141765.00	4.25	31
7297	2	2013	1	0	31632.00	12856.00	2.46	31
7298	2	2013	1	1	568668.00	128541.00	4.42	31
7299	2	2013	1	2	600300.00	141397.00	4.25	31
7300	2	2013	2	0	44751.00	14982.00	2.99	31
7301	2	2013	2	1	604822.00	130239.00	4.64	31
7302	2	2013	2	2	649573.00	145221.00	4.47	31
7303	2	2014	1	0	34362.00	14087.00	2.44	31
7304	2	2014	1	1	605235.00	130882.00	4.62	31
7305	2	2014	1	2	639597.00	144969.00	4.41	31
7306	2	2014	2	0	27523.00	9866.00	2.79	31
7307	2	2014	2	1	610503.00	131484.00	4.64	31
7308	2	2014	2	2	638026.00	141350.00	4.51	31
7309	2	2015	1	0	36431.00	14478.00	2.52	31
7310	2	2015	1	1	631884.00	132980.00	4.75	31
7311	2	2015	1	2	668315.00	147458.00	4.53	31
7312	2	2015	2	0	19357.00	7890.00	2.45	31
7313	2	2015	2	1	568718.00	127555.00	4.46	31
7314	2	2015	2	2	588075.00	135445.00	4.34	31
7315	2	2016	1	0	31419.00	11471.00	2.74	31
7316	2	2016	1	1	637177.00	133772.00	4.76	31
7317	2	2016	1	2	668596.00	145243.00	4.60	31
7318	2	2016	2	0	16253.00	7086.00	2.29	31
7319	2	2016	2	1	527876.00	125672.00	4.20	31
7320	2	2016	2	2	544129.00	132758.00	4.10	31
7321	2	2017	1	0	36369.00	12069.00	3.01	31
7322	2	2017	1	1	655499.00	133361.00	4.92	31
7323	2	2017	1	2	691868.00	145430.00	4.76	31
7324	2	2017	2	0	25906.00	8913.00	2.91	31
7325	2	2017	2	1	567911.00	124948.00	4.55	31
7326	2	2017	2	2	593817.00	133861.00	4.44	31
7327	2	2018	1	0	39613.04	13098.00	3.02	31
7328	2	2018	1	1	664187.00	133313.00	4.98	31
7329	2	2018	1	2	703800.04	146411.00	4.81	31
7330	2	2018	2	0	24482.96	9319.00	2.63	31
7331	2	2018	2	1	460301.00	125596.00	3.66	31
7332	2	2018	2	2	484783.96	134915.00	3.59	31
7333	2	2019	1	0	29838.58	10149.00	2.94	31
7334	2	2019	1	1	661508.68	133813.00	4.94	31
7335	2	2019	1	2	691347.26	143962.00	4.80	31
7336	2	2019	2	0	28527.25	9325.00	3.06	31
7337	2	2019	2	1	649175.00	133287.00	4.87	31
7338	2	2019	2	2	677702.25	142612.00	4.75	31
7339	2	2020	1	0	23865.26	8058.00	2.96	31
7340	2	2020	1	1	677897.00	135773.00	4.99	31
7341	2	2020	1	2	701762.26	143831.00	4.88	31
7342	2	2020	2	0	25889.38	8911.00	2.91	31
7343	2	2020	2	1	631904.00	134187.00	4.71	31
7344	2	2020	2	2	657793.38	143098.00	4.60	31
7345	2	1987	1	0	1510.00	670.00	2.25	32
7346	2	1987	1	1	33230.00	10630.00	3.13	32
7347	2	1987	1	2	34740.00	11300.00	3.07	32
7348	2	1987	2	0	3839.00	1620.00	2.37	32
7349	2	1987	2	1	49870.00	14890.00	3.35	32
7350	2	1987	2	2	53709.00	16510.00	3.25	32
7351	2	1988	1	0	4253.00	2250.00	1.89	32
7352	2	1988	1	1	50194.00	15080.00	3.33	32
7353	2	1988	1	2	54447.00	17330.00	3.14	32
7354	2	1988	2	0	5346.00	2460.00	2.17	32
7355	2	1988	2	1	42877.00	13300.00	3.22	32
7356	2	1988	2	2	48223.00	15760.00	3.06	32
7357	2	1989	1	0	2544.00	1470.00	1.73	32
7358	2	1989	1	1	35020.00	9930.00	3.53	32
7359	2	1989	1	2	37564.00	11400.00	3.30	32
7360	2	1989	2	0	3777.00	1420.00	2.66	32
7361	2	1989	2	1	42983.00	12490.00	3.44	32
7362	2	1989	2	2	46760.00	13910.00	3.36	32
7363	2	1990	1	0	2342.00	1080.00	2.17	32
7364	2	1990	1	1	27769.00	9100.00	3.05	32
7365	2	1990	1	2	30111.00	10180.00	2.96	32
7366	2	1990	2	0	1807.00	930.00	1.94	32
7367	2	1990	2	1	60605.00	15600.00	3.88	32
7368	2	1990	2	2	62412.00	16530.00	3.78	32
7369	2	1991	1	0	700.00	370.00	1.89	32
7370	2	1991	1	1	29789.00	9300.00	3.20	32
7371	2	1991	1	2	30489.00	9670.00	3.15	32
7372	2	1991	2	0	1046.00	910.00	1.15	32
7373	2	1991	2	1	52670.00	14440.00	3.65	32
7374	2	1991	2	2	53716.00	15350.00	3.50	32
7375	2	1992	1	0	\N	\N	\N	32
7376	2	1992	1	1	28873.00	8650.00	3.34	32
7377	2	1992	1	2	28873.00	8650.00	3.34	32
7378	2	1992	2	0	1115.00	970.00	1.15	32
7379	2	1992	2	1	51920.00	15250.00	3.40	32
7380	2	1992	2	2	53035.00	16220.00	3.27	32
7381	2	1993	1	0	220.00	80.00	2.75	32
7382	2	1993	1	1	28722.00	9080.00	3.16	32
7383	2	1993	1	2	28942.00	9160.00	3.16	32
7384	2	1993	2	0	654.00	550.00	1.19	32
7385	2	1993	2	1	55077.00	15310.00	3.60	32
7386	2	1993	2	2	55731.00	15860.00	3.51	32
7387	2	1994	1	0	1215.00	400.00	3.04	32
7388	2	1994	1	1	44595.00	11601.00	3.84	32
7389	2	1994	1	2	45810.00	12001.00	3.82	32
7390	2	1994	2	0	185.00	142.00	1.30	32
7391	2	1994	2	1	36046.00	8419.00	4.28	32
7392	2	1994	2	2	36231.00	8561.00	4.23	32
7393	2	1995	1	0	714.00	264.00	2.70	32
7394	2	1995	1	1	36058.00	11656.00	3.09	32
7395	2	1995	1	2	36772.00	11920.00	3.08	32
7396	2	1995	2	0	348.00	159.00	2.19	32
7397	2	1995	2	1	38996.00	9455.00	4.12	32
7398	2	1995	2	2	39344.00	9614.00	4.09	32
7399	2	1996	1	0	456.00	176.00	2.59	32
7400	2	1996	1	1	44657.00	11615.00	3.84	32
7401	2	1996	1	2	45113.00	11791.00	3.83	32
7402	2	1996	2	0	270.00	87.00	3.10	32
7403	2	1996	2	1	35591.00	9445.00	3.77	32
7404	2	1996	2	2	35861.00	9532.00	3.76	32
7405	2	1997	1	0	697.00	216.00	3.23	32
7406	2	1997	1	1	47170.00	12060.00	3.91	32
7407	2	1997	1	2	47867.00	12276.00	3.90	32
7408	2	1997	2	0	267.00	84.00	3.18	32
7409	2	1997	2	1	37852.00	9556.00	3.96	32
7410	2	1997	2	2	38119.00	9640.00	3.95	32
7411	2	1998	1	0	63.00	28.00	2.25	32
7412	2	1998	1	1	31783.00	9620.00	3.30	32
7413	2	1998	1	2	31846.00	9648.00	3.30	32
7414	2	1998	2	0	163.00	56.00	2.91	32
7415	2	1998	2	1	29812.00	8314.00	3.59	32
7416	2	1998	2	2	29975.00	8370.00	3.58	32
7417	2	1999	1	0	71.00	28.00	2.54	32
7418	2	1999	1	1	45090.00	11178.00	4.03	32
7419	2	1999	1	2	45161.00	11206.00	4.03	32
7420	2	1999	2	0	119.00	41.00	2.90	32
7421	2	1999	2	1	34128.00	10636.00	3.21	32
7422	2	1999	2	2	34247.00	10677.00	3.21	32
7423	2	2000	1	0	1492.00	540.00	2.76	32
7424	2	2000	1	1	48484.00	11540.00	4.20	32
7425	2	2000	1	2	49976.00	12080.00	4.14	32
7426	2	2000	2	0	1364.00	443.00	3.08	32
7427	2	2000	2	1	33851.00	9544.00	3.55	32
7428	2	2000	2	2	35215.00	9987.00	3.53	32
7429	2	2001	1	0	1258.00	450.00	2.80	32
7430	2	2001	1	1	73024.00	17221.00	4.24	32
7431	2	2001	1	2	74282.00	17671.00	4.20	32
7432	2	2001	2	0	1460.00	476.00	3.07	32
7433	2	2001	2	1	57455.00	14466.00	3.97	32
7434	2	2001	2	2	58915.00	14942.00	3.94	32
7435	2	2002	1	0	866.00	275.00	3.15	32
7436	2	2002	1	1	62492.00	16057.00	3.89	32
7437	2	2002	1	2	63358.00	16332.00	3.88	32
7438	2	2002	2	0	1042.00	282.00	3.70	32
7439	2	2002	2	1	59541.00	13894.00	4.29	32
7440	2	2002	2	2	60583.00	14176.00	4.27	32
7441	2	2003	1	0	1326.00	497.00	2.67	32
7442	2	2003	1	1	57375.00	14967.00	3.83	32
7443	2	2003	1	2	58701.00	15464.00	3.80	32
7444	2	2003	2	0	2326.00	677.00	3.44	32
7445	2	2003	2	1	56245.00	14145.00	3.98	32
7446	2	2003	2	2	58571.00	14822.00	3.95	32
7447	2	2004	1	0	1637.00	507.00	3.23	32
7448	2	2004	1	1	69320.00	15315.00	4.53	32
7449	2	2004	1	2	70957.00	15822.00	4.48	32
7450	2	2004	2	0	2423.00	775.00	3.13	32
7451	2	2004	2	1	65344.00	15145.00	4.31	32
7452	2	2004	2	2	67767.00	15920.00	4.26	32
7453	2	2005	1	0	1638.00	507.00	3.23	32
7454	2	2005	1	1	63840.00	15000.00	4.26	32
7455	2	2005	1	2	65478.00	15507.00	4.22	32
7456	2	2005	2	0	2484.00	790.00	3.14	32
7457	2	2005	2	1	64341.00	14110.00	4.56	32
7458	2	2005	2	2	66825.00	14900.00	4.48	32
7459	2	2006	1	0	1938.00	600.00	3.23	32
7460	2	2006	1	1	82075.00	16876.00	4.86	32
7461	2	2006	1	2	84013.00	17476.00	4.81	32
7462	2	2006	2	0	2396.00	775.00	3.09	32
7463	2	2006	2	1	70538.00	15208.00	4.64	32
7464	2	2006	2	2	72934.00	15983.00	4.56	32
7465	2	2007	1	0	1980.00	600.00	3.30	32
7466	2	2007	1	1	85253.00	16880.00	5.05	32
7467	2	2007	1	2	87233.00	17480.00	4.99	32
7468	2	2007	2	0	3246.00	1005.00	3.23	32
7469	2	2007	2	1	68636.00	15258.00	4.50	32
7470	2	2007	2	2	71882.00	16263.00	4.42	32
7471	2	2008	1	0	2031.00	621.00	3.27	32
7472	2	2008	1	1	92466.00	18491.00	5.00	32
7473	2	2008	1	2	94497.00	19112.00	4.94	32
7474	2	2008	2	0	4662.00	1605.00	2.90	32
7475	2	2008	2	1	68958.00	15621.00	4.41	32
7476	2	2008	2	2	73620.00	17226.00	4.27	32
7477	2	2009	1	0	1985.00	607.00	3.27	32
7478	2	2009	1	1	87357.00	17781.00	4.91	32
7479	2	2009	1	2	89342.00	18388.00	4.86	32
7480	2	2009	2	0	4452.00	1514.00	2.94	32
7481	2	2009	2	1	62393.00	15901.00	3.92	32
7482	2	2009	2	2	66845.00	17415.00	3.84	32
7483	2	2010	1	0	1325.00	525.00	2.52	32
7484	2	2010	1	1	67451.00	16823.00	4.01	32
7485	2	2010	1	2	68776.00	17348.00	3.96	32
7486	2	2010	2	0	3330.00	1514.00	2.20	32
7487	2	2010	2	1	62160.00	15901.00	3.91	32
7488	2	2010	2	2	65490.00	17415.00	3.76	32
7489	2	2011	1	0	1635.00	525.00	3.11	32
7490	2	2011	1	1	86544.00	18382.00	4.71	32
7491	2	2011	1	2	88179.00	18907.00	4.66	32
7492	2	2011	2	0	3240.00	1514.00	2.14	32
7493	2	2011	2	1	64476.00	15649.00	4.12	32
7494	2	2011	2	2	67716.00	17163.00	3.95	32
7495	2	2012	1	0	1575.00	525.00	3.00	32
7496	2	2012	1	1	88958.00	18382.00	4.84	32
7497	2	2012	1	2	90533.00	18907.00	4.79	32
7498	2	2012	2	0	3318.00	1494.00	2.22	32
7499	2	2012	2	1	75003.00	16357.00	4.59	32
7500	2	2012	2	2	78321.00	17851.00	4.39	32
7501	2	2013	1	0	1575.00	525.00	3.00	32
7502	2	2013	1	1	90437.00	18657.00	4.85	32
7503	2	2013	1	2	92012.00	19182.00	4.80	32
7504	2	2013	2	0	3821.00	1496.00	2.55	32
7505	2	2013	2	1	78179.00	16366.00	4.78	32
7506	2	2013	2	2	82000.00	17862.00	4.59	32
7507	2	2014	1	0	1706.00	525.00	3.25	32
7508	2	2014	1	1	93981.00	18657.00	5.04	32
7509	2	2014	1	2	95687.00	19182.00	4.99	32
7510	2	2014	2	0	3610.00	1418.00	2.55	32
7511	2	2014	2	1	77232.00	16441.00	4.70	32
7512	2	2014	2	2	80842.00	17859.00	4.53	32
7513	2	2015	1	0	1861.00	578.00	3.22	32
7514	2	2015	1	1	92533.00	18644.00	4.96	32
7515	2	2015	1	2	94394.00	19222.00	4.91	32
7516	2	2015	2	0	2770.00	1361.00	2.04	32
7517	2	2015	2	1	43930.00	10841.00	4.05	32
7518	2	2015	2	2	46700.00	12202.00	3.83	32
7519	2	2016	1	0	1249.00	543.00	2.30	32
7520	2	2016	1	1	89389.00	18208.00	4.91	32
7521	2	2016	1	2	90638.00	18751.00	4.83	32
7522	2	2016	2	0	2970.00	1272.00	2.33	32
7523	2	2016	2	1	44176.00	13036.00	3.39	32
7524	2	2016	2	2	47146.00	14308.00	3.30	32
7525	2	2017	1	0	740.00	200.00	3.70	32
7526	2	2017	1	1	103350.00	19385.00	5.33	32
7527	2	2017	1	2	104090.00	19585.00	5.31	32
7528	2	2017	2	0	4703.00	1702.00	2.76	32
7529	2	2017	2	1	64499.00	14626.00	4.41	32
7530	2	2017	2	2	69202.00	16328.00	4.24	32
7531	2	2018	1	0	0.00	0.00	\N	32
7532	2	2018	1	1	99317.00	19485.00	5.10	32
7533	2	2018	1	2	99317.00	19485.00	5.10	32
7534	2	2018	2	0	3135.60	1547.00	2.03	32
7535	2	2018	2	1	53816.00	14030.00	3.84	32
7536	2	2018	2	2	56951.60	15577.00	3.66	32
7537	2	2019	1	0	0.00	0.00	\N	32
7538	2	2019	1	1	95368.81	19451.00	4.90	32
7539	2	2019	1	2	95368.81	19451.00	4.90	32
7540	2	2019	2	0	5185.00	1923.00	2.70	32
7541	2	2019	2	1	57731.00	13205.00	4.37	32
7542	2	2019	2	2	62916.00	15128.00	4.16	32
7543	2	2020	1	0	0.00	0.00	\N	32
7544	2	2020	1	1	43193.49	8944.00	4.83	32
7545	2	2020	1	2	43193.49	8944.00	4.83	32
7546	2	2020	2	0	4660.44	1915.00	2.43	32
7547	2	2020	2	1	61030.88	14626.00	4.17	32
7548	2	2020	2	2	65691.32	16541.00	3.97	32
7549	3	1987	1	0	295.00	310.00	0.95	32
7550	3	1987	1	1	3605.00	1320.00	2.73	32
7551	3	1987	1	2	3900.00	1630.00	2.39	32
7552	3	1987	2	0	3317.00	2330.00	1.42	32
7553	3	1987	2	1	5073.00	1700.00	2.98	32
7554	3	1987	2	2	8390.00	4030.00	2.08	32
7555	3	1988	1	0	724.00	530.00	1.37	32
7556	3	1988	1	1	5425.00	1790.00	3.03	32
7557	3	1988	1	2	6149.00	2320.00	2.65	32
7558	3	1988	2	0	4736.00	2700.00	1.75	32
7559	3	1988	2	1	8585.00	2670.00	3.22	32
7560	3	1988	2	2	13321.00	5370.00	2.48	32
7561	3	1989	1	0	1786.00	960.00	1.86	32
7562	3	1989	1	1	11212.00	3560.00	3.15	32
7563	3	1989	1	2	12998.00	4520.00	2.88	32
7564	3	1989	2	0	6073.00	3610.00	1.68	32
7565	3	1989	2	1	6672.00	2420.00	2.76	32
7566	3	1989	2	2	12745.00	6030.00	2.11	32
7567	3	1990	1	0	363.00	340.00	1.07	32
7568	3	1990	1	1	8026.00	2790.00	2.88	32
7569	3	1990	1	2	8389.00	3130.00	2.68	32
7570	3	1990	2	0	8604.00	3350.00	2.57	32
7571	3	1990	2	1	12025.00	3320.00	3.62	32
7572	3	1990	2	2	20629.00	6670.00	3.09	32
7573	3	1991	1	0	980.00	620.00	1.58	32
7574	3	1991	1	1	12321.00	3590.00	3.43	32
7575	3	1991	1	2	13301.00	4210.00	3.16	32
7576	3	1991	2	0	8520.00	4810.00	1.77	32
7577	3	1991	2	1	11536.00	3560.00	3.24	32
7578	3	1991	2	2	20056.00	8370.00	2.40	32
7579	3	1992	1	0	207.00	130.00	1.59	32
7580	3	1992	1	1	9588.00	3680.00	2.61	32
7581	3	1992	1	2	9795.00	3810.00	2.57	32
7582	3	1992	2	0	5341.00	2710.00	1.97	32
7583	3	1992	2	1	8241.00	2400.00	3.43	32
7584	3	1992	2	2	13582.00	5110.00	2.66	32
7585	3	1993	1	0	97.00	60.00	1.62	32
7586	3	1993	1	1	9821.00	2890.00	3.40	32
7587	3	1993	1	2	9918.00	2950.00	3.36	32
7588	3	1993	2	0	4844.00	2950.00	1.64	32
7589	3	1993	2	1	10192.00	3150.00	3.24	32
7590	3	1993	2	2	15036.00	6100.00	2.46	32
7591	3	1994	1	0	630.00	300.00	2.10	32
7592	3	1994	1	1	9084.00	2640.00	3.44	32
7593	3	1994	1	2	9714.00	2940.00	3.30	32
7594	3	1994	2	0	8365.00	3730.00	2.24	32
7595	3	1994	2	1	8856.00	2780.00	3.19	32
7596	3	1994	2	2	17221.00	6510.00	2.65	32
7597	3	1995	1	0	672.00	320.00	2.10	32
7598	3	1995	1	1	8694.00	2740.00	3.17	32
7599	3	1995	1	2	9366.00	3060.00	3.06	32
7600	3	1995	2	0	9441.00	3066.00	3.08	32
7601	3	1995	2	1	10019.00	2760.00	3.63	32
7602	3	1995	2	2	19460.00	5826.00	3.34	32
7603	3	1996	1	0	1541.00	450.00	3.42	32
7604	3	1996	1	1	11014.00	2810.00	3.92	32
7605	3	1996	1	2	12555.00	3260.00	3.85	32
7606	3	1996	2	0	11448.00	4147.00	2.76	32
7607	3	1996	2	1	9114.00	2457.00	3.71	32
7608	3	1996	2	2	20562.00	6604.00	3.11	32
7609	3	1997	1	0	1130.00	421.00	2.68	32
7610	3	1997	1	1	6427.00	1825.00	3.52	32
7611	3	1997	1	2	7557.00	2246.00	3.36	32
7612	3	1997	2	0	7308.00	3071.00	2.38	32
7613	3	1997	2	1	10604.00	2869.00	3.70	32
7614	3	1997	2	2	17912.00	5940.00	3.02	32
7615	3	1998	1	0	136.00	65.00	2.09	32
7616	3	1998	1	1	4576.00	1685.00	2.72	32
7617	3	1998	1	2	4712.00	1750.00	2.69	32
7618	3	1998	2	0	4839.00	1820.00	2.66	32
7619	3	1998	2	1	7677.00	2063.00	3.72	32
7620	3	1998	2	2	12516.00	3883.00	3.22	32
7621	3	1999	1	0	1153.00	365.00	3.16	32
7622	3	1999	1	1	9656.00	2537.00	3.81	32
7623	3	1999	1	2	10809.00	2902.00	3.72	32
7624	3	1999	2	0	6160.00	2020.00	3.05	32
7625	3	1999	2	1	10216.00	2454.00	4.16	32
7626	3	1999	2	2	16376.00	4474.00	3.66	32
7627	3	2000	1	0	1854.00	618.00	3.00	32
7628	3	2000	1	1	11687.00	2840.00	4.12	32
7629	3	2000	1	2	13541.00	3458.00	3.92	32
7630	3	2000	2	0	5297.00	1825.00	2.90	32
7631	3	2000	2	1	9795.00	2449.00	4.00	32
7632	3	2000	2	2	15092.00	4274.00	3.53	32
7633	3	2001	1	0	1801.00	537.00	3.35	32
7634	3	2001	1	1	9358.00	2170.00	4.31	32
7635	3	2001	1	2	11159.00	2707.00	4.12	32
7636	3	2001	2	0	5328.00	1740.00	3.06	32
7637	3	2001	2	1	11474.00	2880.00	3.98	32
7638	3	2001	2	2	16802.00	4620.00	3.64	32
7639	3	2002	1	0	1004.00	366.00	2.74	32
7640	3	2002	1	1	9118.00	2360.00	3.86	32
7641	3	2002	1	2	10122.00	2726.00	3.71	32
7642	3	2002	2	0	3861.00	1131.00	3.41	32
7643	3	2002	2	1	9534.00	2316.00	4.12	32
7644	3	2002	2	2	13395.00	3447.00	3.89	32
7645	3	2003	1	0	421.00	164.00	2.57	32
7646	3	2003	1	1	6201.00	1628.00	3.81	32
7647	3	2003	1	2	6622.00	1792.00	3.70	32
7648	3	2003	2	0	4159.00	1313.00	3.17	32
7649	3	2003	2	1	9980.00	2290.00	4.36	32
7650	3	2003	2	2	14139.00	3603.00	3.92	32
7651	3	2004	1	0	706.00	216.00	3.27	32
7652	3	2004	1	1	7969.00	1900.00	4.19	32
7653	3	2004	1	2	8675.00	2116.00	4.10	32
7654	3	2004	2	0	3607.00	1170.00	3.08	32
7655	3	2004	2	1	9249.00	2115.00	4.37	32
7656	3	2004	2	2	12856.00	3285.00	3.91	32
7657	3	2005	1	0	985.00	337.00	2.92	32
7658	3	2005	1	1	7573.00	1665.00	4.55	32
7659	3	2005	1	2	8558.00	2002.00	4.27	32
7660	3	2005	2	0	3240.00	1012.00	3.20	32
7661	3	2005	2	1	12246.00	2730.00	4.49	32
7662	3	2005	2	2	15486.00	3742.00	4.14	32
7663	3	2006	1	0	1741.00	528.00	3.30	32
7664	3	2006	1	1	8951.00	1915.00	4.67	32
7665	3	2006	1	2	10692.00	2443.00	4.38	32
7666	3	2006	2	0	2813.00	878.00	3.20	32
7667	3	2006	2	1	10450.00	2360.00	4.43	32
7668	3	2006	2	2	13263.00	3238.00	4.10	32
7669	3	2007	1	0	1502.00	470.00	3.20	32
7670	3	2007	1	1	9787.00	2225.00	4.40	32
7671	3	2007	1	2	11289.00	2695.00	4.19	32
7672	3	2007	2	0	4035.00	1200.00	3.36	32
7673	3	2007	2	1	10580.00	2477.00	4.27	32
7674	3	2007	2	2	14615.00	3677.00	3.97	32
7675	3	2008	1	0	1190.00	395.00	3.01	32
7676	3	2008	1	1	9228.00	2161.00	4.27	32
7677	3	2008	1	2	10418.00	2556.00	4.08	32
7678	3	2008	2	0	4161.00	1290.00	3.23	32
7679	3	2008	2	1	10430.00	2469.00	4.22	32
7680	3	2008	2	2	14591.00	3759.00	3.88	32
7681	3	2009	1	0	1629.00	486.00	3.35	32
7682	3	2009	1	1	9961.00	2188.00	4.55	32
7683	3	2009	1	2	11590.00	2674.00	4.33	32
7684	3	2009	2	0	4178.00	1333.00	3.13	32
7685	3	2009	2	1	11009.00	2600.00	4.23	32
7686	3	2009	2	2	15187.00	3933.00	3.86	32
7687	3	2010	1	0	1435.00	492.00	2.92	32
7688	3	2010	1	1	7127.00	1730.00	4.12	32
7689	3	2010	1	2	8562.00	2222.00	3.85	32
7690	3	2010	2	0	4280.00	1520.00	2.82	32
7691	3	2010	2	1	10929.00	2535.00	4.31	32
7692	3	2010	2	2	15209.00	4055.00	3.75	32
7693	3	2011	1	0	1854.00	582.00	3.19	32
7694	3	2011	1	1	9125.00	2218.00	4.11	32
7695	3	2011	1	2	10979.00	2800.00	3.92	32
7696	3	2011	2	0	5784.00	1918.00	3.02	32
7697	3	2011	2	1	10518.00	2437.00	4.32	32
7698	3	2011	2	2	16302.00	4355.00	3.74	32
7699	3	2012	1	0	2057.00	650.00	3.16	32
7700	3	2012	1	1	9791.00	2493.00	3.93	32
7701	3	2012	1	2	11848.00	3143.00	3.77	32
7702	3	2012	2	0	5985.00	1936.00	3.09	32
7703	3	2012	2	1	10783.00	2530.00	4.26	32
7704	3	2012	2	2	16768.00	4466.00	3.75	32
7705	3	2013	1	0	1958.00	618.00	3.17	32
7706	3	2013	1	1	10420.00	2471.00	4.22	32
7707	3	2013	1	2	12378.00	3089.00	4.01	32
7708	3	2013	2	0	5861.00	1932.00	3.03	32
7709	3	2013	2	1	9313.00	2310.00	4.03	32
7710	3	2013	2	2	15174.00	4242.00	3.58	32
7711	3	2014	1	0	1784.00	531.00	3.36	32
7712	3	2014	1	1	8550.00	2142.00	3.99	32
7713	3	2014	1	2	10334.00	2673.00	3.87	32
7714	3	2014	2	0	5857.00	1918.00	3.05	32
7715	3	2014	2	1	11264.00	2620.00	4.30	32
7716	3	2014	2	2	17121.00	4538.00	3.77	32
7717	3	2015	1	0	1014.00	338.00	3.00	32
7718	3	2015	1	1	7766.00	2057.00	3.78	32
7719	3	2015	1	2	8780.00	2395.00	3.67	32
7720	3	2015	2	0	5603.00	2033.00	2.76	32
7721	3	2015	2	1	14120.00	3117.00	4.53	32
7722	3	2015	2	2	19723.00	5150.00	3.83	32
7723	3	2016	1	0	876.00	300.00	2.92	32
7724	3	2016	1	1	6289.00	1920.00	3.28	32
7725	3	2016	1	2	7165.00	2220.00	3.23	32
7726	3	2016	2	0	6294.00	2121.00	2.97	32
7727	3	2016	2	1	14557.00	3174.00	4.59	32
7728	3	2016	2	2	20851.00	5295.00	3.94	32
7729	3	2017	1	0	1391.00	426.00	3.27	32
7730	3	2017	1	1	8260.00	2221.00	3.72	32
7731	3	2017	1	2	9651.00	2647.00	3.65	32
7732	3	2017	2	0	6059.00	2054.00	2.95	32
7733	3	2017	2	1	11132.00	2723.00	4.09	32
7734	3	2017	2	2	17191.00	4777.00	3.60	32
7735	3	2018	1	0	1194.00	356.00	3.35	32
7736	3	2018	1	1	10123.00	2587.00	3.91	32
7737	3	2018	1	2	11317.00	2943.00	3.85	32
7738	3	2018	2	0	6040.70	2171.00	2.78	32
7739	3	2018	2	1	12152.58	2804.00	4.33	32
7740	3	2018	2	2	18193.28	4975.00	3.66	32
7741	3	2019	1	0	942.18	312.00	3.02	32
7742	3	2019	1	1	9854.07	2574.50	3.83	32
7743	3	2019	1	2	10796.25	2886.50	3.74	32
7744	3	2019	2	0	4451.62	1590.40	2.80	32
7745	3	2019	2	1	10381.40	2162.24	4.80	32
7746	3	2019	2	2	14833.02	3752.64	3.95	32
7747	3	2020	1	0	687.36	204.00	3.37	32
7748	3	2020	1	1	11550.92	12352.95	0.94	32
7749	3	2020	1	2	12238.28	2750.50	4.45	32
7750	3	2020	2	0	4996.08	1558.49	3.21	32
7751	3	2020	2	1	10783.82	2240.00	4.81	32
7752	3	2020	2	2	15779.90	3798.49	4.15	32
7753	2	1987	1	0	\N	\N	\N	33
7754	2	1987	1	1	20130.00	7680.00	2.62	33
7755	2	1987	1	2	20130.00	7680.00	2.62	33
7756	2	1987	2	0	18711.00	12470.00	1.50	33
7757	2	1987	2	1	21856.00	8270.00	2.64	33
7758	2	1987	2	2	40567.00	20740.00	1.96	33
7759	2	1988	1	0	\N	\N	\N	33
7760	2	1988	1	1	16541.00	6410.00	2.58	33
7761	2	1988	1	2	16541.00	6410.00	2.58	33
7762	2	1988	2	0	32675.00	14690.00	2.22	33
7763	2	1988	2	1	30564.00	10080.00	3.03	33
7764	2	1988	2	2	63239.00	24770.00	2.55	33
7765	2	1989	1	0	\N	\N	\N	33
7766	2	1989	1	1	17968.00	6890.00	2.61	33
7767	2	1989	1	2	17968.00	6890.00	2.61	33
7768	2	1989	2	0	26821.00	12280.00	2.18	33
7769	2	1989	2	1	33638.00	12000.00	2.80	33
7770	2	1989	2	2	60459.00	24280.00	2.49	33
7771	2	1990	1	0	\N	\N	\N	33
7772	2	1990	1	1	20822.00	8760.00	2.38	33
7773	2	1990	1	2	20822.00	8760.00	2.38	33
7774	2	1990	2	0	28100.00	12360.00	2.27	33
7775	2	1990	2	1	35516.00	13390.00	2.65	33
7776	2	1990	2	2	63616.00	25750.00	2.47	33
7777	2	1991	1	0	\N	\N	\N	33
7778	2	1991	1	1	16599.00	6900.00	2.41	33
7779	2	1991	1	2	16599.00	6900.00	2.41	33
7780	2	1991	2	0	26219.00	13070.00	2.01	33
7781	2	1991	2	1	31244.00	11880.00	2.63	33
7782	2	1991	2	2	57463.00	24950.00	2.30	33
7783	2	1992	1	0	\N	\N	\N	33
7784	2	1992	1	1	8028.00	3550.00	2.26	33
7785	2	1992	1	2	8028.00	3550.00	2.26	33
7786	2	1992	2	0	29285.00	13440.00	2.18	33
7787	2	1992	2	1	28706.00	11390.00	2.52	33
7788	2	1992	2	2	57991.00	24830.00	2.34	33
7789	2	1993	1	0	\N	\N	\N	33
7790	2	1993	1	1	17179.00	7570.00	2.27	33
7791	2	1993	1	2	17179.00	7570.00	2.27	33
7792	2	1993	2	0	34502.00	13530.00	2.55	33
7793	2	1993	2	1	33605.00	12700.00	2.65	33
7794	2	1993	2	2	68107.00	26230.00	2.60	33
7795	2	1994	1	0	\N	\N	\N	33
7796	2	1994	1	1	18528.00	7610.00	2.43	33
7797	2	1994	1	2	18528.00	7610.00	2.43	33
7798	2	1994	2	0	39621.00	13500.00	2.93	33
7799	2	1994	2	1	37563.00	12370.00	3.04	33
7800	2	1994	2	2	77184.00	25870.00	2.98	33
7801	2	1995	1	0	\N	\N	\N	33
7802	2	1995	1	1	11709.00	4770.00	2.45	33
7803	2	1995	1	2	11709.00	4770.00	2.45	33
7804	2	1995	2	0	41445.00	15071.00	2.75	33
7805	2	1995	2	1	33822.00	12133.00	2.79	33
7806	2	1995	2	2	75267.00	27204.00	2.77	33
7807	2	1996	1	0	135.00	50.00	2.70	33
7808	2	1996	1	1	19260.00	6775.00	2.84	33
7809	2	1996	1	2	19395.00	6825.00	2.84	33
7810	2	1996	2	0	31665.00	13143.00	2.41	33
7811	2	1996	2	1	30893.00	10203.00	3.03	33
7812	2	1996	2	2	62558.00	23346.00	2.68	33
7813	2	1997	1	0	83.00	32.00	2.59	33
7814	2	1997	1	1	22518.00	6890.00	3.27	33
7815	2	1997	1	2	22601.00	6922.00	3.27	33
7816	2	1997	2	0	36753.00	13790.00	2.67	33
7817	2	1997	2	1	38724.00	10941.00	3.54	33
7818	2	1997	2	2	75477.00	24731.00	3.05	33
7819	2	1998	1	0	\N	\N	\N	33
7820	2	1998	1	1	18567.00	5632.00	3.30	33
7821	2	1998	1	2	18567.00	5632.00	3.30	33
7822	2	1998	2	0	37669.00	12994.00	2.90	33
7823	2	1998	2	1	41875.00	11916.00	3.51	33
7824	2	1998	2	2	79544.00	24910.00	3.19	33
7825	2	1999	1	0	125.00	50.00	2.50	33
7826	2	1999	1	1	27776.00	7631.00	3.64	33
7827	2	1999	1	2	27901.00	7681.00	3.63	33
7828	2	1999	2	0	36054.00	11894.00	3.03	33
7829	2	1999	2	1	36705.00	11054.00	3.32	33
7830	2	1999	2	2	72759.00	22948.00	3.17	33
7831	2	2000	1	0	26.00	10.00	2.60	33
7832	2	2000	1	1	30316.00	8095.00	3.75	33
7833	2	2000	1	2	30342.00	8105.00	3.74	33
7834	2	2000	2	0	42100.00	12881.00	3.27	33
7835	2	2000	2	1	39727.00	11498.00	3.46	33
7836	2	2000	2	2	81827.00	24379.00	3.36	33
7837	2	2001	1	0	165.00	55.00	3.00	33
7838	2	2001	1	1	31591.00	8264.00	3.82	33
7839	2	2001	1	2	31756.00	8319.00	3.82	33
7840	2	2001	2	0	45687.00	13020.00	3.51	33
7841	2	2001	2	1	42593.00	11498.00	3.70	33
7842	2	2001	2	2	88280.00	24518.00	3.60	33
7843	2	2002	1	0	\N	\N	\N	33
7844	2	2002	1	1	27387.00	8448.00	3.24	33
7845	2	2002	1	2	27387.00	8448.00	3.24	33
7846	2	2002	2	0	44155.00	12995.00	3.40	33
7847	2	2002	2	1	43392.00	11523.00	3.77	33
7848	2	2002	2	2	87547.00	24518.00	3.57	33
7849	2	2003	1	0	\N	\N	\N	33
7850	2	2003	1	1	20068.00	5714.00	3.51	33
7851	2	2003	1	2	20068.00	5714.00	3.51	33
7852	2	2003	2	0	44617.00	13015.00	3.43	33
7853	2	2003	2	1	45523.00	11958.00	3.81	33
7854	2	2003	2	2	90140.00	24973.00	3.61	33
7855	2	2004	1	0	\N	\N	\N	33
7856	2	2004	1	1	24868.00	6620.00	3.76	33
7857	2	2004	1	2	24868.00	6620.00	3.76	33
7858	2	2004	2	0	45007.00	12941.00	3.48	33
7859	2	2004	2	1	47310.00	12564.00	3.77	33
7860	2	2004	2	2	92317.00	25505.00	3.62	33
7861	2	2005	1	0	\N	\N	\N	33
7862	2	2005	1	1	24651.00	6550.00	3.76	33
7863	2	2005	1	2	24651.00	6550.00	3.76	33
7864	2	2005	2	0	47343.00	12941.00	3.66	33
7865	2	2005	2	1	49576.00	12573.00	3.94	33
7866	2	2005	2	2	96919.00	25514.00	3.80	33
7867	2	2006	1	0	\N	\N	\N	33
7868	2	2006	1	1	27016.00	6870.00	3.93	33
7869	2	2006	1	2	27016.00	6870.00	3.93	33
7870	2	2006	2	0	51964.00	13165.00	3.95	33
7871	2	2006	2	1	63128.00	14040.00	4.50	33
7872	2	2006	2	2	115092.00	27205.00	4.23	33
7873	2	2007	1	0	\N	\N	\N	33
7874	2	2007	1	1	29020.00	7161.00	4.05	33
7875	2	2007	1	2	29020.00	7161.00	4.05	33
7876	2	2007	2	0	53377.00	13867.00	3.85	33
7877	2	2007	2	1	68463.00	14148.00	4.84	33
7878	2	2007	2	2	121840.00	28015.00	4.35	33
7879	2	2008	1	0	\N	\N	\N	33
7880	2	2008	1	1	30615.00	7516.00	4.07	33
7881	2	2008	1	2	30615.00	7516.00	4.07	33
7882	2	2008	2	0	61179.00	14819.00	4.13	33
7883	2	2008	2	1	69915.00	14626.00	4.78	33
7884	2	2008	2	2	131094.00	29445.00	4.45	33
7885	2	2009	1	0	\N	\N	\N	33
7886	2	2009	1	1	33179.00	7846.00	4.23	33
7887	2	2009	1	2	33179.00	7846.00	4.23	33
7888	2	2009	2	0	42706.00	14357.00	2.97	33
7889	2	2009	2	1	49112.00	14210.00	3.46	33
7890	2	2009	2	2	91818.00	28567.00	3.21	33
7891	2	2010	1	0	\N	\N	\N	33
7892	2	2010	1	1	19187.00	5108.00	3.76	33
7893	2	2010	1	2	19187.00	5108.00	3.76	33
7894	2	2010	2	0	53139.00	14378.00	3.70	33
7895	2	2010	2	1	60231.00	14742.00	4.09	33
7896	2	2010	2	2	113370.00	29120.00	3.89	33
7897	2	2011	1	0	\N	\N	\N	33
7898	2	2011	1	1	27213.00	6801.00	4.00	33
7899	2	2011	1	2	27213.00	6801.00	4.00	33
7900	2	2011	2	0	55511.00	14305.00	3.88	33
7901	2	2011	2	1	63942.00	14652.00	4.36	33
7902	2	2011	2	2	119453.00	28957.00	4.13	33
7903	2	2012	1	0	\N	\N	\N	33
7904	2	2012	1	1	30857.00	7210.00	4.28	33
7905	2	2012	1	2	30857.00	7210.00	4.28	33
7906	2	2012	2	0	56733.00	14137.00	4.01	33
7907	2	2012	2	1	68433.00	15049.00	4.55	33
7908	2	2012	2	2	125166.00	29186.00	4.29	33
7909	2	2013	1	0	\N	\N	\N	33
7910	2	2013	1	1	20808.00	5074.00	4.10	33
7911	2	2013	1	2	20808.00	5074.00	4.10	33
7912	2	2013	2	0	58988.00	14005.00	4.21	33
7913	2	2013	2	1	77479.00	16496.00	4.70	33
7914	2	2013	2	2	136467.00	30501.00	4.47	33
7915	2	2014	1	0	\N	\N	\N	33
7916	2	2014	1	1	31551.00	7000.00	4.51	33
7917	2	2014	1	2	31551.00	7000.00	4.51	33
7918	2	2014	2	0	64067.00	14201.00	4.51	33
7919	2	2014	2	1	73267.00	15571.00	4.71	33
7920	2	2014	2	2	137334.00	29772.00	4.61	33
7921	2	2015	1	0	\N	\N	\N	33
7922	2	2015	1	1	34650.00	7878.00	4.40	33
7923	2	2015	1	2	34650.00	7878.00	4.40	33
7924	2	2015	2	0	60664.00	14262.00	4.25	33
7925	2	2015	2	1	76686.00	16115.00	4.76	33
7926	2	2015	2	2	137350.00	30377.00	4.52	33
7927	2	2016	1	0	\N	\N	\N	33
7928	2	2016	1	1	32331.00	7230.00	4.47	33
7929	2	2016	1	2	32331.00	7230.00	4.47	33
7930	2	2016	2	0	60185.00	14316.00	4.20	33
7931	2	2016	2	1	82838.00	16758.00	4.94	33
7932	2	2016	2	2	143023.00	31074.00	4.60	33
7933	2	2017	1	0	0.00	0.00	\N	33
7934	2	2017	1	1	38007.00	7885.00	4.82	33
7935	2	2017	1	2	38007.00	7885.00	4.82	33
7936	2	2017	2	0	66075.00	14348.00	4.61	33
7937	2	2017	2	1	82933.00	16577.00	5.00	33
7938	2	2017	2	2	149008.00	30925.00	4.82	33
7939	2	2018	1	0	0.00	0.00	\N	33
7940	2	2018	1	1	37391.00	7477.00	5.00	33
7941	2	2018	1	2	37391.00	7477.00	5.00	33
7942	2	2018	2	0	56006.00	14290.00	3.92	33
7943	2	2018	2	1	66053.52	16152.39	4.09	33
7944	2	2018	2	2	122059.52	30442.39	4.01	33
7945	2	2019	1	0	0.00	0.00	\N	33
7946	2	2019	1	1	33558.00	7583.00	4.43	33
7947	2	2019	1	2	33558.00	7583.00	4.43	33
7948	2	2019	2	0	61409.00	14284.00	4.30	33
7949	2	2019	2	1	74087.00	16496.00	4.49	33
7950	2	2019	2	2	135496.00	30780.00	4.40	33
7951	2	2020	1	0	0.00	0.00	\N	33
7952	2	2020	1	1	40212.00	8173.00	4.92	33
7953	2	2020	1	2	40212.00	8173.00	4.92	33
7954	2	2020	2	0	61299.00	14256.00	4.30	33
7955	2	2020	2	1	74606.00	16440.00	4.54	33
7956	2	2020	2	2	135905.00	30696.00	4.43	33
7957	2	1987	1	0	4815.00	2480.00	1.94	34
7958	2	1987	1	1	73090.00	17190.00	4.25	34
7959	2	1987	1	2	77905.00	19670.00	3.96	34
7960	2	1987	2	0	1835.00	1180.00	1.56	34
7961	2	1987	2	1	48305.00	16870.00	2.86	34
7962	2	1987	2	2	50140.00	18050.00	2.78	34
7963	2	1988	1	0	4085.00	1840.00	2.22	34
7964	2	1988	1	1	64490.00	16880.00	3.82	34
7965	2	1988	1	2	68575.00	18720.00	3.66	34
7966	2	1988	2	0	1633.00	1150.00	1.42	34
7967	2	1988	2	1	48427.00	13980.00	3.46	34
7968	2	1988	2	2	50060.00	15130.00	3.31	34
7969	2	1989	1	0	4468.00	1950.00	2.29	34
7970	2	1989	1	1	68187.00	17940.00	3.80	34
7971	2	1989	1	2	72655.00	19890.00	3.65	34
7972	2	1989	2	0	3312.00	1700.00	1.95	34
7973	2	1989	2	1	50959.00	12900.00	3.95	34
7974	2	1989	2	2	54271.00	14600.00	3.72	34
7975	2	1990	1	0	4322.00	2220.00	1.95	34
7976	2	1990	1	1	62213.00	16250.00	3.83	34
7977	2	1990	1	2	66535.00	18470.00	3.60	34
7978	2	1990	2	0	2407.00	1470.00	1.64	34
7979	2	1990	2	1	40570.00	10070.00	4.03	34
7980	2	1990	2	2	42977.00	11540.00	3.72	34
7981	2	1991	1	0	3743.00	1650.00	2.27	34
7982	2	1991	1	1	72215.00	18690.00	3.86	34
7983	2	1991	1	2	75958.00	20340.00	3.73	34
7984	2	1991	2	0	1736.00	970.00	1.79	34
7985	2	1991	2	1	47059.00	10290.00	4.57	34
7986	2	1991	2	2	48795.00	11260.00	4.33	34
7987	2	1992	1	0	3960.00	1630.00	2.43	34
7988	2	1992	1	1	68420.00	17730.00	3.86	34
7989	2	1992	1	2	72380.00	19360.00	3.74	34
7990	2	1992	2	0	3726.00	1590.00	2.34	34
7991	2	1992	2	1	56498.00	11790.00	4.79	34
7992	2	1992	2	2	60224.00	13380.00	4.50	34
7993	2	1993	1	0	4080.00	1540.00	2.65	34
7994	2	1993	1	1	76860.00	17300.00	4.44	34
7995	2	1993	1	2	80940.00	18840.00	4.30	34
7996	2	1993	2	0	3220.00	1440.00	2.24	34
7997	2	1993	2	1	48779.00	13000.00	3.75	34
7998	2	1993	2	2	51999.00	14440.00	3.60	34
7999	2	1994	1	0	1858.00	780.00	2.38	34
8000	2	1994	1	1	61095.00	14520.00	4.21	34
8001	2	1994	1	2	62953.00	15300.00	4.11	34
8002	2	1994	2	0	582.00	300.00	1.94	34
8003	2	1994	2	1	45973.00	13190.00	3.49	34
8004	2	1994	2	2	46555.00	13490.00	3.45	34
8005	2	1995	1	0	1547.00	602.00	2.57	34
8006	2	1995	1	1	62226.00	15096.00	4.12	34
8007	2	1995	1	2	63773.00	15698.00	4.06	34
8008	2	1995	2	0	592.00	412.00	1.44	34
8009	2	1995	2	1	30734.00	13045.00	2.36	34
8010	2	1995	2	2	31326.00	13457.00	2.33	34
8011	2	1996	1	0	997.00	480.00	2.08	34
8012	2	1996	1	1	63642.00	15633.00	4.07	34
8013	2	1996	1	2	64639.00	16113.00	4.01	34
8014	2	1996	2	0	621.00	280.00	2.22	34
8015	2	1996	2	1	54696.00	14071.00	3.89	34
8016	2	1996	2	2	55317.00	14351.00	3.85	34
8017	2	1997	1	0	1077.00	445.00	2.42	34
8018	2	1997	1	1	68812.00	16146.00	4.26	34
8019	2	1997	1	2	69889.00	16591.00	4.21	34
8020	2	1997	2	0	647.00	270.00	2.40	34
8021	2	1997	2	1	48205.00	12240.00	3.94	34
8022	2	1997	2	2	48852.00	12510.00	3.91	34
8023	2	1998	1	0	375.00	150.00	2.50	34
8024	2	1998	1	1	81840.00	18910.00	4.33	34
8025	2	1998	1	2	82215.00	19060.00	4.31	34
8026	2	1998	2	0	349.00	170.00	2.05	34
8027	2	1998	2	1	57244.00	17600.00	3.25	34
8028	2	1998	2	2	57593.00	17770.00	3.24	34
8029	2	1999	1	0	1077.00	420.00	2.56	34
8030	2	1999	1	1	99649.00	22272.00	4.47	34
8031	2	1999	1	2	100726.00	22692.00	4.44	34
8032	2	1999	2	0	679.00	313.00	2.17	34
8033	2	1999	2	1	48666.00	12137.00	4.01	34
8034	2	1999	2	2	49345.00	12450.00	3.96	34
8035	2	2000	1	0	1077.00	425.00	2.53	34
8036	2	2000	1	1	89197.00	20215.00	4.41	34
8037	2	2000	1	2	90274.00	20640.00	4.37	34
8038	2	2000	2	0	616.00	245.00	2.51	34
8039	2	2000	2	1	41299.00	11161.00	3.70	34
8040	2	2000	2	2	41915.00	11406.00	3.67	34
8041	2	2001	1	0	853.00	323.00	2.64	34
8042	2	2001	1	1	65365.00	15335.00	4.26	34
8043	2	2001	1	2	66218.00	15658.00	4.23	34
8044	2	2001	2	0	1837.00	670.00	2.74	34
8045	2	2001	2	1	48608.00	11886.00	4.09	34
8046	2	2001	2	2	50445.00	12556.00	4.02	34
8047	2	2002	1	0	1232.00	477.00	2.58	34
8048	2	2002	1	1	55158.00	12627.00	4.37	34
8049	2	2002	1	2	56390.00	13104.00	4.30	34
8050	2	2002	2	0	935.00	340.00	2.75	34
8051	2	2002	2	1	40027.00	10479.00	3.82	34
8052	2	2002	2	2	40962.00	10819.00	3.79	34
8053	2	2003	1	0	570.00	250.00	2.28	34
8054	2	2003	1	1	51581.00	12392.00	4.16	34
8055	2	2003	1	2	52151.00	12642.00	4.13	34
8056	2	2003	2	0	973.00	350.00	2.78	34
8057	2	2003	2	1	44482.00	10896.00	4.08	34
8058	2	2003	2	2	45455.00	11246.00	4.04	34
8059	2	2004	1	0	762.00	290.00	2.63	34
8060	2	2004	1	1	59212.00	13347.00	4.44	34
8061	2	2004	1	2	59974.00	13637.00	4.40	34
8062	2	2004	2	0	1025.00	350.00	2.93	34
8063	2	2004	2	1	47254.00	11230.00	4.21	34
8064	2	2004	2	2	48279.00	11580.00	4.17	34
8065	2	2005	1	0	616.00	230.00	2.68	34
8066	2	2005	1	1	59110.00	12850.00	4.60	34
8067	2	2005	1	2	59726.00	13080.00	4.57	34
8068	2	2005	2	0	891.00	330.00	2.70	34
8069	2	2005	2	1	47037.00	11100.00	4.24	34
8070	2	2005	2	2	47928.00	11430.00	4.19	34
8071	2	2006	1	0	780.00	260.00	3.00	34
8072	2	2006	1	1	56579.00	12220.00	4.63	34
8073	2	2006	1	2	57359.00	12480.00	4.60	34
8074	2	2006	2	0	770.00	280.00	2.75	34
8075	2	2006	2	1	48559.00	11510.00	4.22	34
8076	2	2006	2	2	49329.00	11790.00	4.18	34
8077	2	2007	1	0	860.00	280.00	3.07	34
8078	2	2007	1	1	63864.00	14340.00	4.45	34
8079	2	2007	1	2	64724.00	14620.00	4.43	34
8080	2	2007	2	0	980.00	300.00	3.27	34
8081	2	2007	2	1	58945.00	13160.00	4.48	34
8082	2	2007	2	2	59925.00	13460.00	4.45	34
8083	2	2008	1	0	727.00	217.00	3.35	34
8084	2	2008	1	1	75405.00	16255.00	4.64	34
8085	2	2008	1	2	76132.00	16472.00	4.62	34
8086	2	2008	2	0	1032.00	307.00	3.36	34
8087	2	2008	2	1	60594.00	13270.00	4.57	34
8088	2	2008	2	2	61626.00	13577.00	4.54	34
8089	2	2009	1	0	746.00	220.00	3.39	34
8090	2	2009	1	1	79214.00	16873.00	4.69	34
8091	2	2009	1	2	79960.00	17093.00	4.68	34
8092	2	2009	2	0	796.00	300.00	2.65	34
8093	2	2009	2	1	30307.00	7920.00	3.83	34
8094	2	2009	2	2	31103.00	8220.00	3.78	34
8095	2	2010	1	0	723.00	221.00	3.27	34
8096	2	2010	1	1	54646.00	12209.00	4.48	34
8097	2	2010	1	2	55369.00	12430.00	4.45	34
8098	2	2010	2	0	893.00	298.00	3.00	34
8099	2	2010	2	1	66865.00	15410.00	4.34	34
8100	2	2010	2	2	67758.00	15708.00	4.31	34
8101	2	2011	1	0	354.00	104.00	3.40	34
8102	2	2011	1	1	66527.00	15138.00	4.39	34
8103	2	2011	1	2	66881.00	15242.00	4.39	34
8104	2	2011	2	0	1254.00	392.00	3.20	34
8105	2	2011	2	1	57973.00	15038.00	3.86	34
8106	2	2011	2	2	59227.00	15430.00	3.84	34
8107	2	2012	1	0	751.00	220.00	3.41	34
8108	2	2012	1	1	72408.00	15906.00	4.55	34
8109	2	2012	1	2	73159.00	16126.00	4.54	34
8110	2	2012	2	0	1088.00	400.00	2.72	34
8111	2	2012	2	1	46706.00	13369.00	3.49	34
8112	2	2012	2	2	47794.00	13769.00	3.47	34
8113	2	2013	1	0	621.00	194.00	3.20	34
8114	2	2013	1	1	72671.00	15462.00	4.70	34
8115	2	2013	1	2	73292.00	15656.00	4.68	34
8116	2	2013	2	0	786.00	368.00	2.14	34
8117	2	2013	2	1	54827.00	13755.00	3.99	34
8118	2	2013	2	2	55613.00	14123.00	3.94	34
8119	2	2014	1	0	298.00	136.00	2.19	34
8120	2	2014	1	1	72927.00	14664.00	4.97	34
8121	2	2014	1	2	73225.00	14800.00	4.95	34
8122	2	2014	2	0	223.00	113.00	1.97	34
8123	2	2014	2	1	57456.00	15706.00	3.66	34
8124	2	2014	2	2	57679.00	15819.00	3.65	34
8125	2	2015	1	0	280.00	181.00	1.55	34
8126	2	2015	1	1	72654.00	15537.00	4.68	34
8127	2	2015	1	2	72934.00	15718.00	4.64	34
8128	2	2015	2	0	21.00	25.00	0.84	34
8129	2	2015	2	1	60183.00	15606.00	3.86	34
8130	2	2015	2	2	60204.00	15631.00	3.85	34
8131	2	2016	1	0	152.00	89.00	1.71	34
8132	2	2016	1	1	74613.00	15842.00	4.71	34
8133	2	2016	1	2	74765.00	15931.00	4.69	34
8134	2	2016	2	0	60.00	35.00	1.71	34
8135	2	2016	2	1	55983.00	15295.00	3.66	34
8136	2	2016	2	2	56043.00	15330.00	3.66	34
8137	2	2017	1	0	98.00	70.00	1.40	34
8138	2	2017	1	1	72790.00	15508.00	4.69	34
8139	2	2017	1	2	72888.00	15578.00	4.68	34
8140	2	2017	2	0	118.00	77.00	1.53	34
8141	2	2017	2	1	56352.00	14958.00	3.77	34
8142	2	2017	2	2	56470.00	15035.00	3.76	34
8143	2	2018	1	0	780.00	310.00	2.52	34
8144	2	2018	1	1	80942.00	16020.00	5.05	34
8145	2	2018	1	2	81722.00	16330.00	5.00	34
8146	2	2018	2	0	197.27	75.00	2.63	34
8147	2	2018	2	1	49416.53	11268.00	4.39	34
8148	2	2018	2	2	49613.80	11343.00	4.37	34
8149	2	2019	1	0	391.43	281.15	1.39	34
8150	2	2019	1	1	87361.24	17540.01	4.98	34
8151	2	2019	1	2	87752.67	17821.16	4.92	34
8152	2	2019	2	0	184.13	55.67	3.31	34
8153	2	2019	2	1	61608.37	12796.13	4.81	34
8154	2	2019	2	2	61792.49	12851.80	4.81	34
8155	2	2020	1	0	1013.98	377.00	2.69	34
8156	2	2020	1	1	84524.83	16355.61	5.17	34
8157	2	2020	1	2	85538.81	16732.61	5.11	34
8158	2	2020	2	0	869.84	320.21	2.72	34
8159	2	2020	2	1	42918.00	11325.43	3.79	34
8160	2	2020	2	2	43787.84	11645.64	3.76	34
8161	2	1987	1	0	935.00	290.00	3.22	35
8162	2	1987	1	1	26945.00	7480.00	3.60	35
8163	2	1987	1	2	27880.00	7770.00	3.59	35
8164	2	1987	2	0	2731.00	3550.00	0.77	35
8165	2	1987	2	1	31292.00	15010.00	2.08	35
8166	2	1987	2	2	34023.00	18560.00	1.83	35
8167	2	1988	1	0	291.00	90.00	3.23	35
8168	2	1988	1	1	22707.00	6500.00	3.49	35
8169	2	1988	1	2	22998.00	6590.00	3.49	35
8170	2	1988	2	0	11857.00	6480.00	1.83	35
8171	2	1988	2	1	36027.00	12870.00	2.80	35
8172	2	1988	2	2	47884.00	19350.00	2.47	35
8173	2	1989	1	0	\N	\N	\N	35
8174	2	1989	1	1	32642.00	8910.00	3.66	35
8175	2	1989	1	2	32642.00	8910.00	3.66	35
8176	2	1989	2	0	5594.00	3170.00	1.76	35
8177	2	1989	2	1	31721.00	13400.00	2.37	35
8178	2	1989	2	2	37315.00	16570.00	2.25	35
8179	2	1990	1	0	\N	\N	\N	35
8180	2	1990	1	1	26950.00	11000.00	2.45	35
8181	2	1990	1	2	26950.00	11000.00	2.45	35
8182	2	1990	2	0	3297.00	2750.00	1.20	35
8183	2	1990	2	1	29228.00	8770.00	3.33	35
8184	2	1990	2	2	32525.00	11520.00	2.82	35
8185	2	1991	1	0	1070.00	470.00	2.28	35
8186	2	1991	1	1	33479.00	11130.00	3.01	35
8187	2	1991	1	2	34549.00	11600.00	2.98	35
8188	2	1991	2	0	9278.00	4080.00	2.27	35
8189	2	1991	2	1	43858.00	11590.00	3.78	35
8190	2	1991	2	2	53136.00	15670.00	3.39	35
8191	2	1992	1	0	470.00	200.00	2.35	35
8192	2	1992	1	1	22591.00	6560.00	3.44	35
8193	2	1992	1	2	23061.00	6760.00	3.41	35
8194	2	1992	2	0	5669.00	2970.00	1.91	35
8195	2	1992	2	1	46553.00	11940.00	3.90	35
8196	2	1992	2	2	52222.00	14910.00	3.50	35
8197	2	1993	1	0	450.00	150.00	3.00	35
8198	2	1993	1	1	37572.00	11760.00	3.19	35
8199	2	1993	1	2	38022.00	11910.00	3.19	35
8200	2	1993	2	0	7806.00	3950.00	1.98	35
8201	2	1993	2	1	55466.00	13940.00	3.98	35
8202	2	1993	2	2	63272.00	17890.00	3.54	35
8203	2	1994	1	0	3249.00	1010.00	3.22	35
8204	2	1994	1	1	42849.00	12820.00	3.34	35
8205	2	1994	1	2	46098.00	13830.00	3.33	35
8206	2	1994	2	0	26602.00	9480.00	2.81	35
8207	2	1994	2	1	61616.00	13800.00	4.46	35
8208	2	1994	2	2	88218.00	23280.00	3.79	35
8209	2	1995	1	0	1060.00	300.00	3.53	35
8210	2	1995	1	1	65810.00	14960.00	4.40	35
8211	2	1995	1	2	66870.00	15260.00	4.38	35
8212	2	1995	2	0	25916.00	10205.00	2.54	35
8213	2	1995	2	1	60658.00	15990.00	3.79	35
8214	2	1995	2	2	86574.00	26195.00	3.30	35
8215	2	1996	1	0	1672.00	565.00	2.96	35
8216	2	1996	1	1	52524.00	15833.00	3.32	35
8217	2	1996	1	2	54196.00	16398.00	3.31	35
8218	2	1996	2	0	30211.00	10989.00	2.75	35
8219	2	1996	2	1	56447.00	17181.00	3.29	35
8220	2	1996	2	2	86658.00	28170.00	3.08	35
8221	2	1997	1	0	2558.00	848.00	3.02	35
8222	2	1997	1	1	55367.00	15575.00	3.55	35
8223	2	1997	1	2	57925.00	16423.00	3.53	35
8224	2	1997	2	0	26934.00	10030.00	2.69	35
8225	2	1997	2	1	56106.00	17330.00	3.24	35
8226	2	1997	2	2	83040.00	27360.00	3.04	35
8227	2	1998	1	0	853.00	275.00	3.10	35
8228	2	1998	1	1	54933.00	15880.00	3.46	35
8229	2	1998	1	2	55786.00	16155.00	3.45	35
8230	2	1998	2	0	26115.00	9220.00	2.83	35
8231	2	1998	2	1	70560.00	20360.00	3.47	35
8232	2	1998	2	2	96675.00	29580.00	3.27	35
8233	2	1999	1	0	4087.00	1500.00	2.72	35
8234	2	1999	1	1	58750.00	17945.00	3.27	35
8235	2	1999	1	2	62837.00	19445.00	3.23	35
8236	2	1999	2	0	30753.00	11028.00	2.79	35
8237	2	1999	2	1	53959.00	15526.00	3.48	35
8238	2	1999	2	2	84712.00	26554.00	3.19	35
8239	2	2000	1	0	5941.00	2100.00	2.83	35
8240	2	2000	1	1	68048.00	19349.00	3.52	35
8241	2	2000	1	2	73989.00	21449.00	3.45	35
8242	2	2000	2	0	26484.00	9072.00	2.92	35
8243	2	2000	2	1	62853.00	18144.00	3.46	35
8244	2	2000	2	2	89337.00	27216.00	3.28	35
8245	2	2001	1	0	9193.00	2845.00	3.23	35
8246	2	2001	1	1	84195.00	21396.00	3.94	35
8247	2	2001	1	2	93388.00	24241.00	3.85	35
8248	2	2001	2	0	31857.00	9691.00	3.29	35
8249	2	2001	2	1	83259.00	20463.00	4.07	35
8250	2	2001	2	2	115116.00	30154.00	3.82	35
8251	2	2002	1	0	6215.00	2376.00	2.62	35
8252	2	2002	1	1	71943.00	20869.00	3.45	35
8253	2	2002	1	2	78158.00	23245.00	3.36	35
8254	2	2002	2	0	33208.00	11219.00	2.96	35
8255	2	2002	2	1	92262.00	21811.00	4.23	35
8256	2	2002	2	2	125470.00	33030.00	3.80	35
8257	2	2003	1	0	4131.00	1516.00	2.72	35
8258	2	2003	1	1	74670.00	19254.00	3.88	35
8259	2	2003	1	2	78801.00	20770.00	3.79	35
8260	2	2003	2	0	25170.00	9319.00	2.70	35
8261	2	2003	2	1	84176.00	21502.00	3.91	35
8262	2	2003	2	2	109346.00	30821.00	3.55	35
8263	2	2004	1	0	4132.00	1485.00	2.78	35
8264	2	2004	1	1	70182.00	19290.00	3.64	35
8265	2	2004	1	2	74314.00	20775.00	3.58	35
8266	2	2004	2	0	27500.00	9500.00	2.89	35
8267	2	2004	2	1	65306.00	16949.00	3.85	35
8268	2	2004	2	2	92806.00	26449.00	3.51	35
8269	2	2005	1	0	812.00	250.00	3.25	35
8270	2	2005	1	1	56780.00	16293.00	3.48	35
8271	2	2005	1	2	57592.00	16543.00	3.48	35
8272	2	2005	2	0	22447.00	7740.00	2.90	35
8273	2	2005	2	1	67514.00	17136.00	3.94	35
8274	2	2005	2	2	89961.00	24876.00	3.62	35
8275	2	2006	1	0	1987.00	595.00	3.34	35
8276	2	2006	1	1	55918.00	15343.00	3.64	35
8277	2	2006	1	2	57905.00	15938.00	3.63	35
8278	2	2006	2	0	19823.00	6906.00	2.87	35
8279	2	2006	2	1	57023.00	14600.00	3.91	35
8280	2	2006	2	2	76846.00	21506.00	3.57	35
8281	2	2007	1	0	2319.00	715.00	3.24	35
8282	2	2007	1	1	64779.00	17300.00	3.74	35
8283	2	2007	1	2	67098.00	18015.00	3.72	35
8284	2	2007	2	0	16410.00	5479.00	3.00	35
8285	2	2007	2	1	60397.00	15569.00	3.88	35
8286	2	2007	2	2	76807.00	21048.00	3.65	35
8287	2	2008	1	0	1691.00	565.00	2.99	35
8288	2	2008	1	1	65764.00	16081.00	4.09	35
8289	2	2008	1	2	67455.00	16646.00	4.05	35
8290	2	2008	2	0	18064.00	6855.00	2.64	35
8291	2	2008	2	1	66275.00	16174.00	4.10	35
8292	2	2008	2	2	84339.00	23029.00	3.66	35
8293	2	2009	1	0	1887.00	850.00	2.22	35
8294	2	2009	1	1	61032.00	16020.00	3.81	35
8295	2	2009	1	2	62919.00	16870.00	3.73	35
8296	2	2009	2	0	20585.00	7300.00	2.82	35
8297	2	2009	2	1	64511.00	16180.00	3.99	35
8298	2	2009	2	2	85096.00	23480.00	3.62	35
8299	2	2010	1	0	1615.00	590.00	2.74	35
8300	2	2010	1	1	56274.00	15010.00	3.75	35
8301	2	2010	1	2	57889.00	15600.00	3.71	35
8302	2	2010	2	0	18346.00	6000.00	3.06	35
8303	2	2010	2	1	68520.00	16030.00	4.27	35
8304	2	2010	2	2	86866.00	22030.00	3.94	35
8305	2	2011	1	0	2903.00	1080.00	2.69	35
8306	2	2011	1	1	61272.00	15999.00	3.83	35
8307	2	2011	1	2	64175.00	17079.00	3.76	35
8308	2	2011	2	0	19259.00	6532.00	2.95	35
8309	2	2011	2	1	68813.00	16006.00	4.30	35
8310	2	2011	2	2	88072.00	22538.00	3.91	35
8311	2	2012	1	0	3412.00	1155.00	2.95	35
8312	2	2012	1	1	65005.00	16143.00	4.03	35
8313	2	2012	1	2	68417.00	17298.00	3.96	35
8314	2	2012	2	0	20660.00	6520.00	3.17	35
8315	2	2012	2	1	69330.00	16356.00	4.24	35
8316	2	2012	2	2	89990.00	22876.00	3.93	35
8317	2	2013	1	0	2976.00	935.00	3.18	35
8318	2	2013	1	1	68495.00	16145.00	4.24	35
8319	2	2013	1	2	71471.00	17080.00	4.18	35
8320	2	2013	2	0	19407.00	6100.00	3.18	35
8321	2	2013	2	1	74449.00	16880.00	4.41	35
8322	2	2013	2	2	93856.00	22980.00	4.08	35
8323	2	2014	1	0	3538.00	1005.00	3.52	35
8324	2	2014	1	1	71127.00	16163.00	4.40	35
8325	2	2014	1	2	74665.00	17168.00	4.35	35
8326	2	2014	2	0	20048.00	6100.00	3.29	35
8327	2	2014	2	1	77057.00	16946.00	4.55	35
8328	2	2014	2	2	97105.00	23046.00	4.21	35
8329	2	2015	1	0	3524.00	990.00	3.56	35
8330	2	2015	1	1	71334.00	15877.00	4.49	35
8331	2	2015	1	2	74858.00	16867.00	4.44	35
8332	2	2015	2	0	18836.00	5860.00	3.21	35
8333	2	2015	2	1	79892.00	17315.00	4.61	35
8334	2	2015	2	2	98728.00	23175.00	4.26	35
8335	2	2016	1	0	3018.00	870.00	3.47	35
8336	2	2016	1	1	68123.85	15187.00	4.49	35
8337	2	2016	1	2	71141.85	16057.00	4.43	35
8338	2	2016	2	0	18648.00	5590.00	3.34	35
8339	2	2016	2	1	89213.00	18747.00	4.76	35
8340	2	2016	2	2	107861.00	24337.00	4.43	35
8341	2	2017	1	0	3672.00	1050.00	3.50	35
8342	2	2017	1	1	72516.90	15887.00	4.56	35
8343	2	2017	1	2	76188.90	16937.00	4.50	35
8344	2	2017	2	0	16838.00	5000.00	3.37	35
8345	2	2017	2	1	86483.00	18110.00	4.78	35
8346	2	2017	2	2	103321.00	23110.00	4.47	35
8347	2	2018	1	0	4045.00	1130.00	3.58	35
8348	2	2018	1	1	68287.00	15000.00	4.55	35
8349	2	2018	1	2	72332.00	16130.00	4.48	35
8350	2	2018	2	0	17495.00	5070.00	3.45	35
8351	2	2018	2	1	91027.54	18997.00	4.79	35
8352	2	2018	2	2	108522.54	24067.00	4.51	35
8353	2	2019	1	0	4144.25	1147.00	3.61	35
8354	2	2019	1	1	69993.87	15150.00	4.62	35
8355	2	2019	1	2	74138.12	16297.00	4.55	35
8356	2	2019	2	0	16097.05	4565.00	3.53	35
8357	2	2019	2	1	92116.32	18550.00	4.97	35
8358	2	2019	2	2	108213.37	23115.00	4.68	35
8359	2	2020	1	0	4823.40	1310.00	3.68	35
8360	2	2020	1	1	74338.64	15923.00	4.67	35
8361	2	2020	1	2	79162.04	17233.00	4.59	35
8362	2	2020	2	0	17087.50	4770.00	3.58	35
8363	2	2020	2	1	92112.15	18557.00	4.96	35
8364	2	2020	2	2	109199.65	23327.00	4.68	35
8365	2	1987	1	0	16560.00	7200.00	2.30	36
8366	2	1987	1	1	2670.00	930.00	2.87	36
8367	2	1987	1	2	19230.00	8130.00	2.37	36
8368	2	1987	2	0	29322.00	14920.00	1.97	36
8369	2	1987	2	1	3690.00	1260.00	2.93	36
8370	2	1987	2	2	33012.00	16180.00	2.04	36
8371	2	1988	1	0	12367.00	4440.00	2.79	36
8372	2	1988	1	1	10333.00	3560.00	2.90	36
8373	2	1988	1	2	22700.00	8000.00	2.84	36
8374	2	1988	2	0	40646.00	17550.00	2.32	36
8375	2	1988	2	1	6717.00	1620.00	4.15	36
8376	2	1988	2	2	47363.00	19170.00	2.47	36
8377	2	1989	1	0	9971.00	3460.00	2.88	36
8378	2	1989	1	1	2581.00	650.00	3.97	36
8379	2	1989	1	2	12552.00	4110.00	3.05	36
8380	2	1989	2	0	29285.00	14510.00	2.02	36
8381	2	1989	2	1	6660.00	1750.00	3.81	36
8382	2	1989	2	2	35945.00	16260.00	2.21	36
8383	2	1990	1	0	10732.00	4090.00	2.62	36
8384	2	1990	1	1	1920.00	520.00	3.69	36
8385	2	1990	1	2	12652.00	4610.00	2.74	36
8386	2	1990	2	0	56987.00	20960.00	2.72	36
8387	2	1990	2	1	7395.00	1890.00	3.91	36
8388	2	1990	2	2	64382.00	22850.00	2.82	36
8389	2	1991	1	0	12090.00	4270.00	2.83	36
8390	2	1991	1	1	3392.00	1150.00	2.95	36
8391	2	1991	1	2	15482.00	5420.00	2.86	36
8392	2	1991	2	0	23314.00	14480.00	1.61	36
8393	2	1991	2	1	5712.00	1400.00	4.08	36
8394	2	1991	2	2	29026.00	15880.00	1.83	36
8395	2	1992	1	0	11187.00	3520.00	3.18	36
8396	2	1992	1	1	3532.00	1300.00	2.72	36
8397	2	1992	1	2	14719.00	4820.00	3.05	36
8398	2	1992	2	0	23664.00	9120.00	2.59	36
8399	2	1992	2	1	4548.00	1660.00	2.74	36
8400	2	1992	2	2	28212.00	10780.00	2.62	36
8401	2	1993	1	0	11178.00	4090.00	2.73	36
8402	2	1993	1	1	4465.00	1500.00	2.98	36
8403	2	1993	1	2	15643.00	5590.00	2.80	36
8404	2	1993	2	0	27835.00	12630.00	2.20	36
8405	2	1993	2	1	5408.00	1760.00	3.07	36
8406	2	1993	2	2	33243.00	14390.00	2.31	36
8407	2	1994	1	0	16559.00	5740.00	2.88	36
8408	2	1994	1	1	6557.00	1920.00	3.42	36
8409	2	1994	1	2	23116.00	7660.00	3.02	36
8410	2	1994	2	0	67100.00	25000.00	2.68	36
8411	2	1994	2	1	10500.00	2900.00	3.62	36
8412	2	1994	2	2	77600.00	27900.00	2.78	36
8413	2	1995	1	0	4560.00	1520.00	3.00	36
8414	2	1995	1	1	18805.00	5500.00	3.42	36
8415	2	1995	1	2	23365.00	7020.00	3.33	36
8416	2	1995	2	0	61205.00	28157.00	2.17	36
8417	2	1995	2	1	15417.00	5987.00	2.58	36
8418	2	1995	2	2	76622.00	34144.00	2.24	36
8419	2	1996	1	0	1688.00	767.00	2.20	36
8420	2	1996	1	1	13139.00	5450.00	2.41	36
8421	2	1996	1	2	14827.00	6217.00	2.38	36
8422	2	1996	2	0	63325.00	28106.00	2.25	36
8423	2	1996	2	1	15353.00	6130.00	2.50	36
8424	2	1996	2	2	78678.00	34236.00	2.30	36
8425	2	1997	1	0	3230.00	1335.00	2.42	36
8426	2	1997	1	1	17781.00	6187.00	2.87	36
8427	2	1997	1	2	21011.00	7522.00	2.79	36
8428	2	1997	2	0	62513.00	29037.00	2.15	36
8429	2	1997	2	1	13672.00	4877.00	2.80	36
8430	2	1997	2	2	76185.00	33914.00	2.25	36
8431	2	1998	1	0	1880.00	880.00	2.14	36
8432	2	1998	1	1	17280.00	6416.00	2.69	36
8433	2	1998	1	2	19160.00	7296.00	2.63	36
8434	2	1998	2	0	49796.00	22720.00	2.19	36
8435	2	1998	2	1	14642.00	5136.00	2.85	36
8436	2	1998	2	2	64438.00	27856.00	2.31	36
8437	2	1999	1	0	4841.00	2386.00	2.03	36
8438	2	1999	1	1	21071.00	7354.00	2.87	36
8439	2	1999	1	2	25912.00	9740.00	2.66	36
8440	2	1999	2	0	52834.00	25181.00	2.10	36
8441	2	1999	2	1	14109.00	5025.00	2.81	36
8442	2	1999	2	2	66943.00	30206.00	2.22	36
8443	2	2000	1	0	5253.00	2406.00	2.18	36
8444	2	2000	1	1	22234.00	7730.00	2.88	36
8445	2	2000	1	2	27487.00	10136.00	2.71	36
8446	2	2000	2	0	52406.00	24802.00	2.11	36
8447	2	2000	2	1	13672.00	4935.00	2.77	36
8448	2	2000	2	2	66078.00	29737.00	2.22	36
8449	2	2001	1	0	15027.00	7368.00	2.04	36
8450	2	2001	1	1	31198.00	8259.00	3.78	36
8451	2	2001	1	2	46225.00	15627.00	2.96	36
8452	2	2001	2	0	83266.00	33865.00	2.46	36
8453	2	2001	2	1	34901.00	9780.00	3.57	36
8454	2	2001	2	2	118167.00	43645.00	2.71	36
8455	2	2002	1	0	19602.00	8920.00	2.20	36
8456	2	2002	1	1	21954.00	8340.00	2.63	36
8457	2	2002	1	2	41556.00	17260.00	2.41	36
8458	2	2002	2	0	76996.00	35795.00	2.15	36
8459	2	2002	2	1	35520.00	10656.00	3.33	36
8460	2	2002	2	2	112516.00	46451.00	2.42	36
8461	2	2003	1	0	20180.00	9606.00	2.10	36
8462	2	2003	1	1	24940.00	8476.00	2.94	36
8463	2	2003	1	2	45120.00	18082.00	2.50	36
8464	2	2003	2	0	82322.00	36160.00	2.28	36
8465	2	2003	2	1	38170.00	10600.00	3.60	36
8466	2	2003	2	2	120492.00	46760.00	2.58	36
8467	2	2004	1	0	23370.00	13484.00	1.73	36
8468	2	2004	1	1	26290.00	8420.00	3.12	36
8469	2	2004	1	2	49660.00	21904.00	2.27	36
8470	2	2004	2	0	51786.00	23040.00	2.25	36
8471	2	2004	2	1	24279.00	6800.00	3.57	36
8472	2	2004	2	2	76065.00	29840.00	2.55	36
8473	2	2005	1	0	34900.00	15040.00	2.32	36
8474	2	2005	1	1	25820.00	8400.00	3.07	36
8475	2	2005	1	2	60720.00	23440.00	2.59	36
8476	2	2005	2	0	41488.00	19100.00	2.17	36
8477	2	2005	2	1	32312.00	9420.00	3.43	36
8478	2	2005	2	2	73800.00	28520.00	2.59	36
8479	2	2006	1	0	35601.00	15188.00	2.34	36
8480	2	2006	1	1	28564.00	8700.00	3.28	36
8481	2	2006	1	2	64165.00	23888.00	2.69	36
8482	2	2006	2	0	42120.00	19220.00	2.19	36
8483	2	2006	2	1	38120.00	10900.00	3.50	36
8484	2	2006	2	2	80240.00	30120.00	2.66	36
8485	2	2007	1	0	35040.00	15980.00	2.19	36
8486	2	2007	1	1	28120.00	8840.00	3.18	36
8487	2	2007	1	2	63160.00	24820.00	2.54	36
8488	2	2007	2	0	66210.00	20583.00	3.22	36
8489	2	2007	2	1	45312.00	11442.00	3.96	36
8490	2	2007	2	2	111522.00	32025.00	3.48	36
8491	2	2008	1	0	36066.00	14251.00	2.53	36
8492	2	2008	1	1	33117.00	9244.00	3.58	36
8493	2	2008	1	2	69183.00	23495.00	2.94	36
8494	2	2008	2	0	86945.00	29222.00	2.98	36
8495	2	2008	2	1	34168.00	8479.00	4.03	36
8496	2	2008	2	2	121113.00	37701.00	3.21	36
8497	2	2009	1	0	35568.00	11638.00	3.06	36
8498	2	2009	1	1	44240.00	12820.00	3.45	36
8499	2	2009	1	2	79808.00	24458.00	3.26	36
8500	2	2009	2	0	72257.00	26766.00	2.70	36
8501	2	2009	2	1	23614.00	6843.00	3.45	36
8502	2	2009	2	2	95871.00	33609.00	2.85	36
8503	2	2010	1	0	44264.00	18299.00	2.42	36
8504	2	2010	1	1	33364.00	9551.00	3.49	36
8505	2	2010	1	2	77628.00	27850.00	2.79	36
8506	2	2010	2	0	73632.00	25827.00	2.85	36
8507	2	2010	2	1	26500.00	6817.00	3.89	36
8508	2	2010	2	2	100132.00	32644.00	3.07	36
8509	2	2011	1	0	45750.00	18051.00	2.53	36
8510	2	2011	1	1	24819.00	7099.00	3.50	36
8511	2	2011	1	2	70569.00	25150.00	2.81	36
8512	2	2011	2	0	72801.00	25460.00	2.86	36
8513	2	2011	2	1	27580.00	7239.00	3.81	36
8514	2	2011	2	2	100381.00	32699.00	3.07	36
8515	2	2012	1	0	48412.00	18698.00	2.59	36
8516	2	2012	1	1	32658.00	9511.00	3.43	36
8517	2	2012	1	2	81070.00	28209.00	2.87	36
8518	2	2012	2	0	84078.00	28934.00	2.91	36
8519	2	2012	2	1	21532.00	5778.00	3.73	36
8520	2	2012	2	2	105610.00	34712.00	3.04	36
8521	2	2013	1	0	49567.00	20280.00	2.44	36
8522	2	2013	1	1	33871.00	10246.00	3.31	36
8523	2	2013	1	2	83438.00	30526.00	2.73	36
8524	2	2013	2	0	81502.00	29289.00	2.78	36
8525	2	2013	2	1	24913.00	6765.00	3.68	36
8526	2	2013	2	2	106415.00	36054.00	2.95	36
8527	2	2014	1	0	31691.00	16123.00	1.97	36
8528	2	2014	1	1	33343.00	10030.00	3.32	36
8529	2	2014	1	2	65034.00	26153.00	2.49	36
8530	2	2014	2	0	65235.00	23640.00	2.76	36
8531	2	2014	2	1	33848.00	9427.00	3.59	36
8532	2	2014	2	2	99083.00	33067.00	3.00	36
8533	2	2015	1	0	33473.00	16824.00	1.99	36
8534	2	2015	1	1	23198.00	7297.00	3.18	36
8535	2	2015	1	2	56671.00	24121.00	2.35	36
8536	2	2015	2	0	78853.00	28333.00	2.78	36
8537	2	2015	2	1	13830.00	3901.00	3.55	36
8538	2	2015	2	2	92683.00	32234.00	2.88	36
8539	2	2016	1	0	22324.00	13008.00	1.72	36
8540	2	2016	1	1	19471.00	7518.00	2.59	36
8541	2	2016	1	2	41795.00	20526.00	2.04	36
8542	2	2016	2	0	82060.00	29475.00	2.78	36
8543	2	2016	2	1	13811.00	3901.00	3.54	36
8544	2	2016	2	2	95871.00	33376.00	2.87	36
8545	2	2017	1	0	43515.00	18887.00	2.30	36
8546	2	2017	1	1	28520.00	9523.00	2.99	36
8547	2	2017	1	2	72035.00	28410.00	2.54	36
8548	2	2017	2	0	89384.00	32345.00	2.76	36
8549	2	2017	2	1	20243.00	5712.00	3.54	36
8550	2	2017	2	2	109627.00	38057.00	2.88	36
8551	2	2018	1	0	37524.00	16740.00	2.24	36
8552	2	2018	1	1	23401.00	7539.00	3.10	36
8553	2	2018	1	2	60925.00	24279.00	2.51	36
8554	2	2018	2	0	114323.00	38510.00	2.97	36
8555	2	2018	2	1	24716.00	7012.00	3.52	36
8556	2	2018	2	2	139039.00	45522.00	3.05	36
8557	2	2019	1	0	49795.00	19986.00	2.49	36
8558	2	2019	1	1	25423.00	8259.00	3.08	36
8559	2	2019	1	2	75218.00	28245.00	2.66	36
8560	2	2019	2	0	87397.00	34083.47	2.56	36
8561	2	2019	2	1	27425.00	7472.53	3.67	36
8562	2	2019	2	2	114822.00	41556.00	2.76	36
8563	2	2020	1	0	48827.01	19800.00	2.47	36
8564	2	2020	1	1	24927.90	8480.00	2.94	36
8565	2	2020	1	2	73754.91	28280.00	2.61	36
8566	2	2020	2	0	105013.90	37441.00	2.80	36
8567	2	2020	2	1	38910.00	10376.00	3.75	36
8568	2	2020	2	2	143923.90	47817.00	3.01	36
8569	2	1987	1	0	49525.00	26320.00	1.88	37
8570	2	1987	1	1	79930.00	32310.00	2.47	37
8571	2	1987	1	2	129455.00	58630.00	2.21	37
8572	2	1987	2	0	31928.00	18560.00	1.72	37
8573	2	1987	2	1	92028.00	34660.00	2.66	37
8574	2	1987	2	2	123956.00	53220.00	2.33	37
8575	2	1988	1	0	45858.00	24270.00	1.89	37
8576	2	1988	1	1	89355.00	33620.00	2.66	37
8577	2	1988	1	2	135213.00	57890.00	2.34	37
8578	2	1988	2	0	19970.00	11170.00	1.79	37
8579	2	1988	2	1	92032.00	33130.00	2.78	37
8580	2	1988	2	2	112002.00	44300.00	2.53	37
8581	2	1989	1	0	24001.00	12570.00	1.91	37
8582	2	1989	1	1	70173.00	30230.00	2.32	37
8583	2	1989	1	2	94174.00	42800.00	2.20	37
8584	2	1989	2	0	37070.00	17940.00	2.07	37
8585	2	1989	2	1	103804.00	31840.00	3.26	37
8586	2	1989	2	2	140874.00	49780.00	2.83	37
8587	2	1990	1	0	21610.00	13820.00	1.56	37
8588	2	1990	1	1	77060.00	27800.00	2.77	37
8589	2	1990	1	2	98670.00	41620.00	2.37	37
8590	2	1990	2	0	24909.00	16810.00	1.48	37
8591	2	1990	2	1	78501.00	31990.00	2.45	37
8592	2	1990	2	2	103410.00	48800.00	2.12	37
8593	2	1991	1	0	31380.00	16410.00	1.91	37
8594	2	1991	1	1	84658.00	30980.00	2.73	37
8595	2	1991	1	2	116038.00	47390.00	2.45	37
8596	2	1991	2	0	24660.00	16130.00	1.53	37
8597	2	1991	2	1	84464.00	34550.00	2.44	37
8598	2	1991	2	2	109124.00	50680.00	2.15	37
8599	2	1992	1	0	34790.00	20530.00	1.69	37
8600	2	1992	1	1	77039.00	31250.00	2.47	37
8601	2	1992	1	2	111829.00	51780.00	2.16	37
8602	2	1992	2	0	16136.00	10760.00	1.50	37
8603	2	1992	2	1	87050.00	34400.00	2.53	37
8604	2	1992	2	2	103186.00	45160.00	2.28	37
8605	2	1993	1	0	31456.00	15300.00	2.06	37
8606	2	1993	1	1	105000.00	37150.00	2.83	37
8607	2	1993	1	2	136456.00	52450.00	2.60	37
8608	2	1993	2	0	18589.00	9450.00	1.97	37
8609	2	1993	2	1	84884.00	32110.00	2.64	37
8610	2	1993	2	2	103473.00	41560.00	2.49	37
8611	2	1994	1	0	23050.00	14980.00	1.54	37
8612	2	1994	1	1	61966.00	26620.00	2.33	37
8613	2	1994	1	2	85016.00	41600.00	2.04	37
8614	2	1994	2	0	23110.00	11900.00	1.94	37
8615	2	1994	2	1	74442.00	24530.00	3.03	37
8616	2	1994	2	2	97552.00	36430.00	2.68	37
8617	2	1995	1	0	30100.00	14500.00	2.08	37
8618	2	1995	1	1	89285.00	29200.00	3.06	37
8619	2	1995	1	2	119385.00	43700.00	2.73	37
8620	2	1995	2	0	23548.00	12250.00	1.92	37
8621	2	1995	2	1	71723.00	26331.00	2.72	37
8622	2	1995	2	2	95271.00	38581.00	2.47	37
8623	2	1996	1	0	29710.00	15000.00	1.98	37
8624	2	1996	1	1	86393.00	30040.00	2.88	37
8625	2	1996	1	2	116103.00	45040.00	2.58	37
8626	2	1996	2	0	22603.00	12760.00	1.77	37
8627	2	1996	2	1	70622.00	26400.00	2.68	37
8628	2	1996	2	2	93225.00	39160.00	2.38	37
8629	2	1997	1	0	38964.00	18350.00	2.12	37
8630	2	1997	1	1	90818.00	31100.00	2.92	37
8631	2	1997	1	2	129782.00	49450.00	2.62	37
8632	2	1997	2	0	23004.00	12680.00	1.81	37
8633	2	1997	2	1	69713.00	26350.00	2.65	37
8634	2	1997	2	2	92717.00	39030.00	2.38	37
8635	2	1998	1	0	25757.00	15710.00	1.64	37
8636	2	1998	1	1	72152.00	29710.00	2.43	37
8637	2	1998	1	2	97909.00	45420.00	2.16	37
8638	2	1998	2	0	22991.00	12688.00	1.81	37
8639	2	1998	2	1	67974.00	25675.00	2.65	37
8640	2	1998	2	2	90965.00	38363.00	2.37	37
8641	2	1999	1	0	39699.00	18740.00	2.12	37
8642	2	1999	1	1	108510.00	35500.00	3.06	37
8643	2	1999	1	2	148209.00	54240.00	2.73	37
8644	2	1999	2	0	37115.00	18044.00	2.06	37
8645	2	1999	2	1	86826.00	26938.00	3.22	37
8646	2	1999	2	2	123941.00	44982.00	2.76	37
8647	2	2000	1	0	40409.00	18815.00	2.15	37
8648	2	2000	1	1	111496.00	32575.00	3.42	37
8649	2	2000	1	2	151905.00	51390.00	2.96	37
8650	2	2000	2	0	39010.00	18104.00	2.15	37
8651	2	2000	2	1	91245.00	27000.00	3.38	37
8652	2	2000	2	2	130255.00	45104.00	2.89	37
8653	2	2001	1	0	42590.00	18841.00	2.26	37
8654	2	2001	1	1	119791.00	35608.00	3.36	37
8655	2	2001	1	2	162381.00	54449.00	2.98	37
8656	2	2001	2	0	41352.00	18124.00	2.28	37
8657	2	2001	2	1	102980.00	29218.00	3.52	37
8658	2	2001	2	2	144332.00	47342.00	3.05	37
8659	2	2002	1	0	45814.00	18868.00	2.43	37
8660	2	2002	1	1	127390.00	35641.00	3.57	37
8661	2	2002	1	2	173204.00	54509.00	3.18	37
8662	2	2002	2	0	48190.00	18143.00	2.66	37
8663	2	2002	2	1	125427.00	30613.00	4.10	37
8664	2	2002	2	2	173617.00	48756.00	3.56	37
8665	2	2003	1	0	52982.00	18887.00	2.81	37
8666	2	2003	1	1	150520.00	35673.00	4.22	37
8667	2	2003	1	2	203502.00	54560.00	3.73	37
8668	2	2003	2	0	51983.00	18168.00	2.86	37
8669	2	2003	2	1	131841.00	30653.00	4.30	37
8670	2	2003	2	2	183824.00	48821.00	3.77	37
8671	2	2004	1	0	59197.00	18921.00	3.13	37
8672	2	2004	1	1	159839.00	35710.00	4.48	37
8673	2	2004	1	2	219036.00	54631.00	4.01	37
8674	2	2004	2	0	60993.00	18190.00	3.35	37
8675	2	2004	2	1	137019.00	30695.00	4.46	37
8676	2	2004	2	2	198012.00	48885.00	4.05	37
8677	2	2005	1	0	63218.00	18904.00	3.34	37
8678	2	2005	1	1	168348.00	35827.00	4.70	37
8679	2	2005	1	2	231566.00	54731.00	4.23	37
8680	2	2005	2	0	67799.00	18230.00	3.72	37
8681	2	2005	2	1	159276.00	30806.00	5.17	37
8682	2	2005	2	2	227075.00	49036.00	4.63	37
8683	2	2006	1	0	68913.00	19004.00	3.63	37
8684	2	2006	1	1	183974.00	35940.00	5.12	37
8685	2	2006	1	2	252887.00	54944.00	4.60	37
8686	2	2006	2	0	71059.00	18861.00	3.77	37
8687	2	2006	2	1	155318.00	31064.00	5.00	37
8688	2	2006	2	2	226377.00	49925.00	4.53	37
8689	2	2007	1	0	78712.00	22345.00	3.52	37
8690	2	2007	1	1	235619.00	47620.00	4.95	37
8691	2	2007	1	2	314331.00	69965.00	4.49	37
8692	2	2007	2	0	91089.00	23802.00	3.83	37
8693	2	2007	2	1	177420.00	34959.00	5.08	37
8694	2	2007	2	2	268509.00	58761.00	4.57	37
8695	2	2008	1	0	96492.00	25196.00	3.83	37
8696	2	2008	1	1	259270.00	51335.00	5.05	37
8697	2	2008	1	2	355762.00	76531.00	4.65	37
8698	2	2008	2	0	78115.00	23739.00	3.29	37
8699	2	2008	2	1	171956.00	36074.00	4.77	37
8700	2	2008	2	2	250071.00	59813.00	4.18	37
8701	2	2009	1	0	82677.00	23827.00	3.47	37
8702	2	2009	1	1	226779.00	49419.00	4.59	37
8703	2	2009	1	2	309456.00	73246.00	4.22	37
8704	2	2009	2	0	74915.00	23081.00	3.25	37
8705	2	2009	2	1	146102.00	35278.00	4.14	37
8706	2	2009	2	2	221017.00	58359.00	3.79	37
8707	2	2010	1	0	83493.00	24771.00	3.37	37
8708	2	2010	1	1	213810.00	48107.00	4.44	37
8709	2	2010	1	2	297303.00	72878.00	4.08	37
8710	2	2010	2	0	75968.00	23355.00	3.25	37
8711	2	2010	2	1	149630.00	35278.00	4.24	37
8712	2	2010	2	2	225598.00	58633.00	3.85	37
8713	2	2011	1	0	80075.00	23979.00	3.34	37
8714	2	2011	1	1	203337.00	46767.00	4.35	37
8715	2	2011	1	2	283412.00	70746.00	4.01	37
8716	2	2011	2	0	75075.00	23189.00	3.24	37
8717	2	2011	2	1	168275.00	40068.00	4.20	37
8718	2	2011	2	2	243350.00	63257.00	3.85	37
8719	2	2012	1	0	80215.00	24086.00	3.33	37
8720	2	2012	1	1	203691.00	46760.00	4.36	37
8721	2	2012	1	2	283906.00	70846.00	4.01	37
8722	2	2012	2	0	72944.00	22808.00	3.20	37
8723	2	2012	2	1	164265.00	39436.00	4.17	37
8724	2	2012	2	2	237209.00	62244.00	3.81	37
8725	2	2013	1	0	82115.00	24255.00	3.39	37
8726	2	2013	1	1	208074.00	46792.00	4.45	37
8727	2	2013	1	2	290189.00	71047.00	4.08	37
8728	2	2013	2	0	71435.00	22654.00	3.15	37
8729	2	2013	2	1	141122.00	34439.00	4.10	37
8730	2	2013	2	2	212557.00	57093.00	3.72	37
8731	2	2014	1	0	81916.00	24397.00	3.36	37
8732	2	2014	1	1	206700.00	46874.00	4.41	37
8733	2	2014	1	2	288616.00	71271.00	4.05	37
8734	2	2014	2	0	72470.00	22876.00	3.17	37
8735	2	2014	2	1	141060.00	34846.00	4.05	37
8736	2	2014	2	2	213530.00	57722.00	3.70	37
8737	2	2015	1	0	85340.00	24322.00	3.51	37
8738	2	2015	1	1	207972.00	45769.00	4.54	37
8739	2	2015	1	2	293312.00	70091.00	4.18	37
8740	2	2015	2	0	56102.00	15946.00	3.52	37
8741	2	2015	2	1	139991.00	33146.00	4.22	37
8742	2	2015	2	2	196093.00	49092.00	3.99	37
8743	2	2016	1	0	84459.00	23890.00	3.54	37
8744	2	2016	1	1	215039.00	47060.00	4.57	37
8745	2	2016	1	2	299498.00	70950.00	4.22	37
8746	2	2016	2	0	50032.00	15055.70	3.32	37
8747	2	2016	2	1	124050.00	30482.00	4.07	37
8748	2	2016	2	2	174082.00	45537.70	3.82	37
8749	2	2017	1	0	80615.00	24450.00	3.30	37
8750	2	2017	1	1	211961.00	47201.00	4.49	37
8751	2	2017	1	2	292576.00	71651.00	4.08	37
8752	2	2017	2	0	54518.00	15762.00	3.46	37
8753	2	2017	2	1	134393.00	31003.00	4.33	37
8754	2	2017	2	2	188911.00	46765.00	4.04	37
8755	2	2018	1	0	82175.00	23797.00	3.45	37
8756	2	2018	1	1	212177.00	47845.00	4.43	37
8757	2	2018	1	2	294352.00	71642.00	4.11	37
8758	2	2018	2	0	54462.86	15741.00	3.46	37
8759	2	2018	2	1	138063.10	31911.00	4.33	37
8760	2	2018	2	2	192525.96	47652.00	4.04	37
8761	2	2019	1	0	70493.19	21416.00	3.29	37
8762	2	2019	1	1	211539.79	47514.00	4.45	37
8763	2	2019	1	2	282032.98	68930.00	4.09	37
8764	2	2019	2	0	45753.23	13314.00	3.44	37
8765	2	2019	2	1	135999.65	31316.00	4.34	37
8766	2	2019	2	2	181752.88	44630.00	4.07	37
8767	2	2020	1	0	70427.52	21098.00	3.34	37
8768	2	2020	1	1	205158.04	46313.00	4.43	37
8769	2	2020	1	2	275585.56	67411.00	4.09	37
8770	2	2020	2	0	47127.84	13654.00	3.45	37
8771	2	2020	2	1	139296.90	31310.00	4.45	37
8772	2	2020	2	2	186424.74	44964.00	4.15	37
8773	2	1987	1	0	10620.00	8520.00	1.25	38
8774	2	1987	1	1	16690.00	7180.00	2.32	38
8775	2	1987	1	2	27310.00	15700.00	1.74	38
8776	2	1987	2	0	23317.00	11780.00	1.98	38
8777	2	1987	2	1	39118.00	12080.00	3.24	38
8778	2	1987	2	2	62435.00	23860.00	2.62	38
8779	2	1988	1	0	17534.00	11490.00	1.53	38
8780	2	1988	1	1	22354.00	7630.00	2.93	38
8781	2	1988	1	2	39888.00	19120.00	2.09	38
8782	2	1988	2	0	37622.00	22610.00	1.66	38
8783	2	1988	2	1	57976.00	17380.00	3.34	38
8784	2	1988	2	2	95598.00	39990.00	2.39	38
8785	2	1989	1	0	12988.00	9940.00	1.31	38
8786	2	1989	1	1	29361.00	9950.00	2.95	38
8787	2	1989	1	2	42349.00	19890.00	2.13	38
8788	2	1989	2	0	61576.00	28710.00	2.14	38
8789	2	1989	2	1	54722.00	16180.00	3.38	38
8790	2	1989	2	2	116298.00	44890.00	2.59	38
8791	2	1990	1	0	10027.00	6770.00	1.48	38
8792	2	1990	1	1	22662.00	8230.00	2.75	38
8793	2	1990	1	2	32689.00	15000.00	2.18	38
8794	2	1990	2	0	39834.00	36400.00	1.09	38
8795	2	1990	2	1	40914.00	13310.00	3.07	38
8796	2	1990	2	2	80748.00	49710.00	1.62	38
8797	2	1991	1	0	2520.00	2110.00	1.19	38
8798	2	1991	1	1	11469.00	4470.00	2.57	38
8799	2	1991	1	2	13989.00	6580.00	2.13	38
8800	2	1991	2	0	17471.00	13320.00	1.31	38
8801	2	1991	2	1	29664.00	11290.00	2.63	38
8802	2	1991	2	2	47135.00	24610.00	1.92	38
8803	2	1992	1	0	2085.00	2290.00	0.91	38
8804	2	1992	1	1	2506.00	2230.00	1.12	38
8805	2	1992	1	2	4591.00	4520.00	1.02	38
8806	2	1992	2	0	22114.00	12290.00	1.80	38
8807	2	1992	2	1	41567.00	15430.00	2.69	38
8808	2	1992	2	2	63681.00	27720.00	2.30	38
8809	2	1993	1	0	7358.00	5770.00	1.28	38
8810	2	1993	1	1	11322.00	6840.00	1.66	38
8811	2	1993	1	2	18680.00	12610.00	1.48	38
8812	2	1993	2	0	51533.00	39420.00	1.31	38
8813	2	1993	2	1	40398.00	13280.00	3.04	38
8814	2	1993	2	2	91931.00	52700.00	1.74	38
8815	2	1994	1	0	29192.00	16470.00	1.77	38
8816	2	1994	1	1	46788.00	17470.00	2.68	38
8817	2	1994	1	2	75980.00	33940.00	2.24	38
8818	2	1994	2	0	90058.00	53180.00	1.69	38
8819	2	1994	2	1	49781.00	17970.00	2.77	38
8820	2	1994	2	2	139839.00	71150.00	1.97	38
8821	2	1995	1	0	22978.00	15410.00	1.49	38
8822	2	1995	1	1	29110.00	12860.00	2.26	38
8823	2	1995	1	2	52088.00	28270.00	1.84	38
8824	2	1995	2	0	123400.00	65000.00	1.90	38
8825	2	1995	2	1	40700.00	14000.00	2.91	38
8826	2	1995	2	2	164100.00	79000.00	2.08	38
8827	2	1996	1	0	50049.00	26700.00	1.87	38
8828	2	1996	1	1	32533.00	11787.00	2.76	38
8829	2	1996	1	2	82582.00	38487.00	2.15	38
8830	2	1996	2	0	97283.00	59885.00	1.62	38
8831	2	1996	2	1	41778.00	14362.00	2.91	38
8832	2	1996	2	2	139061.00	74247.00	1.87	38
8833	2	1997	1	0	52892.00	30220.00	1.75	38
8834	2	1997	1	1	32884.00	11973.00	2.75	38
8835	2	1997	1	2	85776.00	42193.00	2.03	38
8836	2	1997	2	0	74960.00	41500.00	1.81	38
8837	2	1997	2	1	33510.00	12290.00	2.73	38
8838	2	1997	2	2	108470.00	53790.00	2.02	38
8839	2	1998	1	0	19884.00	16000.00	1.24	38
8840	2	1998	1	1	7242.00	5700.00	1.27	38
8841	2	1998	1	2	27126.00	21700.00	1.25	38
8842	2	1998	2	0	72744.00	40800.00	1.78	38
8843	2	1998	2	1	31594.00	14300.00	2.21	38
8844	2	1998	2	2	104338.00	55100.00	1.89	38
8845	2	1999	1	0	40770.00	22500.00	1.81	38
8846	2	1999	1	1	30447.00	13250.00	2.30	38
8847	2	1999	1	2	71217.00	35750.00	1.99	38
8848	2	1999	2	0	113361.00	52252.00	2.17	38
8849	2	1999	2	1	58188.00	17948.00	3.24	38
8850	2	1999	2	2	171549.00	70200.00	2.44	38
8851	2	2000	1	0	50484.00	23454.00	2.15	38
8852	2	2000	1	1	40879.00	12626.00	3.24	38
8853	2	2000	1	2	91363.00	36080.00	2.53	38
8854	2	2000	2	0	96250.00	48320.00	1.99	38
8855	2	2000	2	1	53946.00	17737.00	3.04	38
8856	2	2000	2	2	150196.00	66057.00	2.27	38
8857	2	2001	1	0	38217.00	19595.00	1.95	38
8858	2	2001	1	1	39823.00	14025.00	2.84	38
8859	2	2001	1	2	78040.00	33620.00	2.32	38
8860	2	2001	2	0	130079.00	48201.00	2.70	38
8861	2	2001	2	1	61042.00	16665.00	3.66	38
8862	2	2001	2	2	191121.00	64866.00	2.95	38
8863	2	2002	1	0	37660.00	23273.00	1.62	38
8864	2	2002	1	1	48107.00	17126.00	2.81	38
8865	2	2002	1	2	85767.00	40399.00	2.12	38
8866	2	2002	2	0	97681.00	43694.00	2.24	38
8867	2	2002	2	1	75264.00	19582.00	3.84	38
8868	2	2002	2	2	172945.00	63276.00	2.73	38
8869	2	2003	1	0	30243.00	25351.00	1.19	38
8870	2	2003	1	1	32865.00	12350.00	2.66	38
8871	2	2003	1	2	63108.00	37701.00	1.67	38
8872	2	2003	2	0	98178.00	43234.00	2.27	38
8873	2	2003	2	1	62936.00	19562.00	3.22	38
8874	2	2003	2	2	161114.00	62796.00	2.57	38
8875	2	2004	1	0	54655.00	24023.00	2.28	38
8876	2	2004	1	1	70849.00	21511.00	3.29	38
8877	2	2004	1	2	125504.00	45534.00	2.76	38
8878	2	2004	2	0	143460.00	63000.00	2.28	38
8879	2	2004	2	1	86091.00	19450.00	4.43	38
8880	2	2004	2	2	229551.00	82450.00	2.78	38
8881	2	2005	1	0	35724.00	21450.00	1.67	38
8882	2	2005	1	1	82301.00	22312.00	3.69	38
8883	2	2005	1	2	118025.00	43762.00	2.70	38
8884	2	2005	2	0	168208.00	72903.00	2.31	38
8885	2	2005	2	1	114213.00	24837.00	4.60	38
8886	2	2005	2	2	282421.00	97740.00	2.89	38
9436	2	1995	2	0	8046.00	9890.00	0.81	40
8887	2	2006	1	0	117451.00	52435.00	2.24	38
8888	2	2006	1	1	89664.00	20309.00	4.41	38
8889	2	2006	1	2	207115.00	72744.00	2.85	38
8890	2	2006	2	0	109548.00	44712.00	2.45	38
8891	2	2006	2	1	83910.00	19137.00	4.38	38
8892	2	2006	2	2	193458.00	63849.00	3.03	38
8893	2	2007	1	0	131672.00	60526.00	2.18	38
8894	2	2007	1	1	94191.00	24137.00	3.90	38
8895	2	2007	1	2	225863.00	84663.00	2.67	38
8896	2	2007	2	0	81131.00	26521.00	3.06	38
8897	2	2007	2	1	126772.00	26488.00	4.79	38
8898	2	2007	2	2	207903.00	53009.00	3.92	38
8899	2	2008	1	0	169494.00	61676.00	2.75	38
8900	2	2008	1	1	70584.00	18317.00	3.85	38
8901	2	2008	1	2	240078.00	79993.00	3.00	38
8902	2	2008	2	0	82515.00	27018.00	3.05	38
8903	2	2008	2	1	109996.00	27142.00	4.05	38
8904	2	2008	2	2	192511.00	54160.00	3.55	38
8905	2	2009	1	0	149004.00	61495.00	2.42	38
8906	2	2009	1	1	73463.00	17768.00	4.13	38
8907	2	2009	1	2	222467.00	79263.00	2.81	38
8908	2	2009	2	0	124075.00	48760.00	2.54	38
8909	2	2009	2	1	50177.00	14732.00	3.41	38
8910	2	2009	2	2	174252.00	63492.00	2.74	38
8911	2	2010	1	0	166161.00	62634.00	2.65	38
8912	2	2010	1	1	96349.00	21487.00	4.48	38
8913	2	2010	1	2	262510.00	84121.00	3.12	38
8914	2	2010	2	0	130504.00	48203.00	2.71	38
8915	2	2010	2	1	43943.00	10480.00	4.19	38
8916	2	2010	2	2	174447.00	58683.00	2.97	38
8917	2	2011	1	0	109946.00	47227.00	2.33	38
8918	2	2011	1	1	87982.00	23463.00	3.75	38
8919	2	2011	1	2	197928.00	70690.00	2.80	38
8920	2	2011	2	0	126964.00	49354.00	2.57	38
8921	2	2011	2	1	73205.00	18141.00	4.04	38
8922	2	2011	2	2	200169.00	67495.00	2.97	38
8923	2	2012	1	0	132191.00	61427.00	2.15	38
8924	2	2012	1	1	53986.00	18961.00	2.85	38
8925	2	2012	1	2	186177.00	80388.00	2.32	38
8926	2	2012	2	0	105312.00	41576.00	2.53	38
8927	2	2012	2	1	56634.00	14313.00	3.96	38
8928	2	2012	2	2	161946.00	55889.00	2.90	38
8929	2	2013	1	0	111506.00	50989.00	2.19	38
8930	2	2013	1	1	61333.00	17113.00	3.58	38
8931	2	2013	1	2	172839.00	68102.00	2.54	38
8932	2	2013	2	0	164511.00	66381.00	2.48	38
8933	2	2013	2	1	76710.00	21945.00	3.50	38
8934	2	2013	2	2	241221.00	88326.00	2.73	38
8935	2	2014	1	0	161975.00	75551.00	2.14	38
8936	2	2014	1	1	40969.00	12753.00	3.21	38
8937	2	2014	1	2	202944.00	88304.00	2.30	38
8938	2	2014	2	0	108076.00	43476.00	2.49	38
8939	2	2014	2	1	75514.00	23155.00	3.26	38
8940	2	2014	2	2	183590.00	66631.00	2.76	38
8941	2	2015	1	0	99322.00	53974.00	1.84	38
8942	2	2015	1	1	57660.00	17325.00	3.33	38
8943	2	2015	1	2	156982.00	71299.00	2.20	38
8944	2	2015	2	0	120387.00	46256.00	2.60	38
8945	2	2015	2	1	55889.00	17520.00	3.19	38
8946	2	2015	2	2	176276.00	63776.00	2.76	38
8947	2	2016	1	0	70291.00	39159.00	1.80	38
8948	2	2016	1	1	45673.00	13342.00	3.42	38
8949	2	2016	1	2	115964.00	52501.00	2.21	38
8950	2	2016	2	0	233326.00	89606.00	2.60	38
8951	2	2016	2	1	53246.00	14447.00	3.69	38
8952	2	2016	2	2	286572.00	104053.00	2.75	38
8953	2	2017	1	0	138699.00	53944.00	2.57	38
8954	2	2017	1	1	31103.00	9122.00	3.41	38
8955	2	2017	1	2	169802.00	63066.00	2.69	38
8956	2	2017	2	0	184490.00	78917.00	2.34	38
8957	2	2017	2	1	37632.00	10477.00	3.59	38
8958	2	2017	2	2	222122.00	89394.00	2.48	38
8959	2	2018	1	0	135726.00	55575.00	2.44	38
8960	2	2018	1	1	48287.00	13061.00	3.70	38
8961	2	2018	1	2	184013.00	68636.00	2.68	38
8962	2	2018	2	0	189596.50	73889.00	2.57	38
8963	2	2018	2	1	59587.00	11501.00	5.18	38
8964	2	2018	2	2	249183.50	85390.00	2.92	38
8965	2	2019	1	0	149237.85	48767.00	3.06	38
8966	2	2019	1	1	47794.69	12182.00	3.92	38
8967	2	2019	1	2	197032.54	60949.00	3.23	38
8968	2	2019	2	0	209817.27	61295.00	3.42	38
8969	2	2019	2	1	73863.39	14320.00	5.16	38
8970	2	2019	2	2	283680.66	75615.00	3.75	38
8971	2	2020	1	0	161498.40	65129.82	2.48	38
8972	2	2020	1	1	48425.00	11486.00	4.22	38
8973	2	2020	1	2	209923.40	76615.82	2.74	38
8974	2	2020	2	0	217917.57	65107.00	3.35	38
8975	2	2020	2	1	78075.22	14701.62	5.31	38
8976	2	2020	2	2	295992.79	79808.62	3.71	38
8977	1	1987	1	0	37015.00	19060.00	1.94	4
8978	1	1987	1	1	145730.00	40420.00	3.61	4
8979	1	1987	1	2	182745.00	59480.00	3.07	4
8980	1	1987	2	0	60728.00	40470.00	1.50	4
8981	1	1987	2	1	139948.00	49590.00	2.82	4
8982	1	1987	2	2	200676.00	90060.00	2.23	4
8983	1	1988	1	0	62477.00	27820.00	2.25	4
8984	1	1988	1	1	149247.00	43920.00	3.40	4
8985	1	1988	1	2	211724.00	71740.00	2.95	4
8986	1	1988	2	0	65658.00	47280.00	1.39	4
8987	1	1988	2	1	136319.00	50400.00	2.70	4
8988	1	1988	2	2	201977.00	97680.00	2.07	4
8989	1	1989	1	0	70451.00	31490.00	2.24	4
8990	1	1989	1	1	158754.00	49440.00	3.21	4
8991	1	1989	1	2	229205.00	80930.00	2.83	4
8992	1	1989	2	0	73916.00	46650.00	1.58	4
8993	1	1989	2	1	160262.00	51080.00	3.14	4
8994	1	1989	2	2	234178.00	97730.00	2.40	4
8995	1	1990	1	0	34864.00	18660.00	1.87	4
8996	1	1990	1	1	141936.00	49620.00	2.86	4
8997	1	1990	1	2	176800.00	68280.00	2.59	4
8998	1	1990	2	0	73828.00	46910.00	1.57	4
8999	1	1990	2	1	170560.00	51210.00	3.33	4
9000	1	1990	2	2	244388.00	98120.00	2.49	4
9001	1	1991	1	0	38159.00	19030.00	2.01	4
9002	1	1991	1	1	174373.00	56380.00	3.09	4
9003	1	1991	1	2	212532.00	75410.00	2.82	4
9004	1	1991	2	0	63645.00	37150.00	1.71	4
9005	1	1991	2	1	171888.00	48060.00	3.58	4
9006	1	1991	2	2	235533.00	85210.00	2.76	4
9007	1	1992	1	0	38053.00	17450.00	2.18	4
9008	1	1992	1	1	156713.00	54050.00	2.90	4
9009	1	1992	1	2	194766.00	71500.00	2.72	4
9010	1	1992	2	0	71122.00	41550.00	1.71	4
9011	1	1992	2	1	190094.00	52530.00	3.62	4
9012	1	1992	2	2	261216.00	94080.00	2.78	4
9013	1	1993	1	0	36565.00	15960.00	2.29	4
9014	1	1993	1	1	179146.00	49750.00	3.60	4
9015	1	1993	1	2	215711.00	65710.00	3.28	4
9016	1	1993	2	0	57245.00	38210.00	1.50	4
9017	1	1993	2	1	175313.00	54440.00	3.22	4
9018	1	1993	2	2	232558.00	92650.00	2.51	4
9019	1	1994	1	0	24298.00	13930.00	1.74	4
9020	1	1994	1	1	163423.00	46890.00	3.49	4
9021	1	1994	1	2	187721.00	60820.00	3.09	4
9022	1	1994	2	0	62351.00	42780.00	1.46	4
9023	1	1994	2	1	161826.00	49850.00	3.25	4
9024	1	1994	2	2	224177.00	92630.00	2.42	4
9025	1	1995	1	0	24092.00	13402.00	1.80	4
9026	1	1995	1	1	144908.00	43784.00	3.31	4
9027	1	1995	1	2	169000.00	57186.00	2.96	4
9028	1	1995	2	0	55766.00	40232.00	1.39	4
9029	1	1995	2	1	110045.00	45002.00	2.45	4
9030	1	1995	2	2	165811.00	85234.00	1.95	4
9031	1	1996	1	0	27149.00	15749.00	1.72	4
9032	1	1996	1	1	149647.00	42565.00	3.52	4
9033	1	1996	1	2	176796.00	58314.00	3.03	4
9034	1	1996	2	0	62656.00	43129.00	1.45	4
9035	1	1996	2	1	154676.00	47136.00	3.28	4
9036	1	1996	2	2	217332.00	90265.00	2.41	4
9037	1	1997	1	0	30229.00	16343.00	1.85	4
9038	1	1997	1	1	156991.00	43773.00	3.59	4
9039	1	1997	1	2	187220.00	60116.00	3.11	4
9040	1	1997	2	0	47419.00	31951.00	1.48	4
9041	1	1997	2	1	143832.00	41492.00	3.47	4
9042	1	1997	2	2	191251.00	73443.00	2.60	4
9043	1	1998	1	0	15208.00	12345.00	1.23	4
9044	1	1998	1	1	141707.00	41921.00	3.38	4
9045	1	1998	1	2	156915.00	54266.00	2.89	4
9046	1	1998	2	0	36801.00	25975.00	1.42	4
9047	1	1998	2	1	125834.00	43193.00	2.91	4
9048	1	1998	2	2	162635.00	69168.00	2.35	4
9049	1	1999	1	0	23068.00	14160.00	1.63	4
9050	1	1999	1	1	198782.00	55008.00	3.61	4
9051	1	1999	1	2	221850.00	69168.00	3.21	4
9052	1	1999	2	0	53821.00	32287.00	1.67	4
9053	1	1999	2	1	152244.00	42669.00	3.57	4
9054	1	1999	2	2	206065.00	74956.00	2.75	4
9055	1	2000	1	0	21341.00	12078.00	1.77	4
9056	1	2000	1	1	195453.00	52850.00	3.70	4
9057	1	2000	1	2	216794.00	64928.00	3.34	4
9058	1	2000	2	0	28418.00	22260.00	1.28	4
9059	1	2000	2	1	131227.00	40619.00	3.23	4
9060	1	2000	2	2	159645.00	62879.00	2.54	4
9061	1	2001	1	0	25609.00	12737.00	2.01	4
9062	1	2001	1	1	173057.00	46470.00	3.72	4
9063	1	2001	1	2	198666.00	59207.00	3.36	4
9064	1	2001	2	0	45126.00	27619.00	1.63	4
9065	1	2001	2	1	152208.00	41905.00	3.63	4
9066	1	2001	2	2	197334.00	69524.00	2.84	4
9067	1	2002	1	0	25906.00	13996.00	1.85	4
9068	1	2002	1	1	156486.00	43704.00	3.58	4
9069	1	2002	1	2	182392.00	57700.00	3.16	4
9070	1	2002	2	0	51073.00	26315.00	1.94	4
9071	1	2002	2	1	144048.00	40353.00	3.57	4
9072	1	2002	2	2	195121.00	66668.00	2.93	4
9073	1	2003	1	0	22813.00	13361.00	1.71	4
9074	1	2003	1	1	147754.00	43218.00	3.42	4
9075	1	2003	1	2	170567.00	56579.00	3.01	4
9076	1	2003	2	0	51269.00	25652.00	2.00	4
9077	1	2003	2	1	154698.00	40831.00	3.79	4
9078	1	2003	2	2	205967.00	66483.00	3.10	4
9079	1	2004	1	0	22234.00	13139.00	1.69	4
9080	1	2004	1	1	158904.00	43700.00	3.64	4
9081	1	2004	1	2	181138.00	56839.00	3.19	4
9082	1	2004	2	0	51159.00	23538.00	2.17	4
9083	1	2004	2	1	169769.00	40646.00	4.18	4
9084	1	2004	2	2	220928.00	64184.00	3.44	4
9085	1	2005	1	0	25471.00	12612.00	2.02	4
9086	1	2005	1	1	156056.00	38334.00	4.07	4
9087	1	2005	1	2	181527.00	50946.00	3.56	4
9088	1	2005	2	0	47795.00	20718.00	2.31	4
9089	1	2005	2	1	163001.00	38572.00	4.23	4
9090	1	2005	2	2	210796.00	59290.00	3.56	4
9091	1	2006	1	0	21520.00	10437.00	2.06	4
9092	1	2006	1	1	171883.00	40859.00	4.21	4
9093	1	2006	1	2	193403.00	51296.00	3.77	4
9094	1	2006	2	0	35358.00	19136.00	1.85	4
9095	1	2006	2	1	129603.00	33599.00	3.86	4
9096	1	2006	2	2	164961.00	52735.00	3.13	4
9097	1	2007	1	0	22523.00	10565.00	2.13	4
9098	1	2007	1	1	166759.00	40319.00	4.14	4
9099	1	2007	1	2	189282.00	50884.00	3.72	4
9100	1	2007	2	0	54160.00	18638.00	2.91	4
9101	1	2007	2	1	147976.00	35192.00	4.20	4
9102	1	2007	2	2	202136.00	53830.00	3.76	4
9103	1	2008	1	0	30470.00	12286.00	2.48	4
9104	1	2008	1	1	180085.00	42629.00	4.22	4
9105	1	2008	1	2	210555.00	54915.00	3.83	4
9106	1	2008	2	0	56779.00	19810.00	2.87	4
9107	1	2008	2	1	160751.00	37395.00	4.30	4
9108	1	2008	2	2	217530.00	57205.00	3.80	4
9109	1	2009	1	0	34085.00	12810.00	2.66	4
9110	1	2009	1	1	192143.00	45181.00	4.25	4
9111	1	2009	1	2	226228.00	57991.00	3.90	4
9112	1	2009	2	0	47697.00	19104.00	2.50	4
9113	1	2009	2	1	109110.00	29943.00	3.64	4
9114	1	2009	2	2	156807.00	49047.00	3.20	4
9115	1	2010	1	0	22141.00	9230.00	2.40	4
9116	1	2010	1	1	144198.00	37492.00	3.85	4
9117	1	2010	1	2	166339.00	46722.00	3.56	4
9118	1	2010	2	0	47453.00	15400.00	3.08	4
9119	1	2010	2	1	176397.00	42002.00	4.20	4
9120	1	2010	2	2	223850.00	57402.00	3.90	4
9121	1	2011	1	0	34912.00	12480.00	2.80	4
9122	1	2011	1	1	173585.00	43178.00	4.02	4
9123	1	2011	1	2	208497.00	55658.00	3.75	4
9124	1	2011	2	0	43802.00	18595.00	2.36	4
9125	1	2011	2	1	146894.00	39933.00	3.68	4
9126	1	2011	2	2	190696.00	58528.00	3.26	4
9127	1	2012	1	0	42197.00	15108.00	2.79	4
9128	1	2012	1	1	178800.00	43619.00	4.10	4
9129	1	2012	1	2	220997.00	58727.00	3.76	4
9130	1	2012	2	0	37669.00	17782.00	2.12	4
9131	1	2012	2	1	130606.00	36501.00	3.58	4
9132	1	2012	2	2	168275.00	54283.00	3.10	4
9133	1	2013	1	0	36800.00	14637.00	2.51	4
9134	1	2013	1	1	181291.00	43515.00	4.17	4
9135	1	2013	1	2	218091.00	58152.00	3.75	4
9136	1	2013	2	0	53607.00	19466.00	2.75	4
9137	1	2013	2	1	140087.00	37900.00	3.70	4
9138	1	2013	2	2	193694.00	57366.00	3.38	4
9139	1	2014	1	0	21313.00	12462.00	1.71	4
9140	1	2014	1	1	173146.00	44299.00	3.91	4
9141	1	2014	1	2	194459.00	56761.00	3.43	4
9142	1	2014	2	0	51473.00	17915.00	2.87	4
9143	1	2014	2	1	159650.00	41892.00	3.81	4
9144	1	2014	2	2	211123.00	59807.00	3.53	4
9145	1	2015	1	0	34063.00	14011.00	2.43	4
9146	1	2015	1	1	179472.00	44725.00	4.01	4
9147	1	2015	1	2	213535.00	58736.00	3.64	4
9148	1	2015	2	0	35988.00	13961.00	2.58	4
9149	1	2015	2	1	143384.00	40369.00	3.55	4
9150	1	2015	2	2	179372.00	54330.00	3.30	4
9151	1	2016	1	0	36925.00	13947.00	2.65	4
9152	1	2016	1	1	181280.00	43903.00	4.13	4
9153	1	2016	1	2	218205.00	57850.00	3.77	4
9154	1	2016	2	0	43288.00	17488.00	2.48	4
9155	1	2016	2	1	145631.00	41430.00	3.52	4
9156	1	2016	2	2	188919.00	58918.00	3.21	4
9157	1	2017	1	0	36375.00	14143.00	2.57	4
9158	1	2017	1	1	173182.00	42446.00	4.08	4
9159	1	2017	1	2	209557.00	56589.00	3.70	4
9160	1	2017	2	0	49999.00	18868.00	2.65	4
9161	1	2017	2	1	151277.00	40891.00	3.70	4
9162	1	2017	2	2	201276.00	59759.00	3.37	4
9163	1	2018	1	0	46960.00	15477.00	3.03	4
9164	1	2018	1	1	185214.00	43872.00	4.22	4
9165	1	2018	1	2	232174.00	59349.00	3.91	4
9166	1	2018	2	0	36437.77	12522.00	2.91	4
9167	1	2018	2	1	151621.70	36778.63	4.12	4
9168	1	2018	2	2	188059.47	49300.63	3.81	4
9169	1	2019	1	0	33603.91	14800.15	2.27	4
9170	1	2019	1	1	175195.09	42951.12	4.08	4
9171	1	2019	1	2	208799.00	57751.27	3.62	4
9172	1	2019	2	0	19091.58	8750.72	2.18	4
9173	1	2019	2	1	152891.38	36704.78	4.17	4
9174	1	2019	2	2	171982.96	45455.50	3.78	4
9175	1	2020	1	0	42473.14	14699.25	2.89	4
9176	1	2020	1	1	174384.94	40555.00	4.30	4
9177	1	2020	1	2	216858.08	55254.25	3.92	4
9178	1	2020	2	0	38770.25	15366.98	2.52	4
9179	1	2020	2	1	131291.60	35644.46	3.68	4
9180	1	2020	2	2	170061.85	51011.44	3.33	4
9181	2	1987	1	0	13770.00	8740.00	1.58	4
9182	2	1987	1	1	28280.00	9570.00	2.96	4
9183	2	1987	1	2	42050.00	18310.00	2.30	4
9184	2	1987	2	0	10891.00	7940.00	1.37	4
9185	2	1987	2	1	23330.00	9180.00	2.54	4
9186	2	1987	2	2	34221.00	17120.00	2.00	4
9187	2	1988	1	0	13415.00	7990.00	1.68	4
9188	2	1988	1	1	27262.00	9120.00	2.99	4
9189	2	1988	1	2	40677.00	17110.00	2.38	4
9190	2	1988	2	0	9996.00	6140.00	1.63	4
9191	2	1988	2	1	28556.00	11210.00	2.55	4
9192	2	1988	2	2	38552.00	17350.00	2.22	4
9193	2	1989	1	0	12101.00	7920.00	1.53	4
9194	2	1989	1	1	24046.00	11860.00	2.03	4
9195	2	1989	1	2	36147.00	19780.00	1.83	4
9196	2	1989	2	0	4308.00	2990.00	1.44	4
9197	2	1989	2	1	44700.00	14590.00	3.06	4
9198	2	1989	2	2	49008.00	17580.00	2.79	4
9199	2	1990	1	0	12370.00	7480.00	1.65	4
9200	2	1990	1	1	21591.00	9280.00	2.33	4
9201	2	1990	1	2	33961.00	16760.00	2.03	4
9202	2	1990	2	0	14270.00	7850.00	1.82	4
9203	2	1990	2	1	27894.00	8840.00	3.16	4
9204	2	1990	2	2	42164.00	16690.00	2.53	4
9205	2	1991	1	0	14006.00	7620.00	1.84	4
9206	2	1991	1	1	25652.00	11410.00	2.25	4
9207	2	1991	1	2	39658.00	19030.00	2.08	4
9208	2	1991	2	0	14431.00	7140.00	2.02	4
9209	2	1991	2	1	29579.00	9260.00	3.19	4
9210	2	1991	2	2	44010.00	16400.00	2.68	4
9211	2	1992	1	0	13615.00	7520.00	1.81	4
9212	2	1992	1	1	24367.00	11490.00	2.12	4
9213	2	1992	1	2	37982.00	19010.00	2.00	4
9214	2	1992	2	0	13500.00	7560.00	1.79	4
9215	2	1992	2	1	38968.00	8890.00	4.38	4
9216	2	1992	2	2	52468.00	16450.00	3.19	4
9217	2	1993	1	0	16943.00	7530.00	2.25	4
9218	2	1993	1	1	54344.00	11330.00	4.80	4
9219	2	1993	1	2	71287.00	18860.00	3.78	4
9220	2	1993	2	0	17578.00	7880.00	2.23	4
9221	2	1993	2	1	43202.00	10410.00	4.15	4
9222	2	1993	2	2	60780.00	18290.00	3.32	4
9223	2	1994	1	0	14339.00	8240.00	1.74	4
9224	2	1994	1	1	45301.00	10470.00	4.33	4
9225	2	1994	1	2	59640.00	18710.00	3.19	4
9226	2	1994	2	0	14974.00	8180.00	1.83	4
9227	2	1994	2	1	41230.00	11560.00	3.57	4
9228	2	1994	2	2	56204.00	19740.00	2.85	4
9229	2	1995	1	0	17043.00	7830.00	2.18	4
9230	2	1995	1	1	43134.00	11090.00	3.89	4
9231	2	1995	1	2	60177.00	18920.00	3.18	4
9232	2	1995	2	0	16672.00	8760.00	1.90	4
9233	2	1995	2	1	35329.00	10210.00	3.46	4
9234	2	1995	2	2	52001.00	18970.00	2.74	4
9235	2	1996	1	0	19496.00	9120.00	2.14	4
9236	2	1996	1	1	35340.00	10550.00	3.35	4
9237	2	1996	1	2	54836.00	19670.00	2.79	4
9238	2	1996	2	0	19611.00	8610.00	2.28	4
9239	2	1996	2	1	36206.00	10350.00	3.50	4
9240	2	1996	2	2	55817.00	18960.00	2.94	4
9241	2	1997	1	0	19802.00	8375.00	2.36	4
9242	2	1997	1	1	36351.00	9379.00	3.88	4
9243	2	1997	1	2	56153.00	17754.00	3.16	4
9244	2	1997	2	0	18633.00	8288.00	2.25	4
9245	2	1997	2	1	37210.00	9642.00	3.86	4
9246	2	1997	2	2	55843.00	17930.00	3.11	4
9247	2	1998	1	0	15433.00	8028.00	1.92	4
9248	2	1998	1	1	36583.00	9989.00	3.66	4
9249	2	1998	1	2	52016.00	18017.00	2.89	4
9250	2	1998	2	0	17235.00	9626.00	1.79	4
9251	2	1998	2	1	29973.00	8620.00	3.48	4
9252	2	1998	2	2	47208.00	18246.00	2.59	4
9253	2	1999	1	0	17568.00	9791.00	1.79	4
9254	2	1999	1	1	42710.00	11768.00	3.63	4
9255	2	1999	1	2	60278.00	21559.00	2.80	4
9256	2	1999	2	0	26834.00	11302.00	2.37	4
9257	2	1999	2	1	38412.00	10567.00	3.64	4
9258	2	1999	2	2	65246.00	21869.00	2.98	4
9259	2	2000	1	0	20736.00	10377.00	2.00	4
9260	2	2000	1	1	31353.00	9773.00	3.21	4
9261	2	2000	1	2	52089.00	20150.00	2.59	4
9262	2	2000	2	0	24463.00	9906.00	2.47	4
9263	2	2000	2	1	47377.00	12162.00	3.90	4
9264	2	2000	2	2	71840.00	22068.00	3.26	4
9265	2	2001	1	0	22711.00	11082.00	2.05	4
9266	2	2001	1	1	35041.00	9581.00	3.66	4
9267	2	2001	1	2	57752.00	20663.00	2.79	4
9268	2	2001	2	0	21191.00	9852.00	2.15	4
9269	2	2001	2	1	44923.00	11976.00	3.75	4
9270	2	2001	2	2	66114.00	21828.00	3.03	4
9271	2	2002	1	0	23747.00	9228.00	2.57	4
9272	2	2002	1	1	38101.00	9460.00	4.03	4
9273	2	2002	1	2	61848.00	18688.00	3.31	4
9274	2	2002	2	0	25513.00	11241.00	2.27	4
9275	2	2002	2	1	39107.00	10229.00	3.82	4
9276	2	2002	2	2	64620.00	21470.00	3.01	4
9277	2	2003	1	0	28283.00	11212.00	2.52	4
9278	2	2003	1	1	38576.00	9605.00	4.02	4
9279	2	2003	1	2	66859.00	20817.00	3.21	4
9280	2	2003	2	0	27316.00	11462.00	2.38	4
9281	2	2003	2	1	37305.00	11359.00	3.28	4
9282	2	2003	2	2	64621.00	22821.00	2.83	4
9283	2	2004	1	0	36289.00	13657.00	2.66	4
9284	2	2004	1	1	47532.00	11065.00	4.30	4
9285	2	2004	1	2	83821.00	24722.00	3.39	4
9286	2	2004	2	0	26397.00	11547.00	2.29	4
9287	2	2004	2	1	46107.00	11272.00	4.09	4
9288	2	2004	2	2	72504.00	22819.00	3.18	4
9289	2	2005	1	0	33515.00	13502.00	2.48	4
9290	2	2005	1	1	45281.00	11214.00	4.04	4
9291	2	2005	1	2	78796.00	24716.00	3.19	4
9292	2	2005	2	0	31685.00	13616.00	2.33	4
9293	2	2005	2	1	39951.00	9980.00	4.00	4
9294	2	2005	2	2	71636.00	23596.00	3.04	4
9295	2	2006	1	0	24267.00	10142.00	2.39	4
9296	2	2006	1	1	38610.00	10492.00	3.68	4
9297	2	2006	1	2	62877.00	20634.00	3.05	4
9298	2	2006	2	0	29107.00	10478.00	2.78	4
9299	2	2006	2	1	44171.00	10864.00	4.07	4
9300	2	2006	2	2	73278.00	21342.00	3.43	4
9301	2	2007	1	0	22511.00	9596.00	2.35	4
9302	2	2007	1	1	36668.00	10442.00	3.51	4
9303	2	2007	1	2	59179.00	20038.00	2.95	4
9304	2	2007	2	0	40007.00	12799.00	3.13	4
9305	2	2007	2	1	42388.00	10245.00	4.14	4
9306	2	2007	2	2	82395.00	23044.00	3.58	4
9307	2	2008	1	0	17832.00	8201.00	2.17	4
9308	2	2008	1	1	27999.00	7812.00	3.58	4
9309	2	2008	1	2	45831.00	16013.00	2.86	4
9310	2	2008	2	0	37345.00	12596.00	2.96	4
9311	2	2008	2	1	46142.00	11842.00	3.90	4
9312	2	2008	2	2	83487.00	24438.00	3.42	4
9313	2	2009	1	0	22812.00	9991.00	2.28	4
9314	2	2009	1	1	23108.00	8084.00	2.86	4
9315	2	2009	1	2	45920.00	18075.00	2.54	4
9316	2	2009	2	0	44867.00	13676.00	3.28	4
9317	2	2009	2	1	49570.00	12904.00	3.84	4
9318	2	2009	2	2	94437.00	26580.00	3.55	4
9319	2	2010	1	0	17680.00	7496.00	2.36	4
9320	2	2010	1	1	27950.00	8193.00	3.41	4
9321	2	2010	1	2	45630.00	15689.00	2.91	4
9322	2	2010	2	0	24009.00	8810.00	2.73	4
9323	2	2010	2	1	33986.00	8774.00	3.87	4
9324	2	2010	2	2	57995.00	17584.00	3.30	4
9325	2	2011	1	0	28225.00	10975.00	2.57	4
9326	2	2011	1	1	30378.00	8698.00	3.49	4
9327	2	2011	1	2	58603.00	19673.00	2.98	4
9328	2	2011	2	0	31982.00	10097.00	3.17	4
9329	2	2011	2	1	36072.00	9475.00	3.81	4
9330	2	2011	2	2	68054.00	19572.00	3.48	4
9331	2	2012	1	0	26554.00	9912.00	2.68	4
9332	2	2012	1	1	31468.00	8373.00	3.76	4
9333	2	2012	1	2	58022.00	18285.00	3.17	4
9334	2	2012	2	0	32574.00	10856.00	3.00	4
9335	2	2012	2	1	39049.00	9754.00	4.00	4
9336	2	2012	2	2	71623.00	20610.00	3.48	4
9337	2	2013	1	0	24617.00	9643.00	2.55	4
9338	2	2013	1	1	33484.00	9215.00	3.63	4
9339	2	2013	1	2	58101.00	18858.00	3.08	4
9340	2	2013	2	0	36662.00	11906.00	3.08	4
9341	2	2013	2	1	40530.00	10245.00	3.96	4
9342	2	2013	2	2	77192.00	22151.00	3.48	4
9343	2	2014	1	0	21188.00	8607.00	2.46	4
9344	2	2014	1	1	24764.00	7212.00	3.43	4
9345	2	2014	1	2	45952.00	15819.00	2.90	4
9346	2	2014	2	0	25977.00	9380.00	2.77	4
9347	2	2014	2	1	32783.00	8830.00	3.71	4
9348	2	2014	2	2	58760.00	18210.00	3.23	4
9349	2	2015	1	0	20305.00	8342.00	2.43	4
9350	2	2015	1	1	24185.00	6767.00	3.57	4
9351	2	2015	1	2	44490.00	15109.00	2.94	4
9352	2	2015	2	0	26906.00	8824.00	3.05	4
9353	2	2015	2	1	34933.00	8525.00	4.10	4
9354	2	2015	2	2	61839.00	17349.00	3.56	4
9355	2	2016	1	0	18506.00	7996.00	2.31	4
9356	2	2016	1	1	25215.00	7791.00	3.24	4
9357	2	2016	1	2	43721.00	15787.00	2.77	4
9358	2	2016	2	0	25030.00	8524.00	2.94	4
9359	2	2016	2	1	32720.00	8485.00	3.86	4
9360	2	2016	2	2	57750.00	17009.00	3.40	4
9361	2	2017	1	0	21970.00	9108.00	2.41	4
9362	2	2017	1	1	34534.00	10233.00	3.37	4
9363	2	2017	1	2	56504.00	19341.00	2.92	4
9364	2	2017	2	0	28236.00	9644.00	2.93	4
9365	2	2017	2	1	37057.00	9847.00	3.76	4
9366	2	2017	2	2	65293.00	19491.00	3.35	4
9367	2	2018	1	0	21447.00	9158.00	2.34	4
9368	2	2018	1	1	33682.00	10076.00	3.34	4
9369	2	2018	1	2	55129.00	19234.00	2.87	4
9370	2	2018	2	0	22955.50	8671.00	2.65	4
9371	2	2018	2	1	28523.30	8533.00	3.34	4
9372	2	2018	2	2	51478.80	17204.00	2.99	4
9373	2	2019	1	0	20932.00	9111.00	2.30	4
9374	2	2019	1	1	24205.00	8268.00	2.93	4
9375	2	2019	1	2	45137.00	17379.00	2.60	4
9376	2	2019	2	0	21818.80	8632.00	2.53	4
9377	2	2019	2	1	27206.78	7769.00	3.50	4
9378	2	2019	2	2	49025.58	16401.00	2.99	4
9379	2	2020	1	0	19996.64	8431.00	2.37	4
9380	2	2020	1	1	32227.21	9901.00	3.25	4
9381	2	2020	1	2	52223.85	18332.00	2.85	4
9382	2	2020	2	0	33300.94	10384.00	3.21	4
9383	2	2020	2	1	36782.40	9687.00	3.80	4
9384	2	2020	2	2	70083.34	20071.00	3.49	4
9385	2	1987	1	0	6655.00	4880.00	1.36	40
9386	2	1987	1	1	1470.00	860.00	1.71	40
9387	2	1987	1	2	8125.00	5740.00	1.42	40
9388	2	1987	2	0	2127.00	3280.00	0.65	40
9389	2	1987	2	1	1005.00	540.00	1.86	40
9390	2	1987	2	2	3132.00	3820.00	0.82	40
9391	2	1988	1	0	3340.00	2890.00	1.16	40
9392	2	1988	1	1	1489.00	890.00	1.67	40
9393	2	1988	1	2	4829.00	3780.00	1.28	40
9394	2	1988	2	0	5792.00	4230.00	1.37	40
9395	2	1988	2	1	1340.00	590.00	2.27	40
9396	2	1988	2	2	7132.00	4820.00	1.48	40
9397	2	1989	1	0	5983.00	4240.00	1.41	40
9398	2	1989	1	1	1898.00	850.00	2.23	40
9399	2	1989	1	2	7881.00	5090.00	1.55	40
9400	2	1989	2	0	2703.00	1960.00	1.38	40
9401	2	1989	2	1	1667.00	680.00	2.45	40
9402	2	1989	2	2	4370.00	2640.00	1.66	40
9403	2	1990	1	0	4924.00	5390.00	0.91	40
9404	2	1990	1	1	1721.00	670.00	2.57	40
9405	2	1990	1	2	6645.00	6060.00	1.10	40
9406	2	1990	2	0	9290.00	6220.00	1.49	40
9407	2	1990	2	1	1213.00	500.00	2.43	40
9408	2	1990	2	2	10503.00	6720.00	1.56	40
9409	2	1991	1	0	7606.00	5940.00	1.28	40
9410	2	1991	1	1	1773.00	670.00	2.65	40
9411	2	1991	1	2	9379.00	6610.00	1.42	40
9412	2	1991	2	0	6922.00	5830.00	1.19	40
9413	2	1991	2	1	1953.00	850.00	2.30	40
9414	2	1991	2	2	8875.00	6680.00	1.33	40
9415	2	1992	1	0	4729.00	4120.00	1.15	40
9416	2	1992	1	1	1839.00	780.00	2.36	40
9417	2	1992	1	2	6568.00	4900.00	1.34	40
9418	2	1992	2	0	6945.00	5220.00	1.33	40
9419	2	1992	2	1	1914.00	810.00	2.36	40
9420	2	1992	2	2	8859.00	6030.00	1.47	40
9421	2	1993	1	0	5783.00	4590.00	1.26	40
9422	2	1993	1	1	2363.00	790.00	2.99	40
9423	2	1993	1	2	8146.00	5380.00	1.51	40
9424	2	1993	2	0	8171.00	6480.00	1.26	40
9425	2	1993	2	1	1875.00	700.00	2.68	40
9426	2	1993	2	2	10046.00	7180.00	1.40	40
9427	2	1994	1	0	6279.00	3960.00	1.59	40
9428	2	1994	1	1	2240.00	770.00	2.91	40
9429	2	1994	1	2	8519.00	4730.00	1.80	40
9430	2	1994	2	0	7902.00	7400.00	1.07	40
9431	2	1994	2	1	2065.00	840.00	2.46	40
9432	2	1994	2	2	9967.00	8240.00	1.21	40
9433	2	1995	1	0	4406.00	5610.00	0.79	40
9434	2	1995	1	1	2040.00	1360.00	1.50	40
9435	2	1995	1	2	6446.00	6970.00	0.92	40
9437	2	1995	2	1	2593.00	1430.00	1.81	40
9438	2	1995	2	2	10639.00	11320.00	0.94	40
9439	2	1996	1	0	9611.00	6919.00	1.39	40
9440	2	1996	1	1	3764.00	1535.00	2.45	40
9441	2	1996	1	2	13375.00	8454.00	1.58	40
9442	2	1996	2	0	8805.00	8427.00	1.04	40
9443	2	1996	2	1	2634.00	1268.00	2.08	40
9444	2	1996	2	2	11439.00	9695.00	1.18	40
9445	2	1997	1	0	4919.00	6218.00	0.79	40
9446	2	1997	1	1	2672.00	1530.00	1.75	40
9447	2	1997	1	2	7591.00	7748.00	0.98	40
9448	2	1997	2	0	3414.00	2909.00	1.17	40
9449	2	1997	2	1	3279.00	1580.00	2.08	40
9450	2	1997	2	2	6693.00	4489.00	1.49	40
9451	2	1998	1	0	4585.00	4162.00	1.10	40
9452	2	1998	1	1	3254.00	1425.00	2.28	40
9453	2	1998	1	2	7839.00	5587.00	1.40	40
9454	2	1998	2	0	6946.00	6140.00	1.13	40
9455	2	1998	2	1	4364.00	1900.00	2.30	40
9456	2	1998	2	2	11310.00	8040.00	1.41	40
9457	2	1999	1	0	13160.00	6176.00	2.13	40
9458	2	1999	1	1	4764.00	1580.00	3.02	40
9459	2	1999	1	2	17924.00	7756.00	2.31	40
9460	2	1999	2	0	14086.00	6779.00	2.08	40
9461	2	1999	2	1	5715.00	1800.00	3.18	40
9462	2	1999	2	2	19801.00	8579.00	2.31	40
9463	2	2000	1	0	12261.00	5876.00	2.09	40
9464	2	2000	1	1	5017.00	1610.00	3.12	40
9465	2	2000	1	2	17278.00	7486.00	2.31	40
9466	2	2000	2	0	14400.00	6964.00	2.07	40
9467	2	2000	2	1	6210.00	1972.00	3.15	40
9468	2	2000	2	2	20610.00	8936.00	2.31	40
9469	2	2001	1	0	14426.00	6000.00	2.40	40
9470	2	2001	1	1	5190.00	1600.00	3.24	40
9471	2	2001	1	2	19616.00	7600.00	2.58	40
9472	2	2001	2	0	16267.00	6868.00	2.37	40
9473	2	2001	2	1	6817.00	1952.00	3.49	40
9474	2	2001	2	2	23084.00	8820.00	2.62	40
9475	2	2002	1	0	15570.00	6062.00	2.57	40
9476	2	2002	1	1	5165.00	1564.00	3.30	40
9477	2	2002	1	2	20735.00	7626.00	2.72	40
9478	2	2002	2	0	15794.00	6863.00	2.30	40
9479	2	2002	2	1	6651.00	1930.00	3.45	40
9480	2	2002	2	2	22445.00	8793.00	2.55	40
9481	2	2003	1	0	12729.00	5786.00	2.20	40
9482	2	2003	1	1	4960.00	1550.00	3.20	40
9483	2	2003	1	2	17689.00	7336.00	2.41	40
9484	2	2003	2	0	15844.00	6861.00	2.31	40
9485	2	2003	2	1	6639.00	1988.00	3.34	40
9486	2	2003	2	2	22483.00	8849.00	2.54	40
9487	2	2004	1	0	13814.00	5913.00	2.34	40
9488	2	2004	1	1	5297.00	1579.00	3.35	40
9489	2	2004	1	2	19111.00	7492.00	2.55	40
9490	2	2004	2	0	9375.00	3978.00	2.36	40
9491	2	2004	2	1	6624.00	1944.00	3.41	40
9492	2	2004	2	2	15999.00	5922.00	2.70	40
9493	2	2005	1	0	12956.00	5572.00	2.33	40
9494	2	2005	1	1	5366.00	1592.00	3.37	40
9495	2	2005	1	2	18322.00	7164.00	2.56	40
9496	2	2005	2	0	6796.00	2904.00	2.34	40
9497	2	2005	2	1	5144.00	1500.00	3.43	40
9498	2	2005	2	2	11940.00	4404.00	2.71	40
9499	2	2006	1	0	9935.00	4199.00	2.37	40
9500	2	2006	1	1	5425.00	1599.00	3.39	40
9501	2	2006	1	2	15360.00	5798.00	2.65	40
9502	2	2006	2	0	9428.00	4052.00	2.33	40
9503	2	2006	2	1	6156.00	1810.00	3.40	40
9504	2	2006	2	2	15584.00	5862.00	2.66	40
9505	2	2007	1	0	9102.00	3796.00	2.40	40
9506	2	2007	1	1	5500.00	1614.00	3.41	40
9507	2	2007	1	2	14602.00	5410.00	2.70	40
9508	2	2007	2	0	8874.00	3415.00	2.60	40
9509	2	2007	2	1	5937.00	1730.00	3.43	40
9510	2	2007	2	2	14811.00	5145.00	2.88	40
9511	2	2008	1	0	6037.00	2488.00	2.43	40
9512	2	2008	1	1	5509.00	1616.00	3.41	40
9513	2	2008	1	2	11546.00	4104.00	2.81	40
9514	2	2008	2	0	8377.00	3314.00	2.53	40
9515	2	2008	2	1	5413.00	1718.00	3.15	40
9516	2	2008	2	2	13790.00	5032.00	2.74	40
9517	2	2009	1	0	6110.00	2497.00	2.45	40
9518	2	2009	1	1	5028.00	1625.00	3.09	40
9519	2	2009	1	2	11138.00	4122.00	2.70	40
9520	2	2009	2	0	7488.00	2898.00	2.58	40
9521	2	2009	2	1	6095.00	1786.00	3.41	40
9522	2	2009	2	2	13583.00	4684.00	2.90	40
9523	2	2010	1	0	5724.00	2348.00	2.44	40
9524	2	2010	1	1	5009.00	1524.00	3.29	40
9525	2	2010	1	2	10733.00	3872.00	2.77	40
9526	2	2010	2	0	7195.00	2764.00	2.60	40
9527	2	2010	2	1	3525.00	1098.00	3.21	40
9528	2	2010	2	2	10720.00	3862.00	2.78	40
9529	2	2011	1	0	5979.00	2467.00	2.42	40
9530	2	2011	1	1	5567.00	1640.00	3.39	40
9531	2	2011	1	2	11546.00	4107.00	2.81	40
9532	2	2011	2	0	8940.00	3413.00	2.62	40
9533	2	2011	2	1	4168.00	1148.00	3.63	40
9534	2	2011	2	2	13108.00	4561.00	2.87	40
9535	2	2012	1	0	5802.00	2435.00	2.38	40
9536	2	2012	1	1	5079.00	1588.00	3.20	40
9537	2	2012	1	2	10881.00	4023.00	2.70	40
9538	2	2012	2	0	4565.00	1832.00	2.49	40
9539	2	2012	2	1	2311.00	737.00	3.14	40
9540	2	2012	2	2	6876.00	2569.00	2.68	40
9541	2	2013	1	0	3137.00	1509.00	2.08	40
9542	2	2013	1	1	3205.00	1225.00	2.62	40
9543	2	2013	1	2	6342.00	2734.00	2.32	40
9544	2	2013	2	0	6129.00	2336.00	2.62	40
9545	2	2013	2	1	4893.00	1439.00	3.40	40
9546	2	2013	2	2	11022.00	3775.00	2.92	40
9547	2	2014	1	0	3144.00	1532.00	2.05	40
9548	2	2014	1	1	3230.00	1242.00	2.60	40
9549	2	2014	1	2	6374.00	2774.00	2.30	40
9550	2	2014	2	0	4719.00	1842.00	2.56	40
9551	2	2014	2	1	3976.00	1178.00	3.38	40
9552	2	2014	2	2	8695.00	3020.00	2.88	40
9553	2	2015	1	0	4048.00	1837.00	2.20	40
9554	2	2015	1	1	4373.00	1371.00	3.19	40
9555	2	2015	1	2	8421.00	3208.00	2.63	40
9556	2	2015	2	0	4333.00	1723.00	2.51	40
9557	2	2015	2	1	3135.00	937.00	3.35	40
9558	2	2015	2	2	7468.00	2660.00	2.81	40
9559	2	2016	1	0	2799.00	1238.00	2.26	40
9560	2	2016	1	1	4106.00	1268.00	3.24	40
9561	2	2016	1	2	6905.00	2506.00	2.76	40
9562	2	2016	2	0	5043.00	1957.00	2.58	40
9563	2	2016	2	1	4090.00	1202.00	3.40	40
9564	2	2016	2	2	9133.00	3159.00	2.89	40
9565	2	2017	1	0	3385.00	1541.00	2.20	40
9566	2	2017	1	1	4179.00	1308.00	3.19	40
9567	2	2017	1	2	7564.00	2849.00	2.65	40
9568	2	2017	2	0	6256.00	2270.00	2.76	40
9569	2	2017	2	1	8112.00	2175.00	3.73	40
9570	2	2017	2	2	14368.00	4445.00	3.23	40
9571	2	2018	1	0	5760.00	2448.00	2.35	40
9572	2	2018	1	1	5334.00	1539.00	3.47	40
9573	2	2018	1	2	11094.00	3987.00	2.78	40
9574	2	2018	2	0	2236.00	957.00	2.34	40
9575	2	2018	2	1	3771.00	1130.00	3.34	40
9576	2	2018	2	2	6007.00	2087.00	2.88	40
9577	2	2019	1	0	2299.00	1060.00	2.17	40
9578	2	2019	1	1	4960.00	1585.00	3.13	40
9579	2	2019	1	2	7259.00	2645.00	2.74	40
9580	2	2019	2	0	1542.00	694.52	2.22	40
9581	2	2019	2	1	2725.00	851.00	3.20	40
9582	2	2019	2	2	4267.00	1545.52	2.76	40
9583	2	2020	1	0	3749.00	1643.00	2.28	40
9584	2	2020	1	1	6008.00	1757.00	3.42	40
9585	2	2020	1	2	9757.00	3400.00	2.87	40
9586	2	2020	2	0	3309.00	1346.00	2.46	40
9587	2	2020	2	1	5207.00	1510.00	3.45	40
9588	2	2020	2	2	8516.00	2856.00	2.98	40
9589	2	1987	1	0	13600.00	19310.00	0.70	41
9590	2	1987	1	1	1795.00	1110.00	1.62	41
9591	2	1987	1	2	15395.00	20420.00	0.75	41
9592	2	1987	2	0	38517.00	36630.00	1.05	41
9593	2	1987	2	1	5036.00	2060.00	2.44	41
9594	2	1987	2	2	43553.00	38690.00	1.13	41
9595	2	1988	1	0	17302.00	20410.00	0.85	41
9596	2	1988	1	1	3064.00	1750.00	1.75	41
9597	2	1988	1	2	20366.00	22160.00	0.92	41
9598	2	1988	2	0	49023.00	37090.00	1.32	41
9599	2	1988	2	1	3241.00	1680.00	1.93	41
9600	2	1988	2	2	52264.00	38770.00	1.35	41
9601	2	1989	1	0	19513.00	15430.00	1.26	41
9602	2	1989	1	1	1915.00	890.00	2.15	41
9603	2	1989	1	2	21428.00	16320.00	1.31	41
9604	2	1989	2	0	42758.00	35640.00	1.20	41
9605	2	1989	2	1	2706.00	1010.00	2.68	41
9606	2	1989	2	2	45464.00	36650.00	1.24	41
9607	2	1990	1	0	12713.00	10480.00	1.21	41
9608	2	1990	1	1	4113.00	1670.00	2.46	41
9609	2	1990	1	2	16826.00	12150.00	1.38	41
9610	2	1990	2	0	25186.00	20880.00	1.21	41
9611	2	1990	2	1	6090.00	1830.00	3.33	41
9612	2	1990	2	2	31276.00	22710.00	1.38	41
9613	2	1991	1	0	19320.00	15010.00	1.29	41
9614	2	1991	1	1	4235.00	1690.00	2.51	41
9615	2	1991	1	2	23555.00	16700.00	1.41	41
9616	2	1991	2	0	25380.00	20290.00	1.25	41
9617	2	1991	2	1	4205.00	1630.00	2.58	41
9618	2	1991	2	2	29585.00	21920.00	1.35	41
9619	2	1992	1	0	15150.00	15600.00	0.97	41
9620	2	1992	1	1	3375.00	1670.00	2.02	41
9621	2	1992	1	2	18525.00	17270.00	1.07	41
9622	2	1992	2	0	26325.00	21720.00	1.21	41
9623	2	1992	2	1	5020.00	2300.00	2.18	41
9624	2	1992	2	2	31345.00	24020.00	1.30	41
9625	2	1993	1	0	15040.00	14260.00	1.05	41
9626	2	1993	1	1	4300.00	1940.00	2.22	41
9627	2	1993	1	2	19340.00	16200.00	1.19	41
9628	2	1993	2	0	22750.00	18260.00	1.25	41
9629	2	1993	2	1	5360.00	2740.00	1.96	41
9630	2	1993	2	2	28110.00	21000.00	1.34	41
9631	2	1994	1	0	9550.00	9370.00	1.02	41
9632	2	1994	1	1	3780.00	1390.00	2.72	41
9633	2	1994	1	2	13330.00	10760.00	1.24	41
9634	2	1994	2	0	48770.00	33610.00	1.45	41
9635	2	1994	2	1	5860.00	1780.00	3.29	41
9636	2	1994	2	2	54630.00	35390.00	1.54	41
9637	2	1995	1	0	10238.00	7280.00	1.41	41
9638	2	1995	1	1	2993.00	1390.00	2.15	41
9639	2	1995	1	2	13231.00	8670.00	1.53	41
9640	2	1995	2	0	43011.00	32810.00	1.31	41
9641	2	1995	2	1	4212.00	1720.00	2.45	41
9642	2	1995	2	2	47223.00	34530.00	1.37	41
9643	2	1996	1	0	10695.00	8130.00	1.32	41
9644	2	1996	1	1	2863.00	1170.00	2.45	41
9645	2	1996	1	2	13558.00	9300.00	1.46	41
9646	2	1996	2	0	44613.00	33290.00	1.34	41
9647	2	1996	2	1	5750.00	1960.00	2.93	41
9648	2	1996	2	2	50363.00	35250.00	1.43	41
9649	2	1997	1	0	13387.00	9230.00	1.45	41
9650	2	1997	1	1	3438.00	1260.00	2.73	41
9651	2	1997	1	2	16825.00	10490.00	1.60	41
9652	2	1997	2	0	45695.00	33580.00	1.36	41
9653	2	1997	2	1	4433.00	1670.00	2.65	41
9654	2	1997	2	2	50128.00	35250.00	1.42	41
9655	2	1998	1	0	2090.00	1670.00	1.25	41
9656	2	1998	1	1	4290.00	1950.00	2.20	41
9657	2	1998	1	2	6380.00	3620.00	1.76	41
9658	2	1998	2	0	45400.00	34300.00	1.32	41
9659	2	1998	2	1	3863.00	1470.00	2.63	41
9660	2	1998	2	2	49263.00	35770.00	1.38	41
9661	2	1999	1	0	3832.00	2210.00	1.73	41
9662	2	1999	1	1	5034.00	1960.00	2.57	41
9663	2	1999	1	2	8866.00	4170.00	2.13	41
9664	2	1999	2	0	54741.00	33950.00	1.61	41
9665	2	1999	2	1	3897.00	1540.00	2.53	41
9666	2	1999	2	2	58638.00	35490.00	1.65	41
9667	2	2000	1	0	5113.00	3260.00	1.57	41
9668	2	2000	1	1	5103.00	1970.00	2.59	41
9669	2	2000	1	2	10216.00	5230.00	1.95	41
9670	2	2000	2	0	58445.00	33520.00	1.74	41
9671	2	2000	2	1	4170.00	1580.00	2.64	41
9672	2	2000	2	2	62615.00	35100.00	1.78	41
9673	2	2001	1	0	4462.00	2710.00	1.65	41
9674	2	2001	1	1	4812.00	1960.00	2.46	41
9675	2	2001	1	2	9274.00	4670.00	1.99	41
9676	2	2001	2	0	60085.00	36050.00	1.67	41
9677	2	2001	2	1	4708.00	1580.00	2.98	41
9678	2	2001	2	2	64793.00	37630.00	1.72	41
9679	2	2002	1	0	4125.00	2467.00	1.67	41
9680	2	2002	1	1	4971.00	1960.00	2.54	41
9681	2	2002	1	2	9096.00	4427.00	2.05	41
9682	2	2002	2	0	55186.00	33553.00	1.64	41
9683	2	2002	2	1	3957.00	1330.00	2.98	41
9684	2	2002	2	2	59143.00	34883.00	1.70	41
9685	2	2003	1	0	4483.00	2697.00	1.66	41
9686	2	2003	1	1	4967.00	1960.00	2.53	41
9687	2	2003	1	2	9450.00	4657.00	2.03	41
9688	2	2003	2	0	69937.00	38095.00	1.84	41
9689	2	2003	2	1	3982.00	1337.00	2.98	41
9690	2	2003	2	2	73919.00	39432.00	1.87	41
9691	2	2004	1	0	10084.00	5455.00	1.85	41
9692	2	2004	1	1	4935.00	1970.00	2.51	41
9693	2	2004	1	2	15019.00	7425.00	2.02	41
9694	2	2004	2	0	73789.00	37047.00	1.99	41
9695	2	2004	2	1	4221.00	1417.00	2.98	41
9696	2	2004	2	2	78010.00	38464.00	2.03	41
9697	2	2005	1	0	15138.00	7835.00	1.93	41
9698	2	2005	1	1	5698.00	1970.00	2.89	41
9699	2	2005	1	2	20836.00	9805.00	2.13	41
9700	2	2005	2	0	56170.00	34647.00	1.62	41
9701	2	2005	2	1	4106.00	1486.00	2.76	41
9702	2	2005	2	2	60276.00	36133.00	1.67	41
9703	2	2006	1	0	19467.00	10248.00	1.90	41
9704	2	2006	1	1	5601.00	1971.00	2.84	41
9705	2	2006	1	2	25068.00	12219.00	2.05	41
9706	2	2006	2	0	45826.00	22200.00	2.06	41
9707	2	2006	2	1	6647.00	2296.00	2.90	41
9708	2	2006	2	2	52473.00	24496.00	2.14	41
9709	2	2007	1	0	23265.00	12450.00	1.87	41
9710	2	2007	1	1	10530.00	3500.00	3.01	41
9711	2	2007	1	2	33795.00	15950.00	2.12	41
9712	2	2007	2	0	34182.00	17300.00	1.98	41
9713	2	2007	2	1	7541.00	2400.00	3.14	41
9714	2	2007	2	2	41723.00	19700.00	2.12	41
9715	2	2008	1	0	26587.00	11406.00	2.33	41
9716	2	2008	1	1	19983.00	5554.00	3.60	41
9717	2	2008	1	2	46570.00	16960.00	2.75	41
9718	2	2008	2	0	43785.00	19125.00	2.29	41
9719	2	2008	2	1	7584.00	2400.00	3.16	41
9720	2	2008	2	2	51369.00	21525.00	2.39	41
9721	2	2009	1	0	39735.00	15005.00	2.65	41
9722	2	2009	1	1	12379.00	4035.00	3.07	41
9723	2	2009	1	2	52114.00	19040.00	2.74	41
9724	2	2009	2	0	46936.00	16987.00	2.76	41
9725	2	2009	2	1	9992.00	3121.00	3.20	41
9726	2	2009	2	2	56928.00	20108.00	2.83	41
9727	2	2010	1	0	31702.00	12807.00	2.48	41
9728	2	2010	1	1	13624.00	4973.00	2.74	41
9729	2	2010	1	2	45326.00	17780.00	2.55	41
9730	2	2010	2	0	56977.00	20796.00	2.74	41
9731	2	2010	2	1	10306.00	3271.00	3.15	41
9732	2	2010	2	2	67283.00	24067.00	2.80	41
9733	2	2011	1	0	38464.00	14416.00	2.67	41
9734	2	2011	1	1	16456.00	5695.00	2.89	41
9735	2	2011	1	2	54920.00	20111.00	2.73	41
9736	2	2011	2	0	48759.00	17939.00	2.72	41
9737	2	2011	2	1	9762.00	3041.00	3.21	41
9738	2	2011	2	2	58521.00	20980.00	2.79	41
9739	2	2012	1	0	51580.00	18572.00	2.78	41
9740	2	2012	1	1	24299.00	6911.00	3.52	41
9741	2	2012	1	2	75879.00	25483.00	2.98	41
9742	2	2012	2	0	57470.00	19915.00	2.89	41
9743	2	2012	2	1	21114.00	6409.00	3.29	41
9744	2	2012	2	2	78584.00	26324.00	2.99	41
9745	2	2013	1	0	60157.00	21278.00	2.83	41
9746	2	2013	1	1	28449.00	8488.00	3.35	41
9747	2	2013	1	2	88606.00	29766.00	2.98	41
9748	2	2013	2	0	56577.00	20627.00	2.74	41
9749	2	2013	2	1	23470.00	7008.00	3.35	41
9750	2	2013	2	2	80047.00	27635.00	2.90	41
9751	2	2014	1	0	63196.00	21472.00	2.94	41
9752	2	2014	1	1	29291.00	8577.00	3.42	41
9753	2	2014	1	2	92487.00	30049.00	3.08	41
9754	2	2014	2	0	63590.00	20617.00	3.08	41
9755	2	2014	2	1	24096.00	6775.00	3.56	41
9756	2	2014	2	2	87686.00	27392.00	3.20	41
9757	2	2015	1	0	55411.00	20676.00	2.68	41
9758	2	2015	1	1	25793.00	7402.00	3.48	41
9759	2	2015	1	2	81204.00	28078.00	2.89	41
9760	2	2015	2	0	49843.00	18907.00	2.64	41
9761	2	2015	2	1	16707.00	5054.00	3.31	41
9762	2	2015	2	2	66550.00	23961.00	2.78	41
9763	2	2016	1	0	54596.00	20919.00	2.61	41
9764	2	2016	1	1	23234.00	6850.00	3.39	41
9765	2	2016	1	2	77830.00	27769.00	2.80	41
9766	2	2016	2	0	55195.00	19537.00	2.83	41
9767	2	2016	2	1	16846.00	4958.00	3.40	41
9768	2	2016	2	2	72041.00	24495.00	2.94	41
9769	2	2017	1	0	58083.00	21022.00	2.76	41
9770	2	2017	1	1	26542.00	7610.00	3.49	41
9771	2	2017	1	2	84625.00	28632.00	2.96	41
9772	2	2017	2	0	55953.00	19417.00	2.88	41
9773	2	2017	2	1	18254.00	5184.00	3.52	41
9774	2	2017	2	2	74207.00	24601.00	3.02	41
9775	2	2018	1	0	55606.00	20785.00	2.68	41
9776	2	2018	1	1	25241.00	7272.00	3.47	41
9777	2	2018	1	2	80847.00	28057.00	2.88	41
9778	2	2018	2	0	57521.00	19287.00	2.98	41
9779	2	2018	2	1	17664.00	5066.00	3.49	41
9780	2	2018	2	2	75185.00	24353.00	3.09	41
9781	2	2019	1	0	52534.33	20782.00	2.53	41
9782	2	2019	1	1	24032.00	7215.00	3.33	41
9783	2	2019	1	2	76566.33	27997.00	2.73	41
9784	2	2019	2	0	54443.98	19176.00	2.84	41
9785	2	2019	2	1	16649.26	5074.00	3.28	41
9786	2	2019	2	2	71093.24	24250.00	2.93	41
9787	2	2020	1	0	52603.00	20863.00	2.52	41
9788	2	2020	1	1	24799.00	7366.00	3.37	41
9789	2	2020	1	2	77402.00	28229.00	2.74	41
9790	2	2020	2	0	53818.01	19324.00	2.79	41
9791	2	2020	2	1	16790.00	5108.00	3.29	41
9792	2	2020	2	2	70608.01	24432.00	2.89	41
9793	2	1987	1	0	2285.00	810.00	2.82	42
9794	2	1987	1	1	13105.00	4110.00	3.19	42
9795	2	1987	1	2	15390.00	4920.00	3.13	42
9796	2	1987	2	0	2293.00	750.00	3.06	42
9797	2	1987	2	1	13761.00	4090.00	3.36	42
9798	2	1987	2	2	16054.00	4840.00	3.32	42
9799	2	1988	1	0	562.00	290.00	1.94	42
9800	2	1988	1	1	13325.00	4470.00	2.98	42
9801	2	1988	1	2	13887.00	4760.00	2.92	42
9802	2	1988	2	0	598.00	340.00	1.76	42
9803	2	1988	2	1	16620.00	4980.00	3.34	42
9804	2	1988	2	2	17218.00	5320.00	3.24	42
9805	2	1989	1	0	58.00	30.00	1.93	42
9806	2	1989	1	1	14842.00	5690.00	2.61	42
9807	2	1989	1	2	14900.00	5720.00	2.60	42
9808	2	1989	2	0	479.00	340.00	1.41	42
9809	2	1989	2	1	16329.00	4590.00	3.56	42
9810	2	1989	2	2	16808.00	4930.00	3.41	42
9811	2	1990	1	0	\N	\N	\N	42
9812	2	1990	1	1	13299.00	4630.00	2.87	42
9813	2	1990	1	2	13299.00	4630.00	2.87	42
9814	2	1990	2	0	994.00	520.00	1.91	42
9815	2	1990	2	1	13457.00	3520.00	3.82	42
9816	2	1990	2	2	14451.00	4040.00	3.58	42
9817	2	1991	1	0	76.00	50.00	1.52	42
9818	2	1991	1	1	15333.00	4930.00	3.11	42
9819	2	1991	1	2	15409.00	4980.00	3.09	42
9820	2	1991	2	0	471.00	380.00	1.24	42
9821	2	1991	2	1	15138.00	4190.00	3.61	42
9822	2	1991	2	2	15609.00	4570.00	3.42	42
9823	2	1992	1	0	29.00	30.00	0.97	42
9824	2	1992	1	1	13685.00	3890.00	3.52	42
9825	2	1992	1	2	13714.00	3920.00	3.50	42
9826	2	1992	2	0	96.00	100.00	0.96	42
9827	2	1992	2	1	14155.00	3640.00	3.89	42
9828	2	1992	2	2	14251.00	3740.00	3.81	42
9829	2	1993	1	0	\N	\N	\N	42
9830	2	1993	1	1	13482.00	4010.00	3.36	42
9831	2	1993	1	2	13482.00	4010.00	3.36	42
9832	2	1993	2	0	742.00	840.00	0.88	42
9833	2	1993	2	1	12201.00	3560.00	3.43	42
9834	2	1993	2	2	12943.00	4400.00	2.94	42
9835	2	1994	1	0	141.00	150.00	0.94	42
9836	2	1994	1	1	21773.00	6310.00	3.45	42
9837	2	1994	1	2	21914.00	6460.00	3.39	42
9838	2	1994	2	0	1357.00	620.00	2.19	42
9839	2	1994	2	1	24760.00	6610.00	3.75	42
9840	2	1994	2	2	26117.00	7230.00	3.61	42
9841	2	1995	1	0	1094.00	636.00	1.72	42
9842	2	1995	1	1	29235.00	7773.00	3.76	42
9843	2	1995	1	2	30329.00	8409.00	3.61	42
9844	2	1995	2	0	1375.00	769.00	1.79	42
9845	2	1995	2	1	24394.00	8715.00	2.80	42
9846	2	1995	2	2	25769.00	9484.00	2.72	42
9847	2	1996	1	0	746.00	398.00	1.87	42
9848	2	1996	1	1	27900.00	7648.00	3.65	42
9849	2	1996	1	2	28646.00	8046.00	3.56	42
9850	2	1996	2	0	1879.00	986.00	1.91	42
9851	2	1996	2	1	28292.00	8570.00	3.30	42
9852	2	1996	2	2	30171.00	9556.00	3.16	42
9853	2	1997	1	0	808.00	447.00	1.81	42
9854	2	1997	1	1	26897.00	8126.00	3.31	42
9855	2	1997	1	2	27705.00	8573.00	3.23	42
9856	2	1997	2	0	1090.00	560.00	1.95	42
9857	2	1997	2	1	21800.00	7900.00	2.76	42
9858	2	1997	2	2	22890.00	8460.00	2.71	42
9859	2	1998	1	0	400.00	200.00	2.00	42
9860	2	1998	1	1	24615.00	8205.00	3.00	42
9861	2	1998	1	2	25015.00	8405.00	2.98	42
9862	2	1998	2	0	280.00	350.00	0.80	42
9863	2	1998	2	1	21189.00	7700.00	2.75	42
9864	2	1998	2	2	21469.00	8050.00	2.67	42
9865	2	1999	1	0	160.00	80.00	2.00	42
9866	2	1999	1	1	19275.00	7270.00	2.65	42
9867	2	1999	1	2	19435.00	7350.00	2.64	42
9868	2	1999	2	0	596.00	298.00	2.00	42
9869	2	1999	2	1	33902.00	10572.00	3.21	42
9870	2	1999	2	2	34498.00	10870.00	3.17	42
9871	2	2000	1	0	490.00	245.00	2.00	42
9872	2	2000	1	1	19275.00	7114.00	2.71	42
9873	2	2000	1	2	19765.00	7359.00	2.69	42
9874	2	2000	2	0	521.00	347.00	1.50	42
9875	2	2000	2	1	39448.00	10556.00	3.74	42
9876	2	2000	2	2	39969.00	10903.00	3.67	42
9877	2	2001	1	0	335.00	223.00	1.50	42
9878	2	2001	1	1	27131.00	7830.00	3.47	42
9879	2	2001	1	2	27466.00	8053.00	3.41	42
9880	2	2001	2	0	450.00	300.00	1.50	42
9881	2	2001	2	1	32920.00	9444.00	3.49	42
9882	2	2001	2	2	33370.00	9744.00	3.42	42
9883	2	2002	1	0	480.00	300.00	1.60	42
9884	2	2002	1	1	26246.00	7270.00	3.61	42
9885	2	2002	1	2	26726.00	7570.00	3.53	42
9886	2	2002	2	0	1512.00	720.00	2.10	42
9887	2	2002	2	1	24143.00	7284.00	3.31	42
9888	2	2002	2	2	25655.00	8004.00	3.21	42
9889	2	2003	1	0	\N	\N	\N	42
9890	2	2003	1	1	26808.00	8985.00	2.98	42
9891	2	2003	1	2	26808.00	8985.00	2.98	42
9892	2	2003	2	0	1120.00	560.00	2.00	42
9893	2	2003	2	1	23489.00	6297.00	3.73	42
9894	2	2003	2	2	24609.00	6857.00	3.59	42
9895	2	2004	1	0	80.00	50.00	1.60	42
9896	2	2004	1	1	30736.00	8838.00	3.48	42
9897	2	2004	1	2	30816.00	8888.00	3.47	42
9898	2	2004	2	0	1500.00	600.00	2.50	42
9899	2	2004	2	1	25468.00	6297.00	4.04	42
9900	2	2004	2	2	26968.00	6897.00	3.91	42
9901	2	2005	1	0	250.00	100.00	2.50	42
9902	2	2005	1	1	30269.00	8408.00	3.60	42
9903	2	2005	1	2	30519.00	8508.00	3.59	42
9904	2	2005	2	0	1575.00	630.00	2.50	42
9905	2	2005	2	1	26598.00	6508.00	4.09	42
9906	2	2005	2	2	28173.00	7138.00	3.95	42
9907	2	2006	1	0	273.00	105.00	2.60	42
9908	2	2006	1	1	31445.00	8385.00	3.75	42
9909	2	2006	1	2	31718.00	8490.00	3.74	42
9910	2	2006	2	0	1580.00	632.00	2.50	42
9911	2	2006	2	1	27815.00	6508.00	4.27	42
9912	2	2006	2	2	29395.00	7140.00	4.12	42
9913	2	2007	1	0	299.00	115.00	2.60	42
9914	2	2007	1	1	33402.00	8598.00	3.88	42
9915	2	2007	1	2	33701.00	8713.00	3.87	42
9916	2	2007	2	0	2500.00	632.00	3.96	42
9917	2	2007	2	1	27223.00	6446.00	4.22	42
9918	2	2007	2	2	29723.00	7078.00	4.20	42
9919	2	2008	1	0	970.00	316.00	3.07	42
9920	2	2008	1	1	32822.00	7932.00	4.14	42
9921	2	2008	1	2	33792.00	8248.00	4.10	42
9922	2	2008	2	0	3268.00	979.00	3.34	42
9923	2	2008	2	1	35369.00	8214.00	4.31	42
9924	2	2008	2	2	38637.00	9193.00	4.20	42
9925	2	2009	1	0	986.00	313.00	3.15	42
9926	2	2009	1	1	30652.00	7471.00	4.10	42
9927	2	2009	1	2	31638.00	7784.00	4.06	42
9928	2	2009	2	0	3096.00	959.00	3.23	42
9929	2	2009	2	1	39487.00	9050.00	4.36	42
9930	2	2009	2	2	42583.00	10009.00	4.25	42
9931	2	2010	1	0	1087.00	353.00	3.08	42
9932	2	2010	1	1	31481.00	7459.00	4.22	42
9933	2	2010	1	2	32568.00	7812.00	4.17	42
9934	2	2010	2	0	3725.00	1080.00	3.45	42
9935	2	2010	2	1	40787.00	9221.00	4.42	42
9936	2	2010	2	2	44512.00	10301.00	4.32	42
9937	2	2011	1	0	1278.00	403.00	3.17	42
9938	2	2011	1	1	34932.00	8325.00	4.20	42
9939	2	2011	1	2	36210.00	8728.00	4.15	42
9940	2	2011	2	0	3553.00	1090.00	3.26	42
9941	2	2011	2	1	36644.00	8490.00	4.32	42
9942	2	2011	2	2	40197.00	9580.00	4.20	42
9943	2	2012	1	0	1213.00	361.00	3.36	42
9944	2	2012	1	1	35193.00	8498.00	4.14	42
9945	2	2012	1	2	36406.00	8859.00	4.11	42
9946	2	2012	2	0	3754.00	1110.00	3.38	42
9947	2	2012	2	1	37077.00	8639.00	4.29	42
9948	2	2012	2	2	40831.00	9749.00	4.19	42
9949	2	2013	1	0	1520.00	430.00	3.53	42
9950	2	2013	1	1	36631.00	8609.00	4.25	42
9951	2	2013	1	2	38151.00	9039.00	4.22	42
9952	2	2013	2	0	4188.00	1213.00	3.45	42
9953	2	2013	2	1	38846.00	8594.00	4.52	42
9954	2	2013	2	2	43034.00	9807.00	4.39	42
9955	2	2014	1	0	1528.00	430.00	3.55	42
9956	2	2014	1	1	34238.00	8018.00	4.27	42
9957	2	2014	1	2	35766.00	8448.00	4.23	42
9958	2	2014	2	0	4232.00	1218.00	3.47	42
9959	2	2014	2	1	47205.00	10338.00	4.57	42
9960	2	2014	2	2	51437.00	11556.00	4.45	42
9961	2	2015	1	0	1334.00	392.00	3.40	42
9962	2	2015	1	1	33617.00	8210.00	4.09	42
9963	2	2015	1	2	34951.00	8602.00	4.06	42
9964	2	2015	2	0	4354.00	1240.00	3.51	42
9965	2	2015	2	1	48162.00	10356.00	4.65	42
9966	2	2015	2	2	52516.00	11596.00	4.53	42
9967	2	2016	1	0	1003.00	297.00	3.38	42
9968	2	2016	1	1	34347.00	8619.00	3.99	42
9969	2	2016	1	2	35350.00	8916.00	3.96	42
9970	2	2016	2	0	4342.00	1240.00	3.50	42
9971	2	2016	2	1	44256.00	9753.00	4.54	42
9972	2	2016	2	2	48598.00	10993.00	4.42	42
9973	2	2017	1	0	1325.00	375.00	3.53	42
9974	2	2017	1	1	36241.00	8883.00	4.08	42
9975	2	2017	1	2	37566.00	9258.00	4.06	42
9976	2	2017	2	0	4220.00	1240.00	3.40	42
9977	2	2017	2	1	40985.00	9010.00	4.55	42
9978	2	2017	2	2	45205.00	10250.00	4.41	42
9979	2	2018	1	0	1042.00	320.00	3.26	42
9980	2	2018	1	1	37240.00	9123.00	4.08	42
9981	2	2018	1	2	38282.00	9443.00	4.05	42
9982	2	2018	2	0	3021.00	905.00	3.34	42
9983	2	2018	2	1	41866.50	9170.00	4.57	42
9984	2	2018	2	2	44887.50	10075.00	4.46	42
9985	2	2019	1	0	816.00	255.00	3.20	42
9986	2	2019	1	1	35858.00	8860.00	4.05	42
9987	2	2019	1	2	36674.00	9115.00	4.02	42
9988	2	2019	2	0	3002.50	870.00	3.45	42
9989	2	2019	2	1	42943.00	9405.00	4.57	42
9990	2	2019	2	2	45945.50	10275.00	4.47	42
9991	2	2020	1	0	796.50	240.00	3.32	42
9992	2	2020	1	1	37342.80	8845.00	4.22	42
9993	2	2020	1	2	38139.30	9085.00	4.20	42
9994	2	2020	2	0	2826.10	820.00	3.45	42
9995	2	2020	2	1	41442.98	9324.00	4.44	42
9996	2	2020	2	2	44269.08	10144.00	4.36	42
9997	2	1987	1	0	\N	\N	\N	43
9998	2	1987	1	1	7550.00	3180.00	2.37	43
9999	2	1987	1	2	7550.00	3180.00	2.37	43
10000	2	1987	2	0	1811.00	1090.00	1.66	43
10001	2	1987	2	1	12653.00	3920.00	3.23	43
10002	2	1987	2	2	14464.00	5010.00	2.89	43
10003	2	1988	1	0	707.00	290.00	2.44	43
10004	2	1988	1	1	9971.00	4020.00	2.48	43
10005	2	1988	1	2	10678.00	4310.00	2.48	43
10006	2	1988	2	0	2512.00	1250.00	2.01	43
10007	2	1988	2	1	12833.00	3930.00	3.27	43
10008	2	1988	2	2	15345.00	5180.00	2.96	43
10009	2	1989	1	0	1022.00	420.00	2.43	43
10010	2	1989	1	1	11381.00	5060.00	2.25	43
10011	2	1989	1	2	12403.00	5480.00	2.26	43
10012	2	1989	2	0	1378.00	940.00	1.47	43
10013	2	1989	2	1	15535.00	5140.00	3.02	43
10014	2	1989	2	2	16913.00	6080.00	2.78	43
10015	2	1990	1	0	551.00	260.00	2.12	43
10016	2	1990	1	1	12562.00	5310.00	2.37	43
10017	2	1990	1	2	13113.00	5570.00	2.35	43
10018	2	1990	2	0	856.00	600.00	1.43	43
10019	2	1990	2	1	10687.00	3220.00	3.32	43
10020	2	1990	2	2	11543.00	3820.00	3.02	43
10021	2	1991	1	0	468.00	510.00	0.92	43
10022	2	1991	1	1	12443.00	4520.00	2.75	43
10023	2	1991	1	2	12911.00	5030.00	2.57	43
10024	2	1991	2	0	428.00	500.00	0.86	43
10025	2	1991	2	1	16431.00	4880.00	3.37	43
10026	2	1991	2	2	16859.00	5380.00	3.13	43
10027	2	1992	1	0	24.00	40.00	0.60	43
10028	2	1992	1	1	8537.00	3370.00	2.53	43
10029	2	1992	1	2	8561.00	3410.00	2.51	43
10030	2	1992	2	0	1075.00	720.00	1.49	43
10031	2	1992	2	1	11781.00	3600.00	3.27	43
10032	2	1992	2	2	12856.00	4320.00	2.98	43
10033	2	1993	1	0	223.00	200.00	1.12	43
10034	2	1993	1	1	7150.00	2630.00	2.72	43
10035	2	1993	1	2	7373.00	2830.00	2.61	43
10036	2	1993	2	0	592.00	530.00	1.12	43
10037	2	1993	2	1	12014.00	4150.00	2.89	43
10038	2	1993	2	2	12606.00	4680.00	2.69	43
10039	2	1994	1	0	318.00	250.00	1.27	43
10040	2	1994	1	1	6539.00	2650.00	2.47	43
10041	2	1994	1	2	6857.00	2900.00	2.36	43
10042	2	1994	2	0	1643.00	1380.00	1.19	43
10043	2	1994	2	1	11754.00	3380.00	3.48	43
10044	2	1994	2	2	13397.00	4760.00	2.81	43
10045	2	1995	1	0	261.00	210.00	1.24	43
10046	2	1995	1	1	5832.00	2330.00	2.50	43
10047	2	1995	1	2	6093.00	2540.00	2.40	43
10048	2	1995	2	0	1644.00	968.00	1.70	43
10049	2	1995	2	1	11782.00	3790.00	3.11	43
10050	2	1995	2	2	13426.00	4758.00	2.82	43
10051	2	1996	1	0	546.00	300.00	1.82	43
10052	2	1996	1	1	7269.00	2321.00	3.13	43
10053	2	1996	1	2	7815.00	2621.00	2.98	43
10054	2	1996	2	0	2059.00	1176.00	1.75	43
10055	2	1996	2	1	11551.00	3610.00	3.20	43
10056	2	1996	2	2	13610.00	4786.00	2.84	43
10057	2	1997	1	0	337.00	240.00	1.40	43
10058	2	1997	1	1	7054.00	2527.00	2.79	43
10059	2	1997	1	2	7391.00	2767.00	2.67	43
10060	2	1997	2	0	1721.00	1120.00	1.54	43
10061	2	1997	2	1	10076.00	3066.00	3.29	43
10062	2	1997	2	2	11797.00	4186.00	2.82	43
10063	2	1998	1	0	226.00	181.00	1.25	43
10064	2	1998	1	1	6649.00	2543.00	2.61	43
10065	2	1998	1	2	6875.00	2724.00	2.52	43
10066	2	1998	2	0	74.00	50.00	1.48	43
10067	2	1998	2	1	8316.00	2674.00	3.11	43
10068	2	1998	2	2	8390.00	2724.00	3.08	43
10069	2	1999	1	0	124.00	80.00	1.55	43
10070	2	1999	1	1	7788.00	2595.00	3.00	43
10071	2	1999	1	2	7912.00	2675.00	2.96	43
10072	2	1999	2	0	240.00	137.00	1.75	43
10073	2	1999	2	1	12856.00	3685.00	3.49	43
10074	2	1999	2	2	13096.00	3822.00	3.43	43
10075	2	2000	1	0	111.00	68.00	1.63	43
10076	2	2000	1	1	7009.00	2464.00	2.84	43
10077	2	2000	1	2	7120.00	2532.00	2.81	43
10078	2	2000	2	0	332.00	210.00	1.58	43
10079	2	2000	2	1	11138.00	3380.00	3.30	43
10080	2	2000	2	2	11470.00	3590.00	3.19	43
10081	2	2001	1	0	154.00	90.00	1.71	43
10082	2	2001	1	1	8263.00	2602.00	3.18	43
10083	2	2001	1	2	8417.00	2692.00	3.13	43
10084	2	2001	2	0	432.00	242.00	1.79	43
10085	2	2001	2	1	11066.00	3217.00	3.44	43
10086	2	2001	2	2	11498.00	3459.00	3.32	43
10087	2	2002	1	0	253.00	125.00	2.02	43
10088	2	2002	1	1	8982.00	2590.00	3.47	43
10089	2	2002	1	2	9235.00	2715.00	3.40	43
10090	2	2002	2	0	556.00	260.00	2.14	43
10091	2	2002	2	1	12193.00	3250.00	3.75	43
10092	2	2002	2	2	12749.00	3510.00	3.63	43
10093	2	2003	1	0	133.00	68.00	1.96	43
10094	2	2003	1	1	8606.00	2490.00	3.46	43
10095	2	2003	1	2	8739.00	2558.00	3.42	43
10096	2	2003	2	0	614.00	280.00	2.19	43
10097	2	2003	2	1	11306.00	2996.00	3.77	43
10098	2	2003	2	2	11920.00	3276.00	3.64	43
10099	2	2004	1	0	141.00	75.00	1.88	43
10100	2	2004	1	1	9972.00	2695.00	3.70	43
10101	2	2004	1	2	10113.00	2770.00	3.65	43
10102	2	2004	2	0	620.00	280.00	2.21	43
10103	2	2004	2	1	11658.00	3026.00	3.85	43
10104	2	2004	2	2	12278.00	3306.00	3.71	43
10105	2	2005	1	0	93.00	60.00	1.55	43
10106	2	2005	1	1	9504.00	2640.00	3.60	43
10107	2	2005	1	2	9597.00	2700.00	3.55	43
10108	2	2005	2	0	558.00	250.00	2.23	43
10109	2	2005	2	1	12157.00	3090.00	3.93	43
10110	2	2005	2	2	12715.00	3340.00	3.81	43
10111	2	2006	1	0	223.00	100.00	2.23	43
10112	2	2006	1	1	10252.00	2699.00	3.80	43
10113	2	2006	1	2	10475.00	2799.00	3.74	43
10114	2	2006	2	0	532.00	215.00	2.47	43
10115	2	2006	2	1	12943.00	3154.00	4.10	43
10116	2	2006	2	2	13475.00	3369.00	4.00	43
10117	2	2007	1	0	299.00	140.00	2.14	43
10118	2	2007	1	1	10513.00	2679.00	3.92	43
10119	2	2007	1	2	10812.00	2819.00	3.84	43
10120	2	2007	2	0	668.00	212.00	3.15	43
10121	2	2007	2	1	14412.00	3409.00	4.23	43
10122	2	2007	2	2	15080.00	3621.00	4.16	43
10123	2	2008	1	0	422.00	166.00	2.54	43
10124	2	2008	1	1	10776.00	2694.00	4.00	43
10125	2	2008	1	2	11198.00	2860.00	3.92	43
10126	2	2008	2	0	986.00	300.00	3.29	43
10127	2	2008	2	1	15258.00	3460.00	4.41	43
10128	2	2008	2	2	16244.00	3760.00	4.32	43
10129	2	2009	1	0	650.00	255.00	2.55	43
10130	2	2009	1	1	10351.00	2594.00	3.99	43
10131	2	2009	1	2	11001.00	2849.00	3.86	43
10132	2	2009	2	0	1177.00	350.00	3.36	43
10133	2	2009	2	1	16068.00	3606.00	4.46	43
10134	2	2009	2	2	17245.00	3956.00	4.36	43
10135	2	2010	1	0	505.00	201.00	2.51	43
10136	2	2010	1	1	9271.00	2453.00	3.78	43
10137	2	2010	1	2	9776.00	2654.00	3.68	43
10138	2	2010	2	0	539.00	190.00	2.84	43
10139	2	2010	2	1	15549.00	3570.00	4.36	43
10140	2	2010	2	2	16088.00	3760.00	4.28	43
10141	2	2011	1	0	518.00	180.00	2.88	43
10142	2	2011	1	1	10720.00	2650.00	4.05	43
10143	2	2011	1	2	11238.00	2830.00	3.97	43
10144	2	2011	2	0	888.00	285.00	3.12	43
10145	2	2011	2	1	14346.00	3298.00	4.35	43
10146	2	2011	2	2	15234.00	3583.00	4.25	43
10147	2	2012	1	0	437.00	128.00	3.41	43
10148	2	2012	1	1	11138.00	2740.00	4.06	43
10149	2	2012	1	2	11575.00	2868.00	4.04	43
10150	2	2012	2	0	654.00	240.00	2.73	43
10151	2	2012	2	1	13781.00	3200.00	4.31	43
10152	2	2012	2	2	14435.00	3440.00	4.20	43
10153	2	2013	1	0	104.00	35.00	2.97	43
10154	2	2013	1	1	11127.00	2786.00	3.99	43
10155	2	2013	1	2	11231.00	2821.00	3.98	43
10156	2	2013	2	0	1014.00	365.00	2.78	43
10157	2	2013	2	1	13118.00	3014.00	4.35	43
10158	2	2013	2	2	14132.00	3379.00	4.18	43
10159	2	2014	1	0	249.00	81.00	3.07	43
10160	2	2014	1	1	10345.00	2717.00	3.81	43
10161	2	2014	1	2	10594.00	2798.00	3.79	43
10162	2	2014	2	0	1228.00	518.00	2.37	43
10163	2	2014	2	1	13754.00	3054.00	4.50	43
10164	2	2014	2	2	14982.00	3572.00	4.19	43
10165	2	2015	1	0	161.00	67.00	2.40	43
10166	2	2015	1	1	10836.00	2734.00	3.96	43
10167	2	2015	1	2	10997.00	2801.00	3.93	43
10168	2	2015	2	0	1161.00	520.00	2.23	43
10169	2	2015	2	1	12711.00	2880.00	4.41	43
10170	2	2015	2	2	13872.00	3400.00	4.08	43
10171	2	2016	1	0	66.00	27.00	2.44	43
10172	2	2016	1	1	8435.15	2236.00	3.77	43
10173	2	2016	1	2	8501.15	2263.00	3.76	43
10174	2	2016	2	0	770.00	310.00	2.48	43
10175	2	2016	2	1	11788.00	2763.00	4.27	43
10176	2	2016	2	2	12558.00	3073.00	4.09	43
10177	2	2017	1	0	147.50	52.00	2.84	43
10178	2	2017	1	1	11205.00	2696.00	4.16	43
10179	2	2017	1	2	11352.50	2748.00	4.13	43
10180	2	2017	2	0	952.00	355.00	2.68	43
10181	2	2017	2	1	12060.00	2825.00	4.27	43
10182	2	2017	2	2	13012.00	3180.00	4.09	43
10183	2	2018	1	0	292.00	114.00	2.56	43
10184	2	2018	1	1	10816.00	2630.00	4.11	43
10185	2	2018	1	2	11108.00	2744.00	4.05	43
10186	2	2018	2	0	801.00	282.00	2.84	43
10187	2	2018	2	1	12955.00	2950.00	4.39	43
10188	2	2018	2	2	13756.00	3232.00	4.26	43
10189	2	2019	1	0	236.58	83.00	2.85	43
10190	2	2019	1	1	11479.00	2752.00	4.17	43
10191	2	2019	1	2	11715.58	2835.00	4.13	43
10192	2	2019	2	0	607.00	202.00	3.00	43
10193	2	2019	2	1	12339.00	2821.00	4.37	43
10194	2	2019	2	2	12946.00	3023.00	4.28	43
10195	2	2020	1	0	383.75	129.00	2.97	43
10196	2	2020	1	1	11001.00	2720.00	4.04	43
10197	2	2020	1	2	11384.75	2849.00	4.00	43
10198	2	2020	2	0	944.42	373.00	2.53	43
10199	2	2020	2	1	11895.05	2736.00	4.35	43
10200	2	2020	2	2	12839.47	3109.00	4.13	43
10201	2	1987	1	0	\N	\N	\N	44
10202	2	1987	1	1	6095.00	3090.00	1.97	44
10203	2	1987	1	2	6095.00	3090.00	1.97	44
10204	2	1987	2	0	4533.00	2930.00	1.55	44
10205	2	1987	2	1	7625.00	4360.00	1.75	44
10206	2	1987	2	2	12158.00	7290.00	1.67	44
10207	2	1988	1	0	\N	\N	\N	44
10208	2	1988	1	1	7388.00	3790.00	1.95	44
10209	2	1988	1	2	7388.00	3790.00	1.95	44
10210	2	1988	2	0	3982.00	2380.00	1.67	44
10211	2	1988	2	1	7779.00	4310.00	1.80	44
10212	2	1988	2	2	11761.00	6690.00	1.76	44
10213	2	1989	1	0	\N	\N	\N	44
10214	2	1989	1	1	4890.00	2420.00	2.02	44
10215	2	1989	1	2	4890.00	2420.00	2.02	44
10216	2	1989	2	0	3838.00	2290.00	1.68	44
10217	2	1989	2	1	8782.00	4470.00	1.96	44
10218	2	1989	2	2	12620.00	6760.00	1.87	44
10219	2	1990	1	0	\N	\N	\N	44
10220	2	1990	1	1	4191.00	2090.00	2.01	44
10221	2	1990	1	2	4191.00	2090.00	2.01	44
10222	2	1990	2	0	4086.00	2270.00	1.80	44
10223	2	1990	2	1	8994.00	4750.00	1.89	44
10224	2	1990	2	2	13080.00	7020.00	1.86	44
10225	2	1991	1	0	\N	\N	\N	44
10226	2	1991	1	1	6931.00	3020.00	2.30	44
10227	2	1991	1	2	6931.00	3020.00	2.30	44
10228	2	1991	2	0	3586.00	1320.00	2.72	44
10229	2	1991	2	1	9260.00	4380.00	2.11	44
10230	2	1991	2	2	12846.00	5700.00	2.25	44
10231	2	1992	1	0	\N	\N	\N	44
10232	2	1992	1	1	5558.00	2210.00	2.51	44
10233	2	1992	1	2	5558.00	2210.00	2.51	44
10234	2	1992	2	0	3601.00	1340.00	2.69	44
10235	2	1992	2	1	9573.00	4570.00	2.09	44
10236	2	1992	2	2	13174.00	5910.00	2.23	44
10237	2	1993	1	0	\N	\N	\N	44
10238	2	1993	1	1	4916.00	2000.00	2.46	44
10239	2	1993	1	2	4916.00	2000.00	2.46	44
10240	2	1993	2	0	2215.00	1280.00	1.73	44
10241	2	1993	2	1	7850.00	3940.00	1.99	44
10242	2	1993	2	2	10065.00	5220.00	1.93	44
10243	2	1994	1	0	\N	\N	\N	44
10244	2	1994	1	1	4595.00	2290.00	2.01	44
10245	2	1994	1	2	4595.00	2290.00	2.01	44
10246	2	1994	2	0	1755.00	1170.00	1.50	44
10247	2	1994	2	1	7915.00	3750.00	2.11	44
10248	2	1994	2	2	9670.00	4920.00	1.97	44
10249	2	1995	1	0	\N	\N	\N	44
10250	2	1995	1	1	3843.00	1850.00	2.08	44
10251	2	1995	1	2	3843.00	1850.00	2.08	44
10252	2	1995	2	0	2057.00	1225.00	1.68	44
10253	2	1995	2	1	9553.00	5093.00	1.88	44
10254	2	1995	2	2	11610.00	6318.00	1.84	44
10255	2	1996	1	0	\N	\N	\N	44
10256	2	1996	1	1	3861.00	1856.00	2.08	44
10257	2	1996	1	2	3861.00	1856.00	2.08	44
10258	2	1996	2	0	2090.00	1233.00	1.70	44
10259	2	1996	2	1	10162.00	5059.00	2.01	44
10260	2	1996	2	2	12252.00	6292.00	1.95	44
10261	2	1997	1	0	\N	\N	\N	44
10262	2	1997	1	1	3858.00	1694.00	2.28	44
10263	2	1997	1	2	3858.00	1694.00	2.28	44
10264	2	1997	2	0	2362.00	1260.00	1.87	44
10265	2	1997	2	1	10727.00	5056.00	2.12	44
10266	2	1997	2	2	13089.00	6316.00	2.07	44
10267	2	1998	1	0	\N	\N	\N	44
10268	2	1998	1	1	3517.00	1738.00	2.02	44
10269	2	1998	1	2	3517.00	1738.00	2.02	44
10270	2	1998	2	0	2328.00	1260.00	1.85	44
10271	2	1998	2	1	10018.00	5042.00	1.99	44
10272	2	1998	2	2	12346.00	6302.00	1.96	44
10273	2	1999	1	0	\N	\N	\N	44
10274	2	1999	1	1	4069.00	1913.00	2.13	44
10275	2	1999	1	2	4069.00	1913.00	2.13	44
10276	2	1999	2	0	2154.00	1222.00	1.76	44
10277	2	1999	2	1	10025.00	4940.00	2.03	44
10278	2	1999	2	2	12179.00	6162.00	1.98	44
10279	2	2000	1	0	\N	\N	\N	44
10280	2	2000	1	1	3869.00	1773.00	2.18	44
10281	2	2000	1	2	3869.00	1773.00	2.18	44
10282	2	2000	2	0	2252.00	1224.00	1.84	44
10283	2	2000	2	1	11512.00	5368.00	2.14	44
10284	2	2000	2	2	13764.00	6592.00	2.09	44
10285	2	2001	1	0	\N	\N	\N	44
10286	2	2001	1	1	4770.00	2156.00	2.21	44
10287	2	2001	1	2	4770.00	2156.00	2.21	44
10288	2	2001	2	0	2346.00	1232.00	1.90	44
10289	2	2001	2	1	11105.00	5161.00	2.15	44
10290	2	2001	2	2	13451.00	6393.00	2.10	44
10291	2	2002	1	0	\N	\N	\N	44
10292	2	2002	1	1	4305.00	2003.00	2.15	44
10293	2	2002	1	2	4305.00	2003.00	2.15	44
10294	2	2002	2	0	2656.00	1367.00	1.94	44
10295	2	2002	2	1	11983.00	5437.00	2.20	44
10296	2	2002	2	2	14639.00	6804.00	2.15	44
10297	2	2003	1	0	\N	\N	\N	44
10298	2	2003	1	1	4173.00	1997.00	2.09	44
10299	2	2003	1	2	4173.00	1997.00	2.09	44
10300	2	2003	2	0	2451.00	1373.00	1.79	44
10301	2	2003	2	1	12027.00	5367.00	2.24	44
10302	2	2003	2	2	14478.00	6740.00	2.15	44
10303	2	2004	1	0	\N	\N	\N	44
10304	2	2004	1	1	4693.00	2047.00	2.29	44
10305	2	2004	1	2	4693.00	2047.00	2.29	44
10306	2	2004	2	0	2206.00	1114.00	1.98	44
10307	2	2004	2	1	13789.00	5942.00	2.32	44
10308	2	2004	2	2	15995.00	7056.00	2.27	44
10309	2	2005	1	0	\N	\N	\N	44
10310	2	2005	1	1	5204.00	2270.00	2.29	44
10311	2	2005	1	2	5204.00	2270.00	2.29	44
10312	2	2005	2	0	2206.00	1114.00	1.98	44
10313	2	2005	2	1	13407.00	5776.00	2.32	44
10314	2	2005	2	2	15613.00	6890.00	2.27	44
10315	2	2006	1	0	\N	\N	\N	44
10316	2	2006	1	1	4847.00	2110.00	2.30	44
10317	2	2006	1	2	4847.00	2110.00	2.30	44
10318	2	2006	2	0	2195.00	1114.00	1.97	44
10319	2	2006	2	1	14925.00	5774.00	2.58	44
10320	2	2006	2	2	17120.00	6888.00	2.49	44
10321	2	2007	1	0	\N	\N	\N	44
10322	2	2007	1	1	4713.00	2036.00	2.31	44
10323	2	2007	1	2	4713.00	2036.00	2.31	44
10324	2	2007	2	0	2383.00	1100.00	2.17	44
10325	2	2007	2	1	14549.00	5313.00	2.74	44
10326	2	2007	2	2	16932.00	6413.00	2.64	44
10327	2	2008	1	0	\N	\N	\N	44
10328	2	2008	1	1	4547.00	1902.00	2.39	44
10329	2	2008	1	2	4547.00	1902.00	2.39	44
10330	2	2008	2	0	2753.00	1139.00	2.42	44
10331	2	2008	2	1	11891.00	4563.00	2.61	44
10332	2	2008	2	2	14644.00	5702.00	2.57	44
10333	2	2009	1	0	\N	\N	\N	44
10334	2	2009	1	1	3459.00	1354.00	2.55	44
10335	2	2009	1	2	3459.00	1354.00	2.55	44
10336	2	2009	2	0	2417.00	1021.00	2.37	44
10337	2	2009	2	1	12655.00	4817.00	2.63	44
10338	2	2009	2	2	15072.00	5838.00	2.58	44
10339	2	2010	1	0	\N	\N	\N	44
10340	2	2010	1	1	2317.00	952.00	2.43	44
10341	2	2010	1	2	2317.00	952.00	2.43	44
10342	2	2010	2	0	1683.00	854.00	1.97	44
10343	2	2010	2	1	11719.00	4366.00	2.68	44
10344	2	2010	2	2	13402.00	5220.00	2.57	44
10345	2	2011	1	0	\N	\N	\N	44
10346	2	2011	1	1	2614.00	933.00	2.80	44
10347	2	2011	1	2	2614.00	933.00	2.80	44
10348	2	2011	2	0	1644.00	792.00	2.08	44
10349	2	2011	2	1	12186.00	4539.00	2.68	44
10350	2	2011	2	2	13830.00	5331.00	2.59	44
10351	2	2012	1	0	\N	\N	\N	44
10352	2	2012	1	1	2746.00	923.00	2.98	44
10353	2	2012	1	2	2746.00	923.00	2.98	44
10354	2	2012	2	0	1984.00	905.00	2.19	44
10355	2	2012	2	1	12492.00	4583.00	2.73	44
10356	2	2012	2	2	14476.00	5488.00	2.64	44
10357	2	2013	1	0	\N	\N	\N	44
10358	2	2013	1	1	2611.00	814.00	3.21	44
10359	2	2013	1	2	2611.00	814.00	3.21	44
10360	2	2013	2	0	2137.00	905.00	2.36	44
10361	2	2013	2	1	14355.00	4663.00	3.08	44
10362	2	2013	2	2	16492.00	5568.00	2.96	44
10363	2	2014	1	0	\N	\N	\N	44
10364	2	2014	1	1	2177.00	724.00	3.01	44
10365	2	2014	1	2	2177.00	724.00	3.01	44
10366	2	2014	2	0	2224.00	881.00	2.52	44
10367	2	2014	2	1	14590.00	4663.00	3.13	44
10368	2	2014	2	2	16814.00	5544.00	3.03	44
10369	2	2015	1	0	\N	\N	\N	44
10370	2	2015	1	1	2360.00	722.00	3.27	44
10371	2	2015	1	2	2360.00	722.00	3.27	44
10372	2	2015	2	0	1738.00	736.00	2.36	44
10373	2	2015	2	1	11044.00	3518.00	3.14	44
10374	2	2015	2	2	12782.00	4254.00	3.00	44
10375	2	2016	1	0	\N	\N	\N	44
10376	2	2016	1	1	2318.00	742.00	3.12	44
10377	2	2016	1	2	2318.00	742.00	3.12	44
10378	2	2016	2	0	1298.00	615.00	2.11	44
10379	2	2016	2	1	10848.00	3464.00	3.13	44
10380	2	2016	2	2	12146.00	4079.00	2.98	44
10381	2	2017	1	0	0.00	0.00	\N	44
10382	2	2017	1	1	2545.00	765.00	3.33	44
10383	2	2017	1	2	2545.00	765.00	3.33	44
10384	2	2017	2	0	2248.00	919.00	2.45	44
10385	2	2017	2	1	11446.00	3475.00	3.29	44
10386	2	2017	2	2	13694.00	4394.00	3.12	44
10387	2	2018	1	0	0.00	0.00	\N	44
10388	2	2018	1	1	2596.00	784.00	3.31	44
10389	2	2018	1	2	2596.00	784.00	3.31	44
10390	2	2018	2	0	2080.02	921.00	2.26	44
10391	2	2018	2	1	11699.84	3449.00	3.39	44
10392	2	2018	2	2	13779.86	4370.00	3.15	44
10393	2	2019	1	0	0.00	0.00	\N	44
10394	2	2019	1	1	2258.00	706.00	3.20	44
10395	2	2019	1	2	2258.00	706.00	3.20	44
10396	2	2019	2	0	2438.00	921.00	2.65	44
10397	2	2019	2	1	11703.75	3394.00	3.45	44
10398	2	2019	2	2	14141.75	4315.00	3.28	44
10399	2	2020	1	0	0.00	0.00	\N	44
10400	2	2020	1	1	2358.80	756.00	3.12	44
10401	2	2020	1	2	2358.80	756.00	3.12	44
10402	2	2020	2	0	2213.15	921.00	2.40	44
10403	2	2020	2	1	11359.96	3449.25	3.29	44
10404	2	2020	2	2	13573.11	4370.25	3.11	44
10405	2	1987	1	0	31850.00	19590.00	1.63	45
10406	2	1987	1	1	56220.00	18210.00	3.09	45
10407	2	1987	1	2	88070.00	37800.00	2.33	45
10408	2	1987	2	0	85363.00	34820.00	2.45	45
10409	2	1987	2	1	71468.00	23500.00	3.04	45
10410	2	1987	2	2	156831.00	58320.00	2.69	45
10411	2	1988	1	0	26224.00	12340.00	2.13	45
10412	2	1988	1	1	54686.00	17500.00	3.12	45
10413	2	1988	1	2	80910.00	29840.00	2.71	45
10414	2	1988	2	0	63960.00	27250.00	2.35	45
10415	2	1988	2	1	92670.00	28470.00	3.26	45
10416	2	1988	2	2	156630.00	55720.00	2.81	45
10417	2	1989	1	0	29295.00	12960.00	2.26	45
10418	2	1989	1	1	72582.00	22460.00	3.23	45
10419	2	1989	1	2	101877.00	35420.00	2.88	45
10420	2	1989	2	0	60190.00	25590.00	2.35	45
10421	2	1989	2	1	81584.00	24830.00	3.29	45
10422	2	1989	2	2	141774.00	50420.00	2.81	45
10423	2	1990	1	0	7504.00	4690.00	1.60	45
10424	2	1990	1	1	60835.00	21700.00	2.80	45
10425	2	1990	1	2	68339.00	26390.00	2.59	45
10426	2	1990	2	0	61554.00	24300.00	2.53	45
10427	2	1990	2	1	67801.00	23770.00	2.85	45
10428	2	1990	2	2	129355.00	48070.00	2.69	45
10429	2	1991	1	0	21355.00	11420.00	1.87	45
10430	2	1991	1	1	89267.00	26180.00	3.41	45
10431	2	1991	1	2	110622.00	37600.00	2.94	45
10432	2	1991	2	0	59480.00	23100.00	2.57	45
10433	2	1991	2	1	82205.00	23630.00	3.48	45
10434	2	1991	2	2	141685.00	46730.00	3.03	45
10435	2	1992	1	0	13200.00	8920.00	1.48	45
10436	2	1992	1	1	79894.00	22520.00	3.55	45
10437	2	1992	1	2	93094.00	31440.00	2.96	45
10438	2	1992	2	0	51928.00	20540.00	2.53	45
10439	2	1992	2	1	98905.00	27380.00	3.61	45
10440	2	1992	2	2	150833.00	47920.00	3.15	45
10441	2	1993	1	0	9520.00	6050.00	1.57	45
10442	2	1993	1	1	85658.00	23280.00	3.68	45
10443	2	1993	1	2	95178.00	29330.00	3.25	45
10444	2	1993	2	0	71174.00	28040.00	2.54	45
10445	2	1993	2	1	104129.00	29260.00	3.56	45
10446	2	1993	2	2	175303.00	57300.00	3.06	45
10447	2	1994	1	0	17515.00	8400.00	2.09	45
10448	2	1994	1	1	84081.00	28360.00	2.96	45
10449	2	1994	1	2	101596.00	36760.00	2.76	45
10450	2	1994	2	0	81254.00	31470.00	2.58	45
10451	2	1994	2	1	111120.00	34990.00	3.18	45
10452	2	1994	2	2	192374.00	66460.00	2.89	45
10453	2	1995	1	0	7351.00	4070.00	1.81	45
10454	2	1995	1	1	65927.00	21090.00	3.13	45
10455	2	1995	1	2	73278.00	25160.00	2.91	45
10456	2	1995	2	0	56934.00	21870.00	2.60	45
10457	2	1995	2	1	116196.00	34450.00	3.37	45
10458	2	1995	2	2	173130.00	56320.00	3.07	45
10459	2	1996	1	0	16298.00	5970.00	2.73	45
10460	2	1996	1	1	104398.00	29970.00	3.48	45
10461	2	1996	1	2	120696.00	35940.00	3.36	45
10462	2	1996	2	0	46600.00	17282.00	2.70	45
10463	2	1996	2	1	130631.00	39689.00	3.29	45
10464	2	1996	2	2	177231.00	56971.00	3.11	45
10465	2	1997	1	0	3799.00	1310.00	2.90	45
10466	2	1997	1	1	84497.00	26195.00	3.23	45
10467	2	1997	1	2	88296.00	27505.00	3.21	45
10468	2	1997	2	0	37695.00	16362.00	2.30	45
10469	2	1997	2	1	112518.00	37410.00	3.01	45
10470	2	1997	2	2	150213.00	53772.00	2.79	45
10471	2	1998	1	0	2223.00	1482.00	1.50	45
10472	2	1998	1	1	50117.00	20348.00	2.46	45
10473	2	1998	1	2	52340.00	21830.00	2.40	45
10474	2	1998	2	0	38220.00	13904.00	2.75	45
10475	2	1998	2	1	92653.00	33359.00	2.78	45
10476	2	1998	2	2	130873.00	47263.00	2.77	45
10477	2	1999	1	0	23280.00	8285.00	2.81	45
10478	2	1999	1	1	91281.00	31235.00	2.92	45
10479	2	1999	1	2	114561.00	39520.00	2.90	45
10480	2	1999	2	0	59658.00	21918.00	2.72	45
10481	2	1999	2	1	161050.00	48562.00	3.32	45
10482	2	1999	2	2	220708.00	70480.00	3.13	45
10483	2	2000	1	0	15535.00	5533.00	2.81	45
10484	2	2000	1	1	88293.00	28416.00	3.11	45
10485	2	2000	1	2	103828.00	33949.00	3.06	45
10486	2	2000	2	0	78255.00	23550.00	3.32	45
10487	2	2000	2	1	188504.00	51333.00	3.67	45
10488	2	2000	2	2	266759.00	74883.00	3.56	45
10489	2	2001	1	0	14604.00	4793.00	3.05	45
10490	2	2001	1	1	95312.00	27438.00	3.47	45
10491	2	2001	1	2	109916.00	32231.00	3.41	45
10492	2	2001	2	0	55294.00	18100.00	3.05	45
10493	2	2001	2	1	162798.00	45750.00	3.56	45
10494	2	2001	2	2	218092.00	63850.00	3.42	45
10495	2	2002	1	0	13585.00	5099.00	2.66	45
10496	2	2002	1	1	94649.00	28966.00	3.27	45
10497	2	2002	1	2	108234.00	34065.00	3.18	45
10498	2	2002	2	0	64674.00	21758.00	2.97	45
10499	2	2002	2	1	152731.00	46677.00	3.27	45
10500	2	2002	2	2	217405.00	68435.00	3.18	45
10501	2	2003	1	0	10471.00	3810.00	2.75	45
10502	2	2003	1	1	89430.00	27173.00	3.29	45
10503	2	2003	1	2	99901.00	30983.00	3.22	45
10504	2	2003	2	0	70831.00	22005.00	3.22	45
10505	2	2003	2	1	180017.00	48509.00	3.71	45
10506	2	2003	2	2	250848.00	70514.00	3.56	45
10507	2	2004	1	0	18016.00	6100.00	2.95	45
10508	2	2004	1	1	96280.00	28674.00	3.36	45
10509	2	2004	1	2	114296.00	34774.00	3.29	45
10510	2	2004	2	0	77061.00	21915.00	3.52	45
10511	2	2004	2	1	192954.00	50480.00	3.82	45
10512	2	2004	2	2	270015.00	72395.00	3.73	45
10513	2	2005	1	0	19689.00	6932.00	2.84	45
10514	2	2005	1	1	96103.00	28015.00	3.43	45
10515	2	2005	1	2	115792.00	34947.00	3.31	45
10516	2	2005	2	0	78266.00	22118.00	3.54	45
10517	2	2005	2	1	197609.00	51815.00	3.81	45
10518	2	2005	2	2	275875.00	73933.00	3.73	45
10519	2	2006	1	0	18578.00	6710.00	2.77	45
10520	2	2006	1	1	96367.00	28505.00	3.38	45
10521	2	2006	1	2	114945.00	35215.00	3.26	45
10522	2	2006	2	0	83792.00	23150.00	3.62	45
10523	2	2006	2	1	215169.00	53560.00	4.02	45
10524	2	2006	2	2	298961.00	76710.00	3.90	45
10525	2	2007	1	0	16200.00	5900.00	2.75	45
10526	2	2007	1	1	92481.00	27170.00	3.40	45
10527	2	2007	1	2	108681.00	33070.00	3.29	45
10528	2	2007	2	0	90702.00	25240.00	3.59	45
10529	2	2007	2	1	225729.00	55660.00	4.06	45
10530	2	2007	2	2	316431.00	80900.00	3.91	45
10531	2	2008	1	0	19538.00	6460.00	3.02	45
10532	2	2008	1	1	96755.00	27898.00	3.47	45
10533	2	2008	1	2	116293.00	34358.00	3.38	45
10534	2	2008	2	0	92510.00	25595.00	3.61	45
10535	2	2008	2	1	223724.00	55650.00	4.02	45
10536	2	2008	2	2	316234.00	81245.00	3.89	45
10537	2	2009	1	0	19527.00	6780.00	2.88	45
10538	2	2009	1	1	98309.00	28495.00	3.45	45
10539	2	2009	1	2	117836.00	35275.00	3.34	45
10540	2	2009	2	0	101359.00	28716.00	3.53	45
10541	2	2009	2	1	223850.00	55250.00	4.05	45
10542	2	2009	2	2	325209.00	83966.00	3.87	45
10543	2	2010	1	0	18047.00	6201.00	2.91	45
10544	2	2010	1	1	90985.00	27460.00	3.31	45
10545	2	2010	1	2	109032.00	33661.00	3.24	45
10546	2	2010	2	0	100980.00	28850.00	3.50	45
10547	2	2010	2	1	226296.00	54298.00	4.17	45
10548	2	2010	2	2	327276.00	83148.00	3.94	45
10549	2	2011	1	0	23510.00	7490.00	3.14	45
10550	2	2011	1	1	107108.00	28401.00	3.77	45
10551	2	2011	1	2	130618.00	35891.00	3.64	45
10552	2	2011	2	0	115637.00	32595.00	3.55	45
10553	2	2011	2	1	225344.00	54987.00	4.10	45
10554	2	2011	2	2	340981.00	87582.00	3.89	45
10555	2	2012	1	0	22598.00	7180.00	3.15	45
10556	2	2012	1	1	94343.00	26150.00	3.61	45
10557	2	2012	1	2	116941.00	33330.00	3.51	45
10558	2	2012	2	0	119296.00	34150.00	3.49	45
10559	2	2012	2	1	241110.00	57611.00	4.19	45
10560	2	2012	2	2	360406.00	91761.00	3.93	45
10561	2	2013	1	0	17589.00	5710.00	3.08	45
10562	2	2013	1	1	94663.00	24780.00	3.82	45
10563	2	2013	1	2	112252.00	30490.00	3.68	45
10564	2	2013	2	0	124296.00	35139.00	3.54	45
10565	2	2013	2	1	241421.00	57297.00	4.21	45
10566	2	2013	2	2	365717.00	92436.00	3.96	45
10567	2	2014	1	0	18109.00	6008.00	3.01	45
10568	2	2014	1	1	96191.00	25329.00	3.80	45
10569	2	2014	1	2	114300.00	31337.00	3.65	45
10570	2	2014	2	0	125694.00	35310.00	3.56	45
10571	2	2014	2	1	238788.00	57541.00	4.15	45
10572	2	2014	2	2	364482.00	92851.00	3.93	45
10573	2	2015	1	0	19179.00	6279.00	3.05	45
10574	2	2015	1	1	97764.00	26463.00	3.69	45
10575	2	2015	1	2	116943.00	32742.00	3.57	45
10576	2	2015	2	0	126671.00	35270.00	3.59	45
10577	2	2015	2	1	247625.00	58045.00	4.27	45
10578	2	2015	2	2	374296.00	93315.00	4.01	45
10579	2	2016	1	0	12078.00	4088.00	2.95	45
10580	2	2016	1	1	71618.00	20558.00	3.48	45
10581	2	2016	1	2	83696.00	24646.00	3.40	45
10582	2	2016	2	0	123637.00	34850.00	3.55	45
10583	2	2016	2	1	245249.00	58700.00	4.18	45
10584	2	2016	2	2	368886.00	93550.00	3.94	45
10585	2	2017	1	0	18134.00	6145.00	2.95	45
10586	2	2017	1	1	91264.00	25260.00	3.61	45
10587	2	2017	1	2	109398.00	31405.00	3.48	45
10588	2	2017	2	0	119513.00	34206.00	3.49	45
10589	2	2017	2	1	245963.00	59185.00	4.16	45
10590	2	2017	2	2	365476.00	93391.00	3.91	45
10591	2	2018	1	0	18929.00	6040.00	3.13	45
10592	2	2018	1	1	93998.00	25700.00	3.66	45
10593	2	2018	1	2	112927.00	31740.00	3.56	45
10594	2	2018	2	0	123851.00	34950.00	3.54	45
10595	2	2018	2	1	249260.00	59510.00	4.19	45
10596	2	2018	2	2	373111.00	94460.00	3.95	45
10597	2	2019	1	0	18873.00	6001.00	3.14	45
10598	2	2019	1	1	93196.00	25505.00	3.65	45
10599	2	2019	1	2	112069.00	31506.00	3.56	45
10600	2	2019	2	0	122859.00	35700.00	3.44	45
10601	2	2019	2	1	248661.00	59700.00	4.17	45
10602	2	2019	2	2	371520.00	95400.00	3.89	45
10603	2	2020	1	0	16905.00	5470.00	3.09	45
10604	2	2020	1	1	90916.00	24800.00	3.67	45
10605	2	2020	1	2	107821.00	30270.00	3.56	45
10606	2	2020	2	0	126599.00	35940.00	3.52	45
10607	2	2020	2	1	251268.00	60212.00	4.17	45
10608	2	2020	2	2	377867.00	96152.00	3.93	45
10609	2	1987	1	0	895.00	620.00	1.44	46
10610	2	1987	1	1	20395.00	8170.00	2.50	46
10611	2	1987	1	2	21290.00	8790.00	2.42	46
10612	2	1987	2	0	1867.00	2060.00	0.91	46
10613	2	1987	2	1	30744.00	12450.00	2.47	46
10614	2	1987	2	2	32611.00	14510.00	2.25	46
10615	2	1988	1	0	1135.00	1050.00	1.08	46
10616	2	1988	1	1	22308.00	9230.00	2.42	46
10617	2	1988	1	2	23443.00	10280.00	2.28	46
10618	2	1988	2	0	2755.00	2580.00	1.07	46
10619	2	1988	2	1	40915.00	15000.00	2.73	46
10620	2	1988	2	2	43670.00	17580.00	2.48	46
10621	2	1989	1	0	1301.00	1130.00	1.15	46
10622	2	1989	1	1	25641.00	13250.00	1.94	46
10623	2	1989	1	2	26942.00	14380.00	1.87	46
10624	2	1989	2	0	2751.00	2090.00	1.32	46
10625	2	1989	2	1	70431.00	26290.00	2.68	46
10626	2	1989	2	2	73182.00	28380.00	2.58	46
10627	2	1990	1	0	163.00	170.00	0.96	46
10628	2	1990	1	1	36097.00	13140.00	2.75	46
10629	2	1990	1	2	36260.00	13310.00	2.72	46
10630	2	1990	2	0	1683.00	1520.00	1.11	46
10631	2	1990	2	1	60557.00	24660.00	2.46	46
10632	2	1990	2	2	62240.00	26180.00	2.38	46
10633	2	1991	1	0	720.00	570.00	1.26	46
10634	2	1991	1	1	34214.00	12300.00	2.78	46
10635	2	1991	1	2	34934.00	12870.00	2.71	46
10636	2	1991	2	0	2540.00	1710.00	1.49	46
10637	2	1991	2	1	65624.00	24030.00	2.73	46
10638	2	1991	2	2	68164.00	25740.00	2.65	46
10639	2	1992	1	0	178.00	190.00	0.94	46
10640	2	1992	1	1	38579.00	13650.00	2.83	46
10641	2	1992	1	2	38757.00	13840.00	2.80	46
10642	2	1992	2	0	2120.00	1380.00	1.54	46
10643	2	1992	2	1	55599.00	21340.00	2.61	46
10644	2	1992	2	2	57719.00	22720.00	2.54	46
10645	2	1993	1	0	318.00	190.00	1.67	46
10646	2	1993	1	1	32463.00	11280.00	2.88	46
10647	2	1993	1	2	32781.00	11470.00	2.86	46
10648	2	1993	2	0	2649.00	1240.00	2.14	46
10649	2	1993	2	1	33311.00	11150.00	2.99	46
10650	2	1993	2	2	35960.00	12390.00	2.90	46
10651	2	1994	1	0	703.00	370.00	1.90	46
10652	2	1994	1	1	27976.00	8920.00	3.14	46
10653	2	1994	1	2	28679.00	9290.00	3.09	46
10654	2	1994	2	0	4762.00	2190.00	2.17	46
10655	2	1994	2	1	24385.00	7780.00	3.13	46
10656	2	1994	2	2	29147.00	9970.00	2.92	46
10657	2	1995	1	0	3055.00	1755.00	1.74	46
10658	2	1995	1	1	31173.00	10210.00	3.05	46
10659	2	1995	1	2	34228.00	11965.00	2.86	46
10660	2	1995	2	0	5960.00	2890.00	2.06	46
10661	2	1995	2	1	25643.00	8980.00	2.86	46
10662	2	1995	2	2	31603.00	11870.00	2.66	46
10663	2	1996	1	0	3358.00	1860.00	1.81	46
10664	2	1996	1	1	23690.00	7300.00	3.25	46
10665	2	1996	1	2	27048.00	9160.00	2.95	46
10666	2	1996	2	0	6152.00	2980.00	2.06	46
10667	2	1996	2	1	26510.00	8770.00	3.02	46
10668	2	1996	2	2	32662.00	11750.00	2.78	46
10669	2	1997	1	0	3436.00	1870.00	1.84	46
10670	2	1997	1	1	22976.00	7180.00	3.20	46
10671	2	1997	1	2	26412.00	9050.00	2.92	46
10672	2	1997	2	0	5950.00	2975.00	2.00	46
10673	2	1997	2	1	27544.00	8790.00	3.13	46
10674	2	1997	2	2	33494.00	11765.00	2.85	46
10675	2	1998	1	0	1060.00	815.00	1.30	46
10676	2	1998	1	1	15986.00	5730.00	2.79	46
10677	2	1998	1	2	17046.00	6545.00	2.60	46
10678	2	1998	2	0	5125.00	2700.00	1.90	46
10679	2	1998	2	1	25456.00	8260.00	3.08	46
10680	2	1998	2	2	30581.00	10960.00	2.79	46
10681	2	1999	1	0	2340.00	1170.00	2.00	46
10682	2	1999	1	1	18750.00	6250.00	3.00	46
10683	2	1999	1	2	21090.00	7420.00	2.84	46
10684	2	1999	2	0	7314.00	3502.00	2.09	46
10685	2	1999	2	1	24665.00	8660.00	2.85	46
10686	2	1999	2	2	31979.00	12162.00	2.63	46
10687	2	2000	1	0	2020.00	1090.00	1.85	46
10688	2	2000	1	1	19950.00	6870.00	2.90	46
10689	2	2000	1	2	21970.00	7960.00	2.76	46
10690	2	2000	2	0	7284.00	3678.00	1.98	46
10691	2	2000	2	1	27460.00	9060.00	3.03	46
10692	2	2000	2	2	34744.00	12738.00	2.73	46
10693	2	2001	1	0	1895.00	1045.00	1.81	46
10694	2	2001	1	1	20160.00	6750.00	2.99	46
10695	2	2001	1	2	22055.00	7795.00	2.83	46
10696	2	2001	2	0	8467.00	3910.00	2.17	46
10697	2	2001	2	1	28462.00	9505.00	2.99	46
10698	2	2001	2	2	36929.00	13415.00	2.75	46
10699	2	2002	1	0	2100.00	1070.00	1.96	46
10700	2	2002	1	1	19560.00	6520.00	3.00	46
10701	2	2002	1	2	21660.00	7590.00	2.85	46
10702	2	2002	2	0	6177.00	3080.00	2.01	46
10703	2	2002	2	1	27658.00	8975.00	3.08	46
10704	2	2002	2	2	33835.00	12055.00	2.81	46
10705	2	2003	1	0	1248.00	640.00	1.95	46
10706	2	2003	1	1	21007.00	6610.00	3.18	46
10707	2	2003	1	2	22255.00	7250.00	3.07	46
10708	2	2003	2	0	6063.00	2938.00	2.06	46
10709	2	2003	2	1	31842.00	9633.00	3.31	46
10710	2	2003	2	2	37905.00	12571.00	3.02	46
10711	2	2004	1	0	1246.00	649.00	1.92	46
10712	2	2004	1	1	21807.00	6750.00	3.23	46
10713	2	2004	1	2	23053.00	7399.00	3.12	46
10714	2	2004	2	0	6425.00	3190.00	2.01	46
10715	2	2004	2	1	31117.00	9620.00	3.23	46
10716	2	2004	2	2	37542.00	12810.00	2.93	46
10717	2	2005	1	0	1147.00	620.00	1.85	46
10718	2	2005	1	1	20424.00	6610.00	3.09	46
10719	2	2005	1	2	21571.00	7230.00	2.98	46
10720	2	2005	2	0	6406.00	3120.00	2.05	46
10721	2	2005	2	1	32329.00	10075.00	3.21	46
10722	2	2005	2	2	38735.00	13195.00	2.94	46
10723	2	2006	1	0	1485.00	762.00	1.95	46
10724	2	2006	1	1	24273.00	6997.00	3.47	46
10725	2	2006	1	2	25758.00	7759.00	3.32	46
10726	2	2006	2	0	6616.00	3225.00	2.05	46
10727	2	2006	2	1	34078.00	10175.00	3.35	46
10728	2	2006	2	2	40694.00	13400.00	3.04	46
10729	2	2007	1	0	846.00	450.00	1.88	46
10730	2	2007	1	1	25601.00	7440.00	3.44	46
10731	2	2007	1	2	26447.00	7890.00	3.35	46
10732	2	2007	2	0	7286.00	3225.00	2.26	46
10733	2	2007	2	1	37535.00	10200.00	3.68	46
10734	2	2007	2	2	44821.00	13425.00	3.34	46
10735	2	2008	1	0	3200.00	1360.00	2.35	46
10736	2	2008	1	1	32246.00	9313.00	3.46	46
10737	2	2008	1	2	35446.00	10673.00	3.32	46
10738	2	2008	2	0	8031.00	3715.00	2.16	46
10739	2	2008	2	1	30703.00	8665.00	3.54	46
10740	2	2008	2	2	38734.00	12380.00	3.13	46
10741	2	2009	1	0	2186.00	1008.00	2.17	46
10742	2	2009	1	1	25422.00	7726.00	3.29	46
10743	2	2009	1	2	27608.00	8734.00	3.16	46
10744	2	2009	2	0	6272.00	3818.00	1.64	46
10745	2	2009	2	1	28556.00	9701.00	2.94	46
10746	2	2009	2	2	34828.00	13519.00	2.58	46
10747	2	2010	1	0	1676.00	800.00	2.10	46
10748	2	2010	1	1	18927.00	7194.00	2.63	46
10749	2	2010	1	2	20603.00	7994.00	2.58	46
10750	2	2010	2	0	7064.00	3522.00	2.01	46
10751	2	2010	2	1	33386.00	9825.00	3.40	46
10752	2	2010	2	2	40450.00	13347.00	3.03	46
10753	2	2011	1	0	2147.00	979.00	2.19	46
10754	2	2011	1	1	23664.00	7386.00	3.20	46
10755	2	2011	1	2	25811.00	8365.00	3.09	46
10756	2	2011	2	0	11549.00	4404.00	2.62	46
10757	2	2011	2	1	33860.00	9970.00	3.40	46
10758	2	2011	2	2	45409.00	14374.00	3.16	46
10759	2	2012	1	0	2748.00	1110.00	2.48	46
10760	2	2012	1	1	24507.00	7525.00	3.26	46
10761	2	2012	1	2	27255.00	8635.00	3.16	46
10762	2	2012	2	0	10222.00	4161.00	2.46	46
10763	2	2012	2	1	32186.00	9743.00	3.30	46
10764	2	2012	2	2	42408.00	13904.00	3.05	46
10765	2	2013	1	0	1654.00	790.00	2.09	46
10766	2	2013	1	1	23776.00	7443.00	3.19	46
10767	2	2013	1	2	25430.00	8233.00	3.09	46
10768	2	2013	2	0	11062.00	4067.00	2.72	46
10769	2	2013	2	1	34681.00	10106.00	3.43	46
10770	2	2013	2	2	45743.00	14173.00	3.23	46
10771	2	2014	1	0	1709.00	905.00	1.89	46
10772	2	2014	1	1	21844.00	7113.00	3.07	46
10773	2	2014	1	2	23553.00	8018.00	2.94	46
10774	2	2014	2	0	10814.00	4131.00	2.62	46
10775	2	2014	2	1	30245.00	9202.00	3.29	46
10776	2	2014	2	2	41059.00	13333.00	3.08	46
10777	2	2015	1	0	2147.00	950.00	2.26	46
10778	2	2015	1	1	21962.00	7048.00	3.12	46
10779	2	2015	1	2	24109.00	7998.00	3.01	46
10780	2	2015	2	0	8984.00	4009.00	2.24	46
10781	2	2015	2	1	33300.00	9945.00	3.35	46
10782	2	2015	2	2	42284.00	13954.00	3.03	46
10783	2	2016	1	0	724.00	297.00	2.44	46
10784	2	2016	1	1	17622.00	6357.00	2.77	46
10785	2	2016	1	2	18346.00	6654.00	2.76	46
10786	2	2016	2	0	8296.00	3930.00	2.11	46
10787	2	2016	2	1	29102.00	9463.00	3.08	46
10788	2	2016	2	2	37398.00	13393.00	2.79	46
10789	2	2017	1	0	1960.00	926.00	2.12	46
10790	2	2017	1	1	25676.00	8197.00	3.13	46
10791	2	2017	1	2	27636.00	9123.00	3.03	46
10792	2	2017	2	0	9844.00	3967.00	2.48	46
10793	2	2017	2	1	31825.00	10049.00	3.17	46
10794	2	2017	2	2	41669.00	14016.00	2.97	46
10795	2	2018	1	0	2353.00	948.00	2.48	46
10796	2	2018	1	1	23413.00	7345.00	3.19	46
10797	2	2018	1	2	25766.00	8293.00	3.11	46
10798	2	2018	2	0	10116.00	4098.00	2.47	46
10799	2	2018	2	1	31708.00	10157.00	3.12	46
10800	2	2018	2	2	41824.00	14255.00	2.93	46
10801	2	2019	1	0	1651.00	787.00	2.10	46
10802	2	2019	1	1	18320.00	6408.00	2.86	46
10803	2	2019	1	2	19971.00	7195.00	2.78	46
10804	2	2019	2	0	8657.50	3769.00	2.30	46
10805	2	2019	2	1	28256.00	9448.00	2.99	46
10806	2	2019	2	2	36913.50	13217.00	2.79	46
10807	2	2020	1	0	2099.00	1048.00	2.00	46
10808	2	2020	1	1	19003.00	6626.00	2.87	46
10809	2	2020	1	2	21102.00	7674.00	2.75	46
10810	2	2020	2	0	8687.00	3862.00	2.25	46
10811	2	2020	2	1	29194.00	9841.00	2.97	46
10812	2	2020	2	2	37881.00	13703.00	2.76	46
10813	2	1987	1	0	6670.00	4080.00	1.63	47
10814	2	1987	1	1	83850.00	23120.00	3.63	47
10815	2	1987	1	2	90520.00	27200.00	3.33	47
10816	2	1987	2	0	36898.00	15280.00	2.41	47
10817	2	1987	2	1	121022.00	32500.00	3.72	47
10818	2	1987	2	2	157920.00	47780.00	3.31	47
10819	2	1988	1	0	11364.00	6340.00	1.79	47
10820	2	1988	1	1	91687.00	23150.00	3.96	47
10821	2	1988	1	2	103051.00	29490.00	3.49	47
10822	2	1988	2	0	37551.00	15790.00	2.38	47
10823	2	1988	2	1	122076.00	32200.00	3.79	47
10824	2	1988	2	2	159627.00	47990.00	3.33	47
10825	2	1989	1	0	22119.00	8610.00	2.57	47
10826	2	1989	1	1	93960.00	24180.00	3.89	47
10827	2	1989	1	2	116079.00	32790.00	3.54	47
10828	2	1989	2	0	49051.00	17960.00	2.73	47
10829	2	1989	2	1	112043.00	27670.00	4.05	47
10830	2	1989	2	2	161094.00	45630.00	3.53	47
10831	2	1990	1	0	2257.00	1410.00	1.60	47
10832	2	1990	1	1	69815.00	22530.00	3.10	47
10833	2	1990	1	2	72072.00	23940.00	3.01	47
10834	2	1990	2	0	21911.00	11440.00	1.92	47
10835	2	1990	2	1	80121.00	23290.00	3.44	47
10836	2	1990	2	2	102032.00	34730.00	2.94	47
10837	2	1991	1	0	3258.00	1450.00	2.25	47
10838	2	1991	1	1	80756.00	21380.00	3.78	47
10839	2	1991	1	2	84014.00	22830.00	3.68	47
10840	2	1991	2	0	22987.00	11940.00	1.93	47
10841	2	1991	2	1	120250.00	30230.00	3.98	47
10842	2	1991	2	2	143237.00	42170.00	3.40	47
10843	2	1992	1	0	80.00	80.00	1.00	47
10844	2	1992	1	1	42147.00	12180.00	3.46	47
10845	2	1992	1	2	42227.00	12260.00	3.44	47
10846	2	1992	2	0	22776.00	13230.00	1.72	47
10847	2	1992	2	1	96414.00	25460.00	3.79	47
10848	2	1992	2	2	119190.00	38690.00	3.08	47
10849	2	1993	1	0	2261.00	980.00	2.31	47
10850	2	1993	1	1	77182.00	20050.00	3.85	47
10851	2	1993	1	2	79443.00	21030.00	3.78	47
10852	2	1993	2	0	26876.00	14870.00	1.81	47
10853	2	1993	2	1	106117.00	27160.00	3.91	47
10854	2	1993	2	2	132993.00	42030.00	3.16	47
10855	2	1994	1	0	12574.00	5700.00	2.21	47
10856	2	1994	1	1	90018.00	27060.00	3.33	47
10857	2	1994	1	2	102592.00	32760.00	3.13	47
10858	2	1994	2	0	57650.00	25350.00	2.27	47
10859	2	1994	2	1	101163.00	27400.00	3.69	47
10860	2	1994	2	2	158813.00	52750.00	3.01	47
10861	2	1995	1	0	7831.00	4120.00	1.90	47
10862	2	1995	1	1	85850.00	25200.00	3.41	47
10863	2	1995	1	2	93681.00	29320.00	3.20	47
10864	2	1995	2	0	109800.00	39730.00	2.76	47
10865	2	1995	2	1	128978.00	32160.00	4.01	47
10866	2	1995	2	2	238778.00	71890.00	3.32	47
10867	2	1996	1	0	31430.00	11000.00	2.86	47
10868	2	1996	1	1	108239.00	31900.00	3.39	47
10869	2	1996	1	2	139669.00	42900.00	3.26	47
10870	2	1996	2	0	100035.00	38700.00	2.58	47
10871	2	1996	2	1	143540.00	40500.00	3.54	47
10872	2	1996	2	2	243575.00	79200.00	3.08	47
10873	2	1997	1	0	35918.00	14731.00	2.44	47
10874	2	1997	1	1	100423.00	28659.00	3.50	47
10875	2	1997	1	2	136341.00	43390.00	3.14	47
10876	2	1997	2	0	58086.00	31368.00	1.85	47
10877	2	1997	2	1	150098.00	40394.00	3.72	47
10878	2	1997	2	2	208184.00	71762.00	2.90	47
10879	2	1998	1	0	7885.00	4325.00	1.82	47
10880	2	1998	1	1	85779.00	27841.00	3.08	47
10881	2	1998	1	2	93664.00	32166.00	2.91	47
10882	2	1998	2	0	63903.00	27741.00	2.30	47
10883	2	1998	2	1	129748.00	37754.00	3.44	47
10884	2	1998	2	2	193651.00	65495.00	2.96	47
10885	2	1999	1	0	30354.00	16659.00	1.82	47
10886	2	1999	1	1	135553.00	44551.00	3.04	47
10887	2	1999	1	2	165907.00	61210.00	2.71	47
10888	2	1999	2	0	62707.00	26896.00	2.33	47
10889	2	1999	2	1	155951.00	44339.00	3.52	47
10890	2	1999	2	2	218658.00	71235.00	3.07	47
10891	2	2000	1	0	30345.00	11470.00	2.65	47
10892	2	2000	1	1	143379.00	40256.00	3.56	47
10893	2	2000	1	2	173724.00	51726.00	3.36	47
10894	2	2000	2	0	64686.00	24993.00	2.59	47
10895	2	2000	2	1	176956.00	48171.00	3.67	47
10896	2	2000	2	2	241642.00	73164.00	3.30	47
10897	2	2001	1	0	27115.00	9992.00	2.71	47
10898	2	2001	1	1	163128.00	41477.00	3.93	47
10899	2	2001	1	2	190243.00	51469.00	3.70	47
10900	2	2001	2	0	69016.00	24450.00	2.82	47
10901	2	2001	2	1	169535.00	45254.00	3.75	47
10902	2	2001	2	2	238551.00	69704.00	3.42	47
10903	2	2002	1	0	19431.00	7928.00	2.45	47
10904	2	2002	1	1	164332.00	41615.00	3.95	47
10905	2	2002	1	2	183763.00	49543.00	3.71	47
10906	2	2002	2	0	68757.00	24036.00	2.86	47
10907	2	2002	2	1	172914.00	43530.00	3.97	47
10908	2	2002	2	2	241671.00	67566.00	3.58	47
10909	2	2003	1	0	6981.00	3105.00	2.25	47
10910	2	2003	1	1	156224.00	39916.00	3.91	47
10911	2	2003	1	2	163205.00	43021.00	3.79	47
10912	2	2003	2	0	67938.00	26409.00	2.57	47
10913	2	2003	2	1	162863.00	43905.00	3.71	47
10914	2	2003	2	2	230801.00	70314.00	3.28	47
10915	2	2004	1	0	22177.00	8944.00	2.48	47
10916	2	2004	1	1	155745.00	40010.00	3.89	47
10917	2	2004	1	2	177922.00	48954.00	3.63	47
10918	2	2004	2	0	70252.00	26795.00	2.62	47
10919	2	2004	2	1	168949.00	44118.00	3.83	47
10920	2	2004	2	2	239201.00	70913.00	3.37	47
10921	2	2005	1	0	20731.00	7731.00	2.68	47
10922	2	2005	1	1	159962.00	41156.00	3.89	47
10923	2	2005	1	2	180693.00	48887.00	3.70	47
10924	2	2005	2	0	79798.00	26672.00	2.99	47
10925	2	2005	2	1	160292.00	42591.00	3.76	47
10926	2	2005	2	2	240090.00	69263.00	3.47	47
10927	2	2006	1	0	26783.00	8997.00	2.98	47
10928	2	2006	1	1	154584.00	40749.00	3.79	47
10929	2	2006	1	2	181367.00	49746.00	3.65	47
10930	2	2006	2	0	76611.00	27967.00	2.74	47
10931	2	2006	2	1	175663.00	44329.00	3.96	47
10932	2	2006	2	2	252274.00	72296.00	3.49	47
10933	2	2007	1	0	19385.00	7939.00	2.44	47
10934	2	2007	1	1	160049.00	40645.00	3.94	47
10935	2	2007	1	2	179434.00	48584.00	3.69	47
10936	2	2007	2	0	76717.00	27146.00	2.83	47
10937	2	2007	2	1	193051.00	47127.00	4.10	47
10938	2	2007	2	2	269768.00	74273.00	3.63	47
10939	2	2008	1	0	34415.00	11878.00	2.90	47
10940	2	2008	1	1	174868.00	44824.00	3.90	47
10941	2	2008	1	2	209283.00	56702.00	3.69	47
10942	2	2008	2	0	89567.00	28864.00	3.10	47
10943	2	2008	2	1	192865.00	46304.00	4.17	47
10944	2	2008	2	2	282432.00	75168.00	3.76	47
10945	2	2009	1	0	42411.00	14486.00	2.93	47
10946	2	2009	1	1	183629.00	45243.00	4.06	47
10947	2	2009	1	2	226040.00	59729.00	3.78	47
10948	2	2009	2	0	74658.00	26762.00	2.79	47
10949	2	2009	2	1	187711.00	46168.00	4.07	47
10950	2	2009	2	2	262369.00	72930.00	3.60	47
10951	2	2010	1	0	20207.00	7826.00	2.58	47
10952	2	2010	1	1	157527.00	41094.00	3.83	47
10953	2	2010	1	2	177734.00	48920.00	3.63	47
10954	2	2010	2	0	82064.00	26590.00	3.09	47
10955	2	2010	2	1	199660.00	46977.00	4.25	47
10956	2	2010	2	2	281724.00	73567.00	3.83	47
10957	2	2011	1	0	31436.00	11646.00	2.70	47
10958	2	2011	1	1	167126.00	43831.00	3.81	47
10959	2	2011	1	2	198562.00	55477.00	3.58	47
10960	2	2011	2	0	81631.00	26621.00	3.07	47
10961	2	2011	2	1	200813.00	46262.00	4.34	47
10962	2	2011	2	2	282444.00	72883.00	3.88	47
10963	2	2012	1	0	41059.00	15212.00	2.70	47
10964	2	2012	1	1	175357.00	43949.00	3.99	47
10965	2	2012	1	2	216416.00	59161.00	3.66	47
10966	2	2012	2	0	77391.00	25750.00	3.01	47
10967	2	2012	2	1	200245.00	46199.00	4.33	47
10968	2	2012	2	2	277636.00	71949.00	3.86	47
10969	2	2013	1	0	36384.00	12571.00	2.89	47
10970	2	2013	1	1	179548.00	43122.00	4.16	47
10971	2	2013	1	2	215932.00	55693.00	3.88	47
10972	2	2013	2	0	75965.00	23297.00	3.26	47
10973	2	2013	2	1	233778.00	51215.00	4.56	47
10974	2	2013	2	2	309743.00	74512.00	4.16	47
10975	2	2014	1	0	39124.00	12580.00	3.11	47
10976	2	2014	1	1	187563.00	43366.00	4.33	47
10977	2	2014	1	2	226687.00	55946.00	4.05	47
10978	2	2014	2	0	72236.00	23272.00	3.10	47
10979	2	2014	2	1	231106.00	50234.00	4.60	47
10980	2	2014	2	2	303342.00	73506.00	4.13	47
10981	2	2015	1	0	27667.00	10512.00	2.63	47
10982	2	2015	1	1	166782.00	41218.00	4.05	47
10983	2	2015	1	2	194449.00	51730.00	3.76	47
10984	2	2015	2	0	70068.00	23533.00	2.98	47
10985	2	2015	2	1	210568.00	50343.00	4.18	47
10986	2	2015	2	2	280636.00	73876.00	3.80	47
10987	2	2016	1	0	21579.00	8595.00	2.51	47
10988	2	2016	1	1	117016.00	32788.00	3.57	47
10989	2	2016	1	2	138595.00	41383.00	3.35	47
10990	2	2016	2	0	63643.00	20286.00	3.14	47
10991	2	2016	2	1	231719.00	50729.00	4.57	47
10992	2	2016	2	2	295362.00	71015.00	4.16	47
10993	2	2017	1	0	29232.00	11235.00	2.60	47
10994	2	2017	1	1	171089.00	41245.00	4.15	47
10995	2	2017	1	2	200321.00	52480.00	3.82	47
10996	2	2017	2	0	68876.00	21622.00	3.19	47
10997	2	2017	2	1	231041.00	51766.00	4.46	47
10998	2	2017	2	2	299917.00	73388.00	4.09	47
10999	2	2018	1	0	33485.00	11922.00	2.81	47
11000	2	2018	1	1	185139.00	41565.00	4.45	47
11001	2	2018	1	2	218624.00	53487.00	4.09	47
11002	2	2018	2	0	70859.00	21588.00	3.28	47
11003	2	2018	2	1	234476.00	52055.00	4.50	47
11004	2	2018	2	2	305335.00	73643.00	4.15	47
11005	2	2019	1	0	22691.00	10053.00	2.26	47
11006	2	2019	1	1	165851.00	41213.00	4.02	47
11007	2	2019	1	2	188542.00	51266.00	3.68	47
11008	2	2019	2	0	59718.00	20440.00	2.92	47
11009	2	2019	2	1	219477.00	51841.00	4.23	47
11010	2	2019	2	2	279195.00	72281.00	3.86	47
11011	2	2020	1	0	28116.28	10820.00	2.60	47
11012	2	2020	1	1	173640.00	40512.00	4.29	47
11013	2	2020	1	2	201756.28	51332.00	3.93	47
11014	2	2020	2	0	68417.00	22741.00	3.01	47
11015	2	2020	2	1	251591.00	54019.00	4.66	47
11016	2	2020	2	2	320008.00	76760.00	4.17	47
11017	2	1987	1	0	28995.00	26150.00	1.11	48
11018	2	1987	1	1	55.00	50.00	1.10	48
11019	2	1987	1	2	29050.00	26200.00	1.11	48
11020	2	1987	2	0	7879.00	5200.00	1.52	48
11021	2	1987	2	1	369.00	330.00	1.12	48
11022	2	1987	2	2	8248.00	5530.00	1.49	48
11023	2	1988	1	0	36548.00	28870.00	1.27	48
11024	2	1988	1	1	1540.00	680.00	2.26	48
11025	2	1988	1	2	38088.00	29550.00	1.29	48
11026	2	1988	2	0	8357.00	5500.00	1.52	48
11027	2	1988	2	1	1496.00	910.00	1.64	48
11028	2	1988	2	2	9853.00	6410.00	1.54	48
11029	2	1989	1	0	23835.00	35350.00	0.67	48
11030	2	1989	1	1	482.00	250.00	1.93	48
11031	2	1989	1	2	24317.00	35600.00	0.68	48
11032	2	1989	2	0	5999.00	4210.00	1.42	48
11033	2	1989	2	1	1113.00	820.00	1.36	48
11034	2	1989	2	2	7112.00	5030.00	1.41	48
11035	2	1990	1	0	29400.00	33960.00	0.87	48
11036	2	1990	1	1	520.00	260.00	2.00	48
11037	2	1990	1	2	29920.00	34220.00	0.87	48
11038	2	1990	2	0	10313.00	5670.00	1.82	48
11039	2	1990	2	1	1693.00	890.00	1.90	48
11040	2	1990	2	2	12006.00	6560.00	1.83	48
11041	2	1991	1	0	40297.00	38640.00	1.04	48
11042	2	1991	1	1	550.00	270.00	2.04	48
11043	2	1991	1	2	40847.00	38910.00	1.05	48
11044	2	1991	2	0	14073.00	10130.00	1.39	48
11045	2	1991	2	1	2987.00	1610.00	1.86	48
11046	2	1991	2	2	17060.00	11740.00	1.45	48
11047	2	1992	1	0	53804.00	45520.00	1.18	48
11048	2	1992	1	1	3300.00	1350.00	2.44	48
11049	2	1992	1	2	57104.00	46870.00	1.22	48
11050	2	1992	2	0	3775.00	2630.00	1.44	48
11051	2	1992	2	1	1829.00	1220.00	1.50	48
11052	2	1992	2	2	5604.00	3850.00	1.46	48
11053	2	1993	1	0	35032.00	31680.00	1.11	48
11054	2	1993	1	1	4840.00	2180.00	2.22	48
11055	2	1993	1	2	39872.00	33860.00	1.18	48
11056	2	1993	2	0	3325.00	2320.00	1.43	48
11057	2	1993	2	1	1939.00	1080.00	1.80	48
11058	2	1993	2	2	5264.00	3400.00	1.55	48
11059	2	1994	1	0	40590.00	31740.00	1.28	48
11060	2	1994	1	1	5239.00	2210.00	2.37	48
11061	2	1994	1	2	45829.00	33950.00	1.35	48
11062	2	1994	2	0	3836.00	2610.00	1.47	48
11063	2	1994	2	1	2056.00	1100.00	1.87	48
11064	2	1994	2	2	5892.00	3710.00	1.59	48
11065	2	1995	1	0	41280.00	31700.00	1.30	48
11066	2	1995	1	1	5352.00	2240.00	2.39	48
11067	2	1995	1	2	46632.00	33940.00	1.37	48
11068	2	1995	2	0	3236.00	2605.00	1.24	48
11069	2	1995	2	1	2035.00	1110.00	1.83	48
11070	2	1995	2	2	5271.00	3715.00	1.42	48
11071	2	1996	1	0	35648.00	31800.00	1.12	48
11072	2	1996	1	1	4668.00	2255.00	2.07	48
11073	2	1996	1	2	40316.00	34055.00	1.18	48
11074	2	1996	2	0	3459.00	2709.00	1.28	48
11075	2	1996	2	1	2106.00	1120.00	1.88	48
11076	2	1996	2	2	5565.00	3829.00	1.45	48
11077	2	1997	1	0	38642.00	31831.00	1.21	48
11078	2	1997	1	1	5060.00	2267.00	2.23	48
11079	2	1997	1	2	43702.00	34098.00	1.28	48
11080	2	1997	2	0	3410.00	2673.00	1.28	48
11081	2	1997	2	1	2110.00	1120.00	1.88	48
11082	2	1997	2	2	5520.00	3793.00	1.46	48
11083	2	1998	1	0	36158.00	31020.00	1.17	48
11084	2	1998	1	1	4810.00	2210.00	2.18	48
11085	2	1998	1	2	40968.00	33230.00	1.23	48
11086	2	1998	2	0	3125.00	2625.00	1.19	48
11087	2	1998	2	1	1655.00	799.00	2.07	48
11088	2	1998	2	2	4780.00	3424.00	1.40	48
11089	2	1999	1	0	40252.00	31325.00	1.28	48
11090	2	1999	1	1	5415.00	2260.00	2.40	48
11091	2	1999	1	2	45667.00	33585.00	1.36	48
11092	2	1999	2	0	3806.00	2820.00	1.35	48
11093	2	1999	2	1	2344.00	1105.00	2.12	48
11094	2	1999	2	2	6150.00	3925.00	1.57	48
11095	2	2000	1	0	37526.00	31079.00	1.21	48
11096	2	2000	1	1	5109.00	2214.00	2.31	48
11097	2	2000	1	2	42635.00	33293.00	1.28	48
11098	2	2000	2	0	3882.00	2825.00	1.37	48
11099	2	2000	2	1	2365.00	1124.00	2.10	48
11100	2	2000	2	2	6247.00	3949.00	1.58	48
11101	2	2001	1	0	40768.00	31088.00	1.31	48
11102	2	2001	1	1	5519.00	2220.00	2.49	48
11103	2	2001	1	2	46287.00	33308.00	1.39	48
11104	2	2001	2	0	9007.00	5623.00	1.60	48
11105	2	2001	2	1	3199.00	1150.00	2.78	48
11106	2	2001	2	2	12206.00	6773.00	1.80	48
11107	2	2002	1	0	48590.00	28570.00	1.70	48
11108	2	2002	1	1	6238.00	2265.00	2.75	48
11109	2	2002	1	2	54828.00	30835.00	1.78	48
11110	2	2002	2	0	10128.00	6126.00	1.65	48
11111	2	2002	2	1	3271.00	1160.00	2.82	48
11112	2	2002	2	2	13399.00	7286.00	1.84	48
11113	2	2003	1	0	50175.00	28603.00	1.75	48
11114	2	2003	1	1	6456.00	2300.00	2.81	48
11115	2	2003	1	2	56631.00	30903.00	1.83	48
11116	2	2003	2	0	11069.00	6165.00	1.80	48
11117	2	2003	2	1	3554.00	1183.00	3.00	48
11118	2	2003	2	2	14623.00	7348.00	1.99	48
11119	2	2004	1	0	55387.00	28633.00	1.93	48
11120	2	2004	1	1	7033.00	2342.00	3.00	48
11121	2	2004	1	2	62420.00	30975.00	2.02	48
11122	2	2004	2	0	11634.00	6200.00	1.88	48
11123	2	2004	2	1	3733.00	1195.00	3.12	48
11124	2	2004	2	2	15367.00	7395.00	2.08	48
11125	2	2005	1	0	56529.00	28720.00	1.97	48
11126	2	2005	1	1	7486.00	2460.00	3.04	48
11127	2	2005	1	2	64015.00	31180.00	2.05	48
11128	2	2005	2	0	12358.00	6310.00	1.96	48
11129	2	2005	2	1	3920.00	1210.00	3.24	48
11130	2	2005	2	2	16278.00	7520.00	2.16	48
11131	2	2006	1	0	57400.00	28751.00	2.00	48
11132	2	2006	1	1	7555.00	2490.00	3.03	48
11133	2	2006	1	2	64955.00	31241.00	2.08	48
11134	2	2006	2	0	13287.00	6390.00	2.08	48
11135	2	2006	2	1	4236.00	1240.00	3.42	48
11136	2	2006	2	2	17523.00	7630.00	2.30	48
11137	2	2007	1	0	48649.00	27107.00	1.79	48
11138	2	2007	1	1	6438.00	2427.00	2.65	48
11139	2	2007	1	2	55087.00	29534.00	1.87	48
11140	2	2007	2	0	16474.00	7050.00	2.34	48
11141	2	2007	2	1	5205.00	1455.00	3.58	48
11142	2	2007	2	2	21679.00	8505.00	2.55	48
11143	2	2008	1	0	53393.00	23611.00	2.26	48
11144	2	2008	1	1	6158.00	2106.00	2.92	48
11145	2	2008	1	2	59551.00	25717.00	2.32	48
11146	2	2008	2	0	32944.00	11968.00	2.75	48
11147	2	2008	2	1	8512.00	2155.00	3.95	48
11148	2	2008	2	2	41456.00	14123.00	2.94	48
11149	2	2009	1	0	42466.00	21319.00	1.99	48
11150	2	2009	1	1	5366.00	1938.00	2.77	48
11151	2	2009	1	2	47832.00	23257.00	2.06	48
11152	2	2009	2	0	34057.00	11950.00	2.85	48
11153	2	2009	2	1	7488.00	2149.00	3.48	48
11154	2	2009	2	2	41545.00	14099.00	2.95	48
11155	2	2010	1	0	45179.00	22116.00	2.04	48
11156	2	2010	1	1	5913.00	1938.00	3.05	48
11157	2	2010	1	2	51092.00	24054.00	2.12	48
11158	2	2010	2	0	37476.00	11561.00	3.24	48
11159	2	2010	2	1	9813.00	2568.00	3.82	48
11160	2	2010	2	2	47289.00	14129.00	3.35	48
11161	2	2011	1	0	48378.00	22158.00	2.18	48
11162	2	2011	1	1	5993.00	1944.00	3.08	48
11163	2	2011	1	2	54371.00	24102.00	2.26	48
11275	2	1996	1	0	\N	\N	\N	49
11164	2	2011	2	0	42561.00	13158.00	3.23	48
11165	2	2011	2	1	9116.00	2376.00	3.84	48
11166	2	2011	2	2	51677.00	15534.00	3.33	48
11167	2	2012	1	0	46770.00	20169.00	2.32	48
11168	2	2012	1	1	4968.00	1590.00	3.12	48
11169	2	2012	1	2	51738.00	21759.00	2.38	48
11170	2	2012	2	0	49977.00	15466.00	3.23	48
11171	2	2012	2	1	9491.00	2439.00	3.89	48
11172	2	2012	2	2	59468.00	17905.00	3.32	48
11173	2	2013	1	0	50610.00	21264.00	2.38	48
11174	2	2013	1	1	5810.00	1839.00	3.16	48
11175	2	2013	1	2	56420.00	23103.00	2.44	48
11176	2	2013	2	0	50619.00	15466.00	3.27	48
11177	2	2013	2	1	9674.00	2478.00	3.90	48
11178	2	2013	2	2	60293.00	17944.00	3.36	48
11179	2	2014	1	0	51048.00	21278.00	2.40	48
11180	2	2014	1	1	5864.00	1843.00	3.18	48
11181	2	2014	1	2	56912.00	23121.00	2.46	48
11182	2	2014	2	0	51177.00	15490.00	3.30	48
11183	2	2014	2	1	9876.00	2495.00	3.96	48
11184	2	2014	2	2	61053.00	17985.00	3.39	48
11185	2	2015	1	0	51103.00	21285.00	2.40	48
11186	2	2015	1	1	5990.00	1848.00	3.24	48
11187	2	2015	1	2	57093.00	23133.00	2.47	48
11188	2	2015	2	0	50423.00	15482.00	3.26	48
11189	2	2015	2	1	9724.00	2479.00	3.92	48
11190	2	2015	2	2	60147.00	17961.00	3.35	48
11191	2	2016	1	0	50575.00	21280.00	2.38	48
11192	2	2016	1	1	5331.00	1847.00	2.89	48
11193	2	2016	1	2	55906.00	23127.00	2.42	48
11194	2	2016	2	0	45280.00	14016.00	3.23	48
11195	2	2016	2	1	9900.00	2603.00	3.80	48
11196	2	2016	2	2	55180.00	16619.00	3.32	48
11197	2	2017	1	0	50934.00	21039.00	2.42	48
11198	2	2017	1	1	5019.00	1775.00	2.83	48
11199	2	2017	1	2	55953.00	22814.00	2.45	48
11200	2	2017	2	0	46382.00	15085.00	3.07	48
11201	2	2017	2	1	10250.00	2697.00	3.80	48
11202	2	2017	2	2	56632.00	17782.00	3.18	48
11203	2	2018	1	0	51820.00	21756.00	2.38	48
11204	2	2018	1	1	7723.00	2493.00	3.10	48
11205	2	2018	1	2	59543.00	24249.00	2.46	48
11206	2	2018	2	0	42827.00	13565.00	3.16	48
11207	2	2018	2	1	2601.00	683.00	3.81	48
11208	2	2018	2	2	45428.00	14248.00	3.19	48
11209	2	2019	1	0	53789.20	21346.00	2.52	48
11210	2	2019	1	1	7868.07	2466.00	3.19	48
11211	2	2019	1	2	61657.27	23812.00	2.59	48
11212	2	2019	2	0	29694.00	9815.00	3.03	48
11213	2	2019	2	1	2862.00	765.00	3.74	48
11214	2	2019	2	2	32556.00	10580.00	3.08	48
11215	2	2020	1	0	70293.50	26190.00	2.68	48
11216	2	2020	1	1	11073.25	3453.00	3.21	48
11217	2	2020	1	2	81366.75	29643.00	2.74	48
11218	2	2020	2	0	29325.00	9591.00	3.06	48
11219	2	2020	2	1	2931.00	787.00	3.72	48
11220	2	2020	2	2	32256.00	10378.00	3.11	48
11221	2	1987	1	0	4535.00	1550.00	2.93	49
11222	2	1987	1	1	316215.00	72990.00	4.33	49
11223	2	1987	1	2	320750.00	74540.00	4.30	49
11224	2	1987	2	0	66867.00	31740.00	2.11	49
11225	2	1987	2	1	290227.00	88900.00	3.26	49
11226	2	1987	2	2	357094.00	120640.00	2.96	49
11227	2	1988	1	0	103.00	110.00	0.94	49
11228	2	1988	1	1	227068.00	52680.00	4.31	49
11229	2	1988	1	2	227171.00	52790.00	4.30	49
11230	2	1988	2	0	78634.00	43110.00	1.82	49
11231	2	1988	2	1	196104.00	91790.00	2.14	49
11232	2	1988	2	2	274738.00	134900.00	2.04	49
11233	2	1989	1	0	\N	\N	\N	49
11234	2	1989	1	1	365373.00	81170.00	4.50	49
11235	2	1989	1	2	365373.00	81170.00	4.50	49
11236	2	1989	2	0	131286.00	54690.00	2.40	49
11237	2	1989	2	1	271818.00	98410.00	2.76	49
11238	2	1989	2	2	403104.00	153100.00	2.63	49
11239	2	1990	1	0	\N	\N	\N	49
11240	2	1990	1	1	371827.00	78940.00	4.71	49
11241	2	1990	1	2	371827.00	78940.00	4.71	49
11242	2	1990	2	0	261759.00	64630.00	4.05	49
11243	2	1990	2	1	338177.00	96640.00	3.50	49
11244	2	1990	2	2	599936.00	161270.00	3.72	49
11245	2	1991	1	0	\N	\N	\N	49
11246	2	1991	1	1	407438.00	75860.00	5.37	49
11247	2	1991	1	2	407438.00	75860.00	5.37	49
11248	2	1991	2	0	171023.00	58190.00	2.94	49
11249	2	1991	2	1	342990.00	107690.00	3.18	49
11250	2	1991	2	2	514013.00	165880.00	3.10	49
11251	2	1992	1	0	\N	\N	\N	49
11252	2	1992	1	1	342457.00	67520.00	5.07	49
11253	2	1992	1	2	342457.00	67520.00	5.07	49
11254	2	1992	2	0	153887.00	52770.00	2.92	49
11255	2	1992	2	1	369460.00	104610.00	3.53	49
11256	2	1992	2	2	523347.00	157380.00	3.33	49
11257	2	1993	1	0	\N	\N	\N	49
11258	2	1993	1	1	394276.00	85170.00	4.63	49
11259	2	1993	1	2	394276.00	85170.00	4.63	49
11260	2	1993	2	0	169939.00	66100.00	2.57	49
11261	2	1993	2	1	252391.00	87330.00	2.89	49
11262	2	1993	2	2	422330.00	153430.00	2.75	49
11263	2	1994	1	0	\N	\N	\N	49
11264	2	1994	1	1	438437.00	95650.00	4.58	49
11265	2	1994	1	2	438437.00	95650.00	4.58	49
11266	2	1994	2	0	154192.00	55070.00	2.80	49
11267	2	1994	2	1	373769.00	106580.00	3.51	49
11268	2	1994	2	2	527961.00	161650.00	3.27	49
11269	2	1995	1	0	\N	\N	\N	49
11270	2	1995	1	1	402227.00	96777.00	4.16	49
11271	2	1995	1	2	402227.00	96777.00	4.16	49
11272	2	1995	2	0	121457.00	46324.00	2.62	49
11273	2	1995	2	1	354165.00	119982.00	2.95	49
11274	2	1995	2	2	475622.00	166306.00	2.86	49
11276	2	1996	1	1	400880.00	91559.00	4.38	49
11277	2	1996	1	2	400880.00	91559.00	4.38	49
11278	2	1996	2	0	105879.00	44487.00	2.38	49
11279	2	1996	2	1	387428.00	117545.00	3.30	49
11280	2	1996	2	2	493307.00	162032.00	3.04	49
11281	2	1997	1	0	\N	\N	\N	49
11282	2	1997	1	1	402418.00	87153.00	4.62	49
11283	2	1997	1	2	402418.00	87153.00	4.62	49
11284	2	1997	2	0	130238.00	45003.00	2.89	49
11285	2	1997	2	1	396942.00	117423.00	3.38	49
11286	2	1997	2	2	527180.00	162426.00	3.25	49
11287	2	1998	1	0	\N	\N	\N	49
11288	2	1998	1	1	324043.00	75460.00	4.29	49
11289	2	1998	1	2	324043.00	75460.00	4.29	49
11290	2	1998	2	0	52743.00	26638.00	1.98	49
11291	2	1998	2	1	269700.00	101362.00	2.66	49
11292	2	1998	2	2	322443.00	128000.00	2.52	49
11293	2	1999	1	0	1488.00	1200.00	1.24	49
11294	2	1999	1	1	361112.00	95051.00	3.80	49
11295	2	1999	1	2	362600.00	96251.00	3.77	49
11296	2	1999	2	0	102761.00	38304.00	2.68	49
11297	2	1999	2	1	356005.00	106088.00	3.36	49
11298	2	1999	2	2	458766.00	144392.00	3.18	49
11299	2	2000	1	0	\N	\N	\N	49
11300	2	2000	1	1	442922.00	95387.00	4.64	49
11301	2	2000	1	2	442922.00	95387.00	4.64	49
11302	2	2000	2	0	103484.00	39498.00	2.62	49
11303	2	2000	2	1	332301.00	108640.00	3.06	49
11304	2	2000	2	2	435785.00	148138.00	2.94	49
11305	2	2001	1	0	\N	\N	\N	49
11306	2	2001	1	1	426242.00	95756.00	4.45	49
11307	2	2001	1	2	426242.00	95756.00	4.45	49
11308	2	2001	2	0	135909.00	41310.00	3.29	49
11309	2	2001	2	1	392748.00	108697.00	3.61	49
11310	2	2001	2	2	528657.00	150007.00	3.52	49
11311	2	2002	1	0	\N	\N	\N	49
11312	2	2002	1	1	410411.00	90024.00	4.56	49
11313	2	2002	1	2	410411.00	90024.00	4.56	49
11314	2	2002	2	0	151347.00	41465.00	3.65	49
11315	2	2002	2	1	406996.00	107638.00	3.78	49
11316	2	2002	2	2	558343.00	149103.00	3.74	49
11317	2	2003	1	0	\N	\N	\N	49
11318	2	2003	1	1	462683.00	95470.00	4.85	49
11319	2	2003	1	2	462683.00	95470.00	4.85	49
11320	2	2003	2	0	143464.00	41344.00	3.47	49
11321	2	2003	2	1	495651.00	106685.00	4.65	49
11322	2	2003	2	2	639115.00	148029.00	4.32	49
11323	2	2004	1	0	\N	\N	\N	49
11324	2	2004	1	1	477373.00	97733.00	4.88	49
11325	2	2004	1	2	477373.00	97733.00	4.88	49
11326	2	2004	2	0	145579.00	40200.00	3.62	49
11327	2	2004	2	1	505118.00	106517.00	4.74	49
11328	2	2004	2	2	650697.00	146717.00	4.44	49
11329	2	2005	1	0	\N	\N	\N	49
11330	2	2005	1	1	502779.00	99913.00	5.03	49
11331	2	2005	1	2	502779.00	99913.00	5.03	49
11332	2	2005	2	0	127970.00	38200.00	3.35	49
11333	2	2005	2	1	505874.00	107110.00	4.72	49
11334	2	2005	2	2	633844.00	145310.00	4.36	49
11335	2	2006	1	0	\N	\N	\N	49
11336	2	2006	1	1	492018.00	97168.00	5.06	49
11337	2	2006	1	2	492018.00	97168.00	5.06	49
11338	2	2006	2	0	147630.00	38850.00	3.80	49
11339	2	2006	2	1	591528.00	119600.00	4.95	49
11340	2	2006	2	2	739158.00	158450.00	4.66	49
11341	2	2007	1	0	\N	\N	\N	49
11342	2	2007	1	1	571566.00	106900.00	5.35	49
11343	2	2007	1	2	571566.00	106900.00	5.35	49
11344	2	2007	2	0	145125.00	38700.00	3.75	49
11345	2	2007	2	1	639470.00	129250.00	4.95	49
11346	2	2007	2	2	784595.00	167950.00	4.67	49
11347	2	2008	1	0	\N	\N	\N	49
11348	2	2008	1	1	620724.00	110835.00	5.60	49
11349	2	2008	1	2	620724.00	110835.00	5.60	49
11350	2	2008	2	0	126711.00	39600.00	3.20	49
11351	2	2008	2	1	624943.00	135470.00	4.61	49
11352	2	2008	2	2	751654.00	175070.00	4.29	49
11353	2	2009	1	0	\N	\N	\N	49
11354	2	2009	1	1	713823.00	121353.00	5.88	49
11355	2	2009	1	2	713823.00	121353.00	5.88	49
11356	2	2009	2	0	127425.00	38731.00	3.29	49
11357	2	2009	2	1	519667.00	135756.00	3.83	49
11358	2	2009	2	2	647092.00	174487.00	3.71	49
11359	2	2010	1	0	\N	\N	\N	49
11360	2	2010	1	1	729099.00	124275.00	5.87	49
11361	2	2010	1	2	729099.00	124275.00	5.87	49
11362	2	2010	2	0	98194.00	38810.00	2.53	49
11363	2	2010	2	1	546880.00	136759.00	4.00	49
11364	2	2010	2	2	645074.00	175569.00	3.67	49
11365	2	2011	1	0	\N	\N	\N	49
11366	2	2011	1	1	742846.00	125825.00	5.90	49
11367	2	2011	1	2	742846.00	125825.00	5.90	49
11368	2	2011	2	0	120349.00	37250.00	3.23	49
11369	2	2011	2	1	450292.00	123746.00	3.64	49
11370	2	2011	2	2	570641.00	160996.00	3.54	49
11371	2	2012	1	0	\N	\N	\N	49
11372	2	2012	1	1	771163.00	127645.00	6.04	49
11373	2	2012	1	2	771163.00	127645.00	6.04	49
11374	2	2012	2	0	134338.00	38387.00	3.50	49
11375	2	2012	2	1	681662.00	138157.00	4.93	49
11376	2	2012	2	2	816000.00	176544.00	4.62	49
11377	2	2013	1	0	\N	\N	\N	49
11378	2	2013	1	1	817500.00	133601.00	6.12	49
11379	2	2013	1	2	817500.00	133601.00	6.12	49
11380	2	2013	2	0	152347.00	38191.00	3.99	49
11381	2	2013	2	1	702819.00	143584.00	4.89	49
11382	2	2013	2	2	855166.00	181775.00	4.70	49
11383	2	2014	1	0	\N	\N	\N	49
11384	2	2014	1	1	953292.00	136854.00	6.97	49
11385	2	2014	1	2	953292.00	136854.00	6.97	49
11386	2	2014	2	0	172362.00	37528.00	4.59	49
11387	2	2014	2	1	805342.00	143902.00	5.60	49
11388	2	2014	2	2	977704.00	181430.00	5.39	49
11389	2	2015	1	0	\N	\N	\N	49
11390	2	2015	1	1	963767.00	135675.00	7.10	49
11391	2	2015	1	2	963767.00	135675.00	7.10	49
11392	2	2015	2	0	106268.00	37937.00	2.80	49
11393	2	2015	2	1	510585.00	134834.00	3.79	49
11394	2	2015	2	2	616853.00	172771.00	3.57	49
11395	2	2016	1	0	\N	\N	\N	49
11396	2	2016	1	1	974744.00	135119.00	7.21	49
11397	2	2016	1	2	974744.00	135119.00	7.21	49
11398	2	2016	2	0	108273.00	34373.00	3.15	49
11399	2	2016	2	1	601335.00	143956.00	4.18	49
11400	2	2016	2	2	709608.00	178329.00	3.98	49
11401	2	2017	1	0	0.00	0.00	\N	49
11402	2	2017	1	1	943664.00	136561.00	6.91	49
11403	2	2017	1	2	943664.00	136561.00	6.91	49
11404	2	2017	2	0	146983.00	33178.00	4.43	49
11405	2	2017	2	1	793444.00	154303.00	5.14	49
11406	2	2017	2	2	940427.00	187481.00	5.02	49
11407	2	2018	1	0	0.00	0.00	\N	49
11408	2	2018	1	1	944723.00	141350.00	6.68	49
11409	2	2018	1	2	944723.00	141350.00	6.68	49
11410	2	2018	2	0	146698.12	33181.00	4.42	49
11411	2	2018	2	1	795287.81	158646.00	5.01	49
11412	2	2018	2	2	941985.93	191827.00	4.91	49
11413	2	2019	1	0	0.00	0.00	\N	49
11414	2	2019	1	1	1005015.09	149855.00	6.71	49
11415	2	2019	1	2	1005015.09	149855.00	6.71	49
11416	2	2019	2	0	95883.00	23820.00	4.03	49
11417	2	2019	2	1	855063.05	162655.21	5.26	49
11418	2	2019	2	2	950946.05	186475.21	5.10	49
11419	2	2020	1	0	0.00	0.00	\N	49
11420	2	2020	1	1	959342.09	149167.00	6.43	49
11421	2	2020	1	2	959342.09	149167.00	6.43	49
11422	2	2020	2	0	89531.50	20878.00	4.29	49
11423	2	2020	2	1	855953.77	149286.00	5.73	49
11424	2	2020	2	2	945485.27	170164.00	5.56	49
11425	1	1987	1	0	72165.00	53880.00	1.34	5
11426	1	1987	1	1	184820.00	72570.00	2.55	5
11427	1	1987	1	2	256985.00	126450.00	2.03	5
11428	1	1987	2	0	119634.00	78510.00	1.52	5
11429	1	1987	2	1	204785.00	77770.00	2.63	5
11430	1	1987	2	2	324419.00	156280.00	2.08	5
11431	1	1988	1	0	99535.00	66850.00	1.49	5
11432	1	1988	1	1	225329.00	91190.00	2.47	5
11433	1	1988	1	2	324864.00	158040.00	2.06	5
11434	1	1988	2	0	138303.00	83160.00	1.66	5
11435	1	1988	2	1	245650.00	90160.00	2.72	5
11436	1	1988	2	2	383953.00	173320.00	2.22	5
11437	1	1989	1	0	88232.00	59120.00	1.49	5
11438	1	1989	1	1	194542.00	84530.00	2.30	5
11439	1	1989	1	2	282774.00	143650.00	1.97	5
11440	1	1989	2	0	128156.00	82330.00	1.56	5
11441	1	1989	2	1	257077.00	87290.00	2.95	5
11442	1	1989	2	2	385233.00	169620.00	2.27	5
11443	1	1990	1	0	69349.00	48420.00	1.43	5
11444	1	1990	1	1	268864.00	93620.00	2.87	5
11445	1	1990	1	2	338213.00	142040.00	2.38	5
11446	1	1990	2	0	108894.00	59280.00	1.84	5
11447	1	1990	2	1	239891.00	74350.00	3.23	5
11448	1	1990	2	2	348785.00	133630.00	2.61	5
11449	1	1991	1	0	84909.00	54760.00	1.55	5
11450	1	1991	1	1	280885.00	101230.00	2.77	5
11451	1	1991	1	2	365794.00	155990.00	2.34	5
11452	1	1991	2	0	133040.00	65150.00	2.04	5
11453	1	1991	2	1	245389.00	74390.00	3.30	5
11454	1	1991	2	2	378429.00	139540.00	2.71	5
11455	1	1992	1	0	100491.00	61030.00	1.65	5
11456	1	1992	1	1	270361.00	93620.00	2.89	5
11457	1	1992	1	2	370852.00	154650.00	2.40	5
11458	1	1992	2	0	100443.00	56520.00	1.78	5
11459	1	1992	2	1	244164.00	73760.00	3.31	5
11460	1	1992	2	2	344607.00	130280.00	2.65	5
11461	1	1993	1	0	73935.00	47450.00	1.56	5
11462	1	1993	1	1	261866.00	89520.00	2.93	5
11463	1	1993	1	2	335801.00	136970.00	2.45	5
11464	1	1993	2	0	95634.00	52380.00	1.83	5
11465	1	1993	2	1	233694.00	78390.00	2.98	5
11466	1	1993	2	2	329328.00	130770.00	2.52	5
11467	1	1994	1	0	66508.00	39100.00	1.70	5
11468	1	1994	1	1	223715.00	84620.00	2.64	5
11469	1	1994	1	2	290223.00	123720.00	2.35	5
11470	1	1994	2	0	134989.00	79610.00	1.70	5
11471	1	1994	2	1	264358.00	93510.00	2.83	5
11472	1	1994	2	2	399347.00	173120.00	2.31	5
11473	1	1995	1	0	57353.00	34629.00	1.66	5
11474	1	1995	1	1	258493.00	94284.00	2.74	5
11475	1	1995	1	2	315846.00	128913.00	2.45	5
11476	1	1995	2	0	95773.00	67930.00	1.41	5
11477	1	1995	2	1	186999.00	84420.00	2.22	5
11478	1	1995	2	2	282772.00	152350.00	1.86	5
11479	1	1996	1	0	96856.00	52680.00	1.84	5
11480	1	1996	1	1	201704.00	86300.00	2.34	5
11481	1	1996	1	2	298560.00	138980.00	2.15	5
11482	1	1996	2	0	126839.00	75610.00	1.68	5
11483	1	1996	2	1	235567.00	91550.00	2.57	5
11484	1	1996	2	2	362406.00	167160.00	2.17	5
11485	1	1997	1	0	80614.00	44700.00	1.80	5
11486	1	1997	1	1	248329.00	90040.00	2.76	5
11487	1	1997	1	2	328943.00	134740.00	2.44	5
11488	1	1997	2	0	118528.00	72040.00	1.65	5
11489	1	1997	2	1	240419.00	90030.00	2.67	5
11490	1	1997	2	2	358947.00	162070.00	2.21	5
11491	1	1998	1	0	47602.00	29725.00	1.60	5
11492	1	1998	1	1	226137.00	81705.00	2.77	5
11493	1	1998	1	2	273739.00	111430.00	2.46	5
11494	1	1998	2	0	72456.00	53764.00	1.35	5
11495	1	1998	2	1	147298.00	63525.00	2.32	5
11496	1	1998	2	2	219754.00	117289.00	1.87	5
11497	1	1999	1	0	93827.00	44580.00	2.10	5
11498	1	1999	1	1	232094.00	88840.00	2.61	5
11499	1	1999	1	2	325921.00	133420.00	2.44	5
11500	1	1999	2	0	149275.00	79290.00	1.88	5
11501	1	1999	2	1	245051.00	89220.00	2.75	5
11502	1	1999	2	2	394326.00	168510.00	2.34	5
11503	1	2000	1	0	84103.00	45560.00	1.85	5
11504	1	2000	1	1	226930.00	85480.00	2.65	5
11505	1	2000	1	2	311033.00	131040.00	2.37	5
11506	1	2000	2	0	129307.00	70070.00	1.85	5
11507	1	2000	2	1	231953.00	88710.00	2.61	5
11508	1	2000	2	2	361260.00	158780.00	2.28	5
11509	1	2001	1	0	84107.00	41970.00	2.00	5
11510	1	2001	1	1	233133.00	84670.00	2.75	5
11511	1	2001	1	2	317240.00	126640.00	2.51	5
11512	1	2001	2	0	133177.00	71354.00	1.87	5
11513	1	2001	2	1	246870.00	87923.00	2.81	5
11514	1	2001	2	2	380047.00	159277.00	2.39	5
11515	1	2002	1	0	85090.00	37272.00	2.28	5
11516	1	2002	1	1	279524.00	85023.00	3.29	5
11517	1	2002	1	2	364614.00	122295.00	2.98	5
11518	1	2002	2	0	150693.00	72866.00	2.07	5
11519	1	2002	2	1	241501.00	80810.00	2.99	5
11520	1	2002	2	2	392194.00	153676.00	2.55	5
11521	1	2003	1	0	72444.00	33973.00	2.13	5
11522	1	2003	1	1	252995.00	82148.00	3.08	5
11523	1	2003	1	2	325439.00	116121.00	2.80	5
11524	1	2003	2	0	155433.00	73088.00	2.13	5
11525	1	2003	2	1	280176.00	87927.00	3.19	5
11526	1	2003	2	2	435609.00	161015.00	2.71	5
11527	1	2004	1	0	95148.00	39351.00	2.42	5
11528	1	2004	1	1	337274.00	88384.00	3.82	5
11529	1	2004	1	2	432422.00	127735.00	3.39	5
11530	1	2004	2	0	163381.00	72990.00	2.24	5
11531	1	2004	2	1	347411.00	99705.00	3.48	5
11532	1	2004	2	2	510792.00	172695.00	2.96	5
11533	1	2005	1	0	103933.00	40900.00	2.54	5
11534	1	2005	1	1	384822.00	98042.00	3.93	5
11535	1	2005	1	2	488755.00	138942.00	3.52	5
11536	1	2005	2	0	155688.00	71612.00	2.17	5
11537	1	2005	2	1	337475.00	93995.00	3.59	5
11538	1	2005	2	2	493163.00	165607.00	2.98	5
11539	1	2006	1	0	110696.00	42150.00	2.63	5
11540	1	2006	1	1	380807.00	97190.00	3.92	5
11541	1	2006	1	2	491503.00	139340.00	3.53	5
11542	1	2006	2	0	120398.00	55429.00	2.17	5
11543	1	2006	2	1	276871.00	86714.00	3.19	5
11544	1	2006	2	2	397269.00	142143.00	2.79	5
11545	1	2007	1	0	102618.00	40440.00	2.54	5
11546	1	2007	1	1	406628.00	101947.00	3.99	5
11547	1	2007	1	2	509246.00	142387.00	3.58	5
11548	1	2007	2	0	128939.00	49561.00	2.60	5
11549	1	2007	2	1	353245.00	94426.00	3.74	5
11550	1	2007	2	2	482184.00	143987.00	3.35	5
11551	1	2008	1	0	98004.00	39318.00	2.49	5
11552	1	2008	1	1	338080.00	93525.00	3.61	5
11553	1	2008	1	2	436084.00	132843.00	3.28	5
11554	1	2008	2	0	175319.00	58626.00	2.99	5
11555	1	2008	2	1	386178.00	99249.00	3.89	5
11556	1	2008	2	2	561497.00	157875.00	3.56	5
11557	1	2009	1	0	142697.00	49887.00	2.86	5
11558	1	2009	1	1	368833.00	99338.00	3.71	5
11559	1	2009	1	2	511530.00	149225.00	3.43	5
11560	1	2009	2	0	162809.00	57655.00	2.82	5
11561	1	2009	2	1	371162.00	106722.00	3.48	5
11562	1	2009	2	2	533971.00	164377.00	3.25	5
11563	1	2010	1	0	102894.00	39815.00	2.58	5
11564	1	2010	1	1	382260.00	106373.00	3.59	5
11565	1	2010	1	2	485154.00	146188.00	3.32	5
11566	1	2010	2	0	186197.00	60733.00	3.07	5
11567	1	2010	2	1	409727.00	109883.00	3.73	5
11568	1	2010	2	2	595924.00	170616.00	3.49	5
11569	1	2011	1	0	150047.00	50059.00	3.00	5
11570	1	2011	1	1	400270.00	107854.00	3.71	5
11571	1	2011	1	2	550317.00	157913.00	3.48	5
11572	1	2011	2	0	185293.00	64693.00	2.86	5
11573	1	2011	2	1	335307.00	95755.00	3.50	5
11574	1	2011	2	2	520600.00	160448.00	3.24	5
11575	1	2012	1	0	167382.00	55025.00	3.04	5
11576	1	2012	1	1	422157.00	111884.00	3.77	5
11577	1	2012	1	2	589539.00	166909.00	3.53	5
11578	1	2012	2	0	190728.00	61792.00	3.09	5
11579	1	2012	2	1	393040.00	105574.00	3.72	5
11580	1	2012	2	2	583768.00	167366.00	3.49	5
11581	1	2013	1	0	183126.40	61010.00	3.00	5
11582	1	2013	1	1	442158.00	111593.00	3.96	5
11583	1	2013	1	2	625284.40	172603.00	3.62	5
11584	1	2013	2	0	187909.00	59963.00	3.13	5
11585	1	2013	2	1	430048.00	110633.00	3.89	5
11586	1	2013	2	2	617957.00	170596.00	3.62	5
11587	1	2014	1	0	185855.00	59068.00	3.15	5
11588	1	2014	1	1	458660.00	112487.00	4.08	5
11589	1	2014	1	2	644515.00	171555.00	3.76	5
11590	1	2014	2	0	190818.00	56423.00	3.38	5
11591	1	2014	2	1	422814.00	101595.00	4.16	5
11592	1	2014	2	2	613632.00	158018.00	3.88	5
11593	1	2015	1	0	177063.00	58411.00	3.03	5
11594	1	2015	1	1	450320.00	111181.00	4.05	5
11595	1	2015	1	2	627383.00	169592.00	3.70	5
11596	1	2015	2	0	164373.00	54595.00	3.01	5
11597	1	2015	2	1	472692.00	118120.00	4.00	5
11598	1	2015	2	2	637065.00	172715.00	3.69	5
11599	1	2016	1	0	192600.00	62569.00	3.08	5
11600	1	2016	1	1	448662.00	110987.00	4.04	5
11601	1	2016	1	2	641262.00	173556.00	3.69	5
11602	1	2016	2	0	163988.00	55315.00	2.96	5
11603	1	2016	2	1	470242.00	125218.00	3.76	5
11604	1	2016	2	2	634230.00	180533.00	3.51	5
11605	1	2017	1	0	194209.00	62312.00	3.12	5
11606	1	2017	1	1	460613.00	115637.00	3.98	5
11607	1	2017	1	2	654822.00	177949.00	3.68	5
11608	1	2017	2	0	185159.00	59356.00	3.12	5
11609	1	2017	2	1	495096.00	126518.00	3.91	5
11610	1	2017	2	2	680255.00	185874.00	3.66	5
11611	1	2018	1	0	196472.00	63657.00	3.09	5
11612	1	2018	1	1	471626.00	114761.00	4.11	5
11613	1	2018	1	2	668098.00	178418.00	3.74	5
11614	1	2018	2	0	182414.80	56765.00	3.21	5
11615	1	2018	2	1	499925.52	122471.00	4.08	5
11616	1	2018	2	2	682340.32	179236.00	3.81	5
11617	1	2019	1	0	153693.45	57695.00	2.66	5
11618	1	2019	1	1	416693.03	114669.65	3.63	5
11619	1	2019	1	2	570386.48	172364.65	3.31	5
11620	1	2019	2	0	169491.79	56204.00	3.02	5
11621	1	2019	2	1	453025.69	113162.60	4.00	5
11622	1	2019	2	2	622517.48	169366.60	3.68	5
11623	1	2020	1	0	195018.09	63602.00	3.07	5
11624	1	2020	1	1	436653.69	106584.00	4.10	5
11625	1	2020	1	2	631671.78	170186.00	3.71	5
11626	1	2020	2	0	192904.56	59718.53	3.23	5
11627	1	2020	2	1	470414.78	116724.46	4.03	5
11628	1	2020	2	2	663319.34	176442.99	3.76	5
11629	2	1987	1	0	9115.00	5460.00	1.67	5
11630	2	1987	1	1	53050.00	22100.00	2.40	5
11631	2	1987	1	2	62165.00	27560.00	2.26	5
11632	2	1987	2	0	5037.00	3470.00	1.45	5
11633	2	1987	2	1	32552.00	15910.00	2.05	5
11634	2	1987	2	2	37589.00	19380.00	1.94	5
11635	2	1988	1	0	9259.00	5570.00	1.66	5
11636	2	1988	1	1	55391.00	27050.00	2.05	5
11637	2	1988	1	2	64650.00	32620.00	1.98	5
11638	2	1988	2	0	5682.00	3490.00	1.63	5
11639	2	1988	2	1	49297.00	20200.00	2.44	5
11640	2	1988	2	2	54979.00	23690.00	2.32	5
11641	2	1989	1	0	5351.00	3700.00	1.45	5
11642	2	1989	1	1	43038.00	20860.00	2.06	5
11643	2	1989	1	2	48389.00	24560.00	1.97	5
11644	2	1989	2	0	5044.00	3050.00	1.65	5
11645	2	1989	2	1	57123.00	19210.00	2.97	5
11646	2	1989	2	2	62167.00	22260.00	2.79	5
11647	2	1990	1	0	4234.00	3110.00	1.36	5
11648	2	1990	1	1	66134.00	25970.00	2.55	5
11649	2	1990	1	2	70368.00	29080.00	2.42	5
11650	2	1990	2	0	5440.00	3110.00	1.75	5
11651	2	1990	2	1	53598.00	17900.00	2.99	5
11652	2	1990	2	2	59038.00	21010.00	2.81	5
11653	2	1991	1	0	5314.00	2850.00	1.86	5
11654	2	1991	1	1	82315.00	31520.00	2.61	5
11655	2	1991	1	2	87629.00	34370.00	2.55	5
11656	2	1991	2	0	5210.00	2960.00	1.76	5
11657	2	1991	2	1	56321.00	17830.00	3.16	5
11658	2	1991	2	2	61531.00	20790.00	2.96	5
11659	2	1992	1	0	6372.00	3320.00	1.92	5
11660	2	1992	1	1	84254.00	31160.00	2.70	5
11661	2	1992	1	2	90626.00	34480.00	2.63	5
11662	2	1992	2	0	5704.00	3110.00	1.83	5
11663	2	1992	2	1	60456.00	17800.00	3.40	5
11664	2	1992	2	2	66160.00	20910.00	3.16	5
11665	2	1993	1	0	2954.00	1720.00	1.72	5
11666	2	1993	1	1	86721.00	29060.00	2.98	5
11667	2	1993	1	2	89675.00	30780.00	2.91	5
11668	2	1993	2	0	6908.00	4200.00	1.64	5
11669	2	1993	2	1	79226.00	27220.00	2.91	5
11670	2	1993	2	2	86134.00	31420.00	2.74	5
11671	2	1994	1	0	7885.00	4080.00	1.93	5
11672	2	1994	1	1	63678.00	27910.00	2.28	5
11673	2	1994	1	2	71563.00	31990.00	2.24	5
11674	2	1994	2	0	10478.00	6050.00	1.73	5
11675	2	1994	2	1	75105.00	29080.00	2.58	5
11676	2	1994	2	2	85583.00	35130.00	2.44	5
11677	2	1995	1	0	6410.00	4529.00	1.42	5
11678	2	1995	1	1	65574.00	27704.00	2.37	5
11679	2	1995	1	2	71984.00	32233.00	2.23	5
11680	2	1995	2	0	8020.00	5060.00	1.58	5
11681	2	1995	2	1	51506.00	25680.00	2.01	5
11682	2	1995	2	2	59526.00	30740.00	1.94	5
11683	2	1996	1	0	11333.00	5560.00	2.04	5
11684	2	1996	1	1	59550.00	27280.00	2.18	5
11685	2	1996	1	2	70883.00	32840.00	2.16	5
11686	2	1996	2	0	15630.00	6540.00	2.39	5
11687	2	1996	2	1	68814.00	25470.00	2.70	5
11688	2	1996	2	2	84444.00	32010.00	2.64	5
11689	2	1997	1	0	10480.00	4940.00	2.12	5
11690	2	1997	1	1	67029.00	24050.00	2.79	5
11691	2	1997	1	2	77509.00	28990.00	2.67	5
11692	2	1997	2	0	8022.00	6120.00	1.31	5
11693	2	1997	2	1	58819.00	23920.00	2.46	5
11694	2	1997	2	2	66841.00	30040.00	2.23	5
11695	2	1998	1	0	11528.00	4900.00	2.35	5
11696	2	1998	1	1	58456.00	20120.00	2.91	5
11697	2	1998	1	2	69984.00	25020.00	2.80	5
11698	2	1998	2	0	5281.00	4894.00	1.08	5
11699	2	1998	2	1	32009.00	17390.00	1.84	5
11700	2	1998	2	2	37290.00	22284.00	1.67	5
11701	2	1999	1	0	16711.00	6860.00	2.44	5
11702	2	1999	1	1	54938.00	20290.00	2.71	5
11703	2	1999	1	2	71649.00	27150.00	2.64	5
11704	2	1999	2	0	11289.00	4380.00	2.58	5
11705	2	1999	2	1	59487.00	21510.00	2.77	5
11706	2	1999	2	2	70776.00	25890.00	2.73	5
11707	2	2000	1	0	12269.00	5440.00	2.26	5
11708	2	2000	1	1	40214.00	16300.00	2.47	5
11709	2	2000	1	2	52483.00	21740.00	2.41	5
11710	2	2000	2	0	12328.00	5270.00	2.34	5
11711	2	2000	2	1	59251.00	21290.00	2.78	5
11712	2	2000	2	2	71579.00	26560.00	2.69	5
11713	2	2001	1	0	12177.00	5710.00	2.13	5
11714	2	2001	1	1	43160.00	16900.00	2.55	5
11715	2	2001	1	2	55337.00	22610.00	2.45	5
11716	2	2001	2	0	8215.00	4124.00	1.99	5
11717	2	2001	2	1	40449.00	14803.00	2.73	5
11718	2	2001	2	2	48664.00	18927.00	2.57	5
11719	2	2002	1	0	16228.00	6060.00	2.68	5
11720	2	2002	1	1	53991.00	17702.00	3.05	5
11721	2	2002	1	2	70219.00	23762.00	2.96	5
11722	2	2002	2	0	12821.00	5257.00	2.44	5
11723	2	2002	2	1	48855.00	16955.00	2.88	5
11724	2	2002	2	2	61676.00	22212.00	2.78	5
11725	2	2003	1	0	7872.00	3680.00	2.14	5
11726	2	2003	1	1	49876.00	16761.00	2.98	5
11727	2	2003	1	2	57748.00	20441.00	2.83	5
11728	2	2003	2	0	18837.00	6599.00	2.85	5
11729	2	2003	2	1	55297.00	17401.00	3.18	5
11730	2	2003	2	2	74134.00	24000.00	3.09	5
11731	2	2004	1	0	13599.00	5253.00	2.59	5
11732	2	2004	1	1	61851.00	16790.00	3.68	5
11733	2	2004	1	2	75450.00	22043.00	3.42	5
11734	2	2004	2	0	18016.00	6595.00	2.73	5
11735	2	2004	2	1	62234.00	18764.00	3.32	5
11736	2	2004	2	2	80250.00	25359.00	3.16	5
11737	2	2005	1	0	12048.00	4734.00	2.54	5
11738	2	2005	1	1	70500.00	18900.00	3.73	5
11739	2	2005	1	2	82548.00	23634.00	3.49	5
11740	2	2005	2	0	17787.00	6414.00	2.77	5
11741	2	2005	2	1	79132.00	21480.00	3.68	5
11742	2	2005	2	2	96919.00	27894.00	3.47	5
11743	2	2006	1	0	15120.00	5400.00	2.80	5
11744	2	2006	1	1	78804.00	20358.00	3.87	5
11745	2	2006	1	2	93924.00	25758.00	3.65	5
11746	2	2006	2	0	9246.00	4350.00	2.13	5
11747	2	2006	2	1	53722.00	18066.00	2.97	5
11748	2	2006	2	2	62968.00	22416.00	2.81	5
11749	2	2007	1	0	10956.00	3900.00	2.81	5
11750	2	2007	1	1	60066.00	15342.00	3.92	5
11751	2	2007	1	2	71022.00	19242.00	3.69	5
11752	2	2007	2	0	10715.00	4206.00	2.55	5
11753	2	2007	2	1	66299.00	18579.00	3.57	5
11754	2	2007	2	2	77014.00	22785.00	3.38	5
11755	2	2008	1	0	10324.00	3557.00	2.90	5
11756	2	2008	1	1	54451.00	15372.00	3.54	5
11757	2	2008	1	2	64775.00	18929.00	3.42	5
11758	2	2008	2	0	24988.00	7730.00	3.23	5
11759	2	2008	2	1	71628.00	19183.00	3.73	5
11760	2	2008	2	2	96616.00	26913.00	3.59	5
11761	2	2009	1	0	15647.00	4857.00	3.22	5
11762	2	2009	1	1	63955.00	17895.00	3.57	5
11763	2	2009	1	2	79602.00	22752.00	3.50	5
11764	2	2009	2	0	19887.00	6287.00	3.16	5
11765	2	2009	2	1	71075.00	19599.00	3.63	5
11766	2	2009	2	2	90962.00	25886.00	3.51	5
11767	2	2010	1	0	13086.00	5030.00	2.60	5
11768	2	2010	1	1	70636.00	18109.00	3.90	5
11769	2	2010	1	2	83722.00	23139.00	3.62	5
11770	2	2010	2	0	22275.00	6523.00	3.41	5
11771	2	2010	2	1	76475.00	21497.00	3.56	5
11772	2	2010	2	2	98750.00	28020.00	3.52	5
11773	2	2011	1	0	20194.00	5946.00	3.40	5
11774	2	2011	1	1	85739.00	21996.00	3.90	5
11775	2	2011	1	2	105933.00	27942.00	3.79	5
11776	2	2011	2	0	21244.00	6564.00	3.24	5
11777	2	2011	2	1	73860.00	20763.00	3.56	5
11778	2	2011	2	2	95104.00	27327.00	3.48	5
11779	2	2012	1	0	20122.00	5869.00	3.43	5
11780	2	2012	1	1	90556.00	23129.00	3.92	5
11781	2	2012	1	2	110678.00	28998.00	3.82	5
11782	2	2012	2	0	20983.00	6349.00	3.30	5
11783	2	2012	2	1	75147.00	20147.00	3.73	5
11784	2	2012	2	2	96130.00	26496.00	3.63	5
11785	2	2013	1	0	20070.00	5691.00	3.53	5
11786	2	2013	1	1	88880.00	21167.00	4.20	5
11787	2	2013	1	2	108950.00	26858.00	4.06	5
11788	2	2013	2	0	21705.00	6294.00	3.45	5
11789	2	2013	2	1	90325.00	22812.00	3.96	5
11790	2	2013	2	2	112030.00	29106.00	3.85	5
11791	2	2014	1	0	19867.00	5397.00	3.68	5
11792	2	2014	1	1	91371.00	21104.00	4.33	5
11793	2	2014	1	2	111238.00	26501.00	4.20	5
11794	2	2014	2	0	22046.00	5752.00	3.83	5
11795	2	2014	2	1	92416.00	21235.00	4.35	5
11796	2	2014	2	2	114462.00	26987.00	4.24	5
11797	2	2015	1	0	18198.00	5513.00	3.30	5
11798	2	2015	1	1	88003.00	20390.00	4.32	5
11799	2	2015	1	2	106201.00	25903.00	4.10	5
11800	2	2015	2	0	15717.00	5411.00	2.90	5
11801	2	2015	2	1	82427.00	20569.00	4.01	5
11802	2	2015	2	2	98144.00	25980.00	3.78	5
11803	2	2016	1	0	18098.00	5260.00	3.44	5
11804	2	2016	1	1	86973.00	20376.00	4.27	5
11805	2	2016	1	2	105071.00	25636.00	4.10	5
11806	2	2016	2	0	13118.00	5158.00	2.54	5
11807	2	2016	2	1	83622.00	21301.00	3.93	5
11808	2	2016	2	2	96740.00	26459.00	3.66	5
11809	2	2017	1	0	14075.00	4869.00	2.89	5
11810	2	2017	1	1	90314.00	22607.00	3.99	5
11811	2	2017	1	2	104389.00	27476.00	3.80	5
11812	2	2017	2	0	15560.00	5527.00	2.82	5
11813	2	2017	2	1	84875.00	21181.00	4.01	5
11814	2	2017	2	2	100435.00	26708.00	3.76	5
11815	2	2018	1	0	13790.00	5625.00	2.45	5
11816	2	2018	1	1	90282.00	21392.00	4.22	5
11817	2	2018	1	2	104072.00	27017.00	3.85	5
11818	2	2018	2	0	14570.80	5382.00	2.71	5
11819	2	2018	2	1	87376.66	21190.00	4.12	5
11820	2	2018	2	2	101947.46	26572.00	3.84	5
11821	2	2019	1	0	6667.38	4525.00	1.47	5
11822	2	2019	1	1	78591.79	21980.65	3.58	5
11823	2	2019	1	2	85259.17	26505.65	3.22	5
11824	2	2019	2	0	12576.90	5355.00	2.35	5
11825	2	2019	2	1	90176.72	21526.00	4.19	5
11826	2	2019	2	2	102753.62	26881.00	3.82	5
11827	2	2020	1	0	11512.00	4534.00	2.54	5
11828	2	2020	1	1	86103.00	22110.00	3.89	5
11829	2	2020	1	2	97615.00	26644.00	3.66	5
11830	2	2020	2	0	18055.25	5439.00	3.32	5
11831	2	2020	2	1	100336.70	21810.00	4.60	5
11832	2	2020	2	2	118391.95	27249.00	4.34	5
11833	2	1987	1	0	4840.00	2620.00	1.85	50
11834	2	1987	1	1	47675.00	15580.00	3.06	50
11835	2	1987	1	2	52515.00	18200.00	2.89	50
11836	2	1987	2	0	2985.00	1670.00	1.79	50
11837	2	1987	2	1	45730.00	13800.00	3.31	50
11838	2	1987	2	2	48715.00	15470.00	3.15	50
11839	2	1988	1	0	3632.00	1280.00	2.84	50
11840	2	1988	1	1	61905.00	18160.00	3.41	50
11841	2	1988	1	2	65537.00	19440.00	3.37	50
11842	2	1988	2	0	2306.00	1200.00	1.92	50
11843	2	1988	2	1	49794.00	14260.00	3.49	50
11844	2	1988	2	2	52100.00	15460.00	3.37	50
11845	2	1989	1	0	3758.00	1550.00	2.42	50
11846	2	1989	1	1	59462.00	17860.00	3.33	50
11847	2	1989	1	2	63220.00	19410.00	3.26	50
11848	2	1989	2	0	3969.00	1770.00	2.24	50
11849	2	1989	2	1	49869.00	15960.00	3.12	50
11850	2	1989	2	2	53838.00	17730.00	3.04	50
11851	2	1990	1	0	2404.00	830.00	2.90	50
11852	2	1990	1	1	55341.00	15610.00	3.55	50
11853	2	1990	1	2	57745.00	16440.00	3.51	50
11854	2	1990	2	0	3143.00	1030.00	3.05	50
11855	2	1990	2	1	52625.00	14550.00	3.62	50
11856	2	1990	2	2	55768.00	15580.00	3.58	50
11857	2	1991	1	0	2389.00	800.00	2.99	50
11858	2	1991	1	1	56302.00	15490.00	3.63	50
11859	2	1991	1	2	58691.00	16290.00	3.60	50
11860	2	1991	2	0	858.00	600.00	1.43	50
11861	2	1991	2	1	46777.00	15420.00	3.03	50
11862	2	1991	2	2	47635.00	16020.00	2.97	50
11863	2	1992	1	0	621.00	290.00	2.14	50
11864	2	1992	1	1	51936.00	16560.00	3.14	50
11865	2	1992	1	2	52557.00	16850.00	3.12	50
11866	2	1992	2	0	1935.00	590.00	3.28	50
11867	2	1992	2	1	58373.00	14320.00	4.08	50
11868	2	1992	2	2	60308.00	14910.00	4.04	50
11869	2	1993	1	0	927.00	320.00	2.90	50
11870	2	1993	1	1	52734.00	13950.00	3.78	50
11871	2	1993	1	2	53661.00	14270.00	3.76	50
11872	2	1993	2	0	168.00	60.00	2.80	50
11873	2	1993	2	1	61029.00	15220.00	4.01	50
11874	2	1993	2	2	61197.00	15280.00	4.01	50
11875	2	1994	1	0	4680.00	1660.00	2.82	50
11876	2	1994	1	1	52596.00	15480.00	3.40	50
11877	2	1994	1	2	57276.00	17140.00	3.34	50
11878	2	1994	2	0	8007.00	2800.00	2.86	50
11879	2	1994	2	1	76791.00	20700.00	3.71	50
11880	2	1994	2	2	84798.00	23500.00	3.61	50
11881	2	1995	1	0	1971.00	1350.00	1.46	50
11882	2	1995	1	1	66868.00	20910.00	3.20	50
11883	2	1995	1	2	68839.00	22260.00	3.09	50
11884	2	1995	2	0	609.00	239.00	2.55	50
11885	2	1995	2	1	85692.00	22528.00	3.80	50
11886	2	1995	2	2	86301.00	22767.00	3.79	50
11887	2	1996	1	0	1359.00	1230.00	1.10	50
11888	2	1996	1	1	63784.00	20940.00	3.05	50
11889	2	1996	1	2	65143.00	22170.00	2.94	50
11890	2	1996	2	0	330.00	150.00	2.20	50
11891	2	1996	2	1	81175.00	22578.00	3.60	50
11892	2	1996	2	2	81505.00	22728.00	3.59	50
11893	2	1997	1	0	1276.00	1119.00	1.14	50
11894	2	1997	1	1	67288.00	21414.00	3.14	50
11895	2	1997	1	2	68564.00	22533.00	3.04	50
11896	2	1997	2	0	368.00	160.00	2.30	50
11897	2	1997	2	1	82479.00	22916.00	3.60	50
11898	2	1997	2	2	82847.00	23076.00	3.59	50
11899	2	1998	1	0	20.00	50.00	0.40	50
11900	2	1998	1	1	61399.00	20662.00	2.97	50
11901	2	1998	1	2	61419.00	20712.00	2.97	50
11902	2	1998	2	0	449.00	212.00	2.12	50
11903	2	1998	2	1	82215.00	23923.00	3.44	50
11904	2	1998	2	2	82664.00	24135.00	3.43	50
11905	2	1999	1	0	5180.00	2000.00	2.59	50
11906	2	1999	1	1	86696.00	25974.00	3.34	50
11907	2	1999	1	2	91876.00	27974.00	3.28	50
11908	2	1999	2	0	610.00	271.00	2.25	50
11909	2	1999	2	1	80022.00	23610.00	3.39	50
11910	2	1999	2	2	80632.00	23881.00	3.38	50
11911	2	2000	1	0	4064.00	2012.00	2.02	50
11912	2	2000	1	1	86685.00	25265.00	3.43	50
11913	2	2000	1	2	90749.00	27277.00	3.33	50
11914	2	2000	2	0	788.00	315.00	2.50	50
11915	2	2000	2	1	91189.00	23347.00	3.91	50
11916	2	2000	2	2	91977.00	23662.00	3.89	50
11917	2	2001	1	0	4490.00	2050.00	2.19	50
11918	2	2001	1	1	89973.00	25260.00	3.56	50
11919	2	2001	1	2	94463.00	27310.00	3.46	50
11920	2	2001	2	0	922.00	365.00	2.53	50
11921	2	2001	2	1	96131.00	25178.00	3.82	50
11922	2	2001	2	2	97053.00	25543.00	3.80	50
11923	2	2002	1	0	3762.00	1750.00	2.15	50
11924	2	2002	1	1	81193.00	24448.00	3.32	50
11925	2	2002	1	2	84955.00	26198.00	3.24	50
11926	2	2002	2	0	\N	\N	\N	50
11927	2	2002	2	1	107546.00	27296.00	3.94	50
11928	2	2002	2	2	107546.00	27296.00	3.94	50
11929	2	2003	1	0	3881.00	1725.00	2.25	50
11930	2	2003	1	1	89898.00	25510.00	3.52	50
11931	2	2003	1	2	93779.00	27235.00	3.44	50
11932	2	2003	2	0	313.00	138.00	2.27	50
11933	2	2003	2	1	104799.00	27037.00	3.88	50
11934	2	2003	2	2	105112.00	27175.00	3.87	50
11935	2	2004	1	0	3792.00	1685.00	2.25	50
11936	2	2004	1	1	95785.00	25340.00	3.78	50
11937	2	2004	1	2	99577.00	27025.00	3.68	50
11938	2	2004	2	0	282.00	128.00	2.20	50
11939	2	2004	2	1	101538.00	26513.00	3.83	50
11940	2	2004	2	2	101820.00	26641.00	3.82	50
11941	2	2005	1	0	3876.00	1685.00	2.30	50
11942	2	2005	1	1	88907.00	24502.00	3.63	50
11943	2	2005	1	2	92783.00	26187.00	3.54	50
11944	2	2005	2	0	351.00	135.00	2.60	50
11945	2	2005	2	1	114223.00	27087.00	4.22	50
11946	2	2005	2	2	114574.00	27222.00	4.21	50
11947	2	2006	1	0	4215.00	1685.00	2.50	50
11948	2	2006	1	1	104180.00	24950.00	4.18	50
11949	2	2006	1	2	108395.00	26635.00	4.07	50
11950	2	2006	2	0	4413.00	1470.00	3.00	50
11951	2	2006	2	1	108593.00	26818.00	4.05	50
11952	2	2006	2	2	113006.00	28288.00	3.99	50
11953	2	2007	1	0	4620.00	1680.00	2.75	50
11954	2	2007	1	1	103536.00	25400.00	4.08	50
11955	2	2007	1	2	108156.00	27080.00	3.99	50
11956	2	2007	2	0	5610.00	1870.00	3.00	50
11957	2	2007	2	1	114356.00	26782.00	4.27	50
11958	2	2007	2	2	119966.00	28652.00	4.19	50
11959	2	2008	1	0	5293.00	1800.00	2.94	50
11960	2	2008	1	1	106231.00	25530.00	4.16	50
11961	2	2008	1	2	111524.00	27330.00	4.08	50
11962	2	2008	2	0	5583.00	1880.00	2.97	50
11963	2	2008	2	1	115839.00	27452.00	4.22	50
11964	2	2008	2	2	121422.00	29332.00	4.14	50
11965	2	2009	1	0	5430.00	1800.00	3.02	50
11966	2	2009	1	1	107640.00	25566.00	4.21	50
11967	2	2009	1	2	113070.00	27366.00	4.13	50
11968	2	2009	2	0	5284.00	1880.00	2.81	50
11969	2	2009	2	1	112930.00	27633.00	4.09	50
11970	2	2009	2	2	118214.00	29513.00	4.01	50
11971	2	2010	1	0	2603.00	1707.00	1.52	50
11972	2	2010	1	1	84610.00	23560.00	3.59	50
11973	2	2010	1	2	87213.00	25267.00	3.45	50
11974	2	2010	2	0	5602.00	1870.00	3.00	50
11975	2	2010	2	1	107757.00	27163.00	3.97	50
11976	2	2010	2	2	113359.00	29033.00	3.90	50
11977	2	2011	1	0	5300.00	1860.00	2.85	50
11978	2	2011	1	1	106263.00	25887.00	4.10	50
11979	2	2011	1	2	111563.00	27747.00	4.02	50
11980	2	2011	2	0	4601.00	2080.00	2.21	50
11981	2	2011	2	1	102282.00	26172.00	3.91	50
11982	2	2011	2	2	106883.00	28252.00	3.78	50
11983	2	2012	1	0	5384.00	1860.00	2.89	50
11984	2	2012	1	1	110220.00	25837.00	4.27	50
11985	2	2012	1	2	115604.00	27697.00	4.17	50
11986	2	2012	2	0	7301.00	2660.00	2.74	50
11987	2	2012	2	1	119051.00	27549.00	4.32	50
11988	2	2012	2	2	126352.00	30209.00	4.18	50
11989	2	2013	1	0	5372.00	1892.00	2.84	50
11990	2	2013	1	1	118555.00	27209.00	4.36	50
11991	2	2013	1	2	123927.00	29101.00	4.26	50
11992	2	2013	2	0	7120.00	2650.00	2.69	50
11993	2	2013	2	1	122708.00	27823.00	4.41	50
11994	2	2013	2	2	129828.00	30473.00	4.26	50
11995	2	2014	1	0	5011.00	1706.00	2.94	50
11996	2	2014	1	1	116722.00	25939.00	4.50	50
11997	2	2014	1	2	121733.00	27645.00	4.40	50
11998	2	2014	2	0	3061.00	1127.00	2.72	50
11999	2	2014	2	1	128102.00	27182.00	4.71	50
12000	2	2014	2	2	131163.00	28309.00	4.63	50
12001	2	2015	1	0	6027.00	1947.00	3.10	50
12002	2	2015	1	1	126657.00	28258.00	4.48	50
12003	2	2015	1	2	132684.00	30205.00	4.39	50
12004	2	2015	2	0	3949.00	1545.00	2.56	50
12005	2	2015	2	1	132487.00	28716.00	4.61	50
12006	2	2015	2	2	136436.00	30261.00	4.51	50
12007	2	2016	1	0	6054.00	1947.00	3.11	50
12008	2	2016	1	1	127924.00	29116.00	4.39	50
12009	2	2016	1	2	133978.00	31063.00	4.31	50
12010	2	2016	2	0	5121.00	1730.00	2.96	50
12011	2	2016	2	1	130725.00	29414.00	4.44	50
12012	2	2016	2	2	135846.00	31144.00	4.36	50
12013	2	2017	1	0	5826.00	1866.00	3.12	50
12014	2	2017	1	1	127240.00	29265.00	4.35	50
12015	2	2017	1	2	133066.00	31131.00	4.27	50
12016	2	2017	2	0	4217.00	1384.00	3.05	50
12017	2	2017	2	1	136234.00	29809.00	4.57	50
12018	2	2017	2	2	140451.00	31193.00	4.50	50
12019	2	2018	1	0	4918.00	1515.00	3.25	50
12020	2	2018	1	1	115315.00	26462.00	4.36	50
12021	2	2018	1	2	120233.00	27977.00	4.30	50
12022	2	2018	2	0	3363.00	1088.00	3.09	50
12023	2	2018	2	1	146474.00	32553.00	4.50	50
12024	2	2018	2	2	149837.00	33641.00	4.45	50
12025	2	2019	1	0	4625.00	1478.00	3.13	50
12026	2	2019	1	1	115802.00	26787.00	4.32	50
12027	2	2019	1	2	120427.00	28265.00	4.26	50
12028	2	2019	2	0	3419.50	1094.00	3.13	50
12029	2	2019	2	1	146154.00	31945.00	4.58	50
12030	2	2019	2	2	149573.50	33039.00	4.53	50
12031	2	2020	1	0	4826.00	1427.00	3.38	50
12032	2	2020	1	1	123527.00	27114.00	4.56	50
12033	2	2020	1	2	128353.00	28541.00	4.50	50
12034	2	2020	2	0	3826.78	1184.00	3.23	50
12035	2	2020	2	1	121676.00	26852.00	4.53	50
12036	2	2020	2	2	125502.78	28036.00	4.48	50
12037	2	1987	1	0	\N	\N	\N	51
12038	2	1987	1	1	56635.00	20260.00	2.80	51
12039	2	1987	1	2	56635.00	20260.00	2.80	51
12040	2	1987	2	0	117533.00	36600.00	3.21	51
12041	2	1987	2	1	55914.00	21360.00	2.62	51
12042	2	1987	2	2	173447.00	57960.00	2.99	51
12043	2	1988	1	0	\N	\N	\N	51
12044	2	1988	1	1	64039.00	17410.00	3.68	51
12045	2	1988	1	2	64039.00	17410.00	3.68	51
12046	2	1988	2	0	108854.00	30080.00	3.62	51
12047	2	1988	2	1	88422.00	28080.00	3.15	51
12048	2	1988	2	2	197276.00	58160.00	3.39	51
12049	2	1989	1	0	\N	\N	\N	51
12050	2	1989	1	1	91013.00	21970.00	4.14	51
12051	2	1989	1	2	91013.00	21970.00	4.14	51
12052	2	1989	2	0	56187.00	22270.00	2.52	51
12053	2	1989	2	1	77159.00	33180.00	2.33	51
12054	2	1989	2	2	133346.00	55450.00	2.40	51
12055	2	1990	1	0	\N	\N	\N	51
12056	2	1990	1	1	35949.00	11120.00	3.23	51
12057	2	1990	1	2	35949.00	11120.00	3.23	51
12058	2	1990	2	0	66903.00	22750.00	2.94	51
12059	2	1990	2	1	71787.00	25600.00	2.80	51
12060	2	1990	2	2	138690.00	48350.00	2.87	51
12061	2	1991	1	0	\N	\N	\N	51
12062	2	1991	1	1	60121.00	17150.00	3.51	51
12063	2	1991	1	2	60121.00	17150.00	3.51	51
12064	2	1991	2	0	91180.00	30730.00	2.97	51
12065	2	1991	2	1	76272.00	25160.00	3.03	51
12066	2	1991	2	2	167452.00	55890.00	3.00	51
12067	2	1992	1	0	\N	\N	\N	51
12068	2	1992	1	1	46944.00	14990.00	3.13	51
12069	2	1992	1	2	46944.00	14990.00	3.13	51
12070	2	1992	2	0	101504.00	34430.00	2.95	51
12071	2	1992	2	1	73884.00	23560.00	3.14	51
12072	2	1992	2	2	175388.00	57990.00	3.02	51
12073	2	1993	1	0	\N	\N	\N	51
12074	2	1993	1	1	53596.00	15090.00	3.55	51
12075	2	1993	1	2	53596.00	15090.00	3.55	51
12076	2	1993	2	0	106122.00	34360.00	3.09	51
12077	2	1993	2	1	71403.00	22180.00	3.22	51
12078	2	1993	2	2	177525.00	56540.00	3.14	51
12079	2	1994	1	0	\N	\N	\N	51
12080	2	1994	1	1	62596.00	15770.00	3.97	51
12081	2	1994	1	2	62596.00	15770.00	3.97	51
12082	2	1994	2	0	80586.00	28600.00	2.82	51
12083	2	1994	2	1	62715.00	18940.00	3.31	51
12084	2	1994	2	2	143301.00	47540.00	3.01	51
12085	2	1995	1	0	190.00	80.00	2.38	51
12086	2	1995	1	1	56172.00	15170.00	3.70	51
12087	2	1995	1	2	56362.00	15250.00	3.70	51
12088	2	1995	2	0	81544.00	26840.00	3.04	51
12089	2	1995	2	1	63487.00	20023.00	3.17	51
12090	2	1995	2	2	145031.00	46863.00	3.09	51
12091	2	1996	1	0	\N	\N	\N	51
12092	2	1996	1	1	73168.00	19158.00	3.82	51
12093	2	1996	1	2	73168.00	19158.00	3.82	51
12094	2	1996	2	0	68751.00	25804.00	2.66	51
12095	2	1996	2	1	65211.00	21533.00	3.03	51
12096	2	1996	2	2	133962.00	47337.00	2.83	51
12097	2	1997	1	0	\N	\N	\N	51
12098	2	1997	1	1	68530.00	18232.00	3.76	51
12099	2	1997	1	2	68530.00	18232.00	3.76	51
12100	2	1997	2	0	90025.00	25153.00	3.58	51
12101	2	1997	2	1	83616.00	22537.00	3.71	51
12102	2	1997	2	2	173641.00	47690.00	3.64	51
12103	2	1998	1	0	\N	\N	\N	51
12104	2	1998	1	1	48712.00	14302.00	3.41	51
12105	2	1998	1	2	48712.00	14302.00	3.41	51
12106	2	1998	2	0	57084.00	19030.00	3.00	51
12107	2	1998	2	1	62486.00	18750.00	3.33	51
12108	2	1998	2	2	119570.00	37780.00	3.16	51
12109	2	1999	1	0	5550.00	1850.00	3.00	51
12110	2	1999	1	1	65878.00	16900.00	3.90	51
12111	2	1999	1	2	71428.00	18750.00	3.81	51
12112	2	1999	2	0	78507.00	24545.00	3.20	51
12113	2	1999	2	1	81965.00	22361.00	3.67	51
12114	2	1999	2	2	160472.00	46906.00	3.42	51
12115	2	2000	1	0	4060.00	1400.00	2.90	51
12116	2	2000	1	1	72906.00	18816.00	3.87	51
12117	2	2000	1	2	76966.00	20216.00	3.81	51
12118	2	2000	2	0	79195.00	24036.00	3.29	51
12119	2	2000	2	1	80194.00	21373.00	3.75	51
12120	2	2000	2	2	159389.00	45409.00	3.51	51
12121	2	2001	1	0	2712.00	875.00	3.10	51
12122	2	2001	1	1	69326.00	17698.00	3.92	51
12123	2	2001	1	2	72038.00	18573.00	3.88	51
12124	2	2001	2	0	68573.00	21208.00	3.23	51
12125	2	2001	2	1	70944.00	20664.00	3.43	51
12126	2	2001	2	2	139517.00	41872.00	3.33	51
12127	2	2002	1	0	1950.00	650.00	3.00	51
12128	2	2002	1	1	56724.00	16445.00	3.45	51
12129	2	2002	1	2	58674.00	17095.00	3.43	51
12130	2	2002	2	0	93830.00	23553.00	3.98	51
12131	2	2002	2	1	96066.00	23194.00	4.14	51
12132	2	2002	2	2	189896.00	46747.00	4.06	51
12133	2	2003	1	0	2080.00	650.00	3.20	51
12134	2	2003	1	1	66959.00	17888.00	3.74	51
12135	2	2003	1	2	69039.00	18538.00	3.72	51
12136	2	2003	2	0	100362.00	24535.00	4.09	51
12137	2	2003	2	1	100489.00	22895.00	4.39	51
12138	2	2003	2	2	200851.00	47430.00	4.23	51
12139	2	2004	1	0	2380.00	680.00	3.50	51
12140	2	2004	1	1	60928.00	15652.00	3.89	51
12141	2	2004	1	2	63308.00	16332.00	3.88	51
12142	2	2004	2	0	87890.00	22773.00	3.86	51
12143	2	2004	2	1	86843.00	21827.00	3.98	51
12144	2	2004	2	2	174733.00	44600.00	3.92	51
12145	2	2005	1	0	1801.00	563.00	3.20	51
12146	2	2005	1	1	54821.00	14574.00	3.76	51
12147	2	2005	1	2	56622.00	15137.00	3.74	51
12148	2	2005	2	0	87878.00	23073.00	3.81	51
12149	2	2005	2	1	81995.00	21053.00	3.89	51
12150	2	2005	2	2	169873.00	44126.00	3.85	51
12151	2	2006	1	0	2100.00	600.00	3.50	51
12152	2	2006	1	1	57679.00	14620.00	3.95	51
12153	2	2006	1	2	59779.00	15220.00	3.93	51
12154	2	2006	2	0	76412.00	22427.00	3.41	51
12155	2	2006	2	1	80588.00	21612.00	3.73	51
12156	2	2006	2	2	157000.00	44039.00	3.57	51
12157	2	2007	1	0	1596.00	420.00	3.80	51
12158	2	2007	1	1	70355.00	17293.00	4.07	51
12159	2	2007	1	2	71951.00	17713.00	4.06	51
12160	2	2007	2	0	89794.00	25355.00	3.54	51
12161	2	2007	2	1	96095.00	24289.00	3.96	51
12162	2	2007	2	2	185889.00	49644.00	3.74	51
12163	2	2008	1	0	\N	\N	\N	51
12164	2	2008	1	1	83176.00	20497.00	4.06	51
12165	2	2008	1	2	83176.00	20497.00	4.06	51
12166	2	2008	2	0	125944.00	32203.00	3.91	51
12167	2	2008	2	1	110023.00	26921.00	4.09	51
12168	2	2008	2	2	235967.00	59124.00	3.99	51
12169	2	2009	1	0	\N	\N	\N	51
12170	2	2009	1	1	88940.00	20628.00	4.31	51
12171	2	2009	1	2	88940.00	20628.00	4.31	51
12172	2	2009	2	0	109726.00	29727.00	3.69	51
12173	2	2009	2	1	123099.00	32214.00	3.82	51
12174	2	2009	2	2	232825.00	61941.00	3.76	51
12175	2	2010	1	0	\N	\N	\N	51
12176	2	2010	1	1	69015.00	19260.00	3.58	51
12177	2	2010	1	2	69015.00	19260.00	3.58	51
12178	2	2010	2	0	89033.00	28122.00	3.17	51
12179	2	2010	2	1	132914.00	35007.00	3.80	51
12180	2	2010	2	2	221947.00	63129.00	3.52	51
12181	2	2011	1	0	\N	\N	\N	51
12182	2	2011	1	1	77895.00	19251.00	4.05	51
12183	2	2011	1	2	77895.00	19251.00	4.05	51
12184	2	2011	2	0	106695.00	28299.00	3.77	51
12185	2	2011	2	1	138055.00	34551.00	4.00	51
12186	2	2011	2	2	244750.00	62850.00	3.89	51
12187	2	2012	1	0	\N	\N	\N	51
12188	2	2012	1	1	92373.00	20600.00	4.48	51
12189	2	2012	1	2	92373.00	20600.00	4.48	51
12190	2	2012	2	0	106661.00	28390.00	3.76	51
12191	2	2012	2	1	135080.00	34469.00	3.92	51
12192	2	2012	2	2	241741.00	62859.00	3.85	51
12193	2	2013	1	0	\N	\N	\N	51
12194	2	2013	1	1	102172.00	22637.00	4.51	51
12195	2	2013	1	2	102172.00	22637.00	4.51	51
12196	2	2013	2	0	102581.00	28469.00	3.60	51
12197	2	2013	2	1	131086.00	33792.00	3.88	51
12198	2	2013	2	2	233667.00	62261.00	3.75	51
12199	2	2014	1	0	\N	\N	\N	51
12200	2	2014	1	1	96625.00	22275.00	4.34	51
12201	2	2014	1	2	96625.00	22275.00	4.34	51
12202	2	2014	2	0	109137.00	28415.00	3.84	51
12203	2	2014	2	1	140763.00	34250.00	4.11	51
12204	2	2014	2	2	249900.00	62665.00	3.99	51
12205	2	2015	1	0	\N	\N	\N	51
12206	2	2015	1	1	106905.00	22920.00	4.66	51
12207	2	2015	1	2	106905.00	22920.00	4.66	51
12208	2	2015	2	0	110018.00	28453.00	3.87	51
12209	2	2015	2	1	145591.00	34222.00	4.25	51
12210	2	2015	2	2	255609.00	62675.00	4.08	51
12211	2	2016	1	0	\N	\N	\N	51
12212	2	2016	1	1	99452.00	22677.00	4.39	51
12213	2	2016	1	2	99452.00	22677.00	4.39	51
12214	2	2016	2	0	111347.00	28585.00	3.90	51
12215	2	2016	2	1	147038.00	35038.00	4.20	51
12216	2	2016	2	2	258385.00	63623.00	4.06	51
12217	2	2017	1	0	0.00	0.00	\N	51
12218	2	2017	1	1	101954.00	22785.00	4.47	51
12219	2	2017	1	2	101954.00	22785.00	4.47	51
12220	2	2017	2	0	100397.00	28529.00	3.52	51
12221	2	2017	2	1	137638.00	34774.00	3.96	51
12222	2	2017	2	2	238035.00	63303.00	3.76	51
12223	2	2018	1	0	0.00	0.00	\N	51
12224	2	2018	1	1	109507.00	24372.00	4.49	51
12225	2	2018	1	2	109507.00	24372.00	4.49	51
12226	2	2018	2	0	116128.00	28565.00	4.07	51
12227	2	2018	2	1	148588.00	35047.00	4.24	51
12228	2	2018	2	2	264716.00	63612.00	4.16	51
12229	2	2019	1	0	0.00	0.00	\N	51
12230	2	2019	1	1	78815.00	20174.00	3.91	51
12231	2	2019	1	2	78815.00	20174.00	3.91	51
12232	2	2019	2	0	117476.00	28602.00	4.11	51
12233	2	2019	2	1	151558.00	34420.00	4.40	51
12234	2	2019	2	2	269034.00	63022.00	4.27	51
12235	2	2020	1	0	0.00	0.00	\N	51
12236	2	2020	1	1	101155.00	22042.00	4.59	51
12237	2	2020	1	2	101155.00	22042.00	4.59	51
12238	2	2020	2	0	93309.00	26713.00	3.49	51
12239	2	2020	2	1	115540.00	30675.00	3.77	51
12240	2	2020	2	2	208849.00	57388.00	3.64	51
12241	2	1987	1	0	27095.00	14430.00	1.88	52
12242	2	1987	1	1	41380.00	15820.00	2.62	52
12243	2	1987	1	2	68475.00	30250.00	2.26	52
12244	2	1987	2	0	37354.00	21620.00	1.73	52
12245	2	1987	2	1	22715.00	12300.00	1.85	52
12246	2	1987	2	2	60069.00	33920.00	1.77	52
12247	2	1988	1	0	36040.00	18210.00	1.98	52
12248	2	1988	1	1	57649.00	19260.00	2.99	52
12249	2	1988	1	2	93689.00	37470.00	2.50	52
12250	2	1988	2	0	41029.00	20780.00	1.97	52
12251	2	1988	2	1	47657.00	16790.00	2.84	52
12252	2	1988	2	2	88686.00	37570.00	2.36	52
12253	2	1989	1	0	35303.00	17140.00	2.06	52
12254	2	1989	1	1	49473.00	18160.00	2.72	52
12255	2	1989	1	2	84776.00	35300.00	2.40	52
12256	2	1989	2	0	56135.00	21350.00	2.63	52
12257	2	1989	2	1	56965.00	16930.00	3.36	52
12258	2	1989	2	2	113100.00	38280.00	2.95	52
12259	2	1990	1	0	20181.00	11950.00	1.69	52
12260	2	1990	1	1	58127.00	21980.00	2.64	52
12261	2	1990	1	2	78308.00	33930.00	2.31	52
12262	2	1990	2	0	58735.00	23530.00	2.50	52
12263	2	1990	2	1	55861.00	17590.00	3.18	52
12264	2	1990	2	2	114596.00	41120.00	2.79	52
12265	2	1991	1	0	33994.00	12930.00	2.63	52
12266	2	1991	1	1	79231.00	26650.00	2.97	52
12267	2	1991	1	2	113225.00	39580.00	2.86	52
12268	2	1991	2	0	40417.00	16540.00	2.44	52
12269	2	1991	2	1	93269.00	30860.00	3.02	52
12270	2	1991	2	2	133686.00	47400.00	2.82	52
12271	2	1992	1	0	23610.00	10380.00	2.27	52
12272	2	1992	1	1	87916.00	30080.00	2.92	52
12273	2	1992	1	2	111526.00	40460.00	2.76	52
12274	2	1992	2	0	27206.00	12600.00	2.16	52
12275	2	1992	2	1	79535.00	28930.00	2.75	52
12276	2	1992	2	2	106741.00	41530.00	2.57	52
12277	2	1993	1	0	14796.00	7290.00	2.03	52
12278	2	1993	1	1	94571.00	31670.00	2.99	52
12279	2	1993	1	2	109367.00	38960.00	2.81	52
12280	2	1993	2	0	26390.00	12160.00	2.17	52
12281	2	1993	2	1	77041.00	28140.00	2.74	52
12282	2	1993	2	2	103431.00	40300.00	2.57	52
12283	2	1994	1	0	17712.00	7030.00	2.52	52
12284	2	1994	1	1	72707.00	24920.00	2.92	52
12285	2	1994	1	2	90419.00	31950.00	2.83	52
12286	2	1994	2	0	30282.00	15020.00	2.02	52
12287	2	1994	2	1	65898.00	23500.00	2.80	52
12288	2	1994	2	2	96180.00	38520.00	2.50	52
12289	2	1995	1	0	33332.00	13580.00	2.45	52
12290	2	1995	1	1	75201.00	24590.00	3.06	52
12291	2	1995	1	2	108533.00	38170.00	2.84	52
12292	2	1995	2	0	29618.00	14880.00	1.99	52
12293	2	1995	2	1	61918.00	25072.00	2.47	52
12294	2	1995	2	2	91536.00	39952.00	2.29	52
12295	2	1996	1	0	32380.00	13494.00	2.40	52
12296	2	1996	1	1	76011.00	24912.00	3.05	52
12297	2	1996	1	2	108391.00	38406.00	2.82	52
12298	2	1996	2	0	29491.00	14205.00	2.08	52
12299	2	1996	2	1	66072.00	26870.00	2.46	52
12300	2	1996	2	2	95563.00	41075.00	2.33	52
12301	2	1997	1	0	34661.00	13829.00	2.51	52
12302	2	1997	1	1	82487.00	26119.00	3.16	52
12303	2	1997	1	2	117148.00	39948.00	2.93	52
12304	2	1997	2	0	30760.00	14606.00	2.11	52
12305	2	1997	2	1	70582.00	26835.00	2.63	52
12306	2	1997	2	2	101342.00	41441.00	2.45	52
12307	2	1998	1	0	27686.00	12051.00	2.30	52
12308	2	1998	1	1	77800.00	25712.00	3.03	52
12309	2	1998	1	2	105486.00	37763.00	2.79	52
12310	2	1998	2	0	30859.00	15281.00	2.02	52
12311	2	1998	2	1	68140.00	25160.00	2.71	52
12312	2	1998	2	2	98999.00	40441.00	2.45	52
12313	2	1999	1	0	30276.00	11176.00	2.71	52
12314	2	1999	1	1	76897.00	24440.00	3.15	52
12315	2	1999	1	2	107173.00	35616.00	3.01	52
12316	2	1999	2	0	51246.00	17265.00	2.97	52
12317	2	1999	2	1	89257.00	26925.00	3.32	52
12318	2	1999	2	2	140503.00	44190.00	3.18	52
12319	2	2000	1	0	34071.00	11985.00	2.84	52
12320	2	2000	1	1	86178.00	26400.00	3.26	52
12321	2	2000	1	2	120249.00	38385.00	3.13	52
12322	2	2000	2	0	48069.00	16570.00	2.90	52
12323	2	2000	2	1	85849.00	26847.00	3.20	52
12324	2	2000	2	2	133918.00	43417.00	3.08	52
12325	2	2001	1	0	34895.00	12027.00	2.90	52
12326	2	2001	1	1	86121.00	26510.00	3.25	52
12327	2	2001	1	2	121016.00	38537.00	3.14	52
12328	2	2001	2	0	49760.00	16738.00	2.97	52
12329	2	2001	2	1	86058.00	26845.00	3.21	52
12330	2	2001	2	2	135818.00	43583.00	3.12	52
12331	2	2002	1	0	38818.00	12327.00	3.15	52
12332	2	2002	1	1	91717.00	26470.00	3.46	52
12333	2	2002	1	2	130535.00	38797.00	3.36	52
12334	2	2002	2	0	44292.00	14570.00	3.04	52
12335	2	2002	2	1	90722.00	26580.00	3.41	52
12336	2	2002	2	2	135014.00	41150.00	3.28	52
12337	2	2003	1	0	34584.00	12286.00	2.81	52
12338	2	2003	1	1	87477.00	26509.00	3.30	52
12339	2	2003	1	2	122061.00	38795.00	3.15	52
12340	2	2003	2	0	26648.00	8559.00	3.11	52
12341	2	2003	2	1	106263.00	29767.00	3.57	52
12342	2	2003	2	2	132911.00	38326.00	3.47	52
12343	2	2004	1	0	37420.00	11950.00	3.13	52
12344	2	2004	1	1	95790.00	26940.00	3.56	52
12345	2	2004	1	2	133210.00	38890.00	3.43	52
12346	2	2004	2	0	25536.00	8399.00	3.04	52
12347	2	2004	2	1	97001.00	27734.00	3.50	52
12348	2	2004	2	2	122537.00	36133.00	3.39	52
12349	2	2005	1	0	39893.00	12292.00	3.25	52
12350	2	2005	1	1	107600.00	27631.00	3.89	52
12351	2	2005	1	2	147493.00	39923.00	3.69	52
12352	2	2005	2	0	26219.00	7850.00	3.34	52
12353	2	2005	2	1	116070.00	28512.00	4.07	52
12354	2	2005	2	2	142289.00	36362.00	3.91	52
12355	2	2006	1	0	41953.00	12872.00	3.26	52
12356	2	2006	1	1	121762.00	27778.00	4.38	52
12357	2	2006	1	2	163715.00	40650.00	4.03	52
12358	2	2006	2	0	31416.00	9623.00	3.26	52
12359	2	2006	2	1	125228.00	28772.00	4.35	52
12360	2	2006	2	2	156644.00	38395.00	4.08	52
12361	2	2007	1	0	40662.00	12872.00	3.16	52
12362	2	2007	1	1	120738.00	27841.00	4.34	52
12363	2	2007	1	2	161400.00	40713.00	3.96	52
12364	2	2007	2	0	32834.00	10325.00	3.18	52
12365	2	2007	2	1	124624.00	29424.00	4.24	52
12366	2	2007	2	2	157458.00	39749.00	3.96	52
12367	2	2008	1	0	36743.00	13594.00	2.70	52
12368	2	2008	1	1	96392.00	28205.00	3.42	52
12369	2	2008	1	2	133135.00	41799.00	3.19	52
12370	2	2008	2	0	31861.00	10524.00	3.03	52
12371	2	2008	2	1	119458.00	29741.00	4.02	52
12372	2	2008	2	2	151319.00	40265.00	3.76	52
12373	2	2009	1	0	31216.00	11445.00	2.73	52
12374	2	2009	1	1	109615.00	34425.00	3.18	52
12375	2	2009	1	2	140831.00	45870.00	3.07	52
12376	2	2009	2	0	34223.00	10756.00	3.18	52
12377	2	2009	2	1	132684.00	32409.00	4.09	52
12378	2	2009	2	2	166907.00	43165.00	3.87	52
12379	2	2010	1	0	22496.00	11193.00	2.01	52
12380	2	2010	1	1	114928.00	33997.00	3.38	52
12381	2	2010	1	2	137424.00	45190.00	3.04	52
12382	2	2010	2	0	36349.00	12352.00	2.94	52
12383	2	2010	2	1	134696.00	34048.00	3.96	52
12384	2	2010	2	2	171045.00	46400.00	3.69	52
12385	2	2011	1	0	39008.00	12549.00	3.11	52
12386	2	2011	1	1	143054.00	40126.00	3.57	52
12387	2	2011	1	2	182062.00	52675.00	3.46	52
12388	2	2011	2	0	33491.00	10420.00	3.21	52
12389	2	2011	2	1	144847.00	35997.00	4.02	52
12390	2	2011	2	2	178338.00	46417.00	3.84	52
12391	2	2012	1	0	37069.00	11647.00	3.18	52
12392	2	2012	1	1	152414.00	41031.00	3.71	52
12393	2	2012	1	2	189483.00	52678.00	3.60	52
12394	2	2012	2	0	26883.00	8975.00	3.00	52
12395	2	2012	2	1	158840.00	43401.00	3.66	52
12396	2	2012	2	2	185723.00	52376.00	3.55	52
12397	2	2013	1	0	27824.00	8921.00	3.12	52
12398	2	2013	1	1	163227.00	43752.00	3.73	52
12399	2	2013	1	2	191051.00	52673.00	3.63	52
12400	2	2013	2	0	38043.00	11770.00	3.23	52
12401	2	2013	2	1	162772.00	41022.00	3.97	52
12402	2	2013	2	2	200815.00	52792.00	3.80	52
12403	2	2014	1	0	25803.00	8551.00	3.02	52
12404	2	2014	1	1	185562.00	44125.00	4.21	52
12405	2	2014	1	2	211365.00	52676.00	4.01	52
12406	2	2014	2	0	31142.00	10195.00	3.05	52
12407	2	2014	2	1	171001.00	38755.00	4.41	52
12408	2	2014	2	2	202143.00	48950.00	4.13	52
12409	2	2015	1	0	22853.00	8064.00	2.83	52
12410	2	2015	1	1	182440.00	44907.00	4.06	52
12411	2	2015	1	2	205293.00	52971.00	3.88	52
12412	2	2015	2	0	24141.00	7998.00	3.02	52
12413	2	2015	2	1	162779.00	40545.00	4.01	52
12414	2	2015	2	2	186920.00	48543.00	3.85	52
12415	2	2016	1	0	19551.00	7465.00	2.62	52
12416	2	2016	1	1	166609.00	44901.00	3.71	52
12417	2	2016	1	2	186160.00	52366.00	3.55	52
12418	2	2016	2	0	27979.00	9236.00	3.03	52
12419	2	2016	2	1	169469.00	42388.00	4.00	52
12420	2	2016	2	2	197448.00	51624.00	3.82	52
12421	2	2017	1	0	25464.00	7487.00	3.40	52
12422	2	2017	1	1	199945.00	44819.00	4.46	52
12423	2	2017	1	2	225409.00	52306.00	4.31	52
12424	2	2017	2	0	30848.00	10102.00	3.05	52
12425	2	2017	2	1	164208.00	43101.00	3.81	52
12426	2	2017	2	2	195056.00	53203.00	3.67	52
12427	2	2018	1	0	25102.00	8152.00	3.08	52
12428	2	2018	1	1	187903.00	46395.00	4.05	52
12429	2	2018	1	2	213005.00	54547.00	3.90	52
12430	2	2018	2	0	33286.25	9387.00	3.55	52
12431	2	2018	2	1	189418.12	42742.00	4.43	52
12432	2	2018	2	2	222704.37	52129.00	4.27	52
12433	2	2019	1	0	24696.50	8133.00	3.04	52
12434	2	2019	1	1	174294.14	46184.00	3.77	52
12435	2	2019	1	2	198990.64	54317.00	3.66	52
12436	2	2019	2	0	31977.79	9012.00	3.55	52
12437	2	2019	2	1	189033.57	42007.00	4.50	52
12438	2	2019	2	2	221011.36	51019.00	4.33	52
12439	2	2020	1	0	25699.38	7018.00	3.66	52
12440	2	2020	1	1	187230.44	41066.00	4.56	52
12441	2	2020	1	2	212929.82	48084.00	4.43	52
12442	2	2020	2	0	30584.84	9034.00	3.39	52
12443	2	2020	2	1	187452.66	42778.60	4.38	52
12444	2	2020	2	2	218037.50	51812.60	4.21	52
12445	2	1987	1	0	8940.00	5350.00	1.67	53
12446	2	1987	1	1	6670.00	4560.00	1.46	53
12447	2	1987	1	2	15610.00	9910.00	1.58	53
12448	2	1987	2	0	29278.00	17890.00	1.64	53
12449	2	1987	2	1	21611.00	6730.00	3.21	53
12450	2	1987	2	2	50889.00	24620.00	2.07	53
12451	2	1988	1	0	8811.00	4280.00	2.06	53
12452	2	1988	1	1	10530.00	4510.00	2.33	53
12453	2	1988	1	2	19341.00	8790.00	2.20	53
12454	2	1988	2	0	34965.00	19760.00	1.77	53
12455	2	1988	2	1	15628.00	6230.00	2.51	53
12456	2	1988	2	2	50593.00	25990.00	1.95	53
12457	2	1989	1	0	9997.00	5360.00	1.87	53
12458	2	1989	1	1	8326.00	3300.00	2.52	53
12459	2	1989	1	2	18323.00	8660.00	2.12	53
12460	2	1989	2	0	43783.00	24460.00	1.79	53
12461	2	1989	2	1	16996.00	6070.00	2.80	53
12462	2	1989	2	2	60779.00	30530.00	1.99	53
12463	2	1990	1	0	2340.00	1600.00	1.46	53
12464	2	1990	1	1	5610.00	2720.00	2.06	53
12465	2	1990	1	2	7950.00	4320.00	1.84	53
12466	2	1990	2	0	42875.00	21810.00	1.97	53
12467	2	1990	2	1	20925.00	7400.00	2.83	53
12468	2	1990	2	2	63800.00	29210.00	2.18	53
12469	2	1991	1	0	10011.00	4940.00	2.03	53
12470	2	1991	1	1	5558.00	4170.00	1.33	53
12471	2	1991	1	2	15569.00	9110.00	1.71	53
12472	2	1991	2	0	53610.00	24340.00	2.20	53
12473	2	1991	2	1	33195.00	11370.00	2.92	53
12474	2	1991	2	2	86805.00	35710.00	2.43	53
12475	2	1992	1	0	10100.00	4850.00	2.08	53
12476	2	1992	1	1	6590.00	4930.00	1.34	53
12477	2	1992	1	2	16690.00	9780.00	1.71	53
12478	2	1992	2	0	48539.00	25560.00	1.90	53
12479	2	1992	2	1	24379.00	10860.00	2.24	53
12480	2	1992	2	2	72918.00	36420.00	2.00	53
12481	2	1993	1	0	6479.00	4160.00	1.56	53
12482	2	1993	1	1	10925.00	4750.00	2.30	53
12483	2	1993	1	2	17404.00	8910.00	1.95	53
12484	2	1993	2	0	37398.00	21880.00	1.71	53
12485	2	1993	2	1	33657.00	11670.00	2.88	53
12486	2	1993	2	2	71055.00	33550.00	2.12	53
12487	2	1994	1	0	65462.00	30200.00	2.17	53
12488	2	1994	1	1	26240.00	8890.00	2.95	53
12489	2	1994	1	2	91702.00	39090.00	2.35	53
12490	2	1994	2	0	69597.00	34960.00	1.99	53
12491	2	1994	2	1	43141.00	12840.00	3.36	53
12492	2	1994	2	2	112738.00	47800.00	2.36	53
12493	2	1995	1	0	25108.00	14390.00	1.74	53
12494	2	1995	1	1	30915.00	12790.00	2.42	53
12495	2	1995	1	2	56023.00	27180.00	2.06	53
12496	2	1995	2	0	60394.00	33378.00	1.81	53
12497	2	1995	2	1	33262.00	11310.00	2.94	53
12498	2	1995	2	2	93656.00	44688.00	2.10	53
12499	2	1996	1	0	22654.00	9993.00	2.27	53
12500	2	1996	1	1	25753.00	10015.00	2.57	53
12501	2	1996	1	2	48407.00	20008.00	2.42	53
12502	2	1996	2	0	55481.00	25910.00	2.14	53
12503	2	1996	2	1	35677.00	13382.00	2.67	53
12504	2	1996	2	2	91158.00	39292.00	2.32	53
12505	2	1997	1	0	25148.00	13451.00	1.87	53
12506	2	1997	1	1	23993.00	9954.00	2.41	53
12507	2	1997	1	2	49141.00	23405.00	2.10	53
12508	2	1997	2	0	51196.00	27159.00	1.89	53
12509	2	1997	2	1	41863.00	15736.00	2.66	53
12510	2	1997	2	2	93059.00	42895.00	2.17	53
12511	2	1998	1	0	10350.00	11500.00	0.90	53
12512	2	1998	1	1	19260.00	10700.00	1.80	53
12513	2	1998	1	2	29610.00	22200.00	1.33	53
12514	2	1998	2	0	37944.00	20080.00	1.89	53
12515	2	1998	2	1	30703.00	12967.00	2.37	53
12516	2	1998	2	2	68647.00	33047.00	2.08	53
12517	2	1999	1	0	27711.00	11724.00	2.36	53
12518	2	1999	1	1	30457.00	11950.00	2.55	53
12519	2	1999	1	2	58168.00	23674.00	2.46	53
12520	2	1999	2	0	52172.00	24415.00	2.14	53
12521	2	1999	2	1	48257.00	17844.00	2.70	53
12522	2	1999	2	2	100429.00	42259.00	2.38	53
12523	2	2000	1	0	33989.00	15620.00	2.18	53
12524	2	2000	1	1	36359.00	12857.00	2.83	53
12525	2	2000	1	2	70348.00	28477.00	2.47	53
12526	2	2000	2	0	71967.00	30391.00	2.37	53
12527	2	2000	2	1	56010.00	18861.00	2.97	53
12528	2	2000	2	2	127977.00	49252.00	2.60	53
12529	2	2001	1	0	35935.00	16553.00	2.17	53
12530	2	2001	1	1	38701.00	12905.00	3.00	53
12531	2	2001	1	2	74636.00	29458.00	2.53	53
12532	2	2001	2	0	74052.00	32912.00	2.25	53
12533	2	2001	2	1	55086.00	18362.00	3.00	53
12534	2	2001	2	2	129138.00	51274.00	2.52	53
12535	2	2002	1	0	35099.00	16282.00	2.16	53
12536	2	2002	1	1	36812.00	12880.00	2.86	53
12537	2	2002	1	2	71911.00	29162.00	2.47	53
12538	2	2002	2	0	81289.00	32451.00	2.50	53
12539	2	2002	2	1	57368.00	18726.00	3.06	53
12540	2	2002	2	2	138657.00	51177.00	2.71	53
12541	2	2003	1	0	33185.00	15848.00	2.09	53
12542	2	2003	1	1	34888.00	12649.00	2.76	53
12543	2	2003	1	2	68073.00	28497.00	2.39	53
12544	2	2003	2	0	89383.00	32499.00	2.75	53
12545	2	2003	2	1	58758.00	18954.00	3.10	53
12546	2	2003	2	2	148141.00	51453.00	2.88	53
12547	2	2004	1	0	37772.00	16320.00	2.31	53
12548	2	2004	1	1	36791.00	12651.00	2.91	53
12549	2	2004	1	2	74563.00	28971.00	2.57	53
12550	2	2004	2	0	95858.00	32498.00	2.95	53
12551	2	2004	2	1	66364.00	18961.00	3.50	53
12552	2	2004	2	2	162222.00	51459.00	3.15	53
12553	2	2005	1	0	33595.00	14033.00	2.39	53
12554	2	2005	1	1	34677.00	11880.00	2.92	53
12555	2	2005	1	2	68272.00	25913.00	2.63	53
12556	2	2005	2	0	75207.00	28339.00	2.65	53
12557	2	2005	2	1	64049.00	18247.00	3.51	53
12558	2	2005	2	2	139256.00	46586.00	2.99	53
12559	2	2006	1	0	33408.00	13525.00	2.47	53
12560	2	2006	1	1	35372.00	11824.00	2.99	53
12561	2	2006	1	2	68780.00	25349.00	2.71	53
12562	2	2006	2	0	86064.00	30720.00	2.80	53
12563	2	2006	2	1	73251.00	20490.00	3.57	53
12564	2	2006	2	2	159315.00	51210.00	3.11	53
12565	2	2007	1	0	46324.00	17358.00	2.67	53
12566	2	2007	1	1	37602.00	12100.00	3.11	53
12567	2	2007	1	2	83926.00	29458.00	2.85	53
12568	2	2007	2	0	86385.00	30745.00	2.81	53
12569	2	2007	2	1	73572.00	20214.00	3.64	53
12570	2	2007	2	2	159957.00	50959.00	3.14	53
12571	2	2008	1	0	47350.00	17100.00	2.77	53
12572	2	2008	1	1	39020.00	11710.00	3.33	53
12573	2	2008	1	2	86370.00	28810.00	3.00	53
12574	2	2008	2	0	58547.00	24800.00	2.36	53
12575	2	2008	2	1	60175.00	20457.00	2.94	53
12576	2	2008	2	2	118722.00	45257.00	2.62	53
12577	2	2009	1	0	45188.00	17649.00	2.56	53
12578	2	2009	1	1	39764.00	13307.00	2.99	53
12579	2	2009	1	2	84952.00	30956.00	2.74	53
12580	2	2009	2	0	87855.00	28900.00	3.04	53
12581	2	2009	2	1	71368.00	21477.00	3.32	53
12582	2	2009	2	2	159223.00	50377.00	3.16	53
12583	2	2010	1	0	29776.00	14513.00	2.05	53
12584	2	2010	1	1	45180.00	16231.00	2.78	53
12585	2	2010	1	2	74956.00	30744.00	2.44	53
12586	2	2010	2	0	59117.00	20129.00	2.94	53
12587	2	2010	2	1	70734.00	19675.00	3.60	53
12588	2	2010	2	2	129851.00	39804.00	3.26	53
12589	2	2011	1	0	41533.00	14242.00	2.92	53
12590	2	2011	1	1	61751.00	17781.00	3.47	53
12591	2	2011	1	2	103284.00	32023.00	3.23	53
12592	2	2011	2	0	65957.00	19495.00	3.38	53
12593	2	2011	2	1	69247.00	18455.00	3.75	53
12594	2	2011	2	2	135204.00	37950.00	3.56	53
12595	2	2012	1	0	43971.00	14254.00	3.08	53
12596	2	2012	1	1	66465.00	17958.00	3.70	53
12597	2	2012	1	2	110436.00	32212.00	3.43	53
12598	2	2012	2	0	79706.00	22876.00	3.48	53
12599	2	2012	2	1	77521.00	19674.00	3.94	53
12600	2	2012	2	2	157227.00	42550.00	3.70	53
12601	2	2013	1	0	39424.00	13518.00	2.92	53
12602	2	2013	1	1	51926.00	15097.00	3.44	53
12603	2	2013	1	2	91350.00	28615.00	3.19	53
12604	2	2013	2	0	77165.00	22805.00	3.38	53
12605	2	2013	2	1	87879.00	24124.00	3.64	53
12606	2	2013	2	2	165044.00	46929.00	3.52	53
12607	2	2014	1	0	42831.00	14274.00	3.00	53
12608	2	2014	1	1	60167.00	17253.00	3.49	53
12609	2	2014	1	2	102998.00	31527.00	3.27	53
12610	2	2014	2	0	71929.00	21499.00	3.35	53
12611	2	2014	2	1	99223.00	25178.00	3.94	53
12612	2	2014	2	2	171152.00	46677.00	3.67	53
12613	2	2015	1	0	40516.00	13758.00	2.94	53
12614	2	2015	1	1	68879.00	20447.00	3.37	53
12615	2	2015	1	2	109395.00	34205.00	3.20	53
12616	2	2015	2	0	71339.00	21184.00	3.37	53
12617	2	2015	2	1	99506.00	25118.00	3.96	53
12618	2	2015	2	2	170845.00	46302.00	3.69	53
12619	2	2016	1	0	22058.00	8211.00	2.69	53
12620	2	2016	1	1	40096.00	13882.00	2.89	53
12621	2	2016	1	2	62154.00	22093.00	2.81	53
12622	2	2016	2	0	86749.00	25184.00	3.44	53
12623	2	2016	2	1	142778.00	34621.00	4.12	53
12624	2	2016	2	2	229527.00	59805.00	3.84	53
12625	2	2017	1	0	44694.00	14586.00	3.06	53
12626	2	2017	1	1	72262.00	21347.00	3.39	53
12627	2	2017	1	2	116956.00	35933.00	3.25	53
12628	2	2017	2	0	87630.00	24714.00	3.55	53
12629	2	2017	2	1	136679.00	32066.00	4.26	53
12630	2	2017	2	2	224309.00	56780.00	3.95	53
12631	2	2018	1	0	51883.00	15179.00	3.42	53
12632	2	2018	1	1	87297.00	22638.00	3.86	53
12633	2	2018	1	2	139180.00	37817.00	3.68	53
12634	2	2018	2	0	85610.00	24081.00	3.56	53
12635	2	2018	2	1	142242.00	33164.00	4.29	53
12636	2	2018	2	2	227852.00	57245.00	3.98	53
12637	2	2019	1	0	52976.00	16304.00	3.25	53
12638	2	2019	1	1	82370.00	21733.00	3.79	53
12639	2	2019	1	2	135346.00	38037.00	3.56	53
12640	2	2019	2	0	90419.00	24677.00	3.66	53
12641	2	2019	2	1	155939.00	34330.00	4.54	53
12642	2	2019	2	2	246358.00	59007.00	4.18	53
12643	2	2020	1	0	54823.00	16155.00	3.39	53
12644	2	2020	1	1	87807.00	22198.00	3.96	53
12645	2	2020	1	2	142630.00	38353.00	3.72	53
12646	2	2020	2	0	88804.00	24232.00	3.66	53
12647	2	2020	2	1	155738.00	34630.00	4.50	53
12648	2	2020	2	2	244542.00	58862.00	4.15	53
12649	2	1987	1	0	445.00	230.00	1.93	54
12650	2	1987	1	1	94800.00	27520.00	3.44	54
12651	2	1987	1	2	95245.00	27750.00	3.43	54
12652	2	1987	2	0	16074.00	5530.00	2.91	54
12653	2	1987	2	1	62122.00	18240.00	3.41	54
12654	2	1987	2	2	78196.00	23770.00	3.29	54
12655	2	1988	1	0	2157.00	1170.00	1.84	54
12656	2	1988	1	1	95439.00	26990.00	3.54	54
12657	2	1988	1	2	97596.00	28160.00	3.47	54
12658	2	1988	2	0	7856.00	3870.00	2.03	54
12659	2	1988	2	1	54890.00	18830.00	2.92	54
12660	2	1988	2	2	62746.00	22700.00	2.76	54
12661	2	1989	1	0	304.00	130.00	2.34	54
12662	2	1989	1	1	103823.00	26600.00	3.90	54
12663	2	1989	1	2	104127.00	26730.00	3.90	54
12664	2	1989	2	0	12405.00	4050.00	3.06	54
12665	2	1989	2	1	75998.00	23080.00	3.29	54
12666	2	1989	2	2	88403.00	27130.00	3.26	54
12667	2	1990	1	0	\N	\N	\N	54
12668	2	1990	1	1	97947.00	25760.00	3.80	54
12669	2	1990	1	2	97947.00	25760.00	3.80	54
12670	2	1990	2	0	24282.00	6390.00	3.80	54
12671	2	1990	2	1	80529.00	19440.00	4.14	54
12672	2	1990	2	2	104811.00	25830.00	4.06	54
12673	2	1991	1	0	\N	\N	\N	54
12674	2	1991	1	1	118187.00	26900.00	4.39	54
12675	2	1991	1	2	118187.00	26900.00	4.39	54
12676	2	1991	2	0	9617.00	3580.00	2.69	54
12677	2	1991	2	1	39645.00	12320.00	3.22	54
12678	2	1991	2	2	49262.00	15900.00	3.10	54
12679	2	1992	1	0	\N	\N	\N	54
12680	2	1992	1	1	101844.00	23280.00	4.37	54
12681	2	1992	1	2	101844.00	23280.00	4.37	54
12682	2	1992	2	0	8238.00	2440.00	3.38	54
12683	2	1992	2	1	55031.00	13010.00	4.23	54
12684	2	1992	2	2	63269.00	15450.00	4.10	54
12685	2	1993	1	0	\N	\N	\N	54
12686	2	1993	1	1	114354.00	24290.00	4.71	54
12687	2	1993	1	2	114354.00	24290.00	4.71	54
12688	2	1993	2	0	5164.00	1710.00	3.02	54
12689	2	1993	2	1	45151.00	13390.00	3.37	54
12690	2	1993	2	2	50315.00	15100.00	3.33	54
12691	2	1994	1	0	\N	\N	\N	54
12692	2	1994	1	1	148986.00	37890.00	3.93	54
12693	2	1994	1	2	148986.00	37890.00	3.93	54
12694	2	1994	2	0	8978.00	3080.00	2.91	54
12695	2	1994	2	1	62008.00	19010.00	3.26	54
12696	2	1994	2	2	70986.00	22090.00	3.21	54
12697	2	1995	1	0	\N	\N	\N	54
12698	2	1995	1	1	151612.00	43740.00	3.47	54
12699	2	1995	1	2	151612.00	43740.00	3.47	54
12700	2	1995	2	0	17112.00	6900.00	2.48	54
12701	2	1995	2	1	48105.00	17891.00	2.69	54
12702	2	1995	2	2	65217.00	24791.00	2.63	54
12703	2	1996	1	0	\N	\N	\N	54
12704	2	1996	1	1	157557.00	39424.00	4.00	54
12705	2	1996	1	2	157557.00	39424.00	4.00	54
12706	2	1996	2	0	16771.00	6335.00	2.65	54
12707	2	1996	2	1	67451.00	19887.00	3.39	54
12708	2	1996	2	2	84222.00	26222.00	3.21	54
12709	2	1997	1	0	864.00	300.00	2.88	54
12710	2	1997	1	1	162022.00	40749.00	3.98	54
12711	2	1997	1	2	162886.00	41049.00	3.97	54
12712	2	1997	2	0	10230.00	3410.00	3.00	54
12713	2	1997	2	1	63540.00	17841.00	3.56	54
12714	2	1997	2	2	73770.00	21251.00	3.47	54
12715	2	1998	1	0	308.00	200.00	1.54	54
12716	2	1998	1	1	87242.00	27216.00	3.21	54
12717	2	1998	1	2	87550.00	27416.00	3.19	54
12718	2	1998	2	0	5064.00	2400.00	2.11	54
12719	2	1998	2	1	41551.00	14997.00	2.77	54
12720	2	1998	2	2	46615.00	17397.00	2.68	54
12721	2	1999	1	0	\N	\N	\N	54
12722	2	1999	1	1	134063.00	36327.00	3.69	54
12723	2	1999	1	2	134063.00	36327.00	3.69	54
12724	2	1999	2	0	10387.00	3905.00	2.66	54
12725	2	1999	2	1	68575.00	20487.00	3.35	54
12726	2	1999	2	2	78962.00	24392.00	3.24	54
12727	2	2000	1	0	520.00	200.00	2.60	54
12728	2	2000	1	1	143327.00	33922.00	4.23	54
12729	2	2000	1	2	143847.00	34122.00	4.22	54
12730	2	2000	2	0	10251.00	3755.00	2.73	54
12731	2	2000	2	1	74630.00	22900.00	3.26	54
12732	2	2000	2	2	84881.00	26655.00	3.18	54
12733	2	2001	1	0	682.00	200.00	3.41	54
12734	2	2001	1	1	155240.00	35308.00	4.40	54
12735	2	2001	1	2	155922.00	35508.00	4.39	54
12736	2	2001	2	0	8083.00	2950.00	2.74	54
12737	2	2001	2	1	83661.00	22740.00	3.68	54
12738	2	2001	2	2	91744.00	25690.00	3.57	54
12739	2	2002	1	0	515.00	150.00	3.43	54
12740	2	2002	1	1	165954.00	36246.00	4.58	54
12741	2	2002	1	2	166469.00	36396.00	4.57	54
12742	2	2002	2	0	9507.00	2855.00	3.33	54
12743	2	2002	2	1	92782.00	23309.00	3.98	54
12744	2	2002	2	2	102289.00	26164.00	3.91	54
12745	2	2003	1	0	592.00	175.00	3.38	54
12746	2	2003	1	1	165291.00	39355.00	4.20	54
12747	2	2003	1	2	165883.00	39530.00	4.20	54
12748	2	2003	2	0	11175.00	3045.00	3.67	54
12749	2	2003	2	1	96199.00	23520.00	4.09	54
12750	2	2003	2	2	107374.00	26565.00	4.04	54
12751	2	2004	1	0	357.00	105.00	3.40	54
12752	2	2004	1	1	177479.00	39480.00	4.50	54
12753	2	2004	1	2	177836.00	39585.00	4.49	54
12754	2	2004	2	0	10622.00	3070.00	3.46	54
12755	2	2004	2	1	84312.00	21078.00	4.00	54
12756	2	2004	2	2	94934.00	24148.00	3.93	54
12757	2	2005	1	0	251.00	75.00	3.35	54
12758	2	2005	1	1	189512.00	40842.00	4.64	54
12759	2	2005	1	2	189763.00	40917.00	4.64	54
12760	2	2005	2	0	12055.00	3167.00	3.81	54
12761	2	2005	2	1	91462.00	21137.00	4.33	54
12762	2	2005	2	2	103517.00	24304.00	4.26	54
12763	2	2006	1	0	161.00	48.00	3.35	54
12764	2	2006	1	1	205322.00	44055.00	4.66	54
12765	2	2006	1	2	205483.00	44103.00	4.66	54
12766	2	2006	2	0	13560.00	3480.00	3.90	54
12767	2	2006	2	1	115332.00	26920.00	4.28	54
12768	2	2006	2	2	128892.00	30400.00	4.24	54
12769	2	2007	1	0	147.00	49.00	3.00	54
12770	2	2007	1	1	222266.00	46093.00	4.82	54
12771	2	2007	1	2	222413.00	46142.00	4.82	54
12772	2	2007	2	0	13421.00	3455.00	3.88	54
12773	2	2007	2	1	154456.00	35561.00	4.34	54
12774	2	2007	2	2	167877.00	39016.00	4.30	54
12775	2	2008	1	0	120.00	40.00	3.00	54
12776	2	2008	1	1	226960.00	46540.00	4.88	54
12777	2	2008	1	2	227080.00	46580.00	4.88	54
12778	2	2008	2	0	14080.00	3600.00	3.91	54
12779	2	2008	2	1	157750.00	35730.00	4.42	54
12780	2	2008	2	2	171830.00	39330.00	4.37	54
12781	2	2009	1	0	\N	\N	\N	54
12782	2	2009	1	1	231047.00	46913.00	4.93	54
12783	2	2009	1	2	231047.00	46913.00	4.93	54
12784	2	2009	2	0	7659.00	2425.00	3.16	54
12785	2	2009	2	1	94266.00	24898.00	3.79	54
12786	2	2009	2	2	101925.00	27323.00	3.73	54
12787	2	2010	1	0	\N	\N	\N	54
12788	2	2010	1	1	238963.00	47177.00	5.07	54
12789	2	2010	1	2	238963.00	47177.00	5.07	54
12790	2	2010	2	0	10807.00	3090.00	3.50	54
12791	2	2010	2	1	143558.00	34479.00	4.16	54
12792	2	2010	2	2	154365.00	37569.00	4.11	54
12793	2	2011	1	0	\N	\N	\N	54
12794	2	2011	1	1	224481.00	47270.00	4.75	54
12795	2	2011	1	2	224481.00	47270.00	4.75	54
12796	2	2011	2	0	9917.00	2920.00	3.40	54
12797	2	2011	2	1	76058.00	18636.00	4.08	54
12798	2	2011	2	2	85975.00	21556.00	3.99	54
12799	2	2012	1	0	\N	\N	\N	54
12800	2	2012	1	1	242846.00	50857.00	4.78	54
12801	2	2012	1	2	242846.00	50857.00	4.78	54
12802	2	2012	2	0	12319.00	3180.00	3.87	54
12803	2	2012	2	1	133022.00	30220.00	4.40	54
12804	2	2012	2	2	145341.00	33400.00	4.35	54
12805	2	2013	1	0	\N	\N	\N	54
12806	2	2013	1	1	254656.00	52419.00	4.86	54
12807	2	2013	1	2	254656.00	52419.00	4.86	54
12808	2	2013	2	0	13951.00	3680.00	3.79	54
12809	2	2013	2	1	151114.00	34866.00	4.33	54
12810	2	2013	2	2	165065.00	38546.00	4.28	54
12811	2	2014	1	0	\N	\N	\N	54
12812	2	2014	1	1	256854.00	53648.00	4.79	54
12813	2	2014	1	2	256854.00	53648.00	4.79	54
12814	2	2014	2	0	16295.00	3705.00	4.40	54
12815	2	2014	2	1	159957.00	34258.00	4.67	54
12816	2	2014	2	2	176252.00	37963.00	4.64	54
12817	2	2015	1	0	\N	\N	\N	54
12818	2	2015	1	1	260497.00	53671.00	4.85	54
12819	2	2015	1	2	260497.00	53671.00	4.85	54
12820	2	2015	2	0	15369.00	3569.00	4.31	54
12821	2	2015	2	1	149743.00	33090.00	4.53	54
12822	2	2015	2	2	165112.00	36659.00	4.50	54
12823	2	2016	1	0	\N	\N	\N	54
12824	2	2016	1	1	246531.00	52529.00	4.69	54
12825	2	2016	1	2	246531.00	52529.00	4.69	54
12826	2	2016	2	0	4955.00	1395.00	3.55	54
12827	2	2016	2	1	170161.00	37891.00	4.49	54
12828	2	2016	2	2	175116.00	39286.00	4.46	54
12829	2	2017	1	0	0.00	0.00	\N	54
12830	2	2017	1	1	246836.00	52537.00	4.70	54
12831	2	2017	1	2	246836.00	52537.00	4.70	54
12832	2	2017	2	0	6229.00	1474.00	4.23	54
12833	2	2017	2	1	176341.00	38277.00	4.61	54
12834	2	2017	2	2	182570.00	39751.00	4.59	54
12835	2	2018	1	0	0.00	0.00	\N	54
12836	2	2018	1	1	248299.00	51517.00	4.82	54
12837	2	2018	1	2	248299.00	51517.00	4.82	54
12838	2	2018	2	0	5965.00	1405.00	4.25	54
12839	2	2018	2	1	177908.00	38156.00	4.66	54
12840	2	2018	2	2	183873.00	39561.00	4.65	54
12841	2	2019	1	0	0.00	0.00	\N	54
12842	2	2019	1	1	255487.81	50737.00	5.04	54
12843	2	2019	1	2	255487.81	50737.00	5.04	54
12844	2	2019	2	0	1148.00	280.00	4.10	54
12845	2	2019	2	1	194724.03	40452.00	4.81	54
12846	2	2019	2	2	195872.03	40732.00	4.81	54
12847	2	2020	1	0	0.00	0.00	\N	54
12848	2	2020	1	1	225609.60	45428.00	4.97	54
12849	2	2020	1	2	225609.60	45428.00	4.97	54
12850	2	2020	2	0	0.00	0.00	\N	54
12851	2	2020	2	1	196328.20	40724.12	4.82	54
12852	2	2020	2	2	196328.20	40724.12	4.82	54
12853	2	1987	1	0	3210.00	1790.00	1.79	55
12854	2	1987	1	1	90095.00	32680.00	2.76	55
12855	2	1987	1	2	93305.00	34470.00	2.71	55
12856	2	1987	2	0	176443.00	80650.00	2.19	55
12857	2	1987	2	1	235214.00	79370.00	2.96	55
12858	2	1987	2	2	411657.00	160020.00	2.57	55
12859	2	1988	1	0	557.00	460.00	1.21	55
12860	2	1988	1	1	90451.00	31400.00	2.88	55
12861	2	1988	1	2	91008.00	31860.00	2.86	55
12862	2	1988	2	0	257220.00	95700.00	2.69	55
12863	2	1988	2	1	223056.00	76640.00	2.91	55
12864	2	1988	2	2	480276.00	172340.00	2.79	55
12865	2	1989	1	0	154.00	60.00	2.57	55
12866	2	1989	1	1	90216.00	31200.00	2.89	55
12867	2	1989	1	2	90370.00	31260.00	2.89	55
12868	2	1989	2	0	261627.00	97410.00	2.69	55
12869	2	1989	2	1	195883.00	67380.00	2.91	55
12870	2	1989	2	2	457510.00	164790.00	2.78	55
12871	2	1990	1	0	283.00	110.00	2.57	55
12872	2	1990	1	1	85650.00	28820.00	2.97	55
12873	2	1990	1	2	85933.00	28930.00	2.97	55
12874	2	1990	2	0	273623.00	92730.00	2.95	55
12875	2	1990	2	1	225561.00	72550.00	3.11	55
12876	2	1990	2	2	499184.00	165280.00	3.02	55
12877	2	1991	1	0	287.00	110.00	2.61	55
12878	2	1991	1	1	93776.00	29760.00	3.15	55
12879	2	1991	1	2	94063.00	29870.00	3.15	55
12880	2	1991	2	0	287774.00	94620.00	3.04	55
12881	2	1991	2	1	255350.00	75850.00	3.37	55
12882	2	1991	2	2	543124.00	170470.00	3.19	55
12883	2	1992	1	0	1656.00	570.00	2.91	55
12884	2	1992	1	1	78997.00	25220.00	3.13	55
12885	2	1992	1	2	80653.00	25790.00	3.13	55
12886	2	1992	2	0	290650.00	99190.00	2.93	55
12887	2	1992	2	1	234842.00	73510.00	3.19	55
12888	2	1992	2	2	525492.00	172700.00	3.04	55
12889	2	1993	1	0	240.00	80.00	3.00	55
12890	2	1993	1	1	80250.00	25550.00	3.14	55
12891	2	1993	1	2	80490.00	25630.00	3.14	55
12892	2	1993	2	0	256050.00	94540.00	2.71	55
12893	2	1993	2	1	232667.00	73610.00	3.16	55
12894	2	1993	2	2	488717.00	168150.00	2.91	55
12895	2	1994	1	0	\N	\N	\N	55
12896	2	1994	1	1	102489.00	31060.00	3.30	55
12897	2	1994	1	2	102489.00	31060.00	3.30	55
12898	2	1994	2	0	245070.00	93680.00	2.62	55
12899	2	1994	2	1	232360.00	68090.00	3.41	55
12900	2	1994	2	2	477430.00	161770.00	2.95	55
12901	2	1995	1	0	\N	\N	\N	55
12902	2	1995	1	1	102674.00	34040.00	3.02	55
12903	2	1995	1	2	102674.00	34040.00	3.02	55
12904	2	1995	2	0	214992.00	92200.00	2.33	55
12905	2	1995	2	1	237767.00	72222.00	3.29	55
12906	2	1995	2	2	452759.00	164422.00	2.75	55
12907	2	1996	1	0	\N	\N	\N	55
12908	2	1996	1	1	140585.00	41742.00	3.37	55
12909	2	1996	1	2	140585.00	41742.00	3.37	55
12910	2	1996	2	0	213424.00	87280.00	2.45	55
12911	2	1996	2	1	280918.00	84212.00	3.34	55
12912	2	1996	2	2	494342.00	171492.00	2.88	55
12913	2	1997	1	0	\N	\N	\N	55
12914	2	1997	1	1	154578.00	47109.00	3.28	55
12915	2	1997	1	2	154578.00	47109.00	3.28	55
12916	2	1997	2	0	220953.00	86521.00	2.55	55
12917	2	1997	2	1	311037.00	84599.00	3.68	55
12918	2	1997	2	2	531990.00	171120.00	3.11	55
12919	2	1998	1	0	\N	\N	\N	55
12920	2	1998	1	1	112561.00	35001.00	3.22	55
12921	2	1998	1	2	112561.00	35001.00	3.22	55
12922	2	1998	2	0	144374.00	72160.00	2.00	55
12923	2	1998	2	1	225916.00	74162.00	3.05	55
13033	2	2017	1	0	491.00	130.00	3.78	55
12924	2	1998	2	2	370290.00	146322.00	2.53	55
12925	2	1999	1	0	1250.00	500.00	2.50	55
12926	2	1999	1	1	169380.00	46786.00	3.62	55
12927	2	1999	1	2	170630.00	47286.00	3.61	55
12928	2	1999	2	0	160024.00	61974.00	2.58	55
12929	2	1999	2	1	335146.00	98132.00	3.42	55
12930	2	1999	2	2	495170.00	160106.00	3.09	55
12931	2	2000	1	0	510.00	200.00	2.55	55
12932	2	2000	1	1	161687.00	44206.00	3.66	55
12933	2	2000	1	2	162197.00	44406.00	3.65	55
12934	2	2000	2	0	199970.00	73065.00	2.74	55
12935	2	2000	2	1	357954.00	96592.00	3.71	55
12936	2	2000	2	2	557924.00	169657.00	3.29	55
12937	2	2001	1	0	870.00	300.00	2.90	55
12938	2	2001	1	1	174267.00	45585.00	3.82	55
12939	2	2001	1	2	175137.00	45885.00	3.82	55
12940	2	2001	2	0	207267.00	73060.00	2.84	55
12941	2	2001	2	1	359752.00	97297.00	3.70	55
12942	2	2001	2	2	567019.00	170357.00	3.33	55
12943	2	2002	1	0	394.00	150.00	2.63	55
12944	2	2002	1	1	150210.00	44122.00	3.40	55
12945	2	2002	1	2	150604.00	44272.00	3.40	55
12946	2	2002	2	0	216324.00	73617.00	2.94	55
12947	2	2002	2	1	371892.00	97583.00	3.81	55
12948	2	2002	2	2	588216.00	171200.00	3.44	55
12949	2	2003	1	0	275.00	100.00	2.75	55
12950	2	2003	1	1	167544.00	46391.00	3.61	55
12951	2	2003	1	2	167819.00	46491.00	3.61	55
12952	2	2003	2	0	242831.00	73612.00	3.30	55
12953	2	2003	2	1	389788.00	97583.00	3.99	55
12954	2	2003	2	2	632619.00	171195.00	3.70	55
12955	2	2004	1	0	560.00	200.00	2.80	55
12956	2	2004	1	1	178833.00	47730.00	3.75	55
12957	2	2004	1	2	179393.00	47930.00	3.74	55
12958	2	2004	2	0	235276.00	73502.00	3.20	55
12959	2	2004	2	1	394571.00	99843.00	3.95	55
12960	2	2004	2	2	629847.00	173345.00	3.63	55
12961	2	2005	1	0	547.00	190.00	2.88	55
12962	2	2005	1	1	184309.00	47669.00	3.87	55
12963	2	2005	1	2	184856.00	47859.00	3.86	55
12964	2	2005	2	0	242385.00	73450.00	3.30	55
12965	2	2005	2	1	408633.00	99943.00	4.09	55
12966	2	2005	2	2	651018.00	173393.00	3.75	55
12967	2	2006	1	0	598.00	190.00	3.15	55
12968	2	2006	1	1	193503.00	47869.00	4.04	55
12969	2	2006	1	2	194101.00	48059.00	4.04	55
12970	2	2006	2	0	359133.00	90542.00	3.97	55
12971	2	2006	2	1	422964.00	94765.00	4.46	55
12972	2	2006	2	2	782097.00	185307.00	4.22	55
12973	2	2007	1	0	532.00	170.00	3.13	55
12974	2	2007	1	1	192858.00	48050.00	4.01	55
12975	2	2007	1	2	193390.00	48220.00	4.01	55
12976	2	2007	2	0	373094.00	91720.00	4.07	55
12977	2	2007	2	1	444631.00	92645.00	4.80	55
12978	2	2007	2	2	817725.00	184365.00	4.44	55
12979	2	2008	1	0	945.00	270.00	3.50	55
12980	2	2008	1	1	212153.00	52121.00	4.07	55
12981	2	2008	1	2	213098.00	52391.00	4.07	55
12982	2	2008	2	0	371520.00	91919.00	4.04	55
12983	2	2008	2	1	442671.00	94239.00	4.70	55
12984	2	2008	2	2	814191.00	186158.00	4.37	55
12985	2	2009	1	0	767.00	227.00	3.38	55
12986	2	2009	1	1	244045.00	59668.00	4.09	55
12987	2	2009	1	2	244812.00	59895.00	4.09	55
12988	2	2009	2	0	260417.00	85223.00	3.06	55
12989	2	2009	2	1	296879.00	94629.00	3.14	55
12990	2	2009	2	2	557296.00	179852.00	3.10	55
12991	2	2010	1	0	767.00	227.00	3.38	55
12992	2	2010	1	1	267396.00	65852.00	4.06	55
12993	2	2010	1	2	268163.00	66079.00	4.06	55
12994	2	2010	2	0	264869.00	84337.00	3.14	55
12995	2	2010	2	1	407668.00	95111.00	4.29	55
12996	2	2010	2	2	672537.00	179448.00	3.75	55
12997	2	2011	1	0	767.00	227.00	3.38	55
12998	2	2011	1	1	285569.00	66142.00	4.32	55
12999	2	2011	1	2	286336.00	66369.00	4.31	55
13000	2	2011	2	0	268470.00	80102.00	3.35	55
13001	2	2011	2	1	403464.00	95962.00	4.20	55
13002	2	2011	2	2	671934.00	176064.00	3.82	55
13003	2	2012	1	0	913.00	250.00	3.65	55
13004	2	2012	1	1	325584.00	71206.00	4.57	55
13005	2	2012	1	2	326497.00	71456.00	4.57	55
13006	2	2012	2	0	294492.00	82001.00	3.59	55
13007	2	2012	2	1	436591.00	98313.00	4.44	55
13008	2	2012	2	2	731083.00	180314.00	4.05	55
13009	2	2013	1	0	783.00	235.00	3.33	55
13010	2	2013	1	1	322364.00	73560.00	4.38	55
13011	2	2013	1	2	323147.00	73795.00	4.38	55
13012	2	2013	2	0	286127.00	80498.00	3.55	55
13013	2	2013	2	1	455762.00	101335.00	4.50	55
13014	2	2013	2	2	741889.00	181833.00	4.08	55
13015	2	2014	1	0	907.00	266.00	3.41	55
13016	2	2014	1	1	336586.00	75775.00	4.44	55
13017	2	2014	1	2	337493.00	76041.00	4.44	55
13018	2	2014	2	0	297697.00	80264.00	3.71	55
13019	2	2014	2	1	478535.00	104327.00	4.59	55
13020	2	2014	2	2	776232.00	184591.00	4.21	55
13021	2	2015	1	0	895.00	250.00	3.58	55
13022	2	2015	1	1	341849.00	75178.00	4.55	55
13023	2	2015	1	2	342744.00	75428.00	4.54	55
13024	2	2015	2	0	294794.00	80839.00	3.65	55
13025	2	2015	2	1	443619.00	103820.00	4.27	55
13026	2	2015	2	2	738413.00	184659.00	4.00	55
13027	2	2016	1	0	804.00	238.00	3.38	55
13028	2	2016	1	1	331260.00	73599.00	4.50	55
13029	2	2016	1	2	332064.00	73837.00	4.50	55
13030	2	2016	2	0	307680.00	81023.00	3.80	55
13031	2	2016	2	1	470821.00	105779.00	4.45	55
13032	2	2016	2	2	778501.00	186802.00	4.17	55
13034	2	2017	1	1	355735.00	75480.00	4.71	55
13035	2	2017	1	2	356226.00	75610.00	4.71	55
13036	2	2017	2	0	307943.00	81453.00	3.78	55
13037	2	2017	2	1	460896.00	101304.00	4.55	55
13038	2	2017	2	2	768839.00	182757.00	4.21	55
13039	2	2018	1	0	0.00	0.00	\N	55
13040	2	2018	1	1	348472.00	73089.00	4.77	55
13041	2	2018	1	2	348472.00	73089.00	4.77	55
13042	2	2018	2	0	291546.00	80064.00	3.64	55
13043	2	2018	2	1	437021.00	99852.00	4.38	55
13044	2	2018	2	2	728567.00	179916.00	4.05	55
13045	2	2019	1	0	433.00	123.00	3.52	55
13046	2	2019	1	1	344741.00	72884.00	4.73	55
13047	2	2019	1	2	345174.00	73007.00	4.73	55
13048	2	2019	2	0	301706.00	79738.00	3.78	55
13049	2	2019	2	1	457512.00	99874.00	4.58	55
13050	2	2019	2	2	759218.00	179612.00	4.23	55
13051	2	2020	1	0	0.00	0.00	\N	55
13052	2	2020	1	1	342034.00	72218.00	4.74	55
13053	2	2020	1	2	342034.00	72218.00	4.74	55
13054	2	2020	2	0	320517.00	79763.00	4.02	55
13055	2	2020	2	1	472828.00	99556.00	4.75	55
13056	2	2020	2	2	793345.00	179319.00	4.42	55
13057	2	1987	1	0	27900.00	15030.00	1.86	56
13058	2	1987	1	1	38510.00	11970.00	3.22	56
13059	2	1987	1	2	66410.00	27000.00	2.46	56
13060	2	1987	2	0	29694.00	15370.00	1.93	56
13061	2	1987	2	1	47602.00	14820.00	3.21	56
13062	2	1987	2	2	77296.00	30190.00	2.56	56
13063	2	1988	1	0	57071.00	25120.00	2.27	56
13064	2	1988	1	1	41701.00	12670.00	3.29	56
13065	2	1988	1	2	98772.00	37790.00	2.61	56
13066	2	1988	2	0	39253.00	20770.00	1.89	56
13067	2	1988	2	1	44020.00	16540.00	2.66	56
13068	2	1988	2	2	83273.00	37310.00	2.23	56
13069	2	1989	1	0	65815.00	29350.00	2.24	56
13070	2	1989	1	1	45757.00	16700.00	2.74	56
13071	2	1989	1	2	111572.00	46050.00	2.42	56
13072	2	1989	2	0	37630.00	21140.00	1.78	56
13073	2	1989	2	1	46431.00	17150.00	2.71	56
13074	2	1989	2	2	84061.00	38290.00	2.20	56
13075	2	1990	1	0	30478.00	16310.00	1.87	56
13076	2	1990	1	1	28078.00	16780.00	1.67	56
13077	2	1990	1	2	58556.00	33090.00	1.77	56
13078	2	1990	2	0	37321.00	21080.00	1.77	56
13079	2	1990	2	1	48298.00	18030.00	2.68	56
13080	2	1990	2	2	85619.00	39110.00	2.19	56
13081	2	1991	1	0	34277.00	17300.00	1.98	56
13082	2	1991	1	1	39308.00	19120.00	2.06	56
13083	2	1991	1	2	73585.00	36420.00	2.02	56
13084	2	1991	2	0	25044.00	13210.00	1.90	56
13085	2	1991	2	1	51036.00	16540.00	3.09	56
13086	2	1991	2	2	76080.00	29750.00	2.56	56
13087	2	1992	1	0	33634.00	15510.00	2.17	56
13088	2	1992	1	1	24001.00	17130.00	1.40	56
13089	2	1992	1	2	57635.00	32640.00	1.77	56
13090	2	1992	2	0	32221.00	19580.00	1.65	56
13091	2	1992	2	1	58722.00	19400.00	3.03	56
13092	2	1992	2	2	90943.00	38980.00	2.33	56
13093	2	1993	1	0	32295.00	14320.00	2.26	56
13094	2	1993	1	1	53470.00	16970.00	3.15	56
13095	2	1993	1	2	85765.00	31290.00	2.74	56
13096	2	1993	2	0	31234.00	17920.00	1.74	56
13097	2	1993	2	1	59754.00	21230.00	2.81	56
13098	2	1993	2	2	90988.00	39150.00	2.32	56
13099	2	1994	1	0	20484.00	12320.00	1.66	56
13100	2	1994	1	1	49825.00	16440.00	3.03	56
13101	2	1994	1	2	70309.00	28760.00	2.44	56
13102	2	1994	2	0	28930.00	18100.00	1.60	56
13103	2	1994	2	1	59770.00	18610.00	3.21	56
13104	2	1994	2	2	88700.00	36710.00	2.42	56
13105	2	1995	1	0	22545.00	12800.00	1.76	56
13106	2	1995	1	1	36500.00	13000.00	2.81	56
13107	2	1995	1	2	59045.00	25800.00	2.29	56
13108	2	1995	2	0	26880.00	17870.00	1.50	56
13109	2	1995	2	1	39185.00	15180.00	2.58	56
13110	2	1995	2	2	66065.00	33050.00	2.00	56
13111	2	1996	1	0	25853.00	15104.00	1.71	56
13112	2	1996	1	1	32119.00	10694.00	3.00	56
13113	2	1996	1	2	57972.00	25798.00	2.25	56
13114	2	1996	2	0	39902.00	23129.00	1.73	56
13115	2	1996	2	1	43974.00	15267.00	2.88	56
13116	2	1996	2	2	83876.00	38396.00	2.18	56
13117	2	1997	1	0	28822.00	15788.00	1.83	56
13118	2	1997	1	1	30283.00	10335.00	2.93	56
13119	2	1997	1	2	59105.00	26123.00	2.26	56
13120	2	1997	2	0	25904.00	15125.00	1.71	56
13121	2	1997	2	1	32411.00	11421.00	2.84	56
13122	2	1997	2	2	58315.00	26546.00	2.20	56
13123	2	1998	1	0	14833.00	12195.00	1.22	56
13124	2	1998	1	1	20430.00	8794.00	2.32	56
13125	2	1998	1	2	35263.00	20989.00	1.68	56
13126	2	1998	2	0	16203.00	10802.00	1.50	56
13127	2	1998	2	1	18878.00	9505.00	1.99	56
13128	2	1998	2	2	35081.00	20307.00	1.73	56
13129	2	1999	1	0	20977.00	13045.00	1.61	56
13130	2	1999	1	1	47932.00	17192.00	2.79	56
13131	2	1999	1	2	68909.00	30237.00	2.28	56
13132	2	1999	2	0	26175.00	15819.00	1.65	56
13133	2	1999	2	1	39996.00	13016.00	3.07	56
13134	2	1999	2	2	66171.00	28835.00	2.29	56
13135	2	2000	1	0	18826.00	10938.00	1.72	56
13136	2	2000	1	1	49012.00	16188.00	3.03	56
13137	2	2000	1	2	67838.00	27126.00	2.50	56
13138	2	2000	2	0	9128.00	7164.00	1.27	56
13139	2	2000	2	1	40896.00	13192.00	3.10	56
13140	2	2000	2	2	50024.00	20356.00	2.46	56
13141	2	2001	1	0	24100.00	12054.00	2.00	56
13142	2	2001	1	1	50089.00	15499.00	3.23	56
13143	2	2001	1	2	74189.00	27553.00	2.69	56
13144	2	2001	2	0	21459.00	12109.00	1.77	56
13145	2	2001	2	1	41100.00	12820.00	3.21	56
13146	2	2001	2	2	62559.00	24929.00	2.51	56
13147	2	2002	1	0	24251.00	13219.00	1.83	56
13148	2	2002	1	1	48514.00	15651.00	3.10	56
13149	2	2002	1	2	72765.00	28870.00	2.52	56
13150	2	2002	2	0	23520.00	12000.00	1.96	56
13151	2	2002	2	1	42043.00	12636.00	3.33	56
13152	2	2002	2	2	65563.00	24636.00	2.66	56
13153	2	2003	1	0	21950.00	12962.00	1.69	56
13154	2	2003	1	1	44844.00	15157.00	2.96	56
13155	2	2003	1	2	66794.00	28119.00	2.38	56
13156	2	2003	2	0	23599.00	11758.00	2.01	56
13157	2	2003	2	1	41486.00	12175.00	3.41	56
13158	2	2003	2	2	65085.00	23933.00	2.72	56
13159	2	2004	1	0	21223.00	12779.00	1.66	56
13160	2	2004	1	1	43990.00	15023.00	2.93	56
13161	2	2004	1	2	65213.00	27802.00	2.35	56
13162	2	2004	2	0	27424.00	12145.00	2.26	56
13163	2	2004	2	1	49012.00	12401.00	3.95	56
13164	2	2004	2	2	76436.00	24546.00	3.11	56
13165	2	2005	1	0	24585.00	12292.00	2.00	56
13166	2	2005	1	1	38746.00	10884.00	3.56	56
13167	2	2005	1	2	63331.00	23176.00	2.73	56
13168	2	2005	2	0	25741.00	11752.00	2.19	56
13169	2	2005	2	1	46650.00	12107.00	3.85	56
13170	2	2005	2	2	72391.00	23859.00	3.03	56
13171	2	2006	1	0	20212.00	10032.00	2.01	56
13172	2	2006	1	1	54270.00	14328.00	3.79	56
13173	2	2006	1	2	74482.00	24360.00	3.06	56
13174	2	2006	2	0	19166.00	11351.00	1.69	56
13175	2	2006	2	1	34757.00	9823.00	3.54	56
13176	2	2006	2	2	53923.00	21174.00	2.55	56
13177	2	2007	1	0	21495.00	10225.00	2.10	56
13178	2	2007	1	1	57227.00	14549.00	3.93	56
13179	2	2007	1	2	78722.00	24774.00	3.18	56
13180	2	2007	2	0	32985.00	11186.00	2.95	56
13181	2	2007	2	1	37705.00	9785.00	3.85	56
13182	2	2007	2	2	70690.00	20971.00	3.37	56
13183	2	2008	1	0	29270.00	11839.00	2.47	56
13184	2	2008	1	1	56489.00	14717.00	3.84	56
13185	2	2008	1	2	85759.00	26556.00	3.23	56
13186	2	2008	2	0	32091.00	11920.00	2.69	56
13187	2	2008	2	1	39086.00	9995.00	3.91	56
13188	2	2008	2	2	71177.00	21915.00	3.25	56
13189	2	2009	1	0	32312.00	12230.00	2.64	56
13190	2	2009	1	1	59173.00	15263.00	3.88	56
13191	2	2009	1	2	91485.00	27493.00	3.33	56
13192	2	2009	2	0	27145.00	11936.00	2.27	56
13193	2	2009	2	1	34923.00	10030.00	3.48	56
13194	2	2009	2	2	62068.00	21966.00	2.83	56
13195	2	2010	1	0	19776.00	8296.00	2.38	56
13196	2	2010	1	1	42935.00	13135.00	3.27	56
13197	2	2010	1	2	62711.00	21431.00	2.93	56
13198	2	2010	2	0	29193.00	9598.00	3.04	56
13199	2	2010	2	1	47188.00	12231.00	3.86	56
13200	2	2010	2	2	76381.00	21829.00	3.50	56
13201	2	2011	1	0	33668.00	11958.00	2.82	56
13202	2	2011	1	1	55283.00	14791.00	3.74	56
13203	2	2011	1	2	88951.00	26749.00	3.33	56
13204	2	2011	2	0	26562.00	11200.00	2.37	56
13205	2	2011	2	1	39012.00	10595.00	3.68	56
13206	2	2011	2	2	65574.00	21795.00	3.01	56
13207	2	2012	1	0	40679.00	14558.00	2.79	56
13208	2	2012	1	1	54620.00	14717.00	3.71	56
13209	2	2012	1	2	95299.00	29275.00	3.26	56
13210	2	2012	2	0	24383.00	10590.00	2.30	56
13211	2	2012	2	1	41269.00	11053.00	3.73	56
13212	2	2012	2	2	65652.00	21643.00	3.03	56
13213	2	2013	1	0	33098.00	13422.00	2.47	56
13214	2	2013	1	1	58308.00	14717.00	3.96	56
13215	2	2013	1	2	91406.00	28139.00	3.25	56
13216	2	2013	2	0	32081.00	11250.00	2.85	56
13217	2	2013	2	1	36286.00	11056.00	3.28	56
13218	2	2013	2	2	68367.00	22306.00	3.06	56
13219	2	2014	1	0	19734.00	11820.00	1.67	56
13220	2	2014	1	1	52344.00	15748.00	3.32	56
13221	2	2014	1	2	72078.00	27568.00	2.61	56
13222	2	2014	2	0	33043.00	10693.00	3.09	56
13223	2	2014	2	1	49659.00	12760.00	3.89	56
13224	2	2014	2	2	82702.00	23453.00	3.53	56
13225	2	2015	1	0	32131.00	13345.00	2.41	56
13226	2	2015	1	1	55496.00	15819.00	3.51	56
13227	2	2015	1	2	87627.00	29164.00	3.00	56
13228	2	2015	2	0	23253.00	8548.00	2.72	56
13229	2	2015	2	1	36108.00	11189.00	3.23	56
13230	2	2015	2	2	59361.00	19737.00	3.01	56
13231	2	2016	1	0	35672.00	13553.00	2.63	56
13232	2	2016	1	1	57735.00	15180.00	3.80	56
13233	2	2016	1	2	93407.00	28733.00	3.25	56
13234	2	2016	2	0	27846.00	11087.00	2.51	56
13235	2	2016	2	1	46859.00	13100.00	3.58	56
13236	2	2016	2	2	74705.00	24187.00	3.09	56
13237	2	2017	1	0	33699.00	13192.00	2.55	56
13238	2	2017	1	1	56043.00	15470.00	3.62	56
13239	2	2017	1	2	89742.00	28662.00	3.13	56
13240	2	2017	2	0	33771.00	12085.00	2.79	56
13241	2	2017	2	1	49715.00	13297.00	3.74	56
13242	2	2017	2	2	83486.00	25382.00	3.29	56
13243	2	2018	1	0	41695.00	13747.00	3.03	56
13244	2	2018	1	1	61072.00	15807.00	3.86	56
13245	2	2018	1	2	102767.00	29554.00	3.48	56
13246	2	2018	2	0	21416.25	7000.00	3.06	56
13247	2	2018	2	1	53187.00	13297.00	4.00	56
13248	2	2018	2	2	74603.25	20297.00	3.68	56
13249	2	2019	1	0	30301.93	13396.00	2.26	56
13250	2	2019	1	1	52672.42	15313.00	3.44	56
13251	2	2019	1	2	82974.35	28709.00	2.89	56
13252	2	2019	2	0	5918.00	2181.00	2.71	56
13253	2	2019	2	1	48552.00	13293.00	3.65	56
13254	2	2019	2	2	54470.00	15474.00	3.52	56
13255	2	2020	1	0	39815.00	13643.00	2.92	56
13256	2	2020	1	1	60064.00	15437.00	3.89	56
13257	2	2020	1	2	99879.00	29080.00	3.43	56
13258	2	2020	2	0	28423.00	9230.00	3.08	56
13259	2	2020	2	1	57876.60	15021.00	3.85	56
13260	2	2020	2	2	86299.60	24251.00	3.56	56
13261	2	1987	1	0	8340.00	4240.00	1.97	57
13262	2	1987	1	1	17185.00	5790.00	2.97	57
13263	2	1987	1	2	25525.00	10030.00	2.54	57
13264	2	1987	2	0	2241.00	1500.00	1.49	57
13265	2	1987	2	1	13927.00	4830.00	2.88	57
13266	2	1987	2	2	16168.00	6330.00	2.55	57
13267	2	1988	1	0	5944.00	2910.00	2.04	57
13268	2	1988	1	1	18970.00	7200.00	2.63	57
13269	2	1988	1	2	24914.00	10110.00	2.46	57
13270	2	1988	2	0	2669.00	1350.00	1.98	57
13271	2	1988	2	1	10611.00	4420.00	2.40	57
13272	2	1988	2	2	13280.00	5770.00	2.30	57
13273	2	1989	1	0	4764.00	2570.00	1.85	57
13274	2	1989	1	1	21525.00	7300.00	2.95	57
13275	2	1989	1	2	26289.00	9870.00	2.66	57
13276	2	1989	2	0	5365.00	2460.00	2.18	57
13277	2	1989	2	1	16796.00	4580.00	3.67	57
13278	2	1989	2	2	22161.00	7040.00	3.15	57
13279	2	1990	1	0	3791.00	2420.00	1.57	57
13280	2	1990	1	1	16654.00	5820.00	2.86	57
13281	2	1990	1	2	20445.00	8240.00	2.48	57
13282	2	1990	2	0	5888.00	2620.00	2.25	57
13283	2	1990	2	1	24569.00	6120.00	4.01	57
13284	2	1990	2	2	30457.00	8740.00	3.48	57
13285	2	1991	1	0	4676.00	2050.00	2.28	57
13286	2	1991	1	1	24195.00	7080.00	3.42	57
13287	2	1991	1	2	28871.00	9130.00	3.16	57
13288	2	1991	2	0	4704.00	2160.00	2.18	57
13289	2	1991	2	1	12743.00	3840.00	3.32	57
13290	2	1991	2	2	17447.00	6000.00	2.91	57
13291	2	1992	1	0	1913.00	1260.00	1.52	57
13292	2	1992	1	1	15615.00	5680.00	2.75	57
13293	2	1992	1	2	17528.00	6940.00	2.53	57
13294	2	1992	2	0	3098.00	1270.00	2.44	57
13295	2	1992	2	1	21129.00	5980.00	3.53	57
13296	2	1992	2	2	24227.00	7250.00	3.34	57
13297	2	1993	1	0	3267.00	1510.00	2.16	57
13298	2	1993	1	1	20075.00	7150.00	2.81	57
13299	2	1993	1	2	23342.00	8660.00	2.70	57
13300	2	1993	2	0	1260.00	840.00	1.50	57
13301	2	1993	2	1	16157.00	5550.00	2.91	57
13302	2	1993	2	2	17417.00	6390.00	2.73	57
13303	2	1994	1	0	4779.00	1950.00	2.45	57
13304	2	1994	1	1	23493.00	6990.00	3.36	57
13305	2	1994	1	2	28272.00	8940.00	3.16	57
13306	2	1994	2	0	4381.00	1760.00	2.49	57
13307	2	1994	2	1	15924.00	5270.00	3.02	57
13308	2	1994	2	2	20305.00	7030.00	2.89	57
13309	2	1995	1	0	3378.00	1425.00	2.37	57
13310	2	1995	1	1	20153.00	6505.00	3.10	57
13311	2	1995	1	2	23531.00	7930.00	2.97	57
13312	2	1995	2	0	2774.00	1047.00	2.65	57
13313	2	1995	2	1	19023.00	6077.00	3.13	57
13314	2	1995	2	2	21797.00	7124.00	3.06	57
13315	2	1996	1	0	3650.00	1590.00	2.30	57
13316	2	1996	1	1	24006.00	7369.00	3.26	57
13317	2	1996	1	2	27656.00	8959.00	3.09	57
13318	2	1996	2	0	2046.00	998.00	2.05	57
13319	2	1996	2	1	18989.00	5482.00	3.46	57
13320	2	1996	2	2	21035.00	6480.00	3.25	57
13321	2	1997	1	0	2673.00	1411.00	1.89	57
13322	2	1997	1	1	20731.00	6337.00	3.27	57
13323	2	1997	1	2	23404.00	7748.00	3.02	57
13324	2	1997	2	0	2867.00	1365.00	2.10	57
13325	2	1997	2	1	20019.00	5773.00	3.47	57
13326	2	1997	2	2	22886.00	7138.00	3.21	57
13327	2	1998	1	0	1340.00	705.00	1.90	57
13328	2	1998	1	1	13618.00	4635.00	2.94	57
13329	2	1998	1	2	14958.00	5340.00	2.80	57
13330	2	1998	2	0	279.00	136.00	2.05	57
13331	2	1998	2	1	20179.00	6425.00	3.14	57
13332	2	1998	2	2	20458.00	6561.00	3.12	57
13333	2	1999	1	0	5324.00	2111.00	2.52	57
13334	2	1999	1	1	28264.00	7380.00	3.83	57
13335	2	1999	1	2	33588.00	9491.00	3.54	57
13336	2	1999	2	0	2171.00	1034.00	2.10	57
13337	2	1999	2	1	23915.00	7123.00	3.36	57
13338	2	1999	2	2	26086.00	8157.00	3.20	57
13339	2	2000	1	0	4440.00	1841.00	2.41	57
13340	2	2000	1	1	24998.00	7401.00	3.38	57
13341	2	2000	1	2	29438.00	9242.00	3.19	57
13342	2	2000	2	0	983.00	660.00	1.49	57
13343	2	2000	2	1	24093.00	7319.00	3.29	57
13344	2	2000	2	2	25076.00	7979.00	3.14	57
13345	2	2001	1	0	4040.00	1620.00	2.49	57
13346	2	2001	1	1	26731.00	7440.00	3.59	57
13347	2	2001	1	2	30771.00	9060.00	3.40	57
13348	2	2001	2	0	1112.00	658.00	1.69	57
13349	2	2001	2	1	24348.00	7494.00	3.25	57
13350	2	2001	2	2	25460.00	8152.00	3.12	57
13351	2	2002	1	0	2996.00	1500.00	2.00	57
13352	2	2002	1	1	26405.00	7445.00	3.55	57
13353	2	2002	1	2	29401.00	8945.00	3.29	57
13354	2	2002	2	0	1080.00	540.00	2.00	57
13355	2	2002	2	1	22972.00	6526.00	3.52	57
13356	2	2002	2	2	24052.00	7066.00	3.40	57
13357	2	2003	1	0	2352.00	1263.00	1.86	57
13358	2	2003	1	1	19608.00	6278.00	3.12	57
13359	2	2003	1	2	21960.00	7541.00	2.91	57
13360	2	2003	2	0	1142.00	402.00	2.84	57
13361	2	2003	2	1	23202.00	6058.00	3.83	57
13362	2	2003	2	2	24344.00	6460.00	3.77	57
13363	2	2004	1	0	4202.00	1493.00	2.81	57
13364	2	2004	1	1	30272.00	7568.00	4.00	57
13365	2	2004	1	2	34474.00	9061.00	3.80	57
13366	2	2004	2	0	1181.00	675.00	1.75	57
13367	2	2004	2	1	22080.00	6510.00	3.39	57
13368	2	2004	2	2	23261.00	7185.00	3.24	57
13369	2	2005	1	0	3442.00	1505.00	2.29	57
13370	2	2005	1	1	30150.00	7570.00	3.98	57
13371	2	2005	1	2	33592.00	9075.00	3.70	57
13372	2	2005	2	0	1410.00	675.00	2.09	57
13373	2	2005	2	1	25303.00	6710.00	3.77	57
13374	2	2005	2	2	26713.00	7385.00	3.62	57
13375	2	2006	1	0	3997.00	1605.00	2.49	57
13376	2	2006	1	1	29703.00	7544.00	3.94	57
13377	2	2006	1	2	33700.00	9149.00	3.68	57
13378	2	2006	2	0	1720.00	860.00	2.00	57
13379	2	2006	2	1	20255.00	6075.00	3.33	57
13380	2	2006	2	2	21975.00	6935.00	3.17	57
13381	2	2007	1	0	4193.00	1610.00	2.60	57
13382	2	2007	1	1	30170.00	7570.00	3.99	57
13383	2	2007	1	2	34363.00	9180.00	3.74	57
13384	2	2007	2	0	879.00	435.00	2.02	57
13385	2	2007	2	1	22403.00	6220.00	3.60	57
13386	2	2007	2	2	23282.00	6655.00	3.50	57
13387	2	2008	1	0	4256.00	1573.00	2.71	57
13388	2	2008	1	1	33597.00	8760.00	3.84	57
13389	2	2008	1	2	37853.00	10333.00	3.66	57
13390	2	2008	2	0	2835.00	925.00	3.06	57
13391	2	2008	2	1	35559.00	8683.00	4.10	57
13392	2	2008	2	2	38394.00	9608.00	4.00	57
13393	2	2009	1	0	3880.00	1273.00	3.05	57
13394	2	2009	1	1	39444.00	9260.00	4.26	57
13395	2	2009	1	2	43324.00	10533.00	4.11	57
13396	2	2009	2	0	2259.00	855.00	2.64	57
13397	2	2009	2	1	34045.00	8758.00	3.89	57
13398	2	2009	2	2	36304.00	9613.00	3.78	57
13399	2	2010	1	0	491.00	345.00	1.42	57
13400	2	2010	1	1	25534.00	7726.00	3.30	57
13401	2	2010	1	2	26025.00	8071.00	3.22	57
13402	2	2010	2	0	1394.00	565.00	2.47	57
13403	2	2010	2	1	35571.00	9011.00	3.95	57
13404	2	2010	2	2	36965.00	9576.00	3.86	57
13405	2	2011	1	0	2768.00	1016.00	2.72	57
13406	2	2011	1	1	39616.00	9500.00	4.17	57
13407	2	2011	1	2	42384.00	10516.00	4.03	57
13408	2	2011	2	0	2727.00	1521.00	1.79	57
13409	2	2011	2	1	28312.00	9485.00	2.98	57
13410	2	2011	2	2	31039.00	11006.00	2.82	57
13411	2	2012	1	0	2429.00	845.00	2.87	57
13412	2	2012	1	1	41605.00	9680.00	4.30	57
13413	2	2012	1	2	44034.00	10525.00	4.18	57
13414	2	2012	2	0	3267.00	1250.00	2.61	57
13415	2	2012	2	1	43920.00	9930.00	4.42	57
13416	2	2012	2	2	47187.00	11180.00	4.22	57
13417	2	2013	1	0	2005.00	657.00	3.05	57
13418	2	2013	1	1	43604.00	10074.00	4.33	57
13419	2	2013	1	2	45609.00	10731.00	4.25	57
13420	2	2013	2	0	3724.00	1560.00	2.39	57
13421	2	2013	2	1	40489.00	10224.00	3.96	57
13422	2	2013	2	2	44213.00	11784.00	3.75	57
13423	2	2014	1	0	2220.00	735.00	3.02	57
13424	2	2014	1	1	42184.00	10084.00	4.18	57
13425	2	2014	1	2	44404.00	10819.00	4.10	57
13426	2	2014	2	0	4458.00	1616.00	2.76	57
13427	2	2014	2	1	39887.00	9367.00	4.26	57
13428	2	2014	2	2	44345.00	10983.00	4.04	57
13429	2	2015	1	0	2958.00	1007.00	2.94	57
13430	2	2015	1	1	42028.00	10090.00	4.17	57
13431	2	2015	1	2	44986.00	11097.00	4.05	57
13432	2	2015	2	0	1752.00	1022.00	1.71	57
13433	2	2015	2	1	32992.00	9351.00	3.53	57
13434	2	2015	2	2	34744.00	10373.00	3.35	57
13435	2	2016	1	0	2766.00	934.00	2.96	57
13436	2	2016	1	1	43518.00	10087.00	4.31	57
13437	2	2016	1	2	46284.00	11021.00	4.20	57
13438	2	2016	2	0	1606.00	966.00	1.66	57
13439	2	2016	2	1	37899.00	9903.00	3.83	57
13440	2	2016	2	2	39505.00	10869.00	3.63	57
13441	2	2017	1	0	2981.00	981.00	3.04	57
13442	2	2017	1	1	43680.00	10166.00	4.30	57
13443	2	2017	1	2	46661.00	11147.00	4.19	57
13444	2	2017	2	0	3294.00	1399.00	2.35	57
13445	2	2017	2	1	41628.00	9994.00	4.17	57
13446	2	2017	2	2	44922.00	11393.00	3.94	57
13447	2	2018	1	0	2744.00	901.00	3.05	57
13448	2	2018	1	1	47180.00	10295.00	4.58	57
13449	2	2018	1	2	49924.00	11196.00	4.46	57
13450	2	2018	2	0	2500.00	1562.00	1.60	57
13451	2	2018	2	1	35682.00	10082.73	3.54	57
13452	2	2018	2	2	38182.00	11644.73	3.28	57
13453	2	2019	1	0	1534.89	703.00	2.18	57
13454	2	2019	1	1	43898.00	10847.00	4.05	57
13455	2	2019	1	2	45432.89	11550.00	3.93	57
13456	2	2019	2	0	3249.00	1381.00	2.35	57
13457	2	2019	2	1	51302.00	11218.00	4.57	57
13458	2	2019	2	2	54551.00	12599.00	4.33	57
13459	2	2020	1	0	2340.70	854.00	2.74	57
13460	2	2020	1	1	51767.00	11335.00	4.57	57
13461	2	2020	1	2	54107.70	12189.00	4.44	57
13462	2	2020	2	0	3324.66	1509.00	2.20	57
13463	2	2020	2	1	53086.00	11321.00	4.69	57
13464	2	2020	2	2	56410.66	12830.00	4.40	57
13465	2	1987	1	0	20.00	10.00	2.00	58
13466	2	1987	1	1	8600.00	2660.00	3.23	58
13467	2	1987	1	2	8620.00	2670.00	3.23	58
13468	2	1987	2	0	8518.00	2720.00	3.13	58
13469	2	1987	2	1	7311.00	2270.00	3.22	58
13470	2	1987	2	2	15829.00	4990.00	3.17	58
13471	2	1988	1	0	\N	\N	\N	58
13472	2	1988	1	1	10415.00	3120.00	3.34	58
13473	2	1988	1	2	10415.00	3120.00	3.34	58
13474	2	1988	2	0	5373.00	2070.00	2.60	58
13475	2	1988	2	1	7600.00	2360.00	3.22	58
13476	2	1988	2	2	12973.00	4430.00	2.93	58
13477	2	1989	1	0	\N	\N	\N	58
13478	2	1989	1	1	8861.00	2490.00	3.56	58
13479	2	1989	1	2	8861.00	2490.00	3.56	58
13480	2	1989	2	0	4043.00	1560.00	2.59	58
13481	2	1989	2	1	11110.00	3330.00	3.34	58
13482	2	1989	2	2	15153.00	4890.00	3.10	58
13483	2	1990	1	0	\N	\N	\N	58
13484	2	1990	1	1	10111.00	3190.00	3.17	58
13485	2	1990	1	2	10111.00	3190.00	3.17	58
13486	2	1990	2	0	1262.00	720.00	1.75	58
13487	2	1990	2	1	15275.00	4170.00	3.66	58
13488	2	1990	2	2	16537.00	4890.00	3.38	58
13489	2	1991	1	0	\N	\N	\N	58
13490	2	1991	1	1	13113.00	3690.00	3.55	58
13491	2	1991	1	2	13113.00	3690.00	3.55	58
13492	2	1991	2	0	898.00	500.00	1.80	58
13493	2	1991	2	1	10885.00	3080.00	3.53	58
13494	2	1991	2	2	11783.00	3580.00	3.29	58
13495	2	1992	1	0	\N	\N	\N	58
13496	2	1992	1	1	13746.00	4210.00	3.27	58
13497	2	1992	1	2	13746.00	4210.00	3.27	58
13498	2	1992	2	0	1130.00	610.00	1.85	58
13499	2	1992	2	1	13268.00	3680.00	3.61	58
13500	2	1992	2	2	14398.00	4290.00	3.36	58
13501	2	1993	1	0	\N	\N	\N	58
13502	2	1993	1	1	14052.00	4050.00	3.47	58
13503	2	1993	1	2	14052.00	4050.00	3.47	58
13504	2	1993	2	0	1126.00	630.00	1.79	58
13505	2	1993	2	1	12683.00	3870.00	3.28	58
13506	2	1993	2	2	13809.00	4500.00	3.07	58
13507	2	1994	1	0	1020.00	340.00	3.00	58
13508	2	1994	1	1	14684.00	4130.00	3.56	58
13509	2	1994	1	2	15704.00	4470.00	3.51	58
13510	2	1994	2	0	847.00	730.00	1.16	58
13511	2	1994	2	1	5620.00	3190.00	1.76	58
13512	2	1994	2	2	6467.00	3920.00	1.65	58
13513	2	1995	1	0	\N	\N	\N	58
13514	2	1995	1	1	12922.00	4090.00	3.16	58
13515	2	1995	1	2	12922.00	4090.00	3.16	58
13516	2	1995	2	0	1042.00	875.00	1.19	58
13517	2	1995	2	1	5189.00	3335.00	1.56	58
13518	2	1995	2	2	6231.00	4210.00	1.48	58
13519	2	1996	1	0	225.00	75.00	3.00	58
13520	2	1996	1	1	15183.00	4200.00	3.62	58
13521	2	1996	1	2	15408.00	4275.00	3.60	58
13522	2	1996	2	0	2065.00	900.00	2.29	58
13523	2	1996	2	1	10604.00	3385.00	3.13	58
13524	2	1996	2	2	12669.00	4285.00	2.96	58
13525	2	1997	1	0	330.00	110.00	3.00	58
13526	2	1997	1	1	17672.00	4675.00	3.78	58
13527	2	1997	1	2	18002.00	4785.00	3.76	58
13528	2	1997	2	0	2529.00	900.00	2.81	58
13529	2	1997	2	1	12901.00	3411.00	3.78	58
13530	2	1997	2	2	15430.00	4311.00	3.58	58
13531	2	1998	1	0	\N	\N	\N	58
13532	2	1998	1	1	12054.00	4337.00	2.78	58
13533	2	1998	1	2	12054.00	4337.00	2.78	58
13534	2	1998	2	0	2216.00	783.00	2.83	58
13535	2	1998	2	1	8544.00	2688.00	3.18	58
13536	2	1998	2	2	10760.00	3471.00	3.10	58
13537	2	1999	1	0	294.00	95.00	3.09	58
13538	2	1999	1	1	18391.00	5014.00	3.67	58
13539	2	1999	1	2	18685.00	5109.00	3.66	58
13540	2	1999	2	0	2704.00	955.00	2.83	58
13541	2	1999	2	1	10644.00	3041.00	3.50	58
13542	2	1999	2	2	13348.00	3996.00	3.34	58
13543	2	2000	1	0	285.00	95.00	3.00	58
13544	2	2000	1	1	18574.00	5021.00	3.70	58
13545	2	2000	1	2	18859.00	5116.00	3.69	58
13546	2	2000	2	0	1377.00	914.00	1.51	58
13547	2	2000	2	1	7045.00	3162.00	2.23	58
13548	2	2000	2	2	8422.00	4076.00	2.07	58
13549	2	2001	1	0	156.00	60.00	2.60	58
13550	2	2001	1	1	14456.00	4032.00	3.59	58
13551	2	2001	1	2	14612.00	4092.00	3.57	58
13552	2	2001	2	0	3105.00	1090.00	2.85	58
13553	2	2001	2	1	12727.00	3485.00	3.65	58
13554	2	2001	2	2	15832.00	4575.00	3.46	58
13555	2	2002	1	0	135.00	50.00	2.70	58
13556	2	2002	1	1	15617.00	4255.00	3.67	58
13557	2	2002	1	2	15752.00	4305.00	3.66	58
13558	2	2002	2	0	3276.00	915.00	3.58	58
13559	2	2002	2	1	11845.00	3199.00	3.70	58
13560	2	2002	2	2	15121.00	4114.00	3.68	58
13561	2	2003	1	0	204.00	68.00	3.00	58
13562	2	2003	1	1	17342.00	4611.00	3.76	58
13563	2	2003	1	2	17546.00	4679.00	3.75	58
13564	2	2003	2	0	3822.00	1024.00	3.73	58
13565	2	2003	2	1	15830.00	3700.00	4.28	58
13566	2	2003	2	2	19652.00	4724.00	4.16	58
13567	2	2004	1	0	249.00	70.00	3.56	58
13568	2	2004	1	1	18365.00	4526.00	4.06	58
13569	2	2004	1	2	18614.00	4596.00	4.05	58
13570	2	2004	2	0	4230.00	1128.00	3.75	58
13571	2	2004	2	1	16374.00	3665.00	4.47	58
13572	2	2004	2	2	20604.00	4793.00	4.30	58
13573	2	2005	1	0	270.00	90.00	3.00	58
13574	2	2005	1	1	16480.00	4600.00	3.58	58
13575	2	2005	1	2	16750.00	4690.00	3.57	58
13576	2	2005	2	0	4267.00	1126.00	3.79	58
13577	2	2005	2	1	16564.00	3710.00	4.46	58
13578	2	2005	2	2	20831.00	4836.00	4.31	58
13579	2	2006	1	0	528.00	145.00	3.64	58
13580	2	2006	1	1	21859.00	4675.00	4.68	58
13581	2	2006	1	2	22387.00	4820.00	4.64	58
13582	2	2006	2	0	2727.00	839.00	3.25	58
13583	2	2006	2	1	11064.00	2950.00	3.75	58
13584	2	2006	2	2	13791.00	3789.00	3.64	58
13585	2	2007	1	0	168.00	60.00	2.80	58
13586	2	2007	1	1	14089.00	3630.00	3.88	58
13587	2	2007	1	2	14257.00	3690.00	3.86	58
13588	2	2007	2	0	2973.00	852.00	3.49	58
13589	2	2007	2	1	11552.00	3057.00	3.78	58
13590	2	2007	2	2	14525.00	3909.00	3.72	58
13591	2	2008	1	0	157.00	60.00	2.62	58
13592	2	2008	1	1	15556.00	3655.00	4.26	58
13593	2	2008	1	2	15713.00	3715.00	4.23	58
13594	2	2008	2	0	2787.00	750.00	3.72	58
13595	2	2008	2	1	12976.00	3140.00	4.13	58
13596	2	2008	2	2	15763.00	3890.00	4.05	58
13597	2	2009	1	0	303.00	90.00	3.37	58
13598	2	2009	1	1	17704.00	4077.00	4.34	58
13599	2	2009	1	2	18007.00	4167.00	4.32	58
13600	2	2009	2	0	1477.00	444.00	3.33	58
13601	2	2009	2	1	4016.00	1162.00	3.46	58
13602	2	2009	2	2	5493.00	1606.00	3.42	58
13603	2	2010	1	0	\N	\N	\N	58
13604	2	2010	1	1	13481.00	3593.00	3.75	58
13605	2	2010	1	2	13481.00	3593.00	3.75	58
13606	2	2010	2	0	1280.00	400.00	3.20	58
13607	2	2010	2	1	13172.00	3349.00	3.93	58
13608	2	2010	2	2	14452.00	3749.00	3.85	58
13609	2	2011	1	0	169.00	50.00	3.38	58
13610	2	2011	1	1	15582.00	3900.00	4.00	58
13611	2	2011	1	2	15751.00	3950.00	3.99	58
13612	2	2011	2	0	1632.00	525.00	3.11	58
13613	2	2011	2	1	13126.00	3497.00	3.75	58
13614	2	2011	2	2	14758.00	4022.00	3.67	58
13615	2	2012	1	0	\N	\N	\N	58
13616	2	2012	1	1	16612.00	3833.00	4.33	58
13617	2	2012	1	2	16612.00	3833.00	4.33	58
13618	2	2012	2	0	1282.00	414.00	3.10	58
13619	2	2012	2	1	7773.00	2165.00	3.59	58
13620	2	2012	2	2	9055.00	2579.00	3.51	58
13621	2	2013	1	0	2375.00	711.00	3.34	58
13622	2	2013	1	1	14077.00	3510.00	4.01	58
13623	2	2013	1	2	16452.00	4221.00	3.90	58
13624	2	2013	2	0	3853.00	1331.00	2.89	58
13625	2	2013	2	1	8427.00	2623.00	3.21	58
13626	2	2013	2	2	12280.00	3954.00	3.11	58
13627	2	2014	1	0	460.00	136.00	3.38	58
13628	2	2014	1	1	12309.00	3839.00	3.21	58
13629	2	2014	1	2	12769.00	3975.00	3.21	58
13630	2	2014	2	0	4676.00	1509.00	3.10	58
13631	2	2014	2	1	9798.00	2589.00	3.78	58
13632	2	2014	2	2	14474.00	4098.00	3.53	58
13633	2	2015	1	0	364.00	100.00	3.64	58
13634	2	2015	1	1	13940.00	3289.00	4.24	58
13635	2	2015	1	2	14304.00	3389.00	4.22	58
13636	2	2015	2	0	4516.00	1537.00	2.94	58
13637	2	2015	2	1	11591.00	3171.00	3.66	58
13638	2	2015	2	2	16107.00	4708.00	3.42	58
13639	2	2016	1	0	1101.00	305.00	3.61	58
13640	2	2016	1	1	15715.00	3683.00	4.27	58
13641	2	2016	1	2	16816.00	3988.00	4.22	58
13642	2	2016	2	0	4312.00	1315.00	3.28	58
13643	2	2016	2	1	11633.00	2951.00	3.94	58
13644	2	2016	2	2	15945.00	4266.00	3.74	58
13645	2	2017	1	0	1126.00	320.00	3.52	58
13646	2	2017	1	1	12404.00	3036.00	4.09	58
13647	2	2017	1	2	13530.00	3356.00	4.03	58
13648	2	2017	2	0	4451.00	1535.00	2.90	58
13649	2	2017	2	1	13288.00	3609.00	3.68	58
13650	2	2017	2	2	17739.00	5144.00	3.45	58
13651	2	2018	1	0	516.00	220.00	2.35	58
13652	2	2018	1	1	10296.00	3186.00	3.23	58
13653	2	2018	1	2	10812.00	3406.00	3.17	58
13654	2	2018	2	0	2300.33	762.00	3.02	58
13655	2	2018	2	1	14066.58	3212.63	4.38	58
13656	2	2018	2	2	16366.91	3974.63	4.12	58
13657	2	2019	1	0	75.60	33.00	2.29	58
13658	2	2019	1	1	9474.63	3053.11	3.10	58
13659	2	2019	1	2	9550.23	3086.11	3.09	58
13660	2	2019	2	0	2128.05	882.05	2.41	58
13661	2	2019	2	1	7136.93	2025.09	3.52	58
13662	2	2019	2	2	9264.98	2907.14	3.19	58
13663	2	2020	1	0	439.66	143.25	3.07	58
13664	2	2020	1	1	7820.52	2031.50	3.85	58
13665	2	2020	1	2	8260.18	2174.75	3.80	58
13666	2	2020	2	0	904.41	713.65	1.27	58
13667	2	2020	2	1	4622.00	1506.76	3.07	58
13668	2	2020	2	2	5526.41	2220.41	2.49	58
13669	2	1987	1	0	4360.00	4600.00	0.95	59
13670	2	1987	1	1	1100.00	670.00	1.64	59
13671	2	1987	1	2	5460.00	5270.00	1.04	59
13672	2	1987	2	0	10253.00	7300.00	1.40	59
13673	2	1987	2	1	2041.00	940.00	2.17	59
13674	2	1987	2	2	12294.00	8240.00	1.49	59
13675	2	1988	1	0	4951.00	4860.00	1.02	59
13676	2	1988	1	1	1615.00	890.00	1.81	59
13677	2	1988	1	2	6566.00	5750.00	1.14	59
13678	2	1988	2	0	12810.00	7710.00	1.66	59
13679	2	1988	2	1	2856.00	1360.00	2.10	59
13680	2	1988	2	2	15666.00	9070.00	1.73	59
13681	2	1989	1	0	6114.00	4510.00	1.36	59
13682	2	1989	1	1	1691.00	1220.00	1.39	59
13683	2	1989	1	2	7805.00	5730.00	1.36	59
13684	2	1989	2	0	9023.00	6180.00	1.46	59
13685	2	1989	2	1	1160.00	650.00	1.78	59
13686	2	1989	2	2	10183.00	6830.00	1.49	59
13687	2	1990	1	0	2545.00	3240.00	0.79	59
13688	2	1990	1	1	3610.00	2380.00	1.52	59
13689	2	1990	1	2	6155.00	5620.00	1.10	59
13690	2	1990	2	0	12685.00	8050.00	1.58	59
13691	2	1990	2	1	7828.00	2860.00	2.74	59
13692	2	1990	2	2	20513.00	10910.00	1.88	59
13693	2	1991	1	0	3457.00	3520.00	0.98	59
13694	2	1991	1	1	3870.00	2060.00	1.88	59
13695	2	1991	1	2	7327.00	5580.00	1.31	59
13696	2	1991	2	0	12907.00	8170.00	1.58	59
13697	2	1991	2	1	6506.00	2190.00	2.97	59
13698	2	1991	2	2	19413.00	10360.00	1.87	59
13699	2	1992	1	0	3905.00	2850.00	1.37	59
13700	2	1992	1	1	4510.00	2040.00	2.21	59
13701	2	1992	1	2	8415.00	4890.00	1.72	59
13702	2	1992	2	0	11329.00	8410.00	1.35	59
13703	2	1992	2	1	6208.00	2300.00	2.70	59
13704	2	1992	2	2	17537.00	10710.00	1.64	59
13705	2	1993	1	0	2459.00	3070.00	0.80	59
13706	2	1993	1	1	3684.00	1940.00	1.90	59
13707	2	1993	1	2	6143.00	5010.00	1.23	59
13708	2	1993	2	0	11832.00	7850.00	1.51	59
13709	2	1993	2	1	7376.00	2970.00	2.48	59
13710	2	1993	2	2	19208.00	10820.00	1.78	59
13711	2	1994	1	0	4308.00	3580.00	1.20	59
13712	2	1994	1	1	4104.00	2160.00	1.90	59
13713	2	1994	1	2	8412.00	5740.00	1.47	59
13714	2	1994	2	0	7730.00	7840.00	0.99	59
13715	2	1994	2	1	7468.00	2910.00	2.57	59
13716	2	1994	2	2	15198.00	10750.00	1.41	59
13717	2	1995	1	0	1880.00	2350.00	0.80	59
13718	2	1995	1	1	3364.00	1990.00	1.69	59
13719	2	1995	1	2	5244.00	4340.00	1.21	59
13720	2	1995	2	0	10663.00	9290.00	1.15	59
13721	2	1995	2	1	9152.00	3205.00	2.86	59
13722	2	1995	2	2	19815.00	12495.00	1.59	59
13723	2	1996	1	0	4209.00	3450.00	1.22	59
13724	2	1996	1	1	4494.00	2435.00	1.85	59
13725	2	1996	1	2	8703.00	5885.00	1.48	59
13726	2	1996	2	0	10247.00	9166.00	1.12	59
13727	2	1996	2	1	9150.00	3263.00	2.80	59
13728	2	1996	2	2	19397.00	12429.00	1.56	59
13729	2	1997	1	0	3400.00	3400.00	1.00	59
13730	2	1997	1	1	4553.00	2470.00	1.84	59
13731	2	1997	1	2	7953.00	5870.00	1.35	59
13732	2	1997	2	0	11944.00	9211.00	1.30	59
13733	2	1997	2	1	10270.00	3578.00	2.87	59
13734	2	1997	2	2	22214.00	12789.00	1.74	59
13735	2	1998	1	0	1928.00	2496.00	0.77	59
13736	2	1998	1	1	4161.00	2394.00	1.74	59
13737	2	1998	1	2	6089.00	4890.00	1.25	59
13738	2	1998	2	0	3828.00	3244.00	1.18	59
13739	2	1998	2	1	8604.00	3190.00	2.70	59
13740	2	1998	2	2	12432.00	6434.00	1.93	59
13741	2	1999	1	0	5580.00	4890.00	1.14	59
13742	2	1999	1	1	6156.00	2487.00	2.48	59
13743	2	1999	1	2	11736.00	7377.00	1.59	59
13744	2	1999	2	0	11961.00	7722.00	1.55	59
13745	2	1999	2	1	9886.00	3471.00	2.85	59
13746	2	1999	2	2	21847.00	11193.00	1.95	59
13747	2	2000	1	0	3798.00	2910.00	1.31	59
13748	2	2000	1	1	6208.00	2421.00	2.56	59
13749	2	2000	1	2	10006.00	5331.00	1.88	59
13750	2	2000	2	0	11898.00	6864.00	1.73	59
13751	2	2000	2	1	10080.00	3462.00	2.91	59
13752	2	2000	2	2	21978.00	10326.00	2.13	59
13753	2	2001	1	0	4176.00	2868.00	1.46	59
13754	2	2001	1	1	6843.00	2613.00	2.62	59
13755	2	2001	1	2	11019.00	5481.00	2.01	59
13756	2	2001	2	0	10224.00	6360.00	1.61	59
13757	2	2001	2	1	9863.00	3462.00	2.85	59
13758	2	2001	2	2	20087.00	9822.00	2.05	59
13759	2	2002	1	0	3919.00	2760.00	1.42	59
13760	2	2002	1	1	6776.00	2592.00	2.61	59
13761	2	2002	1	2	10695.00	5352.00	2.00	59
13762	2	2002	2	0	9842.00	5307.00	1.85	59
13763	2	2002	2	1	11223.00	3672.00	3.06	59
13764	2	2002	2	2	21065.00	8979.00	2.35	59
13765	2	2003	1	0	4184.00	2430.00	1.72	59
13766	2	2003	1	1	7480.00	2508.00	2.98	59
13767	2	2003	1	2	11664.00	4938.00	2.36	59
13768	2	2003	2	0	12101.00	6235.00	1.94	59
13769	2	2003	2	1	13169.00	4278.00	3.08	59
13770	2	2003	2	2	25270.00	10513.00	2.40	59
13771	2	2004	1	0	3538.00	1855.00	1.91	59
13772	2	2004	1	1	6452.00	2080.00	3.10	59
13773	2	2004	1	2	9990.00	3935.00	2.54	59
13774	2	2004	2	0	11192.00	4980.00	2.25	59
13775	2	2004	2	1	12903.00	3905.00	3.30	59
13776	2	2004	2	2	24095.00	8885.00	2.71	59
13777	2	2005	1	0	3197.00	1680.00	1.90	59
13778	2	2005	1	1	6257.00	2008.00	3.12	59
13779	2	2005	1	2	9454.00	3688.00	2.56	59
13780	2	2005	2	0	10148.00	4100.00	2.48	59
13781	2	2005	2	1	11640.00	3404.00	3.42	59
13782	2	2005	2	2	21788.00	7504.00	2.90	59
13783	2	2006	1	0	4902.00	2280.00	2.15	59
13784	2	2006	1	1	7219.00	2207.00	3.27	59
13785	2	2006	1	2	12121.00	4487.00	2.70	59
13786	2	2006	2	0	9992.00	4012.00	2.49	59
13787	2	2006	2	1	11577.00	3373.00	3.43	59
13788	2	2006	2	2	21569.00	7385.00	2.92	59
13789	2	2007	1	0	2388.00	1305.00	1.83	59
13790	2	2007	1	1	6086.00	1874.00	3.25	59
13791	2	2007	1	2	8474.00	3179.00	2.67	59
13792	2	2007	2	0	7179.00	2735.00	2.62	59
13793	2	2007	2	1	11533.00	3098.00	3.72	59
13794	2	2007	2	2	18712.00	5833.00	3.21	59
13795	2	2008	1	0	4822.00	2009.00	2.40	59
13796	2	2008	1	1	7545.00	1988.00	3.80	59
13797	2	2008	1	2	12367.00	3997.00	3.09	59
13798	2	2008	2	0	7037.00	2768.00	2.54	59
13799	2	2008	2	1	9786.00	2750.00	3.56	59
13800	2	2008	2	2	16823.00	5518.00	3.05	59
13801	2	2009	1	0	5034.00	2144.00	2.35	59
13802	2	2009	1	1	9372.00	2487.00	3.77	59
13803	2	2009	1	2	14406.00	4631.00	3.11	59
13804	2	2009	2	0	7675.00	2772.00	2.77	59
13805	2	2009	2	1	10194.00	2755.00	3.70	59
13806	2	2009	2	2	17869.00	5527.00	3.23	59
13807	2	2010	1	0	5497.00	2157.00	2.55	59
13808	2	2010	1	1	8382.00	2452.00	3.42	59
13809	2	2010	1	2	13879.00	4609.00	3.01	59
13810	2	2010	2	0	7830.00	2794.00	2.80	59
13811	2	2010	2	1	10132.00	2720.00	3.73	59
13812	2	2010	2	2	17962.00	5514.00	3.26	59
13813	2	2011	1	0	6015.00	2307.00	2.61	59
13814	2	2011	1	1	10497.00	2931.00	3.58	59
13815	2	2011	1	2	16512.00	5238.00	3.15	59
13816	2	2011	2	0	7978.00	2807.00	2.84	59
13817	2	2011	2	1	10992.00	2872.00	3.83	59
13818	2	2011	2	2	18970.00	5679.00	3.34	59
13819	2	2012	1	0	6355.00	2369.00	2.68	59
13820	2	2012	1	1	10200.00	2813.00	3.63	59
13821	2	2012	1	2	16555.00	5182.00	3.19	59
13822	2	2012	2	0	8022.00	2804.00	2.86	59
13823	2	2012	2	1	11289.00	2895.00	3.90	59
13824	2	2012	2	2	19311.00	5699.00	3.39	59
13825	2	2013	1	0	5303.00	2355.00	2.25	59
13826	2	2013	1	1	8241.00	2584.00	3.19	59
13827	2	2013	1	2	13544.00	4939.00	2.74	59
13828	2	2013	2	0	7934.00	2802.00	2.83	59
13829	2	2013	2	1	11001.00	2799.00	3.93	59
13830	2	2013	2	2	18935.00	5601.00	3.38	59
13831	2	2014	1	0	5716.00	2323.00	2.46	59
13832	2	2014	1	1	8017.00	2504.00	3.20	59
13833	2	2014	1	2	13733.00	4827.00	2.85	59
13834	2	2014	2	0	8118.00	2809.00	2.89	59
13835	2	2014	2	1	10775.00	2720.00	3.96	59
13836	2	2014	2	2	18893.00	5529.00	3.42	59
13837	2	2015	1	0	5253.00	2209.00	2.38	59
13838	2	2015	1	1	7324.00	2328.00	3.15	59
13839	2	2015	1	2	12577.00	4537.00	2.77	59
13840	2	2015	2	0	7760.00	2850.00	2.72	59
13841	2	2015	2	1	10640.00	2715.00	3.92	59
13842	2	2015	2	2	18400.00	5565.00	3.31	59
13843	2	2016	1	0	5148.00	2112.00	2.44	59
13844	2	2016	1	1	6681.00	2236.00	2.99	59
13845	2	2016	1	2	11829.00	4348.00	2.72	59
13846	2	2016	2	0	8187.00	2828.00	2.89	59
13847	2	2016	2	1	11228.00	2813.00	3.99	59
13848	2	2016	2	2	19415.00	5641.00	3.44	59
13849	2	2017	1	0	7439.00	2444.00	3.04	59
13850	2	2017	1	1	8690.00	2489.00	3.49	59
13851	2	2017	1	2	16129.00	4933.00	3.27	59
13852	2	2017	2	0	8236.00	2890.00	2.85	59
13853	2	2017	2	1	11814.00	3020.00	3.91	59
13854	2	2017	2	2	20050.00	5910.00	3.39	59
13855	2	2018	1	0	7925.00	2481.00	3.19	59
13856	2	2018	1	1	9519.00	2593.00	3.67	59
13857	2	2018	1	2	17444.00	5074.00	3.44	59
13858	2	2018	2	0	8014.00	2868.00	2.79	59
13859	2	2018	2	1	11465.00	3052.00	3.76	59
13860	2	2018	2	2	19479.00	5920.00	3.29	59
13861	2	2019	1	0	7564.00	2420.00	3.13	59
13862	2	2019	1	1	8685.00	2417.47	3.59	59
13863	2	2019	1	2	16249.00	4837.47	3.36	59
13864	2	2019	2	0	7574.00	2640.00	2.87	59
13865	2	2019	2	1	10293.00	2659.00	3.87	59
13866	2	2019	2	2	17867.00	5299.00	3.37	59
13867	2	2020	1	0	7713.00	2419.00	3.19	59
13868	2	2020	1	1	9039.00	2482.00	3.64	59
13869	2	2020	1	2	16752.00	4901.00	3.42	59
13870	2	2020	2	0	9134.00	2824.00	3.23	59
13871	2	2020	2	1	10847.00	2718.00	3.99	59
13872	2	2020	2	2	19981.00	5542.00	3.61	59
13873	1	1987	1	0	267430.00	126440.00	2.12	6
13874	1	1987	1	1	212490.00	73360.00	2.90	6
13875	1	1987	1	2	479920.00	199800.00	2.40	6
13876	1	1987	2	0	461597.00	190000.00	2.43	6
13877	1	1987	2	1	236858.00	72740.00	3.26	6
13878	1	1987	2	2	698455.00	262740.00	2.66	6
13879	1	1988	1	0	204264.00	111290.00	1.84	6
13880	1	1988	1	1	211618.00	70210.00	3.01	6
13881	1	1988	1	2	415882.00	181500.00	2.29	6
13882	1	1988	2	0	408216.00	174400.00	2.34	6
13883	1	1988	2	1	297847.00	91150.00	3.27	6
13884	1	1988	2	2	706063.00	265550.00	2.66	6
13885	1	1989	1	0	253846.00	123800.00	2.05	6
13886	1	1989	1	1	218207.00	79410.00	2.75	6
13887	1	1989	1	2	472053.00	203210.00	2.32	6
13888	1	1989	2	0	293611.00	138010.00	2.13	6
13889	1	1989	2	1	315882.00	96150.00	3.29	6
13890	1	1989	2	2	609493.00	234160.00	2.60	6
13891	1	1990	1	0	134178.00	89320.00	1.50	6
13892	1	1990	1	1	156263.00	68910.00	2.27	6
13893	1	1990	1	2	290441.00	158230.00	1.84	6
13894	1	1990	2	0	302055.00	128900.00	2.34	6
13895	1	1990	2	1	294236.00	86260.00	3.41	6
13896	1	1990	2	2	596291.00	215160.00	2.77	6
13897	1	1991	1	0	227129.00	119120.00	1.91	6
13898	1	1991	1	1	244440.00	88390.00	2.77	6
13899	1	1991	1	2	471569.00	207510.00	2.27	6
13900	1	1991	2	0	385379.00	162570.00	2.37	6
13901	1	1991	2	1	326939.00	86080.00	3.80	6
13902	1	1991	2	2	712318.00	248650.00	2.86	6
13903	1	1992	1	0	187275.00	103040.00	1.82	6
13904	1	1992	1	1	226453.00	81170.00	2.79	6
13905	1	1992	1	2	413728.00	184210.00	2.25	6
13906	1	1992	2	0	396770.00	158670.00	2.50	6
13907	1	1992	2	1	428205.00	102450.00	4.18	6
13908	1	1992	2	2	824975.00	261120.00	3.16	6
13909	1	1993	1	0	257909.00	103580.00	2.49	6
13910	1	1993	1	1	321918.00	91190.00	3.53	6
13911	1	1993	1	2	579827.00	194770.00	2.98	6
13912	1	1993	2	0	388416.00	150260.00	2.58	6
13913	1	1993	2	1	516691.00	123880.00	4.17	6
13914	1	1993	2	2	905107.00	274140.00	3.30	6
13915	1	1994	1	0	258692.00	111100.00	2.33	6
13916	1	1994	1	1	351642.00	104810.00	3.36	6
13917	1	1994	1	2	610334.00	215910.00	2.83	6
13918	1	1994	2	0	362685.00	159490.00	2.27	6
13919	1	1994	2	1	469250.00	131900.00	3.56	6
13920	1	1994	2	2	831935.00	291390.00	2.86	6
13921	1	1995	1	0	164673.00	85390.00	1.93	6
13922	1	1995	1	1	288407.00	96680.00	2.98	6
13923	1	1995	1	2	453080.00	182070.00	2.49	6
13924	1	1995	2	0	378956.00	158170.00	2.40	6
13925	1	1995	2	1	459239.00	128050.00	3.59	6
13926	1	1995	2	2	838195.00	286220.00	2.93	6
13927	1	1996	1	0	227602.00	106830.00	2.13	6
13928	1	1996	1	1	407675.00	127620.00	3.19	6
13929	1	1996	1	2	635277.00	234450.00	2.71	6
13930	1	1996	2	0	366436.00	158946.00	2.31	6
13931	1	1996	2	1	472717.00	142700.00	3.31	6
13932	1	1996	2	2	839153.00	301646.00	2.78	6
13933	1	1997	1	0	186900.00	96602.00	1.93	6
13934	1	1997	1	1	340259.00	109648.00	3.10	6
13935	1	1997	1	2	527159.00	206250.00	2.56	6
13936	1	1997	2	0	333513.00	154333.00	2.16	6
13937	1	1997	2	1	466996.00	142813.00	3.27	6
13938	1	1997	2	2	800509.00	297146.00	2.69	6
13939	1	1998	1	0	103859.00	63684.00	1.63	6
13940	1	1998	1	1	235283.00	91499.00	2.57	6
13941	1	1998	1	2	339142.00	155183.00	2.19	6
13942	1	1998	2	0	310353.00	137595.00	2.26	6
13943	1	1998	2	1	394967.00	120924.00	3.27	6
13944	1	1998	2	2	705320.00	258519.00	2.73	6
13945	1	1999	1	0	256504.00	116013.00	2.21	6
13946	1	1999	1	1	425917.00	132865.00	3.21	6
13947	1	1999	1	2	682421.00	248878.00	2.74	6
13948	1	1999	2	0	352869.00	165648.00	2.13	6
13949	1	1999	2	1	496438.00	159090.00	3.12	6
13950	1	1999	2	2	849307.00	324738.00	2.62	6
13951	1	2000	1	0	204950.00	105802.00	1.94	6
13952	1	2000	1	1	373924.00	124230.00	3.01	6
13953	1	2000	1	2	578874.00	230032.00	2.52	6
13954	1	2000	2	0	426615.00	172756.00	2.47	6
13955	1	2000	2	1	602848.00	169889.00	3.55	6
13956	1	2000	2	2	1029463.00	342645.00	3.00	6
13957	1	2001	1	0	217674.00	103591.00	2.10	6
13958	1	2001	1	1	384329.00	119774.00	3.21	6
13959	1	2001	1	2	602003.00	223365.00	2.70	6
13960	1	2001	2	0	426098.00	173586.00	2.45	6
13961	1	2001	2	1	561430.00	162282.00	3.46	6
13962	1	2001	2	2	987528.00	335868.00	2.94	6
13963	1	2002	1	0	239990.00	109266.00	2.20	6
13964	1	2002	1	1	405155.00	128500.00	3.15	6
13965	1	2002	1	2	645145.00	237766.00	2.71	6
13966	1	2002	2	0	501667.00	181327.00	2.77	6
13967	1	2002	2	1	585790.00	165814.00	3.53	6
13968	1	2002	2	2	1087457.00	347141.00	3.13	6
13969	1	2003	1	0	205657.00	93711.00	2.19	6
13970	1	2003	1	1	349525.00	113571.00	3.08	6
13971	1	2003	1	2	555182.00	207282.00	2.68	6
13972	1	2003	2	0	523870.00	190158.00	2.75	6
13973	1	2003	2	1	688478.00	180731.00	3.81	6
13974	1	2003	2	2	1212348.00	370889.00	3.27	6
13975	1	2004	1	0	236106.00	101181.00	2.33	6
13976	1	2004	1	1	436609.00	129375.00	3.37	6
13977	1	2004	1	2	672715.00	230556.00	2.92	6
13978	1	2004	2	0	585382.00	196335.00	2.98	6
13979	1	2004	2	1	677772.00	175602.00	3.86	6
13980	1	2004	2	2	1263154.00	371937.00	3.40	6
13981	1	2005	1	0	222954.00	95364.00	2.34	6
13982	1	2005	1	1	420633.00	124157.00	3.39	6
13983	1	2005	1	2	643587.00	219521.00	2.93	6
13984	1	2005	2	0	521990.00	192415.00	2.71	6
13985	1	2005	2	1	635243.00	175184.00	3.63	6
13986	1	2005	2	2	1157233.00	367599.00	3.15	6
13987	1	2006	1	0	230116.00	91037.00	2.53	6
13988	1	2006	1	1	459108.00	133902.00	3.43	6
13989	1	2006	1	2	689224.00	224939.00	3.06	6
13990	1	2006	2	0	558404.00	196296.00	2.84	6
13991	1	2006	2	1	739596.00	189900.00	3.89	6
13992	1	2006	2	2	1298000.00	386196.00	3.36	6
13993	1	2007	1	0	213863.00	86972.00	2.46	6
13994	1	2007	1	1	396048.00	117875.00	3.36	6
13995	1	2007	1	2	609911.00	204847.00	2.98	6
13996	1	2007	2	0	620667.00	206214.00	3.01	6
13997	1	2007	2	1	761848.00	190534.00	4.00	6
13998	1	2007	2	2	1382515.00	396748.00	3.48	6
13999	1	2008	1	0	240960.00	91477.00	2.63	6
14000	1	2008	1	1	488846.00	134828.00	3.63	6
14001	1	2008	1	2	729806.00	226305.00	3.22	6
14002	1	2008	2	0	636428.00	217544.00	2.93	6
14003	1	2008	2	1	751364.00	202348.00	3.71	6
14004	1	2008	2	2	1387792.00	419892.00	3.31	6
14005	1	2009	1	0	278068.00	103161.00	2.70	6
14006	1	2009	1	1	456742.00	131320.00	3.48	6
14007	1	2009	1	2	734810.00	234481.00	3.13	6
14008	1	2009	2	0	679766.00	229596.00	2.96	6
14009	1	2009	2	1	790495.00	205229.00	3.85	6
14010	1	2009	2	2	1470261.00	434825.00	3.38	6
14011	1	2010	1	0	175876.00	70160.00	2.51	6
14012	1	2010	1	1	318279.00	97473.00	3.27	6
14013	1	2010	1	2	494155.00	167633.00	2.95	6
14014	1	2010	2	0	606589.00	197529.00	3.07	6
14015	1	2010	2	1	688949.00	176091.00	3.91	6
14016	1	2010	2	2	1295538.00	373620.00	3.47	6
14017	1	2011	1	0	326272.00	111032.00	2.94	6
14018	1	2011	1	1	481053.00	131718.00	3.65	6
14019	1	2011	1	2	807325.00	242750.00	3.33	6
14020	1	2011	2	0	730344.00	228385.00	3.20	6
14021	1	2011	2	1	707369.00	183050.00	3.86	6
14022	1	2011	2	2	1437713.00	411435.00	3.49	6
14023	1	2012	1	0	297909.00	100848.00	2.95	6
14024	1	2012	1	1	419274.00	117346.00	3.57	6
14025	1	2012	1	2	717183.00	218194.00	3.29	6
14026	1	2012	2	0	837831.00	262374.00	3.19	6
14027	1	2012	2	1	737187.00	188242.00	3.92	6
14028	1	2012	2	2	1575018.00	450616.00	3.50	6
14029	1	2013	1	0	215573.00	80551.00	2.68	6
14030	1	2013	1	1	398443.00	113153.00	3.52	6
14031	1	2013	1	2	614016.00	193704.00	3.17	6
14032	1	2013	2	0	787224.00	247535.00	3.18	6
14033	1	2013	2	1	689550.00	175034.00	3.94	6
14034	1	2013	2	2	1476774.00	422569.00	3.49	6
14035	1	2014	1	0	274768.00	103704.00	2.65	6
14036	1	2014	1	1	397331.00	116883.00	3.40	6
14037	1	2014	1	2	672099.00	220587.00	3.05	6
14038	1	2014	2	0	692664.00	218849.00	3.17	6
14039	1	2014	2	1	687811.00	179291.00	3.84	6
14040	1	2014	2	2	1380475.00	398140.00	3.47	6
14041	1	2015	1	0	252183.00	100665.00	2.51	6
14042	1	2015	1	1	385030.00	117663.00	3.27	6
14043	1	2015	1	2	637213.00	218328.00	2.92	6
14044	1	2015	2	0	691259.00	216917.00	3.19	6
14045	1	2015	2	1	728352.00	187070.00	3.89	6
14046	1	2015	2	2	1419611.00	403987.00	3.51	6
14047	1	2016	1	0	199751.00	85045.00	2.35	6
14048	1	2016	1	1	316677.00	100945.00	3.14	6
14049	1	2016	1	2	516428.00	185990.00	2.78	6
14050	1	2016	2	0	702610.00	215448.00	3.26	6
14051	1	2016	2	1	677192.00	171317.00	3.95	6
14052	1	2016	2	2	1379802.00	386765.00	3.57	6
14053	1	2017	1	0	329752.72	112951.00	2.92	6
14054	1	2017	1	1	414207.00	119088.00	3.48	6
14055	1	2017	1	2	743959.72	232039.00	3.21	6
14056	1	2017	2	0	787030.00	243021.00	3.24	6
14057	1	2017	2	1	699847.00	179743.00	3.89	6
14058	1	2017	2	2	1486877.00	422764.00	3.52	6
14059	1	2018	1	0	334267.00	123103.00	2.72	6
14060	1	2018	1	1	402104.00	119378.00	3.37	6
14061	1	2018	1	2	736371.00	242481.00	3.04	6
14062	1	2018	2	0	795405.45	246022.00	3.23	6
14063	1	2018	2	1	700516.30	180358.00	3.88	6
14064	1	2018	2	2	1495921.75	426380.00	3.51	6
14065	1	2019	1	0	305923.53	112883.00	2.71	6
14066	1	2019	1	1	366229.00	111278.00	3.29	6
14067	1	2019	1	2	672152.53	224161.00	3.00	6
14068	1	2019	2	0	728219.22	226911.00	3.21	6
14069	1	2019	2	1	677418.28	175629.00	3.86	6
14070	1	2019	2	2	1405637.50	402540.00	3.49	6
14071	1	2020	1	0	379170.64	123214.94	3.08	6
14072	1	2020	1	1	374661.60	107273.00	3.49	6
14073	1	2020	1	2	753832.24	230487.94	3.27	6
14074	1	2020	2	0	812047.43	241013.00	3.37	6
14075	1	2020	2	1	729700.08	185435.00	3.94	6
14076	1	2020	2	2	1541747.51	426448.00	3.62	6
14077	2	1987	1	0	3890.00	2590.00	1.50	6
14078	2	1987	1	1	35715.00	11460.00	3.12	6
14079	2	1987	1	2	39605.00	14050.00	2.82	6
14080	2	1987	2	0	26262.00	12940.00	2.03	6
14081	2	1987	2	1	31328.00	8940.00	3.50	6
14082	2	1987	2	2	57590.00	21880.00	2.63	6
14083	2	1988	1	0	4450.00	2800.00	1.59	6
14084	2	1988	1	1	28851.00	11050.00	2.61	6
14085	2	1988	1	2	33301.00	13850.00	2.40	6
14086	2	1988	2	0	26349.00	14390.00	1.83	6
14087	2	1988	2	1	27277.00	9080.00	3.00	6
14088	2	1988	2	2	53626.00	23470.00	2.28	6
14089	2	1989	1	0	5055.00	4140.00	1.22	6
14090	2	1989	1	1	24849.00	11330.00	2.19	6
14091	2	1989	1	2	29904.00	15470.00	1.93	6
14092	2	1989	2	0	20536.00	11190.00	1.84	6
14093	2	1989	2	1	41760.00	12620.00	3.31	6
14094	2	1989	2	2	62296.00	23810.00	2.62	6
14095	2	1990	1	0	972.00	980.00	0.99	6
14096	2	1990	1	1	24124.00	12520.00	1.93	6
14097	2	1990	1	2	25096.00	13500.00	1.86	6
14098	2	1990	2	0	20901.00	9480.00	2.20	6
14099	2	1990	2	1	39167.00	11300.00	3.47	6
14100	2	1990	2	2	60068.00	20780.00	2.89	6
14101	2	1991	1	0	5424.00	3590.00	1.51	6
14102	2	1991	1	1	35117.00	14760.00	2.38	6
14103	2	1991	1	2	40541.00	18350.00	2.21	6
14104	2	1991	2	0	26399.00	12670.00	2.08	6
14105	2	1991	2	1	68572.00	16610.00	4.13	6
14106	2	1991	2	2	94971.00	29280.00	3.24	6
14107	2	1992	1	0	4404.00	2790.00	1.58	6
14108	2	1992	1	1	30866.00	13570.00	2.27	6
14109	2	1992	1	2	35270.00	16360.00	2.16	6
14110	2	1992	2	0	23408.00	13310.00	1.76	6
14111	2	1992	2	1	69640.00	17090.00	4.07	6
14112	2	1992	2	2	93048.00	30400.00	3.06	6
14113	2	1993	1	0	3920.00	2450.00	1.60	6
14114	2	1993	1	1	31831.00	12420.00	2.56	6
14115	2	1993	1	2	35751.00	14870.00	2.40	6
14116	2	1993	2	0	28714.00	13740.00	2.09	6
14117	2	1993	2	1	64060.00	16680.00	3.84	6
14118	2	1993	2	2	92774.00	30420.00	3.05	6
14119	2	1994	1	0	4635.00	3010.00	1.54	6
14120	2	1994	1	1	39123.00	15400.00	2.54	6
14121	2	1994	1	2	43758.00	18410.00	2.38	6
14122	2	1994	2	0	23024.00	14670.00	1.57	6
14123	2	1994	2	1	37756.00	16700.00	2.26	6
14124	2	1994	2	2	60780.00	31370.00	1.94	6
14125	2	1995	1	0	1484.00	1400.00	1.06	6
14126	2	1995	1	1	38558.00	15620.00	2.47	6
14127	2	1995	1	2	40042.00	17020.00	2.35	6
14128	2	1995	2	0	24228.00	14130.00	1.71	6
14129	2	1995	2	1	48334.00	17590.00	2.75	6
14130	2	1995	2	2	72562.00	31720.00	2.29	6
14131	2	1996	1	0	6887.00	3110.00	2.21	6
14132	2	1996	1	1	74975.00	21350.00	3.51	6
14133	2	1996	1	2	81862.00	24460.00	3.35	6
14134	2	1996	2	0	34348.00	18783.00	1.83	6
14135	2	1996	2	1	66242.00	21651.00	3.06	6
14136	2	1996	2	2	100590.00	40434.00	2.49	6
14137	2	1997	1	0	3472.00	2428.00	1.43	6
14138	2	1997	1	1	65876.00	20077.00	3.28	6
14139	2	1997	1	2	69348.00	22505.00	3.08	6
14140	2	1997	2	0	38058.00	18958.00	2.01	6
14141	2	1997	2	1	69955.00	20732.00	3.37	6
14142	2	1997	2	2	108013.00	39690.00	2.72	6
14143	2	1998	1	0	660.00	550.00	1.20	6
14144	2	1998	1	1	54283.00	19905.00	2.73	6
14145	2	1998	1	2	54943.00	20455.00	2.69	6
14146	2	1998	2	0	37431.00	18020.00	2.08	6
14147	2	1998	2	1	84819.00	21702.00	3.91	6
14148	2	1998	2	2	122250.00	39722.00	3.08	6
14149	2	1999	1	0	7449.00	4050.00	1.84	6
14150	2	1999	1	1	73868.00	22930.00	3.22	6
14151	2	1999	1	2	81317.00	26980.00	3.01	6
14152	2	1999	2	0	26804.00	16480.00	1.63	6
14153	2	1999	2	1	71103.00	22913.00	3.10	6
14154	2	1999	2	2	97907.00	39393.00	2.49	6
14155	2	2000	1	0	5642.00	3487.00	1.62	6
14156	2	2000	1	1	76480.00	24195.00	3.16	6
14157	2	2000	1	2	82122.00	27682.00	2.97	6
14158	2	2000	2	0	37140.00	17776.00	2.09	6
14159	2	2000	2	1	92106.00	25930.00	3.55	6
14160	2	2000	2	2	129246.00	43706.00	2.96	6
14161	2	2001	1	0	6468.00	3340.00	1.94	6
14162	2	2001	1	1	75830.00	23697.00	3.20	6
14163	2	2001	1	2	82298.00	27037.00	3.04	6
14164	2	2001	2	0	32018.00	17640.00	1.82	6
14165	2	2001	2	1	86198.00	26730.00	3.22	6
14166	2	2001	2	2	118216.00	44370.00	2.66	6
14167	2	2002	1	0	6392.00	3966.00	1.61	6
14168	2	2002	1	1	73673.00	22333.00	3.30	6
14169	2	2002	1	2	80065.00	26299.00	3.04	6
14170	2	2002	2	0	44768.00	18300.00	2.45	6
14171	2	2002	2	1	97136.00	26324.00	3.69	6
14172	2	2002	2	2	141904.00	44624.00	3.18	6
14173	2	2003	1	0	8985.00	5911.00	1.52	6
14174	2	2003	1	1	28300.00	9921.00	2.85	6
14175	2	2003	1	2	37285.00	15832.00	2.36	6
14176	2	2003	2	0	70419.00	25665.00	2.74	6
14177	2	2003	2	1	109350.00	26246.00	4.17	6
14178	2	2003	2	2	179769.00	51911.00	3.46	6
14179	2	2004	1	0	8159.00	3795.00	2.15	6
14180	2	2004	1	1	58201.00	18247.00	3.19	6
14181	2	2004	1	2	66360.00	22042.00	3.01	6
14182	2	2004	2	0	66726.00	25804.00	2.59	6
14183	2	2004	2	1	81002.00	21337.00	3.80	6
14184	2	2004	2	2	147728.00	47141.00	3.13	6
14185	2	2005	1	0	6880.00	3528.00	1.95	6
14186	2	2005	1	1	54276.00	16529.00	3.28	6
14187	2	2005	1	2	61156.00	20057.00	3.05	6
14188	2	2005	2	0	69561.00	26583.00	2.62	6
14189	2	2005	2	1	101619.00	26486.00	3.84	6
14190	2	2005	2	2	171180.00	53069.00	3.23	6
14191	2	2006	1	0	8270.00	3976.00	2.08	6
14192	2	2006	1	1	70308.00	20420.00	3.44	6
14193	2	2006	1	2	78578.00	24396.00	3.22	6
14194	2	2006	2	0	59583.00	24813.00	2.40	6
14195	2	2006	2	1	91993.00	25295.00	3.64	6
14196	2	2006	2	2	151576.00	50108.00	3.02	6
14197	2	2007	1	0	8611.00	3788.00	2.27	6
14198	2	2007	1	1	68181.00	19318.00	3.53	6
14199	2	2007	1	2	76792.00	23106.00	3.32	6
14200	2	2007	2	0	64957.00	22912.00	2.84	6
14201	2	2007	2	1	101428.00	26854.00	3.78	6
14202	2	2007	2	2	166385.00	49766.00	3.34	6
14203	2	2008	1	0	14649.00	6340.00	2.31	6
14204	2	2008	1	1	73484.00	20745.00	3.54	6
14205	2	2008	1	2	88133.00	27085.00	3.25	6
14206	2	2008	2	0	66281.00	24459.00	2.71	6
14207	2	2008	2	1	89940.00	24955.00	3.60	6
14208	2	2008	2	2	156221.00	49414.00	3.16	6
14209	2	2009	1	0	12584.00	5398.00	2.33	6
14210	2	2009	1	1	69803.00	20390.00	3.42	6
14211	2	2009	1	2	82387.00	25788.00	3.19	6
14212	2	2009	2	0	75042.00	28784.00	2.61	6
14213	2	2009	2	1	93484.00	26061.00	3.59	6
14214	2	2009	2	2	168526.00	54845.00	3.07	6
14215	2	2010	1	0	3531.00	1738.00	2.03	6
14216	2	2010	1	1	37090.00	11785.00	3.15	6
14217	2	2010	1	2	40621.00	13523.00	3.00	6
14218	2	2010	2	0	76628.00	26192.00	2.93	6
14219	2	2010	2	1	94217.00	22792.00	4.13	6
14220	2	2010	2	2	170845.00	48984.00	3.49	6
14221	2	2011	1	0	17853.00	7033.00	2.54	6
14222	2	2011	1	1	73949.00	19838.00	3.73	6
14223	2	2011	1	2	91802.00	26871.00	3.42	6
14224	2	2011	2	0	85199.00	29798.00	2.86	6
14225	2	2011	2	1	110035.00	27344.00	4.02	6
14226	2	2011	2	2	195234.00	57142.00	3.42	6
14227	2	2012	1	0	9638.00	4123.00	2.34	6
14228	2	2012	1	1	63847.00	18415.00	3.47	6
14229	2	2012	1	2	73485.00	22538.00	3.26	6
14230	2	2012	2	0	88575.00	30678.00	2.89	6
14231	2	2012	2	1	111408.00	27699.00	4.02	6
14232	2	2012	2	2	199983.00	58377.00	3.43	6
14233	2	2013	1	0	10786.00	4504.00	2.39	6
14234	2	2013	1	1	67936.00	18376.00	3.70	6
14235	2	2013	1	2	78722.00	22880.00	3.44	6
14236	2	2013	2	0	94315.00	32071.00	2.94	6
14237	2	2013	2	1	113585.00	28486.00	3.99	6
14238	2	2013	2	2	207900.00	60557.00	3.43	6
14239	2	2014	1	0	10051.00	4416.00	2.28	6
14240	2	2014	1	1	65040.00	18034.00	3.61	6
14241	2	2014	1	2	75091.00	22450.00	3.34	6
14242	2	2014	2	0	87598.00	29606.00	2.96	6
14243	2	2014	2	1	117395.00	28886.00	4.06	6
14244	2	2014	2	2	204993.00	58492.00	3.50	6
14245	2	2015	1	0	9601.00	4355.00	2.20	6
14246	2	2015	1	1	63693.00	17898.00	3.56	6
14247	2	2015	1	2	73294.00	22253.00	3.29	6
14248	2	2015	2	0	91741.00	30632.00	2.99	6
14249	2	2015	2	1	120168.00	29196.00	4.12	6
14250	2	2015	2	2	211909.00	59828.00	3.54	6
14251	2	2016	1	0	8032.00	3754.00	2.14	6
14252	2	2016	1	1	56626.00	16351.00	3.46	6
14253	2	2016	1	2	64658.00	20105.00	3.22	6
14254	2	2016	2	0	92471.00	28869.00	3.20	6
14255	2	2016	2	1	117800.00	28072.00	4.20	6
14256	2	2016	2	2	210271.00	56941.00	3.69	6
14257	2	2017	1	0	11767.00	4346.00	2.71	6
14258	2	2017	1	1	63034.00	17435.00	3.62	6
14259	2	2017	1	2	74801.00	21781.00	3.43	6
14260	2	2017	2	0	99116.00	30440.00	3.26	6
14261	2	2017	2	1	119181.00	28084.00	4.24	6
14262	2	2017	2	2	218297.00	58524.00	3.73	6
14263	2	2018	1	0	13202.00	4937.00	2.67	6
14264	2	2018	1	1	67486.00	18472.00	3.65	6
14265	2	2018	1	2	80688.00	23409.00	3.45	6
14266	2	2018	2	0	102643.00	30477.00	3.37	6
14267	2	2018	2	1	124127.00	29385.00	4.22	6
14268	2	2018	2	2	226770.00	59862.00	3.79	6
14269	2	2019	1	0	15132.00	4976.00	3.04	6
14270	2	2019	1	1	65293.00	18490.00	3.53	6
14271	2	2019	1	2	80425.00	23466.00	3.43	6
14272	2	2019	2	0	101921.07	29933.00	3.40	6
14273	2	2019	2	1	130361.50	30264.00	4.31	6
14274	2	2019	2	2	232282.57	60197.00	3.86	6
14275	2	2020	1	0	11450.00	3590.94	3.19	6
14276	2	2020	1	1	35440.00	9451.00	3.75	6
14277	2	2020	1	2	46890.00	13041.94	3.60	6
14278	2	2020	2	0	108439.00	32409.00	3.35	6
14279	2	2020	2	1	110202.00	25642.00	4.30	6
14280	2	2020	2	2	218641.00	58051.00	3.77	6
14281	2	1987	1	0	12195.00	15960.00	0.76	60
14282	2	1987	1	1	970.00	600.00	1.62	60
14283	2	1987	1	2	13165.00	16560.00	0.79	60
14284	2	1987	2	0	23017.00	19730.00	1.17	60
14285	2	1987	2	1	1360.00	660.00	2.06	60
14286	2	1987	2	2	24377.00	20390.00	1.20	60
14287	2	1988	1	0	20640.00	19050.00	1.08	60
14288	2	1988	1	1	2020.00	1270.00	1.59	60
14289	2	1988	1	2	22660.00	20320.00	1.12	60
14290	2	1988	2	0	30380.00	22260.00	1.36	60
14291	2	1988	2	1	4493.00	2080.00	2.16	60
14292	2	1988	2	2	34873.00	24340.00	1.43	60
14293	2	1989	1	0	20489.00	24660.00	0.83	60
14294	2	1989	1	1	1511.00	870.00	1.74	60
14295	2	1989	1	2	22000.00	25530.00	0.86	60
14296	2	1989	2	0	27703.00	20420.00	1.36	60
14297	2	1989	2	1	3022.00	1650.00	1.83	60
14298	2	1989	2	2	30725.00	22070.00	1.39	60
14299	2	1990	1	0	12510.00	22400.00	0.56	60
14300	2	1990	1	1	1878.00	1180.00	1.59	60
14301	2	1990	1	2	14388.00	23580.00	0.61	60
14302	2	1990	2	0	24301.00	18450.00	1.32	60
14303	2	1990	2	1	3025.00	1840.00	1.64	60
14304	2	1990	2	2	27326.00	20290.00	1.35	60
14305	2	1991	1	0	16420.00	24230.00	0.68	60
14306	2	1991	1	1	1043.00	920.00	1.13	60
14307	2	1991	1	2	17463.00	25150.00	0.69	60
14308	2	1991	2	0	23543.00	19360.00	1.22	60
14309	2	1991	2	1	2415.00	1700.00	1.42	60
14310	2	1991	2	2	25958.00	21060.00	1.23	60
14311	2	1992	1	0	11671.00	24660.00	0.47	60
14312	2	1992	1	1	1046.00	800.00	1.31	60
14313	2	1992	1	2	12717.00	25460.00	0.50	60
14314	2	1992	2	0	15148.00	14180.00	1.07	60
14315	2	1992	2	1	3108.00	2400.00	1.30	60
14316	2	1992	2	2	18256.00	16580.00	1.10	60
14317	2	1993	1	0	11975.00	18750.00	0.64	60
14318	2	1993	1	1	1537.00	1090.00	1.41	60
14319	2	1993	1	2	13512.00	19840.00	0.68	60
14320	2	1993	2	0	29347.00	17640.00	1.66	60
14321	2	1993	2	1	2918.00	1640.00	1.78	60
14322	2	1993	2	2	32265.00	19280.00	1.67	60
14323	2	1994	1	0	21703.00	18700.00	1.16	60
14324	2	1994	1	1	3077.00	1650.00	1.86	60
14325	2	1994	1	2	24780.00	20350.00	1.22	60
14326	2	1994	2	0	27550.00	19000.00	1.45	60
14327	2	1994	2	1	3809.00	2210.00	1.72	60
14328	2	1994	2	2	31359.00	21210.00	1.48	60
14329	2	1995	1	0	21898.00	18830.00	1.16	60
14330	2	1995	1	1	3169.00	1760.00	1.80	60
14331	2	1995	1	2	25067.00	20590.00	1.22	60
14332	2	1995	2	0	27564.00	19030.00	1.45	60
14333	2	1995	2	1	3948.00	2200.00	1.79	60
14334	2	1995	2	2	31512.00	21230.00	1.48	60
14335	2	1996	1	0	22534.00	19188.00	1.17	60
14336	2	1996	1	1	3386.00	1739.00	1.95	60
14337	2	1996	1	2	25920.00	20927.00	1.24	60
14338	2	1996	2	0	28159.00	19045.00	1.48	60
14339	2	1996	2	1	4193.00	2300.00	1.82	60
14340	2	1996	2	2	32352.00	21345.00	1.52	60
14341	2	1997	1	0	22757.00	19215.00	1.18	60
14342	2	1997	1	1	4310.00	1755.00	2.46	60
14343	2	1997	1	2	27067.00	20970.00	1.29	60
14344	2	1997	2	0	28738.00	19055.00	1.51	60
14345	2	1997	2	1	4258.00	2320.00	1.84	60
14346	2	1997	2	2	32996.00	21375.00	1.54	60
14347	2	1998	1	0	10502.00	16160.00	0.65	60
14348	2	1998	1	1	3446.00	1758.00	1.96	60
14349	2	1998	1	2	13948.00	17918.00	0.78	60
14350	2	1998	2	0	14390.00	9673.00	1.49	60
14351	2	1998	2	1	3078.00	1710.00	1.80	60
14352	2	1998	2	2	17468.00	11383.00	1.53	60
14353	2	1999	1	0	15747.00	16210.00	0.97	60
14354	2	1999	1	1	3845.00	1762.00	2.18	60
14355	2	1999	1	2	19592.00	17972.00	1.09	60
14356	2	1999	2	0	31700.00	19925.00	1.59	60
14357	2	1999	2	1	4597.00	2325.00	1.98	60
14358	2	1999	2	2	36297.00	22250.00	1.63	60
14359	2	2000	1	0	15244.00	15968.00	0.95	60
14360	2	2000	1	1	3592.00	1761.00	2.04	60
14361	2	2000	1	2	18836.00	17729.00	1.06	60
14362	2	2000	2	0	32097.00	19910.00	1.61	60
14363	2	2000	2	1	4779.00	2323.00	2.06	60
14364	2	2000	2	2	36876.00	22233.00	1.66	60
14365	2	2001	1	0	16176.00	15980.00	1.01	60
14366	2	2001	1	1	3696.00	1761.00	2.10	60
14367	2	2001	1	2	19872.00	17741.00	1.12	60
14368	2	2001	2	0	32604.00	19917.00	1.64	60
14369	2	2001	2	1	4929.00	2325.00	2.12	60
14370	2	2001	2	2	37533.00	22242.00	1.69	60
14371	2	2002	1	0	20424.00	15992.00	1.28	60
14372	2	2002	1	1	4421.00	1766.00	2.50	60
14373	2	2002	1	2	24845.00	17758.00	1.40	60
14374	2	2002	2	0	33031.00	19919.00	1.66	60
14375	2	2002	2	1	5037.00	2329.00	2.16	60
14376	2	2002	2	2	38068.00	22248.00	1.71	60
14377	2	2003	1	0	21116.00	15997.00	1.32	60
14378	2	2003	1	1	4504.00	1766.00	2.55	60
14379	2	2003	1	2	25620.00	17763.00	1.44	60
14380	2	2003	2	0	34257.00	19929.00	1.72	60
14381	2	2003	2	1	5220.00	2335.00	2.24	60
14382	2	2003	2	2	39477.00	22264.00	1.77	60
14383	2	2004	1	0	21630.00	15981.00	1.35	60
14384	2	2004	1	1	4626.00	1772.00	2.61	60
14385	2	2004	1	2	26256.00	17753.00	1.48	60
14386	2	2004	2	0	34794.00	19938.00	1.75	60
14387	2	2004	2	1	5297.00	2340.00	2.26	60
14388	2	2004	2	2	40091.00	22278.00	1.80	60
14389	2	2005	1	0	22658.00	15990.00	1.42	60
14390	2	2005	1	1	4864.00	1776.00	2.74	60
14391	2	2005	1	2	27522.00	17766.00	1.55	60
14392	2	2005	2	0	35445.00	19947.00	1.78	60
14393	2	2005	2	1	5245.00	2347.00	2.23	60
14394	2	2005	2	2	40690.00	22294.00	1.83	60
14395	2	2006	1	0	25092.00	15998.00	1.57	60
14396	2	2006	1	1	5236.00	1780.00	2.94	60
14397	2	2006	1	2	30328.00	17778.00	1.71	60
14398	2	2006	2	0	35797.00	19947.00	1.79	60
14399	2	2006	2	1	5548.00	2347.00	2.36	60
14400	2	2006	2	2	41345.00	22294.00	1.85	60
14401	2	2007	1	0	27895.00	16782.00	1.66	60
14402	2	2007	1	1	5515.00	1800.00	3.06	60
14403	2	2007	1	2	33410.00	18582.00	1.80	60
14404	2	2007	2	0	45142.00	22435.00	2.01	60
14405	2	2007	2	1	8216.00	2471.00	3.32	60
14406	2	2007	2	2	53358.00	24906.00	2.14	60
14407	2	2008	1	0	38232.00	18593.00	2.06	60
14408	2	2008	1	1	5210.00	1739.00	3.00	60
14409	2	2008	1	2	43442.00	20332.00	2.14	60
14410	2	2008	2	0	51380.00	23443.00	2.19	60
14411	2	2008	2	1	11074.00	2919.00	3.79	60
14412	2	2008	2	2	62454.00	26362.00	2.37	60
14413	2	2009	1	0	43931.00	19015.00	2.31	60
14414	2	2009	1	1	5717.00	1824.00	3.13	60
14415	2	2009	1	2	49648.00	20839.00	2.38	60
14416	2	2009	2	0	53281.00	23443.00	2.27	60
14417	2	2009	2	1	11239.00	2919.00	3.85	60
14418	2	2009	2	2	64520.00	26362.00	2.45	60
14419	2	2010	1	0	47154.00	19323.00	2.44	60
14420	2	2010	1	1	5590.00	1824.00	3.06	60
14421	2	2010	1	2	52744.00	21147.00	2.49	60
14422	2	2010	2	0	61089.00	25320.00	2.41	60
14423	2	2010	2	1	10251.00	2918.00	3.51	60
14424	2	2010	2	2	71340.00	28238.00	2.53	60
14425	2	2011	1	0	55930.00	22481.00	2.49	60
14426	2	2011	1	1	6683.00	2091.00	3.20	60
14427	2	2011	1	2	62613.00	24572.00	2.55	60
14428	2	2011	2	0	65156.00	26754.00	2.44	60
14429	2	2011	2	1	10549.00	3010.00	3.50	60
14430	2	2011	2	2	75705.00	29764.00	2.54	60
14431	2	2012	1	0	55945.00	22431.00	2.49	60
14432	2	2012	1	1	6731.00	2119.00	3.18	60
14433	2	2012	1	2	62676.00	24550.00	2.55	60
14434	2	2012	2	0	67212.00	27133.00	2.48	60
14435	2	2012	2	1	10641.00	3015.00	3.53	60
14436	2	2012	2	2	77853.00	30148.00	2.58	60
14437	2	2013	1	0	60231.00	22662.00	2.66	60
14438	2	2013	1	1	6699.00	2079.00	3.22	60
14439	2	2013	1	2	66930.00	24741.00	2.71	60
14440	2	2013	2	0	68242.00	27097.00	2.52	60
14441	2	2013	2	1	10758.00	3003.00	3.58	60
14442	2	2013	2	2	79000.00	30100.00	2.62	60
14443	2	2014	1	0	54765.00	22687.00	2.41	60
14444	2	2014	1	1	6290.00	1969.00	3.19	60
14445	2	2014	1	2	61055.00	24656.00	2.48	60
14446	2	2014	2	0	68165.00	27083.00	2.52	60
14447	2	2014	2	1	10745.00	3005.00	3.58	60
14448	2	2014	2	2	78910.00	30088.00	2.62	60
14449	2	2015	1	0	55148.00	22681.00	2.43	60
14450	2	2015	1	1	6343.00	1965.00	3.23	60
14451	2	2015	1	2	61491.00	24646.00	2.49	60
14452	2	2015	2	0	56647.00	22777.00	2.49	60
14453	2	2015	2	1	9390.00	2656.00	3.54	60
14454	2	2015	2	2	66037.00	25433.00	2.60	60
14455	2	2016	1	0	67611.00	26873.00	2.52	60
14456	2	2016	1	1	7088.00	1953.00	3.63	60
14457	2	2016	1	2	74699.00	28826.00	2.59	60
14458	2	2016	2	0	64481.00	22730.00	2.84	60
14459	2	2016	2	1	10127.00	2660.00	3.81	60
14460	2	2016	2	2	74608.00	25390.00	2.94	60
14461	2	2017	1	0	69577.00	28895.00	2.41	60
14462	2	2017	1	1	6871.00	1955.00	3.51	60
14463	2	2017	1	2	76448.00	30850.00	2.48	60
14464	2	2017	2	0	64822.00	22514.00	2.88	60
14465	2	2017	2	1	9922.00	2598.00	3.82	60
14466	2	2017	2	2	74744.00	25112.00	2.98	60
14467	2	2018	1	0	73204.00	28938.00	2.53	60
14468	2	2018	1	1	6236.00	1947.00	3.20	60
14469	2	2018	1	2	79440.00	30885.00	2.57	60
14470	2	2018	2	0	62383.00	22778.00	2.74	60
14471	2	2018	2	1	9744.00	2649.00	3.68	60
14472	2	2018	2	2	72127.00	25427.00	2.84	60
14473	2	2019	1	0	67922.00	27571.00	2.46	60
14474	2	2019	1	1	6596.00	1972.00	3.34	60
14475	2	2019	1	2	74518.00	29543.00	2.52	60
14476	2	2019	2	0	65991.00	23911.00	2.76	60
14477	2	2019	2	1	9993.70	2733.00	3.66	60
14478	2	2019	2	2	75984.70	26644.00	2.85	60
14479	2	2020	1	0	75764.10	29603.00	2.56	60
14480	2	2020	1	1	9772.00	2745.00	3.56	60
14481	2	2020	1	2	85536.10	32348.00	2.64	60
14482	2	2020	2	0	70219.00	24568.00	2.86	60
14483	2	2020	2	1	10388.00	2781.00	3.74	60
14484	2	2020	2	2	80607.00	27349.00	2.95	60
14485	2	1987	1	0	30.00	20.00	1.50	61
14486	2	1987	1	1	670.00	480.00	1.40	61
14487	2	1987	1	2	700.00	500.00	1.40	61
14488	2	1987	2	0	3.00	10.00	0.30	61
14489	2	1987	2	1	456.00	350.00	1.30	61
14490	2	1987	2	2	459.00	360.00	1.28	61
14491	2	1988	1	0	\N	\N	\N	61
14492	2	1988	1	1	207.00	190.00	1.09	61
14493	2	1988	1	2	207.00	190.00	1.09	61
14494	2	1988	2	0	\N	\N	\N	61
14495	2	1988	2	1	182.00	150.00	1.21	61
14496	2	1988	2	2	182.00	150.00	1.21	61
14497	2	1989	1	0	5.00	10.00	0.50	61
14498	2	1989	1	1	1674.00	1220.00	1.37	61
14499	2	1989	1	2	1679.00	1230.00	1.37	61
14500	2	1989	2	0	288.00	270.00	1.07	61
14501	2	1989	2	1	1828.00	1100.00	1.66	61
14502	2	1989	2	2	2116.00	1370.00	1.54	61
14503	2	1990	1	0	99.00	100.00	0.99	61
14504	2	1990	1	1	492.00	320.00	1.54	61
14505	2	1990	1	2	591.00	420.00	1.41	61
14506	2	1990	2	0	80.00	60.00	1.33	61
14507	2	1990	2	1	1206.00	670.00	1.80	61
14508	2	1990	2	2	1286.00	730.00	1.76	61
14509	2	1991	1	0	\N	\N	\N	61
14510	2	1991	1	1	528.00	370.00	1.43	61
14511	2	1991	1	2	528.00	370.00	1.43	61
14512	2	1991	2	0	20.00	20.00	1.00	61
14513	2	1991	2	1	685.00	440.00	1.56	61
14514	2	1991	2	2	705.00	460.00	1.53	61
14515	2	1992	1	0	\N	\N	\N	61
14516	2	1992	1	1	295.00	210.00	1.40	61
14517	2	1992	1	2	295.00	210.00	1.40	61
14518	2	1992	2	0	\N	\N	\N	61
14519	2	1992	2	1	632.00	420.00	1.50	61
14520	2	1992	2	2	632.00	420.00	1.50	61
14521	2	1993	1	0	\N	\N	\N	61
14522	2	1993	1	1	264.00	190.00	1.39	61
14523	2	1993	1	2	264.00	190.00	1.39	61
14524	2	1993	2	0	\N	\N	\N	61
14525	2	1993	2	1	619.00	410.00	1.51	61
14526	2	1993	2	2	619.00	410.00	1.51	61
14527	2	1994	1	0	\N	\N	\N	61
14528	2	1994	1	1	403.00	260.00	1.55	61
14529	2	1994	1	2	403.00	260.00	1.55	61
14530	2	1994	2	0	40.00	40.00	1.00	61
14531	2	1994	2	1	598.00	370.00	1.62	61
14532	2	1994	2	2	638.00	410.00	1.56	61
14533	2	1995	1	0	136.00	140.00	0.97	61
14534	2	1995	1	1	464.00	275.00	1.69	61
14535	2	1995	1	2	600.00	415.00	1.45	61
14536	2	1995	2	0	54.00	50.00	1.08	61
14537	2	1995	2	1	612.00	400.00	1.53	61
14538	2	1995	2	2	666.00	450.00	1.48	61
14539	2	1996	1	0	167.00	167.00	1.00	61
14540	2	1996	1	1	558.00	315.00	1.77	61
14541	2	1996	1	2	725.00	482.00	1.50	61
14542	2	1996	2	0	100.00	82.00	1.22	61
14543	2	1996	2	1	773.00	459.00	1.68	61
14544	2	1996	2	2	873.00	541.00	1.61	61
14545	2	1997	1	0	150.00	123.00	1.22	61
14546	2	1997	1	1	605.00	340.00	1.78	61
14547	2	1997	1	2	755.00	463.00	1.63	61
14548	2	1997	2	0	62.00	52.00	1.19	61
14549	2	1997	2	1	785.00	463.00	1.70	61
14550	2	1997	2	2	847.00	515.00	1.64	61
14551	2	1998	1	0	9.00	15.00	0.60	61
14552	2	1998	1	1	533.00	249.00	2.14	61
14553	2	1998	1	2	542.00	264.00	2.05	61
14554	2	1998	2	0	8.00	5.00	1.60	61
14555	2	1998	2	1	517.00	235.00	2.20	61
14556	2	1998	2	2	525.00	240.00	2.19	61
14557	2	1999	1	0	152.00	90.00	1.69	61
14558	2	1999	1	1	893.00	417.00	2.14	61
14559	2	1999	1	2	1045.00	507.00	2.06	61
14560	2	1999	2	0	228.00	150.00	1.52	61
14561	2	1999	2	1	791.00	340.00	2.33	61
14562	2	1999	2	2	1019.00	490.00	2.08	61
14563	2	2000	1	0	160.00	95.00	1.68	61
14564	2	2000	1	1	861.00	400.00	2.15	61
14565	2	2000	1	2	1021.00	495.00	2.06	61
14566	2	2000	2	0	265.00	155.00	1.71	61
14567	2	2000	2	1	1029.00	422.00	2.44	61
14568	2	2000	2	2	1294.00	577.00	2.24	61
14569	2	2001	1	0	197.00	115.00	1.71	61
14570	2	2001	1	1	1145.00	430.00	2.66	61
14571	2	2001	1	2	1342.00	545.00	2.46	61
14572	2	2001	2	0	\N	\N	\N	61
14573	2	2001	2	1	1108.00	407.00	2.72	61
14574	2	2001	2	2	1108.00	407.00	2.72	61
14575	2	2002	1	0	166.00	82.00	2.02	61
14576	2	2002	1	1	1341.00	450.00	2.98	61
14577	2	2002	1	2	1507.00	532.00	2.83	61
14578	2	2002	2	0	126.00	60.00	2.10	61
14579	2	2002	2	1	1216.00	399.00	3.05	61
14580	2	2002	2	2	1342.00	459.00	2.92	61
14581	2	2003	1	0	150.00	65.00	2.31	61
14582	2	2003	1	1	1109.00	399.00	2.78	61
14583	2	2003	1	2	1259.00	464.00	2.71	61
14584	2	2003	2	0	149.00	66.00	2.26	61
14585	2	2003	2	1	1243.00	399.00	3.12	61
14586	2	2003	2	2	1392.00	465.00	2.99	61
14587	2	2004	1	0	173.00	72.00	2.40	61
14588	2	2004	1	1	1261.00	399.00	3.16	61
14589	2	2004	1	2	1434.00	471.00	3.04	61
14590	2	2004	2	0	167.00	71.00	2.35	61
14591	2	2004	2	1	1267.00	391.00	3.24	61
14592	2	2004	2	2	1434.00	462.00	3.10	61
14593	2	2005	1	0	24.00	12.00	2.00	61
14594	2	2005	1	1	1168.00	377.00	3.10	61
14595	2	2005	1	2	1192.00	389.00	3.06	61
14596	2	2005	2	0	180.00	72.00	2.50	61
14597	2	2005	2	1	1227.00	399.00	3.08	61
14598	2	2005	2	2	1407.00	471.00	2.99	61
14599	2	2006	1	0	129.00	52.00	2.48	61
14600	2	2006	1	1	1283.00	382.00	3.36	61
14601	2	2006	1	2	1412.00	434.00	3.25	61
14602	2	2006	2	0	36.00	15.00	2.40	61
14603	2	2006	2	1	1111.00	343.00	3.24	61
14604	2	2006	2	2	1147.00	358.00	3.20	61
14605	2	2007	1	0	98.00	41.00	2.39	61
14606	2	2007	1	1	1240.00	360.00	3.44	61
14607	2	2007	1	2	1338.00	401.00	3.34	61
14608	2	2007	2	0	23.00	9.00	2.56	61
14609	2	2007	2	1	963.00	284.00	3.39	61
14610	2	2007	2	2	986.00	293.00	3.37	61
14611	2	2008	1	0	53.00	20.00	2.65	61
14612	2	2008	1	1	1219.00	349.00	3.49	61
14613	2	2008	1	2	1272.00	369.00	3.45	61
14614	2	2008	2	0	166.00	62.00	2.68	61
14615	2	2008	2	1	1341.00	374.00	3.59	61
14616	2	2008	2	2	1507.00	436.00	3.46	61
14617	2	2009	1	0	164.00	62.00	2.65	61
14618	2	2009	1	1	1235.00	379.00	3.26	61
14619	2	2009	1	2	1399.00	441.00	3.17	61
14620	2	2009	2	0	149.00	58.00	2.57	61
14621	2	2009	2	1	1391.00	374.00	3.72	61
14622	2	2009	2	2	1540.00	432.00	3.56	61
14623	2	2010	1	0	57.00	30.00	1.90	61
14624	2	2010	1	1	1311.00	372.00	3.52	61
14625	2	2010	1	2	1368.00	402.00	3.40	61
14626	2	2010	2	0	151.00	58.00	2.60	61
14627	2	2010	2	1	1388.00	372.00	3.73	61
14628	2	2010	2	2	1539.00	430.00	3.58	61
14629	2	2011	1	0	159.00	65.00	2.45	61
14630	2	2011	1	1	1404.00	372.00	3.77	61
14631	2	2011	1	2	1563.00	437.00	3.58	61
14632	2	2011	2	0	183.00	67.00	2.73	61
14633	2	2011	2	1	1389.00	373.00	3.72	61
14634	2	2011	2	2	1572.00	440.00	3.57	61
14635	2	2012	1	0	148.00	60.00	2.47	61
14636	2	2012	1	1	1418.00	372.00	3.81	61
14637	2	2012	1	2	1566.00	432.00	3.63	61
14638	2	2012	2	0	48.00	26.00	1.85	61
14639	2	2012	2	1	1072.00	294.00	3.65	61
14640	2	2012	2	2	1120.00	320.00	3.50	61
14641	2	2013	1	0	74.00	31.00	2.39	61
14642	2	2013	1	1	1143.00	298.00	3.84	61
14643	2	2013	1	2	1217.00	329.00	3.70	61
14644	2	2013	2	0	106.00	41.00	2.59	61
14645	2	2013	2	1	1136.00	312.00	3.64	61
14646	2	2013	2	2	1242.00	353.00	3.52	61
14647	2	2014	1	0	111.00	43.00	2.58	61
14648	2	2014	1	1	1216.00	315.00	3.86	61
14649	2	2014	1	2	1327.00	358.00	3.71	61
14650	2	2014	2	0	82.00	39.00	2.10	61
14651	2	2014	2	1	983.00	285.00	3.45	61
14652	2	2014	2	2	1065.00	324.00	3.29	61
14653	2	2015	1	0	89.00	36.00	2.47	61
14654	2	2015	1	1	1497.00	380.00	3.94	61
14655	2	2015	1	2	1586.00	416.00	3.81	61
14656	2	2015	2	0	65.00	28.00	2.32	61
14657	2	2015	2	1	1043.00	291.00	3.58	61
14658	2	2015	2	2	1108.00	319.00	3.47	61
14659	2	2016	1	0	\N	\N	\N	61
14660	2	2016	1	1	982.00	272.00	3.61	61
14661	2	2016	1	2	982.00	272.00	3.61	61
14662	2	2016	2	0	\N	\N	\N	61
14663	2	2016	2	1	707.00	220.00	3.21	61
14664	2	2016	2	2	707.00	220.00	3.21	61
14665	2	2017	1	0	149.00	54.00	2.76	61
14666	2	2017	1	1	1394.00	332.00	4.20	61
14667	2	2017	1	2	1543.00	386.00	4.00	61
14668	2	2017	2	0	137.00	60.00	2.28	61
14669	2	2017	2	1	982.00	278.00	3.53	61
14670	2	2017	2	2	1119.00	338.00	3.31	61
14671	2	2018	1	0	162.00	59.00	2.75	61
14672	2	2018	1	1	1524.00	393.00	3.88	61
14673	2	2018	1	2	1686.00	452.00	3.73	61
14674	2	2018	2	0	14.00	8.00	1.75	61
14675	2	2018	2	1	723.00	230.00	3.14	61
14676	2	2018	2	2	737.00	238.00	3.10	61
14677	2	2019	1	0	48.00	20.00	2.40	61
14678	2	2019	1	1	835.00	264.00	3.16	61
14679	2	2019	1	2	883.00	284.00	3.11	61
14680	2	2019	2	0	18.00	12.00	1.50	61
14681	2	2019	2	1	487.00	162.00	3.01	61
14682	2	2019	2	2	505.00	174.00	2.90	61
14683	2	2020	1	0	30.00	11.00	2.73	61
14684	2	2020	1	1	643.00	175.00	3.67	61
14685	2	2020	1	2	673.00	186.00	3.62	61
14686	2	2020	2	0	103.00	40.00	2.58	61
14687	2	2020	2	1	726.00	221.00	3.29	61
14688	2	2020	2	2	829.00	261.00	3.18	61
14689	2	1987	1	0	7620.00	4410.00	1.73	62
14690	2	1987	1	1	38955.00	12290.00	3.17	62
14691	2	1987	1	2	46575.00	16700.00	2.79	62
14692	2	1987	2	0	9787.00	6500.00	1.51	62
14693	2	1987	2	1	38410.00	13490.00	2.85	62
14694	2	1987	2	2	48197.00	19990.00	2.41	62
14695	2	1988	1	0	12471.00	8660.00	1.44	62
14696	2	1988	1	1	36247.00	12330.00	2.94	62
14697	2	1988	1	2	48718.00	20990.00	2.32	62
14698	2	1988	2	0	11980.00	8700.00	1.38	62
14699	2	1988	2	1	45405.00	13700.00	3.31	62
14700	2	1988	2	2	57385.00	22400.00	2.56	62
14701	2	1989	1	0	16810.00	12090.00	1.39	62
14702	2	1989	1	1	27960.00	10410.00	2.69	62
14703	2	1989	1	2	44770.00	22500.00	1.99	62
14704	2	1989	2	0	15597.00	10270.00	1.52	62
14705	2	1989	2	1	44103.00	14270.00	3.09	62
14706	2	1989	2	2	59700.00	24540.00	2.43	62
14707	2	1990	1	0	10967.00	7680.00	1.43	62
14708	2	1990	1	1	41844.00	14100.00	2.97	62
14709	2	1990	1	2	52811.00	21780.00	2.42	62
14710	2	1990	2	0	15502.00	9010.00	1.72	62
14711	2	1990	2	1	48905.00	14480.00	3.38	62
14712	2	1990	2	2	64407.00	23490.00	2.74	62
14713	2	1991	1	0	14147.00	9220.00	1.53	62
14714	2	1991	1	1	42673.00	15120.00	2.82	62
14715	2	1991	1	2	56820.00	24340.00	2.33	62
14716	2	1991	2	0	17225.00	9430.00	1.83	62
14717	2	1991	2	1	47118.00	14720.00	3.20	62
14718	2	1991	2	2	64343.00	24150.00	2.66	62
14719	2	1992	1	0	12762.00	9980.00	1.28	62
14720	2	1992	1	1	46097.00	15390.00	3.00	62
14721	2	1992	1	2	58859.00	25370.00	2.32	62
14722	2	1992	2	0	6715.00	5360.00	1.25	62
14723	2	1992	2	1	42820.00	14700.00	2.91	62
14724	2	1992	2	2	49535.00	20060.00	2.47	62
14725	2	1993	1	0	9665.00	6510.00	1.48	62
14726	2	1993	1	1	45198.00	15250.00	2.96	62
14727	2	1993	1	2	54863.00	21760.00	2.52	62
14728	2	1993	2	0	13932.00	7700.00	1.81	62
14729	2	1993	2	1	46531.00	14350.00	3.24	62
14730	2	1993	2	2	60463.00	22050.00	2.74	62
14731	2	1994	1	0	14066.00	7140.00	1.97	62
14732	2	1994	1	1	40427.00	13710.00	2.95	62
14733	2	1994	1	2	54493.00	20850.00	2.61	62
14734	2	1994	2	0	11729.00	7240.00	1.62	62
14735	2	1994	2	1	38194.00	13520.00	2.83	62
14736	2	1994	2	2	49923.00	20760.00	2.40	62
14737	2	1995	1	0	8294.00	4690.00	1.77	62
14738	2	1995	1	1	40288.00	13750.00	2.93	62
14739	2	1995	1	2	48582.00	18440.00	2.63	62
14740	2	1995	2	0	8287.00	5930.00	1.40	62
14741	2	1995	2	1	23629.00	11570.00	2.04	62
14742	2	1995	2	2	31916.00	17500.00	1.82	62
14743	2	1996	1	0	11112.00	6280.00	1.77	62
14744	2	1996	1	1	27970.00	11470.00	2.44	62
14745	2	1996	1	2	39082.00	17750.00	2.20	62
14746	2	1996	2	0	12465.00	7330.00	1.70	62
14747	2	1996	2	1	34260.00	12610.00	2.72	62
14748	2	1996	2	2	46725.00	19940.00	2.34	62
14749	2	1997	1	0	13437.00	7330.00	1.83	62
14750	2	1997	1	1	38727.00	12830.00	3.02	62
14751	2	1997	1	2	52164.00	20160.00	2.59	62
14752	2	1997	2	0	11399.00	6340.00	1.80	62
14753	2	1997	2	1	36044.00	12780.00	2.82	62
14754	2	1997	2	2	47443.00	19120.00	2.48	62
14755	2	1998	1	0	8103.00	5340.00	1.52	62
14756	2	1998	1	1	37004.00	12760.00	2.90	62
14757	2	1998	1	2	45107.00	18100.00	2.49	62
14758	2	1998	2	0	2676.00	2230.00	1.20	62
14759	2	1998	2	1	22175.00	7940.00	2.79	62
14760	2	1998	2	2	24851.00	10170.00	2.44	62
14761	2	1999	1	0	9582.00	5960.00	1.61	62
14762	2	1999	1	1	32018.00	12680.00	2.53	62
14763	2	1999	1	2	41600.00	18640.00	2.23	62
14764	2	1999	2	0	12262.00	7470.00	1.64	62
14765	2	1999	2	1	30035.00	10960.00	2.74	62
14766	2	1999	2	2	42297.00	18430.00	2.30	62
14767	2	2000	1	0	9741.00	6250.00	1.56	62
14768	2	2000	1	1	32782.00	12990.00	2.52	62
14769	2	2000	1	2	42523.00	19240.00	2.21	62
14770	2	2000	2	0	8332.00	5630.00	1.48	62
14771	2	2000	2	1	30322.00	11110.00	2.73	62
14772	2	2000	2	2	38654.00	16740.00	2.31	62
14773	2	2001	1	0	10589.00	6390.00	1.66	62
14774	2	2001	1	1	36940.00	12810.00	2.88	62
14775	2	2001	1	2	47529.00	19200.00	2.48	62
14776	2	2001	2	0	13062.00	7060.00	1.85	62
14777	2	2001	2	1	39129.00	12550.00	3.12	62
14778	2	2001	2	2	52191.00	19610.00	2.66	62
14779	2	2002	1	0	12888.00	6297.00	2.05	62
14780	2	2002	1	1	43190.00	12244.00	3.53	62
14781	2	2002	1	2	56078.00	18541.00	3.02	62
14782	2	2002	2	0	9042.00	4498.00	2.01	62
14783	2	2002	2	1	39472.00	11915.00	3.31	62
14784	2	2002	2	2	48514.00	16413.00	2.96	62
14785	2	2003	1	0	10005.00	5515.00	1.81	62
14786	2	2003	1	1	40585.00	12236.00	3.32	62
14787	2	2003	1	2	50590.00	17751.00	2.85	62
14788	2	2003	2	0	8081.00	4164.00	1.94	62
14789	2	2003	2	1	36069.00	11565.00	3.12	62
14790	2	2003	2	2	44150.00	15729.00	2.81	62
14791	2	2004	1	0	10248.00	5004.00	2.05	62
14792	2	2004	1	1	44711.00	12295.00	3.64	62
14793	2	2004	1	2	54959.00	17299.00	3.18	62
14794	2	2004	2	0	9245.00	4470.00	2.07	62
14795	2	2004	2	1	40911.00	11848.00	3.45	62
14796	2	2004	2	2	50156.00	16318.00	3.07	62
14797	2	2005	1	0	12330.00	5228.00	2.36	62
14798	2	2005	1	1	50137.00	12254.00	4.09	62
14799	2	2005	1	2	62467.00	17482.00	3.57	62
14800	2	2005	2	0	2574.00	1314.00	1.96	62
14801	2	2005	2	1	35362.00	10094.00	3.50	62
14802	2	2005	2	2	37936.00	11408.00	3.33	62
14803	2	2006	1	0	10596.00	4468.00	2.37	62
14804	2	2006	1	1	43968.00	11318.00	3.88	62
14805	2	2006	1	2	54564.00	15786.00	3.46	62
14806	2	2006	2	0	7958.00	3704.00	2.15	62
14807	2	2006	2	1	28499.00	8260.00	3.45	62
14808	2	2006	2	2	36457.00	11964.00	3.05	62
14809	2	2007	1	0	12722.00	5040.00	2.52	62
14810	2	2007	1	1	48042.00	11828.00	4.06	62
14811	2	2007	1	2	60764.00	16868.00	3.60	62
14812	2	2007	2	0	5933.00	2091.00	2.84	62
14813	2	2007	2	1	42678.00	10942.00	3.90	62
14814	2	2007	2	2	48611.00	13033.00	3.73	62
14815	2	2008	1	0	8152.00	3516.00	2.32	62
14816	2	2008	1	1	36894.00	10837.00	3.40	62
14817	2	2008	1	2	45046.00	14353.00	3.14	62
14818	2	2008	2	0	12147.00	3610.00	3.36	62
14819	2	2008	2	1	49791.00	12219.00	4.07	62
14820	2	2008	2	2	61938.00	15829.00	3.91	62
14821	2	2009	1	0	15067.00	4689.00	3.21	62
14822	2	2009	1	1	44783.00	12146.00	3.69	62
14823	2	2009	1	2	59850.00	16835.00	3.56	62
14824	2	2009	2	0	13941.00	4529.00	3.08	62
14825	2	2009	2	1	47867.00	12440.00	3.85	62
14826	2	2009	2	2	61808.00	16969.00	3.64	62
14827	2	2010	1	0	9506.00	3402.00	2.79	62
14828	2	2010	1	1	44121.00	12397.00	3.56	62
14829	2	2010	1	2	53627.00	15799.00	3.39	62
14830	2	2010	2	0	11423.00	3701.00	3.09	62
14831	2	2010	2	1	45249.00	12202.00	3.71	62
14832	2	2010	2	2	56672.00	15903.00	3.56	62
14833	2	2011	1	0	14402.00	5084.00	2.83	62
14834	2	2011	1	1	37464.00	11550.00	3.24	62
14835	2	2011	1	2	51866.00	16634.00	3.12	62
14836	2	2011	2	0	15882.00	5487.00	2.89	62
14837	2	2011	2	1	47234.00	12648.00	3.73	62
14838	2	2011	2	2	63116.00	18135.00	3.48	62
14839	2	2012	1	0	16309.00	5360.00	3.04	62
14840	2	2012	1	1	48344.00	12693.00	3.81	62
14841	2	2012	1	2	64653.00	18053.00	3.58	62
14842	2	2012	2	0	16223.00	5489.00	2.96	62
14843	2	2012	2	1	49555.00	12675.00	3.91	62
14844	2	2012	2	2	65778.00	18164.00	3.62	62
14845	2	2013	1	0	14341.60	4709.00	3.05	62
14846	2	2013	1	1	52070.00	12690.00	4.10	62
14847	2	2013	1	2	66411.60	17399.00	3.82	62
14848	2	2013	2	0	16256.00	5253.00	3.09	62
14849	2	2013	2	1	47562.00	12369.00	3.85	62
14850	2	2013	2	2	63818.00	17622.00	3.62	62
14851	2	2014	1	0	17126.00	5483.00	3.12	62
14852	2	2014	1	1	53298.00	12675.00	4.20	62
14853	2	2014	1	2	70424.00	18158.00	3.88	62
14854	2	2014	2	0	16106.00	5188.00	3.10	62
14855	2	2014	2	1	50711.00	12334.00	4.11	62
14856	2	2014	2	2	66817.00	17522.00	3.81	62
14857	2	2015	1	0	16968.00	5517.00	3.08	62
14858	2	2015	1	1	52185.00	12685.00	4.11	62
14859	2	2015	1	2	69153.00	18202.00	3.80	62
14860	2	2015	2	0	9356.00	3021.00	3.10	62
14861	2	2015	2	1	49936.00	12239.00	4.08	62
14862	2	2015	2	2	59292.00	15260.00	3.89	62
14863	2	2016	1	0	18009.00	5520.00	3.26	62
14864	2	2016	1	1	53963.00	12690.00	4.25	62
14865	2	2016	1	2	71972.00	18210.00	3.95	62
14866	2	2016	2	0	9409.00	2926.00	3.22	62
14867	2	2016	2	1	52042.00	12509.00	4.16	62
14868	2	2016	2	2	61451.00	15435.00	3.98	62
14869	2	2017	1	0	21457.00	5741.00	3.74	62
14870	2	2017	1	1	54957.00	12660.00	4.34	62
14871	2	2017	1	2	76414.00	18401.00	4.15	62
14872	2	2017	2	0	14232.00	3979.00	3.58	62
14873	2	2017	2	1	52502.00	12193.00	4.31	62
14874	2	2017	2	2	66734.00	16172.00	4.13	62
14875	2	2018	1	0	21605.00	5736.00	3.77	62
14876	2	2018	1	1	54986.00	12512.00	4.39	62
14877	2	2018	1	2	76591.00	18248.00	4.20	62
14878	2	2018	2	0	16500.00	4466.00	3.69	62
14879	2	2018	2	1	54779.00	12264.00	4.47	62
14880	2	2018	2	2	71279.00	16730.00	4.26	62
14881	2	2019	1	0	16123.00	4566.00	3.53	62
14882	2	2019	1	1	53243.00	12117.00	4.39	62
14883	2	2019	1	2	69366.00	16683.00	4.16	62
14884	2	2019	2	0	13253.00	3378.00	3.92	62
14885	2	2019	2	1	40837.00	9239.00	4.42	62
14886	2	2019	2	2	54090.00	12617.00	4.29	62
14887	2	2020	1	0	16467.00	4543.00	3.62	62
14888	2	2020	1	1	54393.00	12285.00	4.43	62
14889	2	2020	1	2	70860.00	16828.00	4.21	62
14890	2	2020	2	0	18080.00	4309.00	4.20	62
14891	2	2020	2	1	56097.00	12406.00	4.52	62
14892	2	2020	2	2	74177.00	16715.00	4.44	62
14893	2	1987	1	0	10305.00	5370.00	1.92	63
14894	2	1987	1	1	54545.00	17380.00	3.14	63
14895	2	1987	1	2	64850.00	22750.00	2.85	63
14896	2	1987	2	0	17370.00	6100.00	2.85	63
14897	2	1987	2	1	76742.00	19180.00	4.00	63
14898	2	1987	2	2	94112.00	25280.00	3.72	63
14899	2	1988	1	0	13434.00	5390.00	2.49	63
14900	2	1988	1	1	70994.00	21670.00	3.28	63
14901	2	1988	1	2	84428.00	27060.00	3.12	63
14902	2	1988	2	0	23797.00	7920.00	3.00	63
14903	2	1988	2	1	78340.00	21590.00	3.63	63
14904	2	1988	2	2	102137.00	29510.00	3.46	63
14905	2	1989	1	0	10579.00	4000.00	2.64	63
14906	2	1989	1	1	81792.00	24090.00	3.40	63
14907	2	1989	1	2	92371.00	28090.00	3.29	63
14908	2	1989	2	0	18005.00	6970.00	2.58	63
14909	2	1989	2	1	77089.00	17640.00	4.37	63
14910	2	1989	2	2	95094.00	24610.00	3.86	63
14911	2	1990	1	0	473.00	310.00	1.53	63
14912	2	1990	1	1	52256.00	16530.00	3.16	63
14913	2	1990	1	2	52729.00	16840.00	3.13	63
14914	2	1990	2	0	24748.00	9190.00	2.69	63
14915	2	1990	2	1	56590.00	14630.00	3.87	63
14916	2	1990	2	2	81338.00	23820.00	3.41	63
14917	2	1991	1	0	3677.00	1690.00	2.18	63
14918	2	1991	1	1	59770.00	20130.00	2.97	63
14919	2	1991	1	2	63447.00	21820.00	2.91	63
14920	2	1991	2	0	35466.00	13210.00	2.68	63
14921	2	1991	2	1	54066.00	12870.00	4.20	63
14922	2	1991	2	2	89532.00	26080.00	3.43	63
14923	2	1992	1	0	695.00	850.00	0.82	63
14924	2	1992	1	1	52628.00	19030.00	2.77	63
14925	2	1992	1	2	53323.00	19880.00	2.68	63
14926	2	1992	2	0	24786.00	10690.00	2.32	63
14927	2	1992	2	1	81352.00	21620.00	3.76	63
14928	2	1992	2	2	106138.00	32310.00	3.28	63
14929	2	1993	1	0	1521.00	1130.00	1.35	63
14930	2	1993	1	1	60657.00	21700.00	2.80	63
14931	2	1993	1	2	62178.00	22830.00	2.72	63
14932	2	1993	2	0	12631.00	9000.00	1.40	63
14933	2	1993	2	1	85913.00	27140.00	3.17	63
14934	2	1993	2	2	98544.00	36140.00	2.73	63
14935	2	1994	1	0	14135.00	5830.00	2.42	63
14936	2	1994	1	1	54662.00	15520.00	3.52	63
14937	2	1994	1	2	68797.00	21350.00	3.22	63
14938	2	1994	2	0	25006.00	9470.00	2.64	63
14939	2	1994	2	1	64119.00	19140.00	3.35	63
14940	2	1994	2	2	89125.00	28610.00	3.12	63
14941	2	1995	1	0	10523.00	5270.00	2.00	63
14942	2	1995	1	1	65077.00	20200.00	3.22	63
14943	2	1995	1	2	75600.00	25470.00	2.97	63
14944	2	1995	2	0	44345.00	12960.00	3.42	63
14945	2	1995	2	1	79500.00	22590.00	3.52	63
14946	2	1995	2	2	123845.00	35550.00	3.48	63
14947	2	1996	1	0	31369.00	12050.00	2.60	63
14948	2	1996	1	1	125579.00	40250.00	3.12	63
14949	2	1996	1	2	156948.00	52300.00	3.00	63
14950	2	1996	2	0	10755.00	4440.00	2.42	63
14951	2	1996	2	1	93296.00	36340.00	2.57	63
14952	2	1996	2	2	104051.00	40780.00	2.55	63
14953	2	1997	1	0	10273.00	4640.00	2.21	63
14954	2	1997	1	1	100087.00	37820.00	2.65	63
14955	2	1997	1	2	110360.00	42460.00	2.60	63
14956	2	1997	2	0	14674.00	5539.00	2.65	63
14957	2	1997	2	1	125217.00	42231.00	2.97	63
14958	2	1997	2	2	139891.00	47770.00	2.93	63
14959	2	1998	1	0	945.00	450.00	2.10	63
14960	2	1998	1	1	70487.00	28289.00	2.49	63
14961	2	1998	1	2	71432.00	28739.00	2.49	63
14962	2	1998	2	0	11251.00	3360.00	3.35	63
14963	2	1998	2	1	109528.00	34528.00	3.17	63
14964	2	1998	2	2	120779.00	37888.00	3.19	63
14965	2	1999	1	0	14319.00	5282.00	2.71	63
14966	2	1999	1	1	114032.00	45721.00	2.49	63
14967	2	1999	1	2	128351.00	51003.00	2.52	63
14968	2	1999	2	0	11460.00	3870.00	2.96	63
14969	2	1999	2	1	126910.00	43813.00	2.90	63
14970	2	1999	2	2	138370.00	47683.00	2.90	63
14971	2	2000	1	0	12443.00	3786.00	3.29	63
14972	2	2000	1	1	122830.00	36576.00	3.36	63
14973	2	2000	1	2	135273.00	40362.00	3.35	63
14974	2	2000	2	0	14651.00	4250.00	3.45	63
14975	2	2000	2	1	138182.00	43510.00	3.18	63
14976	2	2000	2	2	152833.00	47760.00	3.20	63
14977	2	2001	1	0	8985.00	3272.00	2.75	63
14978	2	2001	1	1	94902.00	31022.00	3.06	63
14979	2	2001	1	2	103887.00	34294.00	3.03	63
14980	2	2001	2	0	11019.00	3562.00	3.09	63
14981	2	2001	2	1	142747.00	40599.00	3.52	63
14982	2	2001	2	2	153766.00	44161.00	3.48	63
14983	2	2002	1	0	12105.00	4280.00	2.83	63
14984	2	2002	1	1	105454.00	34565.00	3.05	63
14985	2	2002	1	2	117559.00	38845.00	3.03	63
14986	2	2002	2	0	10077.00	3045.00	3.31	63
14987	2	2002	2	1	126222.00	36775.00	3.43	63
14988	2	2002	2	2	136299.00	39820.00	3.42	63
14989	2	2003	1	0	10341.00	4000.00	2.59	63
14990	2	2003	1	1	88449.00	29864.00	2.96	63
14991	2	2003	1	2	98790.00	33864.00	2.92	63
14992	2	2003	2	0	11000.00	3749.00	2.93	63
14993	2	2003	2	1	132311.00	36998.00	3.58	63
14994	2	2003	2	2	143311.00	40747.00	3.52	63
14995	2	2004	1	0	8742.00	3484.00	2.51	63
14996	2	2004	1	1	92162.00	31499.00	2.93	63
14997	2	2004	1	2	100904.00	34983.00	2.88	63
14998	2	2004	2	0	15848.00	5343.00	2.97	63
14999	2	2004	2	1	155457.00	41882.00	3.71	63
15000	2	2004	2	2	171305.00	47225.00	3.63	63
15001	2	2005	1	0	6583.00	2318.00	2.84	63
15002	2	2005	1	1	85804.00	25456.00	3.37	63
15003	2	2005	1	2	92387.00	27774.00	3.33	63
15004	2	2005	2	0	19684.00	6113.00	3.22	63
15005	2	2005	2	1	161334.00	42331.00	3.81	63
15006	2	2005	2	2	181018.00	48444.00	3.74	63
15007	2	2006	1	0	12976.00	4528.00	2.87	63
15008	2	2006	1	1	110506.00	30056.00	3.68	63
15009	2	2006	1	2	123482.00	34584.00	3.57	63
15010	2	2006	2	0	22523.00	6823.00	3.30	63
15011	2	2006	2	1	129325.00	32849.00	3.94	63
15012	2	2006	2	2	151848.00	39672.00	3.83	63
15013	2	2007	1	0	8292.00	3282.00	2.53	63
15014	2	2007	1	1	107043.00	30362.00	3.53	63
15015	2	2007	1	2	115335.00	33644.00	3.43	63
15016	2	2007	2	0	27271.00	8371.00	3.26	63
15017	2	2007	2	1	148657.00	36789.00	4.04	63
15018	2	2007	2	2	175928.00	45160.00	3.90	63
15019	2	2008	1	0	13422.00	5015.00	2.68	63
15020	2	2008	1	1	125414.00	35830.00	3.50	63
15021	2	2008	1	2	138836.00	40845.00	3.40	63
15022	2	2008	2	0	22279.00	7390.00	3.01	63
15023	2	2008	2	1	137633.00	35897.00	3.83	63
15024	2	2008	2	2	159912.00	43287.00	3.69	63
15025	2	2009	1	0	20783.00	7122.00	2.92	63
15026	2	2009	1	1	115353.00	33720.00	3.42	63
15027	2	2009	1	2	136136.00	40842.00	3.33	63
15028	2	2009	2	0	19845.00	6582.00	3.02	63
15029	2	2009	2	1	144632.00	36030.00	4.01	63
15030	2	2009	2	2	164477.00	42612.00	3.86	63
15031	2	2010	1	0	10078.00	4243.00	2.38	63
15032	2	2010	1	1	105476.00	31375.00	3.36	63
15033	2	2010	1	2	115554.00	35618.00	3.24	63
15034	2	2010	2	0	23390.00	7286.00	3.21	63
15035	2	2010	2	1	150279.00	35985.00	4.18	63
15036	2	2010	2	2	173669.00	43271.00	4.01	63
15037	2	2011	1	0	17690.00	6371.00	2.78	63
15038	2	2011	1	1	124098.00	32879.00	3.77	63
15039	2	2011	1	2	141788.00	39250.00	3.61	63
15040	2	2011	2	0	24462.00	8417.00	2.91	63
15041	2	2011	2	1	144160.00	36054.00	4.00	63
15042	2	2011	2	2	168622.00	44471.00	3.79	63
15043	2	2012	1	0	20525.00	6860.00	2.99	63
15044	2	2012	1	1	126857.00	32715.00	3.88	63
15045	2	2012	1	2	147382.00	39575.00	3.72	63
15046	2	2012	2	0	24395.00	8799.00	2.77	63
15047	2	2012	2	1	138164.00	35758.00	3.86	63
15048	2	2012	2	2	162559.00	44557.00	3.65	63
15049	2	2013	1	0	19141.00	7014.00	2.73	63
15050	2	2013	1	1	125731.00	34262.00	3.67	63
15051	2	2013	1	2	144872.00	41276.00	3.51	63
15052	2	2013	2	0	30501.00	9536.00	3.20	63
15053	2	2013	2	1	154056.00	36602.00	4.21	63
15054	2	2013	2	2	184557.00	46138.00	4.00	63
15055	2	2014	1	0	19181.00	6344.00	3.02	63
15056	2	2014	1	1	131194.00	32729.00	4.01	63
15057	2	2014	1	2	150375.00	39073.00	3.85	63
15058	2	2014	2	0	33023.00	10056.00	3.28	63
15059	2	2014	2	1	161494.00	38139.00	4.23	63
15060	2	2014	2	2	194517.00	48195.00	4.04	63
15061	2	2015	1	0	14783.00	5485.00	2.70	63
15062	2	2015	1	1	115095.00	29398.00	3.92	63
15063	2	2015	1	2	129878.00	34883.00	3.72	63
15064	2	2015	2	0	30429.00	9520.00	3.20	63
15065	2	2015	2	1	177138.00	41265.00	4.29	63
15066	2	2015	2	2	207567.00	50785.00	4.09	63
15067	2	2016	1	0	10113.00	4814.00	2.10	63
15068	2	2016	1	1	85401.00	24703.00	3.46	63
15069	2	2016	1	2	95514.00	29517.00	3.24	63
15070	2	2016	2	0	32132.00	9720.00	3.31	63
15071	2	2016	2	1	179818.00	40512.00	4.44	63
15072	2	2016	2	2	211950.00	50232.00	4.22	63
15073	2	2017	1	0	20087.00	7083.00	2.84	63
15074	2	2017	1	1	129695.00	35521.00	3.65	63
15075	2	2017	1	2	149782.00	42604.00	3.52	63
15076	2	2017	2	0	32086.00	9782.00	3.28	63
15077	2	2017	2	1	176695.00	39830.00	4.44	63
15078	2	2017	2	2	208781.00	49612.00	4.21	63
15079	2	2018	1	0	14450.00	6329.00	2.28	63
15080	2	2018	1	1	118168.00	34899.00	3.39	63
15081	2	2018	1	2	132618.00	41228.00	3.22	63
15082	2	2018	2	0	32038.00	10371.00	3.09	63
15083	2	2018	2	1	184150.00	39187.00	4.70	63
15084	2	2018	2	2	216188.00	49558.00	4.36	63
15085	2	2019	1	0	12573.00	5577.00	2.25	63
15086	2	2019	1	1	111030.00	32609.36	3.40	63
15087	2	2019	1	2	123603.00	38186.36	3.24	63
15088	2	2019	2	0	24465.00	8544.66	2.86	63
15089	2	2019	2	1	156230.00	34962.00	4.47	63
15090	2	2019	2	2	180695.00	43506.66	4.15	63
15091	2	2020	1	0	12741.00	5093.00	2.50	63
15092	2	2020	1	1	104958.00	29880.00	3.51	63
15093	2	2020	1	2	117699.00	34973.00	3.37	63
15094	2	2020	2	0	31140.16	10291.00	3.03	63
15095	2	2020	2	1	157504.00	39598.00	3.98	63
15096	2	2020	2	2	188644.16	49889.00	3.78	63
15097	2	1987	1	0	8215.00	3440.00	2.39	64
15098	2	1987	1	1	13255.00	4150.00	3.19	64
15099	2	1987	1	2	21470.00	7590.00	2.83	64
15100	2	1987	2	0	4027.00	1580.00	2.55	64
15101	2	1987	2	1	9160.00	2920.00	3.14	64
15102	2	1987	2	2	13187.00	4500.00	2.93	64
15103	2	1988	1	0	5721.00	2280.00	2.51	64
15104	2	1988	1	1	12774.00	3550.00	3.60	64
15105	2	1988	1	2	18495.00	5830.00	3.17	64
15106	2	1988	2	0	3381.00	1180.00	2.87	64
15107	2	1988	2	1	11136.00	3540.00	3.15	64
15108	2	1988	2	2	14517.00	4720.00	3.08	64
15109	2	1989	1	0	8284.00	2620.00	3.16	64
15110	2	1989	1	1	15352.00	4470.00	3.43	64
15111	2	1989	1	2	23636.00	7090.00	3.33	64
15112	2	1989	2	0	5179.00	1650.00	3.14	64
15113	2	1989	2	1	13867.00	3440.00	4.03	64
15114	2	1989	2	2	19046.00	5090.00	3.74	64
15115	2	1990	1	0	4230.00	2170.00	1.95	64
15116	2	1990	1	1	14500.00	4570.00	3.17	64
15117	2	1990	1	2	18730.00	6740.00	2.78	64
15118	2	1990	2	0	3090.00	1190.00	2.60	64
15119	2	1990	2	1	8420.00	2210.00	3.81	64
15120	2	1990	2	2	11510.00	3400.00	3.39	64
15121	2	1991	1	0	4170.00	1770.00	2.36	64
15122	2	1991	1	1	13470.00	4110.00	3.28	64
15123	2	1991	1	2	17640.00	5880.00	3.00	64
15124	2	1991	2	0	4560.00	1780.00	2.56	64
15125	2	1991	2	1	10450.00	2620.00	3.99	64
15126	2	1991	2	2	15010.00	4400.00	3.41	64
15127	2	1992	1	0	1490.00	830.00	1.80	64
15128	2	1992	1	1	20260.00	6090.00	3.33	64
15129	2	1992	1	2	21750.00	6920.00	3.14	64
15130	2	1992	2	0	350.00	220.00	1.59	64
15131	2	1992	2	1	8980.00	2450.00	3.67	64
15132	2	1992	2	2	9330.00	2670.00	3.49	64
15133	2	1993	1	0	2520.00	1170.00	2.15	64
15134	2	1993	1	1	19440.00	6490.00	3.00	64
15135	2	1993	1	2	21960.00	7660.00	2.87	64
15136	2	1993	2	0	2660.00	1100.00	2.42	64
15137	2	1993	2	1	14180.00	3550.00	3.99	64
15138	2	1993	2	2	16840.00	4650.00	3.62	64
15139	2	1994	1	0	3370.00	1510.00	2.23	64
15140	2	1994	1	1	20570.00	7090.00	2.90	64
15141	2	1994	1	2	23940.00	8600.00	2.78	64
15142	2	1994	2	0	3330.00	1340.00	2.49	64
15143	2	1994	2	1	15130.00	3760.00	4.02	64
15144	2	1994	2	2	18460.00	5100.00	3.62	64
15145	2	1995	1	0	4426.00	1760.00	2.51	64
15146	2	1995	1	1	23202.00	7460.00	3.11	64
15147	2	1995	1	2	27628.00	9220.00	3.00	64
15148	2	1995	2	0	3577.00	1375.00	2.60	64
15149	2	1995	2	1	15364.00	3815.00	4.03	64
15150	2	1995	2	2	18941.00	5190.00	3.65	64
15151	2	1996	1	0	4592.00	1775.00	2.59	64
15152	2	1996	1	1	23944.00	7580.00	3.16	64
15153	2	1996	1	2	28536.00	9355.00	3.05	64
15154	2	1996	2	0	3848.00	1502.00	2.56	64
15155	2	1996	2	1	16498.00	4144.00	3.98	64
15156	2	1996	2	2	20346.00	5646.00	3.60	64
15157	2	1997	1	0	4990.00	1900.00	2.63	64
15158	2	1997	1	1	25478.00	7925.00	3.21	64
15159	2	1997	1	2	30468.00	9825.00	3.10	64
15160	2	1997	2	0	3753.00	1516.00	2.48	64
15161	2	1997	2	1	17673.00	4425.00	3.99	64
15162	2	1997	2	2	21426.00	5941.00	3.61	64
15163	2	1998	1	0	3024.00	1080.00	2.80	64
15164	2	1998	1	1	23191.00	7767.00	2.99	64
15165	2	1998	1	2	26215.00	8847.00	2.96	64
15166	2	1998	2	0	146.00	60.00	2.43	64
15167	2	1998	2	1	12204.00	3700.00	3.30	64
15168	2	1998	2	2	12350.00	3760.00	3.28	64
15169	2	1999	1	0	4266.00	1515.00	2.82	64
15170	2	1999	1	1	26226.00	7950.00	3.30	64
15171	2	1999	1	2	30492.00	9465.00	3.22	64
15172	2	1999	2	0	3806.00	1445.00	2.63	64
15173	2	1999	2	1	16334.00	4205.00	3.88	64
15174	2	1999	2	2	20140.00	5650.00	3.56	64
15175	2	2000	1	0	5179.00	1863.00	2.78	64
15176	2	2000	1	1	25434.00	8030.00	3.17	64
15177	2	2000	1	2	30613.00	9893.00	3.09	64
15178	2	2000	2	0	3891.00	1478.00	2.63	64
15179	2	2000	2	1	16129.00	4267.00	3.78	64
15180	2	2000	2	2	20020.00	5745.00	3.48	64
15181	2	2001	1	0	5383.00	1878.00	2.87	64
15182	2	2001	1	1	27097.00	8036.00	3.37	64
15183	2	2001	1	2	32480.00	9914.00	3.28	64
15184	2	2001	2	0	4013.00	1495.00	2.68	64
15185	2	2001	2	1	24852.00	6332.00	3.92	64
15186	2	2001	2	2	28865.00	7827.00	3.69	64
15187	2	2002	1	0	5392.00	1892.00	2.85	64
15188	2	2002	1	1	25320.00	7382.00	3.43	64
15189	2	2002	1	2	30712.00	9274.00	3.31	64
15190	2	2002	2	0	4131.00	1498.00	2.76	64
15191	2	2002	2	1	25743.00	6406.00	4.02	64
15192	2	2002	2	2	29874.00	7904.00	3.78	64
15193	2	2003	1	0	5664.00	1900.00	2.98	64
15194	2	2003	1	1	27473.00	7340.00	3.74	64
15195	2	2003	1	2	33137.00	9240.00	3.59	64
15196	2	2003	2	0	4264.00	1520.00	2.81	64
15197	2	2003	2	1	26977.00	6428.00	4.20	64
15198	2	2003	2	2	31241.00	7948.00	3.93	64
15199	2	2004	1	0	5762.00	1928.00	2.99	64
15200	2	2004	1	1	29732.00	7730.00	3.85	64
15201	2	2004	1	2	35494.00	9658.00	3.68	64
15202	2	2004	2	0	4860.00	1607.00	3.02	64
15203	2	2004	2	1	30636.00	6440.00	4.76	64
15204	2	2004	2	2	35496.00	8047.00	4.41	64
15205	2	2005	1	0	6079.00	1868.00	3.25	64
15206	2	2005	1	1	38695.00	7878.00	4.91	64
15207	2	2005	1	2	44774.00	9746.00	4.59	64
15208	2	2005	2	0	5181.00	1678.00	3.09	64
15209	2	2005	2	1	32496.00	6451.00	5.04	64
15210	2	2005	2	2	37677.00	8129.00	4.63	64
15211	2	2006	1	0	5792.00	1879.00	3.08	64
15212	2	2006	1	1	37431.00	7708.00	4.86	64
15213	2	2006	1	2	43223.00	9587.00	4.51	64
15214	2	2006	2	0	5396.00	1720.00	3.14	64
15215	2	2006	2	1	35794.00	6925.00	5.17	64
15216	2	2006	2	2	41190.00	8645.00	4.76	64
15217	2	2007	1	0	5940.00	1720.00	3.45	64
15218	2	2007	1	1	39773.00	7860.00	5.06	64
15219	2	2007	1	2	45713.00	9580.00	4.77	64
15220	2	2007	2	0	5696.00	1635.00	3.48	64
15221	2	2007	2	1	35493.00	6910.00	5.14	64
15222	2	2007	2	2	41189.00	8545.00	4.82	64
15223	2	2008	1	0	6519.00	1780.00	3.66	64
15224	2	2008	1	1	42005.00	8115.00	5.18	64
15225	2	2008	1	2	48524.00	9895.00	4.90	64
15226	2	2008	2	0	5633.00	1641.00	3.43	64
15227	2	2008	2	1	45777.00	9086.00	5.04	64
15228	2	2008	2	2	51410.00	10727.00	4.79	64
15229	2	2009	1	0	6127.00	1858.00	3.30	64
15230	2	2009	1	1	47326.00	10020.00	4.72	64
15231	2	2009	1	2	53453.00	11878.00	4.50	64
15232	2	2009	2	0	5544.00	1671.00	3.32	64
15233	2	2009	2	1	43794.00	9348.00	4.68	64
15234	2	2009	2	2	49338.00	11019.00	4.48	64
15235	2	2010	1	0	6777.00	1858.00	3.65	64
15236	2	2010	1	1	48905.00	10160.00	4.81	64
15237	2	2010	1	2	55682.00	12018.00	4.63	64
15238	2	2010	2	0	4179.00	1357.00	3.08	64
15239	2	2010	2	1	40090.00	8520.00	4.71	64
15240	2	2010	2	2	44269.00	9877.00	4.48	64
15241	2	2011	1	0	6501.00	1852.00	3.51	64
15242	2	2011	1	1	45536.00	9978.00	4.56	64
15243	2	2011	1	2	52037.00	11830.00	4.40	64
15244	2	2011	2	0	3873.00	1275.00	3.04	64
15245	2	2011	2	1	36743.00	8620.00	4.26	64
15246	2	2011	2	2	40616.00	9895.00	4.10	64
15247	2	2012	1	0	5910.00	1820.00	3.25	64
15248	2	2012	1	1	48621.00	10330.00	4.71	64
15249	2	2012	1	2	54531.00	12150.00	4.49	64
15250	2	2012	2	0	3970.00	1299.00	3.06	64
15251	2	2012	2	1	37665.00	8625.00	4.37	64
15252	2	2012	2	2	41635.00	9924.00	4.20	64
15253	2	2013	1	0	5372.00	1744.00	3.08	64
15254	2	2013	1	1	48467.00	10323.00	4.70	64
15255	2	2013	1	2	53839.00	12067.00	4.46	64
15256	2	2013	2	0	3279.00	1162.00	2.82	64
15257	2	2013	2	1	37753.00	8716.00	4.33	64
15258	2	2013	2	2	41032.00	9878.00	4.15	64
15259	2	2014	1	0	5067.00	1725.00	2.94	64
15260	2	2014	1	1	46924.00	10246.00	4.58	64
15261	2	2014	1	2	51991.00	11971.00	4.34	64
15262	2	2014	2	0	3337.00	1138.00	2.93	64
15263	2	2014	2	1	37244.00	8758.00	4.25	64
15264	2	2014	2	2	40581.00	9896.00	4.10	64
15265	2	2015	1	0	4833.00	1693.00	2.85	64
15266	2	2015	1	1	47112.00	10274.00	4.59	64
15267	2	2015	1	2	51945.00	11967.00	4.34	64
15268	2	2015	2	0	3134.00	1077.00	2.91	64
15269	2	2015	2	1	37502.00	8723.00	4.30	64
15270	2	2015	2	2	40636.00	9800.00	4.15	64
15271	2	2016	1	0	4156.00	1467.00	2.83	64
15272	2	2016	1	1	46763.00	10419.00	4.49	64
15273	2	2016	1	2	50919.00	11886.00	4.28	64
15274	2	2016	2	0	2896.00	1019.00	2.84	64
15275	2	2016	2	1	37273.00	8556.00	4.36	64
15276	2	2016	2	2	40169.00	9575.00	4.20	64
15277	2	2017	1	0	2573.00	1386.00	1.86	64
15278	2	2017	1	1	34434.00	10485.00	3.28	64
15279	2	2017	1	2	37007.00	11871.00	3.12	64
15280	2	2017	2	0	2192.00	763.00	2.87	64
15281	2	2017	2	1	36137.00	8311.00	4.35	64
15282	2	2017	2	2	38329.00	9074.00	4.22	64
15283	2	2018	1	0	3554.00	1372.00	2.59	64
15284	2	2018	1	1	46530.00	10421.00	4.47	64
15285	2	2018	1	2	50084.00	11793.00	4.25	64
15286	2	2018	2	0	2185.00	757.00	2.89	64
15287	2	2018	2	1	35876.00	8254.00	4.35	64
15288	2	2018	2	2	38061.00	9011.00	4.22	64
15289	2	2019	1	0	2753.00	1039.00	2.65	64
15290	2	2019	1	1	44321.00	10115.00	4.38	64
15291	2	2019	1	2	47074.00	11154.00	4.22	64
15292	2	2019	2	0	1315.00	469.00	2.80	64
15293	2	2019	2	1	32151.00	7616.00	4.22	64
15294	2	2019	2	2	33466.00	8085.00	4.14	64
15295	2	2020	1	0	2453.60	918.00	2.67	64
15296	2	2020	1	1	44982.00	10028.00	4.49	64
15297	2	2020	1	2	47435.60	10946.00	4.33	64
15298	2	2020	2	0	1482.00	532.00	2.79	64
15299	2	2020	2	1	32596.00	7618.00	4.28	64
15300	2	2020	2	2	34078.00	8150.00	4.18	64
15301	2	1987	1	0	11905.00	5840.00	2.04	65
15302	2	1987	1	1	40640.00	13490.00	3.01	65
15525	2	1990	1	2	\N	\N	\N	66
15303	2	1987	1	2	52545.00	19330.00	2.72	65
15304	2	1987	2	0	71264.00	23150.00	3.08	65
15305	2	1987	2	1	121788.00	31200.00	3.90	65
15306	2	1987	2	2	193052.00	54350.00	3.55	65
15307	2	1988	1	0	14419.00	6660.00	2.17	65
15308	2	1988	1	1	31226.00	11490.00	2.72	65
15309	2	1988	1	2	45645.00	18150.00	2.51	65
15310	2	1988	2	0	55762.00	18020.00	3.09	65
15311	2	1988	2	1	131751.00	31240.00	4.22	65
15312	2	1988	2	2	187513.00	49260.00	3.81	65
15313	2	1989	1	0	9528.00	4230.00	2.25	65
15314	2	1989	1	1	63274.00	23430.00	2.70	65
15315	2	1989	1	2	72802.00	27660.00	2.63	65
15316	2	1989	2	0	52638.00	17940.00	2.93	65
15317	2	1989	2	1	88685.00	21440.00	4.14	65
15318	2	1989	2	2	141323.00	39380.00	3.59	65
15319	2	1990	1	0	20473.00	7890.00	2.59	65
15320	2	1990	1	1	62638.00	19060.00	3.29	65
15321	2	1990	1	2	83111.00	26950.00	3.08	65
15322	2	1990	2	0	55812.00	23990.00	2.33	65
15323	2	1990	2	1	70566.00	17510.00	4.03	65
15324	2	1990	2	2	126378.00	41500.00	3.05	65
15325	2	1991	1	0	9961.00	4930.00	2.02	65
15326	2	1991	1	1	37296.00	14890.00	2.50	65
15327	2	1991	1	2	47257.00	19820.00	2.38	65
15328	2	1991	2	0	50710.00	20740.00	2.45	65
15329	2	1991	2	1	65512.00	14720.00	4.45	65
15330	2	1991	2	2	116222.00	35460.00	3.28	65
15331	2	1992	1	0	1567.00	800.00	1.96	65
15332	2	1992	1	1	47253.00	16320.00	2.90	65
15333	2	1992	1	2	48820.00	17120.00	2.85	65
15334	2	1992	2	0	37796.00	17430.00	2.17	65
15335	2	1992	2	1	92050.00	20430.00	4.51	65
15336	2	1992	2	2	129846.00	37860.00	3.43	65
15337	2	1993	1	0	12652.00	4580.00	2.76	65
15338	2	1993	1	1	59621.00	20080.00	2.97	65
15339	2	1993	1	2	72273.00	24660.00	2.93	65
15340	2	1993	2	0	31554.00	14670.00	2.15	65
15341	2	1993	2	1	90253.00	23380.00	3.86	65
15342	2	1993	2	2	121807.00	38050.00	3.20	65
15343	2	1994	1	0	8837.00	3600.00	2.45	65
15344	2	1994	1	1	56946.00	19230.00	2.96	65
15345	2	1994	1	2	65783.00	22830.00	2.88	65
15346	2	1994	2	0	46696.00	16950.00	2.75	65
15347	2	1994	2	1	136625.00	36190.00	3.78	65
15348	2	1994	2	2	183321.00	53140.00	3.45	65
15349	2	1995	1	0	8060.00	3520.00	2.29	65
15350	2	1995	1	1	78706.00	25940.00	3.03	65
15351	2	1995	1	2	86766.00	29460.00	2.95	65
15352	2	1995	2	0	44683.00	15753.00	2.84	65
15353	2	1995	2	1	135074.00	35519.00	3.80	65
15354	2	1995	2	2	179757.00	51272.00	3.51	65
15355	2	1996	1	0	15635.00	5874.00	2.66	65
15356	2	1996	1	1	107310.00	33595.00	3.19	65
15357	2	1996	1	2	122945.00	39469.00	3.11	65
15358	2	1996	2	0	43025.00	16200.00	2.66	65
15359	2	1996	2	1	144352.00	40926.00	3.53	65
15360	2	1996	2	2	187377.00	57126.00	3.28	65
15361	2	1997	1	0	22764.00	8968.00	2.54	65
15362	2	1997	1	1	73223.00	26720.00	2.74	65
15363	2	1997	1	2	95987.00	35688.00	2.69	65
15364	2	1997	2	0	19768.00	9090.00	2.17	65
15365	2	1997	2	1	156456.00	45666.00	3.43	65
15366	2	1997	2	2	176224.00	54756.00	3.22	65
15367	2	1998	1	0	419.00	225.00	1.86	65
15368	2	1998	1	1	55856.00	19289.00	2.90	65
15369	2	1998	1	2	56275.00	19514.00	2.88	65
15370	2	1998	2	0	22953.00	8046.00	2.85	65
15371	2	1998	2	1	125083.00	37885.00	3.30	65
15372	2	1998	2	2	148036.00	45931.00	3.22	65
15373	2	1999	1	0	8930.00	4250.00	2.10	65
15374	2	1999	1	1	86816.00	32544.00	2.67	65
15375	2	1999	1	2	95746.00	36794.00	2.60	65
15376	2	1999	2	0	19730.00	7960.00	2.48	65
15377	2	1999	2	1	146395.00	48146.00	3.04	65
15378	2	1999	2	2	166125.00	56106.00	2.96	65
15379	2	2000	1	0	13009.00	4708.00	2.76	65
15380	2	2000	1	1	125553.00	41266.00	3.04	65
15381	2	2000	1	2	138562.00	45974.00	3.01	65
15382	2	2000	2	0	12805.00	5359.00	2.39	65
15383	2	2000	2	1	156744.00	44182.00	3.55	65
15384	2	2000	2	2	169549.00	49541.00	3.42	65
15385	2	2001	1	0	2760.00	1150.00	2.40	65
15386	2	2001	1	1	132169.00	41111.00	3.21	65
15387	2	2001	1	2	134929.00	42261.00	3.19	65
15388	2	2001	2	0	15734.00	5227.00	3.01	65
15389	2	2001	2	1	192073.00	52838.00	3.64	65
15390	2	2001	2	2	207807.00	58065.00	3.58	65
15391	2	2002	1	0	13323.00	4525.00	2.94	65
15392	2	2002	1	1	125218.00	40210.00	3.11	65
15393	2	2002	1	2	138541.00	44735.00	3.10	65
15394	2	2002	2	0	14061.00	5980.00	2.35	65
15395	2	2002	2	1	188206.00	51435.00	3.66	65
15396	2	2002	2	2	202267.00	57415.00	3.52	65
15397	2	2003	1	0	7840.00	3400.00	2.31	65
15398	2	2003	1	1	118567.00	37102.00	3.20	65
15399	2	2003	1	2	126407.00	40502.00	3.12	65
15400	2	2003	2	0	20874.00	8121.00	2.57	65
15401	2	2003	2	1	197354.00	53398.00	3.70	65
15402	2	2003	2	2	218228.00	61519.00	3.55	65
15403	2	2004	1	0	8158.00	3650.00	2.24	65
15404	2	2004	1	1	117511.00	37221.00	3.16	65
15405	2	2004	1	2	125669.00	40871.00	3.07	65
15406	2	2004	2	0	24337.00	10038.00	2.42	65
15407	2	2004	2	1	217184.00	56790.00	3.82	65
15408	2	2004	2	2	241521.00	66828.00	3.61	65
15409	2	2005	1	0	4097.00	2700.00	1.52	65
15410	2	2005	1	1	108666.00	32855.00	3.31	65
15411	2	2005	1	2	112763.00	35555.00	3.17	65
15412	2	2005	2	0	23779.00	9415.00	2.53	65
15413	2	2005	2	1	221122.00	57225.00	3.86	65
15414	2	2005	2	2	244901.00	66640.00	3.67	65
15415	2	2006	1	0	8758.00	4590.00	1.91	65
15416	2	2006	1	1	116636.00	34319.00	3.40	65
15417	2	2006	1	2	125394.00	38909.00	3.22	65
15418	2	2006	2	0	28370.00	10243.00	2.77	65
15419	2	2006	2	1	241671.00	60629.00	3.99	65
15420	2	2006	2	2	270041.00	70872.00	3.81	65
15421	2	2007	1	0	8334.00	4227.00	1.97	65
15422	2	2007	1	1	116338.00	33761.00	3.45	65
15423	2	2007	1	2	124672.00	37988.00	3.28	65
15424	2	2007	2	0	40607.00	13085.00	3.10	65
15425	2	2007	2	1	235105.00	61651.00	3.81	65
15426	2	2007	2	2	275712.00	74736.00	3.69	65
15427	2	2008	1	0	19025.00	6590.00	2.89	65
15428	2	2008	1	1	119083.00	35878.00	3.32	65
15429	2	2008	1	2	138108.00	42468.00	3.25	65
15430	2	2008	2	0	46927.00	15170.00	3.09	65
15431	2	2008	2	1	214476.00	58949.00	3.64	65
15432	2	2008	2	2	261403.00	74119.00	3.53	65
15433	2	2009	1	0	20241.00	7270.00	2.78	65
15434	2	2009	1	1	121343.00	35982.00	3.37	65
15435	2	2009	1	2	141584.00	43252.00	3.27	65
15436	2	2009	2	0	40560.00	15140.00	2.68	65
15437	2	2009	2	1	210311.00	60206.00	3.49	65
15438	2	2009	2	2	250871.00	75346.00	3.33	65
15439	2	2010	1	0	10506.00	5321.00	1.97	65
15440	2	2010	1	1	112507.00	35419.00	3.18	65
15441	2	2010	1	2	123013.00	40740.00	3.02	65
15442	2	2010	2	0	40563.00	15648.00	2.59	65
15443	2	2010	2	1	229499.00	57917.00	3.96	65
15444	2	2010	2	2	270062.00	73565.00	3.67	65
15445	2	2011	1	0	15653.00	6207.00	2.52	65
15446	2	2011	1	1	128828.00	38005.00	3.39	65
15447	2	2011	1	2	144481.00	44212.00	3.27	65
15448	2	2011	2	0	41973.00	16024.00	2.62	65
15449	2	2011	2	1	217744.00	56624.00	3.85	65
15450	2	2011	2	2	259717.00	72648.00	3.58	65
15451	2	2012	1	0	17600.00	6248.00	2.82	65
15452	2	2012	1	1	128134.00	36212.00	3.54	65
15453	2	2012	1	2	145734.00	42460.00	3.43	65
15454	2	2012	2	0	47429.00	14848.00	3.19	65
15455	2	2012	2	1	226588.00	58821.00	3.85	65
15456	2	2012	2	2	274017.00	73669.00	3.72	65
15457	2	2013	1	0	20248.00	6626.00	3.06	65
15458	2	2013	1	1	137564.00	37166.00	3.70	65
15459	2	2013	1	2	157812.00	43792.00	3.60	65
15460	2	2013	2	0	51699.00	16949.00	3.05	65
15461	2	2013	2	1	233344.00	57286.00	4.07	65
15462	2	2013	2	2	285043.00	74235.00	3.84	65
15463	2	2014	1	0	19169.00	6568.00	2.92	65
15464	2	2014	1	1	132042.00	35508.00	3.72	65
15465	2	2014	1	2	151211.00	42076.00	3.59	65
15466	2	2014	2	0	54162.00	17570.00	3.08	65
15467	2	2014	2	1	235123.00	55959.00	4.20	65
15468	2	2014	2	2	289285.00	73529.00	3.93	65
15469	2	2015	1	0	19850.00	6548.00	3.03	65
15470	2	2015	1	1	137026.00	36568.00	3.75	65
15471	2	2015	1	2	156876.00	43116.00	3.64	65
15472	2	2015	2	0	47493.00	16470.00	2.88	65
15473	2	2015	2	1	228473.00	54826.00	4.17	65
15474	2	2015	2	2	275966.00	71296.00	3.87	65
15475	2	2016	1	0	11415.00	4154.00	2.75	65
15476	2	2016	1	1	112667.00	32975.00	3.42	65
15477	2	2016	1	2	124082.00	37129.00	3.34	65
15478	2	2016	2	0	49099.00	15436.00	3.18	65
15479	2	2016	2	1	244793.00	57799.00	4.24	65
15480	2	2016	2	2	293892.00	73235.00	4.01	65
15481	2	2017	1	0	11722.00	4882.00	2.40	65
15482	2	2017	1	1	130894.00	40794.00	3.21	65
15483	2	2017	1	2	142616.00	45676.00	3.12	65
15484	2	2017	2	0	47363.00	16319.00	2.90	65
15485	2	2017	2	1	229107.00	57844.00	3.96	65
15486	2	2017	2	2	276470.00	74163.00	3.73	65
15487	2	2018	1	0	13819.00	5563.00	2.48	65
15488	2	2018	1	1	140763.00	41737.00	3.37	65
15489	2	2018	1	2	154582.00	47300.00	3.27	65
15490	2	2018	2	0	48760.00	16168.00	3.02	65
15491	2	2018	2	1	227654.00	54606.25	4.17	65
15492	2	2018	2	2	276414.00	70774.25	3.91	65
15493	2	2019	1	0	9823.47	4546.00	2.16	65
15494	2	2019	1	1	125366.84	38165.75	3.28	65
15495	2	2019	1	2	135190.31	42711.75	3.17	65
15496	2	2019	2	0	43093.00	15286.00	2.82	65
15497	2	2019	2	1	198466.00	49293.00	4.03	65
15498	2	2019	2	2	241559.00	64579.00	3.74	65
15499	2	2020	1	0	12886.00	5590.00	2.31	65
15500	2	2020	1	1	136597.98	40878.00	3.34	65
15501	2	2020	1	2	149483.98	46468.00	3.22	65
15502	2	2020	2	0	44533.00	14988.00	2.97	65
15503	2	2020	2	1	202883.00	48009.00	4.23	65
15504	2	2020	2	2	247416.00	62997.00	3.93	65
15505	2	1987	1	0	\N	\N	\N	66
15506	2	1987	1	1	\N	\N	\N	66
15507	2	1987	1	2	\N	\N	\N	66
15508	2	1987	2	0	8676.00	8870.00	0.98	66
15509	2	1987	2	1	\N	\N	\N	66
15510	2	1987	2	2	8676.00	8870.00	0.98	66
15511	2	1988	1	0	\N	\N	\N	66
15512	2	1988	1	1	\N	\N	\N	66
15513	2	1988	1	2	\N	\N	\N	66
15514	2	1988	2	0	9370.00	8540.00	1.10	66
15515	2	1988	2	1	\N	\N	\N	66
15516	2	1988	2	2	9370.00	8540.00	1.10	66
15517	2	1989	1	0	\N	\N	\N	66
15518	2	1989	1	1	\N	\N	\N	66
15519	2	1989	1	2	\N	\N	\N	66
15520	2	1989	2	0	9633.00	7760.00	1.24	66
15521	2	1989	2	1	\N	\N	\N	66
15522	2	1989	2	2	9633.00	7760.00	1.24	66
15523	2	1990	1	0	\N	\N	\N	66
15524	2	1990	1	1	\N	\N	\N	66
15526	2	1990	2	0	9743.00	8400.00	1.16	66
15527	2	1990	2	1	\N	\N	\N	66
15528	2	1990	2	2	9743.00	8400.00	1.16	66
15529	2	1991	1	0	\N	\N	\N	66
15530	2	1991	1	1	\N	\N	\N	66
15531	2	1991	1	2	\N	\N	\N	66
15532	2	1991	2	0	9345.00	8480.00	1.10	66
15533	2	1991	2	1	\N	\N	\N	66
15534	2	1991	2	2	9345.00	8480.00	1.10	66
15535	2	1992	1	0	\N	\N	\N	66
15536	2	1992	1	1	\N	\N	\N	66
15537	2	1992	1	2	\N	\N	\N	66
15538	2	1992	2	0	8903.00	8140.00	1.09	66
15539	2	1992	2	1	\N	\N	\N	66
15540	2	1992	2	2	8903.00	8140.00	1.09	66
15541	2	1993	1	0	\N	\N	\N	66
15542	2	1993	1	1	\N	\N	\N	66
15543	2	1993	1	2	\N	\N	\N	66
15544	2	1993	2	0	9330.00	8110.00	1.15	66
15545	2	1993	2	1	\N	\N	\N	66
15546	2	1993	2	2	9330.00	8110.00	1.15	66
15547	2	1994	1	0	\N	\N	\N	66
15548	2	1994	1	1	\N	\N	\N	66
15549	2	1994	1	2	\N	\N	\N	66
15550	2	1994	2	0	7337.00	6610.00	1.11	66
15551	2	1994	2	1	\N	\N	\N	66
15552	2	1994	2	2	7337.00	6610.00	1.11	66
15553	2	1995	1	0	\N	\N	\N	66
15554	2	1995	1	1	\N	\N	\N	66
15555	2	1995	1	2	\N	\N	\N	66
15556	2	1995	2	0	9096.00	7580.00	1.20	66
15557	2	1995	2	1	\N	\N	\N	66
15558	2	1995	2	2	9096.00	7580.00	1.20	66
15559	2	1996	1	0	\N	\N	\N	66
15560	2	1996	1	1	\N	\N	\N	66
15561	2	1996	1	2	\N	\N	\N	66
15562	2	1996	2	0	9750.00	6329.00	1.54	66
15563	2	1996	2	1	\N	\N	\N	66
15564	2	1996	2	2	9750.00	6329.00	1.54	66
15565	2	1997	1	0	\N	\N	\N	66
15566	2	1997	1	1	\N	\N	\N	66
15567	2	1997	1	2	\N	\N	\N	66
15568	2	1997	2	0	8445.00	5630.00	1.50	66
15569	2	1997	2	1	\N	\N	\N	66
15570	2	1997	2	2	8445.00	5630.00	1.50	66
15571	2	1998	1	0	\N	\N	\N	66
15572	2	1998	1	1	\N	\N	\N	66
15573	2	1998	1	2	\N	\N	\N	66
15574	2	1998	2	0	5138.00	4011.00	1.28	66
15575	2	1998	2	1	\N	\N	\N	66
15576	2	1998	2	2	5138.00	4011.00	1.28	66
15577	2	1999	1	0	\N	\N	\N	66
15578	2	1999	1	1	\N	\N	\N	66
15579	2	1999	1	2	\N	\N	\N	66
15580	2	1999	2	0	6062.00	4330.00	1.40	66
15581	2	1999	2	1	\N	\N	\N	66
15582	2	1999	2	2	6062.00	4330.00	1.40	66
15583	2	2000	1	0	\N	\N	\N	66
15584	2	2000	1	1	\N	\N	\N	66
15585	2	2000	1	2	\N	\N	\N	66
15586	2	2000	2	0	5810.00	4150.00	1.40	66
15587	2	2000	2	1	\N	\N	\N	66
15588	2	2000	2	2	5810.00	4150.00	1.40	66
15589	2	2001	1	0	\N	\N	\N	66
15590	2	2001	1	1	\N	\N	\N	66
15591	2	2001	1	2	\N	\N	\N	66
15592	2	2001	2	0	4938.00	3950.00	1.25	66
15593	2	2001	2	1	\N	\N	\N	66
15594	2	2001	2	2	4938.00	3950.00	1.25	66
15595	2	2002	1	0	\N	\N	\N	66
15596	2	2002	1	1	\N	\N	\N	66
15597	2	2002	1	2	\N	\N	\N	66
15598	2	2002	2	0	4485.00	3995.00	1.12	66
15599	2	2002	2	1	\N	\N	\N	66
15600	2	2002	2	2	4485.00	3995.00	1.12	66
15601	2	2003	1	0	\N	\N	\N	66
15602	2	2003	1	1	\N	\N	\N	66
15603	2	2003	1	2	\N	\N	\N	66
15604	2	2003	2	0	4212.00	3510.00	1.20	66
15605	2	2003	2	1	\N	\N	\N	66
15606	2	2003	2	2	4212.00	3510.00	1.20	66
15607	2	2004	1	0	\N	\N	\N	66
15608	2	2004	1	1	\N	\N	\N	66
15609	2	2004	1	2	\N	\N	\N	66
15610	2	2004	2	0	3850.00	3256.00	1.18	66
15611	2	2004	2	1	\N	\N	\N	66
15612	2	2004	2	2	3850.00	3256.00	1.18	66
15613	2	2005	1	0	\N	\N	\N	66
15614	2	2005	1	1	\N	\N	\N	66
15615	2	2005	1	2	\N	\N	\N	66
15616	2	2005	2	0	3750.00	3145.00	1.19	66
15617	2	2005	2	1	\N	\N	\N	66
15618	2	2005	2	2	3750.00	3145.00	1.19	66
15619	2	2006	1	0	\N	\N	\N	66
15620	2	2006	1	1	\N	\N	\N	66
15621	2	2006	1	2	\N	\N	\N	66
15622	2	2006	2	0	3435.00	3000.00	1.15	66
15623	2	2006	2	1	\N	\N	\N	66
15624	2	2006	2	2	3435.00	3000.00	1.15	66
15625	2	2007	1	0	\N	\N	\N	66
15626	2	2007	1	1	\N	\N	\N	66
15627	2	2007	1	2	\N	\N	\N	66
15628	2	2007	2	0	3400.00	2970.00	1.14	66
15629	2	2007	2	1	\N	\N	\N	66
15630	2	2007	2	2	3400.00	2970.00	1.14	66
15631	2	2008	1	0	\N	\N	\N	66
15632	2	2008	1	1	\N	\N	\N	66
15633	2	2008	1	2	\N	\N	\N	66
15634	2	2008	2	0	3450.00	2750.00	1.25	66
15635	2	2008	2	1	\N	\N	\N	66
15636	2	2008	2	2	3450.00	2750.00	1.25	66
15637	2	2009	1	0	\N	\N	\N	66
15638	2	2009	1	1	\N	\N	\N	66
15639	2	2009	1	2	\N	\N	\N	66
15640	2	2009	2	0	2914.00	1982.00	1.47	66
15641	2	2009	2	1	288.00	96.00	3.00	66
15642	2	2009	2	2	3202.00	2078.00	1.54	66
15643	2	2010	1	0	\N	\N	\N	66
15644	2	2010	1	1	\N	\N	\N	66
15645	2	2010	1	2	\N	\N	\N	66
15646	2	2010	2	0	2770.00	1803.00	1.54	66
15647	2	2010	2	1	155.00	50.00	3.10	66
15648	2	2010	2	2	2925.00	1853.00	1.58	66
15649	2	2011	1	0	\N	\N	\N	66
15650	2	2011	1	1	\N	\N	\N	66
15651	2	2011	1	2	\N	\N	\N	66
15652	2	2011	2	0	2397.00	1502.00	1.60	66
15653	2	2011	2	1	225.00	70.00	3.21	66
15654	2	2011	2	2	2622.00	1572.00	1.67	66
15655	2	2012	1	0	\N	\N	\N	66
15656	2	2012	1	1	\N	\N	\N	66
15657	2	2012	1	2	\N	\N	\N	66
15658	2	2012	2	0	2645.00	1542.00	1.72	66
15659	2	2012	2	1	300.00	90.00	3.33	66
15660	2	2012	2	2	2945.00	1632.00	1.80	66
15661	2	2013	1	0	\N	\N	\N	66
15662	2	2013	1	1	\N	\N	\N	66
15663	2	2013	1	2	\N	\N	\N	66
15664	2	2013	2	0	2054.00	1467.00	1.40	66
15665	2	2013	2	1	295.00	100.00	2.95	66
15666	2	2013	2	2	2349.00	1567.00	1.50	66
15667	2	2014	1	0	\N	\N	\N	66
15668	2	2014	1	1	\N	\N	\N	66
15669	2	2014	1	2	\N	\N	\N	66
15670	2	2014	2	0	2050.00	1410.00	1.45	66
15671	2	2014	2	1	\N	\N	\N	66
15672	2	2014	2	2	2050.00	1410.00	1.45	66
15673	2	2015	1	0	\N	\N	\N	66
15674	2	2015	1	1	\N	\N	\N	66
15675	2	2015	1	2	\N	\N	\N	66
15676	2	2015	2	0	2102.00	1381.00	1.52	66
15677	2	2015	2	1	300.00	90.00	3.33	66
15678	2	2015	2	2	2402.00	1471.00	1.63	66
15679	2	2016	1	0	\N	\N	\N	66
15680	2	2016	1	1	\N	\N	\N	66
15681	2	2016	1	2	\N	\N	\N	66
15682	2	2016	2	0	1650.00	1200.00	1.38	66
15683	2	2016	2	1	200.00	70.00	2.86	66
15684	2	2016	2	2	1850.00	1270.00	1.46	66
15685	2	2017	1	0	0.00	0.00	\N	66
15686	2	2017	1	1	0.00	0.00	\N	66
15687	2	2017	1	2	0.00	0.00	\N	66
15688	2	2017	2	0	2156.00	1309.00	1.65	66
15689	2	2017	2	1	300.00	80.00	3.75	66
15690	2	2017	2	2	2456.00	1389.00	1.77	66
15691	2	2018	1	0	0.00	0.00	\N	66
15692	2	2018	1	1	0.00	0.00	\N	66
15693	2	2018	1	2	0.00	0.00	\N	66
15694	2	2018	2	0	2760.00	1402.00	1.97	66
15695	2	2018	2	1	410.00	90.00	4.56	66
15696	2	2018	2	2	3170.00	1492.00	2.12	66
15697	2	2019	1	0	0.00	0.00	\N	66
15698	2	2019	1	1	0.00	0.00	\N	66
15699	2	2019	1	2	0.00	0.00	\N	66
15700	2	2019	2	0	2226.00	1300.00	1.71	66
15701	2	2019	2	1	420.00	110.00	3.82	66
15702	2	2019	2	2	2646.00	1410.00	1.88	66
15703	2	2020	1	0	0.00	0.00	\N	66
15704	2	2020	1	1	0.00	0.00	\N	66
15705	2	2020	1	2	0.00	0.00	\N	66
15706	2	2020	2	0	800.00	503.00	1.59	66
15707	2	2020	2	1	80.00	10.00	8.00	66
15708	2	2020	2	2	880.00	513.00	1.72	66
15709	2	1987	1	0	940.00	620.00	1.52	67
15710	2	1987	1	1	17515.00	7610.00	2.30	67
15711	2	1987	1	2	18455.00	8230.00	2.24	67
15712	2	1987	2	0	424.00	220.00	1.93	67
15713	2	1987	2	1	16895.00	5480.00	3.08	67
15714	2	1987	2	2	17319.00	5700.00	3.04	67
15715	2	1988	1	0	4313.00	2230.00	1.93	67
15716	2	1988	1	1	28248.00	10960.00	2.58	67
15717	2	1988	1	2	32561.00	13190.00	2.47	67
15718	2	1988	2	0	220.00	90.00	2.44	67
15719	2	1988	2	1	17650.00	5910.00	2.99	67
15720	2	1988	2	2	17870.00	6000.00	2.98	67
15721	2	1989	1	0	775.00	450.00	1.72	67
15722	2	1989	1	1	25632.00	10690.00	2.40	67
15723	2	1989	1	2	26407.00	11140.00	2.37	67
15724	2	1989	2	0	171.00	160.00	1.07	67
15725	2	1989	2	1	28112.00	7950.00	3.54	67
15726	2	1989	2	2	28283.00	8110.00	3.49	67
15727	2	1990	1	0	749.00	570.00	1.31	67
15728	2	1990	1	1	26689.00	12840.00	2.08	67
15729	2	1990	1	2	27438.00	13410.00	2.05	67
15730	2	1990	2	0	301.00	260.00	1.16	67
15731	2	1990	2	1	18276.00	4940.00	3.70	67
15732	2	1990	2	2	18577.00	5200.00	3.57	67
15733	2	1991	1	0	777.00	370.00	2.10	67
15734	2	1991	1	1	20511.00	8220.00	2.50	67
15735	2	1991	1	2	21288.00	8590.00	2.48	67
15736	2	1991	2	0	235.00	160.00	1.47	67
15737	2	1991	2	1	45531.00	11590.00	3.93	67
15738	2	1991	2	2	45766.00	11750.00	3.89	67
15739	2	1992	1	0	576.00	380.00	1.52	67
15740	2	1992	1	1	31155.00	12300.00	2.53	67
15741	2	1992	1	2	31731.00	12680.00	2.50	67
15742	2	1992	2	0	\N	\N	\N	67
15743	2	1992	2	1	15536.00	5430.00	2.86	67
15744	2	1992	2	2	15536.00	5430.00	2.86	67
15745	2	1993	1	0	895.00	480.00	1.86	67
15746	2	1993	1	1	25235.00	9660.00	2.61	67
15747	2	1993	1	2	26130.00	10140.00	2.58	67
15748	2	1993	2	0	\N	\N	\N	67
15749	2	1993	2	1	26396.00	6930.00	3.81	67
15750	2	1993	2	2	26396.00	6930.00	3.81	67
15751	2	1994	1	0	2355.00	1540.00	1.53	67
15752	2	1994	1	1	17449.00	7880.00	2.21	67
15753	2	1994	1	2	19804.00	9420.00	2.10	67
15754	2	1994	2	0	616.00	490.00	1.26	67
15755	2	1994	2	1	17491.00	7380.00	2.37	67
15756	2	1994	2	2	18107.00	7870.00	2.30	67
15757	2	1995	1	0	17076.00	8260.00	2.07	67
15758	2	1995	1	1	30496.00	11671.00	2.61	67
15759	2	1995	1	2	47572.00	19931.00	2.39	67
15760	2	1995	2	0	5478.00	3697.00	1.48	67
15761	2	1995	2	1	22544.00	8164.00	2.76	67
15762	2	1995	2	2	28022.00	11861.00	2.36	67
15763	2	1996	1	0	11448.00	7639.00	1.50	67
15764	2	1996	1	1	19738.00	9797.00	2.01	67
15765	2	1996	1	2	31186.00	17436.00	1.79	67
15766	2	1996	2	0	5996.00	4030.00	1.49	67
15767	2	1996	2	1	25535.00	9324.00	2.74	67
15768	2	1996	2	2	31531.00	13354.00	2.36	67
15769	2	1997	1	0	10677.00	6000.00	1.78	67
15770	2	1997	1	1	26354.00	10218.00	2.58	67
15771	2	1997	1	2	37031.00	16218.00	2.28	67
15772	2	1997	2	0	1772.00	1139.00	1.56	67
15773	2	1997	2	1	22153.00	9394.00	2.36	67
15774	2	1997	2	2	23925.00	10533.00	2.27	67
15775	2	1998	1	0	6397.00	4800.00	1.33	67
15776	2	1998	1	1	26271.00	9600.00	2.74	67
15777	2	1998	1	2	32668.00	14400.00	2.27	67
15778	2	1998	2	0	\N	\N	\N	67
15779	2	1998	2	1	14000.00	6045.00	2.32	67
15780	2	1998	2	2	14000.00	6045.00	2.32	67
15781	2	1999	1	0	8969.00	4875.00	1.84	67
15782	2	1999	1	1	26489.00	9662.00	2.74	67
15783	2	1999	1	2	35458.00	14537.00	2.44	67
15784	2	1999	2	0	2875.00	1926.00	1.49	67
15785	2	1999	2	1	26972.00	11188.00	2.41	67
15786	2	1999	2	2	29847.00	13114.00	2.28	67
15787	2	2000	1	0	9746.00	5625.00	1.73	67
15788	2	2000	1	1	23853.00	9052.00	2.64	67
15789	2	2000	1	2	33599.00	14677.00	2.29	67
15790	2	2000	2	0	1998.00	1372.00	1.46	67
15791	2	2000	2	1	24730.00	10565.00	2.34	67
15792	2	2000	2	2	26728.00	11937.00	2.24	67
15793	2	2001	1	0	11854.00	6207.00	1.91	67
15794	2	2001	1	1	27637.00	9587.00	2.88	67
15795	2	2001	1	2	39491.00	15794.00	2.50	67
15796	2	2001	2	0	2285.00	1437.00	1.59	67
15797	2	2001	2	1	23923.00	9524.00	2.51	67
15798	2	2001	2	2	26208.00	10961.00	2.39	67
15799	2	2002	1	0	12380.00	7470.00	1.66	67
15800	2	2002	1	1	30312.00	10950.00	2.77	67
15801	2	2002	1	2	42692.00	18420.00	2.32	67
15802	2	2002	2	0	1651.00	1092.00	1.51	67
15803	2	2002	2	1	20241.00	7893.00	2.56	67
15804	2	2002	2	2	21892.00	8985.00	2.44	67
15805	2	2003	1	0	15528.00	6943.00	2.24	67
15806	2	2003	1	1	27325.00	8562.00	3.19	67
15807	2	2003	1	2	42853.00	15505.00	2.76	67
15808	2	2003	2	0	5364.00	2715.00	1.98	67
15809	2	2003	2	1	25710.00	9326.00	2.76	67
15810	2	2003	2	2	31074.00	12041.00	2.58	67
15811	2	2004	1	0	15601.00	7805.00	2.00	67
15812	2	2004	1	1	28867.00	9562.00	3.02	67
15813	2	2004	1	2	44468.00	17367.00	2.56	67
15814	2	2004	2	0	720.00	400.00	1.80	67
15815	2	2004	2	1	22441.00	8412.00	2.67	67
15816	2	2004	2	2	23161.00	8812.00	2.63	67
15817	2	2005	1	0	17129.00	7803.00	2.20	67
15818	2	2005	1	1	30594.00	9132.00	3.35	67
15819	2	2005	1	2	47723.00	16935.00	2.82	67
15820	2	2005	2	0	92.00	92.00	1.00	67
15821	2	2005	2	1	21580.00	8152.00	2.65	67
15822	2	2005	2	2	21672.00	8244.00	2.63	67
15823	2	2006	1	0	18526.00	7640.00	2.42	67
15824	2	2006	1	1	32945.00	10295.00	3.20	67
15825	2	2006	1	2	51471.00	17935.00	2.87	67
15826	2	2006	2	0	1612.00	690.00	2.34	67
15827	2	2006	2	1	25303.00	8175.00	3.10	67
15828	2	2006	2	2	26915.00	8865.00	3.04	67
15829	2	2007	1	0	22312.00	7575.00	2.95	67
15830	2	2007	1	1	33857.00	10380.00	3.26	67
15831	2	2007	1	2	56169.00	17955.00	3.13	67
15832	2	2007	2	0	1730.00	620.00	2.79	67
15833	2	2007	2	1	24042.00	7672.00	3.13	67
15834	2	2007	2	2	25772.00	8292.00	3.11	67
15835	2	2008	1	0	17499.00	6934.00	2.52	67
15836	2	2008	1	1	25637.00	8482.00	3.02	67
15837	2	2008	1	2	43136.00	15416.00	2.80	67
15838	2	2008	2	0	3397.00	1450.00	2.34	67
15839	2	2008	2	1	28677.00	9995.00	2.87	67
15840	2	2008	2	2	32074.00	11445.00	2.80	67
15841	2	2009	1	0	20068.00	7724.00	2.60	67
15842	2	2009	1	1	27897.00	9575.00	2.91	67
15843	2	2009	1	2	47965.00	17299.00	2.77	67
15844	2	2009	2	0	3177.00	1340.00	2.37	67
15845	2	2009	2	1	28653.00	9083.00	3.15	67
15846	2	2009	2	2	31830.00	10423.00	3.05	67
15847	2	2010	1	0	16032.00	5700.00	2.81	67
15848	2	2010	1	1	22447.00	6643.00	3.38	67
15849	2	2010	1	2	38479.00	12343.00	3.12	67
15850	2	2010	2	0	1569.00	728.00	2.16	67
15851	2	2010	2	1	21823.00	7356.00	2.97	67
15852	2	2010	2	2	23392.00	8084.00	2.89	67
15853	2	2011	1	0	12583.00	5342.00	2.36	67
15854	2	2011	1	1	23328.00	7845.00	2.97	67
15855	2	2011	1	2	35911.00	13187.00	2.72	67
15856	2	2011	2	0	3512.00	1580.00	2.22	67
15857	2	2011	2	1	24756.00	8287.00	2.99	67
15858	2	2011	2	2	28268.00	9867.00	2.86	67
15859	2	2012	1	0	13188.00	5553.00	2.37	67
15860	2	2012	1	1	26360.00	8830.00	2.99	67
15861	2	2012	1	2	39548.00	14383.00	2.75	67
15862	2	2012	2	0	1611.00	750.00	2.15	67
15863	2	2012	2	1	23693.00	7468.00	3.17	67
15864	2	2012	2	2	25304.00	8218.00	3.08	67
15865	2	2013	1	0	14839.00	5660.00	2.62	67
15866	2	2013	1	1	26253.00	8370.00	3.14	67
15867	2	2013	1	2	41092.00	14030.00	2.93	67
15868	2	2013	2	0	2301.00	890.00	2.59	67
15869	2	2013	2	1	26328.00	8039.00	3.28	67
15870	2	2013	2	2	28629.00	8929.00	3.21	67
15871	2	2014	1	0	13081.00	5604.00	2.33	67
15872	2	2014	1	1	25670.00	7814.00	3.29	67
15873	2	2014	1	2	38751.00	13418.00	2.89	67
15874	2	2014	2	0	1899.00	840.00	2.26	67
15875	2	2014	2	1	23044.00	7835.00	2.94	67
15876	2	2014	2	2	24943.00	8675.00	2.88	67
15877	2	2015	1	0	14715.50	6141.00	2.40	67
15878	2	2015	1	1	26769.00	7910.00	3.38	67
15879	2	2015	1	2	41484.50	14051.00	2.95	67
15880	2	2015	2	0	1189.00	590.00	2.02	67
15881	2	2015	2	1	17902.00	6001.00	2.98	67
15882	2	2015	2	2	19091.00	6591.00	2.90	67
15883	2	2016	1	0	9151.00	4502.00	2.03	67
15884	2	2016	1	1	17573.00	6933.00	2.53	67
15885	2	2016	1	2	26724.00	11435.00	2.34	67
15886	2	2016	2	0	1485.00	660.00	2.25	67
15887	2	2016	2	1	21399.00	6774.00	3.16	67
15888	2	2016	2	2	22884.00	7434.00	3.08	67
15889	2	2017	1	0	11498.00	4403.00	2.61	67
15890	2	2017	1	1	22168.00	7420.00	2.99	67
15891	2	2017	1	2	33666.00	11823.00	2.85	67
15892	2	2017	2	0	2387.00	888.00	2.69	67
15893	2	2017	2	1	16506.00	4881.00	3.38	67
15894	2	2017	2	2	18893.00	5769.00	3.27	67
15895	2	2018	1	0	13267.80	4819.00	2.75	67
15896	2	2018	1	1	25659.00	7968.00	3.22	67
15897	2	2018	1	2	38926.80	12787.00	3.04	67
15898	2	2018	2	0	3141.34	1025.00	3.06	67
15899	2	2018	2	1	19866.15	5873.00	3.38	67
15900	2	2018	2	2	23007.49	6898.00	3.34	67
15901	2	2019	1	0	14809.00	4865.00	3.04	67
15902	2	2019	1	1	28373.00	8303.69	3.42	67
15903	2	2019	1	2	43182.00	13168.69	3.28	67
15904	2	2019	2	0	3263.20	1081.00	3.02	67
15905	2	2019	2	1	20565.00	6190.00	3.32	67
15906	2	2019	2	2	23828.20	7271.00	3.28	67
15907	2	2020	1	0	15922.16	4844.00	3.29	67
15908	2	2020	1	1	29450.15	8100.00	3.64	67
15909	2	2020	1	2	45372.31	12944.00	3.51	67
15910	2	2020	2	0	3269.19	1065.24	3.07	67
15911	2	2020	2	1	20854.60	6179.51	3.37	67
15912	2	2020	2	2	24123.79	7244.75	3.33	67
15913	2	1987	1	0	27895.00	15230.00	1.83	68
15914	2	1987	1	1	13625.00	6050.00	2.25	68
15915	2	1987	1	2	41520.00	21280.00	1.95	68
15916	2	1987	2	0	3641.00	2070.00	1.76	68
15917	2	1987	2	1	16364.00	5900.00	2.77	68
15918	2	1987	2	2	20005.00	7970.00	2.51	68
15919	2	1988	1	0	27025.00	13160.00	2.05	68
15920	2	1988	1	1	15656.00	6200.00	2.53	68
15921	2	1988	1	2	42681.00	19360.00	2.20	68
15922	2	1988	2	0	4240.00	2520.00	1.68	68
15923	2	1988	2	1	13019.00	5030.00	2.59	68
15924	2	1988	2	2	17259.00	7550.00	2.29	68
15925	2	1989	1	0	27490.00	15780.00	1.74	68
15926	2	1989	1	1	12532.00	6750.00	1.86	68
15927	2	1989	1	2	40022.00	22530.00	1.78	68
15928	2	1989	2	0	4230.00	2680.00	1.58	68
15929	2	1989	2	1	14685.00	4990.00	2.94	68
15930	2	1989	2	2	18915.00	7670.00	2.47	68
15931	2	1990	1	0	29234.00	14770.00	1.98	68
15932	2	1990	1	1	14692.00	7500.00	1.96	68
15933	2	1990	1	2	43926.00	22270.00	1.97	68
15934	2	1990	2	0	2842.00	2530.00	1.12	68
15935	2	1990	2	1	12317.00	5350.00	2.30	68
15936	2	1990	2	2	15159.00	7880.00	1.92	68
15937	2	1991	1	0	35059.00	15700.00	2.23	68
15938	2	1991	1	1	20581.00	7190.00	2.86	68
15939	2	1991	1	2	55640.00	22890.00	2.43	68
15940	2	1991	2	0	2758.00	1900.00	1.45	68
15941	2	1991	2	1	16113.00	6680.00	2.41	68
15942	2	1991	2	2	18871.00	8580.00	2.20	68
15943	2	1992	1	0	21814.00	12770.00	1.71	68
15944	2	1992	1	1	18118.00	6410.00	2.83	68
15945	2	1992	1	2	39932.00	19180.00	2.08	68
15946	2	1992	2	0	1222.00	1100.00	1.11	68
15947	2	1992	2	1	12385.00	5520.00	2.24	68
15948	2	1992	2	2	13607.00	6620.00	2.06	68
15949	2	1993	1	0	30359.00	13580.00	2.24	68
15950	2	1993	1	1	21094.00	7300.00	2.89	68
15951	2	1993	1	2	51453.00	20880.00	2.46	68
15952	2	1993	2	0	1928.00	1000.00	1.93	68
15953	2	1993	2	1	14277.00	5330.00	2.68	68
15954	2	1993	2	2	16205.00	6330.00	2.56	68
15955	2	1994	1	0	20405.00	13000.00	1.57	68
15956	2	1994	1	1	17570.00	7340.00	2.39	68
15957	2	1994	1	2	37975.00	20340.00	1.87	68
15958	2	1994	2	0	2318.00	1560.00	1.49	68
15959	2	1994	2	1	19944.00	7520.00	2.65	68
15960	2	1994	2	2	22262.00	9080.00	2.45	68
15961	2	1995	1	0	27545.00	15150.00	1.82	68
15962	2	1995	1	1	25456.00	9530.00	2.67	68
15963	2	1995	1	2	53001.00	24680.00	2.15	68
15964	2	1995	2	0	3205.00	1960.00	1.64	68
15965	2	1995	2	1	18144.00	6790.00	2.67	68
15966	2	1995	2	2	21349.00	8750.00	2.44	68
15967	2	1996	1	0	18204.00	10315.00	1.76	68
15968	2	1996	1	1	25784.00	10532.00	2.45	68
15969	2	1996	1	2	43988.00	20847.00	2.11	68
15970	2	1996	2	0	1885.00	1340.00	1.41	68
15971	2	1996	2	1	19891.00	7999.00	2.49	68
15972	2	1996	2	2	21776.00	9339.00	2.33	68
15973	2	1997	1	0	15297.00	9435.00	1.62	68
15974	2	1997	1	1	20571.00	8519.00	2.41	68
15975	2	1997	1	2	35868.00	17954.00	2.00	68
15976	2	1997	2	0	798.00	658.00	1.21	68
15977	2	1997	2	1	16764.00	7055.00	2.38	68
15978	2	1997	2	2	17562.00	7713.00	2.28	68
15979	2	1998	1	0	9601.00	6300.00	1.52	68
15980	2	1998	1	1	25390.00	9724.00	2.61	68
15981	2	1998	1	2	34991.00	16024.00	2.18	68
15982	2	1998	2	0	512.00	480.00	1.07	68
15983	2	1998	2	1	17634.00	8644.00	2.04	68
15984	2	1998	2	2	18146.00	9124.00	1.99	68
15985	2	1999	1	0	8395.00	5885.00	1.43	68
15986	2	1999	1	1	15618.00	7541.00	2.07	68
15987	2	1999	1	2	24013.00	13426.00	1.79	68
15988	2	1999	2	0	1863.00	1180.00	1.58	68
15989	2	1999	2	1	22350.00	8354.00	2.68	68
15990	2	1999	2	2	24213.00	9534.00	2.54	68
15991	2	2000	1	0	12765.00	5948.00	2.15	68
15992	2	2000	1	1	21393.00	8132.00	2.63	68
15993	2	2000	1	2	34158.00	14080.00	2.43	68
15994	2	2000	2	0	2031.00	1190.00	1.71	68
15995	2	2000	2	1	24164.00	8858.00	2.73	68
15996	2	2000	2	2	26195.00	10048.00	2.61	68
15997	2	2001	1	0	14857.00	6497.00	2.29	68
15998	2	2001	1	1	23973.00	8546.00	2.81	68
15999	2	2001	1	2	38830.00	15043.00	2.58	68
16000	2	2001	2	0	969.00	735.00	1.32	68
16001	2	2001	2	1	17119.00	6883.00	2.49	68
16002	2	2001	2	2	18088.00	7618.00	2.37	68
16003	2	2002	1	0	11950.00	5191.00	2.30	68
16004	2	2002	1	1	26384.00	9587.00	2.75	68
16005	2	2002	1	2	38334.00	14778.00	2.59	68
16006	2	2002	2	0	1089.00	865.00	1.26	68
16007	2	2002	2	1	17646.00	6651.00	2.65	68
16008	2	2002	2	2	18735.00	7516.00	2.49	68
16009	2	2003	1	0	14604.00	5661.00	2.58	68
16010	2	2003	1	1	27230.00	8860.00	3.07	68
16011	2	2003	1	2	41834.00	14521.00	2.88	68
16012	2	2003	2	0	1509.00	780.00	1.93	68
16013	2	2003	2	1	25233.00	7664.00	3.29	68
16014	2	2003	2	2	26742.00	8444.00	3.17	68
16015	2	2004	1	0	16458.00	5760.00	2.86	68
16016	2	2004	1	1	28041.00	8660.00	3.24	68
16017	2	2004	1	2	44499.00	14420.00	3.09	68
16018	2	2004	2	0	908.00	620.00	1.46	68
16019	2	2004	2	1	20562.00	7540.00	2.73	68
16020	2	2004	2	2	21470.00	8160.00	2.63	68
16021	2	2005	1	0	15670.00	5340.00	2.93	68
16022	2	2005	1	1	32162.00	8880.00	3.62	68
16023	2	2005	1	2	47832.00	14220.00	3.36	68
16024	2	2005	2	0	1630.00	620.00	2.63	68
16025	2	2005	2	1	29147.00	9000.00	3.24	68
16026	2	2005	2	2	30777.00	9620.00	3.20	68
16027	2	2006	1	0	15178.00	5238.00	2.90	68
16028	2	2006	1	1	33168.00	10040.00	3.30	68
16029	2	2006	1	2	48346.00	15278.00	3.16	68
16030	2	2006	2	0	2980.00	1060.00	2.81	68
16031	2	2006	2	1	33058.00	9788.00	3.38	68
16032	2	2006	2	2	36038.00	10848.00	3.32	68
16033	2	2007	1	0	17068.00	5300.00	3.22	68
16034	2	2007	1	1	39932.00	11040.00	3.62	68
16035	2	2007	1	2	57000.00	16340.00	3.49	68
16036	2	2007	2	0	1785.00	738.00	2.42	68
16037	2	2007	2	1	35912.00	10185.00	3.53	68
16038	2	2007	2	2	37697.00	10923.00	3.45	68
16039	2	2008	1	0	15501.00	5625.00	2.76	68
16040	2	2008	1	1	36277.00	10486.00	3.46	68
16041	2	2008	1	2	51778.00	16111.00	3.21	68
16042	2	2008	2	0	3808.00	1571.00	2.42	68
16043	2	2008	2	1	28438.00	9089.00	3.13	68
16044	2	2008	2	2	32246.00	10660.00	3.02	68
16045	2	2009	1	0	23153.00	7951.00	2.91	68
16046	2	2009	1	1	32275.00	9593.00	3.36	68
16047	2	2009	1	2	55428.00	17544.00	3.16	68
16048	2	2009	2	0	3942.00	1837.00	2.15	68
16049	2	2009	2	1	31158.00	9152.00	3.40	68
16050	2	2009	2	2	35100.00	10989.00	3.19	68
16051	2	2010	1	0	18177.00	6204.00	2.93	68
16052	2	2010	1	1	35714.00	10688.00	3.34	68
16053	2	2010	1	2	53891.00	16892.00	3.19	68
16054	2	2010	2	0	4801.00	1731.00	2.77	68
16055	2	2010	2	1	33196.00	9438.00	3.52	68
16056	2	2010	2	2	37997.00	11169.00	3.40	68
16057	2	2011	1	0	12266.00	4757.00	2.58	68
16058	2	2011	1	1	30632.00	9997.00	3.06	68
16059	2	2011	1	2	42898.00	14754.00	2.91	68
16060	2	2011	2	0	6395.00	2594.00	2.47	68
16061	2	2011	2	1	31087.00	9289.00	3.35	68
16062	2	2011	2	2	37482.00	11883.00	3.15	68
16063	2	2012	1	0	25143.00	9024.00	2.79	68
16064	2	2012	1	1	32554.00	9816.00	3.32	68
16065	2	2012	1	2	57697.00	18840.00	3.06	68
16066	2	2012	2	0	2540.00	1202.00	2.11	68
16067	2	2012	2	1	24313.00	7439.00	3.27	68
16068	2	2012	2	2	26853.00	8641.00	3.11	68
16069	2	2013	1	0	28607.00	9880.00	2.90	68
16070	2	2013	1	1	42574.00	12276.00	3.47	68
16071	2	2013	1	2	71181.00	22156.00	3.21	68
16072	2	2013	2	0	5338.00	2150.00	2.48	68
16073	2	2013	2	1	30066.00	9082.00	3.31	68
16074	2	2013	2	2	35404.00	11232.00	3.15	68
16075	2	2014	1	0	32652.00	10468.00	3.12	68
16076	2	2014	1	1	44236.00	12290.00	3.60	68
16077	2	2014	1	2	76888.00	22758.00	3.38	68
16078	2	2014	2	0	2121.00	829.00	2.56	68
16079	2	2014	2	1	33484.00	10114.00	3.31	68
16080	2	2014	2	2	35605.00	10943.00	3.25	68
16081	2	2015	1	0	30118.00	10403.00	2.90	68
16082	2	2015	1	1	41785.00	12333.00	3.39	68
16083	2	2015	1	2	71903.00	22736.00	3.16	68
16084	2	2015	2	0	1075.00	511.00	2.10	68
16085	2	2015	2	1	31905.00	9601.00	3.32	68
16086	2	2015	2	2	32980.00	10112.00	3.26	68
16087	2	2016	1	0	22732.00	7520.00	3.02	68
16088	2	2016	1	1	39404.00	12004.00	3.28	68
16089	2	2016	1	2	62136.00	19524.00	3.18	68
16090	2	2016	2	0	2386.00	922.00	2.59	68
16091	2	2016	2	1	32420.00	9903.00	3.27	68
16092	2	2016	2	2	34806.00	10825.00	3.22	68
16093	2	2017	1	0	26510.00	9490.00	2.79	68
16094	2	2017	1	1	32533.00	10491.00	3.10	68
16095	2	2017	1	2	59043.00	19981.00	2.95	68
16096	2	2017	2	0	4091.00	1499.00	2.73	68
16097	2	2017	2	1	31618.00	9761.00	3.24	68
16098	2	2017	2	2	35709.00	11260.00	3.17	68
16099	2	2018	1	0	24341.00	8613.00	2.83	68
16100	2	2018	1	1	42082.00	12512.00	3.36	68
16101	2	2018	1	2	66423.00	21125.00	3.14	68
16102	2	2018	2	0	1939.00	820.00	2.36	68
16103	2	2018	2	1	31554.20	10647.00	2.96	68
16104	2	2018	2	2	33493.20	11467.00	2.92	68
16105	2	2019	1	0	19640.60	7807.78	2.52	68
16106	2	2019	1	1	39721.40	12397.45	3.20	68
16107	2	2019	1	2	59362.00	20205.23	2.94	68
16108	2	2019	2	0	3390.11	1235.00	2.75	68
16109	2	2019	2	1	20564.19	6770.80	3.04	68
16110	2	2019	2	2	23954.30	8005.80	2.99	68
16111	2	2020	1	0	16174.75	5668.00	2.85	68
16112	2	2020	1	1	39692.23	12063.30	3.29	68
16113	2	2020	1	2	55866.98	17731.30	3.15	68
16114	2	2020	2	0	4231.70	1436.00	2.95	68
16115	2	2020	2	1	26931.34	7506.00	3.59	68
16116	2	2020	2	2	31163.04	8942.00	3.49	68
16117	2	1987	1	0	1235.00	940.00	1.31	69
16118	2	1987	1	1	51840.00	17030.00	3.04	69
16119	2	1987	1	2	53075.00	17970.00	2.95	69
16120	2	1987	2	0	52856.00	30380.00	1.74	69
16121	2	1987	2	1	134043.00	53290.00	2.52	69
16122	2	1987	2	2	186899.00	83670.00	2.23	69
16123	2	1988	1	0	1499.00	930.00	1.61	69
16124	2	1988	1	1	56569.00	19590.00	2.89	69
16125	2	1988	1	2	58068.00	20520.00	2.83	69
16126	2	1988	2	0	53203.00	30720.00	1.73	69
16127	2	1988	2	1	99560.00	44940.00	2.22	69
16128	2	1988	2	2	152763.00	75660.00	2.02	69
16129	2	1989	1	0	539.00	310.00	1.74	69
16130	2	1989	1	1	63892.00	19850.00	3.22	69
16131	2	1989	1	2	64431.00	20160.00	3.20	69
16132	2	1989	2	0	46833.00	20070.00	2.33	69
16133	2	1989	2	1	144852.00	59490.00	2.43	69
16134	2	1989	2	2	191685.00	79560.00	2.41	69
16135	2	1990	1	0	\N	\N	\N	69
16136	2	1990	1	1	65925.00	19190.00	3.44	69
16137	2	1990	1	2	65925.00	19190.00	3.44	69
16138	2	1990	2	0	57627.00	25050.00	2.30	69
16139	2	1990	2	1	148626.00	60860.00	2.44	69
16140	2	1990	2	2	206253.00	85910.00	2.40	69
16141	2	1991	1	0	346.00	130.00	2.66	69
16142	2	1991	1	1	65527.00	18790.00	3.49	69
16143	2	1991	1	2	65873.00	18920.00	3.48	69
16144	2	1991	2	0	65296.00	30390.00	2.15	69
16145	2	1991	2	1	117493.00	48680.00	2.41	69
16146	2	1991	2	2	182789.00	79070.00	2.31	69
16147	2	1992	1	0	\N	\N	\N	69
16148	2	1992	1	1	40597.00	14470.00	2.81	69
16149	2	1992	1	2	40597.00	14470.00	2.81	69
16150	2	1992	2	0	94825.00	34840.00	2.72	69
16151	2	1992	2	1	165111.00	43410.00	3.80	69
16152	2	1992	2	2	259936.00	78250.00	3.32	69
16153	2	1993	1	0	\N	\N	\N	69
16154	2	1993	1	1	47941.00	14270.00	3.36	69
16155	2	1993	1	2	47941.00	14270.00	3.36	69
16156	2	1993	2	0	126830.00	45390.00	2.79	69
16157	2	1993	2	1	88599.00	29760.00	2.98	69
16158	2	1993	2	2	215429.00	75150.00	2.87	69
16159	2	1994	1	0	1260.00	420.00	3.00	69
16160	2	1994	1	1	84639.00	25910.00	3.27	69
16161	2	1994	1	2	85899.00	26330.00	3.26	69
16162	2	1994	2	0	92980.00	35880.00	2.59	69
16163	2	1994	2	1	123327.00	36520.00	3.38	69
16164	2	1994	2	2	216307.00	72400.00	2.99	69
16165	2	1995	1	0	377.00	150.00	2.51	69
16166	2	1995	1	1	83051.00	23036.00	3.61	69
16167	2	1995	1	2	83428.00	23186.00	3.60	69
16168	2	1995	2	0	86659.00	30885.00	2.81	69
16169	2	1995	2	1	126047.00	43000.00	2.93	69
16170	2	1995	2	2	212706.00	73885.00	2.88	69
16171	2	1996	1	0	759.00	225.00	3.37	69
16172	2	1996	1	1	103079.00	24724.00	4.17	69
16173	2	1996	1	2	103838.00	24949.00	4.16	69
16174	2	1996	2	0	71799.00	24804.00	2.89	69
16175	2	1996	2	1	147781.00	45544.00	3.24	69
16176	2	1996	2	2	219580.00	70348.00	3.12	69
16177	2	1997	1	0	\N	\N	\N	69
16178	2	1997	1	1	118082.00	27905.00	4.23	69
16179	2	1997	1	2	118082.00	27905.00	4.23	69
16180	2	1997	2	0	88411.00	26338.00	3.36	69
16181	2	1997	2	1	182199.00	49082.00	3.71	69
16182	2	1997	2	2	270610.00	75420.00	3.59	69
16183	2	1998	1	0	172.00	60.00	2.87	69
16184	2	1998	1	1	89500.00	22574.00	3.96	69
16185	2	1998	1	2	89672.00	22634.00	3.96	69
16186	2	1998	2	0	47763.00	21258.00	2.25	69
16187	2	1998	2	1	125641.00	48310.00	2.60	69
16188	2	1998	2	2	173404.00	69568.00	2.49	69
16189	2	1999	1	0	1225.00	375.00	3.27	69
16190	2	1999	1	1	119648.00	28437.00	4.21	69
16191	2	1999	1	2	120873.00	28812.00	4.20	69
16192	2	1999	2	0	52592.00	18299.00	2.87	69
16193	2	1999	2	1	205308.00	51404.00	3.99	69
16194	2	1999	2	2	257900.00	69703.00	3.70	69
16195	2	2000	1	0	2352.00	735.00	3.20	69
16196	2	2000	1	1	129772.00	29922.00	4.34	69
16197	2	2000	1	2	132124.00	30657.00	4.31	69
16198	2	2000	2	0	47092.00	15540.00	3.03	69
16199	2	2000	2	1	204365.00	56367.00	3.63	69
16200	2	2000	2	2	251457.00	71907.00	3.50	69
16201	2	2001	1	0	699.00	215.00	3.25	69
16202	2	2001	1	1	120206.00	26061.00	4.61	69
16203	2	2001	1	2	120905.00	26276.00	4.60	69
16204	2	2001	2	0	53980.00	15655.00	3.45	69
16205	2	2001	2	1	252107.00	60815.00	4.15	69
16206	2	2001	2	2	306087.00	76470.00	4.00	69
16207	2	2002	1	0	650.00	200.00	3.25	69
16208	2	2002	1	1	122037.00	28200.00	4.33	69
16209	2	2002	1	2	122687.00	28400.00	4.32	69
16210	2	2002	2	0	41820.00	11957.00	3.50	69
16211	2	2002	2	1	267872.00	65943.00	4.06	69
16212	2	2002	2	2	309692.00	77900.00	3.98	69
16213	2	2003	1	0	\N	\N	\N	69
16214	2	2003	1	1	145329.00	32835.00	4.43	69
16215	2	2003	1	2	145329.00	32835.00	4.43	69
16216	2	2003	2	0	39112.00	11324.00	3.45	69
16217	2	2003	2	1	277783.00	68458.00	4.06	69
16218	2	2003	2	2	316895.00	79782.00	3.97	69
16219	2	2004	1	0	\N	\N	\N	69
16220	2	2004	1	1	162541.00	35746.00	4.55	69
16221	2	2004	1	2	162541.00	35746.00	4.55	69
16222	2	2004	2	0	41379.00	11238.00	3.68	69
16223	2	2004	2	1	276122.00	64660.00	4.27	69
16224	2	2004	2	2	317501.00	75898.00	4.18	69
16225	2	2005	1	0	\N	\N	\N	69
16226	2	2005	1	1	162554.00	34280.00	4.74	69
16227	2	2005	1	2	162554.00	34280.00	4.74	69
16228	2	2005	2	0	31304.00	9828.00	3.19	69
16229	2	2005	2	1	299556.00	69031.00	4.34	69
16230	2	2005	2	2	330860.00	78859.00	4.20	69
16231	2	2006	1	0	\N	\N	\N	69
16232	2	2006	1	1	137238.00	29939.00	4.58	69
16233	2	2006	1	2	137238.00	29939.00	4.58	69
16234	2	2006	2	0	34766.00	9479.00	3.67	69
16235	2	2006	2	1	306517.00	71718.00	4.27	69
16236	2	2006	2	2	341283.00	81197.00	4.20	69
16237	2	2007	1	0	\N	\N	\N	69
16238	2	2007	1	1	182928.00	38860.00	4.71	69
16239	2	2007	1	2	182928.00	38860.00	4.71	69
16240	2	2007	2	0	34525.00	9782.00	3.53	69
16241	2	2007	2	1	340490.00	77446.00	4.40	69
16242	2	2007	2	2	375015.00	87228.00	4.30	69
16243	2	2008	1	0	\N	\N	\N	69
16244	2	2008	1	1	184396.00	40766.00	4.52	69
16245	2	2008	1	2	184396.00	40766.00	4.52	69
16246	2	2008	2	0	36627.00	9653.00	3.79	69
16247	2	2008	2	1	329529.00	79240.00	4.16	69
16248	2	2008	2	2	366156.00	88893.00	4.12	69
16249	2	2009	1	0	\N	\N	\N	69
16250	2	2009	1	1	192936.00	43000.00	4.49	69
16251	2	2009	1	2	192936.00	43000.00	4.49	69
16252	2	2009	2	0	31082.00	10024.00	3.10	69
16253	2	2009	2	1	267215.00	76466.00	3.49	69
16254	2	2009	2	2	298297.00	86490.00	3.45	69
16255	2	2010	1	0	\N	\N	\N	69
16256	2	2010	1	1	206468.00	46138.00	4.48	69
16257	2	2010	1	2	206468.00	46138.00	4.48	69
16258	2	2010	2	0	34571.00	9071.00	3.81	69
16259	2	2010	2	1	321141.00	78215.00	4.11	69
16260	2	2010	2	2	355712.00	87286.00	4.08	69
16261	2	2011	1	0	540.00	166.00	3.25	69
16262	2	2011	1	1	212417.00	47805.00	4.44	69
16263	2	2011	1	2	212957.00	47971.00	4.44	69
16264	2	2011	2	0	27442.00	9074.00	3.02	69
16265	2	2011	2	1	210358.00	59689.00	3.52	69
16266	2	2011	2	2	237800.00	68763.00	3.46	69
16267	2	2012	1	0	715.00	169.00	4.23	69
16268	2	2012	1	1	228066.00	50309.00	4.53	69
16269	2	2012	1	2	228781.00	50478.00	4.53	69
16270	2	2012	2	0	35263.00	8721.00	4.04	69
16271	2	2012	2	1	285255.00	64056.00	4.45	69
16272	2	2012	2	2	320518.00	72777.00	4.40	69
16273	2	2013	1	0	588.00	150.00	3.92	69
16274	2	2013	1	1	249578.00	56590.00	4.41	69
16275	2	2013	1	2	250166.00	56740.00	4.41	69
16276	2	2013	2	0	46726.00	11500.00	4.06	69
16277	2	2013	2	1	288185.00	66624.00	4.33	69
16278	2	2013	2	2	334911.00	78124.00	4.29	69
16279	2	2014	1	0	614.00	162.00	3.79	69
16280	2	2014	1	1	270723.00	56171.00	4.82	69
16281	2	2014	1	2	271337.00	56333.00	4.82	69
16282	2	2014	2	0	46171.00	10453.00	4.42	69
16283	2	2014	2	1	321398.00	69659.00	4.61	69
16284	2	2014	2	2	367569.00	80112.00	4.59	69
16285	2	2015	1	0	1600.00	400.00	4.00	69
16286	2	2015	1	1	280211.00	53750.00	5.21	69
16287	2	2015	1	2	281811.00	54150.00	5.20	69
16288	2	2015	2	0	22670.00	10099.00	2.24	69
16289	2	2015	2	1	265614.00	69837.00	3.80	69
16290	2	2015	2	2	288284.00	79936.00	3.61	69
16291	2	2016	1	0	737.00	237.00	3.11	69
16292	2	2016	1	1	249182.00	55120.00	4.52	69
16293	2	2016	1	2	249919.00	55357.00	4.51	69
16294	2	2016	2	0	41280.00	10684.00	3.86	69
16295	2	2016	2	1	273793.00	67739.00	4.04	69
16296	2	2016	2	2	315073.00	78423.00	4.02	69
16297	2	2017	1	0	249.00	80.00	3.11	69
16298	2	2017	1	1	249665.00	54938.00	4.54	69
16299	2	2017	1	2	249914.00	55018.00	4.54	69
16300	2	2017	2	0	35334.00	9364.00	3.77	69
16301	2	2017	2	1	293765.00	70693.00	4.16	69
16302	2	2017	2	2	329099.00	80057.00	4.11	69
16303	2	2018	1	0	389.00	99.00	3.93	69
16304	2	2018	1	1	265056.00	55174.00	4.80	69
16305	2	2018	1	2	265445.00	55273.00	4.80	69
16306	2	2018	2	0	23247.00	6300.00	3.69	69
16307	2	2018	2	1	280169.95	69362.00	4.04	69
16308	2	2018	2	2	303416.95	75662.00	4.01	69
16309	2	2019	1	0	412.00	103.00	4.00	69
16310	2	2019	1	1	259729.00	57674.76	4.50	69
16311	2	2019	1	2	260141.00	57777.76	4.50	69
16312	2	2019	2	0	31862.00	8159.00	3.91	69
16313	2	2019	2	1	303460.00	72935.00	4.16	69
16314	2	2019	2	2	335322.00	81094.00	4.13	69
16315	2	2020	1	0	338.00	94.00	3.60	69
16316	2	2020	1	1	225044.95	54325.00	4.14	69
16317	2	2020	1	2	225382.95	54419.00	4.14	69
16318	2	2020	2	0	33436.00	8272.00	4.04	69
16319	2	2020	2	1	314518.00	74185.00	4.24	69
16320	2	2020	2	2	347954.00	82457.00	4.22	69
16321	1	1987	1	0	36530.00	35230.00	1.04	7
16322	1	1987	1	1	33780.00	17510.00	1.93	7
16323	1	1987	1	2	70310.00	52740.00	1.33	7
16324	1	1987	2	0	33530.00	29340.00	1.14	7
16325	1	1987	2	1	45995.00	22300.00	2.06	7
16326	1	1987	2	2	79525.00	51640.00	1.54	7
16327	1	1988	1	0	13952.00	20180.00	0.69	7
16328	1	1988	1	1	35954.00	18800.00	1.91	7
16329	1	1988	1	2	49906.00	38980.00	1.28	7
16330	1	1988	2	0	43799.00	34300.00	1.28	7
16331	1	1988	2	1	56938.00	23540.00	2.42	7
16332	1	1988	2	2	100737.00	57840.00	1.74	7
16333	1	1989	1	0	50180.00	41800.00	1.20	7
16334	1	1989	1	1	45567.00	24450.00	1.86	7
16335	1	1989	1	2	95747.00	66250.00	1.45	7
16336	1	1989	2	0	47297.00	39090.00	1.21	7
16337	1	1989	2	1	87880.00	34510.00	2.55	7
16338	1	1989	2	2	135177.00	73600.00	1.84	7
16339	1	1990	1	0	27397.00	29380.00	0.93	7
16340	1	1990	1	1	50075.00	22430.00	2.23	7
16341	1	1990	1	2	77472.00	51810.00	1.50	7
16342	1	1990	2	0	29897.00	27640.00	1.08	7
16343	1	1990	2	1	75571.00	34020.00	2.22	7
16344	1	1990	2	2	105468.00	61660.00	1.71	7
16345	1	1991	1	0	45189.00	37070.00	1.22	7
16346	1	1991	1	1	49898.00	22210.00	2.25	7
16347	1	1991	1	2	95087.00	59280.00	1.60	7
16348	1	1991	2	0	31714.00	31340.00	1.01	7
16349	1	1991	2	1	80899.00	33760.00	2.40	7
16350	1	1991	2	2	112613.00	65100.00	1.73	7
16351	1	1992	1	0	17940.00	22920.00	0.78	7
16352	1	1992	1	1	51566.00	22390.00	2.30	7
16353	1	1992	1	2	69506.00	45310.00	1.53	7
16354	1	1992	2	0	24192.00	21340.00	1.13	7
16355	1	1992	2	1	69995.00	29060.00	2.41	7
16356	1	1992	2	2	94187.00	50400.00	1.87	7
16357	1	1993	1	0	42533.00	35830.00	1.19	7
16358	1	1993	1	1	51177.00	21330.00	2.40	7
16359	1	1993	1	2	93710.00	57160.00	1.64	7
16360	1	1993	2	0	52055.00	32810.00	1.59	7
16361	1	1993	2	1	52954.00	19180.00	2.76	7
16362	1	1993	2	2	105009.00	51990.00	2.02	7
16363	1	1994	1	0	52474.00	36940.00	1.42	7
16364	1	1994	1	1	54000.00	19610.00	2.75	7
16365	1	1994	1	2	106474.00	56550.00	1.88	7
16366	1	1994	2	0	51910.00	33830.00	1.53	7
16367	1	1994	2	1	50067.00	18140.00	2.76	7
16368	1	1994	2	2	101977.00	51970.00	1.96	7
16369	1	1995	1	0	53897.00	35905.00	1.50	7
16370	1	1995	1	1	59348.00	20675.00	2.87	7
16371	1	1995	1	2	113245.00	56580.00	2.00	7
16372	1	1995	2	0	61046.00	36455.00	1.67	7
16373	1	1995	2	1	56468.00	19595.00	2.88	7
16374	1	1995	2	2	117514.00	56050.00	2.10	7
16375	1	1996	1	0	59963.00	37235.00	1.61	7
16376	1	1996	1	1	55466.00	18490.00	3.00	7
16377	1	1996	1	2	115429.00	55725.00	2.07	7
16378	1	1996	2	0	51184.00	30332.00	1.69	7
16379	1	1996	2	1	65454.00	22020.00	2.97	7
16380	1	1996	2	2	116638.00	52352.00	2.23	7
16381	1	1997	1	0	58089.00	33864.00	1.72	7
16382	1	1997	1	1	61790.00	19990.00	3.09	7
16383	1	1997	1	2	119879.00	53854.00	2.23	7
16384	1	1997	2	0	48087.00	29102.00	1.65	7
16385	1	1997	2	1	68934.00	22785.00	3.03	7
16386	1	1997	2	2	117021.00	51887.00	2.26	7
16387	1	1998	1	0	7301.00	7062.00	1.03	7
16388	1	1998	1	1	37079.00	14914.00	2.49	7
16389	1	1998	1	2	44380.00	21976.00	2.02	7
16390	1	1998	2	0	22506.00	13905.00	1.62	7
16391	1	1998	2	1	49557.00	16788.00	2.95	7
16392	1	1998	2	2	72063.00	30693.00	2.35	7
16393	1	1999	1	0	46150.00	26750.00	1.73	7
16394	1	1999	1	1	58065.00	20875.00	2.78	7
16395	1	1999	1	2	104215.00	47625.00	2.19	7
16396	1	1999	2	0	45856.00	28542.00	1.61	7
16397	1	1999	2	1	58293.00	21255.00	2.74	7
16398	1	1999	2	2	104149.00	49797.00	2.09	7
16399	1	2000	1	0	46983.00	31145.00	1.51	7
16400	1	2000	1	1	55648.00	20395.00	2.73	7
16401	1	2000	1	2	102631.00	51540.00	1.99	7
16402	1	2000	2	0	44685.00	26591.00	1.68	7
16403	1	2000	2	1	67876.00	23062.00	2.94	7
16404	1	2000	2	2	112561.00	49653.00	2.27	7
16405	1	2001	1	0	46476.00	29615.00	1.57	7
16406	1	2001	1	1	63275.00	21586.00	2.93	7
16407	1	2001	1	2	109751.00	51201.00	2.14	7
16408	1	2001	2	0	40668.00	22745.00	1.79	7
16409	1	2001	2	1	74773.00	24526.00	3.05	7
16410	1	2001	2	2	115441.00	47271.00	2.44	7
16411	1	2002	1	0	49321.00	32438.00	1.52	7
16412	1	2002	1	1	60868.00	19841.00	3.07	7
16413	1	2002	1	2	110189.00	52279.00	2.11	7
16414	1	2002	2	0	38466.00	21830.00	1.76	7
16415	1	2002	2	1	70069.00	22409.00	3.13	7
16416	1	2002	2	2	108535.00	44239.00	2.45	7
16417	1	2003	1	0	10093.00	8360.00	1.21	7
16418	1	2003	1	1	63313.00	22469.00	2.82	7
16419	1	2003	1	2	73406.00	30829.00	2.38	7
16420	1	2003	2	0	39889.00	24302.00	1.64	7
16421	1	2003	2	1	79992.00	24767.00	3.23	7
16422	1	2003	2	2	119881.00	49069.00	2.44	7
16423	1	2004	1	0	24542.00	15396.00	1.59	7
16424	1	2004	1	1	71015.00	22309.00	3.18	7
16425	1	2004	1	2	95557.00	37705.00	2.53	7
16426	1	2004	2	0	49962.00	25492.00	1.96	7
16427	1	2004	2	1	83377.00	26239.00	3.18	7
16428	1	2004	2	2	133339.00	51731.00	2.58	7
16429	1	2005	1	0	21465.00	12895.00	1.66	7
16430	1	2005	1	1	63485.00	20798.00	3.05	7
16431	1	2005	1	2	84950.00	33693.00	2.52	7
16432	1	2005	2	0	42858.00	22540.00	1.90	7
16433	1	2005	2	1	81030.00	25617.00	3.16	7
16434	1	2005	2	2	123888.00	48157.00	2.57	7
16435	1	2006	1	0	41531.00	25944.00	1.60	7
16436	1	2006	1	1	73854.00	23539.00	3.14	7
16437	1	2006	1	2	115385.00	49483.00	2.33	7
16438	1	2006	2	0	46096.00	24067.00	1.92	7
16439	1	2006	2	1	83650.00	25934.00	3.23	7
16440	1	2006	2	2	129746.00	50001.00	2.59	7
16441	1	2007	1	0	25999.00	20223.00	1.29	7
16442	1	2007	1	1	67972.00	23885.00	2.85	7
16443	1	2007	1	2	93971.00	44108.00	2.13	7
16444	1	2007	2	0	58635.00	25666.00	2.28	7
16445	1	2007	2	1	99196.00	27733.00	3.58	7
16446	1	2007	2	2	157831.00	53399.00	2.96	7
16447	1	2008	1	0	58405.00	24770.00	2.36	7
16448	1	2008	1	1	94159.00	27112.00	3.47	7
16449	1	2008	1	2	152564.00	51882.00	2.94	7
16450	1	2008	2	0	61157.00	25597.00	2.39	7
16451	1	2008	2	1	98080.00	27675.00	3.54	7
16452	1	2008	2	2	159237.00	53272.00	2.99	7
16453	1	2009	1	0	53994.00	23116.00	2.34	7
16454	1	2009	1	1	82355.00	25213.00	3.27	7
16455	1	2009	1	2	136349.00	48329.00	2.82	7
16456	1	2009	2	0	52766.00	25728.00	2.05	7
16457	1	2009	2	1	87703.00	28870.00	3.04	7
16458	1	2009	2	2	140469.00	54598.00	2.57	7
16459	1	2010	1	0	43169.00	22005.00	1.96	7
16460	1	2010	1	1	74966.00	26753.00	2.80	7
16461	1	2010	1	2	118135.00	48758.00	2.42	7
16462	1	2010	2	0	51482.00	22405.00	2.30	7
16463	1	2010	2	1	100832.00	30712.00	3.28	7
16464	1	2010	2	2	152314.00	53117.00	2.87	7
16465	1	2011	1	0	49105.00	22554.00	2.18	7
16466	1	2011	1	1	86467.00	27663.00	3.13	7
16467	1	2011	1	2	135572.00	50217.00	2.70	7
16468	1	2011	2	0	67916.00	24591.00	2.76	7
16469	1	2011	2	1	119374.00	32016.00	3.73	7
16470	1	2011	2	2	187290.00	56607.00	3.31	7
16471	1	2012	1	0	53810.00	22196.00	2.42	7
16472	1	2012	1	1	90335.00	28263.00	3.20	7
16473	1	2012	1	2	144145.00	50459.00	2.86	7
16474	1	2012	2	0	64384.00	23842.00	2.70	7
16475	1	2012	2	1	118591.00	31496.00	3.77	7
16476	1	2012	2	2	182975.00	55338.00	3.31	7
16477	1	2013	1	0	58324.00	22274.00	2.62	7
16478	1	2013	1	1	98005.00	28426.00	3.45	7
16479	1	2013	1	2	156329.00	50700.00	3.08	7
16480	1	2013	2	0	66283.00	23412.00	2.83	7
16481	1	2013	2	1	125085.00	32079.00	3.90	7
16482	1	2013	2	2	191368.00	55491.00	3.45	7
16483	1	2014	1	0	56857.00	21865.00	2.60	7
16484	1	2014	1	1	93588.00	28074.00	3.33	7
16485	1	2014	1	2	150445.00	49939.00	3.01	7
16486	1	2014	2	0	66899.00	23202.00	2.88	7
16487	1	2014	2	1	121478.00	31147.00	3.90	7
16488	1	2014	2	2	188377.00	54349.00	3.47	7
16489	1	2015	1	0	53373.00	21397.00	2.49	7
16490	1	2015	1	1	91846.00	27936.00	3.29	7
16491	1	2015	1	2	145219.00	49333.00	2.94	7
16492	1	2015	2	0	65655.00	21972.00	2.99	7
16493	1	2015	2	1	125320.00	31122.00	4.03	7
16494	1	2015	2	2	190975.00	53094.00	3.60	7
16495	1	2016	1	0	25786.00	14207.00	1.82	7
16496	1	2016	1	1	74978.00	26827.00	2.79	7
16497	1	2016	1	2	100764.00	41034.00	2.46	7
16498	1	2016	2	0	40172.00	14189.00	2.83	7
16499	1	2016	2	1	91046.00	24930.00	3.65	7
16500	1	2016	2	2	131218.00	39119.00	3.35	7
16501	1	2017	1	0	49797.00	18230.00	2.73	7
16502	1	2017	1	1	99583.00	30127.00	3.31	7
16503	1	2017	1	2	149380.00	48357.00	3.09	7
16504	1	2017	2	0	58446.00	21084.00	2.77	7
16505	1	2017	2	1	117383.00	31389.00	3.74	7
16506	1	2017	2	2	175829.00	52473.00	3.35	7
16507	1	2018	1	0	47940.00	16500.00	2.91	7
16508	1	2018	1	1	110031.00	31989.00	3.44	7
16509	1	2018	1	2	157971.00	48489.00	3.26	7
16510	1	2018	2	0	51801.00	19789.00	2.62	7
16511	1	2018	2	1	99687.00	29341.00	3.40	7
16512	1	2018	2	2	151488.00	49130.00	3.08	7
16513	1	2019	1	0	31292.00	15847.00	1.97	7
16514	1	2019	1	1	86045.00	30191.00	2.85	7
16515	1	2019	1	2	117337.00	46038.00	2.55	7
16516	1	2019	2	0	35020.50	14019.00	2.50	7
16517	1	2019	2	1	70729.00	22035.00	3.21	7
16518	1	2019	2	2	105749.50	36054.00	2.93	7
16519	1	2020	1	0	22251.08	11822.00	1.88	7
16520	1	2020	1	1	80915.70	28260.00	2.86	7
16521	1	2020	1	2	103166.78	40082.00	2.57	7
16522	1	2020	2	0	56094.00	20209.00	2.78	7
16523	1	2020	2	1	101263.00	30173.00	3.36	7
16524	1	2020	2	2	157357.00	50382.00	3.12	7
16525	2	1987	1	0	440.00	430.00	1.02	7
16526	2	1987	1	1	2095.00	1300.00	1.61	7
16527	2	1987	1	2	2535.00	1730.00	1.47	7
16528	2	1987	2	0	2115.00	2030.00	1.04	7
16529	2	1987	2	1	1585.00	1600.00	0.99	7
16530	2	1987	2	2	3700.00	3630.00	1.02	7
16531	2	1988	1	0	358.00	280.00	1.28	7
16532	2	1988	1	1	1118.00	780.00	1.43	7
16533	2	1988	1	2	1476.00	1060.00	1.39	7
16534	2	1988	2	0	1444.00	1370.00	1.05	7
16535	2	1988	2	1	1731.00	1350.00	1.28	7
16536	2	1988	2	2	3175.00	2720.00	1.17	7
16537	2	1989	1	0	1692.00	1540.00	1.10	7
16538	2	1989	1	1	740.00	530.00	1.40	7
16539	2	1989	1	2	2432.00	2070.00	1.17	7
16540	2	1989	2	0	2224.00	2060.00	1.08	7
16541	2	1989	2	1	1948.00	1640.00	1.19	7
16542	2	1989	2	2	4172.00	3700.00	1.13	7
16543	2	1990	1	0	469.00	440.00	1.07	7
16544	2	1990	1	1	1243.00	760.00	1.64	7
16545	2	1990	1	2	1712.00	1200.00	1.43	7
16546	2	1990	2	0	2990.00	2320.00	1.29	7
16547	2	1990	2	1	2921.00	1570.00	1.86	7
16548	2	1990	2	2	5911.00	3890.00	1.52	7
16549	2	1991	1	0	494.00	370.00	1.34	7
16550	2	1991	1	1	1511.00	910.00	1.66	7
16551	2	1991	1	2	2005.00	1280.00	1.57	7
16552	2	1991	2	0	1033.00	830.00	1.24	7
16553	2	1991	2	1	3499.00	1750.00	2.00	7
16554	2	1991	2	2	4532.00	2580.00	1.76	7
16555	2	1992	1	0	201.00	310.00	0.65	7
16556	2	1992	1	1	866.00	660.00	1.31	7
16557	2	1992	1	2	1067.00	970.00	1.10	7
16558	2	1992	2	0	1591.00	1240.00	1.28	7
16559	2	1992	2	1	2490.00	1480.00	1.68	7
16560	2	1992	2	2	4081.00	2720.00	1.50	7
16561	2	1993	1	0	392.00	400.00	0.98	7
16562	2	1993	1	1	1079.00	630.00	1.71	7
16563	2	1993	1	2	1471.00	1030.00	1.43	7
16564	2	1993	2	0	481.00	410.00	1.17	7
16565	2	1993	2	1	1079.00	360.00	3.00	7
16566	2	1993	2	2	1560.00	770.00	2.03	7
16567	2	1994	1	0	432.00	390.00	1.11	7
16568	2	1994	1	1	854.00	280.00	3.05	7
16569	2	1994	1	2	1286.00	670.00	1.92	7
16570	2	1994	2	0	577.00	400.00	1.44	7
16571	2	1994	2	1	977.00	300.00	3.26	7
16572	2	1994	2	2	1554.00	700.00	2.22	7
16573	2	1995	1	0	334.00	360.00	0.93	7
16574	2	1995	1	1	650.00	260.00	2.50	7
16575	2	1995	1	2	984.00	620.00	1.59	7
16576	2	1995	2	0	1033.00	454.00	2.28	7
16577	2	1995	2	1	636.00	270.00	2.36	7
16578	2	1995	2	2	1669.00	724.00	2.31	7
16579	2	1996	1	0	811.00	583.00	1.39	7
16580	2	1996	1	1	945.00	300.00	3.15	7
16581	2	1996	1	2	1756.00	883.00	1.99	7
16582	2	1996	2	0	1656.00	784.00	2.11	7
16583	2	1996	2	1	951.00	295.00	3.22	7
16584	2	1996	2	2	2607.00	1079.00	2.42	7
16585	2	1997	1	0	1397.00	602.00	2.32	7
16586	2	1997	1	1	944.00	300.00	3.15	7
16587	2	1997	1	2	2341.00	902.00	2.60	7
16588	2	1997	2	0	790.00	500.00	1.58	7
16589	2	1997	2	1	624.00	230.00	2.71	7
16590	2	1997	2	2	1414.00	730.00	1.94	7
16591	2	1998	1	0	633.00	450.00	1.41	7
16592	2	1998	1	1	297.00	120.00	2.48	7
16593	2	1998	1	2	930.00	570.00	1.63	7
16594	2	1998	2	0	1923.00	1152.00	1.67	7
16595	2	1998	2	1	288.00	137.00	2.10	7
16596	2	1998	2	2	2211.00	1289.00	1.72	7
16597	2	1999	1	0	1176.00	661.00	1.78	7
16598	2	1999	1	1	628.00	235.00	2.67	7
16599	2	1999	1	2	1804.00	896.00	2.01	7
16600	2	1999	2	0	1503.00	808.00	1.86	7
16601	2	1999	2	1	675.00	225.00	3.00	7
16602	2	1999	2	2	2178.00	1033.00	2.11	7
16603	2	2000	1	0	833.00	511.00	1.63	7
16604	2	2000	1	1	619.00	215.00	2.88	7
16605	2	2000	1	2	1452.00	726.00	2.00	7
16606	2	2000	2	0	2155.00	1336.00	1.61	7
16607	2	2000	2	1	722.00	240.00	3.01	7
16608	2	2000	2	2	2877.00	1576.00	1.83	7
16609	2	2001	1	0	716.00	294.00	2.44	7
16610	2	2001	1	1	647.00	233.00	2.78	7
16611	2	2001	1	2	1363.00	527.00	2.59	7
16612	2	2001	2	0	2130.00	1200.00	1.78	7
16613	2	2001	2	1	645.00	215.00	3.00	7
16614	2	2001	2	2	2775.00	1415.00	1.96	7
16615	2	2002	1	0	574.00	269.00	2.13	7
16616	2	2002	1	1	594.00	205.00	2.90	7
16617	2	2002	1	2	1168.00	474.00	2.46	7
16618	2	2002	2	0	1595.00	801.00	1.99	7
16619	2	2002	2	1	692.00	212.00	3.26	7
16620	2	2002	2	2	2287.00	1013.00	2.26	7
16621	2	2003	1	0	371.00	304.00	1.22	7
16622	2	2003	1	1	562.00	200.00	2.81	7
16623	2	2003	1	2	933.00	504.00	1.85	7
16624	2	2003	2	0	1472.00	709.00	2.08	7
16625	2	2003	2	1	540.00	180.00	3.00	7
16626	2	2003	2	2	2012.00	889.00	2.26	7
16627	2	2004	1	0	1199.00	594.00	2.02	7
16628	2	2004	1	1	694.00	250.00	2.78	7
16629	2	2004	1	2	1893.00	844.00	2.24	7
16630	2	2004	2	0	1088.00	456.00	2.39	7
16631	2	2004	2	1	730.00	210.00	3.48	7
16632	2	2004	2	2	1818.00	666.00	2.73	7
16633	2	2005	1	0	889.00	381.00	2.33	7
16634	2	2005	1	1	928.00	300.00	3.09	7
16635	2	2005	1	2	1817.00	681.00	2.67	7
16636	2	2005	2	0	1118.00	454.00	2.46	7
16637	2	2005	2	1	933.00	300.00	3.11	7
16638	2	2005	2	2	2051.00	754.00	2.72	7
16639	2	2006	1	0	480.00	294.00	1.63	7
16640	2	2006	1	1	812.00	265.00	3.06	7
16641	2	2006	1	2	1292.00	559.00	2.31	7
16642	2	2006	2	0	926.00	381.00	2.43	7
16643	2	2006	2	1	1020.00	300.00	3.40	7
16644	2	2006	2	2	1946.00	681.00	2.86	7
16645	2	2007	1	0	628.00	306.00	2.05	7
16646	2	2007	1	1	801.00	265.00	3.02	7
16647	2	2007	1	2	1429.00	571.00	2.50	7
16648	2	2007	2	0	700.00	428.00	1.64	7
16649	2	2007	2	1	847.00	271.00	3.13	7
16650	2	2007	2	2	1547.00	699.00	2.21	7
16651	2	2008	1	0	836.00	512.00	1.63	7
16652	2	2008	1	1	1093.00	325.00	3.36	7
16653	2	2008	1	2	1929.00	837.00	2.30	7
16654	2	2008	2	0	1086.00	518.00	2.10	7
16655	2	2008	2	1	1442.00	495.00	2.91	7
16656	2	2008	2	2	2528.00	1013.00	2.50	7
16657	2	2009	1	0	573.00	323.00	1.77	7
16658	2	2009	1	1	1203.00	398.00	3.02	7
16659	2	2009	1	2	1776.00	721.00	2.46	7
16660	2	2009	2	0	546.00	295.00	1.85	7
16661	2	2009	2	1	981.00	314.00	3.12	7
16662	2	2009	2	2	1527.00	609.00	2.51	7
16663	2	2010	1	0	368.00	280.00	1.31	7
16664	2	2010	1	1	1429.00	698.00	2.05	7
16665	2	2010	1	2	1797.00	978.00	1.84	7
16666	2	2010	2	0	1352.00	505.00	2.68	7
16667	2	2010	2	1	1591.00	405.00	3.93	7
16668	2	2010	2	2	2943.00	910.00	3.23	7
16669	2	2011	1	0	193.00	80.00	2.41	7
16670	2	2011	1	1	1876.00	585.00	3.21	7
16671	2	2011	1	2	2069.00	665.00	3.11	7
16672	2	2011	2	0	1256.00	473.00	2.66	7
16673	2	2011	2	1	921.00	315.00	2.92	7
16674	2	2011	2	2	2177.00	788.00	2.76	7
16675	2	2012	1	0	576.00	285.00	2.02	7
16676	2	2012	1	1	1436.00	507.00	2.83	7
16677	2	2012	1	2	2012.00	792.00	2.54	7
16678	2	2012	2	0	394.00	180.00	2.19	7
16679	2	2012	2	1	1710.00	575.00	2.97	7
16680	2	2012	2	2	2104.00	755.00	2.79	7
16681	2	2013	1	0	222.00	84.00	2.64	7
16682	2	2013	1	1	3161.00	1077.00	2.94	7
16683	2	2013	1	2	3383.00	1161.00	2.91	7
16684	2	2013	2	0	167.00	76.00	2.20	7
16685	2	2013	2	1	1628.00	580.00	2.81	7
16686	2	2013	2	2	1795.00	656.00	2.74	7
16687	2	2014	1	0	132.00	84.00	1.57	7
16688	2	2014	1	1	1324.00	607.00	2.18	7
16689	2	2014	1	2	1456.00	691.00	2.11	7
16690	2	2014	2	0	270.00	116.00	2.33	7
16691	2	2014	2	1	2073.00	739.00	2.81	7
16692	2	2014	2	2	2343.00	855.00	2.74	7
16693	2	2015	1	0	97.00	72.00	1.35	7
16694	2	2015	1	1	916.00	428.00	2.14	7
16695	2	2015	1	2	1013.00	500.00	2.03	7
16696	2	2015	2	0	253.00	138.00	1.83	7
16697	2	2015	2	1	1444.00	563.00	2.56	7
16698	2	2015	2	2	1697.00	701.00	2.42	7
16699	2	2016	1	0	18.00	48.00	0.38	7
16700	2	2016	1	1	882.40	496.00	1.78	7
16701	2	2016	1	2	900.40	544.00	1.66	7
16702	2	2016	2	0	136.00	74.00	1.84	7
16703	2	2016	2	1	1120.00	452.00	2.48	7
16704	2	2016	2	2	1256.00	526.00	2.39	7
16705	2	2017	1	0	125.00	85.00	1.47	7
16706	2	2017	1	1	663.00	371.00	1.79	7
16707	2	2017	1	2	788.00	456.00	1.73	7
16708	2	2017	2	0	118.00	74.00	1.59	7
16709	2	2017	2	1	783.00	225.00	3.48	7
16710	2	2017	2	2	901.00	299.00	3.01	7
16711	2	2018	1	0	100.00	100.00	1.00	7
16712	2	2018	1	1	1174.00	454.00	2.59	7
16713	2	2018	1	2	1274.00	554.00	2.30	7
16714	2	2018	2	0	191.86	130.00	1.48	7
16715	2	2018	2	1	565.20	315.00	1.79	7
16716	2	2018	2	2	757.06	445.00	1.70	7
16717	2	2019	1	0	7.00	10.00	0.70	7
16718	2	2019	1	1	248.50	190.00	1.31	7
16719	2	2019	1	2	255.50	200.00	1.28	7
16720	2	2019	2	0	158.91	95.00	1.67	7
16721	2	2019	2	1	697.00	270.00	2.58	7
16722	2	2019	2	2	855.91	365.00	2.34	7
16723	2	2020	1	0	42.32	31.00	1.37	7
16724	2	2020	1	1	210.18	92.00	2.28	7
16725	2	2020	1	2	252.50	123.00	2.05	7
16726	2	2020	2	0	11.00	8.00	1.38	7
16727	2	2020	2	1	10.00	6.00	1.67	7
16728	2	2020	2	2	21.00	14.00	1.50	7
16729	2	1987	1	0	\N	\N	\N	70
16730	2	1987	1	1	\N	\N	\N	70
16731	2	1987	1	2	\N	\N	\N	70
16732	2	1987	2	0	3200.00	2040.00	1.57	70
16733	2	1987	2	1	\N	\N	\N	70
16734	2	1987	2	2	3200.00	2040.00	1.57	70
16735	2	1988	1	0	\N	\N	\N	70
16736	2	1988	1	1	\N	\N	\N	70
16737	2	1988	1	2	\N	\N	\N	70
16738	2	1988	2	0	3504.00	2330.00	1.50	70
16739	2	1988	2	1	\N	\N	\N	70
16740	2	1988	2	2	3504.00	2330.00	1.50	70
16741	2	1989	1	0	\N	\N	\N	70
16742	2	1989	1	1	\N	\N	\N	70
16743	2	1989	1	2	\N	\N	\N	70
16744	2	1989	2	0	3504.00	2330.00	1.50	70
16745	2	1989	2	1	\N	\N	\N	70
16746	2	1989	2	2	3504.00	2330.00	1.50	70
16747	2	1990	1	0	\N	\N	\N	70
16748	2	1990	1	1	\N	\N	\N	70
16749	2	1990	1	2	\N	\N	\N	70
16750	2	1990	2	0	3504.00	2330.00	1.50	70
16751	2	1990	2	1	\N	\N	\N	70
16752	2	1990	2	2	3504.00	2330.00	1.50	70
16753	2	1991	1	0	\N	\N	\N	70
16754	2	1991	1	1	\N	\N	\N	70
16755	2	1991	1	2	\N	\N	\N	70
16756	2	1991	2	0	3504.00	2330.00	1.50	70
16757	2	1991	2	1	\N	\N	\N	70
16758	2	1991	2	2	3504.00	2330.00	1.50	70
16759	2	1992	1	0	\N	\N	\N	70
16760	2	1992	1	1	\N	\N	\N	70
16761	2	1992	1	2	\N	\N	\N	70
16762	2	1992	2	0	3504.00	2330.00	1.50	70
16763	2	1992	2	1	\N	\N	\N	70
16764	2	1992	2	2	3504.00	2330.00	1.50	70
16765	2	1993	1	0	\N	\N	\N	70
16766	2	1993	1	1	\N	\N	\N	70
16767	2	1993	1	2	\N	\N	\N	70
16768	2	1993	2	0	3504.00	2330.00	1.50	70
16769	2	1993	2	1	\N	\N	\N	70
16770	2	1993	2	2	3504.00	2330.00	1.50	70
16771	2	1994	1	0	\N	\N	\N	70
16772	2	1994	1	1	\N	\N	\N	70
16773	2	1994	1	2	\N	\N	\N	70
16774	2	1994	2	0	4042.00	2670.00	1.51	70
16775	2	1994	2	1	\N	\N	\N	70
16776	2	1994	2	2	4042.00	2670.00	1.51	70
16777	2	1995	1	0	\N	\N	\N	70
16778	2	1995	1	1	\N	\N	\N	70
16779	2	1995	1	2	\N	\N	\N	70
16780	2	1995	2	0	1916.00	1605.00	1.19	70
16781	2	1995	2	1	\N	\N	\N	70
16782	2	1995	2	2	1916.00	1605.00	1.19	70
16783	2	1996	1	0	\N	\N	\N	70
16784	2	1996	1	1	\N	\N	\N	70
16785	2	1996	1	2	\N	\N	\N	70
16786	2	1996	2	0	2622.00	1731.00	1.51	70
16787	2	1996	2	1	\N	\N	\N	70
16788	2	1996	2	2	2622.00	1731.00	1.51	70
16789	2	1997	1	0	\N	\N	\N	70
16790	2	1997	1	1	\N	\N	\N	70
16791	2	1997	1	2	\N	\N	\N	70
16792	2	1997	2	0	2903.00	1840.00	1.58	70
16793	2	1997	2	1	\N	\N	\N	70
16794	2	1997	2	2	2903.00	1840.00	1.58	70
16795	2	1998	1	0	\N	\N	\N	70
16796	2	1998	1	1	\N	\N	\N	70
16797	2	1998	1	2	\N	\N	\N	70
16798	2	1998	2	0	2406.00	1602.00	1.50	70
16799	2	1998	2	1	\N	\N	\N	70
16800	2	1998	2	2	2406.00	1602.00	1.50	70
16801	2	1999	1	0	\N	\N	\N	70
16802	2	1999	1	1	\N	\N	\N	70
16803	2	1999	1	2	\N	\N	\N	70
16804	2	1999	2	0	2820.00	1780.00	1.58	70
16805	2	1999	2	1	\N	\N	\N	70
16806	2	1999	2	2	2820.00	1780.00	1.58	70
16807	2	2000	1	0	\N	\N	\N	70
16808	2	2000	1	1	\N	\N	\N	70
16809	2	2000	1	2	\N	\N	\N	70
16810	2	2000	2	0	2286.00	1466.00	1.56	70
16811	2	2000	2	1	\N	\N	\N	70
16812	2	2000	2	2	2286.00	1466.00	1.56	70
16813	2	2001	1	0	\N	\N	\N	70
16814	2	2001	1	1	\N	\N	\N	70
16815	2	2001	1	2	\N	\N	\N	70
16816	2	2001	2	0	1930.00	1235.00	1.56	70
16817	2	2001	2	1	\N	\N	\N	70
16818	2	2001	2	2	1930.00	1235.00	1.56	70
16819	2	2002	1	0	\N	\N	\N	70
16820	2	2002	1	1	\N	\N	\N	70
16821	2	2002	1	2	\N	\N	\N	70
16822	2	2002	2	0	1856.00	1205.00	1.54	70
16823	2	2002	2	1	\N	\N	\N	70
16824	2	2002	2	2	1856.00	1205.00	1.54	70
16825	2	2003	1	0	\N	\N	\N	70
16826	2	2003	1	1	\N	\N	\N	70
16827	2	2003	1	2	\N	\N	\N	70
16828	2	2003	2	0	1987.00	1290.00	1.54	70
16829	2	2003	2	1	\N	\N	\N	70
16830	2	2003	2	2	1987.00	1290.00	1.54	70
16831	2	2004	1	0	\N	\N	\N	70
16832	2	2004	1	1	\N	\N	\N	70
16833	2	2004	1	2	\N	\N	\N	70
16834	2	2004	2	0	2563.00	1651.00	1.55	70
16835	2	2004	2	1	\N	\N	\N	70
16836	2	2004	2	2	2563.00	1651.00	1.55	70
16837	2	2005	1	0	\N	\N	\N	70
16838	2	2005	1	1	\N	\N	\N	70
16839	2	2005	1	2	\N	\N	\N	70
16840	2	2005	2	0	2627.00	1693.00	1.55	70
16841	2	2005	2	1	\N	\N	\N	70
16842	2	2005	2	2	2627.00	1693.00	1.55	70
16843	2	2006	1	0	\N	\N	\N	70
16844	2	2006	1	1	\N	\N	\N	70
16845	2	2006	1	2	\N	\N	\N	70
16846	2	2006	2	0	2619.00	1670.00	1.57	70
16847	2	2006	2	1	\N	\N	\N	70
16848	2	2006	2	2	2619.00	1670.00	1.57	70
16849	2	2007	1	0	\N	\N	\N	70
16850	2	2007	1	1	\N	\N	\N	70
16851	2	2007	1	2	\N	\N	\N	70
16852	2	2007	2	0	956.00	602.00	1.59	70
16853	2	2007	2	1	\N	\N	\N	70
16854	2	2007	2	2	956.00	602.00	1.59	70
16855	2	2008	1	0	\N	\N	\N	70
16856	2	2008	1	1	\N	\N	\N	70
16857	2	2008	1	2	\N	\N	\N	70
16858	2	2008	2	0	899.00	555.00	1.62	70
16859	2	2008	2	1	\N	\N	\N	70
16860	2	2008	2	2	899.00	555.00	1.62	70
16861	2	2009	1	0	\N	\N	\N	70
16862	2	2009	1	1	\N	\N	\N	70
16863	2	2009	1	2	\N	\N	\N	70
16864	2	2009	2	0	844.00	530.00	1.59	70
16865	2	2009	2	1	\N	\N	\N	70
16866	2	2009	2	2	844.00	530.00	1.59	70
16867	2	2010	1	0	\N	\N	\N	70
16868	2	2010	1	1	\N	\N	\N	70
16869	2	2010	1	2	\N	\N	\N	70
16870	2	2010	2	0	961.00	593.00	1.62	70
16871	2	2010	2	1	\N	\N	\N	70
16872	2	2010	2	2	961.00	593.00	1.62	70
16873	2	2011	1	0	\N	\N	\N	70
16874	2	2011	1	1	\N	\N	\N	70
16875	2	2011	1	2	\N	\N	\N	70
16876	2	2011	2	0	958.00	465.00	2.06	70
16877	2	2011	2	1	\N	\N	\N	70
16878	2	2011	2	2	958.00	465.00	2.06	70
16879	2	2012	1	0	\N	\N	\N	70
16880	2	2012	1	1	\N	\N	\N	70
16881	2	2012	1	2	\N	\N	\N	70
16882	2	2012	2	0	896.00	424.00	2.11	70
16883	2	2012	2	1	\N	\N	\N	70
16884	2	2012	2	2	896.00	424.00	2.11	70
16885	2	2013	1	0	\N	\N	\N	70
16886	2	2013	1	1	\N	\N	\N	70
16887	2	2013	1	2	\N	\N	\N	70
16888	2	2013	2	0	643.00	308.00	2.09	70
16889	2	2013	2	1	\N	\N	\N	70
16890	2	2013	2	2	643.00	308.00	2.09	70
16891	2	2014	1	0	\N	\N	\N	70
16892	2	2014	1	1	\N	\N	\N	70
16893	2	2014	1	2	\N	\N	\N	70
16894	2	2014	2	0	649.00	311.00	2.09	70
16895	2	2014	2	1	\N	\N	\N	70
16896	2	2014	2	2	649.00	311.00	2.09	70
16897	2	2015	1	0	\N	\N	\N	70
16898	2	2015	1	1	\N	\N	\N	70
16899	2	2015	1	2	\N	\N	\N	70
16900	2	2015	2	0	491.00	247.00	1.99	70
16901	2	2015	2	1	\N	\N	\N	70
16902	2	2015	2	2	491.00	247.00	1.99	70
16903	2	2016	1	0	\N	\N	\N	70
16904	2	2016	1	1	\N	\N	\N	70
16905	2	2016	1	2	\N	\N	\N	70
16906	2	2016	2	0	278.00	131.00	2.12	70
16907	2	2016	2	1	\N	\N	\N	70
16908	2	2016	2	2	278.00	131.00	2.12	70
16909	2	2017	1	0	0.00	0.00	\N	70
16910	2	2017	1	1	0.00	0.00	\N	70
16911	2	2017	1	2	0.00	0.00	\N	70
16912	2	2017	2	0	253.00	121.00	2.09	70
16913	2	2017	2	1	0.00	0.00	\N	70
16914	2	2017	2	2	253.00	121.00	2.09	70
16915	2	2018	1	0	0.00	0.00	\N	70
16916	2	2018	1	1	0.00	0.00	\N	70
16917	2	2018	1	2	0.00	0.00	\N	70
16918	2	2018	2	0	35.00	17.00	2.06	70
16919	2	2018	2	1	0.00	0.00	\N	70
16920	2	2018	2	2	35.00	17.00	2.06	70
16921	2	2019	1	0	0.00	0.00	\N	70
16922	2	2019	1	1	0.00	0.00	\N	70
16923	2	2019	1	2	0.00	0.00	\N	70
16924	2	2019	2	0	249.94	121.00	2.07	70
16925	2	2019	2	1	0.00	0.00	\N	70
16926	2	2019	2	2	249.94	121.00	2.07	70
16927	2	2020	1	0	0.00	0.00	\N	70
16928	2	2020	1	1	0.00	0.00	\N	70
16929	2	2020	1	2	0.00	0.00	\N	70
16930	2	2020	2	0	344.87	165.00	2.09	70
16931	2	2020	2	1	0.00	0.00	\N	70
16932	2	2020	2	2	344.87	165.00	2.09	70
16933	2	1987	1	0	\N	\N	\N	71
16934	2	1987	1	1	18815.00	5930.00	3.17	71
16935	2	1987	1	2	18815.00	5930.00	3.17	71
16936	2	1987	2	0	28379.00	13830.00	2.05	71
16937	2	1987	2	1	26125.00	8880.00	2.94	71
16938	2	1987	2	2	54504.00	22710.00	2.40	71
16939	2	1988	1	0	\N	\N	\N	71
16940	2	1988	1	1	18132.00	6100.00	2.97	71
16941	2	1988	1	2	18132.00	6100.00	2.97	71
16942	2	1988	2	0	20347.00	11440.00	1.78	71
16943	2	1988	2	1	18653.00	9230.00	2.02	71
16944	2	1988	2	2	39000.00	20670.00	1.89	71
16945	2	1989	1	0	\N	\N	\N	71
16946	2	1989	1	1	21271.00	6560.00	3.24	71
16947	2	1989	1	2	21271.00	6560.00	3.24	71
16948	2	1989	2	0	22951.00	11160.00	2.06	71
16949	2	1989	2	1	21517.00	10030.00	2.15	71
16950	2	1989	2	2	44468.00	21190.00	2.10	71
16951	2	1990	1	0	\N	\N	\N	71
16952	2	1990	1	1	19815.00	6910.00	2.87	71
16953	2	1990	1	2	19815.00	6910.00	2.87	71
16954	2	1990	2	0	27972.00	11190.00	2.50	71
16955	2	1990	2	1	27439.00	9960.00	2.75	71
16956	2	1990	2	2	55411.00	21150.00	2.62	71
16957	2	1991	1	0	\N	\N	\N	71
16958	2	1991	1	1	19866.00	7180.00	2.77	71
16959	2	1991	1	2	19866.00	7180.00	2.77	71
16960	2	1991	2	0	10056.00	3670.00	2.74	71
16961	2	1991	2	1	15504.00	5910.00	2.62	71
16962	2	1991	2	2	25560.00	9580.00	2.67	71
16963	2	1992	1	0	\N	\N	\N	71
16964	2	1992	1	1	9424.00	3680.00	2.56	71
16965	2	1992	1	2	9424.00	3680.00	2.56	71
16966	2	1992	2	0	13681.00	5630.00	2.43	71
16967	2	1992	2	1	12594.00	5340.00	2.36	71
16968	2	1992	2	2	26275.00	10970.00	2.40	71
16969	2	1993	1	0	\N	\N	\N	71
16970	2	1993	1	1	10784.00	4000.00	2.70	71
16971	2	1993	1	2	10784.00	4000.00	2.70	71
16972	2	1993	2	0	19025.00	7140.00	2.66	71
16973	2	1993	2	1	14518.00	5260.00	2.76	71
16974	2	1993	2	2	33543.00	12400.00	2.71	71
16975	2	1994	1	0	\N	\N	\N	71
16976	2	1994	1	1	13870.00	4550.00	3.05	71
16977	2	1994	1	2	13870.00	4550.00	3.05	71
16978	2	1994	2	0	19863.00	8280.00	2.40	71
16979	2	1994	2	1	21437.00	6580.00	3.26	71
16980	2	1994	2	2	41300.00	14860.00	2.78	71
16981	2	1995	1	0	\N	\N	\N	71
16982	2	1995	1	1	14005.00	5320.00	2.63	71
16983	2	1995	1	2	14005.00	5320.00	2.63	71
16984	2	1995	2	0	22919.00	8680.00	2.64	71
16985	2	1995	2	1	23135.00	6840.00	3.38	71
16986	2	1995	2	2	46054.00	15520.00	2.97	71
16987	2	1996	1	0	\N	\N	\N	71
16988	2	1996	1	1	21494.00	6030.00	3.56	71
16989	2	1996	1	2	21494.00	6030.00	3.56	71
16990	2	1996	2	0	21363.00	8515.00	2.51	71
16991	2	1996	2	1	24531.00	7470.00	3.28	71
16992	2	1996	2	2	45894.00	15985.00	2.87	71
16993	2	1997	1	0	\N	\N	\N	71
16994	2	1997	1	1	22532.00	6456.00	3.49	71
16995	2	1997	1	2	22532.00	6456.00	3.49	71
16996	2	1997	2	0	19915.00	8650.00	2.30	71
16997	2	1997	2	1	28230.00	7980.00	3.54	71
16998	2	1997	2	2	48145.00	16630.00	2.90	71
16999	2	1998	1	0	\N	\N	\N	71
17000	2	1998	1	1	17922.00	6308.00	2.84	71
17001	2	1998	1	2	17922.00	6308.00	2.84	71
17002	2	1998	2	0	12120.00	6903.00	1.76	71
17003	2	1998	2	1	25621.00	8110.00	3.16	71
17004	2	1998	2	2	37741.00	15013.00	2.51	71
17005	2	1999	1	0	70.00	40.00	1.75	71
17006	2	1999	1	1	26950.00	7795.00	3.46	71
17007	2	1999	1	2	27020.00	7835.00	3.45	71
17008	2	1999	2	0	21115.00	8450.00	2.50	71
17009	2	1999	2	1	27872.00	8161.00	3.42	71
17010	2	1999	2	2	48987.00	16611.00	2.95	71
17011	2	2000	1	0	\N	\N	\N	71
17012	2	2000	1	1	27394.00	8011.00	3.42	71
17013	2	2000	1	2	27394.00	8011.00	3.42	71
17014	2	2000	2	0	20105.00	8222.00	2.45	71
17015	2	2000	2	1	30528.00	9055.00	3.37	71
17016	2	2000	2	2	50633.00	17277.00	2.93	71
17017	2	2001	1	0	\N	\N	\N	71
17018	2	2001	1	1	28661.00	8360.00	3.43	71
17019	2	2001	1	2	28661.00	8360.00	3.43	71
17020	2	2001	2	0	23555.00	8136.00	2.90	71
17021	2	2001	2	1	35482.00	9205.00	3.85	71
17022	2	2001	2	2	59037.00	17341.00	3.40	71
17023	2	2002	1	0	\N	\N	\N	71
17024	2	2002	1	1	22942.00	6753.00	3.40	71
17025	2	2002	1	2	22942.00	6753.00	3.40	71
17026	2	2002	2	0	25684.00	8286.00	3.10	71
17027	2	2002	2	1	37002.00	9205.00	4.02	71
17028	2	2002	2	2	62686.00	17491.00	3.58	71
17029	2	2003	1	0	\N	\N	\N	71
17030	2	2003	1	1	28503.00	7566.00	3.77	71
17031	2	2003	1	2	28503.00	7566.00	3.77	71
17032	2	2003	2	0	25275.00	8286.00	3.05	71
17033	2	2003	2	1	38385.00	9125.00	4.21	71
17034	2	2003	2	2	63660.00	17411.00	3.66	71
17035	2	2004	1	0	\N	\N	\N	71
17036	2	2004	1	1	32070.00	7910.00	4.05	71
17037	2	2004	1	2	32070.00	7910.00	4.05	71
17038	2	2004	2	0	30995.00	8170.00	3.79	71
17039	2	2004	2	1	38090.00	9435.00	4.04	71
17040	2	2004	2	2	69085.00	17605.00	3.92	71
17041	2	2005	1	0	\N	\N	\N	71
17042	2	2005	1	1	33993.00	8050.00	4.22	71
17043	2	2005	1	2	33993.00	8050.00	4.22	71
17044	2	2005	2	0	31912.00	8198.00	3.89	71
17045	2	2005	2	1	44119.00	9798.00	4.50	71
17046	2	2005	2	2	76031.00	17996.00	4.22	71
17047	2	2006	1	0	\N	\N	\N	71
17048	2	2006	1	1	35679.00	8238.00	4.33	71
17049	2	2006	1	2	35679.00	8238.00	4.33	71
17050	2	2006	2	0	32944.00	9283.00	3.55	71
17051	2	2006	2	1	46336.00	10690.00	4.33	71
17052	2	2006	2	2	79280.00	19973.00	3.97	71
17053	2	2007	1	0	\N	\N	\N	71
17054	2	2007	1	1	36374.00	8228.00	4.42	71
17055	2	2007	1	2	36374.00	8228.00	4.42	71
17056	2	2007	2	0	30834.00	8900.00	3.46	71
17057	2	2007	2	1	45502.00	10822.00	4.20	71
17058	2	2007	2	2	76336.00	19722.00	3.87	71
17059	2	2008	1	0	\N	\N	\N	71
17060	2	2008	1	1	36383.00	8962.00	4.06	71
17061	2	2008	1	2	36383.00	8962.00	4.06	71
17062	2	2008	2	0	31408.00	9170.00	3.43	71
17063	2	2008	2	1	45648.00	11730.00	3.89	71
17064	2	2008	2	2	77056.00	20900.00	3.69	71
17065	2	2009	1	0	\N	\N	\N	71
17066	2	2009	1	1	39887.00	9701.00	4.11	71
17067	2	2009	1	2	39887.00	9701.00	4.11	71
17068	2	2009	2	0	27635.00	9082.00	3.04	71
17069	2	2009	2	1	36680.00	11361.00	3.23	71
17070	2	2009	2	2	64315.00	20443.00	3.15	71
17071	2	2010	1	0	\N	\N	\N	71
17072	2	2010	1	1	36699.00	9213.00	3.98	71
17073	2	2010	1	2	36699.00	9213.00	3.98	71
17074	2	2010	2	0	31453.00	9056.00	3.47	71
17075	2	2010	2	1	45602.00	11601.00	3.93	71
17076	2	2010	2	2	77055.00	20657.00	3.73	71
17077	2	2011	1	0	\N	\N	\N	71
17078	2	2011	1	1	43092.00	10166.00	4.24	71
17079	2	2011	1	2	43092.00	10166.00	4.24	71
17080	2	2011	2	0	27633.00	9145.00	3.02	71
17081	2	2011	2	1	34107.00	10974.00	3.11	71
17082	2	2011	2	2	61740.00	20119.00	3.07	71
17083	2	2012	1	0	\N	\N	\N	71
17084	2	2012	1	1	41996.00	9985.00	4.21	71
17085	2	2012	1	2	41996.00	9985.00	4.21	71
17086	2	2012	2	0	30985.00	8868.00	3.49	71
17087	2	2012	2	1	45919.00	11290.00	4.07	71
17088	2	2012	2	2	76904.00	20158.00	3.82	71
17089	2	2013	1	0	\N	\N	\N	71
17090	2	2013	1	1	48746.00	11682.00	4.17	71
17091	2	2013	1	2	48746.00	11682.00	4.17	71
17092	2	2013	2	0	35460.00	8938.00	3.97	71
17093	2	2013	2	1	52904.00	12532.00	4.22	71
17094	2	2013	2	2	88364.00	21470.00	4.12	71
17095	2	2014	1	0	\N	\N	\N	71
17096	2	2014	1	1	48231.00	11925.00	4.04	71
17097	2	2014	1	2	48231.00	11925.00	4.04	71
17098	2	2014	2	0	35694.00	8578.00	4.16	71
17099	2	2014	2	1	56266.00	12925.00	4.35	71
17100	2	2014	2	2	91960.00	21503.00	4.28	71
17101	2	2015	1	0	\N	\N	\N	71
17102	2	2015	1	1	47218.00	11707.00	4.03	71
17103	2	2015	1	2	47218.00	11707.00	4.03	71
17104	2	2015	2	0	33251.00	8731.00	3.81	71
17105	2	2015	2	1	57499.00	13242.00	4.34	71
17106	2	2015	2	2	90750.00	21973.00	4.13	71
17107	2	2016	1	0	\N	\N	\N	71
17108	2	2016	1	1	40381.12	9709.00	4.16	71
17109	2	2016	1	2	40381.12	9709.00	4.16	71
17110	2	2016	2	0	18953.00	6237.00	3.04	71
17111	2	2016	2	1	52888.00	16520.00	3.20	71
17112	2	2016	2	2	71841.00	22757.00	3.16	71
17113	2	2017	1	0	0.00	0.00	\N	71
17114	2	2017	1	1	40734.00	10789.00	3.78	71
17115	2	2017	1	2	40734.00	10789.00	3.78	71
17116	2	2017	2	0	30373.00	8010.00	3.79	71
17117	2	2017	2	1	56654.00	14011.00	4.04	71
17118	2	2017	2	2	87027.00	22021.00	3.95	71
17119	2	2018	1	0	0.00	0.00	\N	71
17120	2	2018	1	1	43038.00	10193.00	4.22	71
17121	2	2018	1	2	43038.00	10193.00	4.22	71
17122	2	2018	2	0	28184.00	7818.00	3.61	71
17123	2	2018	2	1	55284.00	15101.00	3.66	71
17124	2	2018	2	2	83468.00	22919.00	3.64	71
17125	2	2019	1	0	0.00	0.00	\N	71
17126	2	2019	1	1	39315.00	9166.00	4.29	71
17127	2	2019	1	2	39315.00	9166.00	4.29	71
17128	2	2019	2	0	33274.34	7824.00	4.25	71
17129	2	2019	2	1	65782.97	14437.00	4.56	71
17130	2	2019	2	2	99057.31	22261.00	4.45	71
17131	2	2020	1	0	0.00	0.00	\N	71
17132	2	2020	1	1	58920.66	13323.00	4.42	71
17133	2	2020	1	2	58920.66	13323.00	4.42	71
17134	2	2020	2	0	30874.50	7789.00	3.96	71
17135	2	2020	2	1	68424.50	14888.00	4.60	71
17136	2	2020	2	2	99299.00	22677.00	4.38	71
17137	2	1987	1	0	10095.00	7070.00	1.43	72
17138	2	1987	1	1	3955.00	1370.00	2.89	72
17139	2	1987	1	2	14050.00	8440.00	1.66	72
17140	2	1987	2	0	15158.00	9220.00	1.64	72
17141	2	1987	2	1	17924.00	5590.00	3.21	72
17142	2	1987	2	2	33082.00	14810.00	2.23	72
17143	2	1988	1	0	10626.00	7210.00	1.47	72
17144	2	1988	1	1	6940.00	3000.00	2.31	72
17145	2	1988	1	2	17566.00	10210.00	1.72	72
17146	2	1988	2	0	23410.00	14340.00	1.63	72
17147	2	1988	2	1	10060.00	3340.00	3.01	72
17148	2	1988	2	2	33470.00	17680.00	1.89	72
17149	2	1989	1	0	11133.00	7430.00	1.50	72
17150	2	1989	1	1	11409.00	3980.00	2.87	72
17151	2	1989	1	2	22542.00	11410.00	1.98	72
17152	2	1989	2	0	19993.00	10140.00	1.97	72
17153	2	1989	2	1	27860.00	7670.00	3.63	72
17154	2	1989	2	2	47853.00	17810.00	2.69	72
17155	2	1990	1	0	11553.00	8320.00	1.39	72
17156	2	1990	1	1	11347.00	4570.00	2.48	72
17157	2	1990	1	2	22900.00	12890.00	1.78	72
17158	2	1990	2	0	33217.00	17520.00	1.90	72
17159	2	1990	2	1	16467.00	5370.00	3.07	72
17160	2	1990	2	2	49684.00	22890.00	2.17	72
17161	2	1991	1	0	16455.00	7550.00	2.18	72
17162	2	1991	1	1	9495.00	3350.00	2.83	72
17163	2	1991	1	2	25950.00	10900.00	2.38	72
17164	2	1991	2	0	31194.00	16700.00	1.87	72
17165	2	1991	2	1	22701.00	8080.00	2.81	72
17166	2	1991	2	2	53895.00	24780.00	2.17	72
17167	2	1992	1	0	1235.00	840.00	1.47	72
17168	2	1992	1	1	4699.00	2640.00	1.78	72
17169	2	1992	1	2	5934.00	3480.00	1.71	72
17170	2	1992	2	0	17502.00	11290.00	1.55	72
17171	2	1992	2	1	14853.00	5270.00	2.82	72
17172	2	1992	2	2	32355.00	16560.00	1.95	72
17173	2	1993	1	0	3680.00	2350.00	1.57	72
17174	2	1993	1	1	7030.00	3410.00	2.06	72
17175	2	1993	1	2	10710.00	5760.00	1.86	72
17176	2	1993	2	0	23569.00	10840.00	2.17	72
17177	2	1993	2	1	15841.00	4760.00	3.33	72
17178	2	1993	2	2	39410.00	15600.00	2.53	72
17179	2	1994	1	0	5925.00	3230.00	1.83	72
17180	2	1994	1	1	9771.00	2940.00	3.32	72
17181	2	1994	1	2	15696.00	6170.00	2.54	72
17182	2	1994	2	0	14235.00	11650.00	1.22	72
17183	2	1994	2	1	24001.00	7350.00	3.27	72
17184	2	1994	2	2	38236.00	19000.00	2.01	72
17185	2	1995	1	0	6230.00	5479.00	1.14	72
17186	2	1995	1	1	16122.00	5378.00	3.00	72
17187	2	1995	1	2	22352.00	10857.00	2.06	72
17188	2	1995	2	0	18805.00	13511.00	1.39	72
17189	2	1995	2	1	19820.00	5790.00	3.42	72
17190	2	1995	2	2	38625.00	19301.00	2.00	72
17191	2	1996	1	0	15945.00	10362.00	1.54	72
17192	2	1996	1	1	16111.00	5737.00	2.81	72
17193	2	1996	1	2	32056.00	16099.00	1.99	72
17194	2	1996	2	0	20663.00	15792.00	1.31	72
17195	2	1996	2	1	20349.00	6037.00	3.37	72
17196	2	1996	2	2	41012.00	21829.00	1.88	72
17197	2	1997	1	0	14510.00	7062.00	2.05	72
17198	2	1997	1	1	16346.00	6024.00	2.71	72
17199	2	1997	1	2	30856.00	13086.00	2.36	72
17200	2	1997	2	0	18435.00	12103.00	1.52	72
17201	2	1997	2	1	27521.00	7916.00	3.48	72
17202	2	1997	2	2	45956.00	20019.00	2.30	72
17203	2	1998	1	0	1335.00	1780.00	0.75	72
17204	2	1998	1	1	19517.00	6561.00	2.97	72
17205	2	1998	1	2	20852.00	8341.00	2.50	72
17206	2	1998	2	0	17233.00	10720.00	1.61	72
17207	2	1998	2	1	20612.00	6370.00	3.24	72
17208	2	1998	2	2	37845.00	17090.00	2.21	72
17209	2	1999	1	0	11418.00	6808.00	1.68	72
17210	2	1999	1	1	15018.00	6418.00	2.34	72
17211	2	1999	1	2	26436.00	13226.00	2.00	72
17212	2	1999	2	0	17076.00	14587.00	1.17	72
17213	2	1999	2	1	16358.00	7102.00	2.30	72
17214	2	1999	2	2	33434.00	21689.00	1.54	72
17215	2	2000	1	0	9739.00	6562.00	1.48	72
17216	2	2000	1	1	19303.00	6917.00	2.79	72
17217	2	2000	1	2	29042.00	13479.00	2.15	72
17218	2	2000	2	0	19003.00	12511.00	1.52	72
17219	2	2000	2	1	22758.00	6262.00	3.63	72
17220	2	2000	2	2	41761.00	18773.00	2.22	72
17221	2	2001	1	0	11115.00	6015.00	1.85	72
17222	2	2001	1	1	17933.00	6274.00	2.86	72
17223	2	2001	1	2	29048.00	12289.00	2.36	72
17224	2	2001	2	0	17987.00	11441.00	1.57	72
17225	2	2001	2	1	22409.00	7105.00	3.15	72
17226	2	2001	2	2	40396.00	18546.00	2.18	72
17227	2	2002	1	0	12648.00	6487.00	1.95	72
17228	2	2002	1	1	26353.00	8398.00	3.14	72
17229	2	2002	1	2	39001.00	14885.00	2.62	72
17230	2	2002	2	0	19124.00	9253.00	2.07	72
17231	2	2002	2	1	22145.00	6407.00	3.46	72
17232	2	2002	2	2	41269.00	15660.00	2.64	72
17233	2	2003	1	0	9257.00	5591.00	1.66	72
17234	2	2003	1	1	22406.00	6950.00	3.22	72
17235	2	2003	1	2	31663.00	12541.00	2.52	72
17236	2	2003	2	0	23332.00	13990.00	1.67	72
17237	2	2003	2	1	20764.00	6560.00	3.17	72
17238	2	2003	2	2	44096.00	20550.00	2.15	72
17239	2	2004	1	0	8955.00	5541.00	1.62	72
17240	2	2004	1	1	22708.00	6651.00	3.41	72
17241	2	2004	1	2	31663.00	12192.00	2.60	72
17242	2	2004	2	0	27131.00	16190.00	1.68	72
17243	2	2004	2	1	22538.00	6580.00	3.43	72
17244	2	2004	2	2	49669.00	22770.00	2.18	72
17245	2	2005	1	0	8485.00	5118.00	1.66	72
17246	2	2005	1	1	21558.00	6644.00	3.24	72
17247	2	2005	1	2	30043.00	11762.00	2.55	72
17248	2	2005	2	0	32281.00	12736.00	2.53	72
17249	2	2005	2	1	25932.00	6590.00	3.94	72
17250	2	2005	2	2	58213.00	19326.00	3.01	72
17251	2	2006	1	0	19113.00	8185.00	2.34	72
17252	2	2006	1	1	21399.00	6687.00	3.20	72
17253	2	2006	1	2	40512.00	14872.00	2.72	72
17254	2	2006	2	0	23840.00	11172.00	2.13	72
17255	2	2006	2	1	22472.00	6718.00	3.35	72
17256	2	2006	2	2	46312.00	17890.00	2.59	72
17257	2	2007	1	0	12621.00	6427.00	1.96	72
17258	2	2007	1	1	21530.00	6550.00	3.29	72
17259	2	2007	1	2	34151.00	12977.00	2.63	72
17260	2	2007	2	0	30889.00	12658.00	2.44	72
17261	2	2007	2	1	21950.00	6618.00	3.32	72
17262	2	2007	2	2	52839.00	19276.00	2.74	72
17263	2	2008	1	0	17957.00	6782.00	2.65	72
17264	2	2008	1	1	25239.00	6918.00	3.65	72
17265	2	2008	1	2	43196.00	13700.00	3.15	72
17266	2	2008	2	0	19707.00	8365.00	2.36	72
17267	2	2008	2	1	31025.00	8285.00	3.74	72
17268	2	2008	2	2	50732.00	16650.00	3.05	72
17269	2	2009	1	0	13997.00	6133.00	2.28	72
17270	2	2009	1	1	23440.00	6863.00	3.42	72
17271	2	2009	1	2	37437.00	12996.00	2.88	72
17272	2	2009	2	0	28810.00	11387.00	2.53	72
17273	2	2009	2	1	24105.00	8272.00	2.91	72
17274	2	2009	2	2	52915.00	19659.00	2.69	72
17275	2	2010	1	0	9394.00	3850.00	2.44	72
17276	2	2010	1	1	21198.00	6646.00	3.19	72
17277	2	2010	1	2	30592.00	10496.00	2.91	72
17278	2	2010	2	0	31755.00	9662.00	3.29	72
17279	2	2010	2	1	22714.00	6590.00	3.45	72
17280	2	2010	2	2	54469.00	16252.00	3.35	72
17281	2	2011	1	0	26958.00	7896.00	3.41	72
17282	2	2011	1	1	20578.00	6917.00	2.97	72
17283	2	2011	1	2	47536.00	14813.00	3.21	72
17284	2	2011	2	0	23810.00	8227.00	2.89	72
17285	2	2011	2	1	26838.00	7083.00	3.79	72
17286	2	2011	2	2	50648.00	15310.00	3.31	72
17287	2	2012	1	0	20345.00	7875.00	2.58	72
17288	2	2012	1	1	24208.00	6688.00	3.62	72
17289	2	2012	1	2	44553.00	14563.00	3.06	72
17290	2	2012	2	0	24963.00	11466.00	2.18	72
17291	2	2012	2	1	27352.00	7257.00	3.77	72
17292	2	2012	2	2	52315.00	18723.00	2.79	72
17293	2	2013	1	0	27768.00	10302.00	2.70	72
17294	2	2013	1	1	30355.00	8700.00	3.49	72
17295	2	2013	1	2	58123.00	19002.00	3.06	72
17296	2	2013	2	0	30111.00	10480.00	2.87	72
17297	2	2013	2	1	28574.00	7398.00	3.86	72
17298	2	2013	2	2	58685.00	17878.00	3.28	72
17299	2	2014	1	0	26789.00	10590.00	2.53	72
17300	2	2014	1	1	25975.00	7341.00	3.54	72
17301	2	2014	1	2	52764.00	17931.00	2.94	72
17302	2	2014	2	0	29811.00	10895.00	2.74	72
17303	2	2014	2	1	31817.00	7536.00	4.22	72
17304	2	2014	2	2	61628.00	18431.00	3.34	72
17305	2	2015	1	0	23884.00	9638.00	2.48	72
17306	2	2015	1	1	29701.00	7787.00	3.81	72
17307	2	2015	1	2	53585.00	17425.00	3.08	72
17308	2	2015	2	0	38520.00	12762.00	3.02	72
17309	2	2015	2	1	32960.00	6653.00	4.95	72
17310	2	2015	2	2	71480.00	19415.00	3.68	72
17311	2	2016	1	0	14244.00	6980.00	2.04	72
17312	2	2016	1	1	22033.00	5952.00	3.70	72
17313	2	2016	1	2	36277.00	12932.00	2.81	72
17314	2	2016	2	0	30208.00	12191.00	2.48	72
17315	2	2016	2	1	19330.00	5818.00	3.32	72
17316	2	2016	2	2	49538.00	18009.00	2.75	72
17317	2	2017	1	0	13891.00	6706.00	2.07	72
17318	2	2017	1	1	21089.00	6631.00	3.18	72
17319	2	2017	1	2	34980.00	13337.00	2.62	72
17320	2	2017	2	0	33827.00	13987.00	2.42	72
17321	2	2017	2	1	36003.00	8639.00	4.17	72
17322	2	2017	2	2	69830.00	22626.00	3.09	72
17323	2	2018	1	0	18308.00	8744.00	2.09	72
17324	2	2018	1	1	24935.00	6891.00	3.62	72
17325	2	2018	1	2	43243.00	15635.00	2.77	72
17326	2	2018	2	0	46293.90	14062.00	3.29	72
17327	2	2018	2	1	42775.46	8639.00	4.95	72
17328	2	2018	2	2	89069.36	22701.00	3.92	72
17329	2	2019	1	0	18405.69	7708.00	2.39	72
17330	2	2019	1	1	20737.88	6145.00	3.37	72
17331	2	2019	1	2	39143.57	13853.00	2.83	72
17332	2	2019	2	0	29156.98	9401.00	3.10	72
17333	2	2019	2	1	37098.44	8526.00	4.35	72
17334	2	2019	2	2	66255.41	17927.00	3.70	72
17335	2	2020	1	0	18924.59	7708.00	2.46	72
17336	2	2020	1	1	22312.50	6145.00	3.63	72
17337	2	2020	1	2	41237.09	13853.00	2.98	72
17338	2	2020	2	0	33115.93	12334.00	2.68	72
17339	2	2020	2	1	34042.38	8526.00	3.99	72
17340	2	2020	2	2	67158.31	20860.00	3.22	72
17341	2	1987	1	0	24735.00	11390.00	2.17	73
17342	2	1987	1	1	92795.00	21450.00	4.33	73
17343	2	1987	1	2	117530.00	32840.00	3.58	73
17344	2	1987	2	0	67339.00	30460.00	2.21	73
17345	2	1987	2	1	62286.00	18330.00	3.40	73
17346	2	1987	2	2	129625.00	48790.00	2.66	73
17347	2	1988	1	0	27428.00	13940.00	1.97	73
17348	2	1988	1	1	101463.00	23780.00	4.27	73
17349	2	1988	1	2	128891.00	37720.00	3.42	73
17350	2	1988	2	0	55422.00	31380.00	1.77	73
17351	2	1988	2	1	82954.00	24970.00	3.32	73
17352	2	1988	2	2	138376.00	56350.00	2.46	73
17353	2	1989	1	0	27353.00	12690.00	2.16	73
17354	2	1989	1	1	101319.00	24490.00	4.14	73
17355	2	1989	1	2	128672.00	37180.00	3.46	73
17356	2	1989	2	0	55035.00	25220.00	2.18	73
17357	2	1989	2	1	81158.00	24230.00	3.35	73
17358	2	1989	2	2	136193.00	49450.00	2.75	73
17359	2	1990	1	0	11286.00	5110.00	2.21	73
17360	2	1990	1	1	74100.00	21050.00	3.52	73
17361	2	1990	1	2	85386.00	26160.00	3.26	73
17362	2	1990	2	0	62698.00	24850.00	2.52	73
17363	2	1990	2	1	93004.00	27550.00	3.38	73
17364	2	1990	2	2	155702.00	52400.00	2.97	73
17365	2	1991	1	0	11666.00	5910.00	1.97	73
17366	2	1991	1	1	74423.00	20980.00	3.55	73
17367	2	1991	1	2	86089.00	26890.00	3.20	73
17368	2	1991	2	0	90161.00	27950.00	3.23	73
17369	2	1991	2	1	90200.00	25010.00	3.61	73
17370	2	1991	2	2	180361.00	52960.00	3.41	73
17371	2	1992	1	0	11449.00	5180.00	2.21	73
17372	2	1992	1	1	77583.00	21780.00	3.56	73
17373	2	1992	1	2	89032.00	26960.00	3.30	73
17374	2	1992	2	0	84785.00	25480.00	3.33	73
17375	2	1992	2	1	68905.00	19490.00	3.54	73
17376	2	1992	2	2	153690.00	44970.00	3.42	73
17377	2	1993	1	0	13046.00	5730.00	2.28	73
17378	2	1993	1	1	83988.00	22730.00	3.70	73
17379	2	1993	1	2	97034.00	28460.00	3.41	73
17380	2	1993	2	0	124383.00	33260.00	3.74	73
17381	2	1993	2	1	73696.00	19860.00	3.71	73
17382	2	1993	2	2	198079.00	53120.00	3.73	73
17383	2	1994	1	0	15501.00	7800.00	1.99	73
17384	2	1994	1	1	83177.00	23550.00	3.53	73
17385	2	1994	1	2	98678.00	31350.00	3.15	73
17386	2	1994	2	0	70955.00	26700.00	2.66	73
17387	2	1994	2	1	72955.00	21840.00	3.34	73
17388	2	1994	2	2	143910.00	48540.00	2.96	73
17389	2	1995	1	0	12657.00	5790.00	2.19	73
17390	2	1995	1	1	78075.00	23677.00	3.30	73
17391	2	1995	1	2	90732.00	29467.00	3.08	73
17392	2	1995	2	0	78941.00	28920.00	2.73	73
17393	2	1995	2	1	83360.00	22190.00	3.76	73
17394	2	1995	2	2	162301.00	51110.00	3.18	73
17395	2	1996	1	0	18549.00	6660.00	2.79	73
17396	2	1996	1	1	97781.00	27050.00	3.61	73
17397	2	1996	1	2	116330.00	33710.00	3.45	73
17398	2	1996	2	0	82927.00	30360.00	2.73	73
17399	2	1996	2	1	71889.00	20610.00	3.49	73
17400	2	1996	2	2	154816.00	50970.00	3.04	73
17401	2	1997	1	0	14597.00	7334.00	1.99	73
17402	2	1997	1	1	81984.00	26080.00	3.14	73
17403	2	1997	1	2	96581.00	33414.00	2.89	73
17404	2	1997	2	0	53528.00	23740.00	2.25	73
17405	2	1997	2	1	102926.00	30691.00	3.35	73
17406	2	1997	2	2	156454.00	54431.00	2.87	73
17407	2	1998	1	0	6796.00	3228.00	2.11	73
17408	2	1998	1	1	45620.00	18093.00	2.52	73
17409	2	1998	1	2	52416.00	21321.00	2.46	73
17410	2	1998	2	0	68467.00	25488.00	2.69	73
17411	2	1998	2	1	64477.00	20904.00	3.08	73
17412	2	1998	2	2	132944.00	46392.00	2.87	73
17413	2	1999	1	0	14114.00	5900.00	2.39	73
17414	2	1999	1	1	67010.00	22041.00	3.04	73
17415	2	1999	1	2	81124.00	27941.00	2.90	73
17416	2	1999	2	0	58213.00	24489.00	2.38	73
17417	2	1999	2	1	95772.00	32390.00	2.96	73
17418	2	1999	2	2	153985.00	56879.00	2.71	73
17419	2	2000	1	0	22958.00	8200.00	2.80	73
17420	2	2000	1	1	109744.00	32950.00	3.33	73
17421	2	2000	1	2	132702.00	41150.00	3.22	73
17422	2	2000	2	0	83020.00	31750.00	2.61	73
17423	2	2000	2	1	128440.00	38690.00	3.32	73
17424	2	2000	2	2	211460.00	70440.00	3.00	73
17425	2	2001	1	0	22688.00	9100.00	2.49	73
17426	2	2001	1	1	89796.00	28763.00	3.12	73
17427	2	2001	1	2	112484.00	37863.00	2.97	73
17428	2	2001	2	0	85479.00	31121.00	2.75	73
17429	2	2001	2	1	135712.00	41300.00	3.29	73
17430	2	2001	2	2	221191.00	72421.00	3.05	73
17431	2	2002	1	0	12592.00	3800.00	3.31	73
17432	2	2002	1	1	75680.00	20600.00	3.67	73
17433	2	2002	1	2	88272.00	24400.00	3.62	73
17434	2	2002	2	0	68923.00	18805.00	3.67	73
17435	2	2002	2	1	115630.00	29500.00	3.92	73
17436	2	2002	2	2	184553.00	48305.00	3.82	73
17437	2	2003	1	0	13860.00	3800.00	3.65	73
17438	2	2003	1	1	79380.00	20600.00	3.85	73
17439	2	2003	1	2	93240.00	24400.00	3.82	73
17440	2	2003	2	0	75950.00	19650.00	3.87	73
17441	2	2003	2	1	123840.00	30261.00	4.09	73
17442	2	2003	2	2	199790.00	49911.00	4.00	73
17443	2	2004	1	0	16675.00	4211.00	3.96	73
17444	2	2004	1	1	89536.00	21265.00	4.21	73
17445	2	2004	1	2	106211.00	25476.00	4.17	73
17446	2	2004	2	0	75510.00	19007.00	3.97	73
17447	2	2004	2	1	116655.00	27779.00	4.20	73
17448	2	2004	2	2	192165.00	46786.00	4.11	73
17449	2	2005	1	0	16677.00	4180.00	3.99	73
17450	2	2005	1	1	89552.00	21322.00	4.20	73
17451	2	2005	1	2	106229.00	25502.00	4.17	73
17452	2	2005	2	0	76781.00	19047.00	4.03	73
17453	2	2005	2	1	123186.00	29232.00	4.21	73
17454	2	2005	2	2	199967.00	48279.00	4.14	73
17455	2	2006	1	0	11586.00	2824.00	4.10	73
17456	2	2006	1	1	91194.00	21423.00	4.26	73
17457	2	2006	1	2	102780.00	24247.00	4.24	73
17458	2	2006	2	0	54212.00	14150.00	3.83	73
17459	2	2006	2	1	95811.00	22318.00	4.29	73
17460	2	2006	2	2	150023.00	36468.00	4.11	73
17461	2	2007	1	0	7600.00	1894.00	4.01	73
17462	2	2007	1	1	78190.00	18411.00	4.25	73
17463	2	2007	1	2	85790.00	20305.00	4.23	73
17464	2	2007	2	0	67893.00	16391.00	4.14	73
17465	2	2007	2	1	132040.00	29774.00	4.43	73
17466	2	2007	2	2	199933.00	46165.00	4.33	73
17467	2	2008	1	0	5564.00	1382.00	4.03	73
17468	2	2008	1	1	96276.00	21874.00	4.40	73
17469	2	2008	1	2	101840.00	23256.00	4.38	73
17470	2	2008	2	0	54776.00	13943.00	3.93	73
17471	2	2008	2	1	125401.00	29950.00	4.19	73
17472	2	2008	2	2	180177.00	43893.00	4.10	73
17473	2	2009	1	0	11553.00	3283.00	3.52	73
17474	2	2009	1	1	94257.00	23586.00	4.00	73
17475	2	2009	1	2	105810.00	26869.00	3.94	73
17476	2	2009	2	0	41304.00	10909.00	3.79	73
17477	2	2009	2	1	139105.00	31172.00	4.46	73
17478	2	2009	2	2	180409.00	42081.00	4.29	73
17479	2	2010	1	0	7971.00	2218.00	3.59	73
17480	2	2010	1	1	100529.00	24222.00	4.15	73
17481	2	2010	1	2	108500.00	26440.00	4.10	73
17482	2	2010	2	0	47108.00	12127.00	3.88	73
17483	2	2010	2	1	145778.00	31797.00	4.58	73
17484	2	2010	2	2	192886.00	43924.00	4.39	73
17485	2	2011	1	0	10541.00	2926.00	3.60	73
17486	2	2011	1	1	116435.00	26569.00	4.38	73
17487	2	2011	1	2	126976.00	29495.00	4.31	73
17488	2	2011	2	0	49388.00	13388.00	3.69	73
17489	2	2011	2	1	151715.00	31153.00	4.87	73
17490	2	2011	2	2	201103.00	44541.00	4.52	73
17491	2	2012	1	0	13810.00	3285.00	4.20	73
17492	2	2012	1	1	115048.00	24703.00	4.66	73
17493	2	2012	1	2	128858.00	27988.00	4.60	73
17494	2	2012	2	0	55772.00	14238.00	3.92	73
17495	2	2012	2	1	138540.00	30254.00	4.58	73
17496	2	2012	2	2	194312.00	44492.00	4.37	73
17497	2	2013	1	0	11316.00	2705.00	4.18	73
17498	2	2013	1	1	108662.00	24900.00	4.36	73
17499	2	2013	1	2	119978.00	27605.00	4.35	73
17500	2	2013	2	0	57337.00	14166.00	4.05	73
17501	2	2013	2	1	144172.00	31425.00	4.59	73
17502	2	2013	2	2	201509.00	45591.00	4.42	73
17503	2	2014	1	0	12148.00	2843.00	4.27	73
17504	2	2014	1	1	118435.00	24915.00	4.75	73
17505	2	2014	1	2	130583.00	27758.00	4.70	73
17506	2	2014	2	0	60461.00	14854.00	4.07	73
17507	2	2014	2	1	150351.00	32559.00	4.62	73
17508	2	2014	2	2	210812.00	47413.00	4.45	73
17509	2	2015	1	0	11917.00	2916.00	4.09	73
17510	2	2015	1	1	110029.00	24876.00	4.42	73
17511	2	2015	1	2	121946.00	27792.00	4.39	73
17512	2	2015	2	0	60562.00	14973.00	4.04	73
17513	2	2015	2	1	150684.00	32446.00	4.64	73
17514	2	2015	2	2	211246.00	47419.00	4.45	73
17515	2	2016	1	0	11415.00	3134.00	3.64	73
17516	2	2016	1	1	101407.53	25371.00	4.00	73
17517	2	2016	1	2	112822.53	28505.00	3.96	73
17518	2	2016	2	0	51970.00	14381.00	3.61	73
17519	2	2016	2	1	144738.00	30861.00	4.69	73
17520	2	2016	2	2	196708.00	45242.00	4.35	73
17521	2	2017	1	0	27914.00	6991.00	3.99	73
17522	2	2017	1	1	152992.00	30774.00	4.97	73
17523	2	2017	1	2	180906.00	37765.00	4.79	73
17524	2	2017	2	0	61233.00	16238.00	3.77	73
17525	2	2017	2	1	137913.00	30947.00	4.46	73
17526	2	2017	2	2	199146.00	47185.00	4.22	73
17527	2	2018	1	0	35417.00	8855.00	4.00	73
17528	2	2018	1	1	132261.00	28257.00	4.68	73
17529	2	2018	1	2	167678.00	37112.00	4.52	73
17530	2	2018	2	0	77290.46	18482.40	4.18	73
17531	2	2018	2	1	137053.67	30373.78	4.51	73
17532	2	2018	2	2	214344.13	48856.18	4.39	73
17533	2	2019	1	0	29494.32	7673.00	3.84	73
17534	2	2019	1	1	137299.24	29779.00	4.61	73
17535	2	2019	1	2	166793.56	37452.00	4.45	73
17536	2	2019	2	0	59251.94	14674.27	4.04	73
17537	2	2019	2	1	141746.66	29863.70	4.75	73
17538	2	2019	2	2	200998.60	44537.96	4.51	73
17539	2	2020	1	0	26590.13	6714.91	3.96	73
17540	2	2020	1	1	109000.63	23582.95	4.62	73
17541	2	2020	1	2	135590.76	30297.86	4.48	73
17542	2	2020	2	0	65946.21	15474.79	4.26	73
17543	2	2020	2	1	132647.87	26964.95	4.92	73
17544	2	2020	2	2	198594.08	42439.74	4.68	73
17545	2	1987	1	0	1205.00	410.00	2.94	77
17546	2	1987	1	1	16135.00	5580.00	2.89	77
17547	2	1987	1	2	17340.00	5990.00	2.89	77
17548	2	1987	2	0	3486.00	1850.00	1.88	77
17549	2	1987	2	1	8130.00	3640.00	2.23	77
17550	2	1987	2	2	11616.00	5490.00	2.12	77
17551	2	1988	1	0	898.00	350.00	2.57	77
17552	2	1988	1	1	21549.00	7400.00	2.91	77
17553	2	1988	1	2	22447.00	7750.00	2.90	77
17554	2	1988	2	0	974.00	520.00	1.87	77
17555	2	1988	2	1	13870.00	6360.00	2.18	77
17556	2	1988	2	2	14844.00	6880.00	2.16	77
17557	2	1989	1	0	2189.00	910.00	2.41	77
17558	2	1989	1	1	14281.00	5330.00	2.68	77
17559	2	1989	1	2	16470.00	6240.00	2.64	77
17560	2	1989	2	0	2996.00	1250.00	2.40	77
17561	2	1989	2	1	13986.00	5750.00	2.43	77
17562	2	1989	2	2	16982.00	7000.00	2.43	77
17563	2	1990	1	0	2678.00	940.00	2.85	77
17564	2	1990	1	1	23143.00	7750.00	2.99	77
17565	2	1990	1	2	25821.00	8690.00	2.97	77
17566	2	1990	2	0	2345.00	940.00	2.49	77
17567	2	1990	2	1	24823.00	7990.00	3.11	77
17568	2	1990	2	2	27168.00	8930.00	3.04	77
17569	2	1991	1	0	1717.00	800.00	2.15	77
17570	2	1991	1	1	24469.00	8140.00	3.01	77
17571	2	1991	1	2	26186.00	8940.00	2.93	77
17572	2	1991	2	0	5039.00	1760.00	2.86	77
17573	2	1991	2	1	16943.00	6490.00	2.61	77
17574	2	1991	2	2	21982.00	8250.00	2.66	77
17575	2	1992	1	0	4722.00	1560.00	3.03	77
17576	2	1992	1	1	26466.00	8250.00	3.21	77
17577	2	1992	1	2	31188.00	9810.00	3.18	77
17578	2	1992	2	0	3977.00	1290.00	3.08	77
17579	2	1992	2	1	17158.00	6900.00	2.49	77
17580	2	1992	2	2	21135.00	8190.00	2.58	77
17581	2	1993	1	0	4099.00	1370.00	2.99	77
17582	2	1993	1	1	27541.00	9540.00	2.89	77
17583	2	1993	1	2	31640.00	10910.00	2.90	77
17584	2	1993	2	0	2706.00	920.00	2.94	77
17585	2	1993	2	1	21735.00	8300.00	2.62	77
17586	2	1993	2	2	24441.00	9220.00	2.65	77
17587	2	1994	1	0	2002.00	690.00	2.90	77
17588	2	1994	1	1	23432.00	8070.00	2.90	77
17589	2	1994	1	2	25434.00	8760.00	2.90	77
17590	2	1994	2	0	2792.00	900.00	3.10	77
17591	2	1994	2	1	26071.00	8100.00	3.22	77
17592	2	1994	2	2	28863.00	9000.00	3.21	77
17593	2	1995	1	0	4050.00	1350.00	3.00	77
17594	2	1995	1	1	31584.00	9870.00	3.20	77
17595	2	1995	1	2	35634.00	11220.00	3.18	77
17596	2	1995	2	0	3829.00	1265.00	3.03	77
17597	2	1995	2	1	25201.00	8035.00	3.14	77
17598	2	1995	2	2	29030.00	9300.00	3.12	77
17599	2	1996	1	0	3681.00	1425.00	2.58	77
17600	2	1996	1	1	30060.00	9670.00	3.11	77
17601	2	1996	1	2	33741.00	11095.00	3.04	77
17602	2	1996	2	0	3450.00	1165.00	2.96	77
17603	2	1996	2	1	25878.00	7857.00	3.29	77
17604	2	1996	2	2	29328.00	9022.00	3.25	77
17605	2	1997	1	0	4453.00	1687.00	2.64	77
17606	2	1997	1	1	28162.00	9450.00	2.98	77
17607	2	1997	1	2	32615.00	11137.00	2.93	77
17608	2	1997	2	0	3737.00	1153.00	3.24	77
17609	2	1997	2	1	28361.00	7933.00	3.58	77
17610	2	1997	2	2	32098.00	9086.00	3.53	77
17611	2	1998	1	0	3897.00	1460.00	2.67	77
17612	2	1998	1	1	30044.00	9635.00	3.12	77
17613	2	1998	1	2	33941.00	11095.00	3.06	77
17614	2	1998	2	0	3186.00	1050.00	3.03	77
17615	2	1998	2	1	23974.00	7580.00	3.16	77
17616	2	1998	2	2	27160.00	8630.00	3.15	77
17617	2	1999	1	0	4590.00	1530.00	3.00	77
17618	2	1999	1	1	34312.00	10720.00	3.20	77
17619	2	1999	1	2	38902.00	12250.00	3.18	77
17620	2	1999	2	0	5583.00	1889.00	2.96	77
17621	2	1999	2	1	25596.00	7812.00	3.28	77
17622	2	1999	2	2	31179.00	9701.00	3.21	77
17623	2	2000	1	0	4670.00	1540.00	3.03	77
17624	2	2000	1	1	36750.00	11325.00	3.25	77
17625	2	2000	1	2	41420.00	12865.00	3.22	77
17626	2	2000	2	0	5622.00	1873.00	3.00	77
17627	2	2000	2	1	24776.00	7731.00	3.20	77
17628	2	2000	2	2	30398.00	9604.00	3.17	77
17629	2	2001	1	0	4580.00	1552.00	2.95	77
17630	2	2001	1	1	37334.00	11320.00	3.30	77
17631	2	2001	1	2	41914.00	12872.00	3.26	77
17632	2	2001	2	0	4816.00	1490.00	3.23	77
17633	2	2001	2	1	26214.00	7743.00	3.39	77
17634	2	2001	2	2	31030.00	9233.00	3.36	77
17635	2	2002	1	0	4910.00	1500.00	3.27	77
17636	2	2002	1	1	36163.00	10425.00	3.47	77
17637	2	2002	1	2	41073.00	11925.00	3.44	77
17638	2	2002	2	0	4800.00	1425.00	3.37	77
17639	2	2002	2	1	27544.00	7875.00	3.50	77
17640	2	2002	2	2	32344.00	9300.00	3.48	77
17641	2	2003	1	0	2919.00	880.00	3.32	77
17642	2	2003	1	1	41286.00	11450.00	3.61	77
17643	2	2003	1	2	44205.00	12330.00	3.59	77
17644	2	2003	2	0	5070.00	1500.00	3.38	77
17645	2	2003	2	1	28455.00	8075.00	3.52	77
17646	2	2003	2	2	33525.00	9575.00	3.50	77
17647	2	2004	1	0	2641.00	762.00	3.47	77
17648	2	2004	1	1	43507.00	11448.00	3.80	77
17649	2	2004	1	2	46148.00	12210.00	3.78	77
17650	2	2004	2	0	4850.00	1410.00	3.44	77
17651	2	2004	2	1	26657.00	7630.00	3.49	77
17652	2	2004	2	2	31507.00	9040.00	3.49	77
17653	2	2005	1	0	2979.00	850.00	3.50	77
17654	2	2005	1	1	42533.00	11440.00	3.72	77
17655	2	2005	1	2	45512.00	12290.00	3.70	77
17656	2	2005	2	0	5238.00	1450.00	3.61	77
17657	2	2005	2	1	30634.00	7980.00	3.84	77
17658	2	2005	2	2	35872.00	9430.00	3.80	77
17659	2	2006	1	0	2975.00	850.00	3.50	77
17660	2	2006	1	1	42036.00	11020.00	3.81	77
17661	2	2006	1	2	45011.00	11870.00	3.79	77
17662	2	2006	2	0	4435.00	1280.00	3.46	77
17663	2	2006	2	1	31308.00	8410.00	3.72	77
17664	2	2006	2	2	35743.00	9690.00	3.69	77
17665	2	2007	1	0	4345.00	1250.00	3.48	77
17666	2	2007	1	1	44867.00	11600.00	3.87	77
17667	2	2007	1	2	49212.00	12850.00	3.83	77
17668	2	2007	2	0	3093.00	930.00	3.33	77
17669	2	2007	2	1	36012.00	9462.00	3.81	77
17670	2	2007	2	2	39105.00	10392.00	3.76	77
17671	2	2008	1	0	2721.00	773.00	3.52	77
17672	2	2008	1	1	43749.00	11392.00	3.84	77
17673	2	2008	1	2	46470.00	12165.00	3.82	77
17674	2	2008	2	0	3524.00	993.00	3.55	77
17675	2	2008	2	1	39715.00	10406.00	3.82	77
17676	2	2008	2	2	43239.00	11399.00	3.79	77
17677	2	2009	1	0	3251.00	900.00	3.61	77
17678	2	2009	1	1	45475.00	11580.00	3.93	77
17679	2	2009	1	2	48726.00	12480.00	3.90	77
17680	2	2009	2	0	3131.00	870.00	3.60	77
17681	2	2009	2	1	38131.00	10372.00	3.68	77
17682	2	2009	2	2	41262.00	11242.00	3.67	77
17683	2	2010	1	0	2908.00	790.00	3.68	77
17684	2	2010	1	1	45493.00	11665.00	3.90	77
17685	2	2010	1	2	48401.00	12455.00	3.89	77
17686	2	2010	2	0	2537.00	767.00	3.31	77
17687	2	2010	2	1	34056.00	10030.00	3.40	77
17688	2	2010	2	2	36593.00	10797.00	3.39	77
17689	2	2011	1	0	2716.00	815.00	3.33	77
17690	2	2011	1	1	44651.00	11665.00	3.83	77
17691	2	2011	1	2	47367.00	12480.00	3.80	77
17692	2	2011	2	0	2146.00	634.00	3.38	77
17693	2	2011	2	1	35920.00	9771.00	3.68	77
17694	2	2011	2	2	38066.00	10405.00	3.66	77
17695	2	2012	1	0	2973.00	845.00	3.52	77
17696	2	2012	1	1	44244.00	11625.00	3.81	77
17697	2	2012	1	2	47217.00	12470.00	3.79	77
17698	2	2012	2	0	2676.00	760.00	3.52	77
17699	2	2012	2	1	40898.00	9851.00	4.15	77
17700	2	2012	2	2	43574.00	10611.00	4.11	77
17701	2	2013	1	0	3008.00	833.00	3.61	77
17702	2	2013	1	1	49492.00	11905.00	4.16	77
17703	2	2013	1	2	52500.00	12738.00	4.12	77
17704	2	2013	2	0	2124.00	688.00	3.09	77
17705	2	2013	2	1	33276.00	8674.00	3.84	77
17706	2	2013	2	2	35400.00	9362.00	3.78	77
17707	2	2014	1	0	3255.00	836.00	3.89	77
17708	2	2014	1	1	56800.00	12680.00	4.48	77
17709	2	2014	1	2	60055.00	13516.00	4.44	77
17710	2	2014	2	0	1572.00	520.00	3.02	77
17711	2	2014	2	1	33158.00	9100.00	3.64	77
17712	2	2014	2	2	34730.00	9620.00	3.61	77
17713	2	2015	1	0	3482.00	850.00	4.10	77
17714	2	2015	1	1	61045.00	12780.00	4.78	77
17715	2	2015	1	2	64527.00	13630.00	4.73	77
17716	2	2015	2	0	1313.00	498.00	2.64	77
17717	2	2015	2	1	21131.00	7844.00	2.69	77
17718	2	2015	2	2	22444.00	8342.00	2.69	77
17719	2	2016	1	0	2516.00	768.00	3.28	77
17720	2	2016	1	1	47131.00	12149.00	3.88	77
17721	2	2016	1	2	49647.00	12917.00	3.84	77
17722	2	2016	2	0	1531.00	518.00	2.96	77
17723	2	2016	2	1	25862.00	8124.00	3.18	77
17724	2	2016	2	2	27393.00	8642.00	3.17	77
17725	2	2017	1	0	4297.00	988.00	4.35	77
17726	2	2017	1	1	55318.00	12509.00	4.42	77
17727	2	2017	1	2	59615.00	13497.00	4.42	77
17728	2	2017	2	0	2202.00	694.00	3.17	77
17729	2	2017	2	1	38362.00	9648.00	3.98	77
17730	2	2017	2	2	40564.00	10342.00	3.92	77
17731	2	2018	1	0	3088.00	830.00	3.72	77
17732	2	2018	1	1	55593.00	12632.00	4.40	77
17733	2	2018	1	2	58681.00	13462.00	4.36	77
17734	2	2018	2	0	2666.00	792.00	3.37	77
17735	2	2018	2	1	43340.00	12202.00	3.55	77
17736	2	2018	2	2	46006.00	12994.00	3.54	77
17737	2	2019	1	0	2290.00	578.00	3.96	77
17738	2	2019	1	1	55634.24	14303.00	3.89	77
17739	2	2019	1	2	57924.24	14881.00	3.89	77
17740	2	2019	2	0	1699.12	478.00	3.55	77
17741	2	2019	2	1	43778.65	10859.00	4.03	77
17742	2	2019	2	2	45477.77	11337.00	4.01	77
17743	2	2020	1	0	2103.00	562.00	3.74	77
17744	2	2020	1	1	47366.00	11161.12	4.24	77
17745	2	2020	1	2	49469.00	11723.12	4.22	77
17746	2	2020	2	0	1891.00	530.00	3.57	77
17747	2	2020	2	1	39069.00	10945.00	3.57	77
17748	2	2020	2	2	40960.00	11475.00	3.57	77
17749	2	1987	1	0	\N	\N	\N	78
17750	2	1987	1	1	\N	\N	\N	78
17751	2	1987	1	2	\N	\N	\N	78
17752	2	1987	2	0	\N	\N	\N	78
17753	2	1987	2	1	\N	\N	\N	78
17754	2	1987	2	2	\N	\N	\N	78
17755	2	1988	1	0	\N	\N	\N	78
17756	2	1988	1	1	\N	\N	\N	78
17757	2	1988	1	2	\N	\N	\N	78
17758	2	1988	2	0	\N	\N	\N	78
17759	2	1988	2	1	\N	\N	\N	78
17760	2	1988	2	2	\N	\N	\N	78
17761	2	1989	1	0	\N	\N	\N	78
17762	2	1989	1	1	\N	\N	\N	78
17763	2	1989	1	2	\N	\N	\N	78
17764	2	1989	2	0	\N	\N	\N	78
17765	2	1989	2	1	\N	\N	\N	78
17766	2	1989	2	2	\N	\N	\N	78
17767	2	1990	1	0	\N	\N	\N	78
17768	2	1990	1	1	\N	\N	\N	78
17769	2	1990	1	2	\N	\N	\N	78
17770	2	1990	2	0	\N	\N	\N	78
17771	2	1990	2	1	\N	\N	\N	78
17772	2	1990	2	2	\N	\N	\N	78
17773	2	1991	1	0	\N	\N	\N	78
17774	2	1991	1	1	\N	\N	\N	78
17775	2	1991	1	2	\N	\N	\N	78
17776	2	1991	2	0	\N	\N	\N	78
17777	2	1991	2	1	\N	\N	\N	78
17778	2	1991	2	2	\N	\N	\N	78
17779	2	1992	1	0	\N	\N	\N	78
17780	2	1992	1	1	\N	\N	\N	78
17781	2	1992	1	2	\N	\N	\N	78
17782	2	1992	2	0	\N	\N	\N	78
17783	2	1992	2	1	\N	\N	\N	78
17784	2	1992	2	2	\N	\N	\N	78
17785	2	1993	1	0	\N	\N	\N	78
17786	2	1993	1	1	\N	\N	\N	78
17787	2	1993	1	2	\N	\N	\N	78
17788	2	1993	2	0	\N	\N	\N	78
17789	2	1993	2	1	\N	\N	\N	78
17790	2	1993	2	2	\N	\N	\N	78
17791	2	1994	1	0	773.00	390.00	1.98	78
17792	2	1994	1	1	14275.00	4900.00	2.91	78
17793	2	1994	1	2	15048.00	5290.00	2.84	78
17794	2	1994	2	0	1610.00	750.00	2.15	78
17795	2	1994	2	1	25428.00	7400.00	3.44	78
17796	2	1994	2	2	27038.00	8150.00	3.32	78
17797	2	1995	1	0	1278.00	625.00	2.04	78
17798	2	1995	1	1	22500.00	7420.00	3.03	78
17799	2	1995	1	2	23778.00	8045.00	2.96	78
17800	2	1995	2	0	1538.00	750.00	2.05	78
17801	2	1995	2	1	24904.00	7450.00	3.34	78
17802	2	1995	2	2	26442.00	8200.00	3.22	78
17803	2	1996	1	0	1182.00	565.00	2.09	78
17804	2	1996	1	1	21895.00	7150.00	3.06	78
17805	2	1996	1	2	23077.00	7715.00	2.99	78
17806	2	1996	2	0	1354.00	635.00	2.13	78
17807	2	1996	2	1	23937.00	6884.00	3.48	78
17808	2	1996	2	2	25291.00	7519.00	3.36	78
17809	2	1997	1	0	1188.00	540.00	2.20	78
17810	2	1997	1	1	23190.00	7055.00	3.29	78
17811	2	1997	1	2	24378.00	7595.00	3.21	78
17812	2	1997	2	0	1416.00	642.00	2.21	78
17813	2	1997	2	1	24222.00	6790.00	3.57	78
17814	2	1997	2	2	25638.00	7432.00	3.45	78
17815	2	1998	1	0	985.00	485.00	2.03	78
17816	2	1998	1	1	19997.00	6320.00	3.16	78
17817	2	1998	1	2	20982.00	6805.00	3.08	78
17818	2	1998	2	0	1199.00	571.00	2.10	78
17819	2	1998	2	1	21177.00	6759.00	3.13	78
17820	2	1998	2	2	22376.00	7330.00	3.05	78
17821	2	1999	1	0	1334.00	565.00	2.36	78
17822	2	1999	1	1	22378.00	6670.00	3.36	78
17823	2	1999	1	2	23712.00	7235.00	3.28	78
17824	2	1999	2	0	1527.00	674.00	2.27	78
17825	2	1999	2	1	25914.00	7133.00	3.63	78
17826	2	1999	2	2	27441.00	7807.00	3.51	78
17827	2	2000	1	0	1451.00	595.00	2.44	78
17828	2	2000	1	1	23572.00	6820.00	3.46	78
17829	2	2000	1	2	25023.00	7415.00	3.37	78
17830	2	2000	2	0	1595.00	692.00	2.30	78
17831	2	2000	2	1	26757.00	7302.00	3.66	78
17832	2	2000	2	2	28352.00	7994.00	3.55	78
17833	2	2001	1	0	1512.00	614.00	2.46	78
17834	2	2001	1	1	24145.00	6853.00	3.52	78
17835	2	2001	1	2	25657.00	7467.00	3.44	78
17836	2	2001	2	0	1506.00	643.00	2.34	78
17837	2	2001	2	1	27252.00	7344.00	3.71	78
17838	2	2001	2	2	28758.00	7987.00	3.60	78
17839	2	2002	1	0	1391.00	526.00	2.64	78
17840	2	2002	1	1	25345.00	6858.00	3.70	78
17841	2	2002	1	2	26736.00	7384.00	3.62	78
17842	2	2002	2	0	1168.00	488.00	2.39	78
17843	2	2002	2	1	27768.00	7490.00	3.71	78
17844	2	2002	2	2	28936.00	7978.00	3.63	78
17845	2	2003	1	0	1082.00	413.00	2.62	78
17846	2	2003	1	1	25324.00	6903.00	3.67	78
17847	2	2003	1	2	26406.00	7316.00	3.61	78
17848	2	2003	2	0	1113.00	450.00	2.47	78
17849	2	2003	2	1	28737.00	7563.00	3.80	78
17850	2	2003	2	2	29850.00	8013.00	3.73	78
17851	2	2004	1	0	1153.00	425.00	2.71	78
17852	2	2004	1	1	26847.00	6924.00	3.88	78
17853	2	2004	1	2	28000.00	7349.00	3.81	78
17854	2	2004	2	0	1118.00	450.00	2.48	78
17855	2	2004	2	1	28767.00	7565.00	3.80	78
17856	2	2004	2	2	29885.00	8015.00	3.73	78
17857	2	2005	1	0	1101.00	400.00	2.75	78
17858	2	2005	1	1	28262.00	6949.00	4.07	78
17859	2	2005	1	2	29363.00	7349.00	4.00	78
17860	2	2005	2	0	1017.00	360.00	2.83	78
17861	2	2005	2	1	34158.00	7634.00	4.47	78
17862	2	2005	2	2	35175.00	7994.00	4.40	78
17863	2	2006	1	0	1168.00	396.00	2.95	78
17864	2	2006	1	1	34285.00	7040.00	4.87	78
17865	2	2006	1	2	35453.00	7436.00	4.77	78
17866	2	2006	2	0	1110.00	362.00	3.07	78
17867	2	2006	2	1	36367.00	7747.00	4.69	78
17868	2	2006	2	2	37477.00	8109.00	4.62	78
17869	2	2007	1	0	925.00	323.00	2.86	78
17870	2	2007	1	1	34290.00	7045.00	4.87	78
17871	2	2007	1	2	35215.00	7368.00	4.78	78
17872	2	2007	2	0	669.00	220.00	3.04	78
17873	2	2007	2	1	35933.00	7705.00	4.66	78
17874	2	2007	2	2	36602.00	7925.00	4.62	78
17875	2	2008	1	0	621.00	217.00	2.86	78
17876	2	2008	1	1	33658.00	7028.00	4.79	78
17877	2	2008	1	2	34279.00	7245.00	4.73	78
17878	2	2008	2	0	656.00	216.00	3.04	78
17879	2	2008	2	1	35863.00	7702.00	4.66	78
17880	2	2008	2	2	36519.00	7918.00	4.61	78
17881	2	2009	1	0	503.00	174.00	2.89	78
17882	2	2009	1	1	33568.00	7042.00	4.77	78
17883	2	2009	1	2	34071.00	7216.00	4.72	78
17884	2	2009	2	0	592.00	197.00	3.01	78
17885	2	2009	2	1	34457.00	7666.00	4.49	78
17886	2	2009	2	2	35049.00	7863.00	4.46	78
17887	2	2010	1	0	360.00	130.00	2.77	78
17888	2	2010	1	1	32258.00	7051.00	4.57	78
17889	2	2010	1	2	32618.00	7181.00	4.54	78
17890	2	2010	2	0	181.00	78.00	2.32	78
17891	2	2010	2	1	34234.00	7621.00	4.49	78
17892	2	2010	2	2	34415.00	7699.00	4.47	78
17893	2	2011	1	0	223.00	96.00	2.32	78
17894	2	2011	1	1	32086.00	7073.00	4.54	78
17895	2	2011	1	2	32309.00	7169.00	4.51	78
17896	2	2011	2	0	126.00	61.00	2.07	78
17897	2	2011	2	1	34169.00	7615.00	4.49	78
17898	2	2011	2	2	34295.00	7676.00	4.47	78
17899	2	2012	1	0	148.00	67.00	2.21	78
17900	2	2012	1	1	32059.00	7073.00	4.53	78
17901	2	2012	1	2	32207.00	7140.00	4.51	78
17902	2	2012	2	0	113.00	59.00	1.92	78
17903	2	2012	2	1	34223.00	7615.00	4.49	78
17904	2	2012	2	2	34336.00	7674.00	4.47	78
17905	2	2013	1	0	148.00	67.00	2.21	78
17906	2	2013	1	1	32071.00	7073.00	4.53	78
17907	2	2013	1	2	32219.00	7140.00	4.51	78
17908	2	2013	2	0	98.00	52.00	1.88	78
17909	2	2013	2	1	33992.00	7615.00	4.46	78
17910	2	2013	2	2	34090.00	7667.00	4.45	78
17911	2	2014	1	0	108.00	52.00	2.08	78
17912	2	2014	1	1	32003.00	7073.00	4.52	78
17913	2	2014	1	2	32111.00	7125.00	4.51	78
17914	2	2014	2	0	91.00	50.00	1.82	78
17915	2	2014	2	1	34141.00	7616.00	4.48	78
17916	2	2014	2	2	34232.00	7666.00	4.47	78
17917	2	2015	1	0	108.00	52.00	2.08	78
17918	2	2015	1	1	32233.00	7073.00	4.56	78
17919	2	2015	1	2	32341.00	7125.00	4.54	78
17920	2	2015	2	0	91.00	50.00	1.82	78
17921	2	2015	2	1	34135.00	7616.00	4.48	78
17922	2	2015	2	2	34226.00	7666.00	4.46	78
17923	2	2016	1	0	84.00	40.00	2.10	78
17924	2	2016	1	1	32256.36	7071.00	4.56	78
17925	2	2016	1	2	32340.36	7111.00	4.55	78
17926	2	2016	2	0	93.00	50.00	1.86	78
17927	2	2016	2	1	35448.00	7608.00	4.66	78
17928	2	2016	2	2	35541.00	7658.00	4.64	78
17929	2	2017	1	0	41.00	19.00	2.16	78
17930	2	2017	1	1	32073.00	7103.00	4.52	78
17931	2	2017	1	2	32114.00	7122.00	4.51	78
17932	2	2017	2	0	10.00	5.00	2.00	78
17933	2	2017	2	1	33087.00	7256.00	4.56	78
17934	2	2017	2	2	33097.00	7261.00	4.56	78
17935	2	2018	1	0	0.00	0.00	\N	78
17936	2	2018	1	1	23633.00	5192.00	4.55	78
17937	2	2018	1	2	23633.00	5192.00	4.55	78
17938	2	2018	2	0	0.00	0.00	\N	78
17939	2	2018	2	1	32095.00	7191.00	4.46	78
17940	2	2018	2	2	32095.00	7191.00	4.46	78
17941	2	2019	1	0	0.00	0.00	\N	78
17942	2	2019	1	1	26928.00	6167.00	4.37	78
17943	2	2019	1	2	26928.00	6167.00	4.37	78
17944	2	2019	2	0	0.00	0.00	\N	78
17945	2	2019	2	1	26762.00	6124.00	4.37	78
17946	2	2019	2	2	26762.00	6124.00	4.37	78
17947	2	2020	1	0	0.00	0.00	\N	78
17948	2	2020	1	1	26921.00	6178.00	4.36	78
17949	2	2020	1	2	26921.00	6178.00	4.36	78
17950	2	2020	2	0	0.00	0.00	\N	78
17951	2	2020	2	1	26688.00	6125.00	4.36	78
17952	2	2020	2	2	26688.00	6125.00	4.36	78
17953	2	1987	1	0	\N	\N	\N	79
17954	2	1987	1	1	\N	\N	\N	79
17955	2	1987	1	2	\N	\N	\N	79
17956	2	1987	2	0	\N	\N	\N	79
17957	2	1987	2	1	\N	\N	\N	79
17958	2	1987	2	2	\N	\N	\N	79
17959	2	1988	1	0	\N	\N	\N	79
17960	2	1988	1	1	\N	\N	\N	79
17961	2	1988	1	2	\N	\N	\N	79
17962	2	1988	2	0	\N	\N	\N	79
17963	2	1988	2	1	\N	\N	\N	79
17964	2	1988	2	2	\N	\N	\N	79
17965	2	1989	1	0	\N	\N	\N	79
17966	2	1989	1	1	\N	\N	\N	79
17967	2	1989	1	2	\N	\N	\N	79
17968	2	1989	2	0	\N	\N	\N	79
17969	2	1989	2	1	\N	\N	\N	79
17970	2	1989	2	2	\N	\N	\N	79
17971	2	1990	1	0	\N	\N	\N	79
17972	2	1990	1	1	\N	\N	\N	79
17973	2	1990	1	2	\N	\N	\N	79
17974	2	1990	2	0	\N	\N	\N	79
17975	2	1990	2	1	\N	\N	\N	79
17976	2	1990	2	2	\N	\N	\N	79
17977	2	1991	1	0	\N	\N	\N	79
17978	2	1991	1	1	\N	\N	\N	79
17979	2	1991	1	2	\N	\N	\N	79
17980	2	1991	2	0	\N	\N	\N	79
17981	2	1991	2	1	\N	\N	\N	79
17982	2	1991	2	2	\N	\N	\N	79
17983	2	1992	1	0	\N	\N	\N	79
17984	2	1992	1	1	\N	\N	\N	79
17985	2	1992	1	2	\N	\N	\N	79
17986	2	1992	2	0	\N	\N	\N	79
17987	2	1992	2	1	\N	\N	\N	79
17988	2	1992	2	2	\N	\N	\N	79
17989	2	1993	1	0	\N	\N	\N	79
17990	2	1993	1	1	\N	\N	\N	79
17991	2	1993	1	2	\N	\N	\N	79
17992	2	1993	2	0	\N	\N	\N	79
17993	2	1993	2	1	\N	\N	\N	79
17994	2	1993	2	2	\N	\N	\N	79
17995	2	1994	1	0	8459.00	3910.00	2.16	79
17996	2	1994	1	1	9838.00	2850.00	3.45	79
17997	2	1994	1	2	18297.00	6760.00	2.71	79
17998	2	1994	2	0	12026.00	6720.00	1.79	79
17999	2	1994	2	1	4498.00	1590.00	2.83	79
18000	2	1994	2	2	16524.00	8310.00	1.99	79
18001	2	1995	1	0	5850.00	3900.00	1.50	79
18002	2	1995	1	1	1401.00	680.00	2.06	79
18003	2	1995	1	2	7251.00	4580.00	1.58	79
18004	2	1995	2	0	16167.00	7500.00	2.16	79
18005	2	1995	2	1	3358.00	1180.00	2.85	79
18006	2	1995	2	2	19525.00	8680.00	2.25	79
18007	2	1996	1	0	10910.00	5100.00	2.14	79
18008	2	1996	1	1	2200.00	850.00	2.59	79
18009	2	1996	1	2	13110.00	5950.00	2.20	79
18010	2	1996	2	0	19034.00	10905.00	1.75	79
18011	2	1996	2	1	3472.00	1240.00	2.80	79
18012	2	1996	2	2	22506.00	12145.00	1.85	79
18013	2	1997	1	0	7893.00	5576.00	1.42	79
18014	2	1997	1	1	2599.00	1415.00	1.84	79
18015	2	1997	1	2	10492.00	6991.00	1.50	79
18016	2	1997	2	0	19186.00	9545.00	2.01	79
18017	2	1997	2	1	6152.00	2115.00	2.91	79
18018	2	1997	2	2	25338.00	11660.00	2.17	79
18019	2	1998	1	0	1183.00	1200.00	0.99	79
18020	2	1998	1	1	1920.00	1020.00	1.88	79
18021	2	1998	1	2	3103.00	2220.00	1.40	79
18022	2	1998	2	0	23693.00	9785.00	2.42	79
18023	2	1998	2	1	7895.00	2198.00	3.59	79
18024	2	1998	2	2	31588.00	11983.00	2.64	79
18025	2	1999	1	0	10397.00	6660.00	1.56	79
18026	2	1999	1	1	4005.00	1570.00	2.55	79
18027	2	1999	1	2	14402.00	8230.00	1.75	79
18028	2	1999	2	0	20907.00	12315.00	1.70	79
18029	2	1999	2	1	5867.00	2388.00	2.46	79
18030	2	1999	2	2	26774.00	14703.00	1.82	79
18031	2	2000	1	0	4974.00	5030.00	0.99	79
18032	2	2000	1	1	4094.00	1745.00	2.35	79
18033	2	2000	1	2	9068.00	6775.00	1.34	79
18034	2	2000	2	0	27839.00	10866.00	2.56	79
18035	2	2000	2	1	7767.00	2300.00	3.38	79
18036	2	2000	2	2	35606.00	13166.00	2.70	79
18037	2	2001	1	0	6972.00	4175.00	1.67	79
18038	2	2001	1	1	4888.00	1750.00	2.79	79
18039	2	2001	1	2	11860.00	5925.00	2.00	79
18040	2	2001	2	0	22416.00	9830.00	2.28	79
18041	2	2001	2	1	7525.00	2320.00	3.24	79
18042	2	2001	2	2	29941.00	12150.00	2.46	79
18043	2	2002	1	0	6294.00	4341.00	1.45	79
18044	2	2002	1	1	3062.00	1175.00	2.61	79
18045	2	2002	1	2	9356.00	5516.00	1.70	79
18046	2	2002	2	0	26065.00	9945.00	2.62	79
18047	2	2002	2	1	5385.00	1500.00	3.59	79
18048	2	2002	2	2	31450.00	11445.00	2.75	79
18049	2	2003	1	0	3322.00	3124.00	1.06	79
18050	2	2003	1	1	4508.00	1550.00	2.91	79
18051	2	2003	1	2	7830.00	4674.00	1.68	79
18052	2	2003	2	0	25408.00	10430.00	2.44	79
18053	2	2003	2	1	8120.00	2225.00	3.65	79
18054	2	2003	2	2	33528.00	12655.00	2.65	79
18055	2	2004	1	0	5831.00	3714.00	1.57	79
18056	2	2004	1	1	1866.00	610.00	3.06	79
18057	2	2004	1	2	7697.00	4324.00	1.78	79
18058	2	2004	2	0	30832.00	12821.00	2.40	79
18059	2	2004	2	1	7873.00	2205.00	3.57	79
18060	2	2004	2	2	38705.00	15026.00	2.58	79
18061	2	2005	1	0	5595.00	2690.00	2.08	79
18062	2	2005	1	1	3310.00	980.00	3.38	79
18063	2	2005	1	2	8905.00	3670.00	2.43	79
18064	2	2005	2	0	30221.00	12492.00	2.42	79
18065	2	2005	2	1	7750.00	2060.00	3.76	79
18066	2	2005	2	2	37971.00	14552.00	2.61	79
18067	2	2006	1	0	4919.00	2365.00	2.08	79
18068	2	2006	1	1	3993.00	1010.00	3.95	79
18069	2	2006	1	2	8912.00	3375.00	2.64	79
18070	2	2006	2	0	31328.00	12879.00	2.43	79
18071	2	2006	2	1	8244.00	2340.00	3.52	79
18072	2	2006	2	2	39572.00	15219.00	2.60	79
18073	2	2007	1	0	3451.00	2876.00	1.20	79
18074	2	2007	1	1	2877.00	960.00	3.00	79
18075	2	2007	1	2	6328.00	3836.00	1.65	79
18076	2	2007	2	0	28606.00	13122.00	2.18	79
18077	2	2007	2	1	8820.00	2727.00	3.23	79
18078	2	2007	2	2	37426.00	15849.00	2.36	79
18079	2	2008	1	0	7275.00	3290.00	2.21	79
18080	2	2008	1	1	4352.00	1222.00	3.56	79
18081	2	2008	1	2	11627.00	4512.00	2.58	79
18082	2	2008	2	0	30087.00	13036.00	2.31	79
18083	2	2008	2	1	9265.00	2690.00	3.44	79
18084	2	2008	2	2	39352.00	15726.00	2.50	79
18085	2	2009	1	0	7046.00	3930.00	1.79	79
18086	2	2009	1	1	4315.00	1310.00	3.29	79
18087	2	2009	1	2	11361.00	5240.00	2.17	79
18088	2	2009	2	0	31966.00	13585.00	2.35	79
18089	2	2009	2	1	9397.00	2722.00	3.45	79
18090	2	2009	2	2	41363.00	16307.00	2.54	79
18091	2	2010	1	0	4461.00	3362.00	1.33	79
18092	2	2010	1	1	3673.00	1152.00	3.19	79
18093	2	2010	1	2	8134.00	4514.00	1.80	79
18094	2	2010	2	0	26954.00	11034.00	2.44	79
18095	2	2010	2	1	7628.00	2240.00	3.41	79
18096	2	2010	2	2	34582.00	13274.00	2.61	79
18097	2	2011	1	0	6923.00	3639.00	1.90	79
18098	2	2011	1	1	5127.00	1510.00	3.40	79
18099	2	2011	1	2	12050.00	5149.00	2.34	79
18100	2	2011	2	0	29541.00	12371.00	2.39	79
18101	2	2011	2	1	9822.00	2761.00	3.56	79
18102	2	2011	2	2	39363.00	15132.00	2.60	79
18103	2	2012	1	0	6857.00	3653.00	1.88	79
18104	2	2012	1	1	5928.00	1622.00	3.65	79
18105	2	2012	1	2	12785.00	5275.00	2.42	79
18106	2	2012	2	0	31946.00	13455.00	2.37	79
18107	2	2012	2	1	10694.00	3085.00	3.47	79
18108	2	2012	2	2	42640.00	16540.00	2.58	79
18109	2	2013	1	0	4079.00	2284.00	1.79	79
18110	2	2013	1	1	2662.00	907.00	2.93	79
18111	2	2013	1	2	6741.00	3191.00	2.11	79
18112	2	2013	2	0	31321.00	12115.00	2.59	79
18113	2	2013	2	1	8004.00	2170.00	3.69	79
18114	2	2013	2	2	39325.00	14285.00	2.75	79
18115	2	2014	1	0	8441.00	4307.00	1.96	79
18116	2	2014	1	1	3981.00	1268.00	3.14	79
18117	2	2014	1	2	12422.00	5575.00	2.23	79
18118	2	2014	2	0	29942.00	11734.00	2.55	79
18119	2	2014	2	1	8838.00	2397.00	3.69	79
18120	2	2014	2	2	38780.00	14131.00	2.74	79
18121	2	2015	1	0	4245.00	2429.00	1.75	79
18122	2	2015	1	1	2618.00	900.00	2.91	79
18123	2	2015	1	2	6863.00	3329.00	2.06	79
18124	2	2015	2	0	25727.00	10164.00	2.53	79
18125	2	2015	2	1	7564.00	2038.00	3.71	79
18126	2	2015	2	2	33291.00	12202.00	2.73	79
18127	2	2016	1	0	1599.00	1318.00	1.21	79
18128	2	2016	1	1	1182.00	588.00	2.01	79
18129	2	2016	1	2	2781.00	1906.00	1.46	79
18130	2	2016	2	0	31794.00	11251.00	2.83	79
18131	2	2016	2	1	8074.00	2220.00	3.64	79
18132	2	2016	2	2	39868.00	13471.00	2.96	79
18133	2	2017	1	0	8290.00	3739.00	2.22	79
18134	2	2017	1	1	2598.00	877.00	2.96	79
18135	2	2017	1	2	10888.00	4616.00	2.36	79
18136	2	2017	2	0	35023.00	12618.00	2.78	79
18137	2	2017	2	1	9411.00	2630.00	3.58	79
18138	2	2017	2	2	44434.00	15248.00	2.91	79
18139	2	2018	1	0	5367.00	2620.00	2.05	79
18140	2	2018	1	1	2662.00	991.00	2.69	79
18141	2	2018	1	2	8029.00	3611.00	2.22	79
18142	2	2018	2	0	29054.00	10256.00	2.83	79
18143	2	2018	2	1	8645.00	2326.00	3.72	79
18144	2	2018	2	2	37699.00	12582.00	3.00	79
18145	2	2019	1	0	7189.00	3470.00	2.07	79
18146	2	2019	1	1	3669.00	1349.00	2.72	79
18147	2	2019	1	2	10858.00	4819.00	2.25	79
18148	2	2019	2	0	28480.00	10288.00	2.77	79
18149	2	2019	2	1	8388.00	2235.00	3.75	79
18150	2	2019	2	2	36868.00	12523.00	2.94	79
18151	2	2020	1	0	10412.00	4304.00	2.42	79
18152	2	2020	1	1	4724.00	1598.00	2.96	79
18153	2	2020	1	2	15136.00	5902.00	2.56	79
18154	2	2020	2	0	38132.00	12513.00	3.05	79
18155	2	2020	2	1	11723.00	2995.00	3.91	79
18156	2	2020	2	2	49855.00	15508.00	3.21	79
18157	1	1987	1	0	110635.00	79230.00	1.40	8
18158	1	1987	1	1	95735.00	37890.00	2.53	8
18159	1	1987	1	2	206370.00	117120.00	1.76	8
18160	1	1987	2	0	69689.00	47670.00	1.46	8
18161	1	1987	2	1	103284.00	38800.00	2.66	8
18162	1	1987	2	2	172973.00	86470.00	2.00	8
18163	1	1988	1	0	124535.00	82780.00	1.50	8
18164	1	1988	1	1	106043.00	39250.00	2.70	8
18165	1	1988	1	2	230578.00	122030.00	1.89	8
18166	1	1988	2	0	67019.00	43900.00	1.53	8
18167	1	1988	2	1	109480.00	39840.00	2.75	8
18168	1	1988	2	2	176499.00	83740.00	2.11	8
18169	1	1989	1	0	87289.00	83540.00	1.04	8
18170	1	1989	1	1	87688.00	35960.00	2.44	8
18171	1	1989	1	2	174977.00	119500.00	1.46	8
18172	1	1989	2	0	82266.00	49090.00	1.68	8
18173	1	1989	2	1	122160.00	37960.00	3.22	8
18174	1	1989	2	2	204426.00	87050.00	2.35	8
18175	1	1990	1	0	82484.00	82440.00	1.00	8
18176	1	1990	1	1	94281.00	33980.00	2.77	8
18177	1	1990	1	2	176765.00	116420.00	1.52	8
18178	1	1990	2	0	68673.00	46550.00	1.48	8
18179	1	1990	2	1	92021.00	37140.00	2.48	8
18180	1	1990	2	2	160694.00	83690.00	1.92	8
18181	1	1991	1	0	108598.00	92180.00	1.18	8
18182	1	1991	1	1	100301.00	36560.00	2.74	8
18183	1	1991	1	2	208899.00	128740.00	1.62	8
18184	1	1991	2	0	73283.00	52260.00	1.40	8
18185	1	1991	2	1	100772.00	40710.00	2.48	8
18186	1	1991	2	2	174055.00	92970.00	1.87	8
18187	1	1992	1	0	117758.00	102260.00	1.15	8
18188	1	1992	1	1	102403.00	39900.00	2.57	8
18189	1	1992	1	2	220161.00	142160.00	1.55	8
18190	1	1992	2	0	40512.00	32150.00	1.26	8
18191	1	1992	2	1	101412.00	40700.00	2.49	8
18192	1	1992	2	2	141924.00	72850.00	1.95	8
18193	1	1993	1	0	93313.00	75000.00	1.24	8
18194	1	1993	1	1	131543.00	47310.00	2.78	8
18195	1	1993	1	2	224856.00	122310.00	1.84	8
18196	1	1993	2	0	59571.00	34970.00	1.70	8
18197	1	1993	2	1	104466.00	38610.00	2.71	8
18198	1	1993	2	2	164037.00	73580.00	2.23	8
18199	1	1994	1	0	104049.00	75530.00	1.38	8
18200	1	1994	1	1	105978.00	42880.00	2.47	8
18201	1	1994	1	2	210027.00	118410.00	1.77	8
18202	1	1994	2	0	66305.00	40180.00	1.65	8
18203	1	1994	2	1	121448.00	39240.00	3.10	8
18204	1	1994	2	2	187753.00	79420.00	2.36	8
18205	1	1995	1	0	113579.00	75107.00	1.51	8
18206	1	1995	1	1	145565.00	48926.00	2.98	8
18207	1	1995	1	2	259144.00	124033.00	2.09	8
18208	1	1995	2	0	67529.00	40998.00	1.65	8
18209	1	1995	2	1	119384.00	41457.00	2.88	8
18210	1	1995	2	2	186913.00	82455.00	2.27	8
18211	1	1996	1	0	106320.00	76023.00	1.40	8
18212	1	1996	1	1	142076.00	49606.00	2.86	8
18213	1	1996	1	2	248396.00	125629.00	1.98	8
18214	1	1996	2	0	68392.00	41751.00	1.64	8
18215	1	1996	2	1	119002.00	41488.00	2.87	8
18216	1	1996	2	2	187394.00	83239.00	2.25	8
18217	1	1997	1	0	119401.00	79556.00	1.50	8
18218	1	1997	1	1	150699.00	50957.00	2.96	8
18219	1	1997	1	2	270100.00	130513.00	2.07	8
18220	1	1997	2	0	67809.00	41216.00	1.65	8
18221	1	1997	2	1	119351.00	41550.00	2.87	8
18222	1	1997	2	2	187160.00	82766.00	2.26	8
18223	1	1998	1	0	88281.00	72111.00	1.22	8
18224	1	1998	1	1	125443.00	48630.00	2.58	8
18225	1	1998	1	2	213724.00	120741.00	1.77	8
18226	1	1998	2	0	41895.00	25707.00	1.63	8
18227	1	1998	2	1	106389.00	38881.00	2.74	8
18228	1	1998	2	2	148284.00	64588.00	2.30	8
18229	1	1999	1	0	113947.00	76020.00	1.50	8
18230	1	1999	1	1	168459.00	55012.00	3.06	8
18231	1	1999	1	2	282406.00	131032.00	2.16	8
18232	1	1999	2	0	86218.00	47735.00	1.81	8
18233	1	1999	2	1	137773.00	42371.00	3.25	8
18234	1	1999	2	2	223991.00	90106.00	2.49	8
18235	1	2000	1	0	114326.00	76036.00	1.50	8
18236	1	2000	1	1	171338.00	52233.00	3.28	8
18237	1	2000	1	2	285664.00	128269.00	2.23	8
18238	1	2000	2	0	88813.00	48037.00	1.85	8
18239	1	2000	2	1	143081.00	42691.00	3.35	8
18240	1	2000	2	2	231894.00	90728.00	2.56	8
18241	1	2001	1	0	121155.00	76135.00	1.59	8
18242	1	2001	1	1	182417.00	55317.00	3.30	8
18243	1	2001	1	2	303572.00	131452.00	2.31	8
18244	1	2001	2	0	97296.00	50826.00	1.91	8
18245	1	2001	2	1	165027.00	47046.00	3.51	8
18246	1	2001	2	2	262323.00	97872.00	2.68	8
18247	1	2002	1	0	136498.00	73587.00	1.85	8
18248	1	2002	1	1	191014.00	54788.00	3.49	8
18249	1	2002	1	2	327512.00	128375.00	2.55	8
18250	1	2002	2	0	105734.00	51203.00	2.06	8
18251	1	2002	2	1	189189.00	48678.00	3.89	8
18252	1	2002	2	2	294923.00	99881.00	2.95	8
18253	1	2003	1	0	146054.00	73548.00	1.99	8
18254	1	2003	1	1	216650.00	54861.00	3.95	8
18255	1	2003	1	2	362704.00	128409.00	2.82	8
18256	1	2003	2	0	112991.00	51265.00	2.20	8
18257	1	2003	2	1	198401.00	48847.00	4.06	8
18258	1	2003	2	2	311392.00	100112.00	3.11	8
18259	1	2004	1	0	159719.00	73642.00	2.17	8
18260	1	2004	1	1	230770.00	55363.00	4.17	8
18261	1	2004	1	2	390489.00	129005.00	3.03	8
18262	1	2004	2	0	123820.00	51422.00	2.41	8
18263	1	2004	2	1	207623.00	48926.00	4.24	8
18264	1	2004	2	2	331443.00	100348.00	3.30	8
18265	1	2005	1	0	166935.00	73648.00	2.27	8
18266	1	2005	1	1	250905.00	55785.00	4.50	8
18267	1	2005	1	2	417840.00	129433.00	3.23	8
18268	1	2005	2	0	133376.00	51566.00	2.59	8
18269	1	2005	2	1	237641.00	49142.00	4.84	8
18270	1	2005	2	2	371017.00	100708.00	3.68	8
18271	1	2006	1	0	177558.00	74204.00	2.39	8
18272	1	2006	1	1	271945.00	55874.00	4.87	8
18273	1	2006	1	2	449503.00	130078.00	3.46	8
18274	1	2006	2	0	140579.00	53050.00	2.65	8
18275	1	2006	2	1	240205.00	50093.00	4.80	8
18276	1	2006	2	2	380784.00	103143.00	3.69	8
18277	1	2007	1	0	181938.00	76722.00	2.37	8
18278	1	2007	1	1	326305.00	67977.00	4.80	8
18279	1	2007	1	2	508243.00	144699.00	3.51	8
18280	1	2007	2	0	173671.00	60987.00	2.85	8
18281	1	2007	2	1	266913.00	54700.00	4.88	8
18282	1	2007	2	2	440584.00	115687.00	3.81	8
18283	1	2008	1	0	214130.00	78332.00	2.73	8
18284	1	2008	1	1	351045.00	71527.00	4.91	8
18285	1	2008	1	2	565175.00	149859.00	3.77	8
18286	1	2008	2	0	184605.00	66843.00	2.76	8
18287	1	2008	2	1	280841.00	59871.00	4.69	8
18288	1	2008	2	2	465446.00	126714.00	3.67	8
18289	1	2009	1	0	194869.00	75552.00	2.58	8
18290	1	2009	1	1	323305.00	71542.00	4.52	8
18291	1	2009	1	2	518174.00	147094.00	3.52	8
18292	1	2009	2	0	184126.00	66212.00	2.78	8
18293	1	2009	2	1	249920.00	59305.00	4.21	8
18294	1	2009	2	2	434046.00	125517.00	3.46	8
18295	1	2010	1	0	205235.00	78817.00	2.60	8
18296	1	2010	1	1	311221.00	70384.00	4.42	8
18297	1	2010	1	2	516456.00	149201.00	3.46	8
18298	1	2010	2	0	196324.00	67620.00	2.90	8
18299	1	2010	2	1	251365.00	58870.00	4.27	8
18300	1	2010	2	2	447689.00	126490.00	3.54	8
18301	1	2011	1	0	214567.00	81465.00	2.63	8
18302	1	2011	1	1	298005.00	69161.00	4.31	8
18303	1	2011	1	2	512572.00	150626.00	3.40	8
18304	1	2011	2	0	201228.00	69342.00	2.90	8
18305	1	2011	2	1	270217.00	64965.00	4.16	8
18306	1	2011	2	2	471445.00	134307.00	3.51	8
18307	1	2012	1	0	214303.00	79786.00	2.69	8
18308	1	2012	1	1	300485.00	69359.00	4.33	8
18309	1	2012	1	2	514788.00	149145.00	3.45	8
18310	1	2012	2	0	210419.00	71761.00	2.93	8
18311	1	2012	2	1	269765.00	64488.00	4.18	8
18312	1	2012	2	2	480184.00	136249.00	3.52	8
18313	1	2013	1	0	225522.00	81354.00	2.77	8
18314	1	2013	1	1	306206.00	69626.00	4.40	8
18315	1	2013	1	2	531728.00	150980.00	3.52	8
18316	1	2013	2	0	210045.00	71489.00	2.94	8
18317	1	2013	2	1	248021.00	59684.00	4.16	8
18318	1	2013	2	2	458066.00	131173.00	3.49	8
18319	1	2014	1	0	219824.00	81524.00	2.70	8
18320	1	2014	1	1	303289.00	69525.00	4.36	8
18321	1	2014	1	2	523113.00	151049.00	3.46	8
18322	1	2014	2	0	211940.00	71768.00	2.95	8
18323	1	2014	2	1	247543.00	60203.00	4.11	8
18324	1	2014	2	2	459483.00	131971.00	3.48	8
18325	1	2015	1	0	223470.00	81418.00	2.74	8
18326	1	2015	1	1	304777.00	68449.00	4.45	8
18327	1	2015	1	2	528247.00	149867.00	3.52	8
18328	1	2015	2	0	182599.00	60397.00	3.02	8
18329	1	2015	2	1	244863.00	58051.00	4.22	8
18330	1	2015	2	2	427462.00	118448.00	3.61	8
18331	1	2016	1	0	234086.00	84935.00	2.76	8
18332	1	2016	1	1	311610.36	69870.00	4.46	8
18333	1	2016	1	2	545696.36	154805.00	3.53	8
18334	1	2016	2	0	178074.00	57913.70	3.07	8
18335	1	2016	2	1	231074.00	55391.00	4.17	8
18336	1	2016	2	2	409148.00	113304.70	3.61	8
18337	1	2017	1	0	229881.00	88558.00	2.60	8
18338	1	2017	1	1	295335.00	70034.00	4.22	8
18339	1	2017	1	2	525216.00	158592.00	3.31	8
18340	1	2017	2	0	182689.00	58950.00	3.10	8
18341	1	2017	2	1	237660.00	55347.00	4.29	8
18342	1	2017	2	2	420349.00	114297.00	3.68	8
18343	1	2018	1	0	237164.00	88741.00	2.67	8
18344	1	2018	1	1	301050.00	69413.00	4.34	8
18345	1	2018	1	2	538214.00	158154.00	3.40	8
18346	1	2018	2	0	176980.86	57579.00	3.07	8
18347	1	2018	2	1	231682.10	54053.00	4.29	8
18348	1	2018	2	2	408662.96	111632.00	3.66	8
18349	1	2019	1	0	225053.39	84246.00	2.67	8
18350	1	2019	1	1	301958.86	69781.00	4.33	8
18351	1	2019	1	2	527012.25	154027.00	3.42	8
18352	1	2019	2	0	152191.95	50587.58	3.01	8
18353	1	2019	2	1	221041.35	51905.00	4.26	8
18354	1	2019	2	2	373233.30	102492.58	3.64	8
18355	1	2020	1	0	242176.32	88883.00	2.72	8
18356	1	2020	1	1	302195.56	70251.00	4.30	8
18357	1	2020	1	2	544371.88	159134.00	3.42	8
18358	1	2020	2	0	157951.44	51362.00	3.08	8
18359	1	2020	2	1	224771.93	51920.00	4.33	8
18360	1	2020	2	2	382723.37	103282.00	3.71	8
18361	2	1987	1	0	\N	\N	\N	8
18362	2	1987	1	1	28850.00	8230.00	3.51	8
18363	2	1987	1	2	28850.00	8230.00	3.51	8
18364	2	1987	2	0	123.00	60.00	2.05	8
18365	2	1987	2	1	38577.00	10640.00	3.63	8
18366	2	1987	2	2	38700.00	10700.00	3.62	8
18367	2	1988	1	0	\N	\N	\N	8
18368	2	1988	1	1	28348.00	8320.00	3.41	8
18369	2	1988	1	2	28348.00	8320.00	3.41	8
18370	2	1988	2	0	400.00	200.00	2.00	8
18371	2	1988	2	1	28620.00	11860.00	2.41	8
18372	2	1988	2	2	29020.00	12060.00	2.41	8
18373	2	1989	1	0	\N	\N	\N	8
18374	2	1989	1	1	32955.00	9130.00	3.61	8
18375	2	1989	1	2	32955.00	9130.00	3.61	8
18376	2	1989	2	0	150.00	70.00	2.14	8
18377	2	1989	2	1	26500.00	7960.00	3.33	8
18378	2	1989	2	2	26650.00	8030.00	3.32	8
18379	2	1990	1	0	\N	\N	\N	8
18380	2	1990	1	1	35026.00	9150.00	3.83	8
18381	2	1990	1	2	35026.00	9150.00	3.83	8
18382	2	1990	2	0	218.00	90.00	2.42	8
18383	2	1990	2	1	27826.00	8060.00	3.45	8
18384	2	1990	2	2	28044.00	8150.00	3.44	8
18385	2	1991	1	0	\N	\N	\N	8
18386	2	1991	1	1	33633.00	9070.00	3.71	8
18387	2	1991	1	2	33633.00	9070.00	3.71	8
18388	2	1991	2	0	198.00	70.00	2.83	8
18389	2	1991	2	1	20489.00	7630.00	2.69	8
18390	2	1991	2	2	20687.00	7700.00	2.69	8
18391	2	1992	1	0	\N	\N	\N	8
18392	2	1992	1	1	34758.00	8940.00	3.89	8
18393	2	1992	1	2	34758.00	8940.00	3.89	8
18394	2	1992	2	0	458.00	160.00	2.86	8
18395	2	1992	2	1	29508.00	7950.00	3.71	8
18396	2	1992	2	2	29966.00	8110.00	3.69	8
18397	2	1993	1	0	\N	\N	\N	8
18398	2	1993	1	1	35578.00	9040.00	3.94	8
18399	2	1993	1	2	35578.00	9040.00	3.94	8
18400	2	1993	2	0	82.00	30.00	2.73	8
18401	2	1993	2	1	29096.00	7960.00	3.66	8
18402	2	1993	2	2	29178.00	7990.00	3.65	8
18403	2	1994	1	0	\N	\N	\N	8
18404	2	1994	1	1	40869.00	10860.00	3.76	8
18405	2	1994	1	2	40869.00	10860.00	3.76	8
18406	2	1994	2	0	\N	\N	\N	8
18407	2	1994	2	1	33932.00	9600.00	3.53	8
18408	2	1994	2	2	33932.00	9600.00	3.53	8
18409	2	1995	1	0	\N	\N	\N	8
18410	2	1995	1	1	42705.00	10950.00	3.90	8
18411	2	1995	1	2	42705.00	10950.00	3.90	8
18412	2	1995	2	0	211.00	75.00	2.81	8
18413	2	1995	2	1	35916.00	10147.00	3.54	8
18414	2	1995	2	2	36127.00	10222.00	3.53	8
18415	2	1996	1	0	\N	\N	\N	8
18416	2	1996	1	1	48833.00	11251.00	4.34	8
18417	2	1996	1	2	48833.00	11251.00	4.34	8
18418	2	1996	2	0	1700.00	500.00	3.40	8
18419	2	1996	2	1	59484.00	15398.00	3.86	8
18420	2	1996	2	2	61184.00	15898.00	3.85	8
18421	2	1997	1	0	\N	\N	\N	8
18422	2	1997	1	1	56670.00	13500.00	4.20	8
18423	2	1997	1	2	56670.00	13500.00	4.20	8
18424	2	1997	2	0	170.00	75.00	2.27	8
18425	2	1997	2	1	48010.00	14325.00	3.35	8
18426	2	1997	2	2	48180.00	14400.00	3.35	8
18427	2	1998	1	0	\N	\N	\N	8
18428	2	1998	1	1	47599.00	12347.00	3.86	8
18429	2	1998	1	2	47599.00	12347.00	3.86	8
18430	2	1998	2	0	280.00	105.00	2.67	8
18431	2	1998	2	1	42616.00	13526.00	3.15	8
18432	2	1998	2	2	42896.00	13631.00	3.15	8
18433	2	1999	1	0	172.00	60.00	2.87	8
18434	2	1999	1	1	49557.00	12456.00	3.98	8
18435	2	1999	1	2	49729.00	12516.00	3.97	8
18436	2	1999	2	0	346.00	130.00	2.66	8
18437	2	1999	2	1	43614.00	13270.00	3.29	8
18438	2	1999	2	2	43960.00	13400.00	3.28	8
18439	2	2000	1	0	210.00	75.00	2.80	8
18440	2	2000	1	1	48015.00	12173.00	3.94	8
18441	2	2000	1	2	48225.00	12248.00	3.94	8
18442	2	2000	2	0	384.00	150.00	2.56	8
18443	2	2000	2	1	31461.00	12280.00	2.56	8
18444	2	2000	2	2	31845.00	12430.00	2.56	8
18445	2	2001	1	0	229.00	75.00	3.05	8
18446	2	2001	1	1	57076.00	13893.00	4.11	8
18447	2	2001	1	2	57305.00	13968.00	4.10	8
18448	2	2001	2	0	224.00	75.00	2.99	8
18449	2	2001	2	1	46011.00	12680.00	3.63	8
18450	2	2001	2	2	46235.00	12755.00	3.62	8
18451	2	2002	1	0	223.00	75.00	2.97	8
18452	2	2002	1	1	52419.00	13022.00	4.03	8
18453	2	2002	1	2	52642.00	13097.00	4.02	8
18454	2	2002	2	0	450.00	150.00	3.00	8
18455	2	2002	2	1	49410.00	13373.00	3.69	8
18456	2	2002	2	2	49860.00	13523.00	3.69	8
18457	2	2003	1	0	\N	\N	\N	8
18458	2	2003	1	1	54412.00	13020.00	4.18	8
18459	2	2003	1	2	54412.00	13020.00	4.18	8
18460	2	2003	2	0	478.00	125.00	3.82	8
18461	2	2003	2	1	58966.00	14510.00	4.06	8
18462	2	2003	2	2	59444.00	14635.00	4.06	8
18463	2	2004	1	0	\N	\N	\N	8
18464	2	2004	1	1	54407.00	12837.00	4.24	8
18465	2	2004	1	2	54407.00	12837.00	4.24	8
18466	2	2004	2	0	706.00	180.00	3.92	8
18467	2	2004	2	1	59026.00	14478.00	4.08	8
18468	2	2004	2	2	59732.00	14658.00	4.08	8
18469	2	2005	1	0	\N	\N	\N	8
18470	2	2005	1	1	59627.00	13703.00	4.35	8
18471	2	2005	1	2	59627.00	13703.00	4.35	8
18472	2	2005	2	0	828.00	205.00	4.04	8
18473	2	2005	2	1	64319.00	14660.00	4.39	8
18474	2	2005	2	2	65147.00	14865.00	4.38	8
18475	2	2006	1	0	\N	\N	\N	8
18476	2	2006	1	1	65719.00	14469.00	4.54	8
18477	2	2006	1	2	65719.00	14469.00	4.54	8
18478	2	2006	2	0	722.00	200.00	3.61	8
18479	2	2006	2	1	62905.00	14860.00	4.23	8
18480	2	2006	2	2	63627.00	15060.00	4.22	8
18481	2	2007	1	0	\N	\N	\N	8
18482	2	2007	1	1	67583.00	14497.00	4.66	8
18483	2	2007	1	2	67583.00	14497.00	4.66	8
18484	2	2007	2	0	2784.00	798.00	3.49	8
18485	2	2007	2	1	61476.00	14645.00	4.20	8
18486	2	2007	2	2	64260.00	15443.00	4.16	8
18487	2	2008	1	0	126.00	35.00	3.60	8
18488	2	2008	1	1	68623.00	14966.00	4.59	8
18489	2	2008	1	2	68749.00	15001.00	4.58	8
18490	2	2008	2	0	3353.00	776.00	4.32	8
18491	2	2008	2	1	64156.00	14517.00	4.42	8
18492	2	2008	2	2	67509.00	15293.00	4.41	8
18493	2	2009	1	0	\N	\N	\N	8
18494	2	2009	1	1	71603.00	15448.00	4.64	8
18495	2	2009	1	2	71603.00	15448.00	4.64	8
18496	2	2009	2	0	2444.00	798.00	3.06	8
18497	2	2009	2	1	51833.00	14518.00	3.57	8
18498	2	2009	2	2	54277.00	15316.00	3.54	8
18499	2	2010	1	0	\N	\N	\N	8
18500	2	2010	1	1	71586.00	15790.00	4.53	8
18501	2	2010	1	2	71586.00	15790.00	4.53	8
18502	2	2010	2	0	2053.00	600.00	3.42	8
18503	2	2010	2	1	57971.00	15214.00	3.81	8
18504	2	2010	2	2	60024.00	15814.00	3.80	8
18505	2	2011	1	0	\N	\N	\N	8
18506	2	2011	1	1	74692.00	16291.00	4.58	8
18507	2	2011	1	2	74692.00	16291.00	4.58	8
18508	2	2011	2	0	1884.00	725.00	2.60	8
18509	2	2011	2	1	46935.00	14101.00	3.33	8
18510	2	2011	2	2	48819.00	14826.00	3.29	8
18511	2	2012	1	0	\N	\N	\N	8
18512	2	2012	1	1	79702.00	16441.00	4.85	8
18513	2	2012	1	2	79702.00	16441.00	4.85	8
18514	2	2012	2	0	1571.00	456.00	3.45	8
18515	2	2012	2	1	53687.00	14236.00	3.77	8
18516	2	2012	2	2	55258.00	14692.00	3.76	8
18517	2	2013	1	0	\N	\N	\N	8
18518	2	2013	1	1	85101.00	16926.00	5.03	8
18519	2	2013	1	2	85101.00	16926.00	5.03	8
18520	2	2013	2	0	1811.00	558.00	3.25	8
18521	2	2013	2	1	53155.00	14806.00	3.59	8
18522	2	2013	2	2	54966.00	15364.00	3.58	8
18523	2	2014	1	0	\N	\N	\N	8
18524	2	2014	1	1	86021.00	16948.00	5.08	8
18525	2	2014	1	2	86021.00	16948.00	5.08	8
18526	2	2014	2	0	2432.00	557.00	4.37	8
18527	2	2014	2	1	66603.00	14823.00	4.49	8
18528	2	2014	2	2	69035.00	15380.00	4.49	8
18529	2	2015	1	0	\N	\N	\N	8
18530	2	2015	1	1	86197.00	16878.00	5.11	8
18531	2	2015	1	2	86197.00	16878.00	5.11	8
18532	2	2015	2	0	2048.00	550.00	3.72	8
18655	2	2002	1	0	781.00	1326.00	0.59	80
18533	2	2015	2	1	63365.00	14407.00	4.40	8
18534	2	2015	2	2	65413.00	14957.00	4.37	8
18535	2	2016	1	0	\N	\N	\N	8
18536	2	2016	1	1	65199.00	15269.00	4.27	8
18537	2	2016	1	2	65199.00	15269.00	4.27	8
18538	2	2016	2	0	1298.00	470.00	2.76	8
18539	2	2016	2	1	55896.00	14652.00	3.81	8
18540	2	2016	2	2	57194.00	15122.00	3.78	8
18541	2	2017	1	0	2.00	1.00	2.00	8
18542	2	2017	1	1	71927.00	15408.82	4.67	8
18543	2	2017	1	2	71929.00	15409.82	4.67	8
18544	2	2017	2	0	1480.00	412.00	3.59	8
18545	2	2017	2	1	62860.00	14253.00	4.41	8
18546	2	2017	2	2	64340.00	14665.00	4.39	8
18547	2	2018	1	0	0.00	0.00	\N	8
18548	2	2018	1	1	68743.00	15175.00	4.53	8
18549	2	2018	1	2	68743.00	15175.00	4.53	8
18550	2	2018	2	0	1428.00	400.00	3.57	8
18551	2	2018	2	1	60319.24	14837.00	4.07	8
18552	2	2018	2	2	61747.24	15237.00	4.05	8
18553	2	2019	1	0	0.00	0.00	\N	8
18554	2	2019	1	1	60252.88	14072.45	4.28	8
18555	2	2019	1	2	60252.88	14072.45	4.28	8
18556	2	2019	2	0	1379.00	371.00	3.72	8
18557	2	2019	2	1	55332.00	14035.00	3.94	8
18558	2	2019	2	2	56711.00	14406.00	3.94	8
18559	2	2020	1	0	0.00	0.00	\N	8
18560	2	2020	1	1	68955.00	14559.00	4.74	8
18561	2	2020	1	2	68955.00	14559.00	4.74	8
18562	2	2020	2	0	1078.00	333.00	3.24	8
18563	2	2020	2	1	55110.00	13372.07	4.12	8
18564	2	2020	2	2	56188.00	13705.07	4.10	8
18565	2	1987	1	0	\N	\N	\N	80
18566	2	1987	1	1	\N	\N	\N	80
18567	2	1987	1	2	\N	\N	\N	80
18568	2	1987	2	0	\N	\N	\N	80
18569	2	1987	2	1	\N	\N	\N	80
18570	2	1987	2	2	\N	\N	\N	80
18571	2	1988	1	0	\N	\N	\N	80
18572	2	1988	1	1	\N	\N	\N	80
18573	2	1988	1	2	\N	\N	\N	80
18574	2	1988	2	0	\N	\N	\N	80
18575	2	1988	2	1	\N	\N	\N	80
18576	2	1988	2	2	\N	\N	\N	80
18577	2	1989	1	0	\N	\N	\N	80
18578	2	1989	1	1	\N	\N	\N	80
18579	2	1989	1	2	\N	\N	\N	80
18580	2	1989	2	0	\N	\N	\N	80
18581	2	1989	2	1	\N	\N	\N	80
18582	2	1989	2	2	\N	\N	\N	80
18583	2	1990	1	0	\N	\N	\N	80
18584	2	1990	1	1	\N	\N	\N	80
18585	2	1990	1	2	\N	\N	\N	80
18586	2	1990	2	0	\N	\N	\N	80
18587	2	1990	2	1	\N	\N	\N	80
18588	2	1990	2	2	\N	\N	\N	80
18589	2	1991	1	0	\N	\N	\N	80
18590	2	1991	1	1	\N	\N	\N	80
18591	2	1991	1	2	\N	\N	\N	80
18592	2	1991	2	0	\N	\N	\N	80
18593	2	1991	2	1	\N	\N	\N	80
18594	2	1991	2	2	\N	\N	\N	80
18595	2	1992	1	0	\N	\N	\N	80
18596	2	1992	1	1	\N	\N	\N	80
18597	2	1992	1	2	\N	\N	\N	80
18598	2	1992	2	0	\N	\N	\N	80
18599	2	1992	2	1	\N	\N	\N	80
18600	2	1992	2	2	\N	\N	\N	80
18601	2	1993	1	0	\N	\N	\N	80
18602	2	1993	1	1	\N	\N	\N	80
18603	2	1993	1	2	\N	\N	\N	80
18604	2	1993	2	0	\N	\N	\N	80
18605	2	1993	2	1	\N	\N	\N	80
18606	2	1993	2	2	\N	\N	\N	80
18607	2	1994	1	0	4623.00	1740.00	2.66	80
18608	2	1994	1	1	3775.00	1100.00	3.43	80
18609	2	1994	1	2	8398.00	2840.00	2.96	80
18610	2	1994	2	0	4483.00	1930.00	2.32	80
18611	2	1994	2	1	9057.00	2120.00	4.27	80
18612	2	1994	2	2	13540.00	4050.00	3.34	80
18613	2	1995	1	0	2449.00	2000.00	1.22	80
18614	2	1995	1	1	6322.00	1760.00	3.59	80
18615	2	1995	1	2	8771.00	3760.00	2.33	80
18616	2	1995	2	0	7264.00	4210.00	1.73	80
18617	2	1995	2	1	13088.00	3400.00	3.85	80
18618	2	1995	2	2	20352.00	7610.00	2.67	80
18619	2	1996	1	0	4720.00	2430.00	1.94	80
18620	2	1996	1	1	7396.00	2091.00	3.54	80
18621	2	1996	1	2	12116.00	4521.00	2.68	80
18622	2	1996	2	0	5799.00	3667.00	1.58	80
18623	2	1996	2	1	15066.00	4498.00	3.35	80
18624	2	1996	2	2	20865.00	8165.00	2.56	80
18625	2	1997	1	0	3517.00	2070.00	1.70	80
18626	2	1997	1	1	7975.00	2329.00	3.42	80
18627	2	1997	1	2	11492.00	4399.00	2.61	80
18628	2	1997	2	0	5484.00	3550.00	1.54	80
18629	2	1997	2	1	13914.00	3948.00	3.52	80
18630	2	1997	2	2	19398.00	7498.00	2.59	80
18631	2	1998	1	0	243.00	190.00	1.28	80
18632	2	1998	1	1	5519.00	1909.00	2.89	80
18633	2	1998	1	2	5762.00	2099.00	2.75	80
18634	2	1998	2	0	7255.00	5323.00	1.36	80
18635	2	1998	2	1	16128.00	4199.00	3.84	80
18636	2	1998	2	2	23383.00	9522.00	2.46	80
18637	2	1999	1	0	1083.00	930.00	1.16	80
18638	2	1999	1	1	9576.00	3125.00	3.06	80
18639	2	1999	1	2	10659.00	4055.00	2.63	80
18640	2	1999	2	0	3928.00	4616.00	0.85	80
18641	2	1999	2	1	13220.00	3951.00	3.35	80
18642	2	1999	2	2	17148.00	8567.00	2.00	80
18643	2	2000	1	0	950.00	629.00	1.51	80
18644	2	2000	1	1	10469.00	3145.00	3.33	80
18645	2	2000	1	2	11419.00	3774.00	3.03	80
18646	2	2000	2	0	5967.00	5104.00	1.17	80
18647	2	2000	2	1	15825.00	4101.00	3.86	80
18648	2	2000	2	2	21792.00	9205.00	2.37	80
18649	2	2001	1	0	717.00	535.00	1.34	80
18650	2	2001	1	1	9452.00	2925.00	3.23	80
18651	2	2001	1	2	10169.00	3460.00	2.94	80
18652	2	2001	2	0	7342.00	6561.00	1.12	80
18653	2	2001	2	1	16526.00	4913.00	3.36	80
18654	2	2001	2	2	23868.00	11474.00	2.08	80
18656	2	2002	1	1	7861.00	2636.00	2.98	80
18657	2	2002	1	2	8642.00	3962.00	2.18	80
18658	2	2002	2	0	10987.00	7053.00	1.56	80
18659	2	2002	2	1	21187.00	5693.00	3.72	80
18660	2	2002	2	2	32174.00	12746.00	2.52	80
18661	2	2003	1	0	812.00	493.00	1.65	80
18662	2	2003	1	1	13509.00	4232.00	3.19	80
18663	2	2003	1	2	14321.00	4725.00	3.03	80
18664	2	2003	2	0	9433.00	6128.00	1.54	80
18665	2	2003	2	1	20539.00	5423.00	3.79	80
18666	2	2003	2	2	29972.00	11551.00	2.59	80
18667	2	2004	1	0	1017.00	710.00	1.43	80
18668	2	2004	1	1	13651.00	4266.00	3.20	80
18669	2	2004	1	2	14668.00	4976.00	2.95	80
18670	2	2004	2	0	7806.00	5363.00	1.46	80
18671	2	2004	2	1	18139.00	4989.00	3.64	80
18672	2	2004	2	2	25945.00	10352.00	2.51	80
18673	2	2005	1	0	400.00	430.00	0.93	80
18674	2	2005	1	1	10037.00	3399.00	2.95	80
18675	2	2005	1	2	10437.00	3829.00	2.73	80
18676	2	2005	2	0	7976.00	4799.00	1.66	80
18677	2	2005	2	1	19840.00	5674.00	3.50	80
18678	2	2005	2	2	27816.00	10473.00	2.66	80
18679	2	2006	1	0	1538.00	882.00	1.74	80
18680	2	2006	1	1	10678.00	3582.00	2.98	80
18681	2	2006	1	2	12216.00	4464.00	2.74	80
18682	2	2006	2	0	9856.00	3916.00	2.52	80
18683	2	2006	2	1	19742.00	5419.00	3.64	80
18684	2	2006	2	2	29598.00	9335.00	3.17	80
18685	2	2007	1	0	2138.00	873.00	2.45	80
18686	2	2007	1	1	9858.00	3061.00	3.22	80
18687	2	2007	1	2	11996.00	3934.00	3.05	80
18688	2	2007	2	0	11558.00	3910.00	2.96	80
18689	2	2007	2	1	22285.00	6112.00	3.65	80
18690	2	2007	2	2	33843.00	10022.00	3.38	80
18691	2	2008	1	0	2500.00	888.00	2.82	80
18692	2	2008	1	1	13825.00	3957.00	3.49	80
18693	2	2008	1	2	16325.00	4845.00	3.37	80
18694	2	2008	2	0	8232.00	3439.00	2.39	80
18695	2	2008	2	1	20226.00	5530.00	3.66	80
18696	2	2008	2	2	28458.00	8969.00	3.17	80
18697	2	2009	1	0	2452.00	1052.00	2.33	80
18698	2	2009	1	1	13938.00	3998.00	3.49	80
18699	2	2009	1	2	16390.00	5050.00	3.25	80
18700	2	2009	2	0	11095.00	4220.00	2.63	80
18701	2	2009	2	1	20078.00	5687.00	3.53	80
18702	2	2009	2	2	31173.00	9907.00	3.15	80
18703	2	2010	1	0	1960.00	896.00	2.19	80
18704	2	2010	1	1	9768.00	3610.00	2.71	80
18705	2	2010	1	2	11728.00	4506.00	2.60	80
18706	2	2010	2	0	11304.00	4049.00	2.79	80
18707	2	2010	2	1	20408.00	5581.00	3.66	80
18708	2	2010	2	2	31712.00	9630.00	3.29	80
18709	2	2011	1	0	2972.00	1050.00	2.83	80
18710	2	2011	1	1	15103.00	4151.00	3.64	80
18711	2	2011	1	2	18075.00	5201.00	3.48	80
18712	2	2011	2	0	10722.00	3979.00	2.69	80
18713	2	2011	2	1	19737.00	5499.00	3.59	80
18714	2	2011	2	2	30459.00	9478.00	3.21	80
18715	2	2012	1	0	2660.00	900.00	2.96	80
18716	2	2012	1	1	14384.00	4124.00	3.49	80
18717	2	2012	1	2	17044.00	5024.00	3.39	80
18718	2	2012	2	0	10881.00	3981.00	2.73	80
18719	2	2012	2	1	19232.00	5609.00	3.43	80
18720	2	2012	2	2	30113.00	9590.00	3.14	80
18721	2	2013	1	0	2693.00	954.00	2.82	80
18722	2	2013	1	1	14159.00	4081.00	3.47	80
18723	2	2013	1	2	16852.00	5035.00	3.35	80
18724	2	2013	2	0	9156.00	3276.00	2.79	80
18725	2	2013	2	1	23679.00	6389.00	3.71	80
18726	2	2013	2	2	32835.00	9665.00	3.40	80
18727	2	2014	1	0	2098.00	731.00	2.87	80
18728	2	2014	1	1	13090.00	3776.00	3.47	80
18729	2	2014	1	2	15188.00	4507.00	3.37	80
18730	2	2014	2	0	10370.00	3562.00	2.91	80
18731	2	2014	2	1	23874.00	6512.00	3.67	80
18732	2	2014	2	2	34244.00	10074.00	3.40	80
18733	2	2015	1	0	1726.00	663.00	2.60	80
18734	2	2015	1	1	10652.00	3465.00	3.07	80
18735	2	2015	1	2	12378.00	4128.00	3.00	80
18736	2	2015	2	0	10182.00	3481.00	2.93	80
18737	2	2015	2	1	23712.00	6643.00	3.57	80
18738	2	2015	2	2	33894.00	10124.00	3.35	80
18739	2	2016	1	0	1633.00	640.00	2.55	80
18740	2	2016	1	1	9130.00	3194.00	2.86	80
18741	2	2016	1	2	10763.00	3834.00	2.81	80
18742	2	2016	2	0	7881.00	2880.00	2.74	80
18743	2	2016	2	1	22603.00	6465.00	3.50	80
18744	2	2016	2	2	30484.00	9345.00	3.26	80
18745	2	2017	1	0	1950.00	700.00	2.79	80
18746	2	2017	1	1	11208.00	3587.00	3.12	80
18747	2	2017	1	2	13158.00	4287.00	3.07	80
18748	2	2017	2	0	6619.00	2574.00	2.57	80
18749	2	2017	2	1	21841.00	6393.00	3.42	80
18750	2	2017	2	2	28460.00	8967.00	3.17	80
18751	2	2018	1	0	1440.00	587.00	2.45	80
18752	2	2018	1	1	10578.00	3380.00	3.13	80
18753	2	2018	1	2	12018.00	3967.00	3.03	80
18754	2	2018	2	0	6263.70	2342.00	2.67	80
18755	2	2018	2	1	21082.00	6181.00	3.41	80
18756	2	2018	2	2	27345.70	8523.00	3.21	80
18757	2	2019	1	0	1007.00	421.00	2.39	80
18758	2	2019	1	1	9254.00	3006.00	3.08	80
18759	2	2019	1	2	10261.00	3427.00	2.99	80
18760	2	2019	2	0	5716.00	1904.00	3.00	80
18761	2	2019	2	1	22518.00	6311.00	3.57	80
18762	2	2019	2	2	28234.00	8215.00	3.44	80
18763	2	2020	1	0	1543.15	584.00	2.64	80
18764	2	2020	1	1	11928.63	3602.98	3.31	80
18765	2	2020	1	2	13471.78	4186.98	3.22	80
18766	2	2020	2	0	4989.24	1747.98	2.85	80
18767	2	2020	2	1	20648.26	6332.84	3.26	80
18768	2	2020	2	2	25637.50	8080.82	3.17	80
18769	2	1987	1	0	\N	\N	\N	81
18770	2	1987	1	1	\N	\N	\N	81
18771	2	1987	1	2	\N	\N	\N	81
18772	2	1987	2	0	\N	\N	\N	81
18773	2	1987	2	1	\N	\N	\N	81
18774	2	1987	2	2	\N	\N	\N	81
18775	2	1988	1	0	\N	\N	\N	81
18776	2	1988	1	1	\N	\N	\N	81
18777	2	1988	1	2	\N	\N	\N	81
18778	2	1988	2	0	\N	\N	\N	81
18779	2	1988	2	1	\N	\N	\N	81
18780	2	1988	2	2	\N	\N	\N	81
18781	2	1989	1	0	\N	\N	\N	81
18782	2	1989	1	1	\N	\N	\N	81
18783	2	1989	1	2	\N	\N	\N	81
18784	2	1989	2	0	\N	\N	\N	81
18785	2	1989	2	1	\N	\N	\N	81
18786	2	1989	2	2	\N	\N	\N	81
18787	2	1990	1	0	\N	\N	\N	81
18788	2	1990	1	1	\N	\N	\N	81
18789	2	1990	1	2	\N	\N	\N	81
18790	2	1990	2	0	\N	\N	\N	81
18791	2	1990	2	1	\N	\N	\N	81
18792	2	1990	2	2	\N	\N	\N	81
18793	2	1991	1	0	\N	\N	\N	81
18794	2	1991	1	1	\N	\N	\N	81
18795	2	1991	1	2	\N	\N	\N	81
18796	2	1991	2	0	\N	\N	\N	81
18797	2	1991	2	1	\N	\N	\N	81
18798	2	1991	2	2	\N	\N	\N	81
18799	2	1992	1	0	\N	\N	\N	81
18800	2	1992	1	1	\N	\N	\N	81
18801	2	1992	1	2	\N	\N	\N	81
18802	2	1992	2	0	\N	\N	\N	81
18803	2	1992	2	1	\N	\N	\N	81
18804	2	1992	2	2	\N	\N	\N	81
18805	2	1993	1	0	\N	\N	\N	81
18806	2	1993	1	1	\N	\N	\N	81
18807	2	1993	1	2	\N	\N	\N	81
18808	2	1993	2	0	\N	\N	\N	81
18809	2	1993	2	1	\N	\N	\N	81
18810	2	1993	2	2	\N	\N	\N	81
18811	2	1994	1	0	52.00	20.00	2.60	81
18812	2	1994	1	1	12117.00	5159.00	2.35	81
18813	2	1994	1	2	12169.00	5179.00	2.35	81
18814	2	1994	2	0	1150.00	908.00	1.27	81
18815	2	1994	2	1	15273.00	5831.00	2.62	81
18816	2	1994	2	2	16423.00	6739.00	2.44	81
18817	2	1995	1	0	38.00	16.00	2.38	81
18818	2	1995	1	1	9799.00	5184.00	1.89	81
18819	2	1995	1	2	9837.00	5200.00	1.89	81
18820	2	1995	2	0	1407.00	822.00	1.71	81
18821	2	1995	2	1	16730.00	6720.00	2.49	81
18822	2	1995	2	2	18137.00	7542.00	2.40	81
18823	2	1996	1	0	24.00	11.00	2.18	81
18824	2	1996	1	1	11946.00	5166.00	2.31	81
18825	2	1996	1	2	11970.00	5177.00	2.31	81
18826	2	1996	2	0	1207.00	534.00	2.26	81
18827	2	1996	2	1	15197.00	6640.00	2.29	81
18828	2	1996	2	2	16404.00	7174.00	2.29	81
18829	2	1997	1	0	56.00	26.00	2.15	81
18830	2	1997	1	1	12646.00	5364.00	2.36	81
18831	2	1997	1	2	12702.00	5390.00	2.36	81
18832	2	1997	2	0	1006.00	406.00	2.48	81
18833	2	1997	2	1	16082.00	6593.00	2.44	81
18834	2	1997	2	2	17088.00	6999.00	2.44	81
18835	2	1998	1	0	\N	\N	\N	81
18836	2	1998	1	1	8652.00	4278.00	2.02	81
18837	2	1998	1	2	8652.00	4278.00	2.02	81
18838	2	1998	2	0	722.00	329.00	2.19	81
18839	2	1998	2	1	12683.00	7769.00	1.63	81
18840	2	1998	2	2	13405.00	8098.00	1.66	81
18841	2	1999	1	0	254.00	104.00	2.44	81
18842	2	1999	1	1	12127.00	4970.00	2.44	81
18843	2	1999	1	2	12381.00	5074.00	2.44	81
18844	2	1999	2	0	447.00	197.00	2.27	81
18845	2	1999	2	1	14013.00	4728.00	2.96	81
18846	2	1999	2	2	14460.00	4925.00	2.94	81
18847	2	2000	1	0	1419.00	641.00	2.21	81
18848	2	2000	1	1	12447.00	4697.00	2.65	81
18849	2	2000	1	2	13866.00	5338.00	2.60	81
18850	2	2000	2	0	13738.00	5792.00	2.37	81
18851	2	2000	2	1	21333.00	7458.00	2.86	81
18852	2	2000	2	2	35071.00	13250.00	2.65	81
18853	2	2001	1	0	2248.00	798.00	2.82	81
18854	2	2001	1	1	23102.00	7107.00	3.25	81
18855	2	2001	1	2	25350.00	7905.00	3.21	81
18856	2	2001	2	0	10278.00	4450.00	2.31	81
18857	2	2001	2	1	24345.00	7968.00	3.06	81
18858	2	2001	2	2	34623.00	12418.00	2.79	81
18859	2	2002	1	0	2076.00	846.00	2.45	81
18860	2	2002	1	1	22239.00	6937.00	3.21	81
18861	2	2002	1	2	24315.00	7783.00	3.12	81
18862	2	2002	2	0	10428.00	4423.00	2.36	81
18863	2	2002	2	1	25100.00	8167.00	3.07	81
18864	2	2002	2	2	35528.00	12590.00	2.82	81
18865	2	2003	1	0	2479.00	846.00	2.93	81
18866	2	2003	1	1	26565.00	7994.00	3.32	81
18867	2	2003	1	2	29044.00	8840.00	3.29	81
18868	2	2003	2	0	8228.00	3008.00	2.74	81
18869	2	2003	2	1	23472.00	7384.00	3.18	81
18870	2	2003	2	2	31700.00	10392.00	3.05	81
18871	2	2004	1	0	2961.00	1003.00	2.95	81
18872	2	2004	1	1	43245.00	9402.00	4.60	81
18873	2	2004	1	2	46206.00	10405.00	4.44	81
18874	2	2004	2	0	12030.00	3650.00	3.30	81
18875	2	2004	2	1	27791.00	8133.00	3.42	81
18876	2	2004	2	2	39821.00	11783.00	3.38	81
18877	2	2005	1	0	3522.00	1150.00	3.06	81
18878	2	2005	1	1	44287.00	9366.00	4.73	81
18879	2	2005	1	2	47809.00	10516.00	4.55	81
18880	2	2005	2	0	11736.00	3700.00	3.17	81
18881	2	2005	2	1	26574.00	8101.00	3.28	81
18882	2	2005	2	2	38310.00	11801.00	3.25	81
18883	2	2006	1	0	4116.00	1300.00	3.17	81
18884	2	2006	1	1	45232.00	9306.00	4.86	81
18885	2	2006	1	2	49348.00	10606.00	4.65	81
18886	2	2006	2	0	12435.00	3800.00	3.27	81
18887	2	2006	2	1	33234.00	8714.00	3.81	81
18888	2	2006	2	2	45669.00	12514.00	3.65	81
18889	2	2007	1	0	3961.00	1303.00	3.04	81
18890	2	2007	1	1	42665.00	9173.00	4.65	81
18891	2	2007	1	2	46626.00	10476.00	4.45	81
18892	2	2007	2	0	31052.00	11365.00	2.73	81
18893	2	2007	2	1	27023.00	7103.00	3.80	81
18894	2	2007	2	2	58075.00	18468.00	3.14	81
18895	2	2008	1	0	3836.00	1303.00	2.94	81
18896	2	2008	1	1	39855.00	8900.00	4.48	81
18897	2	2008	1	2	43691.00	10203.00	4.28	81
18898	2	2008	2	0	28751.00	11365.00	2.53	81
18899	2	2008	2	1	29190.00	8068.00	3.62	81
18900	2	2008	2	2	57941.00	19433.00	2.98	81
18901	2	2009	1	0	3698.00	1196.00	3.09	81
18902	2	2009	1	1	40973.00	9016.00	4.54	81
18903	2	2009	1	2	44671.00	10212.00	4.37	81
18904	2	2009	2	0	26934.00	10997.00	2.45	81
18905	2	2009	2	1	28774.00	8124.00	3.54	81
18906	2	2009	2	2	55708.00	19121.00	2.91	81
18907	2	2010	1	0	3533.00	1196.00	2.95	81
18908	2	2010	1	1	37108.00	9016.00	4.12	81
18909	2	2010	1	2	40641.00	10212.00	3.98	81
18910	2	2010	2	0	25441.00	10945.00	2.32	81
18911	2	2010	2	1	30607.00	8124.00	3.77	81
18912	2	2010	2	2	56048.00	19069.00	2.94	81
18913	2	2011	1	0	3734.00	1176.00	3.18	81
18914	2	2011	1	1	40097.00	9127.00	4.39	81
18915	2	2011	1	2	43831.00	10303.00	4.25	81
18916	2	2011	2	0	23531.00	10881.00	2.16	81
18917	2	2011	2	1	31127.00	8192.00	3.80	81
18918	2	2011	2	2	54658.00	19073.00	2.87	81
18919	2	2012	1	0	3993.00	1176.00	3.40	81
18920	2	2012	1	1	40955.00	9129.00	4.49	81
18921	2	2012	1	2	44948.00	10305.00	4.36	81
18922	2	2012	2	0	25578.00	10881.00	2.35	81
18923	2	2012	2	1	35365.00	8243.00	4.29	81
18924	2	2012	2	2	60943.00	19124.00	3.19	81
18925	2	2013	1	0	4118.00	1176.00	3.50	81
18926	2	2013	1	1	41540.00	9129.00	4.55	81
18927	2	2013	1	2	45658.00	10305.00	4.43	81
18928	2	2013	2	0	25034.00	10408.00	2.41	81
18929	2	2013	2	1	36049.00	8229.00	4.38	81
18930	2	2013	2	2	61083.00	18637.00	3.28	81
18931	2	2014	1	0	4210.00	1129.00	3.73	81
18932	2	2014	1	1	42631.00	9205.00	4.63	81
18933	2	2014	1	2	46841.00	10334.00	4.53	81
18934	2	2014	2	0	24023.00	10170.00	2.36	81
18935	2	2014	2	1	30294.00	7062.40	4.29	81
18936	2	2014	2	2	54317.00	17232.40	3.15	81
18937	2	2015	1	0	4335.00	1127.00	3.85	81
18938	2	2015	1	1	43174.00	9213.00	4.69	81
18939	2	2015	1	2	47509.00	10340.00	4.59	81
18940	2	2015	2	0	20914.00	10155.00	2.06	81
18941	2	2015	2	1	28030.00	7057.00	3.97	81
18942	2	2015	2	2	48944.00	17212.00	2.84	81
18943	2	2016	1	0	4497.00	1127.00	3.99	81
18944	2	2016	1	1	44142.00	9213.00	4.79	81
18945	2	2016	1	2	48639.00	10340.00	4.70	81
18946	2	2016	2	0	13192.00	7855.00	1.68	81
18947	2	2016	2	1	24599.00	6755.00	3.64	81
18948	2	2016	2	2	37791.00	14610.00	2.59	81
18949	2	2017	1	0	4656.00	1127.00	4.13	81
18950	2	2017	1	1	47246.00	9660.00	4.89	81
18951	2	2017	1	2	51902.00	10787.00	4.81	81
18952	2	2017	2	0	17487.00	8241.00	2.12	81
18953	2	2017	2	1	33946.00	7217.00	4.70	81
18954	2	2017	2	2	51433.00	15458.00	3.33	81
18955	2	2018	1	0	4286.00	1130.00	3.79	81
18956	2	2018	1	1	45027.00	9661.00	4.66	81
18957	2	2018	1	2	49313.00	10791.00	4.57	81
18958	2	2018	2	0	9122.00	6249.00	1.46	81
18959	2	2018	2	1	17910.86	6272.00	2.86	81
18960	2	2018	2	2	27032.86	12521.00	2.16	81
18961	2	2019	1	0	1846.00	1082.00	1.71	81
18962	2	2019	1	1	35761.00	9661.00	3.70	81
18963	2	2019	1	2	37607.00	10743.00	3.50	81
18964	2	2019	2	0	15968.18	5794.00	2.76	81
18965	2	2019	2	1	33243.40	7861.00	4.23	81
18966	2	2019	2	2	49211.58	13655.00	3.60	81
18967	2	2020	1	0	4992.22	1130.00	4.42	81
18968	2	2020	1	1	45302.54	9661.46	4.69	81
18969	2	2020	1	2	50294.76	10791.46	4.66	81
18970	2	2020	2	0	16139.00	7076.00	2.28	81
18971	2	2020	2	1	30436.00	8144.00	3.74	81
18972	2	2020	2	2	46575.00	15220.00	3.06	81
18973	2	1987	1	0	\N	\N	\N	82
18974	2	1987	1	1	\N	\N	\N	82
18975	2	1987	1	2	\N	\N	\N	82
18976	2	1987	2	0	\N	\N	\N	82
18977	2	1987	2	1	\N	\N	\N	82
18978	2	1987	2	2	\N	\N	\N	82
18979	2	1988	1	0	\N	\N	\N	82
18980	2	1988	1	1	\N	\N	\N	82
18981	2	1988	1	2	\N	\N	\N	82
18982	2	1988	2	0	\N	\N	\N	82
18983	2	1988	2	1	\N	\N	\N	82
18984	2	1988	2	2	\N	\N	\N	82
18985	2	1989	1	0	\N	\N	\N	82
18986	2	1989	1	1	\N	\N	\N	82
18987	2	1989	1	2	\N	\N	\N	82
18988	2	1989	2	0	\N	\N	\N	82
18989	2	1989	2	1	\N	\N	\N	82
18990	2	1989	2	2	\N	\N	\N	82
18991	2	1990	1	0	\N	\N	\N	82
18992	2	1990	1	1	\N	\N	\N	82
18993	2	1990	1	2	\N	\N	\N	82
18994	2	1990	2	0	\N	\N	\N	82
18995	2	1990	2	1	\N	\N	\N	82
18996	2	1990	2	2	\N	\N	\N	82
18997	2	1991	1	0	\N	\N	\N	82
18998	2	1991	1	1	\N	\N	\N	82
18999	2	1991	1	2	\N	\N	\N	82
19000	2	1991	2	0	\N	\N	\N	82
19001	2	1991	2	1	\N	\N	\N	82
19002	2	1991	2	2	\N	\N	\N	82
19003	2	1992	1	0	\N	\N	\N	82
19004	2	1992	1	1	\N	\N	\N	82
19005	2	1992	1	2	\N	\N	\N	82
19006	2	1992	2	0	\N	\N	\N	82
19007	2	1992	2	1	\N	\N	\N	82
19008	2	1992	2	2	\N	\N	\N	82
19009	2	1993	1	0	\N	\N	\N	82
19010	2	1993	1	1	\N	\N	\N	82
19011	2	1993	1	2	\N	\N	\N	82
19012	2	1993	2	0	\N	\N	\N	82
19013	2	1993	2	1	\N	\N	\N	82
19014	2	1993	2	2	\N	\N	\N	82
19015	2	1994	1	0	\N	\N	\N	82
19016	2	1994	1	1	\N	\N	\N	82
19017	2	1994	1	2	\N	\N	\N	82
19018	2	1994	2	0	\N	\N	\N	82
19019	2	1994	2	1	\N	\N	\N	82
19020	2	1994	2	2	\N	\N	\N	82
19021	2	1995	1	0	\N	\N	\N	82
19022	2	1995	1	1	\N	\N	\N	82
19023	2	1995	1	2	\N	\N	\N	82
19024	2	1995	2	0	\N	\N	\N	82
19025	2	1995	2	1	\N	\N	\N	82
19026	2	1995	2	2	\N	\N	\N	82
19027	2	1996	1	0	\N	\N	\N	82
19028	2	1996	1	1	\N	\N	\N	82
19029	2	1996	1	2	\N	\N	\N	82
19030	2	1996	2	0	\N	\N	\N	82
19031	2	1996	2	1	\N	\N	\N	82
19032	2	1996	2	2	\N	\N	\N	82
19033	2	1997	1	0	\N	\N	\N	82
19034	2	1997	1	1	\N	\N	\N	82
19035	2	1997	1	2	\N	\N	\N	82
19036	2	1997	2	0	\N	\N	\N	82
19037	2	1997	2	1	\N	\N	\N	82
19038	2	1997	2	2	\N	\N	\N	82
19039	2	1998	1	0	\N	\N	\N	82
19040	2	1998	1	1	\N	\N	\N	82
19041	2	1998	1	2	\N	\N	\N	82
19042	2	1998	2	0	\N	\N	\N	82
19043	2	1998	2	1	\N	\N	\N	82
19044	2	1998	2	2	\N	\N	\N	82
19045	2	1999	1	0	\N	\N	\N	82
19046	2	1999	1	1	\N	\N	\N	82
19047	2	1999	1	2	\N	\N	\N	82
19048	2	1999	2	0	\N	\N	\N	82
19049	2	1999	2	1	\N	\N	\N	82
19050	2	1999	2	2	\N	\N	\N	82
19051	2	2000	1	0	\N	\N	\N	82
19052	2	2000	1	1	\N	\N	\N	82
19053	2	2000	1	2	\N	\N	\N	82
19054	2	2000	2	0	\N	\N	\N	82
19055	2	2000	2	1	\N	\N	\N	82
19056	2	2000	2	2	\N	\N	\N	82
19057	2	2001	1	0	\N	\N	\N	82
19058	2	2001	1	1	\N	\N	\N	82
19059	2	2001	1	2	\N	\N	\N	82
19060	2	2001	2	0	\N	\N	\N	82
19061	2	2001	2	1	\N	\N	\N	82
19062	2	2001	2	2	\N	\N	\N	82
19063	2	2002	1	0	3890.00	1183.00	3.29	82
19064	2	2002	1	1	40029.00	10375.00	3.86	82
19065	2	2002	1	2	43919.00	11558.00	3.80	82
19066	2	2002	2	0	5061.00	1324.00	3.82	82
19067	2	2002	2	1	48942.00	11914.00	4.11	82
19068	2	2002	2	2	54003.00	13238.00	4.08	82
19069	2	2003	1	0	6224.00	1798.00	3.46	82
19070	2	2003	1	1	39415.00	9956.00	3.96	82
19071	2	2003	1	2	45639.00	11754.00	3.88	82
19072	2	2003	2	0	7038.00	1713.00	4.11	82
19073	2	2003	2	1	53973.00	12219.00	4.42	82
19074	2	2003	2	2	61011.00	13932.00	4.38	82
19075	2	2004	1	0	9204.00	2186.00	4.21	82
19076	2	2004	1	1	43668.00	9791.00	4.46	82
19077	2	2004	1	2	52872.00	11977.00	4.41	82
19078	2	2004	2	0	5611.00	1732.00	3.24	82
19079	2	2004	2	1	57266.00	11918.00	4.81	82
19080	2	2004	2	2	62877.00	13650.00	4.61	82
19081	2	2005	1	0	2062.00	835.00	2.47	82
19082	2	2005	1	1	41243.00	9955.00	4.14	82
19083	2	2005	1	2	43305.00	10790.00	4.01	82
19084	2	2005	2	0	7020.00	1694.00	4.14	82
19085	2	2005	2	1	57211.00	11768.00	4.86	82
19086	2	2005	2	2	64231.00	13462.00	4.77	82
19087	2	2006	1	0	5965.00	1665.00	3.58	82
19088	2	2006	1	1	41585.00	10237.00	4.06	82
19089	2	2006	1	2	47550.00	11902.00	4.00	82
19090	2	2006	2	0	8099.00	1941.00	4.17	82
19091	2	2006	2	1	51851.00	11251.00	4.61	82
19092	2	2006	2	2	59950.00	13192.00	4.54	82
19093	2	2007	1	0	5874.00	1628.00	3.61	82
19094	2	2007	1	1	42651.00	9958.00	4.28	82
19095	2	2007	1	2	48525.00	11586.00	4.19	82
19096	2	2007	2	0	7069.00	1818.00	3.89	82
19097	2	2007	2	1	39829.00	9745.00	4.09	82
19098	2	2007	2	2	46898.00	11563.00	4.06	82
19099	2	2008	1	0	6412.00	1758.00	3.65	82
19100	2	2008	1	1	38341.00	9642.00	3.98	82
19101	2	2008	1	2	44753.00	11400.00	3.93	82
19102	2	2008	2	0	6366.00	1802.00	3.53	82
19103	2	2008	2	1	38094.00	9781.00	3.89	82
19104	2	2008	2	2	44460.00	11583.00	3.84	82
19105	2	2009	1	0	5865.00	1688.00	3.47	82
19106	2	2009	1	1	37403.00	9790.00	3.82	82
19107	2	2009	1	2	43268.00	11478.00	3.77	82
19108	2	2009	2	0	5291.00	1828.00	2.89	82
19109	2	2009	2	1	43548.00	10345.00	4.21	82
19110	2	2009	2	2	48839.00	12173.00	4.01	82
19111	2	2010	1	0	4376.00	1439.00	3.04	82
19112	2	2010	1	1	47408.00	10293.00	4.61	82
19113	2	2010	1	2	51784.00	11732.00	4.41	82
19114	2	2010	2	0	8083.00	2234.00	3.62	82
19115	2	2010	2	1	43383.00	10324.00	4.20	82
19116	2	2010	2	2	51466.00	12558.00	4.10	82
19117	2	2011	1	0	5472.00	1801.00	3.04	82
19118	2	2011	1	1	38333.00	10445.00	3.67	82
19119	2	2011	1	2	43805.00	12246.00	3.58	82
19120	2	2011	2	0	8454.00	2167.00	3.90	82
19121	2	2011	2	1	45463.00	10351.00	4.39	82
19122	2	2011	2	2	53917.00	12518.00	4.31	82
19123	2	2012	1	0	7821.00	2400.00	3.26	82
19124	2	2012	1	1	42222.00	10392.00	4.06	82
19125	2	2012	1	2	50043.00	12792.00	3.91	82
19126	2	2012	2	0	8758.00	2397.00	3.65	82
19127	2	2012	2	1	42962.00	10038.00	4.28	82
19128	2	2012	2	2	51720.00	12435.00	4.16	82
19129	2	2013	1	0	7472.00	2261.00	3.30	82
19130	2	2013	1	1	38851.00	10235.00	3.80	82
19131	2	2013	1	2	46323.00	12496.00	3.71	82
19132	2	2013	2	0	8185.00	2397.00	3.41	82
19133	2	2013	2	1	40032.00	10254.00	3.90	82
19134	2	2013	2	2	48217.00	12651.00	3.81	82
19135	2	2014	1	0	7215.00	2030.00	3.55	82
19136	2	2014	1	1	45914.00	10729.00	4.28	82
19137	2	2014	1	2	53129.00	12759.00	4.16	82
19138	2	2014	2	0	8645.00	2385.00	3.62	82
19139	2	2014	2	1	47561.00	11254.00	4.23	82
19140	2	2014	2	2	56206.00	13639.00	4.12	82
19141	2	2015	1	0	5096.00	1562.00	3.26	82
19142	2	2015	1	1	43882.00	10501.00	4.18	82
19143	2	2015	1	2	48978.00	12063.00	4.06	82
19144	2	2015	2	0	6116.00	1910.00	3.20	82
19145	2	2015	2	1	40853.00	10905.00	3.75	82
19146	2	2015	2	2	46969.00	12815.00	3.67	82
19147	2	2016	1	0	3425.00	1444.00	2.37	82
19148	2	2016	1	1	37437.00	9970.00	3.75	82
19149	2	2016	1	2	40862.00	11414.00	3.58	82
19150	2	2016	2	0	9388.00	2203.00	4.26	82
19151	2	2016	2	1	53524.00	11453.00	4.67	82
19152	2	2016	2	2	62912.00	13656.00	4.61	82
19153	2	2017	1	0	5761.00	1869.00	3.08	82
19154	2	2017	1	1	32986.00	8913.00	3.70	82
19155	2	2017	1	2	38747.00	10782.00	3.59	82
19156	2	2017	2	0	10071.00	2628.00	3.83	82
19157	2	2017	2	1	51319.00	11923.00	4.30	82
19158	2	2017	2	2	61390.00	14551.00	4.22	82
19159	2	2018	1	0	9397.00	2394.00	3.93	82
19160	2	2018	1	1	46700.00	10636.00	4.39	82
19161	2	2018	1	2	56097.00	13030.00	4.31	82
19162	2	2018	2	0	9875.02	2607.00	3.79	82
19163	2	2018	2	1	57139.60	12078.00	4.73	82
19164	2	2018	2	2	67014.62	14685.00	4.56	82
19165	2	2019	1	0	8018.00	2123.00	3.78	82
19166	2	2019	1	1	45622.00	10738.00	4.25	82
19167	2	2019	1	2	53640.00	12861.00	4.17	82
19168	2	2019	2	0	10649.00	2779.00	3.83	82
19169	2	2019	2	1	53271.08	12338.00	4.32	82
19170	2	2019	2	2	63920.08	15117.00	4.23	82
19171	2	2020	1	0	8917.59	2671.00	3.34	82
19172	2	2020	1	1	48038.80	10540.00	4.56	82
19173	2	2020	1	2	56956.40	13211.00	4.31	82
19174	2	2020	2	0	11321.50	3120.00	3.63	82
19175	2	2020	2	1	56655.39	13110.00	4.32	82
19176	2	2020	2	2	67976.89	16230.00	4.19	82
19177	2	1987	1	0	\N	\N	\N	83
19178	2	1987	1	1	\N	\N	\N	83
19179	2	1987	1	2	\N	\N	\N	83
19180	2	1987	2	0	\N	\N	\N	83
19181	2	1987	2	1	\N	\N	\N	83
19182	2	1987	2	2	\N	\N	\N	83
19183	2	1988	1	0	\N	\N	\N	83
19184	2	1988	1	1	\N	\N	\N	83
19185	2	1988	1	2	\N	\N	\N	83
19186	2	1988	2	0	\N	\N	\N	83
19187	2	1988	2	1	\N	\N	\N	83
19188	2	1988	2	2	\N	\N	\N	83
19189	2	1989	1	0	\N	\N	\N	83
19190	2	1989	1	1	\N	\N	\N	83
19191	2	1989	1	2	\N	\N	\N	83
19192	2	1989	2	0	\N	\N	\N	83
19193	2	1989	2	1	\N	\N	\N	83
19194	2	1989	2	2	\N	\N	\N	83
19195	2	1990	1	0	\N	\N	\N	83
19196	2	1990	1	1	\N	\N	\N	83
19197	2	1990	1	2	\N	\N	\N	83
19198	2	1990	2	0	\N	\N	\N	83
19199	2	1990	2	1	\N	\N	\N	83
19200	2	1990	2	2	\N	\N	\N	83
19201	2	1991	1	0	\N	\N	\N	83
19202	2	1991	1	1	\N	\N	\N	83
19203	2	1991	1	2	\N	\N	\N	83
19204	2	1991	2	0	\N	\N	\N	83
19205	2	1991	2	1	\N	\N	\N	83
19206	2	1991	2	2	\N	\N	\N	83
19207	2	1992	1	0	\N	\N	\N	83
19208	2	1992	1	1	\N	\N	\N	83
19209	2	1992	1	2	\N	\N	\N	83
19210	2	1992	2	0	\N	\N	\N	83
19211	2	1992	2	1	\N	\N	\N	83
19212	2	1992	2	2	\N	\N	\N	83
19213	2	1993	1	0	\N	\N	\N	83
19214	2	1993	1	1	\N	\N	\N	83
19215	2	1993	1	2	\N	\N	\N	83
19216	2	1993	2	0	\N	\N	\N	83
19217	2	1993	2	1	\N	\N	\N	83
19218	2	1993	2	2	\N	\N	\N	83
19219	2	1994	1	0	\N	\N	\N	83
19220	2	1994	1	1	\N	\N	\N	83
19221	2	1994	1	2	\N	\N	\N	83
19222	2	1994	2	0	\N	\N	\N	83
19223	2	1994	2	1	\N	\N	\N	83
19224	2	1994	2	2	\N	\N	\N	83
19225	2	1995	1	0	\N	\N	\N	83
19226	2	1995	1	1	\N	\N	\N	83
19227	2	1995	1	2	\N	\N	\N	83
19228	2	1995	2	0	\N	\N	\N	83
19229	2	1995	2	1	\N	\N	\N	83
19230	2	1995	2	2	\N	\N	\N	83
19231	2	1996	1	0	\N	\N	\N	83
19232	2	1996	1	1	\N	\N	\N	83
19233	2	1996	1	2	\N	\N	\N	83
19234	2	1996	2	0	\N	\N	\N	83
19235	2	1996	2	1	\N	\N	\N	83
19236	2	1996	2	2	\N	\N	\N	83
19237	2	1997	1	0	\N	\N	\N	83
19238	2	1997	1	1	\N	\N	\N	83
19239	2	1997	1	2	\N	\N	\N	83
19240	2	1997	2	0	\N	\N	\N	83
19241	2	1997	2	1	\N	\N	\N	83
19242	2	1997	2	2	\N	\N	\N	83
19243	2	1998	1	0	\N	\N	\N	83
19244	2	1998	1	1	\N	\N	\N	83
19245	2	1998	1	2	\N	\N	\N	83
19246	2	1998	2	0	\N	\N	\N	83
19247	2	1998	2	1	\N	\N	\N	83
19248	2	1998	2	2	\N	\N	\N	83
19249	2	1999	1	0	\N	\N	\N	83
19250	2	1999	1	1	\N	\N	\N	83
19251	2	1999	1	2	\N	\N	\N	83
19252	2	1999	2	0	\N	\N	\N	83
19253	2	1999	2	1	\N	\N	\N	83
19254	2	1999	2	2	\N	\N	\N	83
19255	2	2000	1	0	\N	\N	\N	83
19256	2	2000	1	1	\N	\N	\N	83
19257	2	2000	1	2	\N	\N	\N	83
19258	2	2000	2	0	\N	\N	\N	83
19259	2	2000	2	1	\N	\N	\N	83
19260	2	2000	2	2	\N	\N	\N	83
19261	2	2001	1	0	\N	\N	\N	83
19262	2	2001	1	1	\N	\N	\N	83
19263	2	2001	1	2	\N	\N	\N	83
19264	2	2001	2	0	\N	\N	\N	83
19265	2	2001	2	1	\N	\N	\N	83
19266	2	2001	2	2	\N	\N	\N	83
19267	2	2002	1	0	9937.00	3741.00	2.66	83
19268	2	2002	1	1	33359.00	9897.00	3.37	83
19269	2	2002	1	2	43296.00	13638.00	3.17	83
19270	2	2002	2	0	39822.00	15429.00	2.58	83
19271	2	2002	2	1	45387.00	13376.00	3.39	83
19272	2	2002	2	2	85209.00	28805.00	2.96	83
19273	2	2003	1	0	7541.00	2589.00	2.91	83
19274	2	2003	1	1	33840.00	9641.00	3.51	83
19275	2	2003	1	2	41381.00	12230.00	3.38	83
19276	2	2003	2	0	45125.00	16550.00	2.73	83
19277	2	2003	2	1	48021.00	13543.00	3.55	83
19278	2	2003	2	2	93146.00	30093.00	3.10	83
19279	2	2004	1	0	9054.00	3003.00	3.01	83
19280	2	2004	1	1	35162.00	9925.00	3.54	83
19281	2	2004	1	2	44216.00	12928.00	3.42	83
19282	2	2004	2	0	54006.00	17450.00	3.09	83
19283	2	2004	2	1	47464.00	13399.00	3.54	83
19284	2	2004	2	2	101470.00	30849.00	3.29	83
19285	2	2005	1	0	6273.00	2186.00	2.87	83
19286	2	2005	1	1	32687.00	9714.00	3.36	83
19287	2	2005	1	2	38960.00	11900.00	3.27	83
19288	2	2005	2	0	47119.00	22262.00	2.12	83
19289	2	2005	2	1	57982.00	13810.00	4.20	83
19290	2	2005	2	2	105101.00	36072.00	2.91	83
19291	2	2006	1	0	9917.00	3025.00	3.28	83
19292	2	2006	1	1	42538.00	10106.00	4.21	83
19293	2	2006	1	2	52455.00	13131.00	3.99	83
19294	2	2006	2	0	45673.00	16067.00	2.84	83
19295	2	2006	2	1	52491.00	12821.00	4.09	83
19296	2	2006	2	2	98164.00	28888.00	3.40	83
19297	2	2007	1	0	13296.00	4584.00	2.90	83
19298	2	2007	1	1	40522.00	10200.00	3.97	83
19299	2	2007	1	2	53818.00	14784.00	3.64	83
19300	2	2007	2	0	55677.00	17734.00	3.14	83
19301	2	2007	2	1	45647.00	10665.00	4.28	83
19302	2	2007	2	2	101324.00	28399.00	3.57	83
19303	2	2008	1	0	16241.00	5206.00	3.12	83
19304	2	2008	1	1	27360.00	6960.00	3.93	83
19305	2	2008	1	2	43601.00	12166.00	3.58	83
19306	2	2008	2	0	56878.00	18266.00	3.11	83
19307	2	2008	2	1	49877.00	11068.00	4.51	83
19308	2	2008	2	2	106755.00	29334.00	3.64	83
19309	2	2009	1	0	22999.00	7326.00	3.14	83
19310	2	2009	1	1	31079.00	7456.00	4.17	83
19311	2	2009	1	2	54078.00	14782.00	3.66	83
19312	2	2009	2	0	58151.00	19482.00	2.98	83
19313	2	2009	2	1	50187.00	11267.00	4.45	83
19314	2	2009	2	2	108338.00	30749.00	3.52	83
19315	2	2010	1	0	13737.00	5558.00	2.47	83
19316	2	2010	1	1	28424.00	6980.00	4.07	83
19317	2	2010	1	2	42161.00	12538.00	3.36	83
19318	2	2010	2	0	60362.00	20281.00	2.98	83
19319	2	2010	2	1	39904.00	8862.00	4.50	83
19320	2	2010	2	2	100266.00	29143.00	3.44	83
19321	2	2011	1	0	33768.00	10045.00	3.36	83
19322	2	2011	1	1	33013.00	7919.00	4.17	83
19323	2	2011	1	2	66781.00	17964.00	3.72	83
19324	2	2011	2	0	61355.00	19730.00	3.11	83
19325	2	2011	2	1	40523.00	9416.00	4.30	83
19326	2	2011	2	2	101878.00	29146.00	3.50	83
19327	2	2012	1	0	38126.00	11192.00	3.41	83
19328	2	2012	1	1	37835.00	8535.00	4.43	83
19329	2	2012	1	2	75961.00	19727.00	3.85	83
19330	2	2012	2	0	56422.00	16083.00	3.51	83
19331	2	2012	2	1	37794.00	8703.00	4.34	83
19332	2	2012	2	2	94216.00	24786.00	3.80	83
19333	2	2013	1	0	42667.00	12131.00	3.52	83
19334	2	2013	1	1	34122.00	7798.00	4.38	83
19335	2	2013	1	2	76789.00	19929.00	3.85	83
19336	2	2013	2	0	52557.00	14611.00	3.60	83
19337	2	2013	2	1	43920.00	9774.00	4.49	83
19338	2	2013	2	2	96477.00	24385.00	3.96	83
19339	2	2014	1	0	42903.00	12316.00	3.48	83
19340	2	2014	1	1	36954.00	8342.00	4.43	83
19341	2	2014	1	2	79857.00	20658.00	3.87	83
19342	2	2014	2	0	52924.00	14585.00	3.63	83
19343	2	2014	2	1	40754.00	9109.00	4.47	83
19344	2	2014	2	2	93678.00	23694.00	3.95	83
19345	2	2015	1	0	39451.00	11206.00	3.52	83
19346	2	2015	1	1	36601.00	8317.00	4.40	83
19347	2	2015	1	2	76052.00	19523.00	3.90	83
19348	2	2015	2	0	56002.00	15219.00	3.68	83
19349	2	2015	2	1	42961.00	9298.00	4.62	83
19350	2	2015	2	2	98963.00	24517.00	4.04	83
19351	2	2016	1	0	20563.50	9404.00	2.19	83
19352	2	2016	1	1	25111.87	7182.00	3.50	83
19353	2	2016	1	2	45675.37	16586.00	2.75	83
19354	2	2016	2	0	63764.00	16083.00	3.96	83
19355	2	2016	2	1	48310.00	10419.00	4.64	83
19356	2	2016	2	2	112074.00	26502.00	4.23	83
19357	2	2017	1	0	36461.00	9398.00	3.88	83
19358	2	2017	1	1	34381.00	7191.00	4.78	83
19359	2	2017	1	2	70842.00	16589.00	4.27	83
19360	2	2017	2	0	66279.00	16210.00	4.09	83
19361	2	2017	2	1	51765.00	11252.00	4.60	83
19362	2	2017	2	2	118044.00	27462.00	4.30	83
19363	2	2018	1	0	38265.00	10170.00	3.76	83
19364	2	2018	1	1	35601.00	7681.00	4.63	83
19365	2	2018	1	2	73866.00	17851.00	4.14	83
19366	2	2018	2	0	59867.74	15577.00	3.84	83
19367	2	2018	2	1	51094.93	11890.14	4.30	83
19368	2	2018	2	2	110962.66	27467.13	4.04	83
19369	2	2019	1	0	30462.61	9078.00	3.36	83
19370	2	2019	1	1	30266.67	7267.00	4.16	83
19371	2	2019	1	2	60729.28	16345.00	3.72	83
19372	2	2019	2	0	63677.16	16463.00	3.87	83
19373	2	2019	2	1	54209.93	11722.00	4.62	83
19374	2	2019	2	2	117887.09	28185.00	4.18	83
19375	2	2020	1	0	29192.24	7356.00	3.97	83
19376	2	2020	1	1	32860.42	7480.00	4.39	83
19377	2	2020	1	2	62052.66	14836.00	4.18	83
19378	2	2020	2	0	63124.11	17118.00	3.69	83
19379	2	2020	2	1	49631.85	11673.00	4.25	83
19380	2	2020	2	2	112755.96	28791.00	3.92	83
19381	2	1987	1	0	\N	\N	\N	85
19382	2	1987	1	1	\N	\N	\N	85
19383	2	1987	1	2	\N	\N	\N	85
19384	2	1987	2	0	\N	\N	\N	85
19385	2	1987	2	1	\N	\N	\N	85
19386	2	1987	2	2	\N	\N	\N	85
19387	2	1988	1	0	\N	\N	\N	85
19388	2	1988	1	1	\N	\N	\N	85
19389	2	1988	1	2	\N	\N	\N	85
19390	2	1988	2	0	\N	\N	\N	85
19391	2	1988	2	1	\N	\N	\N	85
19392	2	1988	2	2	\N	\N	\N	85
19393	2	1989	1	0	\N	\N	\N	85
19394	2	1989	1	1	\N	\N	\N	85
19395	2	1989	1	2	\N	\N	\N	85
19396	2	1989	2	0	\N	\N	\N	85
19397	2	1989	2	1	\N	\N	\N	85
19398	2	1989	2	2	\N	\N	\N	85
19399	2	1990	1	0	\N	\N	\N	85
19400	2	1990	1	1	\N	\N	\N	85
19401	2	1990	1	2	\N	\N	\N	85
19402	2	1990	2	0	\N	\N	\N	85
19403	2	1990	2	1	\N	\N	\N	85
19404	2	1990	2	2	\N	\N	\N	85
19405	2	1991	1	0	\N	\N	\N	85
19406	2	1991	1	1	\N	\N	\N	85
19407	2	1991	1	2	\N	\N	\N	85
19408	2	1991	2	0	\N	\N	\N	85
19409	2	1991	2	1	\N	\N	\N	85
19410	2	1991	2	2	\N	\N	\N	85
19411	2	1992	1	0	\N	\N	\N	85
19412	2	1992	1	1	\N	\N	\N	85
19413	2	1992	1	2	\N	\N	\N	85
19414	2	1992	2	0	\N	\N	\N	85
19415	2	1992	2	1	\N	\N	\N	85
19416	2	1992	2	2	\N	\N	\N	85
19417	2	1993	1	0	\N	\N	\N	85
19418	2	1993	1	1	\N	\N	\N	85
19419	2	1993	1	2	\N	\N	\N	85
19420	2	1993	2	0	\N	\N	\N	85
19421	2	1993	2	1	\N	\N	\N	85
19422	2	1993	2	2	\N	\N	\N	85
19423	2	1994	1	0	\N	\N	\N	85
19424	2	1994	1	1	\N	\N	\N	85
19425	2	1994	1	2	\N	\N	\N	85
19426	2	1994	2	0	\N	\N	\N	85
19427	2	1994	2	1	\N	\N	\N	85
19428	2	1994	2	2	\N	\N	\N	85
19429	2	1995	1	0	\N	\N	\N	85
19430	2	1995	1	1	\N	\N	\N	85
19431	2	1995	1	2	\N	\N	\N	85
19432	2	1995	2	0	\N	\N	\N	85
19433	2	1995	2	1	\N	\N	\N	85
19434	2	1995	2	2	\N	\N	\N	85
19435	2	1996	1	0	\N	\N	\N	85
19436	2	1996	1	1	\N	\N	\N	85
19437	2	1996	1	2	\N	\N	\N	85
19438	2	1996	2	0	\N	\N	\N	85
19439	2	1996	2	1	\N	\N	\N	85
19440	2	1996	2	2	\N	\N	\N	85
19441	2	1997	1	0	\N	\N	\N	85
19442	2	1997	1	1	\N	\N	\N	85
19443	2	1997	1	2	\N	\N	\N	85
19444	2	1997	2	0	\N	\N	\N	85
19445	2	1997	2	1	\N	\N	\N	85
19446	2	1997	2	2	\N	\N	\N	85
19447	2	1998	1	0	\N	\N	\N	85
19448	2	1998	1	1	\N	\N	\N	85
19449	2	1998	1	2	\N	\N	\N	85
19450	2	1998	2	0	\N	\N	\N	85
19451	2	1998	2	1	\N	\N	\N	85
19452	2	1998	2	2	\N	\N	\N	85
19453	2	1999	1	0	\N	\N	\N	85
19454	2	1999	1	1	\N	\N	\N	85
19455	2	1999	1	2	\N	\N	\N	85
19456	2	1999	2	0	\N	\N	\N	85
19457	2	1999	2	1	\N	\N	\N	85
19458	2	1999	2	2	\N	\N	\N	85
19459	2	2000	1	0	\N	\N	\N	85
19460	2	2000	1	1	\N	\N	\N	85
19461	2	2000	1	2	\N	\N	\N	85
19462	2	2000	2	0	\N	\N	\N	85
19463	2	2000	2	1	\N	\N	\N	85
19464	2	2000	2	2	\N	\N	\N	85
19465	2	2001	1	0	\N	\N	\N	85
19466	2	2001	1	1	\N	\N	\N	85
19467	2	2001	1	2	\N	\N	\N	85
19468	2	2001	2	0	\N	\N	\N	85
19469	2	2001	2	1	\N	\N	\N	85
19470	2	2001	2	2	\N	\N	\N	85
19471	2	2002	1	0	\N	\N	\N	85
19472	2	2002	1	1	\N	\N	\N	85
19473	2	2002	1	2	\N	\N	\N	85
19474	2	2002	2	0	\N	\N	\N	85
19475	2	2002	2	1	\N	\N	\N	85
19476	2	2002	2	2	\N	\N	\N	85
19477	2	2003	1	0	\N	\N	\N	85
19478	2	2003	1	1	\N	\N	\N	85
19479	2	2003	1	2	\N	\N	\N	85
19480	2	2003	2	0	\N	\N	\N	85
19481	2	2003	2	1	\N	\N	\N	85
19482	2	2003	2	2	\N	\N	\N	85
19483	2	2004	1	0	\N	\N	\N	85
19484	2	2004	1	1	\N	\N	\N	85
19485	2	2004	1	2	\N	\N	\N	85
19486	2	2004	2	0	\N	\N	\N	85
19487	2	2004	2	1	\N	\N	\N	85
19488	2	2004	2	2	\N	\N	\N	85
19489	2	2005	1	0	\N	\N	\N	85
19490	2	2005	1	1	\N	\N	\N	85
19491	2	2005	1	2	\N	\N	\N	85
19492	2	2005	2	0	\N	\N	\N	85
19493	2	2005	2	1	\N	\N	\N	85
19494	2	2005	2	2	\N	\N	\N	85
19495	2	2006	1	0	\N	\N	\N	85
19496	2	2006	1	1	\N	\N	\N	85
19497	2	2006	1	2	\N	\N	\N	85
19498	2	2006	2	0	\N	\N	\N	85
19499	2	2006	2	1	\N	\N	\N	85
19500	2	2006	2	2	\N	\N	\N	85
19501	2	2007	1	0	\N	\N	\N	85
19502	2	2007	1	1	\N	\N	\N	85
19503	2	2007	1	2	\N	\N	\N	85
19504	2	2007	2	0	\N	\N	\N	85
19505	2	2007	2	1	\N	\N	\N	85
19506	2	2007	2	2	\N	\N	\N	85
19507	2	2008	1	0	\N	\N	\N	85
19508	2	2008	1	1	\N	\N	\N	85
19509	2	2008	1	2	\N	\N	\N	85
19510	2	2008	2	0	\N	\N	\N	85
19511	2	2008	2	1	\N	\N	\N	85
19512	2	2008	2	2	\N	\N	\N	85
19513	2	2009	1	0	\N	\N	\N	85
19514	2	2009	1	1	\N	\N	\N	85
19515	2	2009	1	2	\N	\N	\N	85
19516	2	2009	2	0	503.00	185.00	2.72	85
19517	2	2009	2	1	1833.00	621.00	2.95	85
19518	2	2009	2	2	2336.00	806.00	2.90	85
19519	2	2010	1	0	1811.00	748.00	2.42	85
19520	2	2010	1	1	3640.00	1334.00	2.73	85
19521	2	2010	1	2	5451.00	2082.00	2.62	85
19522	2	2010	2	0	461.00	217.00	2.12	85
19523	2	2010	2	1	2797.00	1241.00	2.25	85
19524	2	2010	2	2	3258.00	1458.00	2.23	85
19525	2	2011	1	0	892.00	430.00	2.07	85
19526	2	2011	1	1	2573.00	1130.00	2.28	85
19527	2	2011	1	2	3465.00	1560.00	2.22	85
19528	2	2011	2	0	601.00	295.00	2.04	85
19529	2	2011	2	1	2527.00	1100.00	2.30	85
19530	2	2011	2	2	3128.00	1395.00	2.24	85
19531	2	2012	1	0	1047.00	495.00	2.12	85
19532	2	2012	1	1	2436.00	1060.00	2.30	85
19533	2	2012	1	2	3483.00	1555.00	2.24	85
19534	2	2012	2	0	407.00	195.00	2.09	85
19535	2	2012	2	1	1937.00	855.00	2.27	85
19536	2	2012	2	2	2344.00	1050.00	2.23	85
19537	2	2013	1	0	1128.00	522.00	2.16	85
19538	2	2013	1	1	2520.00	1045.00	2.41	85
19539	2	2013	1	2	3648.00	1567.00	2.33	85
19540	2	2013	2	0	869.00	378.00	2.30	85
19541	2	2013	2	1	2410.00	989.00	2.44	85
19542	2	2013	2	2	3279.00	1367.00	2.40	85
19543	2	2014	1	0	1048.00	517.00	2.03	85
19544	2	2014	1	1	2472.00	1050.00	2.35	85
19545	2	2014	1	2	3520.00	1567.00	2.25	85
19546	2	2014	2	0	761.00	368.00	2.07	85
19547	2	2014	2	1	2226.00	999.00	2.23	85
19548	2	2014	2	2	2987.00	1367.00	2.19	85
19549	2	2015	1	0	1214.00	583.00	2.08	85
19550	2	2015	1	1	2397.00	1057.00	2.27	85
19551	2	2015	1	2	3611.00	1640.00	2.20	85
19552	2	2015	2	0	556.00	275.00	2.02	85
19553	2	2015	2	1	1969.00	931.00	2.11	85
19554	2	2015	2	2	2525.00	1206.00	2.09	85
19555	2	2016	1	0	1038.00	521.00	1.99	85
19556	2	2016	1	1	2122.00	1035.00	2.05	85
19557	2	2016	1	2	3160.00	1556.00	2.03	85
19558	2	2016	2	0	618.00	295.00	2.09	85
19559	2	2016	2	1	2122.00	948.00	2.24	85
19560	2	2016	2	2	2740.00	1243.00	2.20	85
19561	2	2017	1	0	1220.00	583.00	2.09	85
19562	2	2017	1	1	2299.00	1045.00	2.20	85
19563	2	2017	1	2	3519.00	1628.00	2.16	85
19564	2	2017	2	0	885.00	423.00	2.09	85
19565	2	2017	2	1	2655.00	1180.00	2.25	85
19566	2	2017	2	2	3540.00	1603.00	2.21	85
19567	2	2018	1	0	1351.00	624.00	2.17	85
19568	2	2018	1	1	2728.00	1115.00	2.45	85
19569	2	2018	1	2	4079.00	1739.00	2.35	85
19570	2	2018	2	0	1002.90	482.00	2.08	85
19571	2	2018	2	1	2772.00	1255.00	2.21	85
19572	2	2018	2	2	3774.90	1737.00	2.17	85
19573	2	2019	1	0	1600.50	643.00	2.49	85
19574	2	2019	1	1	2679.00	1115.00	2.40	85
19575	2	2019	1	2	4279.50	1758.00	2.43	85
19576	2	2019	2	0	448.40	215.00	2.09	85
19577	2	2019	2	1	1324.30	590.00	2.24	85
19578	2	2019	2	2	1772.70	805.00	2.20	85
19579	2	2020	1	0	1040.00	465.00	2.24	85
19580	2	2020	1	1	2464.00	1030.00	2.39	85
19581	2	2020	1	2	3504.00	1495.00	2.34	85
19582	2	2020	2	0	1250.90	538.00	2.33	85
19583	2	2020	2	1	2118.00	850.00	2.49	85
19584	2	2020	2	2	3368.90	1388.00	2.43	85
19585	2	1987	1	0	\N	\N	\N	86
19586	2	1987	1	1	\N	\N	\N	86
19587	2	1987	1	2	\N	\N	\N	86
19588	2	1987	2	0	\N	\N	\N	86
19589	2	1987	2	1	\N	\N	\N	86
19590	2	1987	2	2	\N	\N	\N	86
19591	2	1988	1	0	\N	\N	\N	86
19592	2	1988	1	1	\N	\N	\N	86
19593	2	1988	1	2	\N	\N	\N	86
19594	2	1988	2	0	\N	\N	\N	86
19595	2	1988	2	1	\N	\N	\N	86
19596	2	1988	2	2	\N	\N	\N	86
19597	2	1989	1	0	\N	\N	\N	86
19598	2	1989	1	1	\N	\N	\N	86
19599	2	1989	1	2	\N	\N	\N	86
19600	2	1989	2	0	\N	\N	\N	86
19601	2	1989	2	1	\N	\N	\N	86
19602	2	1989	2	2	\N	\N	\N	86
19603	2	1990	1	0	\N	\N	\N	86
19604	2	1990	1	1	\N	\N	\N	86
19605	2	1990	1	2	\N	\N	\N	86
19606	2	1990	2	0	\N	\N	\N	86
19607	2	1990	2	1	\N	\N	\N	86
19608	2	1990	2	2	\N	\N	\N	86
19609	2	1991	1	0	\N	\N	\N	86
19610	2	1991	1	1	\N	\N	\N	86
19611	2	1991	1	2	\N	\N	\N	86
19612	2	1991	2	0	\N	\N	\N	86
19613	2	1991	2	1	\N	\N	\N	86
19614	2	1991	2	2	\N	\N	\N	86
19615	2	1992	1	0	\N	\N	\N	86
19616	2	1992	1	1	\N	\N	\N	86
19617	2	1992	1	2	\N	\N	\N	86
19618	2	1992	2	0	\N	\N	\N	86
19619	2	1992	2	1	\N	\N	\N	86
19620	2	1992	2	2	\N	\N	\N	86
19621	2	1993	1	0	\N	\N	\N	86
19622	2	1993	1	1	\N	\N	\N	86
19623	2	1993	1	2	\N	\N	\N	86
19624	2	1993	2	0	\N	\N	\N	86
19625	2	1993	2	1	\N	\N	\N	86
19626	2	1993	2	2	\N	\N	\N	86
19627	2	1994	1	0	\N	\N	\N	86
19628	2	1994	1	1	\N	\N	\N	86
19629	2	1994	1	2	\N	\N	\N	86
19630	2	1994	2	0	\N	\N	\N	86
19631	2	1994	2	1	\N	\N	\N	86
19632	2	1994	2	2	\N	\N	\N	86
19633	2	1995	1	0	\N	\N	\N	86
19634	2	1995	1	1	\N	\N	\N	86
19635	2	1995	1	2	\N	\N	\N	86
19636	2	1995	2	0	\N	\N	\N	86
19637	2	1995	2	1	\N	\N	\N	86
19638	2	1995	2	2	\N	\N	\N	86
19639	2	1996	1	0	\N	\N	\N	86
19640	2	1996	1	1	\N	\N	\N	86
19641	2	1996	1	2	\N	\N	\N	86
19642	2	1996	2	0	\N	\N	\N	86
19643	2	1996	2	1	\N	\N	\N	86
19644	2	1996	2	2	\N	\N	\N	86
19645	2	1997	1	0	\N	\N	\N	86
19646	2	1997	1	1	\N	\N	\N	86
19647	2	1997	1	2	\N	\N	\N	86
19648	2	1997	2	0	\N	\N	\N	86
19649	2	1997	2	1	\N	\N	\N	86
19650	2	1997	2	2	\N	\N	\N	86
19651	2	1998	1	0	\N	\N	\N	86
19652	2	1998	1	1	\N	\N	\N	86
19653	2	1998	1	2	\N	\N	\N	86
19654	2	1998	2	0	\N	\N	\N	86
19655	2	1998	2	1	\N	\N	\N	86
19656	2	1998	2	2	\N	\N	\N	86
19657	2	1999	1	0	\N	\N	\N	86
19658	2	1999	1	1	\N	\N	\N	86
19659	2	1999	1	2	\N	\N	\N	86
19660	2	1999	2	0	\N	\N	\N	86
19661	2	1999	2	1	\N	\N	\N	86
19662	2	1999	2	2	\N	\N	\N	86
19663	2	2000	1	0	\N	\N	\N	86
19664	2	2000	1	1	\N	\N	\N	86
19665	2	2000	1	2	\N	\N	\N	86
19666	2	2000	2	0	\N	\N	\N	86
19667	2	2000	2	1	\N	\N	\N	86
19668	2	2000	2	2	\N	\N	\N	86
19669	2	2001	1	0	\N	\N	\N	86
19670	2	2001	1	1	\N	\N	\N	86
19671	2	2001	1	2	\N	\N	\N	86
19672	2	2001	2	0	\N	\N	\N	86
19673	2	2001	2	1	\N	\N	\N	86
19674	2	2001	2	2	\N	\N	\N	86
19675	2	2002	1	0	\N	\N	\N	86
19676	2	2002	1	1	\N	\N	\N	86
19677	2	2002	1	2	\N	\N	\N	86
19678	2	2002	2	0	\N	\N	\N	86
19679	2	2002	2	1	\N	\N	\N	86
19680	2	2002	2	2	\N	\N	\N	86
19681	2	2003	1	0	\N	\N	\N	86
19682	2	2003	1	1	\N	\N	\N	86
19683	2	2003	1	2	\N	\N	\N	86
19684	2	2003	2	0	\N	\N	\N	86
19685	2	2003	2	1	\N	\N	\N	86
19686	2	2003	2	2	\N	\N	\N	86
19687	2	2004	1	0	\N	\N	\N	86
19688	2	2004	1	1	\N	\N	\N	86
19689	2	2004	1	2	\N	\N	\N	86
19690	2	2004	2	0	\N	\N	\N	86
19691	2	2004	2	1	\N	\N	\N	86
19692	2	2004	2	2	\N	\N	\N	86
19693	2	2005	1	0	\N	\N	\N	86
19694	2	2005	1	1	\N	\N	\N	86
19695	2	2005	1	2	\N	\N	\N	86
19696	2	2005	2	0	\N	\N	\N	86
19697	2	2005	2	1	\N	\N	\N	86
19698	2	2005	2	2	\N	\N	\N	86
19699	2	2006	1	0	\N	\N	\N	86
19700	2	2006	1	1	\N	\N	\N	86
19701	2	2006	1	2	\N	\N	\N	86
19702	2	2006	2	0	\N	\N	\N	86
19703	2	2006	2	1	\N	\N	\N	86
19704	2	2006	2	2	\N	\N	\N	86
19705	2	2007	1	0	\N	\N	\N	86
19706	2	2007	1	1	\N	\N	\N	86
19707	2	2007	1	2	\N	\N	\N	86
19708	2	2007	2	0	\N	\N	\N	86
19709	2	2007	2	1	\N	\N	\N	86
19710	2	2007	2	2	\N	\N	\N	86
19711	2	2008	1	0	\N	\N	\N	86
19712	2	2008	1	1	\N	\N	\N	86
19713	2	2008	1	2	\N	\N	\N	86
19714	2	2008	2	0	\N	\N	\N	86
19715	2	2008	2	1	\N	\N	\N	86
19716	2	2008	2	2	\N	\N	\N	86
19717	2	2009	1	0	\N	\N	\N	86
19718	2	2009	1	1	\N	\N	\N	86
19719	2	2009	1	2	\N	\N	\N	86
19720	2	2009	2	0	\N	\N	\N	86
19721	2	2009	2	1	\N	\N	\N	86
19722	2	2009	2	2	\N	\N	\N	86
19723	2	2010	1	0	\N	\N	\N	86
19724	2	2010	1	1	\N	\N	\N	86
19725	2	2010	1	2	\N	\N	\N	86
19726	2	2010	2	0	\N	\N	\N	86
19727	2	2010	2	1	\N	\N	\N	86
19728	2	2010	2	2	\N	\N	\N	86
19729	2	2011	1	0	\N	\N	\N	86
19730	2	2011	1	1	\N	\N	\N	86
19731	2	2011	1	2	\N	\N	\N	86
19732	2	2011	2	0	\N	\N	\N	86
19733	2	2011	2	1	\N	\N	\N	86
19734	2	2011	2	2	\N	\N	\N	86
19735	2	2012	1	0	\N	\N	\N	86
19736	2	2012	1	1	\N	\N	\N	86
19737	2	2012	1	2	\N	\N	\N	86
19738	2	2012	2	0	\N	\N	\N	86
19739	2	2012	2	1	\N	\N	\N	86
19740	2	2012	2	2	\N	\N	\N	86
19741	2	2013	1	0	\N	\N	\N	86
19742	2	2013	1	1	\N	\N	\N	86
19743	2	2013	1	2	\N	\N	\N	86
19744	2	2013	2	0	\N	\N	\N	86
19745	2	2013	2	1	\N	\N	\N	86
19746	2	2013	2	2	\N	\N	\N	86
19747	2	2014	1	0	\N	\N	\N	86
19748	2	2014	1	1	\N	\N	\N	86
19749	2	2014	1	2	\N	\N	\N	86
19750	2	2014	2	0	\N	\N	\N	86
19751	2	2014	2	1	\N	\N	\N	86
19752	2	2014	2	2	\N	\N	\N	86
19753	2	2015	1	0	\N	\N	\N	86
19754	2	2015	1	1	\N	\N	\N	86
19755	2	2015	1	2	\N	\N	\N	86
19756	2	2015	2	0	\N	\N	\N	86
19757	2	2015	2	1	\N	\N	\N	86
19758	2	2015	2	2	\N	\N	\N	86
19759	2	2016	1	0	\N	\N	\N	86
19760	2	2016	1	1	\N	\N	\N	86
19761	2	2016	1	2	\N	\N	\N	86
19762	2	2016	2	0	\N	\N	\N	86
19763	2	2016	2	1	\N	\N	\N	86
19764	2	2016	2	2	\N	\N	\N	86
19765	2	2017	1	0	\N	\N	\N	86
19766	2	2017	1	1	\N	\N	\N	86
19767	2	2017	1	2	\N	\N	\N	86
19768	2	2017	2	0	\N	\N	\N	86
19769	2	2017	2	1	\N	\N	\N	86
19770	2	2017	2	2	\N	\N	\N	86
19771	2	2018	1	0	\N	\N	\N	86
19772	2	2018	1	1	\N	\N	\N	86
19773	2	2018	1	2	\N	\N	\N	86
19774	2	2018	2	0	\N	\N	\N	86
19775	2	2018	2	1	\N	\N	\N	86
19776	2	2018	2	2	\N	\N	\N	86
19777	2	2019	1	0	154.40	91.00	1.70	86
19778	2	2019	1	1	685.00	157.00	4.36	86
19779	2	2019	1	2	839.40	248.00	3.38	86
19780	2	2019	2	0	354.00	250.00	1.42	86
19781	2	2019	2	1	567.09	120.00	4.73	86
19782	2	2019	2	2	921.09	370.00	2.49	86
19783	2	2020	1	0	213.66	121.00	1.77	86
19784	2	2020	1	1	732.53	157.70	4.65	86
19785	2	2020	1	2	946.19	278.70	3.40	86
19786	2	2020	2	0	707.10	256.00	2.76	86
19787	2	2020	2	1	711.99	158.00	4.51	86
19788	2	2020	2	2	1419.09	414.00	3.43	86
19789	1	1987	1	0	35125.00	18770.00	1.87	9
19790	1	1987	1	1	100355.00	24140.00	4.16	9
19791	1	1987	1	2	135480.00	42910.00	3.16	9
19792	1	1987	2	0	85814.00	42010.00	2.04	9
19793	1	1987	2	1	85283.00	25620.00	3.33	9
19794	1	1987	2	2	171097.00	67630.00	2.53	9
19795	1	1988	1	0	38778.00	21680.00	1.79	9
19796	1	1988	1	1	113828.00	28570.00	3.98	9
19797	1	1988	1	2	152606.00	50250.00	3.04	9
19798	1	1988	2	0	83568.00	48420.00	1.73	9
19799	1	1988	2	1	101599.00	30980.00	3.28	9
19800	1	1988	2	2	185167.00	79400.00	2.33	9
19801	1	1989	1	0	40272.00	21080.00	1.91	9
19802	1	1989	1	1	123940.00	32030.00	3.87	9
19803	1	1989	1	2	164212.00	53110.00	3.09	9
19804	1	1989	2	0	81101.00	38970.00	2.08	9
19805	1	1989	2	1	115690.00	34320.00	3.37	9
19806	1	1989	2	2	196791.00	73290.00	2.69	9
19807	1	1990	1	0	23202.00	13770.00	1.68	9
19808	1	1990	1	1	93473.00	28410.00	3.29	9
19809	1	1990	1	2	116675.00	42180.00	2.77	9
19810	1	1990	2	0	104519.00	45720.00	2.29	9
19811	1	1990	2	1	121496.00	36240.00	3.35	9
19812	1	1990	2	2	226015.00	81960.00	2.76	9
19813	1	1991	1	0	29101.00	14080.00	2.07	9
19814	1	1991	1	1	96239.00	27920.00	3.45	9
19815	1	1991	1	2	125340.00	42000.00	2.98	9
19816	1	1991	2	0	129875.00	49460.00	2.63	9
19817	1	1991	2	1	124437.00	36650.00	3.40	9
19818	1	1991	2	2	254312.00	86110.00	2.95	9
19819	1	1992	1	0	12891.00	6150.00	2.10	9
19820	1	1992	1	1	91870.00	28100.00	3.27	9
19821	1	1992	1	2	104761.00	34250.00	3.06	9
19822	1	1992	2	0	107628.00	39480.00	2.73	9
19823	1	1992	2	1	91999.00	27160.00	3.39	9
19824	1	1992	2	2	199627.00	66640.00	3.00	9
19825	1	1993	1	0	16823.00	8140.00	2.07	9
19826	1	1993	1	1	100839.00	29030.00	3.47	9
19827	1	1993	1	2	117662.00	37170.00	3.17	9
19828	1	1993	2	0	152796.00	47050.00	3.25	9
19829	1	1993	2	1	99729.00	27770.00	3.59	9
19830	1	1993	2	2	252525.00	74820.00	3.38	9
19831	1	1994	1	0	22056.00	11330.00	1.95	9
19832	1	1994	1	1	102032.00	29130.00	3.50	9
19833	1	1994	1	2	124088.00	40460.00	3.07	9
19834	1	1994	2	0	93555.00	42080.00	2.22	9
19835	1	1994	2	1	105812.00	31970.00	3.31	9
19836	1	1994	2	2	199367.00	74050.00	2.69	9
19837	1	1995	1	0	19559.00	11589.00	1.69	9
19838	1	1995	1	1	102891.00	31795.00	3.24	9
19839	1	1995	1	2	122450.00	43384.00	2.82	9
19840	1	1995	2	0	107187.00	45497.00	2.36	9
19841	1	1995	2	1	113199.00	30740.00	3.68	9
19842	1	1995	2	2	220386.00	76237.00	2.89	9
19843	1	1996	1	0	36035.00	17472.00	2.06	9
19844	1	1996	1	1	124906.00	35597.00	3.51	9
19845	1	1996	1	2	160941.00	53069.00	3.03	9
19846	1	1996	2	0	115038.00	50299.00	2.29	9
19847	1	1996	2	1	101352.00	29104.00	3.48	9
19848	1	1996	2	2	216390.00	79403.00	2.73	9
19849	1	1997	1	0	30237.00	14817.00	2.04	9
19850	1	1997	1	1	104757.00	33929.00	3.09	9
19851	1	1997	1	2	134994.00	48746.00	2.77	9
19852	1	1997	2	0	79271.00	38914.00	2.04	9
19853	1	1997	2	1	141051.00	41476.00	3.40	9
19854	1	1997	2	2	220322.00	80390.00	2.74	9
19855	1	1998	1	0	8267.00	5073.00	1.63	9
19856	1	1998	1	1	69713.00	26339.00	2.65	9
19857	1	1998	1	2	77980.00	31412.00	2.48	9
19858	1	1998	2	0	90539.00	38028.00	2.38	9
19859	1	1998	2	1	92766.00	29337.00	3.16	9
19860	1	1998	2	2	183305.00	67365.00	2.72	9
19861	1	1999	1	0	26685.00	13073.00	2.04	9
19862	1	1999	1	1	91684.00	30996.00	2.96	9
19863	1	1999	1	2	118369.00	44069.00	2.69	9
19864	1	1999	2	0	81449.00	41096.00	1.98	9
19865	1	1999	2	1	122346.00	41946.00	2.92	9
19866	1	1999	2	2	203795.00	83042.00	2.45	9
19867	1	2000	1	0	34551.00	15380.00	2.25	9
19868	1	2000	1	1	140734.00	42707.00	3.30	9
19869	1	2000	1	2	175285.00	58087.00	3.02	9
19870	1	2000	2	0	107320.00	46086.00	2.33	9
19871	1	2000	2	1	160993.00	47401.00	3.40	9
19872	1	2000	2	2	268313.00	93487.00	2.87	9
19873	1	2001	1	0	35604.00	15652.00	2.27	9
19874	1	2001	1	1	117087.00	37207.00	3.15	9
19875	1	2001	1	2	152691.00	52859.00	2.89	9
19876	1	2001	2	0	108794.00	44302.00	2.46	9
19877	1	2001	2	1	169595.00	51285.00	3.31	9
19878	1	2001	2	2	278389.00	95587.00	2.91	9
19879	1	2002	1	0	36181.00	14394.00	2.51	9
19880	1	2002	1	1	144510.00	41255.00	3.50	9
19881	1	2002	1	2	180691.00	55649.00	3.25	9
19882	1	2002	2	0	131730.00	44618.00	2.95	9
19883	1	2002	2	1	192696.00	51599.00	3.73	9
19884	1	2002	2	2	324426.00	96217.00	3.37	9
19885	1	2003	1	0	31079.00	12144.00	2.56	9
19886	1	2003	1	1	141827.00	38819.00	3.65	9
19887	1	2003	1	2	172906.00	50963.00	3.39	9
19888	1	2003	2	0	148566.00	51503.00	2.88	9
19889	1	2003	2	1	202605.00	52654.00	3.85	9
19890	1	2003	2	2	351171.00	104157.00	3.37	9
19891	1	2004	1	0	35390.00	12971.00	2.73	9
19892	1	2004	1	1	155375.00	39741.00	3.91	9
19893	1	2004	1	2	190765.00	52712.00	3.62	9
19894	1	2004	2	0	160254.00	53817.00	2.98	9
19895	1	2004	2	1	195906.00	49873.00	3.93	9
19896	1	2004	2	2	356160.00	103690.00	3.43	9
19897	1	2005	1	0	32420.00	11821.00	2.74	9
19898	1	2005	1	1	151370.00	39345.00	3.85	9
19899	1	2005	1	2	183790.00	51166.00	3.59	9
19900	1	2005	2	0	159421.00	55057.00	2.90	9
19901	1	2005	2	1	219346.00	52362.00	4.19	9
19902	1	2005	2	2	378767.00	107419.00	3.53	9
19903	1	2006	1	0	42357.00	14562.00	2.91	9
19904	1	2006	1	1	164082.00	40131.00	4.09	9
19905	1	2006	1	2	206439.00	54693.00	3.77	9
19906	1	2006	2	0	126538.00	42267.00	2.99	9
19907	1	2006	2	1	181224.00	44217.00	4.10	9
19908	1	2006	2	2	307762.00	86484.00	3.56	9
19909	1	2007	1	0	35019.00	13375.00	2.62	9
19910	1	2007	1	1	150029.00	37386.00	4.01	9
19911	1	2007	1	2	185048.00	50761.00	3.65	9
19912	1	2007	2	0	158494.00	47983.00	3.30	9
19913	1	2007	2	1	210217.00	49534.00	4.24	9
19914	1	2007	2	2	368711.00	97517.00	3.78	9
19915	1	2008	1	0	40952.00	13765.00	2.98	9
19916	1	2008	1	1	158103.00	37913.00	4.17	9
19917	1	2008	1	2	199055.00	51678.00	3.85	9
19918	1	2008	2	0	135522.00	41864.00	3.24	9
19919	1	2008	2	1	216733.00	51772.00	4.19	9
19920	1	2008	2	2	352255.00	93636.00	3.76	9
19921	1	2009	1	0	50178.00	17228.00	2.91	9
19922	1	2009	1	1	158737.00	40093.00	3.96	9
19923	1	2009	1	2	208915.00	57321.00	3.64	9
19924	1	2009	2	0	132443.00	43111.00	3.07	9
19925	1	2009	2	1	224406.00	53311.00	4.21	9
19926	1	2009	2	2	356849.00	96422.00	3.70	9
19927	1	2010	1	0	32537.00	12118.00	2.69	9
19928	1	2010	1	1	157278.00	39578.00	3.97	9
19929	1	2010	1	2	189815.00	51696.00	3.67	9
19930	1	2010	2	0	143505.00	43590.00	3.29	9
19931	1	2010	2	1	219325.00	49784.00	4.41	9
19932	1	2010	2	2	362830.00	93374.00	3.89	9
19933	1	2011	1	0	73121.00	21449.00	3.41	9
19934	1	2011	1	1	179151.00	43623.00	4.11	9
19935	1	2011	1	2	252272.00	65072.00	3.88	9
19936	1	2011	2	0	140337.00	43263.00	3.24	9
19937	1	2011	2	1	229594.00	50089.00	4.58	9
19938	1	2011	2	2	369931.00	93352.00	3.96	9
19939	1	2012	1	0	74338.00	23002.00	3.23	9
19940	1	2012	1	1	186882.00	42419.00	4.41	9
19941	1	2012	1	2	261220.00	65421.00	3.99	9
19942	1	2012	2	0	143142.00	43723.00	3.27	9
19943	1	2012	2	1	214469.00	48744.00	4.40	9
19944	1	2012	2	2	357611.00	92467.00	3.87	9
19945	1	2013	1	0	83709.00	25756.00	3.25	9
19946	1	2013	1	1	183559.00	43869.00	4.18	9
19947	1	2013	1	2	267268.00	69625.00	3.84	9
19948	1	2013	2	0	145866.00	41189.00	3.54	9
19949	1	2013	2	1	225979.00	50907.00	4.44	9
19950	1	2013	2	2	371845.00	92096.00	4.04	9
19951	1	2014	1	0	83624.00	26280.00	3.18	9
19952	1	2014	1	1	189914.00	42740.00	4.44	9
19953	1	2014	1	2	273538.00	69020.00	3.96	9
19954	1	2014	2	0	149053.00	42252.00	3.53	9
19955	1	2014	2	1	234186.00	51824.00	4.52	9
19956	1	2014	2	2	383239.00	94076.00	4.07	9
19957	1	2015	1	0	76266.00	24098.00	3.16	9
19958	1	2015	1	1	184097.00	43037.00	4.28	9
19959	1	2015	1	2	260363.00	67135.00	3.88	9
19960	1	2015	2	0	160687.00	44987.00	3.57	9
19961	1	2015	2	1	240725.00	51514.00	4.67	9
19962	1	2015	2	2	401412.00	96501.00	4.16	9
19963	1	2016	1	0	47098.50	19818.00	2.38	9
19964	1	2016	1	1	154841.40	40425.00	3.83	9
19965	1	2016	1	2	201939.90	60243.00	3.35	9
19966	1	2016	2	0	152236.00	44776.00	3.40	9
19967	1	2016	2	1	226935.00	50272.00	4.51	9
19968	1	2016	2	2	379171.00	95048.00	3.99	9
19969	1	2017	1	0	79657.00	23521.00	3.39	9
19970	1	2017	1	1	216722.00	46817.00	4.63	9
19971	1	2017	1	2	296379.00	70338.00	4.21	9
19972	1	2017	2	0	167398.00	48489.00	3.45	9
19973	1	2017	2	1	236813.00	53561.00	4.42	9
19974	1	2017	2	2	404211.00	102050.00	3.96	9
19975	1	2018	1	0	93184.00	28125.00	3.31	9
19976	1	2018	1	1	202920.00	45416.00	4.47	9
19977	1	2018	1	2	296104.00	73541.00	4.03	9
19978	1	2018	2	0	189492.80	50292.40	3.77	9
19979	1	2018	2	1	243076.63	53706.92	4.53	9
19980	1	2018	2	2	432569.43	103999.31	4.16	9
19981	1	2019	1	0	79304.80	24771.00	3.20	9
19982	1	2019	1	1	198157.86	45765.50	4.33	9
19983	1	2019	1	2	277462.66	70536.50	3.93	9
19984	1	2019	2	0	156537.70	42128.67	3.72	9
19985	1	2019	2	1	243436.42	52273.94	4.66	9
19986	1	2019	2	2	399974.12	94402.60	4.24	9
19987	1	2020	1	0	75394.32	21982.91	3.43	9
19988	1	2020	1	1	175724.47	39754.45	4.42	9
19989	1	2020	1	2	251118.79	61737.36	4.07	9
19990	1	2020	2	0	167182.33	46485.28	3.60	9
19991	1	2020	2	1	227105.92	49403.95	4.60	9
19992	1	2020	2	2	394288.25	95889.23	4.11	9
19993	2	1987	1	0	\N	\N	\N	9
19994	2	1987	1	1	\N	\N	\N	9
19995	2	1987	1	2	\N	\N	\N	9
19996	2	1987	2	0	\N	\N	\N	9
19997	2	1987	2	1	\N	\N	\N	9
19998	2	1987	2	2	\N	\N	\N	9
19999	2	1988	1	0	\N	\N	\N	9
20000	2	1988	1	1	\N	\N	\N	9
20001	2	1988	1	2	\N	\N	\N	9
20002	2	1988	2	0	\N	\N	\N	9
20003	2	1988	2	1	\N	\N	\N	9
20004	2	1988	2	2	\N	\N	\N	9
20005	2	1989	1	0	\N	\N	\N	9
20006	2	1989	1	1	\N	\N	\N	9
20007	2	1989	1	2	\N	\N	\N	9
20008	2	1989	2	0	\N	\N	\N	9
20009	2	1989	2	1	\N	\N	\N	9
20010	2	1989	2	2	\N	\N	\N	9
20011	2	1990	1	0	\N	\N	\N	9
20012	2	1990	1	1	\N	\N	\N	9
20013	2	1990	1	2	\N	\N	\N	9
20014	2	1990	2	0	\N	\N	\N	9
20015	2	1990	2	1	\N	\N	\N	9
20016	2	1990	2	2	\N	\N	\N	9
20017	2	1991	1	0	\N	\N	\N	9
20018	2	1991	1	1	\N	\N	\N	9
20019	2	1991	1	2	\N	\N	\N	9
20020	2	1991	2	0	\N	\N	\N	9
20021	2	1991	2	1	\N	\N	\N	9
20022	2	1991	2	2	\N	\N	\N	9
20023	2	1992	1	0	\N	\N	\N	9
20024	2	1992	1	1	\N	\N	\N	9
20025	2	1992	1	2	\N	\N	\N	9
20026	2	1992	2	0	\N	\N	\N	9
20027	2	1992	2	1	\N	\N	\N	9
20028	2	1992	2	2	\N	\N	\N	9
20029	2	1993	1	0	\N	\N	\N	9
20030	2	1993	1	1	\N	\N	\N	9
20031	2	1993	1	2	\N	\N	\N	9
20032	2	1993	2	0	\N	\N	\N	9
20033	2	1993	2	1	\N	\N	\N	9
20034	2	1993	2	2	\N	\N	\N	9
20035	2	1994	1	0	\N	\N	\N	9
20036	2	1994	1	1	\N	\N	\N	9
20037	2	1994	1	2	\N	\N	\N	9
20038	2	1994	2	0	\N	\N	\N	9
20039	2	1994	2	1	\N	\N	\N	9
20040	2	1994	2	2	\N	\N	\N	9
20041	2	1995	1	0	\N	\N	\N	9
20042	2	1995	1	1	\N	\N	\N	9
20043	2	1995	1	2	\N	\N	\N	9
20044	2	1995	2	0	\N	\N	\N	9
20045	2	1995	2	1	\N	\N	\N	9
20046	2	1995	2	2	\N	\N	\N	9
20047	2	1996	1	0	\N	\N	\N	9
20048	2	1996	1	1	\N	\N	\N	9
20049	2	1996	1	2	\N	\N	\N	9
20050	2	1996	2	0	\N	\N	\N	9
20051	2	1996	2	1	\N	\N	\N	9
20052	2	1996	2	2	\N	\N	\N	9
20053	2	1997	1	0	\N	\N	\N	9
20054	2	1997	1	1	\N	\N	\N	9
20055	2	1997	1	2	\N	\N	\N	9
20056	2	1997	2	0	\N	\N	\N	9
20057	2	1997	2	1	\N	\N	\N	9
20058	2	1997	2	2	\N	\N	\N	9
20059	2	1998	1	0	\N	\N	\N	9
20060	2	1998	1	1	\N	\N	\N	9
20061	2	1998	1	2	\N	\N	\N	9
20062	2	1998	2	0	\N	\N	\N	9
20063	2	1998	2	1	\N	\N	\N	9
20064	2	1998	2	2	\N	\N	\N	9
20065	2	1999	1	0	\N	\N	\N	9
20066	2	1999	1	1	\N	\N	\N	9
20067	2	1999	1	2	\N	\N	\N	9
20068	2	1999	2	0	\N	\N	\N	9
20069	2	1999	2	1	\N	\N	\N	9
20070	2	1999	2	2	\N	\N	\N	9
20071	2	2000	1	0	\N	\N	\N	9
20072	2	2000	1	1	\N	\N	\N	9
20073	2	2000	1	2	\N	\N	\N	9
20074	2	2000	2	0	\N	\N	\N	9
20075	2	2000	2	1	\N	\N	\N	9
20076	2	2000	2	2	\N	\N	\N	9
20077	2	2001	1	0	\N	\N	\N	9
20078	2	2001	1	1	\N	\N	\N	9
20079	2	2001	1	2	\N	\N	\N	9
20080	2	2001	2	0	\N	\N	\N	9
20081	2	2001	2	1	\N	\N	\N	9
20082	2	2001	2	2	\N	\N	\N	9
20083	2	2002	1	0	\N	\N	\N	9
20084	2	2002	1	1	\N	\N	\N	9
20085	2	2002	1	2	\N	\N	\N	9
20086	2	2002	2	0	\N	\N	\N	9
20087	2	2002	2	1	\N	\N	\N	9
20088	2	2002	2	2	\N	\N	\N	9
20089	2	2003	1	0	\N	\N	\N	9
20090	2	2003	1	1	\N	\N	\N	9
20091	2	2003	1	2	\N	\N	\N	9
20092	2	2003	2	0	\N	\N	\N	9
20093	2	2003	2	1	\N	\N	\N	9
20094	2	2003	2	2	\N	\N	\N	9
20095	2	2004	1	0	\N	\N	\N	9
20096	2	2004	1	1	\N	\N	\N	9
20097	2	2004	1	2	\N	\N	\N	9
20098	2	2004	2	0	\N	\N	\N	9
20099	2	2004	2	1	\N	\N	\N	9
20100	2	2004	2	2	\N	\N	\N	9
20101	2	2005	1	0	\N	\N	\N	9
20102	2	2005	1	1	\N	\N	\N	9
20103	2	2005	1	2	\N	\N	\N	9
20104	2	2005	2	0	\N	\N	\N	9
20105	2	2005	2	1	\N	\N	\N	9
20106	2	2005	2	2	\N	\N	\N	9
20107	2	2006	1	0	\N	\N	\N	9
20108	2	2006	1	1	\N	\N	\N	9
20109	2	2006	1	2	\N	\N	\N	9
20110	2	2006	2	0	\N	\N	\N	9
20111	2	2006	2	1	\N	\N	\N	9
20112	2	2006	2	2	\N	\N	\N	9
20113	2	2007	1	0	\N	\N	\N	9
20114	2	2007	1	1	\N	\N	\N	9
20115	2	2007	1	2	\N	\N	\N	9
20116	2	2007	2	0	\N	\N	\N	9
20117	2	2007	2	1	\N	\N	\N	9
20118	2	2007	2	2	\N	\N	\N	9
20119	2	2008	1	0	\N	\N	\N	9
20120	2	2008	1	1	\N	\N	\N	9
20121	2	2008	1	2	\N	\N	\N	9
20122	2	2008	2	0	\N	\N	\N	9
20123	2	2008	2	1	\N	\N	\N	9
20124	2	2008	2	2	\N	\N	\N	9
20125	2	2009	1	0	\N	\N	\N	9
20126	2	2009	1	1	\N	\N	\N	9
20127	2	2009	1	2	\N	\N	\N	9
20128	2	2009	2	0	\N	\N	\N	9
20129	2	2009	2	1	\N	\N	\N	9
20130	2	2009	2	2	\N	\N	\N	9
20131	2	2010	1	0	\N	\N	\N	9
20132	2	2010	1	1	\N	\N	\N	9
20133	2	2010	1	2	\N	\N	\N	9
20134	2	2010	2	0	\N	\N	\N	9
20135	2	2010	2	1	\N	\N	\N	9
20136	2	2010	2	2	\N	\N	\N	9
20137	2	2011	1	0	\N	\N	\N	9
20138	2	2011	1	1	\N	\N	\N	9
20139	2	2011	1	2	\N	\N	\N	9
20140	2	2011	2	0	\N	\N	\N	9
20141	2	2011	2	1	\N	\N	\N	9
20142	2	2011	2	2	\N	\N	\N	9
20143	2	2012	1	0	8.14	8.75	0.93	9
20144	2	2012	1	1	2.03	1.43	1.42	9
20145	2	2012	1	2	10.17	10.18	1.00	9
20146	2	2012	2	0	91.73	89.72	1.02	9
20147	2	2012	2	1	1.57	1.27	1.24	9
20148	2	2012	2	2	93.30	90.99	1.03	9
20149	2	2013	1	0	1.18	1.15	1.03	9
20150	2	2013	1	1	4.43	1.43	3.10	9
20151	2	2013	1	2	5.61	2.58	2.17	9
20152	2	2013	2	0	7.72	6.77	1.14	9
20153	2	2013	2	1	\N	\N	\N	9
20154	2	2013	2	2	7.72	6.77	1.14	9
20155	2	2014	1	0	5.80	7.25	0.80	9
20156	2	2014	1	1	4.15	1.43	2.90	9
20157	2	2014	1	2	9.95	8.68	1.15	9
20158	2	2014	2	0	71.22	81.10	0.88	9
20159	2	2014	2	1	5.00	1.98	2.53	9
20160	2	2014	2	2	76.22	83.08	0.92	9
20161	2	2015	1	0	2.11	2.71	0.78	9
20162	2	2015	1	1	3.34	1.25	2.67	9
20163	2	2015	1	2	5.45	3.96	1.38	9
20164	2	2015	2	0	67.83	82.23	0.82	9
20165	2	2015	2	1	\N	\N	\N	9
20166	2	2015	2	2	67.83	82.23	0.82	9
20167	2	2016	1	0	2.70	3.00	0.90	9
20168	2	2016	1	1	1.10	0.45	2.44	9
20169	2	2016	1	2	3.80	3.45	1.10	9
20170	2	2016	2	0	9.24	19.64	0.47	9
20171	2	2016	2	1	\N	\N	\N	9
20172	2	2016	2	2	9.24	19.64	0.47	9
20173	2	2017	1	0	4.36	4.70	0.93	9
20174	2	2017	1	1	0.00	0.00	\N	9
20175	2	2017	1	2	4.36	4.70	0.93	9
20176	2	2017	2	0	69.15	66.25	1.04	9
20177	2	2017	2	1	0.00	0.00	\N	9
20178	2	2017	2	2	69.15	66.25	1.04	9
20179	2	2018	1	0	3.42	3.80	0.90	9
20180	2	2018	1	1	0.00	0.00	\N	9
20181	2	2018	1	2	3.42	3.80	0.90	9
20182	2	2018	2	0	67.00	60.98	1.10	9
20183	2	2018	2	1	0.00	0.00	\N	9
20184	2	2018	2	2	67.00	60.98	1.10	9
20185	2	2019	1	0	1.70	2.00	0.85	9
20186	2	2019	1	1	0.00	0.00	\N	9
20187	2	2019	1	2	1.70	2.00	0.85	9
20188	2	2019	2	0	72.87	70.00	1.04	9
20189	2	2019	2	1	0.00	0.00	\N	9
20190	2	2019	2	2	72.87	70.00	1.04	9
20191	2	2020	1	0	0.00	0.00	\N	9
20192	2	2020	1	1	0.00	0.00	\N	9
20193	2	2020	1	2	0.00	0.00	\N	9
20194	2	2020	2	0	84.00	79.00	1.06	9
20195	2	2020	2	1	0.00	0.00	\N	9
20196	2	2020	2	2	84.00	79.00	1.06	9
20197	2	1987	1	0	877610.00	507730.00	1.73	999
20198	2	1987	1	1	2658275.00	838680.00	3.17	999
20199	2	1987	1	2	3535885.00	1346410.00	2.63	999
20200	2	1987	2	0	1853134.00	896530.00	2.07	999
20201	2	1987	2	1	3150833.00	1012960.00	3.11	999
20202	2	1987	2	2	5003967.00	1909490.00	2.62	999
20203	2	1988	1	0	856192.00	487300.00	1.76	999
20204	2	1988	1	1	2827727.00	882270.00	3.21	999
20205	2	1988	1	2	3683919.00	1369570.00	2.69	999
20206	2	1988	2	0	2009168.00	949340.00	2.12	999
20207	2	1988	2	1	3277943.00	1073760.00	3.05	999
20208	2	1988	2	2	5287111.00	2023100.00	2.61	999
20209	2	1989	1	0	913525.00	518810.00	1.76	999
20210	2	1989	1	1	3042779.00	942700.00	3.23	999
20211	2	1989	1	2	3956304.00	1461510.00	2.71	999
20212	2	1989	2	0	1953429.00	914720.00	2.14	999
20213	2	1989	2	1	3549039.00	1121050.00	3.17	999
20214	2	1989	2	2	5502468.00	2035770.00	2.70	999
20215	2	1990	1	0	594236.00	399450.00	1.49	999
20216	2	1990	1	1	2888557.00	905350.00	3.19	999
20217	2	1990	1	2	3482793.00	1304800.00	2.67	999
20218	2	1990	2	0	2120214.00	909340.00	2.33	999
20219	2	1990	2	1	3716269.00	1104580.00	3.36	999
20220	2	1990	2	2	5836483.00	2013920.00	2.90	999
20221	2	1991	1	0	796009.00	455300.00	1.75	999
20222	2	1991	1	1	3251504.00	963340.00	3.38	999
20223	2	1991	1	2	4047513.00	1418640.00	2.85	999
20224	2	1991	2	0	2045516.00	909230.00	2.25	999
20225	2	1991	2	1	3580233.00	1097090.00	3.26	999
20226	2	1991	2	2	5625749.00	2006320.00	2.80	999
20227	2	1992	1	0	612367.00	391680.00	1.56	999
20228	2	1992	1	1	2893617.00	890650.00	3.25	999
20229	2	1992	1	2	3505984.00	1282330.00	2.73	999
20230	2	1992	2	0	1904841.00	825970.00	2.31	999
20231	2	1992	2	1	3718115.00	1089770.00	3.41	999
20232	2	1992	2	2	5622956.00	1915740.00	2.94	999
20233	2	1993	1	0	693875.00	383000.00	1.81	999
20234	2	1993	1	1	3196274.00	937700.00	3.41	999
20235	2	1993	1	2	3890149.00	1320700.00	2.95	999
20236	2	1993	2	0	2010774.00	882170.00	2.28	999
20237	2	1993	2	1	3533285.00	1079480.00	3.27	999
20238	2	1993	2	2	5544059.00	1961650.00	2.83	999
20239	2	1994	1	0	866081.00	448480.00	1.93	999
20240	2	1994	1	1	3512452.00	1034850.00	3.39	999
20241	2	1994	1	2	4378533.00	1483330.00	2.95	999
20242	2	1994	2	0	2160877.00	983670.00	2.20	999
20243	2	1994	2	1	3998644.00	1184530.00	3.38	999
20244	2	1994	2	2	6159521.00	2168200.00	2.84	999
20245	2	1995	1	0	714318.00	408655.00	1.75	999
20246	2	1995	1	1	3603013.00	1092753.00	3.30	999
20247	2	1995	1	2	4317331.00	1501408.00	2.88	999
20248	2	1995	2	0	2227776.00	1015663.00	2.19	999
20249	2	1995	2	1	3995542.00	1241620.00	3.22	999
20250	2	1995	2	2	6223318.00	2257283.00	2.76	999
20251	2	1996	1	0	965526.00	500599.00	1.93	999
20252	2	1996	1	1	3985384.00	1165884.00	3.42	999
20253	2	1996	1	2	4950910.00	1666483.00	2.97	999
20254	2	1996	2	0	2084409.00	966028.00	2.16	999
20255	2	1996	2	1	4248249.00	1318625.00	3.22	999
20256	2	1996	2	2	6332658.00	2284653.00	2.77	999
20257	2	1997	1	0	885380.00	475123.00	1.86	999
20258	2	1997	1	1	3961081.00	1149118.00	3.45	999
20259	2	1997	1	2	4846461.00	1624241.00	2.98	999
20260	2	1997	2	0	1907135.00	870260.00	2.19	999
20261	2	1997	2	1	4515367.00	1347769.00	3.35	999
20262	2	1997	2	2	6422502.00	2218029.00	2.90	999
20263	2	1998	1	0	414553.00	284217.00	1.46	999
20264	2	1998	1	1	3144423.00	998980.00	3.15	999
20265	2	1998	1	2	3558976.00	1283197.00	2.77	999
20266	2	1998	2	0	1459113.00	704291.00	2.07	999
20267	2	1998	2	1	3536735.00	1182554.00	2.99	999
20268	2	1998	2	2	4995848.00	1886845.00	2.65	999
20269	2	1999	1	0	943423.00	472222.00	2.00	999
20270	2	1999	1	1	4328630.00	1270804.00	3.41	999
20271	2	1999	1	2	5272053.00	1743026.00	3.02	999
20272	2	1999	2	0	1925320.00	862988.00	2.23	999
20273	2	1999	2	1	4589252.00	1393825.00	3.29	999
20274	2	1999	2	2	6514572.00	2256813.00	2.89	999
20275	2	2000	1	0	932715.00	471881.00	1.98	999
20276	2	2000	1	1	4509781.00	1265742.00	3.56	999
20277	2	2000	1	2	5442496.00	1737623.00	3.13	999
20278	2	2000	2	0	2044021.00	862850.00	2.37	999
20279	2	2000	2	1	4902895.00	1437612.00	3.41	999
20280	2	2000	2	2	6946916.00	2300462.00	3.02	999
20281	2	2001	1	0	958576.00	462577.00	2.07	999
20282	2	2001	1	1	4609255.00	1266519.00	3.64	999
20283	2	2001	1	2	5567831.00	1729096.00	3.22	999
20284	2	2001	2	0	2206034.00	875988.00	2.52	999
20285	2	2001	2	1	5181005.00	1460357.00	3.55	999
20286	2	2001	2	2	7387039.00	2336345.00	3.16	999
20287	2	2002	1	0	989949.00	467084.00	2.12	999
20288	2	2002	1	1	4682420.00	1286116.00	3.64	999
20289	2	2002	1	2	5672369.00	1753200.00	3.24	999
20290	2	2002	2	0	2331531.00	872936.00	2.67	999
20291	2	2002	2	1	5266753.00	1420182.00	3.71	999
20292	2	2002	2	2	7598284.00	2293118.00	3.31	999
20293	2	2003	1	0	829204.00	395710.00	2.10	999
20294	2	2003	1	1	4552074.00	1243627.00	3.66	999
20295	2	2003	1	2	5381278.00	1639337.00	3.28	999
20296	2	2003	2	0	2420457.00	892173.00	2.71	999
20297	2	2003	2	1	5698149.00	1474911.00	3.86	999
20298	2	2003	2	2	8118606.00	2367084.00	3.43	999
20299	2	2004	1	0	1025817.00	438070.00	2.34	999
20300	2	2004	1	1	5012765.00	1288768.00	3.89	999
20301	2	2004	1	2	6038582.00	1726838.00	3.50	999
20302	2	2004	2	0	2529131.00	896379.00	2.82	999
20303	2	2004	2	1	5929071.00	1503428.00	3.94	999
20304	2	2004	2	2	8458202.00	2399807.00	3.52	999
20305	2	2005	1	0	937288.00	407290.00	2.30	999
20306	2	2005	1	1	5095737.00	1269848.00	4.01	999
20307	2	2005	1	2	6033025.00	1677138.00	3.60	999
20308	2	2005	2	0	2431924.00	871410.00	2.79	999
20309	2	2005	2	1	6138056.00	1521873.00	4.03	999
20310	2	2005	2	2	8569980.00	2393283.00	3.58	999
20311	2	2006	1	0	1166311.00	468737.00	2.49	999
20312	2	2006	1	1	5373120.00	1300980.00	4.13	999
20313	2	2006	1	2	6539431.00	1769717.00	3.70	999
20314	2	2006	2	0	2565462.00	863307.00	2.97	999
20315	2	2006	2	1	6221813.00	1526906.00	4.07	999
20316	2	2006	2	2	8787275.00	2390213.00	3.68	999
20317	2	2007	1	0	1149136.00	467935.00	2.46	999
20318	2	2007	1	1	5578744.00	1336045.00	4.18	999
20319	2	2007	1	2	6727880.00	1803980.00	3.73	999
20320	2	2007	2	0	2821668.00	887942.00	3.18	999
20321	2	2007	2	1	6690646.00	1580967.00	4.23	999
20322	2	2007	2	2	9512314.00	2468909.00	3.85	999
20323	2	2008	1	0	1313542.00	489185.00	2.69	999
20324	2	2008	1	1	5807177.00	1388294.00	4.18	999
20325	2	2008	1	2	7120719.00	1877479.00	3.79	999
20326	2	2008	2	0	2945856.00	938154.00	3.14	999
20327	2	2008	2	1	6748973.00	1644344.00	4.10	999
20328	2	2008	2	2	9694829.00	2582498.00	3.75	999
20329	2	2009	1	0	1396019.00	518032.00	2.69	999
20330	2	2009	1	1	5980177.00	1427908.00	4.19	999
20331	2	2009	1	2	7376196.00	1945940.00	3.79	999
20332	2	2009	2	0	2787133.50	958515.00	2.91	999
20333	2	2009	2	1	6103087.00	1627855.00	3.75	999
20334	2	2009	2	2	8890220.50	2586370.00	3.44	999
20335	2	2010	1	0	1086757.00	445416.00	2.44	999
20336	2	2010	1	1	5534034.00	1373327.00	4.03	999
20337	2	2010	1	2	6620791.00	1818743.00	3.64	999
20338	2	2010	2	0	2693103.00	900420.00	2.99	999
20339	2	2010	2	1	6458425.00	1634998.00	3.95	999
20340	2	2010	2	2	9151528.00	2535418.00	3.61	999
20341	2	2011	1	0	1425990.00	517109.00	2.76	999
20342	2	2011	1	1	6151219.00	1476213.00	4.17	999
20343	2	2011	1	2	7577209.00	1993322.00	3.80	999
20344	2	2011	2	0	2899141.00	946896.00	3.06	999
20345	2	2011	2	1	6207712.00	1596424.00	3.89	999
20346	2	2011	2	2	9106853.00	2543320.00	3.58	999
20347	2	2012	1	0	1517516.14	545519.75	2.78	999
20348	2	2012	1	1	6374420.03	1490431.43	4.28	999
20349	2	2012	1	2	7891936.17	2035951.18	3.88	999
20350	2	2012	2	0	3118526.03	981356.72	3.18	999
20351	2	2012	2	1	7022063.27	1672753.27	4.20	999
20352	2	2012	2	2	10140589.30	2654109.99	3.82	999
20353	2	2013	1	0	1434563.58	517690.15	2.77	999
20354	2	2013	1	1	6563068.43	1526058.43	4.30	999
20355	2	2013	1	2	7997632.01	2043748.58	3.91	999
20356	2	2013	2	0	3181706.72	992063.77	3.21	999
20357	2	2013	2	1	7260081.00	1710279.00	4.24	999
20358	2	2013	2	2	10441787.72	2702342.77	3.86	999
20359	2	2014	1	0	1514243.80	562691.25	2.69	999
20360	2	2014	1	1	6865658.15	1535058.43	4.47	999
20361	2	2014	1	2	8379901.95	2097749.68	3.99	999
20362	2	2014	2	0	3047866.22	923901.10	3.30	999
20363	2	2014	2	1	7540058.00	1718021.38	4.39	999
20364	2	2014	2	2	10587924.22	2641922.48	4.01	999
20365	2	2015	1	0	1401602.61	529116.71	2.65	999
20366	2	2015	1	1	6921949.34	1533450.25	4.51	999
20367	2	2015	1	2	8323551.95	2062566.96	4.04	999
20368	2	2015	2	0	2810310.83	893924.18	3.14	999
20369	2	2015	2	1	7015975.00	1699736.00	4.13	999
20370	2	2015	2	2	9826285.83	2593660.18	3.79	999
20371	2	2016	1	0	1166817.20	457722.00	2.55	999
20372	2	2016	1	1	6480064.38	1471404.45	4.40	999
20373	2	2016	1	2	7646881.58	1929126.45	3.96	999
20374	2	2016	2	0	2920554.24	917218.34	3.18	999
20375	2	2016	2	1	7059809.00	1709698.00	4.13	999
20376	2	2016	2	2	9980363.24	2626916.34	3.80	999
20377	2	2017	1	0	1559700.58	544270.70	2.87	999
20378	2	2017	1	1	7009483.90	1551270.82	4.52	999
20379	2	2017	1	2	8569184.48	2095541.52	4.09	999
20380	2	2017	2	0	3159327.15	972451.25	3.25	999
20381	2	2017	2	1	7547835.00	1743815.00	4.33	999
20382	2	2017	2	2	10707162.15	2716266.25	3.94	999
20383	2	2018	1	0	1615505.26	564301.80	2.86	999
20384	2	2018	1	1	7097711.00	1563350.00	4.54	999
20385	2	2018	1	2	8713216.26	2127651.80	4.10	999
20386	2	2018	2	0	3102595.27	949951.38	3.27	999
20387	2	2018	2	1	7250282.41	1722802.92	4.21	999
20388	2	2018	2	2	10352877.68	2672754.29	3.87	999
20389	2	2019	1	0	1432524.05	520503.16	2.75	999
20390	2	2019	1	1	6836852.62	1548004.88	4.42	999
20391	2	2019	1	2	8269376.68	2068508.04	4.00	999
20392	2	2019	2	0	2913358.61	868500.77	3.35	999
20393	2	2019	2	1	7632092.00	1714480.86	4.45	999
20394	2	2019	2	2	10545450.61	2582981.64	4.08	999
20395	2	2020	1	0	1602957.83	548988.92	2.92	999
20396	2	2020	1	1	6783718.27	1505290.57	4.51	999
20397	2	2020	1	2	8386676.10	2054279.49	4.08	999
20398	2	2020	2	0	3120132.50	916452.82	3.40	999
20399	2	2020	2	1	7788046.91	1748163.78	4.45	999
20400	2	2020	2	2	10908179.41	2664616.60	4.09	999
\.


--
-- Data for Name: kpi_percapita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_percapita (id, "locCode", "locType", year, "PerCapitaKg", "PerCapitaGram") FROM stdin;
1	999	2	2000	105.77	289.78
2	999	2	2009	119.08	326.25
3	999	2	2012	114.27	313.05
4	999	2	2016	109.88	301.03
\.


--
-- Data for Name: kpi_pop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_pop (id, "locCode", "locType", year, population) FROM stdin;
16	999	2	2000	76946500.00
17	999	2	2001	78568100.00
18	999	2	2002	80217200.00
19	999	2	2003	81877700.00
20	999	2	2004	83558700.00
21	999	2	2005	85261000.00
22	999	2	2006	86972500.00
23	999	2	2007	88706300.00
24	999	2	2008	90457200.00
25	999	2	2009	92226600.00
26	999	2	2010	93135100.00
27	999	2	2011	94823800.00
28	999	2	2012	96510900.00
29	999	2	2013	98196500.00
30	999	2	2014	99880300.00
31	999	2	2015	100833371.00
32	999	2	2016	102530196.00
33	999	2	2017	104169230.00
34	999	2	2018	105755180.00
35	999	2	2019	107288150.00
36	999	2	2020	108771978.00
37	999	2	2021	110198654.00
\.


--
-- Data for Name: kpi_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_prices (id, "locType", year, "farmgatePrice", "wholesalePrice", "retailPrice", "locCode", "WholesaleSpPrice", "retailSpPrice") FROM stdin;
1	2	1998	8.08	15.78	17.10	999	17.42	19.02
2	2	1999	7.69	15.75	17.26	999	17.46	19.16
3	2	2000	7.50	15.91	17.59	999	17.77	19.45
4	2	2001	7.90	15.99	17.54	999	17.61	19.43
5	2	2002	8.33	16.53	18.00	999	18.21	19.98
6	2	2003	8.56	16.51	17.95	999	18.30	20.20
7	2	2004	9.17	17.30	18.71	999	19.12	21.04
8	2	2005	10.07	19.14	20.73	999	20.93	22.88
9	2	2006	10.46	19.49	21.28	999	21.39	23.56
10	2	2007	11.22	20.66	22.39	999	22.59	24.72
11	2	2008	14.13	27.12	29.38	999	29.81	32.71
12	2	2009	14.67	28.26	30.69	999	31.17	34.12
13	2	2010	14.87	28.46	30.84	999	31.46	34.34
14	2	2011	15.16	29.15	31.31	999	32.06	34.73
15	2	2012	16.22	30.04	32.08	999	32.82	35.30
16	2	2013	16.93	31.56	33.70	999	34.49	36.87
17	2	2014	20.07	36.78	38.93	999	39.51	42.32
18	2	2015	17.33	34.46	37.06	999	45.16	50.76
19	2	2016	17.43	33.69	36.67	999	37.83	41.72
20	2	2017	18.21	35.13	37.62	999	38.83	41.88
21	2	2018	20.40	38.44	40.75	999	49.12	54.23
22	2	2019	16.47	34.43	37.89	999	38.85	42.73
23	2	2020	16.72	33.94	36.93	999	37.65	41.67
24	1	2019	16.68	\N	\N	14	\N	\N
25	1	2019	17.28	\N	\N	1	\N	\N
26	1	2019	16.24	\N	\N	2	\N	\N
27	1	2019	15.56	\N	\N	3	\N	\N
28	1	2019	15.27	\N	\N	4	\N	\N
29	1	2019	17.50	\N	\N	17	\N	\N
30	1	2019	15.15	\N	\N	5	\N	\N
31	1	2019	16.84	\N	\N	6	\N	\N
32	1	2019	19.36	\N	\N	7	\N	\N
33	1	2019	17.43	\N	\N	8	\N	\N
34	1	2019	18.01	\N	\N	9	\N	\N
35	1	2019	18.12	\N	\N	10	\N	\N
36	1	2019	17.76	\N	\N	11	\N	\N
37	1	2019	15.81	\N	\N	12	\N	\N
38	1	2019	15.84	\N	\N	16	\N	\N
39	1	2019	16.54	\N	\N	15	\N	\N
\.


--
-- Data for Name: kpi_sua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_sua (id, "locType", year, "SUBeginningStocks", "SUProduction", "SUImports", "UTExports", "UTSeeds", "UTFeedsWaste", "UTProcessing", "UTEndingStocks", "UTPerCapitaKg", "UTPerCapitaGram", "locCode") FROM stdin;
1	2	1990	1690.00	6095.00	606.00	0.00	163.00	396.00	244.00	1899.00	92.54	253.52	999
2	2	1991	1899.00	6326.00	0.00	10.00	168.00	411.00	253.00	2120.00	83.71	229.33	999
3	2	1992	2120.00	5970.00	1.00	35.00	157.00	388.00	239.00	1673.00	87.14	238.74	999
4	2	1993	1673.00	6170.00	202.00	0.00	161.00	401.00	247.00	1444.00	88.52	242.52	999
5	2	1994	1444.00	6892.00	0.00	0.00	179.00	448.00	276.00	1498.00	86.49	236.95	999
6	2	1995	1498.00	6894.00	264.00	0.00	184.00	448.00	276.00	1422.00	92.54	253.55	999
7	2	1996	1422.00	7379.00	867.00	0.00	194.00	480.00	295.00	1793.00	98.74	270.51	999
8	2	1997	1793.00	7370.00	722.00	0.00	188.00	479.00	295.00	1979.00	97.05	265.88	999
9	2	1998	1979.00	5595.00	2171.00	0.00	155.00	364.00	224.00	2279.00	91.91	251.80	999
10	2	1999	2279.00	7708.00	834.00	0.00	196.00	501.00	308.00	2365.00	99.68	273.10	999
11	2	2000	2365.00	8103.00	639.00	0.00	198.00	527.00	324.00	2166.00	103.16	282.62	999
12	2	2001	2166.00	8472.00	808.00	0.00	199.00	551.00	339.00	2271.00	103.77	284.30	999
13	2	2002	2271.00	8679.00	1196.00	0.00	198.00	564.00	347.00	2448.00	108.02	295.95	999
14	2	2003	2448.00	8829.00	886.00	0.00	197.00	574.00	353.00	2362.00	107.02	293.21	999
15	2	2004	2362.00	9481.00	1001.00	0.00	202.00	616.00	379.00	2051.00	116.07	318.01	999
16	2	2005	2051.00	9550.00	1822.00	0.00	200.00	621.00	382.00	2094.00	118.81	325.50	999
17	2	2006	2094.00	10024.00	1716.00	0.00	204.00	652.00	401.00	2253.00	118.71	325.22	999
18	2	2007	2253.00	10621.00	1806.00	0.00	210.00	690.00	425.00	2172.00	126.26	345.91	999
19	2	2008	2172.00	10997.00	2432.00	1.00	219.00	715.00	440.00	2639.00	128.10	350.97	999
20	2	2009	2639.00	10633.00	1755.00	0.00	222.00	691.00	425.00	2629.00	121.51	332.89	999
21	2	2010	2629.00	10315.00	2378.00	0.00	214.00	670.00	413.00	3424.00	113.83	311.86	999
22	2	2011	3424.00	10911.00	707.00	0.00	223.00	709.00	436.00	2631.00	116.46	319.07	999
23	2	2012	2631.00	11793.00	1041.00	0.00	230.00	767.00	472.00	2524.00	118.88	325.69	999
24	2	2013	2524.00	12059.00	398.00	2.00	233.00	784.00	482.00	2126.00	115.63	316.79	999
25	2	2014	2126.00	12405.00	1087.00	1.00	232.00	806.00	496.00	2662.00	114.34	313.25	999
26	2	2015	2662.00	11870.00	1478.00	0.00	228.00	772.00	475.00	3199.00	111.62	305.81	999
27	2	2016	3199.00	11528.00	605.00	0.00	223.00	749.00	461.00	2765.00	107.83	295.43	999
28	2	2017	2765.00	12607.00	885.00	0.00	236.00	819.00	504.00	2290.00	119.10	326.31	999
29	2	2018	2290.00	12469.00	2002.00	0.00	235.00	810.00	499.00	2551.00	119.76	328.11	999
30	2	2019	2551.00	12305.00	3118.00	0.00	228.00	800.00	492.00	2675.00	128.43	351.85	999
\.


--
-- Data for Name: kpi_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kpi_value (id, "locType", year, "palayValue", "agriValue", "gdpValue", "locCode") FROM stdin;
1	2	2000	284379.00	1064005.00	6985383.24	999
2	2	2001	292826.00	1105117.00	7198383.74	999
3	2	2002	296891.00	1144991.00	7465894.03	999
4	2	2003	299152.00	1197371.00	7845677.43	999
5	2	2004	320188.00	1257109.00	8361077.90	999
6	2	2005	323712.00	1301069.00	8774324.61	999
7	2	2006	332168.00	1360678.00	9240804.28	999
8	2	2007	339702.00	1433747.00	9843239.25	999
9	2	2008	342710.00	1482352.00	10270877.53	999
10	2	2009	338480.00	1480207.00	10419633.02	999
11	2	2010	329425.00	1499801.00	11183861.00	999
12	2	2011	348097.00	1550555.00	11615360.39	999
13	2	2012	373962.00	1598312.00	12416466.19	999
14	2	2013	382785.00	1645192.00	13254643.63	999
15	2	2014	389264.00	1676006.00	14096046.75	999
16	2	2015	370914.00	1688344.00	14990907.45	999
17	2	2016	358273.00	1672085.00	16062675.90	999
18	2	2017	385740.00	1743134.00	17175978.09	999
19	2	2018	380311.00	1762616.00	18265190.26	999
20	2	2019	357982.00	1783855.00	19382750.61	999
21	2	2020	369205.00	1780544.00	17527234.11	999
\.


--
-- Data for Name: rb_farm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rb_farm (id, "locCode", "locType", year, eco, "aveFarmSize", "tstatusOwned", "tstatusAmort", "tstatusLessee", "tstatusTenant", "tstatusOthers", "areaLessOne", "areaOneTwo", "areaTwoThree", "areaMoreThree") FROM stdin;
1	999	2	1997	2	1.40	53	10	20	45	8	62	23	8	7
2	999	2	1997	1	1.55	52	12	23	45	7	57	25	9	9
3	999	2	1997	0	1.15	55	9	14	46	10	69	20	7	4
4	999	2	2002	2	1.61	60	6	21	41	10	58	25	9	8
5	999	2	2002	1	1.71	63	7	23	38	10	55	27	10	8
6	999	2	2002	0	1.33	52	6	14	49	11	66	20	7	7
7	999	2	2007	2	1.35	67	7	22	47	9	55	29	10	6
8	999	2	2007	1	1.40	69	7	24	47	9	51	31	11	7
9	999	2	2007	0	1.22	63	6	18	48	8	62	25	8	5
10	999	2	2012	2	1.42	58	4	15	48	9	58	25	8	9
11	999	2	2012	1	1.44	62	5	17	49	10	58	25	8	9
12	999	2	2012	0	1.34	48	3	7	47	5	62	23	8	7
13	999	2	2017	2	1.52	62	2	12	32	2	58	25	9	8
14	999	2	2017	1	1.62	62	2	13	32	2	55	27	10	8
15	999	2	2017	0	1.18	63	1	9	34	1	70	20	5	5
16	2	2	2017	1	1.56	39	0	37	47	0	50	34	8	8
17	2	2	2017	0	1.25	45	0	32	27	0	59	36	5	0
18	2	2	2017	2	1.44	42	0	35	40	0	53	35	7	5
19	3	2	2017	1	2.07	72	5	14	21	0	41	26	14	19
20	3	2	2017	0	1.70	82	0	6	29	6	58	12	24	6
21	3	2	2017	2	1.97	75	3	12	23	2	46	22	17	15
22	5	2	2017	1	0.59	69	2	12	20	2	88	10	0	2
23	5	2	2017	0	0.54	33	0	22	33	0	100	0	0	0
24	5	2	2017	2	0.59	63	2	13	22	2	90	8	0	2
25	6	2	2017	1	1.12	60	3	17	40	0	68	23	3	6
26	6	2	2017	0	1.15	88	4	12	24	0	64	20	8	8
27	6	2	2017	2	1.13	72	3	15	33	0	66	22	5	7
28	81	2	2017	1	1.62	59	14	5	43	0	42	38	13	7
29	81	2	2017	0	1.63	75	0	0	25	0	25	50	25	0
30	81	2	2017	2	1.62	60	13	5	42	0	42	38	13	7
31	77	2	2017	1	2.07	72	0	18	30	3	44	30	13	13
32	77	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	77	2	2017	2	2.07	72	0	18	30	3	44	30	13	13
34	12	2	2017	1	0.62	40	0	0	73	0	97	3	0	0
35	12	2	2017	0	0.64	68	0	4	39	0	92	4	2	2
36	12	2	2017	2	0.63	58	0	2	51	0	95	3	1	1
37	13	2	2017	1	2.67	78	3	11	17	3	39	24	24	13
38	13	2	2017	0	0.96	70	4	4	26	9	79	17	0	4
39	13	2	2017	2	2.21	76	3	9	20	5	51	22	17	10
40	14	2	2017	1	2.36	63	0	27	17	5	40	32	8	20
41	14	2	2017	0	1.38	56	0	19	30	0	55	37	4	4
42	14	2	2017	2	2.05	60	0	24	21	3	44	34	7	15
43	15	2	2017	1	1.49	66	1	5	35	5	54	26	12	8
44	15	2	2017	0	0.98	80	0	0	40	0	66	27	7	0
45	15	2	2017	2	1.43	68	1	4	35	4	56	26	11	7
46	17	2	2017	1	2.13	70	2	9	27	9	46	28	12	14
47	17	2	2017	0	2.28	54	6	11	37	3	60	23	0	17
48	17	2	2017	2	2.17	66	3	9	30	7	49	27	9	15
49	19	2	2017	1	1.56	45	0	0	67	0	49	29	17	5
50	19	2	2017	0	0.71	67	6	0	39	0	94	0	6	0
51	19	2	2017	2	1.30	52	2	0	58	0	64	20	13	3
52	82	2	2017	1	2.45	78	3	10	20	0	40	35	20	5
53	82	2	2017	0	1.20	60	0	0	55	0	55	40	0	5
54	82	2	2017	2	2.03	72	2	7	32	0	45	37	13	5
55	23	2	2017	1	1.58	59	0	18	29	6	55	24	9	12
56	23	2	2017	0	0.83	69	0	4	35	0	77	15	4	4
57	23	2	2017	2	1.26	63	0	12	32	3	65	20	7	8
58	24	2	2017	1	1.12	72	0	18	10	0	67	22	8	3
59	24	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	24	2	2017	2	1.12	72	0	18	10	0	67	22	8	3
61	25	2	2017	1	1.45	77	0	15	22	0	60	28	7	5
62	25	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	25	2	2017	2	1.45	77	0	15	22	0	60	28	7	5
64	28	2	2017	1	0.82	43	4	0	68	0	80	11	5	4
65	28	2	2017	0	0.68	50	0	0	75	0	100	0	0	0
66	28	2	2017	2	0.81	43	3	0	68	0	82	10	5	3
67	30	2	2017	1	1.48	46	0	23	36	0	62	21	10	7
68	30	2	2017	0	0.77	53	4	15	40	0	87	11	2	0
69	30	2	2017	2	1.14	49	2	19	38	0	75	16	6	3
70	31	2	2017	1	1.80	75	5	7	22	2	46	33	10	11
71	31	2	2017	0	0.87	92	8	0	8	0	67	33	0	0
72	31	2	2017	2	1.70	77	5	6	21	2	49	33	9	9
73	32	2	2017	1	1.74	65	2	4	35	4	50	29	8	13
74	32	2	2017	0	1.01	50	0	13	25	13	74	13	13	0
75	32	2	2017	2	1.64	63	2	5	33	5	53	27	8	12
76	34	2	2017	1	1.90	44	0	15	48	0	56	21	13	10
77	34	2	2017	0	0.45	42	0	25	33	0	100	0	0	0
78	34	2	2017	2	1.61	43	0	17	45	0	65	17	10	8
79	37	2	2017	1	1.28	43	1	3	58	1	62	28	4	6
80	37	2	2017	0	0.98	12	0	0	88	6	82	12	0	6
81	37	2	2017	2	1.22	37	1	2	64	2	67	24	3	6
82	38	2	2017	1	2.20	64	2	5	32	0	43	34	9	14
83	38	2	2017	0	1.22	60	0	2	36	0	66	24	10	0
84	38	2	2017	2	1.73	62	1	3	34	0	55	29	9	7
85	45	2	2017	1	1.12	89	0	4	14	1	78	14	4	4
86	45	2	2017	0	0.58	95	0	5	0	5	85	15	0	0
87	45	2	2017	2	1.00	90	0	4	11	2	80	14	3	3
88	47	2	2017	1	1.34	74	0	4	28	0	50	39	7	4
89	47	2	2017	0	1.02	75	0	0	25	0	85	3	9	3
90	47	2	2017	2	1.22	74	0	2	27	0	63	26	8	3
91	48	2	2017	1	1.46	12	0	4	84	4	64	16	8	12
92	48	2	2017	0	2.60	49	0	0	54	3	26	40	11	23
93	48	2	2017	2	2.12	33	0	2	67	3	42	30	10	18
94	49	2	2017	1	2.01	80	1	12	12	3	40	30	19	11
95	49	2	2017	0	0.56	50	17	17	17	0	83	17	0	0
96	49	2	2017	2	1.95	79	2	12	13	3	40	30	19	11
97	50	2	2017	1	1.22	66	0	5	41	2	61	29	5	5
98	50	2	2017	0	1.18	25	0	0	75	0	50	25	25	0
99	50	2	2017	2	1.22	63	0	5	43	2	60	28	7	5
100	51	2	2017	1	2.20	58	2	10	30	12	42	22	18	18
101	51	2	2017	0	2.05	50	0	0	50	0	30	30	20	20
102	51	2	2017	2	2.18	57	2	8	33	10	41	23	18	18
103	52	2	2017	1	1.58	53	1	15	39	4	59	21	11	9
104	52	2	2017	0	1.67	55	0	18	45	0	64	9	18	9
105	52	2	2017	2	1.59	53	1	15	40	3	59	20	12	9
106	53	2	2017	1	3.87	79	0	8	28	15	26	43	5	26
107	53	2	2017	0	1.27	86	0	10	14	0	52	38	5	5
108	53	2	2017	2	2.96	82	0	8	23	10	35	42	5	18
109	54	2	2017	1	1.87	58	5	17	25	3	38	40	12	10
110	54	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	54	2	2017	2	1.87	58	5	17	25	3	38	40	12	10
112	55	2	2017	1	1.26	37	1	33	42	0	58	29	9	4
113	55	2	2017	0	0.86	29	0	43	29	0	64	36	0	0
114	55	2	2017	2	1.22	36	1	34	40	0	58	30	8	4
115	56	2	2017	1	1.03	8	0	38	54	0	80	15	0	5
116	56	2	2017	0	0.95	43	5	5	48	0	85	10	0	5
117	56	2	2017	2	1.00	20	2	27	52	0	82	13	0	5
118	63	2	2017	1	1.27	91	3	3	34	6	61	33	2	4
119	63	2	2017	0	1.13	28	0	0	20	0	67	33	0	0
120	63	2	2017	2	1.24	65	2	2	28	3	62	33	2	3
121	65	2	2017	1	1.33	29	0	0	17	0	57	34	6	3
122	65	2	2017	0	1.59	160	0	0	100	10	64	24	8	4
123	65	2	2017	2	1.44	44	0	0	27	1	60	30	7	3
124	69	2	2017	1	1.65	75	1	25	11	4	47	33	12	8
125	69	2	2017	0	1.58	60	0	60	30	0	50	40	0	10
126	69	2	2017	2	1.64	73	1	29	13	3	48	34	10	8
127	60	2	2017	1	1.39	53	2	5	55	2	60	22	13	5
128	60	2	2017	0	1.22	54	4	8	54	0	66	17	14	3
129	60	2	2017	2	1.64	53	2	5	55	2	50	29	13	8
130	72	2	2017	1	0.96	69	0	11	25	0	77	14	3	6
131	72	2	2017	0	0.64	92	0	0	8	0	83	13	4	0
132	72	2	2017	2	0.83	78	0	7	18	0	81	13	3	3
133	73	2	2017	1	1.24	69	2	21	15	0	71	15	12	2
134	73	2	2017	0	0.88	75	0	0	25	0	62	38	0	0
135	73	2	2017	2	1.20	70	2	18	17	0	70	18	10	2
136	83	2	2017	1	1.31	87	0	9	4	0	57	30	13	0
137	83	2	2017	0	1.28	78	0	14	8	0	73	16	3	8
138	83	2	2017	2	1.29	82	0	12	7	0	66	22	7	5
\.


--
-- Data for Name: rb_income; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rb_income (id, "locCode", "locType", year, eco, "monthlyIncome", "riceSource", "vegetableSource", "selfEmployesSource", "liveStockSource", "salarySource", "otheSource", "abovePovertyShare", "belowPovertShare") FROM stdin;
1	999	2	1997	2	1227	80	\N	\N	\N	\N	20	47	53
2	999	2	1997	1	1457	85	\N	\N	\N	\N	15	57	43
3	999	2	1997	0	848	72	\N	\N	\N	\N	28	30	70
4	999	2	2002	2	1671	82	\N	\N	\N	\N	18	54	46
5	999	2	2002	1	1827	85	\N	\N	\N	\N	15	59	41
6	999	2	2002	0	1274	74	\N	\N	\N	\N	26	42	58
7	999	2	2007	2	2025	81	0	3	0	3	13	66	34
8	999	2	2007	1	2142	66	1	3	0	4	26	70	30
9	999	2	2007	0	1378	76	1	3	0	3	17	66	34
10	999	2	2012	2	4344	87	1	4	0	3	5	66	34
11	999	2	2012	1	4869	90	1	3	0	3	3	71	29
12	999	2	2012	0	2922	83	0	4	1	3	9	51	49
13	999	2	2017	2	6534	84	1	5	1	4	5	72	28
14	999	2	2017	1	7409	87	1	4	1	3	4	77	23
15	999	2	2017	0	3822	76	2	8	2	4	8	57	43
16	2	2	2017	1	4809	86	0	11	0	0	3	76	24
17	2	2	2017	0	3239	68	0	18	0	5	9	68	32
18	2	2	2017	2	4233	80	0	13	0	2	5	73	27
19	3	2	2017	1	5522	93	0	0	2	5	0	65	35
20	3	2	2017	0	2594	88	0	6	0	0	6	47	53
21	3	2	2017	2	4693	91	0	2	2	3	2	60	40
22	5	2	2017	1	4900	72	0	6	6	10	6	69	31
23	5	2	2017	0	1790	67	0	11	0	11	11	33	67
24	5	2	2017	2	4434	71	0	7	5	10	7	63	37
25	6	2	2017	1	5227	73	3	6	3	9	6	83	17
26	6	2	2017	0	6825	72	0	4	0	16	8	76	24
27	6	2	2017	2	5893	72	2	5	2	12	7	80	20
28	81	2	2017	1	4727	100	0	0	0	0	0	75	25
29	81	2	2017	0	4754	100	0	0	0	0	0	100	0
30	81	2	2017	2	4729	100	0	0	0	0	0	77	23
31	77	2	2017	1	9054	93	0	5	0	2	0	92	8
32	77	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	77	2	2017	2	9054	93	0	5	0	2	0	92	8
34	12	2	2017	1	3251	67	0	13	0	17	3	43	57
35	12	2	2017	0	3084	62	4	13	7	9	5	57	43
36	12	2	2017	2	3142	63	2	13	5	12	5	52	48
37	13	2	2017	1	11516	86	0	10	0	2	2	90	10
38	13	2	2017	0	5365	70	0	17	0	0	13	57	43
39	13	2	2017	2	9871	82	0	12	0	1	5	81	19
40	14	2	2017	1	12694	82	2	7	5	2	2	92	8
41	14	2	2017	0	7350	55	4	26	15	0	0	89	11
42	14	2	2017	2	11016	75	2	13	8	1	1	91	9
43	15	2	2017	1	6591	86	1	2	0	6	5	79	21
44	15	2	2017	0	3831	80	0	0	0	7	13	67	33
45	15	2	2017	2	6234	85	1	2	0	6	6	78	22
46	17	2	2017	1	4424	96	0	0	0	4	0	63	37
47	17	2	2017	0	4318	85	0	3	3	3	6	57	43
48	17	2	2017	2	4392	93	0	1	1	3	2	61	39
49	19	2	2017	1	3304	100	0	0	0	0	0	62	38
50	19	2	2017	0	1879	94	0	6	0	0	0	33	67
51	19	2	2017	2	2877	98	0	2	0	0	0	53	47
52	82	2	2017	1	11413	94	0	0	0	3	3	87	13
53	82	2	2017	0	4187	100	0	0	0	0	0	65	35
54	82	2	2017	2	9004	96	0	0	0	2	2	80	20
55	23	2	2017	1	7224	97	0	3	0	0	0	74	26
56	23	2	2017	0	3900	84	0	8	0	8	0	69	31
57	23	2	2017	2	5783	92	0	5	0	3	0	72	28
58	24	2	2017	1	9723	97	0	0	0	0	3	68	32
59	24	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	24	2	2017	2	9723	97	0	0	0	0	3	68	32
61	25	2	2017	1	8497	95	0	0	0	3	2	88	12
62	25	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	25	2	2017	2	8497	95	0	0	0	3	2	88	12
64	28	2	2017	1	2865	96	0	0	0	2	2	50	50
65	28	2	2017	0	803	75	0	0	0	0	25	25	75
66	28	2	2017	2	2727	95	0	0	0	2	3	48	52
67	30	2	2017	1	3377	73	5	5	0	10	7	46	54
68	30	2	2017	0	1399	73	0	5	2	9	11	22	78
69	30	2	2017	2	2423	73	3	5	1	9	9	34	66
70	31	2	2017	1	11466	90	0	3	0	4	3	96	4
71	31	2	2017	0	4354	67	0	8	0	0	25	92	8
72	31	2	2017	2	10730	89	0	3	0	3	5	96	4
73	32	2	2017	1	6651	80	2	4	0	4	10	90	10
74	32	2	2017	0	5004	50	0	0	0	0	50	86	14
75	32	2	2017	2	6456	77	2	3	0	3	15	90	10
76	34	2	2017	1	7156	82	2	8	2	2	4	85	15
77	34	2	2017	0	1568	67	17	8	0	8	0	42	58
78	34	2	2017	2	6038	79	5	8	2	3	3	77	23
79	37	2	2017	1	3925	85	0	3	1	4	7	65	35
80	37	2	2017	0	2100	88	0	0	6	6	0	41	59
81	37	2	2017	2	3565	85	0	2	2	5	6	60	40
82	38	2	2017	1	6800	100	0	0	0	0	0	89	11
83	38	2	2017	0	5090	94	2	2	0	2	0	66	34
84	38	2	2017	2	5975	97	1	1	0	1	0	78	22
85	45	2	2017	1	4835	80	0	10	1	3	6	64	36
86	45	2	2017	0	3762	60	0	15	0	5	20	45	55
87	45	2	2017	2	4596	76	0	11	1	3	9	60	40
88	47	2	2017	1	14805	92	0	2	0	6	0	72	28
89	47	2	2017	0	4491	97	0	0	0	3	0	66	34
90	47	2	2017	2	10967	94	0	1	0	5	0	70	30
91	48	2	2017	1	2774	68	0	0	0	0	32	44	56
92	48	2	2017	0	2406	49	3	15	6	6	21	47	53
93	48	2	2017	2	2562	59	2	8	3	3	25	46	54
94	49	2	2017	1	10955	90	5	3	0	0	2	89	11
95	49	2	2017	0	2263	33	33	0	0	17	17	17	83
96	49	2	2017	2	10610	87	6	3	0	1	3	86	14
97	50	2	2017	1	8539	84	2	4	0	5	5	87	13
98	50	2	2017	0	2597	75	0	0	0	0	25	75	25
99	50	2	2017	2	8143	83	2	3	0	5	7	87	13
100	51	2	2017	1	8127	94	0	4	0	2	0	84	16
101	51	2	2017	0	3525	100	0	0	0	0	0	50	50
102	51	2	2017	2	7432	95	0	3	0	2	0	79	21
103	52	2	2017	1	6345	82	3	8	1	3	3	74	26
104	52	2	2017	0	8454	82	0	9	9	0	0	70	30
105	52	2	2017	2	6602	84	2	8	2	2	2	73	27
106	53	2	2017	1	9060	82	0	5	0	8	5	64	36
107	53	2	2017	0	2298	81	0	5	0	0	14	62	38
108	53	2	2017	2	6694	82	0	5	0	5	8	63	37
109	54	2	2017	1	9669	85	0	5	0	3	7	97	3
110	54	2	2017	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	54	2	2017	2	9669	85	0	5	0	3	7	97	3
112	55	2	2017	1	7662	93	0	5	0	1	1	87	13
113	55	2	2017	0	4643	79	7	7	7	0	0	71	29
114	55	2	2017	2	7380	91	1	5	1	1	1	85	15
115	56	2	2017	1	5524	75	0	10	0	5	10	79	21
116	56	2	2017	0	3985	52	5	19	10	0	14	71	29
117	56	2	2017	2	4986	67	2	13	3	3	12	77	23
118	63	2	2017	1	8901	94	0	4	0	2	0	85	15
119	63	2	2017	0	8941	100	0	0	0	0	0	83	17
120	63	2	2017	2	8909	95	0	3	0	2	0	85	15
121	65	2	2017	1	6481	100	0	0	0	0	0	86	14
122	65	2	2017	0	4489	96	0	0	0	0	4	61	39
123	65	2	2017	2	5691	98	0	0	0	0	2	76	24
124	69	2	2017	1	8395	84	0	7	0	0	9	83	17
125	69	2	2017	0	4523	70	0	20	0	0	10	80	20
126	69	2	2017	2	7945	83	0	8	0	0	9	83	17
127	60	2	2017	1	3027	74	3	6	0	0	17	56	44
128	60	2	2017	0	3980	75	0	21	0	4	0	42	58
129	60	2	2017	2	3408	74	2	12	0	2	10	50	50
130	72	2	2017	1	3635	83	0	3	0	6	8	44	56
131	72	2	2017	0	2605	63	4	0	0	8	25	46	54
132	72	2	2017	2	3223	74	2	2	0	7	15	45	55
133	73	2	2017	1	6192	84	0	8	0	6	2	81	19
134	73	2	2017	0	2420	87	0	0	0	13	0	38	62
135	73	2	2017	2	5689	84	0	7	0	7	2	75	25
136	83	2	2017	1	5863	83	0	0	0	13	4	74	26
137	83	2	2017	0	3699	82	0	5	0	5	8	59	41
138	83	2	2017	2	4529	82	0	3	0	8	7	65	35
\.


--
-- Data for Name: rb_socio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rb_socio (id, "locCode", "locType", year, eco, count, age, "sexMale", "sexFemale", "cstatusSingle", "cstatusMarried", "cstatusWidow", "cstatusSeparated", "yrsSchooling", "yrsFarmExp", "hhSize", "orgMember", "withTraining") FROM stdin;
1	999	2	1997	2	\N	48	92	8	3	91	6	0	7	21	6	48	47
2	999	2	1997	1	\N	48	91	9	3	90	7	0	7	21	6	57	54
3	999	2	1997	0	\N	47	93	7	3	90	6	1	7	21	6	34	36
4	999	2	2002	2	\N	50	92	8	3	89	8	0	7	24	5	46	52
5	999	2	2002	1	\N	50	91	9	4	87	9	0	8	24	6	50	55
6	999	2	2002	0	\N	50	94	6	3	90	7	0	7	24	6	36	41
7	999	2	2007	2	1992	53	89	11	4	86	9	1	7	25	6	43	36
8	999	2	2007	1	1686	53	89	11	4	86	9	1	8	25	6	45	37
9	999	2	2007	0	306	52	91	9	1	92	7	0	7	25	6	32	27
10	999	2	2012	2	2500	54	89	11	4	86	9	1	8	28	4	51	41
11	999	2	2012	1	1819	54	88	12	4	86	9	1	8	28	4	56	44
12	999	2	2012	0	681	55	90	10	3	89	7	1	7	29	4	37	32
13	999	2	2017	2	3104	56	82	18	4	85	10	1	8	32	5	58	65
14	999	2	2017	1	2343	56	83	17	4	85	10	1	9	32	5	61	66
15	999	2	2017	0	761	56	80	20	4	87	9	0	8	31	5	48	60
16	2	2	2017	1	38	53	74	26	0	92	8	0	9	26	5	89	79
17	2	2	2017	0	22	54	68	32	9	86	5	0	9	23	5	55	77
18	2	2	2017	2	60	54	72	28	3	90	7	0	9	25	5	77	78
19	3	2	2017	1	43	55	77	23	2	86	12	0	7	29	5	98	72
20	3	2	2017	0	17	58	82	18	0	88	12	0	7	32	5	71	65
21	3	2	2017	2	60	56	78	22	2	86	12	0	7	30	5	90	70
22	5	2	2017	1	51	58	84	16	10	78	10	2	8	28	4	47	55
23	5	2	2017	0	9	60	89	11	0	78	22	0	7	34	5	22	33
24	5	2	2017	2	60	58	85	15	8	78	12	2	8	29	5	43	52
25	6	2	2017	1	35	58	57	43	14	80	6	0	10	29	4	66	51
26	6	2	2017	0	25	56	48	52	16	64	20	0	10	25	5	64	44
27	6	2	2017	2	60	57	53	47	15	73	12	0	10	27	4	65	48
28	81	2	2017	1	56	51	91	9	9	89	2	0	9	28	4	80	61
29	81	2	2017	0	4	58	100	0	0	100	0	0	8	39	3	100	75
30	81	2	2017	2	60	52	92	8	8	90	2	0	9	29	4	82	62
31	77	2	2017	1	60	55	88	12	0	90	10	0	8	33	5	55	62
32	77	2	2017	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	77	2	2017	2	60	55	88	12	0	90	10	0	8	33	5	55	62
34	12	2	2017	1	30	56	87	13	10	84	3	3	8	30	5	63	50
35	12	2	2017	0	56	57	88	13	4	87	9	0	7	30	5	55	48
36	12	2	2017	2	86	57	87	13	6	86	7	1	7	30	5	58	49
37	13	2	2017	1	63	53	83	17	2	94	2	2	9	27	4	90	79
38	13	2	2017	0	23	51	83	17	0	96	4	0	9	30	5	35	65
39	13	2	2017	2	86	53	83	17	1	96	2	1	9	28	4	76	76
40	14	2	2017	1	59	63	90	10	3	90	7	0	8	39	5	58	56
41	14	2	2017	0	27	57	78	22	4	82	7	7	7	37	5	41	48
42	14	2	2017	2	86	61	86	14	3	88	7	2	8	39	5	52	53
43	15	2	2017	1	101	55	89	11	0	86	12	2	8	34	5	36	67
44	15	2	2017	0	15	57	93	7	0	93	7	0	8	39	5	33	60
45	15	2	2017	2	116	55	90	10	0	87	11	2	8	35	5	35	66
46	17	2	2017	1	81	59	80	20	6	78	15	1	8	34	5	37	64
47	17	2	2017	0	35	57	71	29	6	74	20	0	8	30	5	51	66
48	17	2	2017	2	116	58	78	22	6	77	16	1	8	33	5	41	65
49	19	2	2017	1	42	63	55	45	5	66	29	0	8	36	4	40	76
50	19	2	2017	0	18	61	72	28	6	88	6	0	8	31	5	17	78
51	19	2	2017	2	60	62	60	40	5	73	22	0	8	34	4	33	77
52	82	2	2017	1	40	54	70	30	3	84	13	0	9	27	5	75	75
53	82	2	2017	0	20	44	70	30	5	90	5	0	8	22	5	90	80
54	82	2	2017	2	60	51	70	30	3	87	10	0	8	26	5	80	77
55	23	2	2017	1	34	54	82	18	3	88	9	0	9	33	5	94	91
56	23	2	2017	0	26	54	73	27	0	88	8	4	7	32	4	77	62
57	23	2	2017	2	60	54	78	22	2	88	8	2	8	32	5	87	78
58	24	2	2017	1	60	57	87	13	2	95	3	0	8	31	5	77	78
59	24	2	2017	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	24	2	2017	2	60	57	87	13	2	95	3	0	8	31	5	77	78
61	25	2	2017	1	60	60	77	23	5	81	12	2	8	35	5	61	90
62	25	2	2017	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	25	2	2017	2	60	60	77	23	5	81	12	2	8	35	5	61	90
64	28	2	2017	1	56	53	98	2	9	86	5	0	10	28	5	86	66
65	28	2	2017	0	4	42	100	0	0	100	0	0	8	23	5	75	75
66	28	2	2017	2	60	53	98	2	8	87	5	0	10	28	5	85	67
67	30	2	2017	1	61	58	79	21	2	78	18	2	8	34	5	77	72
68	30	2	2017	0	55	65	80	20	0	84	16	0	9	39	5	51	73
69	30	2	2017	2	116	61	79	21	1	81	17	1	9	36	5	65	72
70	31	2	2017	1	104	56	91	9	2	84	12	2	9	36	4	47	65
71	31	2	2017	0	12	60	83	17	0	75	25	0	8	41	4	0	42
72	31	2	2017	2	116	56	91	9	2	83	13	2	9	37	4	42	63
73	32	2	2017	1	52	51	92	8	0	92	8	0	9	30	5	71	75
74	32	2	2017	0	8	43	75	25	0	100	0	0	7	21	4	25	63
75	32	2	2017	2	60	50	90	10	0	93	7	0	9	29	5	65	73
76	34	2	2017	1	48	60	83	17	6	82	10	2	8	27	4	54	71
77	34	2	2017	0	12	54	92	8	17	83	0	0	9	27	4	25	58
78	34	2	2017	2	60	59	85	15	8	82	8	2	8	27	4	48	68
79	37	2	2017	1	69	56	84	16	4	89	7	0	7	31	5	74	65
80	37	2	2017	0	17	54	82	18	0	100	0	0	6	32	5	65	88
81	37	2	2017	2	86	55	84	16	3	91	6	0	7	31	5	72	70
82	38	2	2017	1	44	50	95	5	2	91	2	5	8	27	6	42	64
83	38	2	2017	0	42	51	90	10	2	91	7	0	6	32	6	31	50
84	38	2	2017	2	86	51	93	7	2	91	5	2	7	29	6	37	57
85	45	2	2017	1	70	55	61	39	0	90	7	3	8	27	5	49	51
86	45	2	2017	0	20	54	65	35	5	95	0	0	8	26	6	20	55
87	45	2	2017	2	90	54	62	38	1	91	6	2	8	27	5	42	52
88	47	2	2017	1	54	58	81	19	7	84	9	0	9	35	5	59	67
89	47	2	2017	0	32	54	88	13	6	88	6	0	9	30	5	34	50
90	47	2	2017	2	86	57	84	16	7	85	8	0	9	33	5	50	60
91	48	2	2017	1	25	55	92	8	0	84	12	4	7	30	5	72	48
92	48	2	2017	0	35	57	89	11	0	94	6	0	7	31	6	63	37
93	48	2	2017	2	60	56	90	10	0	90	8	2	7	30	6	67	42
94	49	2	2017	1	145	57	88	12	5	84	10	1	8	36	5	30	51
95	49	2	2017	0	6	57	83	17	0	100	0	0	8	33	5	33	50
96	49	2	2017	2	151	57	87	13	5	84	10	1	8	35	5	30	51
97	50	2	2017	1	56	53	89	11	2	91	5	2	9	31	4	57	54
98	50	2	2017	0	4	67	100	0	0	75	25	0	7	39	4	50	50
99	50	2	2017	2	60	54	90	10	2	89	7	2	9	31	4	57	53
100	51	2	2017	1	50	53	86	14	4	84	12	0	8	27	4	76	72
101	51	2	2017	0	10	57	100	0	0	100	0	0	9	32	4	50	40
102	51	2	2017	2	60	53	88	12	3	87	10	0	8	28	4	72	67
103	52	2	2017	1	75	54	76	24	8	87	5	0	8	27	5	77	65
104	52	2	2017	0	11	57	82	18	9	73	18	0	8	30	4	55	82
105	52	2	2017	2	86	54	77	23	8	85	7	0	8	27	5	74	67
106	53	2	2017	1	39	51	92	8	8	87	5	0	9	26	5	82	77
107	53	2	2017	0	21	52	100	0	14	76	10	0	8	28	4	76	52
108	53	2	2017	2	60	51	95	5	10	83	7	0	9	27	5	80	68
109	54	2	2017	1	60	63	88	12	2	81	15	2	9	36	5	50	62
110	54	2	2017	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	54	2	2017	2	60	63	88	12	2	81	15	2	9	36	5	50	62
112	55	2	2017	1	137	58	87	13	4	85	11	0	10	32	4	61	62
113	55	2	2017	0	14	56	93	7	7	79	14	0	10	35	4	71	71
114	55	2	2017	2	151	57	87	13	5	84	11	0	10	32	4	62	63
115	56	2	2017	1	39	54	87	13	8	82	10	0	8	25	4	74	49
116	56	2	2017	0	21	60	71	29	5	85	10	0	8	23	4	57	43
117	56	2	2017	2	60	56	82	18	7	83	10	0	8	24	4	68	47
118	63	2	2017	1	48	56	75	25	0	83	17	0	9	34	6	63	75
119	63	2	2017	0	12	55	83	17	0	83	8	0	8	31	5	17	75
120	63	2	2017	2	60	56	77	23	0	83	15	0	9	33	5	53	75
121	65	2	2017	1	35	53	74	26	6	80	14	0	9	33	5	46	66
122	65	2	2017	0	25	52	84	16	0	96	0	0	8	32	5	36	52
123	65	2	2017	2	60	52	78	22	3	87	8	0	9	33	5	42	60
124	69	2	2017	1	76	59	91	9	9	78	12	1	9	37	5	37	76
125	69	2	2017	0	10	56	100	0	10	90	0	0	7	41	6	20	80
126	69	2	2017	2	86	59	92	8	9	80	10	1	9	37	5	35	77
127	60	2	2017	1	36	55	58	42	8	86	6	0	8	30	5	78	69
128	60	2	2017	0	24	52	63	38	4	92	4	0	7	28	5	71	63
129	60	2	2017	2	60	53	60	40	7	88	5	0	8	29	5	75	67
130	72	2	2017	1	36	54	78	22	6	86	8	0	9	35	4	61	61
131	72	2	2017	0	24	57	88	13	0	87	13	0	8	36	5	29	71
132	72	2	2017	2	60	55	82	18	3	87	10	0	8	36	5	48	65
133	73	2	2017	1	52	55	77	23	6	73	19	2	9	35	5	92	73
134	73	2	2017	0	8	53	75	25	0	87	13	0	5	34	5	50	50
135	73	2	2017	2	60	55	77	23	5	75	18	2	9	35	5	87	70
136	83	2	2017	1	23	53	78	22	0	91	9	0	9	29	4	26	78
137	83	2	2017	0	37	57	65	35	3	83	14	0	8	33	5	41	70
138	83	2	2017	2	60	55	70	30	2	86	12	0	8	31	5	35	73
\.


--
-- Data for Name: rb_ycost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rb_ycost (id, "locCode", "locType", year, "yieldEst", costperkg) FROM stdin;
1	2	2	2017	3915.74	17.36
2	3	2	2017	2865.60	17.37
3	5	2	2017	4332.28	15.90
4	6	2	2017	3064.84	13.60
5	81	2	2017	5546.42	15.60
6	77	2	2017	5113.54	15.92
7	12	2	2017	2483.61	16.24
8	13	2	2017	3400.38	18.11
9	14	2	2017	4665.36	17.50
10	15	2	2017	4665.65	15.25
11	17	2	2017	3658.62	15.26
12	19	2	2017	3511.42	12.84
13	82	2	2017	4636.15	19.01
14	23	2	2017	3999.08	18.96
15	24	2	2017	4933.19	19.37
16	25	2	2017	5828.13	20.07
17	28	2	2017	4936.34	14.81
18	30	2	2017	2550.43	13.48
19	31	2	2017	5133.91	15.39
20	32	2	2017	4806.48	15.33
21	34	2	2017	5031.83	15.98
22	37	2	2017	2901.46	16.53
23	38	2	2017	3667.97	16.80
24	45	2	2017	3301.58	15.51
25	47	2	2017	3545.93	17.52
26	48	2	2017	2040.25	14.85
27	49	2	2017	6313.52	16.90
28	50	2	2017	4780.38	16.10
29	51	2	2017	4976.89	16.93
30	52	2	2017	4042.56	16.14
31	53	2	2017	3062.57	12.47
32	54	2	2017	4964.29	17.13
33	55	2	2017	4432.97	16.99
34	56	2	2017	3649.24	16.01
35	60	2	2017	2359.64	15.91
36	63	2	2017	4156.00	17.88
37	65	2	2017	3577.58	18.18
38	69	2	2017	4793.25	16.38
39	72	2	2017	3251.28	16.19
40	73	2	2017	4373.25	18.42
41	83	2	2017	3490.88	16.51
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: ids_ecosystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ids_ecosystem_id_seq', 3, true);


--
-- Name: ids_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ids_location_id_seq', 103, true);


--
-- Name: kpi_costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_costs_id_seq', 43, true);


--
-- Name: kpi_costscom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_costscom_id_seq', 20, true);


--
-- Name: kpi_cpi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_cpi_id_seq', 27, true);


--
-- Name: kpi_npk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_npk_id_seq', 234, true);


--
-- Name: kpi_pay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_pay_id_seq', 20400, true);


--
-- Name: kpi_percapita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_percapita_id_seq', 4, true);


--
-- Name: kpi_pop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_pop_id_seq', 37, true);


--
-- Name: kpi_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_prices_id_seq', 39, true);


--
-- Name: kpi_sua_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_sua_id_seq', 30, true);


--
-- Name: kpi_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kpi_value_id_seq', 21, true);


--
-- Name: rb_farm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rb_farm_id_seq', 138, true);


--
-- Name: rb_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rb_income_id_seq', 138, true);


--
-- Name: rb_socio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rb_socio_id_seq', 138, true);


--
-- Name: rb_ycost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rb_ycost_id_seq', 41, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ids_ecosystem ids_ecosystem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ids_ecosystem
    ADD CONSTRAINT ids_ecosystem_pkey PRIMARY KEY (id);


--
-- Name: ids_location ids_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ids_location
    ADD CONSTRAINT ids_location_pkey PRIMARY KEY (id);


--
-- Name: kpi_costs kpi_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_costs
    ADD CONSTRAINT kpi_costs_pkey PRIMARY KEY (id);


--
-- Name: kpi_costscom kpi_costscom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_costscom
    ADD CONSTRAINT kpi_costscom_pkey PRIMARY KEY (id);


--
-- Name: kpi_cpi kpi_cpi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_cpi
    ADD CONSTRAINT kpi_cpi_pkey PRIMARY KEY (id);


--
-- Name: kpi_npk kpi_npk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_npk
    ADD CONSTRAINT kpi_npk_pkey PRIMARY KEY (id);


--
-- Name: kpi_pay kpi_pay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_pay
    ADD CONSTRAINT kpi_pay_pkey PRIMARY KEY (id);


--
-- Name: kpi_percapita kpi_percapita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_percapita
    ADD CONSTRAINT kpi_percapita_pkey PRIMARY KEY (id);


--
-- Name: kpi_pop kpi_pop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_pop
    ADD CONSTRAINT kpi_pop_pkey PRIMARY KEY (id);


--
-- Name: kpi_prices kpi_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_prices
    ADD CONSTRAINT kpi_prices_pkey PRIMARY KEY (id);


--
-- Name: kpi_sua kpi_sua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_sua
    ADD CONSTRAINT kpi_sua_pkey PRIMARY KEY (id);


--
-- Name: kpi_value kpi_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kpi_value
    ADD CONSTRAINT kpi_value_pkey PRIMARY KEY (id);


--
-- Name: rb_farm rb_farm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_farm
    ADD CONSTRAINT rb_farm_pkey PRIMARY KEY (id);


--
-- Name: rb_income rb_income_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_income
    ADD CONSTRAINT rb_income_pkey PRIMARY KEY (id);


--
-- Name: rb_socio rb_socio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_socio
    ADD CONSTRAINT rb_socio_pkey PRIMARY KEY (id);


--
-- Name: rb_ycost rb_ycost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rb_ycost
    ADD CONSTRAINT rb_ycost_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

