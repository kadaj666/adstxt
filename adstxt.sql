--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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
-- Name: auditlog_logentry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditlog_logentry (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    object_id bigint,
    object_repr text NOT NULL,
    action smallint NOT NULL,
    changes text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    actor_id integer,
    content_type_id integer NOT NULL,
    remote_addr inet,
    additional_data text,
    CONSTRAINT auditlog_logentry_action_check CHECK ((action >= 0))
);


ALTER TABLE public.auditlog_logentry OWNER TO postgres;

--
-- Name: auditlog_logentry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auditlog_logentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auditlog_logentry_id_seq OWNER TO postgres;

--
-- Name: auditlog_logentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auditlog_logentry_id_seq OWNED BY public.auditlog_logentry.id;


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
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
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
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
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
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
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
-- Name: dashboard_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_domains (
    id integer NOT NULL,
    domain character varying(30000) NOT NULL,
    publisher character varying(100) NOT NULL,
    type character varying(30) NOT NULL,
    authority character varying(100) NOT NULL,
    source_id integer,
    added_at timestamp with time zone NOT NULL,
    project_id integer,
    user_rec_id integer
);


ALTER TABLE public.dashboard_domains OWNER TO postgres;

--
-- Name: dashboard_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_domains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_domains_id_seq OWNER TO postgres;

--
-- Name: dashboard_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_domains_id_seq OWNED BY public.dashboard_domains.id;


--
-- Name: dashboard_ftp_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_ftp_credential (
    id integer NOT NULL,
    host character varying(100) NOT NULL,
    "user" character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    project_id integer
);


ALTER TABLE public.dashboard_ftp_credential OWNER TO postgres;

--
-- Name: dashboard_ftp_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_ftp_credential_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_ftp_credential_id_seq OWNER TO postgres;

--
-- Name: dashboard_ftp_credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_ftp_credential_id_seq OWNED BY public.dashboard_ftp_credential.id;


--
-- Name: dashboard_project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_project (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    url character varying(300)
);


ALTER TABLE public.dashboard_project OWNER TO postgres;

--
-- Name: dashboard_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_project_id_seq OWNER TO postgres;

--
-- Name: dashboard_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_project_id_seq OWNED BY public.dashboard_project.id;


--
-- Name: dashboard_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_source (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    project_id integer
);


ALTER TABLE public.dashboard_source OWNER TO postgres;

--
-- Name: dashboard_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_source_id_seq OWNER TO postgres;

--
-- Name: dashboard_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_source_id_seq OWNED BY public.dashboard_source.id;


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
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


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
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
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
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: market_apkreview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.market_apkreview (
    id integer NOT NULL,
    "userName" character varying(300),
    "userImage" character varying(300),
    content character varying(1000),
    score integer,
    "thumbsUpCount" integer,
    "reviewCreatedVersion" character varying(1000),
    at timestamp with time zone,
    "replyContent" character varying(1000),
    "repliedAt" timestamp with time zone,
    "reviewId" character varying(1000),
    apk_id integer NOT NULL
);


ALTER TABLE public.market_apkreview OWNER TO postgres;

--
-- Name: market_apkreview_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.market_apkreview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_apkreview_id_seq OWNER TO postgres;

--
-- Name: market_apkreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.market_apkreview_id_seq OWNED BY public.market_apkreview.id;


--
-- Name: market_marketapk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.market_marketapk (
    id integer NOT NULL,
    apk character varying(300) NOT NULL,
    title character varying(300),
    url character varying(300),
    "descriptionHTML" character varying(10000),
    summary character varying(1000),
    installs character varying(100),
    score character varying(100),
    ratings character varying(100),
    reviews character varying(100),
    size character varying(100),
    "androidVersionText" character varying(100),
    developer character varying(200),
    developerid character varying(200),
    "developerEmail" character varying(100),
    "developerWebsite" character varying(300),
    "developerInternalID" character varying(200),
    genre character varying(100),
    icon character varying(300),
    screenshots jsonb,
    "contentRating" character varying(100),
    released character varying(100),
    updated character varying(100),
    version character varying(100),
    date timestamp with time zone NOT NULL,
    last_sync timestamp with time zone
);


ALTER TABLE public.market_marketapk OWNER TO postgres;

--
-- Name: market_marketapk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.market_marketapk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_marketapk_id_seq OWNER TO postgres;

--
-- Name: market_marketapk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.market_marketapk_id_seq OWNED BY public.market_marketapk.id;


--
-- Name: auditlog_logentry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog_logentry ALTER COLUMN id SET DEFAULT nextval('public.auditlog_logentry_id_seq'::regclass);


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
-- Name: dashboard_domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_domains ALTER COLUMN id SET DEFAULT nextval('public.dashboard_domains_id_seq'::regclass);


--
-- Name: dashboard_ftp_credential id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_ftp_credential ALTER COLUMN id SET DEFAULT nextval('public.dashboard_ftp_credential_id_seq'::regclass);


--
-- Name: dashboard_project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_project ALTER COLUMN id SET DEFAULT nextval('public.dashboard_project_id_seq'::regclass);


--
-- Name: dashboard_source id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_source ALTER COLUMN id SET DEFAULT nextval('public.dashboard_source_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: market_apkreview id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_apkreview ALTER COLUMN id SET DEFAULT nextval('public.market_apkreview_id_seq'::regclass);


--
-- Name: market_marketapk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_marketapk ALTER COLUMN id SET DEFAULT nextval('public.market_marketapk_id_seq'::regclass);


--
-- Data for Name: auditlog_logentry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditlog_logentry (id, object_pk, object_id, object_repr, action, changes, "timestamp", actor_id, content_type_id, remote_addr, additional_data) FROM stdin;
1	2	2	google.com	0	{"domain": ["None", "google.com"], "publisher": ["None", "pub-0000000000000000"], "type": ["None", "DIRECT"], "authority": ["None", "f08c47fec0942fa0"], "source": ["None", "Default"], "added_at": ["None", "2021-08-24 09:10:22.845039"], "project": ["None", "Ads-txt"], "user_rec": ["None", "admin"], "id": ["None", "2"]}	2021-08-24 09:10:22.857505+00	1	18	172.21.0.1	\N
2	2	2	google.ru	1	{"domain": ["google.com", "google.ru"]}	2021-08-24 09:10:37.624357+00	1	18	172.21.0.1	\N
\.


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
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add crontab	8	add_crontabschedule
30	Can change crontab	8	change_crontabschedule
31	Can delete crontab	8	delete_crontabschedule
32	Can view crontab	8	view_crontabschedule
33	Can add interval	9	add_intervalschedule
34	Can change interval	9	change_intervalschedule
35	Can delete interval	9	delete_intervalschedule
36	Can view interval	9	view_intervalschedule
37	Can add periodic task	10	add_periodictask
38	Can change periodic task	10	change_periodictask
39	Can delete periodic task	10	delete_periodictask
40	Can view periodic task	10	view_periodictask
41	Can add periodic tasks	11	add_periodictasks
42	Can change periodic tasks	11	change_periodictasks
43	Can delete periodic tasks	11	delete_periodictasks
44	Can view periodic tasks	11	view_periodictasks
45	Can add solar event	12	add_solarschedule
46	Can change solar event	12	change_solarschedule
47	Can delete solar event	12	delete_solarschedule
48	Can view solar event	12	view_solarschedule
49	Can add clocked	13	add_clockedschedule
50	Can change clocked	13	change_clockedschedule
51	Can delete clocked	13	delete_clockedschedule
52	Can view clocked	13	view_clockedschedule
53	Can add market apk	14	add_marketapk
54	Can change market apk	14	change_marketapk
55	Can delete market apk	14	delete_marketapk
56	Can view market apk	14	view_marketapk
57	Can add apk review	15	add_apkreview
58	Can change apk review	15	change_apkreview
59	Can delete apk review	15	delete_apkreview
60	Can view apk review	15	view_apkreview
61	Can add log entry	16	add_logentry
62	Can change log entry	16	change_logentry
63	Can delete log entry	16	delete_logentry
64	Can view log entry	16	view_logentry
65	Can add source	17	add_source
66	Can change source	17	change_source
67	Can delete source	17	delete_source
68	Can view source	17	view_source
69	Can add domains	18	add_domains
70	Can change domains	18	change_domains
71	Can delete domains	18	delete_domains
72	Can view domains	18	view_domains
73	Can add project	19	add_project
74	Can change project	19	change_project
75	Can delete project	19	delete_project
76	Can view project	19	view_project
77	Can add ftp_credential	20	add_ftp_credential
78	Can change ftp_credential	20	change_ftp_credential
79	Can delete ftp_credential	20	delete_ftp_credential
80	Can view ftp_credential	20	view_ftp_credential
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$2tftHWsL5gm6$es+7o2ORTvYw1MgFqQPisfLreGU75zjUHiJ5vqWrvgI=	2021-08-24 09:02:59.741561+00	t	admin			admin@admin.com	t	t	2021-08-11 14:27:06.483634+00
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
-- Data for Name: dashboard_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_domains (id, domain, publisher, type, authority, source_id, added_at, project_id, user_rec_id) FROM stdin;
2	google.ru	pub-0000000000000000	DIRECT	f08c47fec0942fa0	1	2021-08-24 09:10:22.845039+00	1	1
\.


--
-- Data for Name: dashboard_ftp_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_ftp_credential (id, host, "user", password, project_id) FROM stdin;
\.


--
-- Data for Name: dashboard_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_project (id, name, created, url) FROM stdin;
1	Ads-txt	2021-08-24 09:03:18.581039+00	\N
\.


--
-- Data for Name: dashboard_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_source (id, name, project_id) FROM stdin;
1	Default	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-11 14:27:24.189536+00	1	every 5 minutes	1	[{"added": {}}]	9	1
2	2021-08-11 14:27:25.910056+00	2	asd: every 5 minutes	1	[{"added": {}}]	10	1
3	2021-08-13 10:16:34.512266+00	2	Sync playmarket: every 5 minutes	2	[{"changed": {"fields": ["Name"]}}]	10	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time, enabled) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
1	0	4	*	*	*	Europe/Moscow
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
1	5	minutes
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
1	celery.backend_cleanup	celery.backend_cleanup	[]	{}	\N	\N	\N	\N	t	2021-08-12 22:00:00.005772+00	2	2021-08-13 01:01:45.320883+00		1	\N	\N	f	\N	\N	{}	\N	43200
2	Sync playmarket	market.tasks.get_unparsed_apk	[]	{}	\N	\N	\N	\N	t	2021-08-13 07:17:29.939576+00	526	2021-08-13 10:20:05.439657+00		\N	1	\N	f	\N	\N	{}	\N	\N
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2021-08-13 10:16:34.504694+00
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
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
7	sites	site
8	django_celery_beat	crontabschedule
9	django_celery_beat	intervalschedule
10	django_celery_beat	periodictask
11	django_celery_beat	periodictasks
12	django_celery_beat	solarschedule
13	django_celery_beat	clockedschedule
14	market	marketapk
15	market	apkreview
16	auditlog	logentry
17	dashboard	source
18	dashboard	domains
19	dashboard	project
20	dashboard	ftp_credential
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-11 14:27:04.830209+00
2	auth	0001_initial	2021-08-11 14:27:04.901349+00
3	admin	0001_initial	2021-08-11 14:27:05.05056+00
4	admin	0002_logentry_remove_auto_add	2021-08-11 14:27:05.081441+00
5	admin	0003_logentry_add_action_flag_choices	2021-08-11 14:27:05.096787+00
6	contenttypes	0002_remove_content_type_name	2021-08-11 14:27:05.123948+00
7	auth	0002_alter_permission_name_max_length	2021-08-11 14:27:05.135078+00
8	auth	0003_alter_user_email_max_length	2021-08-11 14:27:05.144744+00
9	auth	0004_alter_user_username_opts	2021-08-11 14:27:05.154092+00
10	auth	0005_alter_user_last_login_null	2021-08-11 14:27:05.165042+00
11	auth	0006_require_contenttypes_0002	2021-08-11 14:27:05.168983+00
12	auth	0007_alter_validators_add_error_messages	2021-08-11 14:27:05.177966+00
13	auth	0008_alter_user_username_max_length	2021-08-11 14:27:05.194781+00
14	auth	0009_alter_user_last_name_max_length	2021-08-11 14:27:05.205848+00
15	auth	0010_alter_group_name_max_length	2021-08-11 14:27:05.215987+00
16	auth	0011_update_proxy_permissions	2021-08-11 14:27:05.226118+00
17	auth	0012_alter_user_first_name_max_length	2021-08-11 14:27:05.235668+00
18	django_celery_beat	0001_initial	2021-08-11 14:27:05.287282+00
19	django_celery_beat	0002_auto_20161118_0346	2021-08-11 14:27:05.358046+00
20	django_celery_beat	0003_auto_20161209_0049	2021-08-11 14:27:05.40228+00
21	django_celery_beat	0004_auto_20170221_0000	2021-08-11 14:27:05.410011+00
22	django_celery_beat	0005_add_solarschedule_events_choices	2021-08-11 14:27:05.417166+00
23	django_celery_beat	0006_auto_20180322_0932	2021-08-11 14:27:05.446392+00
24	django_celery_beat	0007_auto_20180521_0826	2021-08-11 14:27:05.476468+00
25	django_celery_beat	0008_auto_20180914_1922	2021-08-11 14:27:05.496099+00
26	django_celery_beat	0006_auto_20180210_1226	2021-08-11 14:27:05.512051+00
27	django_celery_beat	0006_periodictask_priority	2021-08-11 14:27:05.520711+00
28	django_celery_beat	0009_periodictask_headers	2021-08-11 14:27:05.529291+00
29	django_celery_beat	0010_auto_20190429_0326	2021-08-11 14:27:05.657313+00
30	django_celery_beat	0011_auto_20190508_0153	2021-08-11 14:27:05.676736+00
31	django_celery_beat	0012_periodictask_expire_seconds	2021-08-11 14:27:05.693481+00
32	market	0001_initial	2021-08-11 14:27:05.734957+00
33	sessions	0001_initial	2021-08-11 14:27:05.763569+00
34	sites	0001_initial	2021-08-11 14:27:05.790781+00
35	sites	0002_alter_domain_unique	2021-08-11 14:27:05.81289+00
36	auditlog	0001_initial	2021-08-24 09:02:51.074034+00
37	auditlog	0002_auto_support_long_primary_keys	2021-08-24 09:02:51.106593+00
38	auditlog	0003_logentry_remote_addr	2021-08-24 09:02:51.116678+00
39	auditlog	0004_logentry_detailed_object_repr	2021-08-24 09:02:51.126071+00
40	auditlog	0005_logentry_additional_data_verbose_name	2021-08-24 09:02:51.133781+00
41	auditlog	0006_object_pk_index	2021-08-24 09:02:51.15676+00
42	auditlog	0007_object_pk_type	2021-08-24 09:02:51.165623+00
43	dashboard	0001_initial	2021-08-24 09:02:51.178899+00
44	dashboard	0002_auto_20190902_1532	2021-08-24 09:02:51.187973+00
45	dashboard	0003_auto_20190902_1545	2021-08-24 09:02:51.207601+00
46	dashboard	0004_auto_20190904_1459	2021-08-24 09:02:51.222164+00
47	dashboard	0005_auto_20190904_1503	2021-08-24 09:02:51.23363+00
48	dashboard	0006_auto_20190904_1505	2021-08-24 09:02:51.243553+00
49	dashboard	0007_auto_20190904_1528	2021-08-24 09:02:51.257415+00
50	dashboard	0008_auto_20190904_1540	2021-08-24 09:02:51.278124+00
51	dashboard	0009_auto_20210816_1038	2021-08-24 09:02:51.322457+00
52	dashboard	0010_auto_20210818_0846	2021-08-24 09:02:51.342466+00
53	dashboard	0011_remove_ftp_credential_name	2021-08-24 09:02:51.347884+00
54	dashboard	0012_auto_20210818_1038	2021-08-24 09:02:51.367519+00
55	dashboard	0013_remove_domains_user_rec	2021-08-24 09:02:51.385885+00
56	dashboard	0014_domains_user_rec	2021-08-24 09:02:51.402081+00
57	dashboard	0015_delete_domainsdeleted	2021-08-24 09:02:51.409006+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
n6tg5kouv8o8p9a4lx8lxuw2a4xcyt3t	.eJxVjDsOwjAQBe_iGlnxJ1mbkp4zROvdNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1VkadfreE9JC6A75jvc2a5rouU9K7og_a9HVmeV4O9--gYCvfOg_WD0ls5MzBQKbgQ3DORHLYs3MkCTN03UDgPfQZyTsLYEyEHIRFvT_lejfr:1mDpGb:tltQX7ZuhRcMKmtyBv1HmAgwwwXn7JlJ1hyph941Xpc	2021-08-25 14:31:37.97208+00
qpw1cjlcbs72q85jwarv7xisoxiplrdt	.eJxVjDsOwjAQBe_iGlnxJ1mbkp4zROvdNQ4gR4qTCnF3iJQC2jcz76VG3NYybk2WcWJ1VkadfreE9JC6A75jvc2a5rouU9K7og_a9HVmeV4O9--gYCvfOg_WD0ls5MzBQKbgQ3DORHLYs3MkCTN03UDgPfQZyTsLYEyEHIRFvT_lejfr:1mEUEP:3TemAxukfxuxh87Pk-LXZPPGtghPDAoDsHsZasO5RVg	2021-08-27 10:16:05.910709+00
blsmc971s5de00mpchzuzvpk3f51pd0k	.eJxVjMsOwiAQRf-FtSFAebp07zeQmQGkaiAp7cr479qkC93ec859sQjbWuM28hLnxM5MstPvhkCP3HaQ7tBunVNv6zIj3xV-0MGvPeXn5XD_DiqM-q3DlLxw1iiPRTqaHAUL1qFBykAkQBbrrSk6oMoYcBKoIYVSlE8ia2DvD-kMOJs:1mISRq:ZDlg5VLVNMrdZTJFizfKfU1tCBQiMMYWK47VZLoei5k	2021-09-07 09:10:22.902056+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: market_apkreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.market_apkreview (id, "userName", "userImage", content, score, "thumbsUpCount", "reviewCreatedVersion", at, "replyContent", "repliedAt", "reviewId", apk_id) FROM stdin;
1	Armin Sadigh	https://play-lh.googleusercontent.com/a-/AOh14GhzJx7lQcFtuOj-9HXxVquVlmWZAK4SuQT8sMJd-g	Great app, but please expand the DNS list and enable IP address entry for custom DNS. Also the notification control toggle works incorrectly and shows the wrong status. When disconnected, it's active and when connected, it's gray.	4	40	1.3.4	2021-07-17 18:12:50+00	\N	\N	gp:AOqpTOEkeLtKncyyRFyRBtnCgmmvKdpsAclru7rgv9FDENYD62TboJYLrSHZxbjza-SPd_cFroOKEeQ1slC5JQ	1
2	VS YOUTUBE'S	https://play-lh.googleusercontent.com/a-/AOh14Gh9tvsSaeUKKmBQt9RW_Cz_81v3fBwQJPtTjskM	This vpn make your ml ping to low of 43ms but sometimes the ping go abnormal Green / Yellow / Red and reconnecting to the game , I Hope This App Improves More so we can use it The best , I Recommend this app to all ML players if you incounter the ping go Green / Yellow / Red , Just Do This Restart The apps and connect again.	3	211	1.3.4	2021-06-08 13:05:02+00	\N	\N	gp:AOqpTOFLGBzZkWjjq8feX8X6ru5JkBLIv5k5wLzsv_K8xTEtKZDLO5dW4NObnWOf2OFgP6bkcocoBlK4aYepuA	1
3	Louie Michael Ocampo	https://play-lh.googleusercontent.com/a/AATXAJzbgwrwkP3uSIQofrYrx2uXUIdo3qraFqeXVL4o=mo	Fast download and good for gaming sometimes yellow ping but dont worry this app it helps your signal strength, before my ping is 182 for ml but now it reduce 35 to85 ping not bad	4	10	1.3.4	2021-07-18 01:40:38+00	\N	\N	gp:AOqpTOHhM5IMuWCtDrut42dGdatFBNN8hygCjBbzDB3PdlsaS0tWHZQcFvhgR8p7QqTP08aoWibl4FnVFeEA_w	1
4	Jan Prince	https://play-lh.googleusercontent.com/a/AATXAJyd91ZrHzNKVbzihR4ZtZL9EzDPCwaZowUdKXaa=mo	I do not get 1 star reviews it's amazing! 1 ms on Mobile Legends, Stable Ping, Fps is quite good. It's just a tap! I got recommended this through YouTube! When I tried I couldn't believe my eyes! Well it was lagging a bit at first then it became stable!! 5 stars!	5	439	1.3.4	2021-05-08 11:33:37+00	\N	\N	gp:AOqpTOEDY9a6koH52DJajJzboPWW3ePSMSn6uNigvPcHFW3xxONltdLJmsWQ2m8bTrvfLAVJ9fb_dg8KTIKa6Q	1
5	JustApple	https://play-lh.googleusercontent.com/a-/AOh14Gh2AeJIFYSlxiKm2KEs_pjL0vFUGg1FvYbyoQl5Cg	It was good at the begining and then later it would just lags me, I couldn't even run anything and I turn it off and it's working fine.	2	116	1.3.4	2021-06-08 07:21:36+00	\N	\N	gp:AOqpTOGXk9wS9stkP2JdK4ulNc_MouWiK1e0z8bbS4Z8OZZpNu4Yc9JTvKQhsvlXa91PeYzvPD7NnxP9MBKk-Q	1
6	Arman Ali	https://play-lh.googleusercontent.com/a-/AOh14GiDZY3rSnkl1pzzsmsc1t-JAg2WC9oHwoJlK-yaOg	The last update is trash. App is draining TOO MUCH BATTERY!!, I can't use this anymore 😣 Fix this issue soon.	1	6	1.3.4	2021-06-15 03:09:30+00	\N	\N	gp:AOqpTOFBDXffZkz-NSTAmS7tFC0O98PzyBLpGq1UEOft_Ek-VaBvn1ZhVHimj65k-3d_6gCekYoyQQg_j-ufJA	1
7	Jed Cuevas	https://play-lh.googleusercontent.com/a-/AOh14Gh49sW5Jp6fGSXcCBQnakGC3TBcGhknuBVVearMfQ	I love it i recommend it to other player like me i rated it 4 stars, sometimes it lags it turn 120ms and sometime 6ms but its better than 280ms	4	7	1.3.4	2021-06-12 15:49:43+00	\N	\N	gp:AOqpTOEVOd_hSOUoM-lW2BFjYo_cnCFp_E7b3Q7JgfAhdMBYr0GSAbH49uXuM1BSoetNc5K4CTz5BPkxA7CaUg	1
8	CHING TAM KHONBA	https://play-lh.googleusercontent.com/a-/AOh14GhdT9t5a1yM65OtVTPssgA53D_9vL7QtZL6eOlFjw	The game always lags even tho while I'm using the app. It says 1ms or 7ms on the lobby but in the game its 80 to 120 ms as usual pls fix	2	181	1.3.4	2021-05-16 10:28:15+00	\N	\N	gp:AOqpTOFCQaVryc5KpKjNoOGMoDcCUGptV0GuKb9dkBuqB9-I1mblIHwWCaLYZOI3wevkrMjWe4pG0Hqley4PYQ	1
9	Lucy Sianboih	https://play-lh.googleusercontent.com/a-/AOh14GhX459FUTcIKaLc9kWef8J3QaQ0vfBVJG4iN_JZ3g	This is good,i play MLBB, in lobby it show that only 1ms but when i am in battle the net is slower than before it show that 289 ms	1	12	1.3.4	2021-06-27 12:19:05+00	\N	\N	gp:AOqpTOHY5ZmihI3CF8tgIrY2YxhDmbnfiGIkjcd5dsHTM7bYAtlkb1wPxozyYFzpUkjQK1lBSTlVY7dz97JEfw	1
10	Marck Dagundon	https://play-lh.googleusercontent.com/a/AATXAJy8BrLvoVohHuXmyU2fFEjpg8CusczpQdyWh_Li=mo	When you open it very good internet but when it is open for long period of time , the connection was going to bad and slow	3	140	1.3.4	2021-05-11 14:36:52+00	\N	\N	gp:AOqpTOGP3jEusFjr5REP3L8fKNNE1V9_nqnHWhRM8Ogr31-yad9cO9GFEW5wq785_pMBm6y_IUEe4bImQJ74Ag	1
11	Smile On Top	https://play-lh.googleusercontent.com/a-/AOh14Ggr-QFduvWUS8nLZ7ZD_ojea6IddbMmarkx5ven	Doesn't work on my device ,not sure it will work on others too.be sure to check.	1	1	1.3.4	2021-06-29 07:16:31+00	\N	\N	gp:AOqpTOF7vl97MMORskCMydBNmxnp8giUsYgofPi5fr7ctlf-kkb7i_ef6DSvaGG6THVFcM_XnJY6zYUG3i5ZiA	1
12	Zertobe	https://play-lh.googleusercontent.com/a-/AOh14GiSJN36jiNOM6p_yMTAsdiWWR1vHTb3x6uDDPPY	I used this app and my ping in MLBB became 1ms. Nice app it made my connection stable.	5	6	1.3.4	2021-05-17 07:50:36+00	\N	\N	gp:AOqpTOGjlLAXY0PzjGOfWD5ugWUUV1iBreDUYwM04dRfpT6BpyBsm-zwWxQQ7r5ninSPABsDXeqHTs8DJrGDYQ	1
13	Noah Andrei Ventoso	https://play-lh.googleusercontent.com/a/AATXAJwJ68TFfSq7hwN7CXUlB4fdVuQF8yQAKYAtJtWD=mo	Yes, it strengthen my signal but i think this app should work even we dont have a data subscription..i hope you update this	4	2	1.3.4	2021-05-20 16:34:31+00	\N	\N	gp:AOqpTOEG-blvL9zxML-jigFlsXswnWDLmkUCtfcotC-enxlB_IoaOFWGceQWGLrUXrIlVlrf6A_UXIB8qHIk2w	1
14	Johnrey Diploma	https://play-lh.googleusercontent.com/a-/AOh14GjZ48BSxKLplS_6uDZ9fwgY1nrj-foQjThJGykS3w	This apps is very nice I have low ping but there s a time that have a small log but over all it's very okie	4	63	1.3.4	2021-05-03 10:58:42+00	\N	\N	gp:AOqpTOEZk-pWu6OWkf4pln62Dnalkd0HIUzwED-mctc5vAHtpVK8rvNVBABtRSZY9PXyYsFgKfnOYX9Ws-fKbQ	1
15	Antonio Lopez	https://play-lh.googleusercontent.com/a-/AOh14GiepZPqFVNDLBFAC6PeRURG8XoWNv5a_FiEqJ3t	Thanks I don't have any log when I using Data but the WiFi is not working its logging but thank you	5	1	1.3.4	2021-05-13 23:26:30+00	\N	\N	gp:AOqpTOH6poO8LO01CSUjnB4NLC27CIft2xglwrmdOzpjyglB0QeoHLm4TfOx_MUSTG8xR1hN4nagaMJnl-n8Pw	1
16	Night_ Core02	https://play-lh.googleusercontent.com/a-/AOh14Gg4EY09lin0vBPRVWXxl6inKo3dztUWVhONjlI	I rate 1 star because while it lasts, my ping is high	1	0	1.3.4	2021-07-16 13:41:39+00	\N	\N	gp:AOqpTOHvYGjb2GuGF5gSfgSpmIiixrR4a8o9Oq8N1QPAy00Njvjsz26GSubYLmqDSPhHLmGLQ8cj_j1IHuYbWA	1
17	Khian Dizon	https://play-lh.googleusercontent.com/a/AATXAJw1Ded2E-KGydZs0An5fv56_t-SrIi3j8afa7ci=mo	Cool but in mobile legend so cool 2ms or 1ms so 4 star helpful for mobile legends best....	3	1	1.3.4	2021-07-06 04:20:58+00	\N	\N	gp:AOqpTOHXSc-iLCA-9sQ7GdaxxPMBtsjFEK9oH_Bb_YYwpiL-ZL4aaaCibIqie2AQIqGc1cijlSE0HuqwCQfCbg	1
18	No Worries	https://play-lh.googleusercontent.com/a/AATXAJx4HPmiR0BF3cywLVlgY5CU-aU5dYUcoizyqNMl=mo	Sometimes, the notification badge can't be cleared. (Samsung, Android Q)	4	75	1.3.4	2021-05-05 05:36:21+00	\N	\N	gp:AOqpTOEAxfJMlp41yHRnMUCeJ11woG8ndnyLQl7wTveWVd8MfR3eR67JgvY7CyiKYKOWPnljR0naiGBOS-NRlw	1
19	Rodzi Lot	https://play-lh.googleusercontent.com/a-/AOh14GjBXNNyzjuYDP1NNOMakmQm0rDUVug4AJ4HK2Txczo	I get ping 10ms mobile lagend.. Recommend to install ok..	5	0	1.3.4	2021-07-25 10:08:42+00	\N	\N	gp:AOqpTOGj3tP2D8-W65JJjWeGti_Oq3hrixZFnUTWd6PHkShizCQ8C4xvInE91nStPu8yi0D0gta8jUKGMou5BQ	1
20	JL Caberto	https://play-lh.googleusercontent.com/a-/AOh14GhIzZL738nA9UKPsVLKZXhTMzFIUyMXblBG_yt1	Its ok in lobby 1ms low ping but in gameplay 120 ms need to fix this plssss🙏🙏🙏🙏	4	1	1.3.4	2021-05-29 10:12:45+00	\N	\N	gp:AOqpTOE6qpaD7fhrLR9StQ6fTstriBPEMSfpLaPpr5IvuAlBe2CAK4UzB892X_FAi2Y0hjJFRamk87axRkecgg	1
21	John paul Salipada	https://play-lh.googleusercontent.com/a/AATXAJydtE-kfrTj-6F7ttt4mA7VKZO4Yz_vS32ubcn4=mo	My ping in mobile legends is 1ms and pubg thank you very much🥰🥰 intra..	5	1	1.3.4	2021-05-17 14:49:51+00	\N	\N	gp:AOqpTOGOf4QJNNULKOMn5TgQtjlIqLnqoWIA7HTYxPqp_PoVOUnVXn_Wf1g5pOiSg_p9uF7TECIUj79Tg5JV4Q	1
22	Ahmad Khairin	https://play-lh.googleusercontent.com/a-/AOh14GiZ0MaJrbziezNGZzQOleHd9Qnz6zsyLafZrvL4JA	I love this app keep update to make internet faster	5	0	1.3.4	2021-07-21 10:57:16+00	\N	\N	gp:AOqpTOG6fCXTC6-ktGuihRZFcd1eNHrDDN8wvhjqN567tNCsw37RtuZh9eThA8KtRtOVJ084Ju-0HqPQ0MgAYw	1
23	Rex Adrian Orsos Dy	https://play-lh.googleusercontent.com/a/AATXAJyIWE23b7YYcn0ttWeUuDen9eLwSKza-FTGWCgR=mo	I love this app because I can watch at YouTube and Facebook with my dad.its awesome	5	0	1.3.4	2021-05-25 23:02:42+00	\N	\N	gp:AOqpTOHoO1yQUI3xuHx5-VE1NMHEcaaj6Mmuiy4IUZit-u3fKLICxEYQ9Xbk0V0bPQGXrQ7CjzDKWJHK61_YEw	1
24	Stay Cool	https://play-lh.googleusercontent.com/a-/AOh14GiNaqXCiGZLI10MIykayHB_panGyvpOUUcWfQ4J	Just Tap and Done!Very easy to use...	5	0	1.3.4	2021-07-06 17:29:11+00	\N	\N	gp:AOqpTOEFeo7B-GtOhs0KIXvZLQh4URsdBcikKQUXvnuJTU0FVqtl6E8baZXBeyXoyGivZ_qQom6U2MJzFp1LuQ	1
25	NUN CHAWMTU	https://play-lh.googleusercontent.com/a-/AOh14GhTtMvJJ0t1mxCBYu3zJkN9hXyYb5lYKI05Sd7w	Its super its save data and fast internet keet it up always remind me new update	5	0	1.3.4	2021-06-18 14:56:00+00	\N	\N	gp:AOqpTOFsj1-f9bgP-SPBtKVDXrT6PDWxT7s6g8hli4dtCuvx2TGFxUHHGEx3SVL0GmH7SJZ_QK-aGyqyjb72RA	1
26	trends movie	https://play-lh.googleusercontent.com/a-/AOh14GgyTVtC3E3xEp2VOw-6mWqtQhtizRH2txD17PPQ	Very nice app my ping before 129 after 3	4	2	1.3.4	2021-05-25 09:40:17+00	\N	\N	gp:AOqpTOFt6ehshhlUE_dtQm4A7JQfvSt9lFeFrhoXjbeJAbsdLvmvzU4Sqbd3nqu5-aReZ2MpM4tNLfVSTFl2IQ	1
27	RHEAN SP	https://play-lh.googleusercontent.com/a-/AOh14GjbV7LoThX3gFGYfmtxA0-BLp-VFDj1FcTTz3tCwA	Yes its true my ping in mobilelegends Was stable and smooth game And i dont know why others say it will banned other accounts if we use this App	5	42	1.3.4	2021-04-29 14:11:21+00	\N	\N	gp:AOqpTOHsVDvOgu4IgK__sx4vgUw3l_688qUjFVp4dhik7lt8bflxps4lGSvk_7OcnSO0DNUungKh8BCZLRgm-Q	1
28	Dheeraj Bhaskar	https://play-lh.googleusercontent.com/a-/AOh14GhXFaXijmhEhh_qJphy6eaxuPMxY0DpftDDn742Wg	Just didn't work. Showed no error	1	1	1.3.4	2021-06-05 02:30:51+00	\N	\N	gp:AOqpTOH4lWsaOUkscVzPZyUPRVCPPBINT5hSxm5bK-Bw4vp10aGyh67vGgTkbU8N1fsBTBwBhPefSsnZnc6kmw	1
29	thaw htoo	https://play-lh.googleusercontent.com/a-/AOh14Ggovxn1kucL22fvZhAphZxpjCCAUDcqaX3iKzbQ	This app so good for stable ping for ml and pubg so thank you	4	0	1.3.4	2021-07-02 10:27:26+00	\N	\N	gp:AOqpTOGzt2cf70kyAkYnFcdxY2kjG7Uh0WTIIA-GEEUPVJJIJeCbgwxNeM1RWMU4vW8XVfEcvhWwe_iEUH_pag	1
30	Zulzairy Yeye	https://play-lh.googleusercontent.com/a/AATXAJxdbXgkUotMzchgZy5EGHccYv1arcCiu79vPZ6e=mo	Nahh😒...."1 ms in mobile legend" are you kidding me? why mine doesn't work? After I'm turn it on it still 188 ms and it make my gameplay little laggy. I don't care if you don't know what I say, but I am a Lancelot user and fast internet is important. Maybe I need buy a new WiFi.	4	1	\N	2021-07-26 12:37:13+00	\N	\N	gp:AOqpTOFzZozMx5r65w7P2Ppjf0XjdF0BDK1ynr0Ge6USQcxlaQINUMe0jsBpSdHBy8qC28KOBgWq-Fc4a5vIGg	1
31	Stranger ._.	https://play-lh.googleusercontent.com/a/AATXAJzctDkjXi1hQFIBS51arw0qe6KZ5KzI6CbaJraD=mo	Useless app.Always crashes when I open it.	1	2	1.3.4	2021-05-05 13:22:25+00	\N	\N	gp:AOqpTOHG_dnOjQlY5ue9Yhbgo_j-IWKlgTwqKTLcofHf4WNwGSoLNYgcF18wk4aIZTS65t1Bhu6X_R-iIdPCWQ	1
32	Kyaw Swar	https://play-lh.googleusercontent.com/a/AATXAJwIwvvb-GS7JGjk1aEllgeSmnU4hz0n_XLmM93X=mo	1ms Are you kidding This app is very good Thank you very much I like this app OK okokok	5	3	1.3.4	2021-05-19 09:26:30+00	\N	\N	gp:AOqpTOEafS_eC8CiR5WX3bAW2iQEJ0I804kEj9tdN2dPepBZPM9se3APCt_7ndWWzeUd_8_oRi7RNfvEu1LK1A	1
33	Royce Leandel C. Nilo	https://play-lh.googleusercontent.com/a/AATXAJyB_fkp1yedIvpFvEyo86RXw2h8jMxT3_u-vyrl=mo	Wow It works For Low Android End Devices.. It Depends On Internet Service provider Here in the Philippines three major Telco Smart, PLDT, GLOBE and Converge ICT Solutions. Sometimes very Slow internet because of Low Quality of service. Depends on High speed internet. If without Intra May In game In Mobile Legends 120ms worst Today 3ms 24ms 50ms wow. It so works Make sure on battery saver To avoid Large Consumption drainage.😊 The Developer Has Very Good. 😭	5	16	1.3.1	2021-04-17 20:37:00+00	\N	\N	gp:AOqpTOGr2fgcO0JUwAeBrEEqYI1OyD4V1_YSXXrBnhk2lLOVPBJq6yuB_vSnRApq5PZuv1YCb-rp1E8p4giH-w	1
34	Farhan Afif	https://play-lh.googleusercontent.com/a-/AOh14GgZ8tVC2J81flkrNBdITqCxhctl87C9r20isfYeiw	Easy to use and nice interface. Dont expect for this app to get high speed because its free. But so far, I really love this app. Thank you so much!	5	3	\N	2021-05-31 01:40:53+00	\N	\N	gp:AOqpTOGN7L2GhXwQoMjKv-jAXNsC7F2rD3CdLrMNsawjIgrmIxMem0GUANCWby3uQsw-qXIYuN8ITS2z1IgemQ	1
35	UncensoredDisplay	https://play-lh.googleusercontent.com/a-/AOh14GiTwigRfbkBmR6AasR2Jndd0Uz0hmrHAPGWpHhs	It's the best DNS changer that I ever uses but the thing is that, it keeps on crashing in the background even when I whitelist it on my battery optimization. I don't know why tho.... If this is not the app's fault I'mma change thisbto 5 star...	4	1	1.3.1	2021-04-29 14:10:40+00	\N	\N	gp:AOqpTOFjeYYM1Ew00jZFKTQuzWP82r8oQHGmcgXSimy2tsjl1ZjnSnAkCcexCjaTgqQdtCM7RJg2koPG24dDrg	1
36	Christian Betco	https://play-lh.googleusercontent.com/a/AATXAJyc2qmIvBVcYy8j-i4z1L6en-PQYSkjrpZAYn8w=mo	This app is amazing when i play mobile legends its smooth	5	1	1.3.4	2021-05-11 06:55:22+00	\N	\N	gp:AOqpTOFxg4bVc97x64UU4l4b3tmPyF1jCvzT3FH8ThJCTGpXJpRSQHQzS0k1QCU4qqoxe-zXGqY4rL1f-wkHvw	1
37	King Electro	https://play-lh.googleusercontent.com/a-/AOh14GgVYzaHk2mqUuTHhIBV69bZLfVPvO_Y3Qg84Gw1	This is good. Actually got 1ms but when i play a game it actually gives me 60-70ms its okay😊. Love this app.	5	0	\N	2021-05-19 07:35:50+00	\N	\N	gp:AOqpTOGAuugvMM1oseBRrpC4vAXzqvWHbvCPMPksTprF3lYZD79bg6jrvT2vlmd4kqU1SMc8JxCkGBZzC0Na6w	1
38	MobileGamingMK	https://play-lh.googleusercontent.com/a-/AOh14GhUHvU6PG7flicAEXgxMQkJSeNxx3j0ZTY71gioOw	If I could to give 0 review I will do it but since there is option for one I will rate this 1 star without thinking, I thought this application will eliminate all traces and will allow only one from localhost to server, using this software my ms went from 50 ms to 180 ms I really don't recommend this application you will waste your time and you will lag when you play games	1	19	1.3.1	2021-03-25 16:29:07+00	\N	\N	gp:AOqpTOGCDG8YYPsrFfvY-nLOYk4IkY5tJLAC-rkyjqHNd1wXIjNy2ID0qWW72o5XmJbTT0_hCYS9vN_4hcxE4g	1
39	Alfred James Cabido	https://play-lh.googleusercontent.com/a-/AOh14GgpuD2FAHI7N6HVAdRmMCARaxNNWVFJc0IP_M16gA	Not working in my place.	1	15	1.1	2021-04-20 01:12:21+00	Thank you for your feedback! What didn't you like about app?	2021-04-19 08:06:50+00	gp:AOqpTOFABmcKHt_o-3qWnSFoZIAjxW7A6gpVQ5z8H2N0A0APf-JFWu8hmX-IRATOdca6t4rRlxIB82mrtpf0VUI	2
40	John Russel Lentejas	https://play-lh.googleusercontent.com/a/AATXAJzcLZwbd4sneiYfOwe03j7SUwHuoeWWZZFUGYPX=mo	This is not enough!!	5	6	\N	2021-04-29 03:11:08+00	\N	\N	gp:AOqpTOG_EUap7ll8F4HTF9rt0_BoNM0ct1B4Dp_3-pFjrUoNLWOvyz6yCTD5scpeQAqomVPaKkeiFpU7huY7ME4	2
41	Eddie Bunales	https://play-lh.googleusercontent.com/a/AATXAJzzEajUZd3l88XZfPrrkLN-4CCH7Vl9hPgnwLsY=mo	Use full for downloading files	5	12	\N	2021-04-18 11:11:41+00	\N	\N	gp:AOqpTOGQB6lxS-WfweS9j0t402bGXB9dsc4w6cRMbFnH0ffXCpdFWbvRpUBkpBgLmrZBkfJUZTBq5LK4XrEnFBs	2
42	DYNOO GAMER	https://play-lh.googleusercontent.com/a-/AOh14GhCf3sHIOoNrOeTNDOXfjxUnSFmG8zvBzQg4bGl	Super app	5	0	2021-22-04	2021-05-06 06:15:52+00	\N	\N	gp:AOqpTOGkMeS7eRpa_yylDFfVNBRz3QH5zXixPRETD7MmsF_OwvwCwFlR_FaL-plB7IZqPLGMngNou0scfqm1UhA	2
43	Nanda Tamang	https://play-lh.googleusercontent.com/a/AATXAJyN9zM5DhIYGueTGWfieCfUWk8I6NqWSnSkhCKZ=mo	Gg	5	0	2021-22-04	2021-05-12 01:38:39+00	\N	\N	gp:AOqpTOGMzSakGm253ZiSwTC4xHpLl7CIbaSMAkUE0aZ3sEUmIVQzOiW1-1FAT23qxOzGztJ4pFbN7JPLkgD2Pgc	2
44	SB ARIF	https://play-lh.googleusercontent.com/a-/AOh14GiG6Rqx1dNEldEW4A-zvOFMf7YIWp-yRCNelBcm	Nice	5	0	2021-22-04	2021-05-03 14:16:23+00	\N	\N	gp:AOqpTOEqImnQ_quMcgJq1m3ZCz48dsQ7gDNGfzTa7FOUPj9NYOc8omAgV_Y6EE16soSzN6Y1kb-9vvhHnISiY3E	2
45	Ronit khan	https://play-lh.googleusercontent.com/a-/AOh14GgAxv9gW7eyK05wxXGAYjLr-YEJDWEEFD4WNkK_Ug	Jgh	5	7	2021-13-04	2021-04-14 14:45:52+00	\N	\N	gp:AOqpTOHqs4ai0RmaHwxy0lN3gFahYRKdTrncqQAtAB9Yr9VUwlFnlk8MCl_mdxFr3xZZoDrO97SmNxd09K5fSH8	2
46	Sandip Gamer	https://play-lh.googleusercontent.com/a-/AOh14GgnniUEbvTaiAaxlv5magyi__DwWYXkjof35gVl	Nice app	5	0	2021-13-04	2021-04-22 07:26:21+00	\N	\N	gp:AOqpTOH8a9gR9pnX39HewC_AZ7NHOoU3ZJJRw6z6ms_s7TfOcitFnXPByv2xMI97F0AzOyFVfaQQKEVf79EJZQ8	2
47	gaming with shubh	https://play-lh.googleusercontent.com/a-/AOh14GgOHlHD5PIemuNx0GAH0JBuv4LNGK2sHXRBv79D8g	Garbage	1	3	2021-13-04	2021-04-17 18:59:23+00	Thank you for your feedback! What didn't you like about app?	2021-04-19 08:02:38+00	gp:AOqpTOGey-vtQa3ixYCIOs060LdcbyyR-r6HLSRUWzcP2kG_Goqex-wNOW4DUnLFj5DeMYL5V7wURYGG_qzE3QY	2
48	Rakesh Khumar	https://play-lh.googleusercontent.com/a/AATXAJzw0AZL9nElmymoHlZGNLRtus_Q8F6G67IS91mT=mo	Nc	2	2	\N	2021-04-14 06:36:10+00	\N	\N	gp:AOqpTOHx3TTK-d_6CLzdxAgPesEP6YtvCFgIfpkPBlevtOljvAE3SeR27GZmJ1Bu3IXSEYk869LKEHJ9dLkCQIs	2
49	Gareth White	https://play-lh.googleusercontent.com/a-/AOh14GgTRU7eFXaaV5uKO2kbzGLb-Ddx0txZSm7ZNs9lew	I love the app and the website, I use it to buy gifts for my friend and her family, instead of have to send them from England. The only problem I have with the app itself, is that there is no English language version on the app, I have use the website itself and use the translator. It would be great to see a English version in the future.	5	14	13.15	2021-07-24 21:46:20+00	Гарет, добрый день! Благодарим вас за оценку. Рады, что вы с нами. Прислушаемся к вашему пожеланию. По возможности постараемся реализовать его. Надеемся, в дальнейшем сервис будет только радовать. Ваш Ozon	2021-07-25 05:24:53+00	gp:AOqpTOHVreDvHegd_vf5H_LSJOSCU1iibDKesriXaTtkUIQzr-SHR2oJhRfvrOSULq1PokSkOYX4wXo5OS7SXw	3
50	Alhassan Hammoud	https://play-lh.googleusercontent.com/a/AATXAJxk3fbmQFLOv8XvqDIm6LmFpoQfF_9yfGK2kxdx=mo	I bought a laptop almost 2 years ago with 2 years of guarantee, from a company owned by ozon (ООО Интернет решение). When I wanted to extend the guarantee, the purchase receipt wasn't clear enough so i asked ozon support for new receipt. They denied any responsibility and asked me to connect the seller comapny myself. Update: After long second conversation with the tech support. They denied any responsibility (again).	1	2	13.16	2021-08-04 12:06:11+00	Здравствуйте. Понимаем ваше недовольство. Напишите, пожалуйста, номер заказа в любое наше официальное сообщество социальных сетей. Мы обязательно во всём разберёмся и поможем вам. Ваш Оzon	2021-08-04 13:21:36+00	gp:AOqpTOHrwb09DeJD-ggXwk1GbImuQ832Jke-YM6PgYbz_PPhXHL2MwWP-iV1eWcR11dKtqItHZCb0KfFK3JndQ	3
51	Ванюша Пользователь	https://play-lh.googleusercontent.com/a-/AOh14GgiA5owJJgTjsOs4T-eykTSZHOP0Y2bH-ttTJ5BBKA	Pros Useful app Convenient settings and selection Fast delivery Cons Megamarket (a lot of different sellers) Sometimes not enough the necessary goods	5	2	13.16	2021-08-04 12:33:25+00	Здравствуйте, Иван. Рады, что вам нравится наше приложение. Учтём ваше замечание. У нас постоянно пополняется ассортимент товаров, вы всегда можете обратиться к нам в чат, чтобы мы помогли вам с поиском. Надеемся, что в дальнейшем наш ассортимент товаров будет вас только радовать. Ваш Ozon	2021-08-04 13:27:39+00	gp:AOqpTOHZhui_WrJwgf6IV8IZjnI8pf2c1OR93PxWt9SyHjujUtNBL6-GjE_HHdPmBF-ifd8Ta9rQKEQiUno44g	3
52	Irina Rakhmanova	https://play-lh.googleusercontent.com/a-/AOh14Gion4cFzDG6cLwG4tn2MTbPqG27Nh7ZTRHuF8S_	I like Ozon. Application works perfectly.Very comfortable search. I like it.	5	0	13.17	2021-08-09 05:30:56+00	Здравствуйте, Ирина! Спасибо за высокую оценку. Будем и дальше стараться только радовать. Ваш Ozon	2021-08-09 06:38:56+00	gp:AOqpTOEddyYUvqxEVkiYWpk0AF87XRq8FXMuVS2TLIx6fTBNKCEWoJR36tA6uqLDE_m-V-APeR8p0smtOwqlUA	3
53	Forhad Hossain	https://play-lh.googleusercontent.com/a-/AOh14GiIiufnDYvIhvDLO9vsqLyaoP8l6dN2_8ZBX3Nc	Its comfortable with ozone to buy and delivery is perfect with time showing.	5	0	13.16	2021-08-02 20:55:24+00	Доброй ночи. Спасибо за пять звёзд! Рады, что всё нравится. Ваш Ozon\n	2021-08-02 23:22:55+00	gp:AOqpTOGnj_q5omDO6OyTrP0aSjQElvAzEIidVbvvtSejzvPlR5_N0N017cQ9o3WrzF9zpp-gUHgxH0PsH2ZVWw	3
54	Olga Pokhvalova	https://play-lh.googleusercontent.com/a/AATXAJwz4WZSfKiU_Xq28PQhVOTxMaHRW5qSyg04-DIY=mo	Great app, very easy to make orders, good search engine, I can find and order almost everything)), no problems to receive an order (many pick-up points)	5	13	13.12.1	2021-07-08 04:55:12+00	Здравствуйте, Ольга! Спасибо за высокую оценку. Будем и дальше стараться только радовать. Ваш Ozon	2021-07-08 06:09:08+00	gp:AOqpTOEMbRxCOxVSXULWx5oi_SR5m8jzTlDZnHWw46sXcjt719_mPNCNu518KG-OA4bT_YChKc9qmteMZIGB6g	3
55	loussi	https://play-lh.googleusercontent.com/a-/AOh14GjfQ3dqB9N46J27Y0APuv79gxBuwKx83TerAhvNYmY	easy to use and there are sometimes very good sales. the support system is good they answer fast and actually help.	5	3	13.9	2021-06-19 05:47:08+00	Здравствуйте! Спасибо за отзыв и пять звёзд 😊 Рады, что приложение понравилось. Ваш Ozon\n	2021-06-19 06:33:39+00	gp:AOqpTOGDnxCxDiyGhqSQJFKuAxsUox-tBwwvKoHgrQp56RWus6ZdqdOOuLOhyeo3qR25z3EhyBtSuyusTqLCSg	3
56	Dina Igorevna	https://play-lh.googleusercontent.com/a/AATXAJz-Qm2FUEZavocC4tl5Y95g6nqzs84ClsH_3WRJ=mo	A very convenient app. But sometimes, I can't get the right consultation for returning my purchases	5	10	13.13	2021-07-12 14:56:27+00	Добрый день. Дина. Спасибо за отзыв. С вопросами о возврате товара вы можете обратиться к нам в чат или в социальные сети. Мы обязательно вам поможем. Ваш Ozon	2021-07-12 16:12:51+00	gp:AOqpTOGd9uCpggjd7UQ0Qgr7RPo5UOkozgZ9ZMXEmO1XWroGS2Zlhd-mnytRum-MBrzaCn1WaYpwFHeY1_nOsQ	3
255	Anel Hodzic	https://play-lh.googleusercontent.com/a/AATXAJzUnihKsxhS-1D6zzTexYEcZQuDLr4-c_ya5f7-=mo	Its kinda hard when 75% of available klicks require pay to use.	2	29	\N	2019-12-12 12:31:23+00	\N	\N	gp:AOqpTOHu3C39oOyxJKjTfRxdeZ4GPzpA5hRssjmkBhVhn2EZbSd4sd3nky1id6kRH19CEe3Xc_S5d808UvFp	5
57	Roman R	https://play-lh.googleusercontent.com/a/AATXAJx4kV0Fz_xD3bbV50Y28YcGikFM9vfYOhBnux_b=mo	Afraid to say too good, but this is the best customer service! nice deals. There are no any issues to make return, just make one more order and give return to driver. Many thanks to Ozon team!	5	6	13.11	2021-07-02 18:07:55+00	Здравствуйте, Роман. Мы очень ценим, что у нас есть такие отзывчивые клиенты, как вы. Мы постараемся и впредь оправдывать ваши ожидания. Ваш Ozon	2021-07-02 19:17:11+00	gp:AOqpTOHPIYSFjhbsNDMC_Pm3DXvyiXdpe4zdbgspyMil36DO5GFCMLZSaKyGhrza4EZ2beJKflpe6y5QVtRtzA	3
58	elena rodak	https://play-lh.googleusercontent.com/a-/AOh14GjzZ7JSiv_b0QLXfH8JxxdmJBSWIyNipwb2SwAsrg	Easy to use, quick shipping.	5	0	13.17	2021-08-08 12:53:30+00	Добрый день, Елена. Спасибо за то, что оставили отзыв и оценку. Будем радовать вас высоким сервисом всегда :) Ваш Ozon	2021-08-08 14:14:47+00	gp:AOqpTOHd0NvIWsTmzM8jEsyo3jJ1WqWqe-_sNeWHjYq_ndH26n-KPFNlXbThiomFd3OnPCuT8tiXgknIMQSbKQ	3
59	Lourdes Florentino	https://play-lh.googleusercontent.com/a/AATXAJwZZ09pqiyv0xECALs884p4J7iHaVyWVYMYYleE=mo	All is great,thanks. Shopping makes easy	5	1	13.14	2021-07-19 12:18:05+00	Здравствуйте! Благодарим за отзыв и высокую оценку. Будем рады выполнить новый заказ. Ваш Ozon	2021-07-19 13:15:45+00	gp:AOqpTOEHnEPolTyvYrBdEFF22epVjBEpnF_ZTf6ar-oEOiI-GsPnzqmG1YTgR2bMteml78LX-hDpSsZ17atuYA	3
60	Malebo Lesige	https://play-lh.googleusercontent.com/a/AATXAJwP-LDZ-v_h9i5YvnweaE1HMKIOyV0ItHx-zHle=mo	Very good and all kinds of products are available... whatever you think you want or need... you will get on ozon	5	9	13.6	2021-05-21 05:22:13+00	Здравствуйте! Спасибо за отзыв и 5 звёзд 🙂 Здорово, что наше приложение удобно для покупок. Ваш Ozon	2021-05-21 06:27:17+00	gp:AOqpTOHgNMlI7mPharwRpZaqP4Mcb_65N4lObsW3GVeudI72-Kr0OwQmJu0pqS43mvCcLop-nEMaNM-hJdkBFA	3
61	Nata Nikolskaya	https://play-lh.googleusercontent.com/a-/AOh14GggGoHf4eZvoX73BSv1JZpmmOrYqK9HpiM5itgj	UPD: 2021. application still doing great. Thanks a lot to all who did it! 2020. As for app everything is doing great. Thanks to developers! And on the whole for me OZON is the best online-shop with fast delivery and really great support for customers - they helped me many times, always immediately and qualified. This shop literally saved my life during the quarantine in 2020. Thanks guys!	5	2	13.13	2021-07-09 16:31:05+00	Здравствуйте, Ната. Нам очень приятно, что вы находите время, чтобы оставить отзыв. Стараемся, чтобы нашим покупателям было у нас максимально выгодно и комфортно. Ваш Ozon	2021-07-09 17:30:55+00	gp:AOqpTOHMaAapSoE8ayjF0YfNizM0qEYFPdgLhfj1zYMBudI3IkCgbuovnKnSEHAQrN-kdlbrCM87PbvzpNgxfg	3
62	Ruslan GSXR	https://play-lh.googleusercontent.com/a-/AOh14GgOkv6YGds2z5uMfQu4mhUbVumfE_IxzpqCQ7wiww	very convenient and,what more important,: got full description about any stuff.	5	5	13.9	2021-06-18 12:14:30+00	Добрый день, Руслан. Спасибо за отзыв и 5 звёзд. Желаем вам приятных покупок! Ваш Ozon	2021-06-18 12:34:00+00	gp:AOqpTOGMKr7siqkIAJSybdcwf1WDyB0yTazZva_jg3CFPQRGn6aCnZ_vEwu4rujdSbN-PP1kCk80HijIvGcErg	3
63	Aisha Fil	https://play-lh.googleusercontent.com/a/AATXAJyl6qFdLoPG99SZcgIBObYIC0EUNxr3qbMgxu4y=mo	Super app. Everything is easy and simply. Enjoy!	5	2	13.7	2021-05-31 18:57:11+00	Здравствуйте. Большое спасибо за отзыв и оценку в пять звёзд. Будем рады новым заказам. Ваш Ozon	2021-05-31 20:16:26+00	gp:AOqpTOFOuuL3LS85ITzR5fywl5ZHd1DdO8fQSEPfwuTx7DFbqCCLexP8Pb4xkccHfj6NlzhKm9ZP0zdtP18Akw	3
64	Эмиль Ахмедянов	https://play-lh.googleusercontent.com/a/AATXAJz2rkwgVjBIGs9X1u6BxRlZmJAkSkKbOahOXoFD=mo	This is the worst service I have ever got. They send my order to somewhere where it can't be found.	1	2	13.15.1	2021-07-27 05:16:24+00	Добрый день, Эмиль. Сожалеем, что огорчили вас. Видим, что уже передали информацию по вашему заказу в службу доставки. Сделаем всё возможное, чтобы решить ваш вопрос. Простите, что так подводим вас. Ваш Ozon	2021-07-27 06:17:43+00	gp:AOqpTOFOdV5-bcpQBfPjEUd8FXcRMs4lAdZJ7EDz5QbM44b0f-WuV2Xv1cuif_E-pc7XZaSbjuMSnQdqwPMmdQ	3
65	blueberry	https://play-lh.googleusercontent.com/a/AATXAJzGGsnU42IWnD67fZHfF-GfZ3c4z9IKuYPIq_KW=mo	Fast delivery and decent products comparing to what other russian companies offer. I'm pretty satisfied👏🏻	5	1	13.11	2021-06-29 19:41:42+00	Здравствуйте! 😊\nРады, что наш сервис приносит вам только положительные эмоции. Благодарим за отзыв и высокую оценку.\nВаш Ozon	2021-06-29 20:55:09+00	gp:AOqpTOGhrkOmKVbGlcJu01BWpOOB_RgEMJMnPZW812fTYBTlj4vFa9a0_mRi6NDtYzmZeuiUD2v5GEjMC2G1aA	3
66	Denis Ivanov	https://play-lh.googleusercontent.com/a-/AOh14GiVV4Ocx_6TJ3vgNzcIrYn-tWAZaX7m7jNkP5qSqA	Very useful app and fast delivery!	5	2	13.11	2021-06-26 17:58:08+00	Здравствуйте, Денис. Спасибо за отзыв и высокую оценку. Приятных покупок! Ваш Ozon	2021-06-26 19:12:48+00	gp:AOqpTOFX9kpskxcwA7F_kybOB3xZdq7ks6lp2TeA5KXT8PCEPNSZCXKrtYnLPUOaE8ibEu-JbzXbK5DR3cGarg	3
67	Elena Pleshova	https://play-lh.googleusercontent.com/a-/AOh14GhRrfPSVPPqN6CEe3WrnFEJDQcXp9qHK-UdJSwiWQ	Excellent app. So many things in one place. I like it a lot	5	0	13.9	2021-06-16 14:56:13+00	Здравствуйте, Елена! Спасибо за отзыв и пять звёзд 😊 Рады, что приложение понравилось. Ваш Ozon\n	2021-06-16 16:09:20+00	gp:AOqpTOE144miAsAn6vqCkwouGHnMJMDcPSVTPA6QtncQtKcS0X6wGIL3F7wbGwtmndqUbB-OdOKIm01tPgdqig	3
68	Ernesto Reinaldo Barreiro	https://play-lh.googleusercontent.com/a-/AOh14Gipe3lqABuqZLJkBUymZviq2VQ44ZEDkYCKLP_7034	Very good. All you need fast and at the best price.	5	1	13.8	2021-06-13 18:18:14+00	Здравствуйте, Эрнесто! Благодарим за прекрасный отзыв. Рады, что вы довольны нашим магазином. Ждём за покупками :) Ваш Ozon	2021-06-13 19:30:10+00	gp:AOqpTOHcAU5UwLJZN8iISXnD5sLXtPyZCDPzRBmFZODMtyNM0F2MQjBXlXqcRrkqjh1fgpip7ZCUjudxxlTpCw	3
69	Sanjay Tripathi	https://play-lh.googleusercontent.com/a/AATXAJwMCfS5iUmvA3Ry-xaGCYaXaq7p_V4ewLUdD_tI=mo	The app is good, I often use ozon for shopping.	5	2	13.9	2021-06-27 15:26:14+00	Здравствуйте, Sanjay! Спасибо за пять звёзд. Рады, что вы остались довольны. Ваш Ozon	2021-06-27 16:19:14+00	gp:AOqpTOHgpIx3VumgJo_0DpZ-bXlznAzH_A6Nalc4_rdTCRzYMU2J7Q6SMdOVhWTXiML4MGHzIdNOnLYAEJuFnQ	3
70	Адит Рудра	https://play-lh.googleusercontent.com/a-/AOh14GiVTXz5wf3j2PRZWi4tZfduIlWMY2J7PQcirPlsfw	Very good service! good discounts!	5	0	13.14	2021-07-22 19:21:10+00	Здравствуйте, Адит! Спасибо за ваш отзыв. Здорово, что всё нравится. Ваш Ozon	2021-07-22 20:33:59+00	gp:AOqpTOGC-4njt18YXwLhShiZxqFm7s9SfWlyJ9LKapyEymarWAT2VayPigRaOhNpNkaM4qZJs2oNd7z825-_WA	3
71	Aleksei Ageev	https://play-lh.googleusercontent.com/a/AATXAJwpBTje9JxHboLVjudBOKSauzg8ZAh7-ND9Kh2y=mo	It is the easiest way to find goods and pay for.	4	0	13.11	2021-06-29 05:32:15+00	Алексей, день добрый. Рады, что наше приложение удобно для покупок. Спасибо за отзыв 🙂 Ваш Ozon	2021-06-29 06:40:41+00	gp:AOqpTOE1jSVNW8G6CpJS0TRLDcAJj3tvWTFfx274eadfPYShby1FvQfkN3RVXVnwZJHAjc181G4_YLSq9PLQ3A	3
72	Sophie Malets	https://play-lh.googleusercontent.com/a-/AOh14Gj41jfYToakayCNY1os9AdGEye0aYk4PoqEUW7wUw	Fast delivery, good quality.	5	0	13.9	2021-07-02 19:03:16+00	Здравствуйте! Нам очень приятно, что выбрали именно наш магазин. Благодарим за отзыв и высокую оценку. Ваш Ozon	2021-07-02 20:04:14+00	gp:AOqpTOGd11bBeR9Fau8L9h3sZ8HJysTXCST1rlC8b3d44hhfkreaadPlgDX7cbhkk18hUmvLstJbmIJekqY-dQ	3
73	Dmitrij Abashin	https://play-lh.googleusercontent.com/a-/AOh14GhLsgLJLd8RxKgkF_Xes5L8qT4U4K7yqgAYoosYAA	It works well, I can buy any sh#*#t online and pick that up in the vicinity. Nothing more.	5	0	13.5	2021-05-25 11:28:18+00	Добрый день, Дмитрий. Спасибо за то, что оставили отзыв и оценку. Будем радовать вас высоким сервисом всегда :) Ваш Ozon	2021-05-25 11:52:29+00	gp:AOqpTOE32bSxsymAcGfUCWzk8r77J0KBQg81s4uzBCOWC3PwDP3KJq24WkqjNsl6zG7PrlRHHFNdLVxGIVfISQ	3
74	Nichole Kozlova	https://play-lh.googleusercontent.com/a-/AOh14GgVDZGAyL85B6Bkpp7oB2iARGNAk2kTWE9BZuED3A	This app works well and is easy to use - both on the computer and on a smartphone. I appreciate the wide selection of products from Russia and abroad (it's sort of like Amazon in other countries, though it doesn't have quite as wide a selection yet). Some food and cosmetics I've purchased even have ecological labels from the EU. Also, Ozon is great at finding the lowest prices on goods, so you can save money. I recommend this app to anyone who enjoys the convenience of online shopping.	5	25	13.2.1	2021-04-20 04:44:38+00	Добрый день. Спасибо за звёзды и выбор нашего магазина. Рады, что приложение пришлось по душе. Будем стараться и дальше, чтобы покупки приносили вам только положительные эмоции. Ваш Ozon	2021-04-20 05:33:40+00	gp:AOqpTOENeTm_Awp5UZq0GHcrW97uuSDHSgP3bbNrrqHTRgiWVEMI1XDEBREm2NWoD4lzPTrocu0E8_ODQq-27Q	3
75	Pavel Filatov	https://play-lh.googleusercontent.com/a-/AOh14GictVeVSyNdMFTtbMB-eE40gZ13tFjYZM5uzPtQ	Stored cards do not disappear from the list when you delete them	4	1	13.9	2021-06-26 12:13:43+00	Добрый день, Павел. Спасибо, что нашли время оставить отзыв. Данные карты стираются с сайта. Пишите нам в чат, если появятся вопросы. Ваш Ozon	2021-06-26 13:25:38+00	gp:AOqpTOHvMwMfGYf69faDPaFR_HXiWkkI_KqdOdyI46uSqm7c4GO8dsxghR-IsLG-VaE6v2r6ee0pZo3N5rQWlw	3
76	Поля Авраменко	https://play-lh.googleusercontent.com/a/AATXAJxFUfwp-rjcAW5HF2VgQNvSW36KxsjhCF--A1s8=mo	Excellent platform for shopping	5	0	13.15.1	2021-07-27 15:52:23+00	Здравствуйте. Мы рады, что вы остались довольны нашим магазином. Надеемся и дальше вас радовать новыми покупками. Ваш Ozon	2021-07-27 15:59:34+00	gp:AOqpTOGv9piyTlrSBPo9CByd4uBDhacT-1qppisiEQpCPyntiHhmp9SN1rdk1mw-8MpmJBJUGk5LaIDsWIRBsw	3
77	Zhanna Lagoonova	https://play-lh.googleusercontent.com/a-/AOh14Ghbpsvded_Xx0sT2C-LYyH401yvBI35XqnjDQ9Dtg	Recently I've had experience with a different shop, where nothing seemed to be automatic, no receipt, no updates and the delivery date was just an approximation, so this one is great experience so far.	5	10	13.2.1	2021-04-24 20:52:30+00	Жанна, добрый день! Спасибо за высокую оценку. Рады, что вы с нами. Надеемся на долгую дружбу. Ваш Ozon	2021-04-25 05:32:20+00	gp:AOqpTOF_vXyb1F5MNqDr57qK0Oj-ZKIuEOnDKALLmJqHjp8qEuqa88eGNRw1yBjIeFagXaKboGQQFScYZzLhkQ	3
78	Andrey Kornilov	https://play-lh.googleusercontent.com/a/AATXAJxllpnWqQ8VPt7WI1vLbuF7eO7twoBD1_fBn-G2=mo	Some prices are rather affordable. But definitely need some monitoring, because further price drop is likely. Though you never know when an item becomes sold out...	5	7	12.3	2021-02-16 12:05:53+00	Андрей, добрый день. Благодарим за классный отзыв и высший балл. Ваш Ozon	2021-02-16 13:15:10+00	gp:AOqpTOFTg1WBM24J5WT65euB17jf3ogvUlXEpZMPYWwSD4IVB6n92gbtU8MHrJzhVqCcQD0M7uVapFUZ6hWofg	3
79	Cry Baby	https://play-lh.googleusercontent.com/a-/AOh14GgqrbUYGnoOxdoD-9xbS6AFycUJ7ckb2CLz2LBVxQ	Sometimes filter doesn't work fine, mean, that when I'm searching special model of monitor, app don't understand that is "Monitors" theme. At all, it's a perfect app, with very good prices	5	5	12.9	2021-03-28 08:45:05+00	Добрый день. Сожалеем, что вы столкнулись с такой ситуацией. Можно воспользоваться фильтрами для поиска. Мы очень хотим вам помочь. Опишите, пожалуйста, ситуацию более предметно. Ждём информацию в чате приложения или в ВК https://vk.com/ozon . Ваш Ozon	2021-03-26 19:50:11+00	gp:AOqpTOE3BKH9E3eWOtT-G7fc6KrydXiCQ8Q7OAyG0DMl17g9uyRIGiZz13eNvIufrShvNvdAFg7Xbi9qVeITPw	3
80	Степан Ремыга	https://play-lh.googleusercontent.com/a-/AOh14GiMY12cFyvZmuTXrusSKJr76pvbEvPiSfxMMrcNyw	Helpful and intuitively	5	0	13.8	2021-06-08 17:59:00+00	Здравствуйте, Степан! Спасибо за отзыв и 5 звёзд. Рады, что нравится наше приложение. С удовольствием стараемся для вас. Ваш Ozon	2021-06-08 19:39:27+00	gp:AOqpTOHQEY6raZ333k_LtQ97lkRpBoXG1CszeQoEdlaAZDwo76hUPqw7OALA8o-KlXFc-Txg9F_NDGrScorijA	3
81	Weird Girl	https://play-lh.googleusercontent.com/a/AATXAJzdJ0eUkyTFCyDq9pcPnBpJdQbDVw1trsRlrrG0=mo	Ok so this game is the most ridiculous thing ever... and I love it. It's a solid time-killer/de-stresser game to just screw around. You can mess with people or just mind your own business collecting food. Ads aren't *too* bad as most are voluntary to net you extra coin. The only forced ones are the occasional one at the end of a match that it could do w/o since most people are cool with watching ads if it gets you something. Could use a tutorial on how to customize/upgrade.	5	3838	2.2.3-a	2021-07-28 12:20:59+00	\N	\N	gp:AOqpTOHOdgr9UcYExXlpMp83nwvSH3MqVeWrN6Ix4A6ZiDiNhGVloctxVbRvl4ApZBnN3rtuangP8TCrZQQyiw	4
82	Jamaica Haze	https://play-lh.googleusercontent.com/a/AATXAJzWRFVGgaygxoM1IqFCtenmtOlo-OJRzJTk0Mm0=mo	An impressive Halal certified goods' diversity, and those from Turkey especially; also from Tatarstan, Dagestan and CIS members.	5	0	13.17	2021-08-09 06:37:28+00	Здравствуйте. Благодарим за хорошую оценку. Ваш Ozon	2021-08-09 07:50:59+00	gp:AOqpTOGGsbhud4oB7mLCOf1qwNv74gvDeo-Ll_r4FXoLNImQltvTN4ltB46bAsQlXU8aB9pRKjP6FTvu_UGpYw	3
129	Safiyyah Hasan	https://play-lh.googleusercontent.com/a/AATXAJwFM_Uflyiht_M0RyZGIF-FRjvyCFcKFAiXwWPX=mo	This game is awesome but the reason I give it 4 stars is because my phone is format and when I downloaded it again it is not opening its just loading	4	23	2.2.3-a	2021-08-02 04:08:58+00	\N	\N	gp:AOqpTOFuADh1EX0BFGs7j3yW0rFAet7_fB9TSYTXEK2zPpO__HdgHk42kyb1RL_SCB7BFAxHoJZJWGgG_m1E6Q	4
83	Balakrishna Patibandla	https://play-lh.googleusercontent.com/a/AATXAJxSnYjj-HqPKNOoWosBBoabu0BpV0ZVmJp2N4gg=mo	I gave 4 stars to this game all the features are ok and good but what I think is when we use the speed feature the food which we ate keeps on minus-ing and the other one is when we go to the add option when we r out I think that we will get the same score and we can continue from where we r out but that's not what I expected it goes to "0" and the only use for taking add is that we will stay in the same game. So plz try to fix these issues, if it is rectified i will obviously give it 5 stars !!!	4	3801	2.2.3-a	2021-07-27 13:17:42+00	\N	\N	gp:AOqpTOFT269uXdoBpfNcFVwsdyrkgDmGUaJU6hATtmszuQpT1oIE6gzCpbqint1TKn9GrwLExjUIZ3WErEj0FQ	4
85	Tiggah Tigga	https://play-lh.googleusercontent.com/a/AATXAJxAylATDOkyLGVugl1ImZ--7wQOZf8k0AP3-Kic=mo	I'm not a bot ugh anyways. Step one . This game is amazing Step two it had ads but it dose help me out by me taken a break Step three they should add a setting were you can puase and do what you gotta do Step four. If you want no ads turn off your internet it is a life hack lol Step five.i just now updated this it better be good if not I'm turning this to 1 star ⭐ review instead of ⭐⭐⭐⭐⭐ so this better be worth it even though I have to sign in with instergram but it's worth it not !!!!!!!!	5	1103	2.2.3-a	2021-08-04 03:27:18+00	\N	\N	gp:AOqpTOHXnTZ1U_yOILVLz71Z1yzQgNBwNWGs4-PeqoHFFiMItlVcIBJ-e9JXY9CO4mZUnzrAmtYHOJpFtY8pEQ	4
87	Alan Hollowell	https://play-lh.googleusercontent.com/a/AATXAJyE4L6ipICAfD3nqsayuWl5VrFLs2gdyEM9tQZ9=mo	It's horribly aggressive which is not enjoyable for me. I would use this far more if the game was played by gamers who were less intent on killing you before you have even had a chance to play for 5mins. Would prefer the same game with more passive opponents. I will probably delete it in the next few days 😥	2	2296	2.2.3-a	2021-07-25 20:20:06+00	Hello Alan Hollowell! We're sorry to hear that you didn't like the game. We will try to fix the game in future updates for you so that you can rate it at 5 ⭐️.	2021-07-26 07:48:37+00	gp:AOqpTOG08Kta_lcCDm6sceQtEqgDzBuKoeZiNmKxAtnu2pQN2aGIyEjYiVtEIgF6qvpqK3maxUKyvw4jxqTw7g	4
89	Jumong Jimenez	https://play-lh.googleusercontent.com/a/AATXAJz232cwtSHrZDKuVQ76qGRwqwJ0wmQnwfHq1MBW=mo	Ads everywhere!!! When you die, you have to watch ads, just to return to the homescreen man. And sometimes even before you can play, you have to watch ads. Come on now devs, is this the best you can do?	1	75	2.2.3-a	2021-08-07 12:00:43+00	Hello Jumong Jimenez! Our game is distributed free of charge, and advertising in it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and high assessment of our work.	2021-08-09 08:46:05+00	gp:AOqpTOHYi-dlCZv_1pKC5-uMHWRVD6kk-9Gz28Bjw5vcFZ0tskV0ClLA-AvclRdiu3VD5Y_oGZMBvNAOS_hbNw	4
91	Neha	https://play-lh.googleusercontent.com/a-/AOh14GjbBdCA4B3k2EPkv6m_PG6nm-pOYN3fSZHEJMYuGw	I love this game. However: 1. The game has no pause button 2. Ads start after ending every game. 3. There is no way to figure out how to increment levels. 4. Real time players not supported.	3	2320	2.2.3-a	2021-07-19 22:16:51+00	Hello Neha! Thank you for your feedback! We are constantly improving our game and try to take into account the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game for five stars.	2021-07-20 06:26:53+00	gp:AOqpTOFosepEwUSKue7EctKI8RHCU1pn-3hdE3UTCy_hFNhtLDxfEkQNHPRarOc6e_NAPw2d-RpJJuAeF4qG-Q	4
93	Aagna Krishna	https://play-lh.googleusercontent.com/a/AATXAJyZoj0fNxAg7R3a7K8pX2WAw6CqkErJGAYe5Dkgqw=mo	This game is very Fun and Adventure.I was looking a exiting and fun game in play store, at last I got a game.The game was Worms Zone that is this game.I have a problem that is,in this game we cannot play with friends and make Friend list also,so we can invite friends know.So,I told 1 problem.Now the 2nd problem is when we are playing the game in infinity or timing mode,in that so many snakes will be there.So, put the names so we can find in Top players.When we find big worms we can look in👆...	3	1739	2.2.3-a	2021-07-23 03:17:19+00	Thank you for idea! 😍 We will definitely analyze your offer and possibly add to the game in the future. Thank you for helping make the game better! 😊	2021-07-23 06:05:46+00	gp:AOqpTOFwQcCHFs_VYebSJTVW7Xl6rItYfkYWp5OhYB4LXnqO_vuvRtGjw28EtFN1-pk3RbaOBEu9Fq_0cPWVXg	4
95	Aayushma Shiwakoti	https://play-lh.googleusercontent.com/a-/AOh14GiQAMk7tAPnGBe3eobKHe8-wSFNSOlh_LvtWZtKCQ	I think it's a nice game but there are some issues like hanging, game freeze, not opening I think that if these issues will solve then this game will grow up and up And if these all of issues will not solve Then it's feature will not be too good Thank you	4	99	2.2.3-a	2021-07-29 16:17:34+00	\N	\N	gp:AOqpTOFuwsj51jL4g_w6sPQ8ghMEJqKV-gSDFBYzSmvkKJErmCEePnf1v3hGrtmwXJ5pPsnvplcUYWBFoVAdEQ	4
97	Yolanda Gonzalez	https://play-lh.googleusercontent.com/a/AATXAJx0PCuMmW2y6-A-GYVy9zovoD8d5V892owp9TIx=mo	Horrible, impossible, dumb piece of garbage. I change my controls and I can't turn. I can't use joystick because I turn too much. Absolutely a boring, dumb trash can. Deleting game immediately.	1	149	2.2.3-a	2021-07-25 21:41:10+00	Hello Yolanda Gonzalez! You can change the control to your preference in the game settings. We hope that this feature will allow you to evaluate our game on five stars.	2021-07-26 07:47:12+00	gp:AOqpTOFwObDYuSSlLayLqlwJHsIJ1UXg-LFDXTYRscoqpntoQI4WHDMEuk7oDj28DYdO2HCC3IRo5B5Z1-QB3w	4
99	Jaydeep Shrimali	https://play-lh.googleusercontent.com/a-/AOh14GijCtuCzeyTqD9TRsWlwIcHaTlN9I8ypdRIIyP6CQ	The Game is awesome, but need to improve its Touch Responce, Movement Sensitivy, Special Button to Boost speed of the snack.. that's why i gave 4/5. pls fix it.. I will be do live straming this game & increas its populatrity..😅Anyway Jokes a part, Love this Game..	4	212	2.2.3-a	2021-08-01 17:32:40+00	\N	\N	gp:AOqpTOEQ-k7K-JaWtd7X6JDHIYHv4el4FxsMafoLzhg3SJcfkGnePyOwy23QkFQaPy1It2C63l___KbNBXKPJA	4
101	Lilian Shongwe	https://play-lh.googleusercontent.com/a-/AOh14Gjzsd6ZURsc3SCGHx_Kky6DGjZw2-Yns-lermsWMw	An almost amazing game! Super addictive and fun! Wish there was an option to play online with friends and invite others and play competitive as teams or as individuals though.	4	229	2.2.3-a	2021-07-27 06:14:15+00	Thank you for idea! 😍 We will definitely analyze your offer and possibly add to the game in the future. Thank you for helping make the game better! 😊	2021-07-27 06:11:32+00	gp:AOqpTOE5zJHpyQ4YX43yQCQP2G0FgVqKTHwyVYJ8RRHtIZr6-kvnWh37UkLxE-nsjT6zdMxVurXjBWkWSxAJLQ	4
103	Mahaveer Singh	https://play-lh.googleusercontent.com/a/AATXAJzS7fSiJukDs84poiXDqgrIBiytcKJzmGBrDl6z=mo	Thz game is good ...... And have no ads in between but the cost of snakes is very costly and with no more design! And i hope you look after my request ....If thz game will be online than dam Sure there will more enjoyment , exciting, relaxing😊😊	3	65	2.2.3-a	2021-08-02 18:18:41+00	Hello Mahaveer Singh! Thank you for your feedback! We are constantly improving our game and try to take the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game for five stars.	2021-08-03 06:11:01+00	gp:AOqpTOHMtbQdInRlJwOcSALmR3kMTWfI0SF4QXXGfoZglWo2NXV3GWaxg-m4fFG1VXizmq6Q0k83TTshKSBtiQ	4
256	David Manton	https://play-lh.googleusercontent.com/a/AATXAJyzFLYHGyiIW8vAY3Nq_JY8rN8AbF_yU2OfuFLJ=mo	Absolutely rubbish, can barely do anything without buying full version	1	56	1.1.1	2019-02-03 17:52:45+00	\N	\N	gp:AOqpTOE4MdLfFGNEoXBpLdyCC3ce4G879ShLCKj4wmPacKwXTrxnR3rlO-N6xk4Bgf9RGRijXeKekc870wec	5
84	Michael Mezis	https://play-lh.googleusercontent.com/a-/AOh14GhsGUu94VrE91ORHsi8aCfXw28D7FtCNqNI4ul1dg	This is the best shop i ever seen. Every day you have some sales. And the coolest is that delivery is free sometimes.	5	5	13.1	2021-04-14 16:44:41+00	Добрый день. Спасибо за отзыв и высокую оценку. Ждём вас за новыми покупками. Ваш Ozon	2021-04-14 17:03:52+00	gp:AOqpTOFQMxv-RcQafN0SnW_YWFJKOD-FtNm_fPvuZEwRdE1ztvd_8AM1fTrHYrnBGYcPY-u5RP5zv96tyb5wrQ	3
86	Serge Urakhchin	https://play-lh.googleusercontent.com/a-/AOh14GihkN0gL3o10n7ZNLy-v64rcIb1JYEVf11briqMhg	Pretty solid app. My favorite part is the locations to pick up the stuff - there are a lot of them.	5	3	13.0.1	2021-04-07 15:40:19+00	Здравствуйте. Благодарим за хорошую оценку. Ваш Ozon	2021-04-07 16:31:38+00	gp:AOqpTOGtWyq5Yi6jQ9VwHyI703Z9uQ2DlNOvRzGeWLGJSbSoTefZni3EI6aqkUL_XMf5m9aGjc4f2vMj0PHE9Q	3
88	alex never	https://play-lh.googleusercontent.com/a/AATXAJwBZDgHyQgkINnNskTWaU6PpS53c-VXyQspmBiL=mo	Easy and useful	5	0	13.5	2021-05-23 14:05:48+00	Здравствуйте! Спасибо за отзыв и 5 звёзд. Рады, что нравится наше приложение. С удовольствием стараемся для вас. Ваш Ozon	2021-05-23 14:55:35+00	gp:AOqpTOHW8Ec4nmvcmOe_1LLHuwRQkroYs66iwUCm60ussrZ3iu2fy3-hC9aUtTsUpfEEPEmG4QUgSbecsgmL7A	3
90	Yogasadhakan	https://play-lh.googleusercontent.com/a-/AOh14GiCohgJs4yKyzqrSEZyPq2BdxAp-IMNEiqSHHCpRw	Very good service, try to include more items	5	0	13.4	2021-05-17 06:44:43+00	Добрый день. Спасибо за пятёрку. Рады, что вам нравится наш сервис. Мы постоянно расширяем ассортимент товаров на сайте. Если не увидели нужный товар, рекомендуем воспользоваться сервисом "Не нашли, что искали?" внизу страницы. Оставьте ссылку на товар или бренд и мы постараемся, чтобы он появился на нашем сайте. Ваш Ozon	2021-05-17 07:40:16+00	gp:AOqpTOH1tTa6TiEq8GWKKnoCTqTWYEhPYm18brm0Ylkc8nQ3bpWvjlkBfospBfWWosWuCNkaIMThSAXV-VZ2jA	3
92	Grigory Vetrov	https://play-lh.googleusercontent.com/a/AATXAJzphH_VSWfoj-_vEy6iVxfpEyeAvm-AkE9KJ-ie=mo	Very nice 5 stars app. All necessary features and functions are presented.	5	2	13.3	2021-04-27 10:21:16+00	Добрый день, Григорий. Спасибо за звёзды и выбор нашего магазина. Рады, что приложение пришлось по душе. Ваш Ozon\n	2021-04-27 10:32:47+00	gp:AOqpTOH9t5RgsB5-VsjLFVWo1552XaahbcOfuYrf0JIvjRS87rH7Ar2b7RM4uUgtyZh67-rC_v6jqFYs7jx88w	3
94	Sabina Ersaryyeva	https://play-lh.googleusercontent.com/a/AATXAJwEpurgdS-2jFnV2TXYDG9j-kpNJas7sfql5_6j=mo	Very convenient. Always on time.	5	0	13.12.1	2021-07-11 12:20:36+00	Добрый день, Сабина. Спасибо за отзыв и 5 звёзд. Желаем вам приятных покупок! Ваш Ozon	2021-07-11 13:20:41+00	gp:AOqpTOHDUzW4HmqYgJ_1BrtMeQ9iNx7iN673oF3f6LAHrPSFfFlzUkQEWDguWv1qN37MS6zW7Kq97PVDwj7mAw	3
96	Howell Kwabena Teye-Anim	https://play-lh.googleusercontent.com/a-/AOh14GgAx5_KDufrzkQ3mlaoTgGSwdB-Q2ExE1HAro617g	Everything is perfect. Can you please add English to language options?	5	2	12.4	2021-03-14 05:14:29+00	Добрый день. Спасибо за оценку! Мы ежедневно работаем над улучшением приложения. Обязательно примем во внимание ваше предложение. Ваш Ozon	2021-03-14 06:17:53+00	gp:AOqpTOG0eBHMQeDk5ydrfR-Qfb4TQgs_hJc2JFSiOAUuLN6W2lwuRCiaf4xT0DL5aXps-9Yl8UOxrmDfNtHVJg	3
98	Vadim Mineev	https://play-lh.googleusercontent.com/a-/AOh14GiNiI_FcEQTycfDEAfQk5y3k02tdseiEOdgL1N6dg	I like the app. I've ordered some products and it works just fine!	5	1	13.1	2021-04-18 21:46:34+00	Здравствуйте, Вадим! 😊\nРады, что наш сервис приносит вам только положительные эмоции. Благодарим за отзыв и высокую оценку.\nВаш Ozon	2021-04-18 23:29:32+00	gp:AOqpTOEjH-yO8HWxqdJSMI6EiXvPA5iyG1zzsKn7zCWDe6UK6Z9hz1ERCOdMuQozG0QuZtFkqS4oty-U5-vlqQ	3
100	Scott	https://play-lh.googleusercontent.com/a/AATXAJy8fsD45Lv-mFWoWP0TxFg2mV0V6vwV47TYENFv=mo	Not working! I get technical error all the time. Pixel 2 xl. PLEASE FIX!!!!	1	8	12.7	2021-03-15 17:23:12+00	Здравствуйте. Понимаем, как необходима бесперебойная работа. Рекомендуем, очистить кэш и переустановить приложение. Если ошибка сохранится, напишите нам в чат или в любых социальных сетях текст отзыва и адрес электронной почты. Сообщите , версию приложения, версию операционной системы. Пришлите скриншот ошибки. Мы всегда готовы помочь. Ваш Ozon	2021-03-15 18:35:47+00	gp:AOqpTOFm3W4d1HqwcU1tQ_wR6aZuVceGi3-wIf1Z8e_-Zf-zpY6bXPAJPJWBw2uCJjziu9LYx_2-82E2JzIZOQ	3
102	Abdennabi Hakki	https://play-lh.googleusercontent.com/a-/AOh14GhFy8P0xNRBwM6pm8fDI2JfnKEHKhJSvQiWe8GIcg	Easy to use, good prices and good support	5	2	13.4	2021-05-06 09:26:06+00	Hello, thank you for the stars. We will continue to try to please you. Your Ozon	2021-05-06 09:53:14+00	gp:AOqpTOG1YgmqtdJJqON81cgur89CYVJ7fnl8o_jXIEgzikNbv8T0MBe9DPLeklwnI4y_DudQaIKkoGgCSfXeZA	3
104	Jayar Rosqueta	https://play-lh.googleusercontent.com/a-/AOh14Gg-HYeOOB3T5EndmgjndveA2Spkg0fg5TPXtfuJtw	I think it works better if there's an English translation.	4	1	13.2.1	2021-04-22 04:41:28+00	Добрый день. Спасибо за оценку. Мы ежедневно работаем над улучшением приложения. Обязательно примем во внимание ваше предложение. Ваш Ozon	2021-04-22 06:08:44+00	gp:AOqpTOG00ZoxgM8rrRpXZ_eEUw0Nr2u_Yg9nuxKWhNXyxpho7Cn8J6_hfYCl4dwdrYIfFnxVAAGQTFar8mDDTw	3
106	Vadim Sozykin	https://play-lh.googleusercontent.com/a-/AOh14GhFQOjOyTcnVBCIWzLLWX8Dd8XfEz45Ik7kvlAxew	Free fast delivery, great variety of products	5	0	12.8	2021-03-26 06:39:42+00	Здравствуйте, Вадим! Спасибо за высокую оценку. Счастливы, что наш магазин вам понравился. Постоянно работаем над качеством сервиса и доставки. Ждём за новыми покупками. Ваш Ozon	2021-03-26 07:44:09+00	gp:AOqpTOELlrUmmJcYo8NmP-fd1nSC-KBLrqJeovpnJAfrY1sq9hIGwQz59km6-AeggbtPTf5I_FaGNWvfcWPEOA	3
108	Agshin Aligulov	https://play-lh.googleusercontent.com/a/AATXAJy8rEa4_u4Zf0e-ZVs5bYMMiW0CCO0FLhYWLLpi=mo	Great application, and accepts international payment cards!	5	1	12.5	2021-03-03 20:36:28+00	Агшин, добрый день! Спасибо за пять звёзд. Рады, что вы остались довольны нашим сервисом. Ждём за покупками. Ваш Ozon	2021-03-04 06:28:06+00	gp:AOqpTOGjF7iyIiT4wcLRb4xUN_4qQD1UccuTj6CcSv1gtjnwIenWuidppn4u0wOrW57UtftzxSx3Tm3niHhv9w	3
274	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	It's awesome and superb	5	2	1.0.2	2018-11-10 06:46:56+00	\N	\N	gp:AOqpTOECTCsuKqKQD-xO3GhWdDAUGD7IFG5JOlLrxxZPgA2JSuvwlRvMUK-LmY5pcvBoTkIKOPNbsrpjP1QE	5
105	ADITYA JAGDALE	https://play-lh.googleusercontent.com/a-/AOh14GhpZa3aQqibdFNrQirF6PdViUuPyW1yq8TpU7AlkQ	This is nice game but but when out everytime then it get bored i am not saying that it's not a nice game i am just telling that it's anice game but what happens is that when you out everytime then only it gets bored but but plzz listen to me iam not telling that it's worst and bad and all and all and all that so this is a nice game but what you do that keep 100 points first only added so if challenge comes so what we have to weight so it will go faster and faster so mine rewiwe for game is good.	5	4	2.2.3-a	2021-08-08 08:44:43+00	\N	\N	gp:AOqpTOF1vIW5JDMZgimCauo1xe90RLhxiKUS-5DACvNFJzFC5_7D5MEgDEQVHSzrZV3DXzJgAFAKm-D8Zp_ALA	4
107	Siok Khim Soh	https://play-lh.googleusercontent.com/a/AATXAJxsT3OfIGhdR1CjixleXziiJ4J_yEa88l_hW7kw=mo	Impractical targets to reach, kill 15 worms in that 6 or 8min? We watched YouTube with many multilayer streaming but when we play, mostly we know they were bots. Put us all in a room rather than facing bots all day long.	3	83	2.2.3-a	2021-07-25 08:14:17+00	Hello Siok Khim Soh! Thank you for your feedback! We are constantly improving our game and try to take the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game for five stars.	2021-07-26 08:29:39+00	gp:AOqpTOF0fuODwrkQaH47lNYA_56vLrB4VShzSLWZhknL7Mw87iDHrFlTCEjadMc3Ub1ZjfuI-HPgXQYXhr8mpw	4
109	Correana	https://play-lh.googleusercontent.com/a-/AOh14GgCw-HO4Dd9cg55KI9zqCUMJgHYLMiHUCsZmlscrA	I love this game. It's fun. My kids an I all play this game. If you enjoy snake games like Slither. You'll FOR SURE love Worms Zone.	4	7	2.2.3-a	2021-08-08 18:14:10+00	\N	\N	gp:AOqpTOEG3NmgNfKXhRjiaRipftmq1vRGUbcbDqupJL-R93TMo3iDWa431YhwLvxP4gX8iphXUKyGQo9fAjHGNA	4
111	shafin vai	https://play-lh.googleusercontent.com/a-/AOh14Gir5xc_2mgi9VF9OYngVazlzptpueE4a7RTMPVqRw	Its fun, though ads are killing me,and it would be little more competitive and fun if the names of player are written in worms body to detect players.and there is so many mod hacker who have premium skin by modding.	5	105	2.2.3-a	2021-07-29 21:35:32+00	\N	\N	gp:AOqpTOEGpUACvv5U_gjIRE7cQs5VNu30u0EhHPlJPXW3DlaDOmxRDwN_fvU_68qVQRkJrmksxZ_FcXchSpJaPA	4
113	Anita Batham	https://play-lh.googleusercontent.com/a-/AOh14GjUa6Ba7Swwr3JSA3wAygAPc2vo8P0S3blriwzDMg	Very very nice game i like this game can you make more batter because we can not see the name of top player and we can't invite our friend And you can make it more batter I give you 10/10 to this game please make more gave like that	5	246	2.2.3-a	2021-07-29 06:49:19+00	\N	\N	gp:AOqpTOFtaTMEyrPlvud4hFex-pdGSWyZyYCMf-rDFBav0AhDRa4NJFifY5xfExGQ-Rn9jV-YXC21pkRDoc_2Yg	4
115	Bonnie The Bunny	https://play-lh.googleusercontent.com/a-/AOh14GgvEsWNKvueXVKs3Rt96T_iBj48VR9YKbnGtrNZ	I love this game, it's just y'all need too add more game modes. Please add a different game mode.	2	25	2.2.3-a	2021-08-03 18:09:11+00	Thank you very much for your feedback! We are considering many innovations for the game and will try to add them to the game with a new updates gradually. Please stay with us. 😊😍	2021-08-04 06:10:27+00	gp:AOqpTOFzr542NxLiDpE-kv1vMyQ2IlkC06W30wIM-vkGRNeodKga-S5ejevdqDAm6s4G86yFeSqZMGzpH_XvcQ	4
117	JhayEm A.	https://play-lh.googleusercontent.com/a/AATXAJyIqXy9eHYdr0B7LFXnVBslZlxg-yCE8ALvDB6b=mo	Stupid game. you suddenly die without hitting anything. at first i thought it was my error. but confirmed ypu suddenly die for no reason unistalled.	1	129	2.2.3-a	2021-07-25 10:40:12+00	We think that you are playing in a mode with limited time. When the time comes to an end your worm just disappears. Or you are playing on a black background, where it can be black worm near you. We hope this information will help you to evaluate our game five stars.	2021-07-26 08:19:50+00	gp:AOqpTOHTMNOARXrCGkQxofzkcfTsdRmDEJF8raL0mpyYghwewmKC0A7vYkUa3n1o8-W-kb2pARSNi-M0aLFi2A	4
119	Kristin Jordan	https://play-lh.googleusercontent.com/a/AATXAJwXuVb4XcCY2GtCavkdSmjBZGC3Lda5KsC-AakmfIM=mo	I put it 2 stars because worms just pop up out of no where. Making us slower will fix that. Another thing is that when we die, there is an ad that looks like the play again button. So i constantly keep watching ads just so i could get 0-500 mass. Totally not cool. The last thing is that DONT BUY NO AD PASS there is barley any ads TO skip. Plus why would you even buy it from a game? Save up your money!	2	4392	2.2.3	2021-07-15 03:46:15+00	Hello Kristin Jordan! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating.	2021-07-15 06:25:03+00	gp:AOqpTOFURJqMCN3olvHTgYCoZtujKuTS_9Ir6dHB7Xc4gXePiAAZ-7DuybjkE3zvE-1mdsAwdfcXaPHH3yGr9w	4
121	Iqbal Umer	https://play-lh.googleusercontent.com/a/AATXAJxpZT0-hXBuIExsTxZ6Mg-uig7TXiJzmQZhU_KJ=mo	it is a very interactive game with so many different kinds of worm colors . I just love this game soo much.	5	68	2.2.3-a	2021-07-31 13:16:00+00	\N	\N	gp:AOqpTOGtijq7aPS5ptc3krl_gF3mpq-GA-MjZNq1FPFCJEFAImAGki2lS0BWTlXKVy5GBMI0VkQbWjOHgKje_g	4
123	Question Everything	https://play-lh.googleusercontent.com/a-/AOh14Giq88kWQQrBzlxw13_HPBnZomRPAfsH0LMXqfL_	Really great except I keep getting clobbered by an invisible worm. Usually when I get to a weight of 500 000 or more. Which is quite disappointing. Have had a score of over 9 million and it happened. A bug in the game perhaps? Otherwise a really fun interactive game. Love the different settings. Thanks!	5	3484	2.2.3	2021-07-15 16:32:51+00	\N	\N	gp:AOqpTOFQ4KDpoX4JYg3pRqRmtGXuqh5gqszN05rIuW2cobj_QpG6KPwfm8FgJIEJQNuX2O411SRKneC-YkmSvw	4
125	Jan Michael Del Castillo	https://play-lh.googleusercontent.com/a-/AOh14GjUa_lrh6M1UrYOOl-sQlz7HdliboL_WGabJ9CPWA	Good game, but sometimes I can't control my worm which is annoying. When you died, there is an option to watch an ad then it says it will resume your gameplay but it restarts. I'm not that sure if the enemies are a real player but if not, I'll recommend adding a 'mode' when there will be an online mode which you can play with real people and invite your friends and they will be your teammate like you can't kill them. That's only a recommendation but it's clear that no one's gonna follow😂	3	8215	2.1.2	2021-05-27 04:26:25+00	Hello Jan Michael Del Castillo! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-27 06:02:12+00	gp:AOqpTOG-ow5m3RH2rNEfEqWUQhU8_17N_CQvP9NdbRIOhUQN13TLnNOoCX0YB8nQHcuMD_S7ScRqVWNRZrBz8w	4
127	almost home	https://play-lh.googleusercontent.com/a/AATXAJyBjb_TTLH3Hb7GjipXWpGMlxOJgnpW6w7wENCD=mo	I loved this game. But now when you die, and you watch the ad, it makes me loose most of the progress on the tasks, timed or no time. The game wasn't doing that before about a week ago. I didn't even mind after a while that it makes my worm start small again. But now you basically watch an ad, just to watch it, it doesn't help to keep the progress that' you've made.	1	7736	2.1.2	2021-05-22 13:22:51+00	Hello! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-24 09:31:57+00	gp:AOqpTOGgEIi3nnHavO4RFOqx8EVSk0Z7Hlhk7b71DUQ0F_2F-HHIXo1ObDwJR7WJUcFezhHgmZ10Q68ngGkn0w	4
893	LD S	https://play-lh.googleusercontent.com/a/AATXAJxAeTGkKweaVXguNMX1GbW47wDDunlqcvSSTXeY=mo	ITS BOARING	1	0	\N	2018-04-23 22:28:04+00	\N	\N	gp:AOqpTOFrhN81dqADOZZOOaaxKiMc7LPXOQupbpZIdyyhA-7_2Dx1ll_8sHzZvSKxZ__5GCBl6bBoZAn7ISbq	5
110	СЭМУЭЛ Лешао	https://play-lh.googleusercontent.com/a-/AOh14GjWOCHGNtTSpNNQQ9ymX7bAsuypDgWTC6OQWLGqJw	App runs smoothly, convenient for use.	5	3	13.4	2021-05-10 10:21:41+00	Здравствуйте. Спасибо за отзыв и высокую оценку. Приятных покупок! Ваш Ozon	2021-05-10 10:34:49+00	gp:AOqpTOFOx9vdElmIktlc_HwtHxmUBuOBKiVnf4HdMxluCB9gIGhoLBPE3vNfZNZVQ55_THVnKMpiNdO9o6QV0A	3
112	Loridel Odones	https://play-lh.googleusercontent.com/a/AATXAJy4DqE_VGOIxPK_k1l7j9jNqSpWpKjSqeta73M7=mo	There should be english translation .	5	0	12.9	2021-04-21 11:07:17+00	Здравствуйте! Сожалеем, что отсутствие перевода вас огорчило. Стараемся улучшать наш сервис. Ваш Ozon	2021-04-21 11:51:21+00	gp:AOqpTOEt8ymH5vet6CM7sAJhRZsOFSJ4bF__dBIDZ2_-c51PW-EsJG2b95c7pn4BeVANml-Dq0PejtFD8TTPew	3
114	Lydia M	https://play-lh.googleusercontent.com/a-/AOh14GjRrBIL6sN0ctTejpZ7CtPpe0kS_H5dg27SRCx_	I love this application.. easy to use and i just love it	5	1	12.6	2021-03-18 11:23:01+00	Добрый день, Лидия. Спасибо за звёзды. Рады, что вам понравилось наше приложение. С удовольствием исполним следующие покупки. Ваш Ozon	2021-03-18 12:29:44+00	gp:AOqpTOGvAOvM4vedHnJSi5L7rsYR7xTGe77s7TxUwNVlZ3rrRYw2vt1breVEjjqN3D-ElWCgNzhCdUgGJRvl8g	3
116	inna delta	https://play-lh.googleusercontent.com/a/AATXAJzcIGv7Swqi4_itAYHhhvu078B4_u_0OUEBgQkh=mo	Very clear instructions. 👍	5	1	13.10	2021-06-25 00:48:09+00	Инна, здравствуйте. Рады, что всё нравится. Спасибо за отзыв и звёзды. Ваш Ozon	2021-06-25 01:51:16+00	gp:AOqpTOFH4fyuVb6jrct3B1w0lje0jsn1aB_G1t66MwP30ybQIgumJ35vshiJsIkSO8iaoXbtM4vypGWoNHXdNw	3
118	V. P.	https://play-lh.googleusercontent.com/a-/AOh14Gg6P1kWCLGWGmMJz0lyDoZE50508iTCWHoX2j9gQN8	Good app, good experience	5	0	13.13	2021-07-11 04:00:16+00	Hello. We are glad that you like our service. Thank you for 5 stars, we value every customer's opinion. Your Ozon	2021-06-15 12:44:17+00	gp:AOqpTOH7K5ON_7OeX2KCtfMNysAhLGY2EH82vFJB6h1sU54UP_GT4yJLn1jp01nbp9lk1RTqwboRxA9BCYTsxg	3
120	Дмитрий Коковихин	https://play-lh.googleusercontent.com/a/AATXAJydtnGUGIlZbVf6_BWCqW0MPVU_qAshk_giQXuv=mo	Thank you Ozon. Every holiday I use your service, every holiday you make my purchases easy.	5	1	12.3	2021-03-04 20:00:29+00	Дмитрий, здравствуйте. Спасибо за отзыв и 5 баллов. Рады, что вы остались довольны нашим приложением. Ваш Ozon	2021-03-04 21:25:05+00	gp:AOqpTOFUb58ajgKIDyOPEvcLDkoxLpPZLDJ1fK3Jz89bp9FVO_HTh49xRkXT9fPxdcoS1ayvFX-4eYxNiB88eA	3
122	Sunny Pichyakorn	https://play-lh.googleusercontent.com/a-/AOh14Gi_NCftce1SNLd1MCW-LSnYW7OjfAGGaWcDZui2iA	easy to purchase, deliver on time	5	0	13.3	2021-04-30 10:54:39+00	Добрый день. Спасибо за звёзды и выбор нашего магазина. Ваш Ozon	2021-04-30 11:25:39+00	gp:AOqpTOFYWcWNsj__W5YsoFUTqMP2yHZsh_AyatioEWbt35hRgd6w7M7G3kTGgJi9p8IlF5prOJstKUoY-3CfBA	3
124	Konstantin	https://play-lh.googleusercontent.com/a-/AOh14Gg6Dw934GJluKIP8rXr-NyBOb7PGfUI-KX9Amw9ouE	Good app, too complicated and busy	4	0	12.6	2021-03-17 11:15:34+00	Здравствуйте, Константин. Мы учтём ваше замечание. Надеемся в будущем наш сервис будет оставлять у вас только положительные эмоции. Ваш Ozon	2021-03-17 12:30:32+00	gp:AOqpTOEuxPZnSTGqHegWRfX34ZUBqjhsaMvJ5asJnIGi-UquStRWOR3pv5-zDCnwKCZlaAi0b5L99jqBT5j7-Q	3
126	Albert Rum	https://play-lh.googleusercontent.com/a-/AOh14GjxePUzGB5a3ndlOAsj7PokE36rvNaqq7g53cc5Rg	doesn't accept foreign credit cards - that's a NO Also have to take care of scams and chinese rubbish - if it is very cheap it is most likely scam. *We are using VISA they are just not Russian and there for don't work anymore. I know several cardholders that can't pay with foreign VISA cards anymore.	1	1	12.7	2021-07-06 15:40:07+00	Здравствуйте, Альберт! Мы принимаем к оплате карты VISA, MasterCard; American Express; VISA Electron/Plus, Cirrus/Maestro. Мы стараемся следить за качеством товаров на сайте и готовы предоставить сертификаты. Если вас возникают вопросы или вы получили некачественный товар, напишите нам в чат. Поможем, разберёмся. Ваш Ozon	2021-07-06 16:08:00+00	gp:AOqpTOF0Ikk6NRVkC8CXjI9Sp6P2OuT_qcDv8EpNTnRTmaznAkMCxUBvLNBedUFC5wOFDxlo51VAH-K3CCUuKg	3
128	angelina antoshina	https://play-lh.googleusercontent.com/a-/AOh14GiclCFnGbizFmJ4aOksjLI7tOV0pcmKAW6uzzymTw	I really like Ozon! Even though I have also had troubles with deliveries and sometimes the quality of products. The assistants are always there to help and sort out any dilemma. So thank you for your service)	5	0	\N	2021-06-27 09:32:33+00	Good afternoon, Angelina! Thank you very much for your time and feedback.\nWe are very pleased that our service was able to please you.\nWe hope for a long friendship.\nBest wishes, Ozon	2021-06-27 10:26:35+00	gp:AOqpTOGFpZbRpoP3gaqYFOZGoU-mc8F6pl9VDNi9-s0FAUj88APd18026da0HCzqzypItfKBPaTybbs0_0d1jA	3
130	Yury Zlokazov	https://play-lh.googleusercontent.com/a-/AOh14Ghzrn_ifH24aYnYS9iTMNigVyVsUbCxhjhH13nCIA	everything is fine, good job, keep it smart	5	0	13.8	2021-08-04 07:19:09+00	Юрий, здравствуйте. Мы рады, что вы довольны нашим сервисом. Ваш Ozon	2021-08-04 08:11:40+00	gp:AOqpTOHX77vz6XA162YXt1jNLJxSZD0v1ClZjQ1Q_TNKDZiFyQnm9KGZUmP1ja2u4BgZJtlYtHNdTe_ySxK6Gg	3
132	Зилия Узбекова	https://play-lh.googleusercontent.com/a/AATXAJzpeSla55I0I3ZB_h8zIAOPCpldVXZCQPceu_T0=mo	Prices are lower indeed, which is really nice	5	0	13.3	2021-04-26 08:15:37+00	Добрый день, Зилия. Спасибо за то, что оставили отзыв и оценку. Будем радовать вас высоким сервисом всегда :) Ваш Ozon	2021-04-26 08:53:00+00	gp:AOqpTOFyv0rF2g0GuRFfClQJqC6Kep2ZLu0HwUAab_cqwUk-GJNxgH9xfU2VLjyEqf3r7SsdBiC5NFv41ESeTA	3
134	Дарья Зверева	https://play-lh.googleusercontent.com/a/AATXAJwSz09w5dnCXd-0XnB0oN8YJqp1nVYvWgqOjCXe=mo	Useful and user friendly	5	0	12.7	2021-03-14 08:41:56+00	День добрый, Дарья! Рады, что наше приложение удобно для покупок. Спасибо за отзыв 🙂 Ваш Ozon	2021-03-14 09:08:39+00	gp:AOqpTOG_l5eLhtouubdxa0OZx6SXkXfUXb0j_2ucJ5TsfTom2vsnY-wCsB89JqxI-4OSKIQACCX26qJU3hnoig	3
136	Deepanshu sharma	https://play-lh.googleusercontent.com/a/AATXAJxDDqWwH9Jh1F7WKn9mNobhK4WQjVXCZ7ByH7CI=mo	Everything is good but would like to have an option to turn the language to English. The rest is nice.	5	0	\N	2021-08-08 13:50:56+00	Здравствуйте. Спасибо за отзыв и высокую оценку. Обязательно примем к сведению. Приятных покупок! Ваш Ozon	2021-08-08 18:42:42+00	gp:AOqpTOF9EyMTDpx9Qm49R0KcmpxH9PA-rg5Jq6QS50LtGK_KEV6LmUf2VybaMxd-yYk9bllRfEWSLKSLaauKsg	3
275	PA AMARASOORIYA	https://play-lh.googleusercontent.com/a/AATXAJza17URnFOUOEV1KFexf3lR4D0-wM2dfxmYZcMj=mo	Learn more 56800000$	1	0	\N	2021-08-04 14:36:27+00	\N	\N	gp:AOqpTOGGiq4B21IiECr4iy8dEJKIe_73JHUmp3NJtDm0E_co3HRn_DD4ETib_9wjD398ZmTpISrWXUGTiQ1P	5
131	Shamima Nasrin	https://play-lh.googleusercontent.com/a-/AOh14GgECleZwNyntBzoKx5seKPFNUJxKp7_sTlGJegGyw	The game is fun overall but there are some importants that could be made. there should be different types of music as it gets really boring after some time. It gets really heard to control the snake when it gets big. The game logo needs to updated as it looks pretty ugly and boring but overall the game is a pretty good time killer.	4	1114	2.2.1	2021-06-30 16:04:11+00	\N	\N	gp:AOqpTOFQqRCPrZ_d4MltVhMQAT20S9oMRvy2ztx64-KuNpd9GDWC75znc9ducfe_XqMoDGGeJjAtqFTxRNf5qg	4
133	LFS	https://play-lh.googleusercontent.com/a-/AOh14GhWz4r1kEjR6bolAiJacu8RayT77gcA61BdAeq4pvw	To many ads, plus the developer will try and delete your negative reviews. Ads ads ads. Not worth the bandwidth.	1	38	2.2.3-a	2021-08-02 13:13:44+00	Hello LFS! Our game is distributed free of charge, and advertising in it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and high assessment of our work.	2021-08-02 06:53:55+00	gp:AOqpTOF5v5bk1FWTMln3ZXgAh5ADz7aImo3OOXYgjn4TDDsfVq8EB8msTtwvFhbOSdAqYItTp74qaXCTps0ngw	4
135	SR de Youngstar	https://play-lh.googleusercontent.com/a-/AOh14GhMbCeBAcxDnvy_jZ5ajK00dtLGoSYoqB2jKZI0bw	It is a very good game i have ever played. If i have free time i only play this game and I'm gone mad in this game. Sometimes i cannot stop playing this game, all the day i keep playing this game. And my wife is angry with me for playing day and night and for stopping going to office. Lastly, would like to thank this app maker for making such nice and playful game. Thank you very much.. If you like my feedback please answer me. Please!!!	5	8623	2.2.1	2021-06-15 17:15:20+00	\N	\N	gp:AOqpTOGAyuhuv8TN1B8p-bMXMZLvgTMf98CYWe92WwJ2vDloi-d7BG6fg34GEbFRgyjNezoiB_jtm_3M32gUcA	4
137	Awais Bhutta	https://play-lh.googleusercontent.com/a-/AOh14GiXTYYmyLIlBgJboIX4Rbuw6lP42CMpHtZAWYvirA	There should be a pause ⏸ button 🔳 which is necessary. When we have a task to perform while playing, there should be a pause ⏸ button 🔳 because if we're playing this game and suddenly we have a task to do and our worm is growing bigger, then we stop it for a while or lock the cell phone 📱 screen and when we come back to play, It's ended....., it's so disappointing. I'm angry 😡 and want a solution... Please provide a pause ⏸ button 🔳.... Its addictive & I loved it.	2	4701	2.2.1	2021-06-18 07:32:14+00	Thank you for your idea! 😍 We will definitely analyze your offer and possibly add to the game in the future. Thank you for helping make the game better! 😊	2021-06-18 07:59:52+00	gp:AOqpTOFuOxVUjnKkOTf8IMerW-Q7CGdbSmUiE8dvhVt-JygmpOZCJK5AGgMjuQBFrZf7ODq7-vzYHC_ZDJKVOg	4
139	Laney Douglass	https://play-lh.googleusercontent.com/a-/AOh14GirQFUyzxb4sUuq0GBesw9C0bOE231URzBzkSND	I like it. I hate that you have to pay for everything. I love the potions. I don't like how you don't restart as the same weight. I like how you can have different faces.	3	16	2.2.3-a	2021-07-29 23:07:48+00	Hello Laney Douglass! Thank you for your feedback! We are constantly improving our game and try to take the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game on five stars.	2021-07-30 06:21:22+00	gp:AOqpTOEzUG1kJa3Uj_KSrY9p7uBrL2rz0Vh7j2gdYkm-SUtKEJXPXWQsO1DyvpVEtTqa0mYqFslffpIKHVNwKg	4
141	Draupadi Mishra	https://play-lh.googleusercontent.com/a/AATXAJxTwjPo1yMrfDwJZkdQkEp3eZy33Es-LgXtjdce=mo	Wow! Just wow I am almost addicted to it oh! and I scored obove 1 crore !!! I think it is the best game ever made. I would also like to recommend games like wcc2 wcc3 sniper 3d.I know there are ads but I know it What it takes to build such a game and I know it because I have also developed some games. Like pong See although I have told I can't explain it in words it is unbelievable! Out of the world! And the person who has developed this game is a genius. This games is the king of games.	5	4296	2.2.1	2021-06-09 10:39:51+00	\N	\N	gp:AOqpTOFCXmY3t7UOCp5d-Xhrg_Q1rs1106_z8KyUFf8MXbzHY0soXGny4ItqktvsjByaKi1Rl0WuY-h9Xw-aOQ	4
143	Hammer Head	https://play-lh.googleusercontent.com/a-/AOh14GjhLQTXKsjg1kLlQXmKZcClQ4IzL7i_r-cdxp3A	Really fun game 👍 I love killing the worms!!! Yeah 😁 more food for me lol. But yeah definitely a really good game. The only thing is that sometimes inappropriate ads come up which I don't like but I mean that's part of life.	5	20	2.2.3	2021-08-05 04:00:19+00	\N	\N	gp:AOqpTOHVI-nGsyLq09Og5HP0C2TpmSztzrOh0xhr1Z3H8t6DoulxvWAqZscuQVFnQq7u61204gwo4BdHWCaIeA	4
145	Md. Khairul Islam Amid	https://play-lh.googleusercontent.com/a-/AOh14GhF4-A2yTXcQS9cx9UjPHUedQpya0Pls-qGYM9k	Very addictive and time passing game. Everyone should try once. I have been playing this game for more than a year	5	75	2.2.3-a	2021-07-24 09:56:53+00	\N	\N	gp:AOqpTOFcGEBH-Pjfoiqy-3YA9ySLFYA1LdpxMuQv8jY1QmlN1xseyBi57N5vm7TPPc-mFscliTSKnpyxvDLhDA	4
147	Zubair Azami Badhon	https://play-lh.googleusercontent.com/a-/AOh14GhPiDlR_qpuhiXWixw8Q_3rgBvNfwQbtfNRtNonRw	1. Uninstalling and reinstalling the game, even while logged in, causes all progress loss in profile. 2. Should introduce multiplayer mode	4	91	2.2.3-a	2021-08-01 06:34:35+00	\N	\N	gp:AOqpTOFqCoJpwHv7_5209gC3JSxCyRLWoBGnmmt41NqeBO5fYdbl9-VIROl0hEdnk5JlGQ62QWHR4pMTbR_JhQ	4
149	A	https://play-lh.googleusercontent.com/a-/AOh14GgeT65MlvGXkeq-vnxVKJxXNoBFd0wB4ArHFRhkYHw	This game has the potential to be awesome. Unfortunately, the bigger you get the worst off you are. You end up moving so slow you can't get around the smaller worms and it takes the fun out of it. I recommend Snake IO, if you want something like this.	3	380	2.2.3	2021-07-22 03:03:39+00	We are constantly improving our game and try to take the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game for five stars.	2021-07-22 06:33:26+00	gp:AOqpTOFKH_fXxrxvCohy-S7nFF3rTaFSVfAThc1miwRt70PfCtkhLUqwvT4dApyE-ULSswAA4wrMTQ-kubk7dg	4
151	Mehak Khandelwal	https://play-lh.googleusercontent.com/a-/AOh14Gg9nxgnQGNpQG6viX9yG1XviNccs6QcDfB0O-C-sQ	I love this game but there should be option to write the name and if you dont sign in to this game so it doesnt allow you to write the name	4	18	2.2.3-a	2021-08-02 14:03:59+00	\N	\N	gp:AOqpTOGXQuoX2ptU418mBkcP-bWqoaG031_glpyFCDGoAw0XO3ZQJic2SRJDok4KK0SQdtoCSF2vIdSYcBmUdA	4
153	Jovanne Vince Ariscon	https://play-lh.googleusercontent.com/a-/AOh14GgSlfYX-yvtGAbkvcOJ9nFF12Wb28YCi9a761du	The game is awesome. I just installed recently before writing this review. Just one problem. The ads. I pressed for double reward ad and its totally unescapable. I cosed the program and the reward didnt occured. I could give a higher rating than this. Please fix this.	3	450	2.2.1	2021-06-21 13:21:47+00	Hello Jovanne Vince Ariscon! ✋😊 Thank you for your feedback! 😘 We are very sorry that you have problem with double reward. 😔 Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it.🛠⚙️	2021-06-21 13:37:36+00	gp:AOqpTOF3_mmQSk0fw27rtGFSShgLstVrX1l_ohnExafMYBqk6lF6XjFFvFZE_B5VgX7lOMCBrM-Io8ZOh-FyYQ	4
155	narendra gautam	https://play-lh.googleusercontent.com/a/AATXAJwthxGY6QCeYIzxMMnTGhd3eqL-_1odBKj2yAb6vg=mo	It's controller is very bad the controller move everwhere on screen I can't move my mob also in this game , if the controller is placed at one place , so I can say that this game is very much good , so I hope you do batter change in this game ............. Thanks Regards ............. Aditya GAUTAM	4	1269	2.2.3	2021-07-11 08:57:23+00	\N	\N	gp:AOqpTOHvJTcOmfvnI4A6Y02va7-Ty6ILugLDs1Ys5KIDQS7Amnyv-RPYsfr0GGKnrKTJu7FeiNVXeW2ek5iGsA	4
138	Nargis Bakaeva	https://play-lh.googleusercontent.com/a-/AOh14Ggk4B3LCB1lURfdwBSRi9Kg3N7vMNglxGadx6UD	I really do like this app. Everything is understandable, the detail description of the product, especially)) the price is not so high, lots of bonuses; overall, it deserves 5)	5	14	12.2.2	2021-02-13 13:31:09+00	Здравствуйте! Спасибо за высокую оценку. Рады, что dы нашли для себя положительные стороны в нашем интернет-магазине. Ждём вновь в гостях у нас. Ваш Ozon	2021-02-13 14:32:51+00	gp:AOqpTOFXFXMJBBfb2OjBxb9L6pKyzuglK7BrVZzMrkSBBhNuUv9C-ABWMDKzic01bDwuq-TxXYWY0u1kKnULFA	3
140	Whispering Platypus	https://play-lh.googleusercontent.com/a-/AOh14GhOXHHNNkYh15lKRn5Ixn-syF8n83fbvtRSEtTV_Mg	Not a single bug.	5	0	13.12.1	2021-07-09 06:20:49+00	Добрый день! Спасибо за пять звёзд в отзыве. Рады, что приложение понравилось. Ждём в гости. Ваш Ozon	2021-07-09 07:52:35+00	gp:AOqpTOF3sjwRJT-br3tfiHTmTAIdOHV6PR11_A6JnvPcS3cyP5WU_a6XVQbr268REtR-F8yh-7T2jGs9gJZIbw	3
142	Denis Kuratovich	https://play-lh.googleusercontent.com/a-/AOh14Gh8ybTk7FTgpW4iBras2xArg7C7xRMWF4CRiPcS	Good application. Free delivery to Belarus.	5	1	12.6	2021-03-13 18:56:24+00	Здравствуйте, Денис. Благодарим вас за положительный отзыв и высокую оценку. Мы рады, что вы получили положительные эмоции от доставки и покупки. Ждём снова :) Ваш Ozon	2021-03-13 19:47:45+00	gp:AOqpTOEAf91HSrn1M58T755JwnzLxiSOKcgHlErT-AN4MSRf3F4xQHq-ESohRUPijmNpGyBpclmMhypvJdJX6A	3
144	Alex A. Kalashnikov	https://play-lh.googleusercontent.com/a/AATXAJwmnpjwD5MVrBr4VUF8WoG_KNESPeFUT0JI9HOR=mo	Better than yandex (better organized, better support), better than wildberries (their catalog is piece of sh...)	5	0	13.3	2021-04-29 06:01:04+00	Алекс, здравствуйте. Спасибо за пятёрку и отзыв 😊 Рады, что приложение понравилось. Ваш Ozon\n\nAlex, hello. Thank you for the top five and the review ы We are glad that you liked the application. Your Ozon	2021-04-29 06:17:31+00	gp:AOqpTOGPuoVc45fck2Tt2HwdR5EckT7uT-pRIIAE0GKMJJUy1kS0XLd1SJ1GX59Ova6ZGfNPsyeGZs5uHWhioQ	3
146	Never Home Companion	https://play-lh.googleusercontent.com/a/AATXAJy9kqGIazVrd-oXwtIFUm6XVHf6GnTtixa3OD4u=mo	The app and the service used to be frankly lovely - fast, convenient, wide selection and good prices. The corporation changed hands - is that what happened? The practical upshot is that now it has the free service of dispersing your personal details and data (order information, payment method, address, email) to random users via text. Basically, if you didn't get a text with your order details, someone else definitely did. The customers - victims? - notified tech support, who sent a bunch of emails that amounted to a very big shrug. "We'll look at this at some point, shush" Caveat emptor - buyer beware	1	16	9.0	2020-06-29 19:27:03+00	Здравствуйте!\nНе хотели так расстроить вас. Пришлите, пожалуйста, скопированный текст отзыва и номер заказа нам вКонтакте https://vk.com/ozon \nМы во всем разберёмся.\nВаш Ozon	2020-06-29 20:36:11+00	gp:AOqpTOFsB4UPYJp8PLUM2QuvpfeAyMRFVFYhpPFbCi_-hLl1Trj1HGt5VqA5j-2rhtp0ESKDkigv12lDPqjcnw	3
148	Pavel Kravchenko	https://play-lh.googleusercontent.com/a-/AOh14GjxVKUCrwMfuPNhHgY_B-KvRJqf7oD0uDvLcGv0Rw	Very handy and nice app.	5	0	13.4	2021-05-06 18:27:32+00	Hello, Pavel. It is nice to get such a pleasant review. We are glad that you are excited with us. Your Ozon	2021-05-06 19:24:07+00	gp:AOqpTOEhvN6JyK_DhrpTSkPzzDVivV-HOn5tgnmihtpcGrq6YJeO1Zb4P6TmTxykuRmWZDd0i7a_iKeNbWJrpg	3
150	Celeste Brits	https://play-lh.googleusercontent.com/a-/AOh14GjqoWWJ2GFgc-62Koujs2deZpyweZGoazaXm1sL	I wish there were an English version of this app. Recently I updated the app and some features changed. It was so easy for more anymore to know when my packages arrived and where the box codes were. I typed the words in to translator but according to this it meant it is still on its way. In the meantime it was already there. Long story short, I lost those packages. I like Ozon and wish they would accommodate expats as well.	4	24	11.0.1	2020-11-10 21:50:09+00	Здравствуйте! Сожалеем, что не смогли получить вашу посылку. Пришлите, пожалуйста, скопированный текст отзыва и номер заказа нам в чате или вКонтакте https://vk.com/ozon. Мы во всем разберёмся. Ваше предложение по поводу английской версии мы взяли в работу. Спасибо за отзыв и положительную оценку. Ваш Ozon	2020-11-10 22:50:53+00	gp:AOqpTOHqCKIQmu77pqB8gsNGLtxTfoO4v3zaB1bV0mq7AvK9PcwDyrEEpViCBoyfmuUFTZgfBMqPwT7GV81b6A	3
152	__	https://play-lh.googleusercontent.com/a/AATXAJyUbVw7VoT5gx_JUP4lEBylQyAst-tpgqZlB1Wt=mo	Allow users to completly disable popups that force you to rate/skip bought items. I don't have VK. Don't force me to describe it in details there. Just add this option as a checkbox in the settings. That's it. In response to your message: you're wrong, it's not about push notifications; I mentioned popups on bottom of the app UI.	2	7	\N	2019-09-22 21:35:18+00	Good afternoon! Sorry, we don’t quite understand what we are talking about. Could you send screenshots to help@ozon.ru or Facebook https://www.facebook.com/sofia.ivanova.902?ref=bookmarks ? Will wait. Your Ozon	2019-09-23 00:24:51+00	gp:AOqpTOE1ca8li0p0784yiyBY1TT5CVgyvgfGnYqkLIrz_nLuuyVVo51TvVfO4Byp3DkBYHLIn6I9oNsvw9ml9w	3
154	EpicurusHongKong Best Food of Hong Kong & Macau	https://play-lh.googleusercontent.com/a-/AOh14GgWEevOwUaHdkrUKNR2w1BlOBw5krz850-6033Wexc	A very good Selection of Goods, well priced! They should definitely make 'English' as a Usable Language. Their Mentality that not many English users use the service is like arguing whether the Chicken or the Egg came 1st. If you dont even provide English, obviously none of them will use it except if you're Russian or can read proficiently. Now that it's Listed on US Stock Exchange, it definitely should be readable in English too. So Shareholders can try out the service purchasing.	4	25	11.4.1	2020-11-30 22:32:33+00	Добрый день! Большое спасибо за отзыв и за выбор нашего магазина. Ждём за новыми покупками. Ваш Ozon	2020-11-30 23:37:28+00	gp:AOqpTOGOi5id2vxVcD3JfhkWh5vAz3wTsNK9uexFJowJU22QWZHhjxmeADFpIKcXpGRrQXuIFHsU6ds8MFwIPg	3
156	Aleksandar Trifunović	https://play-lh.googleusercontent.com/a-/AOh14GgODhZwFw9PhcRPc9jrFRrg8r1a898YfyQh2mY5Yg	It's very nice and easy app for using. And its very easy for the foreigner like me to buy something in Russia. By choosing the option of postomat and paying online I can just pick it up whenever I want with no knowledge of the language. Even though I know it enough. But still... :) Kudos!	5	18	5.1	2019-05-16 07:38:51+00	Good morning! We will be happy to continue to see you among our customers,\nWe are waiting for you for new purchases! Your OZON	2019-05-16 07:45:31+00	gp:AOqpTOF2G3HfFTOMmy65UVcMYnxE87tVVm-Cv0LCmCt98qADYexzwRBougiJtyjPyygYGIaMoitmNBcqWbBw5w	3
297	Gayatri Devi	https://play-lh.googleusercontent.com/a-/AOh14GiEFyR_GL2ABJYf6P39wvpO5xEsxemSpY1ROZip	nice	5	0	1.1.8	2021-08-10 16:02:02+00	\N	\N	gp:AOqpTOGbyeHli6B9Gew5CXb3rXBKz5QsicjdtT6GJ8vDVsXbHWFP8F00MRmisDkLWQuB6NgpVtbGdNKZ0qpy	5
157	Siddharth Nath	https://play-lh.googleusercontent.com/a-/AOh14GgwyzHEWIFf5I_tmCQIF9eegIdp9ifkgEel17TN1Q	ths game could be awesome if it can get rid of one problem. sometime when i use speed boost by touching on left side of screen my worm looses control and starts to go straight even if i try to turn it and the it keeps going in boosted speed even after releasing the touch, it is the only reason i have died everytime and it's soo much annoying because i can't use that speed boost power anymore because of this reason.	4	1850	2.2.1	2021-06-11 15:11:35+00	Hello! When your worm dies - you can revive him. But in this case you will lose only a part of the weight, but you get a chance to play and complete the tasks. We hope this information will help you win and evaluate our game five stars.	2021-06-11 14:53:22+00	gp:AOqpTOHOHLvO3EWrRXH3jVt_gWIwnqR0jj3Fb4Z3mw4Xbb_IesCfIk7GXualPBCkmTKJfqRjg59Mbuz2RRk8_w	4
159	THE GAINESFLAME Nathan Gaines	https://play-lh.googleusercontent.com/a-/AOh14GjUcVc9GXOEZ3Z7FXXVYAZNBGlm55cpj94cBfCqeA	One of my favorites. Build your skills and you'll find yourself able to squeeze between the tightest spaces and WORM your way out of most difficult situations. Extremely tough after you've grow to be a and ten million pound whopper worm! Wow!!!! Great game you guys.	5	554	2.2.3	2021-07-13 16:38:20+00	\N	\N	gp:AOqpTOGCTM_pYgHII9j5OuBoIZ_Ua8YVuCYggeg0gIQ_MrLWnweCbTVubDlin-5k6R7VqYTowSIYJq6yjPZN4g	4
161	Sameer Bam	https://play-lh.googleusercontent.com/a/AATXAJx-_QkmalrL_OJz8ouF_TYFqNOoQAsLlXDV49B1=mo	I could've given it 5 stars but the facebook friends feature is not in this game you can connect to Facebook but sadly that's all I'd give this game 5 stars if you could connect and play with friends	4	49	2.2.3-a	2021-08-01 14:00:40+00	\N	\N	gp:AOqpTOG6JUOf2xL1Nq75aCAjuMwdjytsETnYNS4cv-PN1xrZnIazL5eGzFfI7G3fYJM0brYxnEXkCqHU0TQLqw	4
163	Maha Maha	https://play-lh.googleusercontent.com/a-/AOh14Gj3Dnes0EcEVS2LDURvqT2NuY2YOoQKNSSRekIx	Very nice game 😊 but when I'm going inside the game that was asking to download app market but I already downloaded again and again It was coming. Compulsory you want to download this game 😘😘😘😘😍.	5	22	2.2.3-a	2021-08-03 06:54:27+00	\N	\N	gp:AOqpTOFKDHpWLt7y0mmBTC4xp6szrTZSyfOFIBK76XE0gsWz5huL2VS1Rsoh0Y8oqhYZ0qympzk5goQCsn0lPw	4
165	Kakarla Krishna	https://play-lh.googleusercontent.com/a/AATXAJyfpw31y9Vsj41hXo8hfCqDgtymvCWDEXFG0wbt=mo	The game is really ossome but there are s0me rhings to be improved....when we die in a game there is a option to watch an add such that our game continous but what the result is our game restarts..lol..and one more thing is there should be a option which helps us to play with our friends which gives more joy to players....Hoping u will do this as soon as possible.😊	3	4521	2.1.2	2021-05-25 02:43:44+00	Hello Kakarla Krishna! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-25 06:33:52+00	gp:AOqpTOFHIZtPUqxyoDAi33dsmoR_JqhybPkdoxT2-_yJ1-LyQR4ZR9gWEqlxy7ozKKZ7sjF1lx5cf3IxZ11Ttw	4
167	Jasmeen Gulati	https://play-lh.googleusercontent.com/a/AATXAJxvaEdEY0UEvNg___rG6S7eu2hr-xgb2JQUDsXW=mo	This game is fun one day I was 1st on the leaderboard and I won I killed every tiny worm and then I won . The trick is all you have to do is - eat your food kill your enemies and slowly you will become 1 st and once you become 1 st start killing other worms like - if a worm is moving around go to that worm and start moving around and kill it . Kill all the worms you win I also won so, try this plan and I know you will win and good luck !! Whatever this game is fun my plan will work 😊❤🤭	5	576	2.2.1	2021-06-18 08:26:49+00	\N	\N	gp:AOqpTOFpmPvNVRFD8i3-DVT5zEAwZauSVojrMcCom2IXkDJ7xK_og-25MvX5cp-JKGRNW6Afy7-AXGaStxMQtA	4
169	·Vibes·	https://play-lh.googleusercontent.com/a-/AOh14GhFgEZUshd9S5Mx90k3mlmP1emHa85PLsTU9WtDbQ	BEST. GAME. EVER. I never get bored and there's always something new. It may be a simple game but once you start playing it, you get addicted and that's what happened to me. I don't really have any complaints, just so you know. All I have to say is that this game is super fun and I recommend you to try it out if you're bored :)	5	719	2.2.1	2021-06-22 08:39:11+00	\N	\N	gp:AOqpTOGf7X7iZVI2OPbmLAOe8RIyvDExeySRfRfEeDrEOOasMEUghMocXJqMGiF22aLU1qASIVrkKx755YvTbg	4
171	Rameez Khan	https://play-lh.googleusercontent.com/a-/AOh14Ggr77ZpWY44mhjFxeTfpxPEGgD5suoT2N6JiYmCbA	The game is very good . The question is : I am back to rank 'Zero ' after re-installing the game today . The handset is same , the number is same, the FB ID is same , the account is same . I uninstalled the game a couple of days back . But today, after installation and login I cannot retrieve my achievements. I have tried everything in my knowledge to retrieve all but to no avail . Kindly help. TIA	4	528	2.1.2	2021-05-30 10:48:45+00	\N	\N	gp:AOqpTOEMtjErUiN2eSJMfmI4ME76HlesHlzQcCwLEwwJh66Ww6ZR3O6xkncA0F8DfHKcomUFi2zVMhrLgzL9wg	4
173	kianna 's	https://play-lh.googleusercontent.com/a-/AOh14Gj9ViZmF4JVswZRRs-P2NQT3mju5B2dJw-KzFFFcQ	I like this game, but i reached my highest score of 2,600,000 size and i rated it 3 stars but crawl 650 meters is so hard but i task failed because it ends in 8:00 minuites. I hate that challenge. i want to rate this 5 stars if you removed that challenge. im still #1 in the leaderboards with my mass of 2,600,000. and i died from a small snake or big snake.	3	504	2.1.2	2021-05-30 14:13:15+00	Hello kianna 's! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-31 06:59:02+00	gp:AOqpTOG7frIs8hHPsMTPl28XNGG-2eaI5akBjbh5Om-AtQGqdumJw_IKZC06dkntIZdBTei6IfA6DvhkbkyTFw	4
175	Hellen Suring	https://play-lh.googleusercontent.com/a-/AOh14GgXrCGBhqEd3bnkbSQFoyCQoWoSQmzvHneflE7GCQ	seriously I got addicted to this game 😍😍😍😍and for those who doesn't want your progress task being lost after your worm is dead, and also doesn't want to watch ad, you can play it offline and if your worm is dead, you can repeat the game instantly and your task wouldn't lose 😉😘just make sure that you have logged in to your Google Play Games account 😊I hope this review could help you all ❤️	5	918	2.1.2	2021-05-25 20:00:56+00	\N	\N	gp:AOqpTOGPEo3b_EkK45_L2pmRa-OhOO1C2UlWFMD8uGoJ_GHqDsDx3due6u8SYbdNJFM35Fzp15td2wQ5rs2rJw	4
177	乙uẞer々RatuŁ	https://play-lh.googleusercontent.com/a-/AOh14GiLKESb6aILhrJcP28RvovOSlPinS1updlkAxxooA	Good game for reducing stress, anxiety, depression. It also helps to stay unbored.	5	27	2.2.3-a	2021-08-03 21:39:41+00	\N	\N	gp:AOqpTOHQ-xyri1CrmVyHvDDxRFPMQ9lUe4DA2z9-OQ36K9XTuE4f89T94OfWhuNzj-mBKB2Nd93XyV2tyReLZg	4
179	tanvi more SS18EC015	https://play-lh.googleusercontent.com/a-/AOh14Gg3xyiL-hqVDabTn9PDTPOtYPv3cUzta9n1Mlw09Q	Best worm game ever. I'm addicted to it. Thank you developer. Can you please fix one thing in it, that is can you please add a multiplayer option to play with friends like many games.	5	856	2.2.3	2021-07-14 16:15:11+00	\N	\N	gp:AOqpTOHRzkvTwY9Xl62Nt17SMvOhvs5uwwmpHXYBg35P3-PrZBV2O7bQYHcMIgPBdglDIaev3Bg2yvSKO-w5ow	4
298	Nida Asif	https://play-lh.googleusercontent.com/a/AATXAJx3CyWSbk8C8NbhKE8VHErixe-qtp0CqrwKBGlb=mo	good	5	0	1.1.8	2021-06-13 16:41:40+00	Thank you for your support and feedback! Please feel free to email cs@yateland.com if you would like to share more ideas with us.	2021-06-16 06:02:22+00	gp:AOqpTOEnpZF4r4gGWJRT0FvqoY6ZeFN348UbpjdldDqatqm7OlR6qImkTfSso6BwbclD1EcGjazHoOJi57sy	5
158	Ivan	https://play-lh.googleusercontent.com/a/AATXAJycbdBWQPMoD4uF5oq71jR2jEL2sYj-SlA-7jhx=mo	It is next to impossible to specify a delivery address outside Russia. Yandex map is empty and the app won't let you enter the address manually. A coronavirus banner blocks UI elements. Re: sure, registering in a social network I've already left to enter my mailing address is the way to go.	1	15	8.2	2020-04-15 13:00:39+00	Иван, здравствуйте. Нам жаль, что возникли сложности с оформлением заказа( Просим написать нам в соцсетях, например, в ВК https://vk.com/ozon, постараемся помочь. Ваш Ozon	2020-04-15 13:31:07+00	gp:AOqpTOGsDwWxe05Oa0DKCr-iaNj37qofd9hOg2x36NRHp3ENPKSJr6CmxSFrEaSanfLYitOvdpH710g3t6Z7yQ	3
160	Prabhat Kumar Singh	https://play-lh.googleusercontent.com/a-/AOh14GiUJUhbMQhkD5hDQofpcoYHpiIrHbvmrLoyUMf1tQ	Easy to operate!	5	0	13.13	2021-07-10 20:39:51+00	Здравствуйте! Мы очень рады, что приложение пришлось по душе. Спасибо за звёзды. Ваш Ozon	2021-07-10 21:36:03+00	gp:AOqpTOE6VSom9cPgfTbjSt9_ez1OBVJK8rTeDrjSr7iolvUUIvymfnTZyrYB6m-uuuVUdoahvb1PbVMVEFAmKA	3
162	Ibrahim Hassaan	https://play-lh.googleusercontent.com/a-/AOh14GiDcy09jUWCZsFwAwnaa_aYmiIA8bv76okj1gx_	Excellent and top discounts	5	0	13.0.1	2021-04-20 10:32:16+00	Здравствуйте, Ибрагим! Спасибо за пять звёзд и отзыв. Будем и дальше вас радовать :) Ваш Ozon	2021-04-20 10:42:27+00	gp:AOqpTOEzqJWpryf7AubDkEOFtESxRY2jgIOXDUKXdXdwgYFR_0kssqnyZ1DJpheM1-PJNJ3TiYIgub8tU2faCw	3
164	kasim siddique	https://play-lh.googleusercontent.com/a/AATXAJxYAqaP13V1M_i3W9Px0Wa6kTxgW_tgb8Tl2vj1=mo	I love the app, but not able to find the option to change the language, please if you can advise how to change the language.	5	0	\N	2021-03-18 10:22:54+00	Здравствуйте! Спасибо за отличную оценку и отзыв. К сожалению, нет возможности изменить язык в приложении. Ваш Ozon	2021-03-18 10:35:14+00	gp:AOqpTOEGBCCdu5C95T5R0zyusMpFLpSPD3SGt4nKKcTVdp68-9VZyD2uTE4sZRhjBSyE9KOQA9QunJ4r7kslsw	3
166	Edgar Hovhannisyan	https://play-lh.googleusercontent.com/a/AATXAJzgXBRQ55nznE5FMimynMxyyn4ppjR1nsHMVyYE=mo	It is very hard to select delivery address on map. Only after you zoom in you are offered an option to fill in by hand, which should be available right in the beginning. Other than that very good app.	4	11	9.4	2020-07-13 20:36:52+00	Здравствуйте, Эдгар. Для курьерской доставки достаточно написать адрес вручную. Если необходимо выбрать пункт выдачи или постамат, то на карте нужно указать точку. Вы также можете сначала выбрать фильтры (пункт выдачи, постаматы и тд), а после ввести адрес. Если по нему действительно находится пункт выдачи, он будет для выбора предложен. \nВаш Ozon	2020-07-13 21:54:42+00	gp:AOqpTOEaARf93-jkv7EZE5ebdnQlnonYsM9BTrIK7weYGBgKJrffj8LMXq3vDzqGG6Uc6EL-YjzUlRwxA28Zzg	3
168	Gaurav Jalchhatri	https://play-lh.googleusercontent.com/a-/AOh14GhnHEd-uH9FyDtX0d_MIjMHgoh8DlxaMx6k8XxSog	This app is working well and is very useful but only thing i am facing problem is with the language. Only Russian language is available in this. If English language will also be available then it will be very useful for many users.	3	25	8.6	2020-05-19 13:21:02+00	Good afternoon. Thank you for your feedback and appreciation. We will certainly take into account your wishes and try to make the application in English. \nYour ozone	2020-05-19 13:42:46+00	gp:AOqpTOHg5RXtycCJXUmWTpYKni7Vop_FCFUN_r108XGv6iAH4cXa3kTCHdgTFryZwoDbG48gTIs12GVw7X27Gg	3
170	Сергей Убогов	https://play-lh.googleusercontent.com/a-/AOh14GiKDQe9GIhXQulX_afjmfwSWAWeRCDn7nj9UnemgQ	Nice, very fast	5	0	13.15.1	2021-07-25 20:10:03+00	Сергей, доброй ночи. Спасибо за высокую оценку. Ваш Ozon	2021-07-25 21:37:47+00	gp:AOqpTOF2pOjkjkE4kqBlGQtOx_jrDRmEk-qqT9jhF7KHb7QgeHpL-to0hOFazv-ndXl-I6P4je0ecYlODvuUdQ	3
172	Denis tr3x	https://play-lh.googleusercontent.com/a-/AOh14GhnILSv3ffSH8_cB1NyeuvpKh4CpH4qqxXkhHppgw	the app itself is okay, but shop service is terrible, it's normal practice for them to delay the delivery for 2-3 days without any notification, support is helpless and sometimes even disrespectful.	2	26	3.0	2019-01-12 02:30:18+00	Good morning! We want to understand this issue. Please send your order number to VK - https://vk.com/ozon_help or email - help@ozon.ru. Sincerely, OZON.ru	2019-01-12 03:10:25+00	gp:AOqpTOEMKhkFXF7hVt6z9BV-PqhSK72WqrHNYbjxip6qHSB1v3GQR5-iwyKKZmiCNsS3VyjK9rWKBh2c-J99kQ	3
174	Smit 007	https://play-lh.googleusercontent.com/a-/AOh14GhrGfyCrNmd2Ve7GrEsz8gizR5fNcogdnrciJcx	Very good useful app, easy to find, easy to pay, easy to select delivery point. They delivers even in villages, far away from Moscow, no need to go in the nearest towns or city! Thank you!	5	5	12.2.1	2021-02-07 17:25:06+00	Добрый вечер. Благодарим за звёзды. Ждём вас за новыми покупками. Ваш Ozon	2021-02-07 20:08:47+00	gp:AOqpTOGli9RwpjWYCwOgP5NKRM1NTKoCb-IYP_b7xdyzp_BjNach1-sSx0z_jFnAjoBCvuAj6KbX1XwAzWIAvQ	3
176	Ericka Mae Pajarillo	https://play-lh.googleusercontent.com/a-/AOh14GgOnRy6uJdKX37C6uRlVzeeJp8WacRK8gbMez_S	This app is great we already bought a lot of stuffs here, but the problem is to understand the descriptions we need to translate it in google. We are hoping for english language	4	15	9.8	2020-08-11 05:08:52+00	Здравствуйте! Спасибо за положительный отзыв. Учтём его в дальнейшей работе)\nВаш Ozon	2020-08-10 19:44:18+00	gp:AOqpTOFple0RZOkPYsPEtFqUSKEtttiSs29UJEeTw3XKrH8YxFq32uNHVnhCu3C9MEuI-YIVBTIn9GxWvgoE_g	3
178	Inna Mihhaljova	https://play-lh.googleusercontent.com/a/AATXAJyelKMaodokmwgKnucD00NUNeOBJbjvWoaSW6vz=mo	Cant edit my delivery address, cant find it on thd map, that is impossible to use! Cant add my irish phone number- i am getting the error message. Absolutely impossible to use and order anything! Its really annoying.	1	8	10.7	2020-10-16 10:36:20+00	Инна, здравствуйте. Сожалеем, что возникли трудности с оформлением заказа. Перешлите, пожалуйста, текст вашего отзыва, номер телефона и адрес нам в чат или в ВК  https://vk.com/ozon. Поможем, разберёмся. Ваш Ozon	2020-10-16 11:57:17+00	gp:AOqpTOEbSTn28lGjzTRSLsGuONUGxRoeBuozkARCEEYqTZxrr_O4DlIIyu6kfK1ILv86d8QZTZW4_01FQR47UA	3
180	xxxкапитанxxx	https://play-lh.googleusercontent.com/a-/AOh14GjVyKVWuak7jjspSbGOAHcYIcb0sXJwNEgxRBP2	If this app is available in English language. ? Or how to change the language of this app?	3	0	12.6	2021-03-14 00:00:45+00	Здравствуйте! В приложении только русский язык. Учтём ваше пожелание на будущее. Ваш Ozon	2021-03-14 01:00:21+00	gp:AOqpTOGm_GpqgdhqDGpgykugKDomnHZwOJe7pZMPGh8O-FHFe2lYJiagXM8Ngzy4DtBH7U6NKxf4udlK59uW6Q	3
299	shay aaron	https://play-lh.googleusercontent.com/a/AATXAJxcio2R6sSJEyGFRLK3uuAxqsuF1VkcOhUXEbO7=mo	GG	5	0	1.1.7	2021-02-14 11:56:04+00	Thank you for choosing Yateland! Please feel free to email cs@yateland.com if you have any other feedback!	2021-02-26 06:51:11+00	gp:AOqpTOFlg0KRo0UFmKw7anAkrIqPaTTaJJlhBrC--UTAzW9IRXEEL92O5-hE9k5ojC73AUuOZY9oSMf_oVLn	5
181	Fly Fifer	https://play-lh.googleusercontent.com/a/AATXAJwubtsGxED7mu315BW7W-rIn9d0apniBEqDiIZx=mo	Love the game over all. Just two things I wish to see. A Scottish worm, maybe on the theme of the loch ness monster. The task to count down to completion, instead of just showing how many you to do. At times the bar looks full, bit still does not show as complete.	5	698	2.2.1	2021-06-15 00:36:29+00	\N	\N	gp:AOqpTOGb0soZobmXVdrzN_BRwbKEVCZaYuj01rCcZ3E7VQAdkqG-DR0EhY_5xq8sFQwpYhu2w6d2lfE8UmUzTQ	4
183	Rad Bak	https://play-lh.googleusercontent.com/a/AATXAJwCR3_hwfnsOxl0zCSM_GCM0rG_h_cZjkzFgDNc=mo	I enjoy this game very much i tend to zone out on it my only complaint is there is no pause function which means I loose progress or have to shut down a game when commuting to and from work and and swopping from tube to train it would be nice to be able to pause and then resume game as it gets very long and tedious to have to keep shutting down and reloading apart from that great game	5	232	2.1.2	2021-05-26 21:33:23+00	\N	\N	gp:AOqpTOFJY_yTh33guU44pHsdaAbaVL79Lw6vr7NqONzP8Ibwpnq_lFDiSn1Ugq8Eu2VZjnTo3Lm9B4WkVyyiqA	4
185	Mariki Pretorius vd Westhuizen	https://play-lh.googleusercontent.com/a-/AOh14GjbQ8cnRboDPZ5UdhjJNRWuwmwo0ovWuH1tQFq8rA	Really enjoying this game!! Would be beneficial to have a rules explanation, but great game nonetheless.	5	47	2.2.3-a	2021-07-24 20:13:17+00	\N	\N	gp:AOqpTOGg82lKCiSDlKr3dPyIigo0kF_NyoyoB99mf5aRdytSiVG85vtB8Xk2ZeSAggMY8AJn9pRuHU0PlGzPbg	4
187	Saurabh Kumar	https://play-lh.googleusercontent.com/a-/AOh14Ghf1PZA8nybRUSm9fxGCwz4hzTKxcohpH4KOOJszA	Great game. Love to play it. Actually it's type of the game where there is no age limitation. Any age people can enjoy it. I downloaded this game for myself but now everyone including my parents enjoy this game as it's easy to play and spend time.	5	1030	2.2.3	2021-07-11 06:49:31+00	\N	\N	gp:AOqpTOGZhnZ7VtqpJK7lT4Bdq1I20CTdDd9fdYsu9VTubufTknsN6yPuV8ho16g5cprkKO3Ej908du_W04DaLA	4
189	VxrayV TheRhino	https://play-lh.googleusercontent.com/a-/AOh14Gi9fEDp-IZojpbTeAiiJ0O4tmzuyMJ2Yk7_qjrb	Very addictive game...but just there no pause feature and it can take up to 10 to 15min to get a nice big snake and not everyone can be busy one there device that long whiteout being disturbed...please add pause button. Thanks to the developers for fun game.	4	58	2.2.1	2021-06-30 21:14:53+00	\N	\N	gp:AOqpTOG0J2X44s1LFfeTcTn_j9hXccGcnjWfWcmTscPWVZXNjpCbb682c4ZZyef64K6k8g5G3qpIlApJCA8inA	4
191	Noria Bayin	https://play-lh.googleusercontent.com/a/AATXAJxEJOb3reGlvpitm2Pj969JtIyNs3HBQ6PwNfzS=mo	I don't like this game anymore. After I updated it my worm move very slow, I can't control my worm to move faster like before😑	2	22	2.2.3-a	2021-07-28 23:51:52+00	Hello Noria Bayin! Thank you for your feedback! You can change the control to your preference in the game settings. We hope that this feature will allow you to evaluate our game on five stars.	2021-07-29 06:32:35+00	gp:AOqpTOH-UWvnXuw2HrONSz-xVltFE11NTSI2ST8a1D9JeqtuRLH4kzHs62Gmd91GcZANHdW2aGjmsREj74dciQ	4
193	Me Meme	https://play-lh.googleusercontent.com/a/AATXAJx4nePY0x_FvLdw9GyYHEGI_6wtgePiSin-C8gv=mo	Most of the time you lose your progress after watching the add also it always says that " add was interrupted " after you already watched it!!!!!!!!!. Many times it gives a message that your time is ended despite it is not and makes you start over !!!!!	1	520	2.1.2	2021-05-26 18:53:24+00	Hello Me Meme! When your worm dies - you can revive him. But in this case you will lose only a fraction of the weight, but gains a chance to play and perform the job. We hope this information will help you win and evaluate our game five stars.	2021-05-27 06:17:38+00	gp:AOqpTOFqNQ7d_CVJ7s1fTBHqI5XfIJQV_n0FUyOsHIzGxwsYQn6Rt0Em4JSFoEVkI2DPLOoJzr8h5bnHdwwnaw	4
195	Eryn	https://play-lh.googleusercontent.com/a-/AOh14Gi5XSVvB5qNo1eAhcFS9fB7TfM_usrddaR8jpAH	U know...I'd like to report this worm skin that is black..Guess what,when the background universe is dark and black and little bit of rocks whatsoever then some player took advantage of that and buy that skin that is required level 21 to unlock...AND THAT SKIN BROUGHT ME HELL!!! I barely see that worm!! WHEN I PROGRESS MY WORM SO MUCH BUT THEN I DIED SUDDENLY AND LOST MY PROGRESS!..I spend few coins to bring me back and see what happen and found out that black skin worm that I hitted..	5	783	2.1.2	2021-05-28 10:34:58+00	\N	\N	gp:AOqpTOGZ484yYG7tYIATHknE9bTVdasomMnVkS26TvOPKkWY0B6FpJra0ZX6Y2VN62x_2tWs1qIwf84yyJo7LA	4
197	Rose Mckittrick	https://play-lh.googleusercontent.com/a/AATXAJwmJywrNDXzON0f4HpMXMLfv3JL0xjIUAM-C3K2=mo	I've played several worm games and this is by far the best, I'm addicted, I'm back and I stick to what I said before, best worm game, I play 'til my hand hurts, lol, 10-23-20 😂😂 still at it, still love it, fingers still hurt, lmbo......June 13, 2021, still playing, still loving it, wish for more challenges more often, awesome game ✌🤩 👋👩‍🦳 whoo hoo	5	2815	2.2.3	2021-07-10 03:55:11+00	Ah Rose, we are so grateful to hear that - thank you very much! Be sure to join our official Worms Zone community for news and fun: https://www.facebook.com/wormszone/	2020-10-01 14:07:42+00	gp:AOqpTOGwVjnUO0S3l5dB4bt8Ny_CnEvDhO9-DUhmiFeHeUJv4ErHVJ16okDke_gOtAED241kNp6rKFJsa6onPg	4
199	Mahamad sulthan	https://play-lh.googleusercontent.com/a-/AOh14GhBauvz_i7-mLGiz-KwwLF_24NonOSy57twa5h3-A	Multiplayer is completely FAKE. (but I liked the AI). You can test this by turning off wifi/data while playing. For 5 star 1. Add real multiplayer 2. Nickname change	1	47	2.2.3	2021-07-23 06:47:39+00	Hi! Could you please tell us what we should add in the game for your 5 stars? ⭐️	2021-07-23 06:39:14+00	gp:AOqpTOGWJmNZ7lae_g9uBSfk3UicpLI366UxtyXKbWQwu1G-u-d8vohyRi7BX6cXM9U0agwQWtu4KtYt-qAY1A	4
201	bert coluso	https://play-lh.googleusercontent.com/a/AATXAJwomm2paAI0i2ailNh9REEANNEUsnKyHwFu_vSX=mo	One of the most enjoyable games. Hope you could make it playable through bluetooth!! That would make me and my family very happy	5	29	2.2.3-a	2021-07-25 02:15:37+00	\N	\N	gp:AOqpTOEoDVoBFdHdr0Pe-mCngPOXNjOPAT0chkBOFNhL0E-WnRSN5w0AbMY11jlJkfS1rlbvGStRBSDU6by-Yw	4
203	venkatesh gullipalli	https://play-lh.googleusercontent.com/a-/AOh14Gh9sy2YnfeggoYqMxIYFj4R3OWhTYFoCZpWcvc-Vw	Good game as for time pass. Need a pause button for game leisure time. As the game developer should have focused on worm freeze zone like that. As this can help one person to freeze the worm in particular area and later he can resume the worm from there by moving from that freezing zone...😜😜	5	6370	2.2.3	2021-07-03 16:48:54+00	\N	\N	gp:AOqpTOEXpHOdN5xGJB3Zz_Tv2PmqKWn-b8N3ByVvuzASbsq-9cV2x-wIAGqeSubdrlMqF_QXiGys7Gu1kdtZsg	4
205	vaishali deole	https://play-lh.googleusercontent.com/a/AATXAJxeVNptCCl1bt0U-supzFwRHCRRc6bUdwu3dJ69=mo	Good game for kids .Not a volante game and it is fun too for kids.And the worms are so cute	5	10	2.2.3-a	2021-08-02 17:25:05+00	\N	\N	gp:AOqpTOFPSeqkKAkVoGYdYjkVtaxOtczTDxxJi50aXiblDjYv3rgqipZKWtrPJU0RbMibu48jyHbnVMQc85jISA	4
207	Nathalie Lango	https://play-lh.googleusercontent.com/a-/AOh14GjjdVxuAj9yviblScaSV7O7FkQjBsX_wvV-93lQ	I like it and all the mad is big but the controls of this game was bad i think the developer needs to fix the controls of this game.	4	19	2.2.3-a	2021-07-20 23:30:42+00	\N	\N	gp:AOqpTOHo-f51GOpiFBDhfxV3GyyMXUxzifT47gEHDGT7TCrfshSXy_py0DWOHRNm0fqaORVN7aiXV4B23L6fRA	4
300	Nheat Tap	https://play-lh.googleusercontent.com/a-/AOh14GioMyEhJOdrf2WtgLtClEGTJUX2i7U1ONTzJZVO6g	ល្អ	5	0	1.1.7	2021-04-29 08:44:17+00	\N	\N	gp:AOqpTOHLfN3_DRqRrfsQI25ytbK_LbN2tg6-8OXT0t1S_-A7QLYvNAIZtDL9O71uUZ1IgDVpTO37JG8olZDt	5
182	Pavel Botvinkin	https://play-lh.googleusercontent.com/a-/AOh14GhjDPtN-ZWwh7s4ZTWNSiYx9eQk2AE04I5dettfhA	This app shows annoying notifications you cannot disable within the app settings. The service provided is rather good, but I peronally would prefer to use its web version instead.	2	9	\N	2019-10-20 11:26:25+00	Добрый день! Вы можете отключить оповещения. Нужно открыть вкладку "Кабинет", "Настройки города и уведомлений" и переключить слайдер в пункте  "Получать уведомления об акциях".\nВаш Ozon	2019-10-20 12:38:04+00	gp:AOqpTOHh8kCkgN1NGOD0Daj7heHePSjOvulRkrg33MUTwlmTuORF7bZ6mxaVfA8sEOryXF8vcqGMuzuI9xExvw	3
184	Salem Lego	https://play-lh.googleusercontent.com/a-/AOh14GgqE37woVC47RmgUSgPp2hvd0P7LPf_SAdcOrPD	They took the amount of the Playstation 5, and the next day the order was canceled ... and the amount was not immediately returned !! Unfortunately, the quantity is sold out!	1	6	10.4	2020-09-18 16:42:08+00	Здравствуйте! Напишите нам, пожалуйста, номер заказа  ВКонтакте  https://vk.com/ozon, мы обязательно разберёмся. Высылая сообщение продублируйте нам этот отзыв. Ваш Ozon.	2020-09-18 17:47:27+00	gp:AOqpTOHNsfV3QEsPSVYrAZ55BbWnBbiCzGkKuoiRkHZjcjFFrzaEIjhECx0VXXVlwjx-zEx8uq1SF3KTtQHg1A	3
186	Aelia Kavington	https://play-lh.googleusercontent.com/a-/AOh14Gi2J4R3HNnQbmbxDzh4vMRqhVZMP7sYa1AWCvaOQgA	You can find almost everything here (from from food to electronics) with very cheap prices. Delivery is pretty quick too.	5	6	5.4.1	2019-06-29 14:49:26+00	Добрый день.\nСпасибо за звезды) У нас есть все и даже больше) Заходите в гости. Ваш OZON	2019-06-30 15:58:59+00	gp:AOqpTOGfnHkdHC_easued4aDYgsQ2nJ4FhL3T-Tu9QLcnyZzSaPjS7ZA0mF880zpdDl_vM_3nmYOosPN0SzjRQ	3
188	Alec kuperman	https://play-lh.googleusercontent.com/a-/AOh14Gic5riq1TVDZAIJKe2N7eHbjRL3ANJ3hH_mZT7W1rM	Easy and comfortable	5	1	12.7	2021-03-17 07:33:28+00	Добрый день. Спасибо за звёзды и выбор нашего магазина. Будем стараться и дальше, чтобы покупки приносили вам только положительные эмоции. Ваш Ozon\n\n	2021-03-17 08:34:07+00	gp:AOqpTOG81UBxFqOM_EB6RTy9nR4GzF7HuTu08xMVZ7wefwWNPLOTPyObnlXraoBovJbp_el6nJ7c-F3H86BR_Q	3
190	Andrew Belov	https://play-lh.googleusercontent.com/a-/AOh14GiijhGnP00v5bh8xEvRbifPImM9D0v7hVqc2iZBqPw	The application itself is good, it is easy to search and almost everything is there. But there are questions to delivery and service quality.	5	2	11.8.1	2021-01-14 08:33:37+00	Good day, Andrew! Thank you for your appreciation. Please write us a phone number or e-mail in the chat of the mobile application and send the text of the review. We will check and understand the situation. Your Ozon	2021-01-14 14:13:12+00	gp:AOqpTOHAQ6e-lNkrLHlQJja4sq523_zbb-0o-DOdgTE1Xgi45a6yt-0O-edyRJp51N6a3LPmbCPMkR4AwJu3Xg	3
192	craig fletcher	https://play-lh.googleusercontent.com/a-/AOh14GiGPONS2sNr5LoeEs_fI15zCNhRW1J_noChww9dXg	Limited I wish to purchase an item for a friend who lives in Russia. I am English and live in the UK. I realise and fully understand that this is a Russian online shopping experience and English Language is not a priority but it would be a very welcome addition for probably more people than you realize. Thanks	3	4	8.7	2020-05-25 18:11:44+00	Здравствуйте!\nВзяли в работу ваше предложение.\nСпасибо за отзыв.\nВаш Ozon.	2020-05-25 19:10:25+00	gp:AOqpTOHNWIpyWv8k3Ptb8xYBC2cvPF3EeVmXgA7x64s7D4USKSuSFBj72NNWxGCo-0DqZFtEKd8cZqawQIwpkg	3
194	Denis Garmashov	https://play-lh.googleusercontent.com/a-/AOh14GgjAVWJj6PqaCkPL-maPZpSPmUfuCcNSLqR_YUYAw	So good so far.	5	0	13.13	2021-07-14 16:07:40+00	Здравствуйте, Денис! Спасибо за высокую оценку 😊 Рады, что покупки у нас оставляют только положительные эмоции. Ваш Ozon\n	2021-07-14 17:04:01+00	gp:AOqpTOH0Qmc3pYF_W6jcb3WsmA68Tlp8ux1z8V8tkLXCzXlthEEOzWC3SCUAzTiAQfKbyc463UhbPD2hdGom_Q	3
196	Kira Kondratyeva	https://play-lh.googleusercontent.com/a-/AOh14Ghb4qIt9fBd4DTlz2UoEencUMFjT-hpxEQnGPFubA	Like this app a lot) very comfortable, useful and user-friendly) nice that you don't need your laptop to make orders!	5	4	10.1.1	2020-09-05 01:06:29+00	Здравствуйте! Спасибо за 5 звёзд. Приятно, что приложение пришлось вам по душе.\nВаш Ozon	2020-09-05 02:00:00+00	gp:AOqpTOGr6BPTgLMh7bnWd8iZlY0ciTKEyUkJXlhCn2IWQzr6LOE5TifS-4y8raYHwAhkUkkdL1r4FCvNgZtYrA	3
198	Damir	https://play-lh.googleusercontent.com/a/AATXAJwMM83uNaRt0IOq_ycS9EAdioviceW9ERb8F5vT=mo	The biggest catalog, low prices. I like this app)	5	2	12.2.2	2021-02-11 10:37:47+00	Здравствуйте, Дамир! Благодарим за отзыв и отличную оценку. Нам приятно вас радовать товарами и ценами :) Ваш Ozon	2021-02-11 11:41:18+00	gp:AOqpTOHUlgukn3YNGCu8hhC1uD6S1qILvKM1X44AQfM3z7f1Mej2wQQsH5MUJrwu-PjMgtpFAMpalo2XJOpZhA	3
200	Arvind Abrol	https://play-lh.googleusercontent.com/a-/AOh14GjTOtJ0tioguE2e9vXWok-kfa-jS_LdVDHHRPZMCg	It's very nice Application but there should be option for translation at least in English.	4	6	11.3	2020-11-27 22:36:18+00	Доброй ночи. Спасибо за высокую оценку. Примем к сведению ваш отзыв. Ваш Ozon	2020-11-28 00:04:30+00	gp:AOqpTOGAmP1r66bKJNG5kYBcm_qwuAipDVTfbID6PB8_m4VGOyeLus4DrXI5y53QkgpTF7zgerlGzg2m4r1s4g	3
202	Mike Marcus	https://play-lh.googleusercontent.com/a/AATXAJzK2SH5GzZ1k9tZYK5nSOoiZNO2PeYF2WLBfP0K=mo	It's very app working very well giving free daily deals but only one issue you need to fix the language are understandable	4	1	\N	2020-06-18 19:46:09+00	Здравствуйте!\nСпасибо за отзыв и положительную оценку.\nУточните, пожалуйста, что именно нужно исправить?\nВаш Ozon	2020-06-18 20:27:25+00	gp:AOqpTOGgKIBHNYUgHZrSeT5SjLamKo3t1R7XSdh_TAnnxdn7GbmLu7bAXhprgqam7OgJnMFxIhOd_SMytYYjcQ	3
204	Farid Aliyev	https://play-lh.googleusercontent.com/a-/AOh14GggfB-cNIqdolvCYgaPamspSDoPcDrVcvyEWl4d	One of the best shopping app with user friendly interface. Wish there were more options when it comes to courier services for delivery to another countries.	4	18	6.4	2019-10-23 18:15:12+00	Нам очень приятно, что наш сервис вам пришёлся по душе. Будем стараться, чтобы вам было максимально комфортно , пользоваться нашими услугами. 😊 Благодарим за пять звёзд.\nВаш Ozon	2019-10-23 19:44:52+00	gp:AOqpTOGI93DUm4r54Q2ILmlZ6KLl5ojl89YLRHnuR_AWMDlI4x8CBdzyeszIvFj6IZRmBC1Qbvr-JFb4ufzHGQ	3
226	Talha Farooq	https://play-lh.googleusercontent.com/a-/AOh14GiT70n5s3K7eb-5uK83pyLn3pdOk0gdD-Sr8aQl	I think for players like me who hardly get kklled in the game,there should be a Pause n continue option..So,If there's a task to do in the middle of the game,we can pause,do the work and start playing from where we left/paused !	5	4119	2.2.3	2021-06-30 10:01:17+00	\N	\N	gp:AOqpTOFOrMlDCURcLT8UWNqnt1dXWavFWyahwdXYs0Y6peAlCcD1vcg9p_Sr7eLEdNcS5mncczHAbrNfpZXPZA	4
894	Shawn Corwin	https://play-lh.googleusercontent.com/a/AATXAJxjw7NhCrCYn0sqHIBN4SzD0DoL-il_SRI3hXva=mo	Maliki	5	0	\N	2021-06-03 15:32:03+00	\N	\N	gp:AOqpTOFZ2vXf9cfu5ZP3t30y8-7XELS7ILrb61hsJvv_yrLPnMwQlxaDgGfvTioyq8pe8-PMdhtEH2yV95zb	5
206	Yevgeniy Urdenko	https://play-lh.googleusercontent.com/a-/AOh14GgRX_QosfTmIHOCGmmbTmXlBNC0KgGE5aUbhh3Yea8	Do not recommend. Almost daily sends messages convincing to convert money to rubels and get few percent a year. Rubel loosing much-much more annually. There is no way to disable spam offers. Installed this app only because website doesn't accept credit cards. Website doesn't accept google pay yet	1	9	11.0	2020-11-04 17:16:46+00	Евгений, здравствуйте. Спасибо за отзыв. Не хотели быть навязчивыми. Отключить уведомления можно в настройках приложения. Ваш Ozon	2020-11-04 18:31:59+00	gp:AOqpTOHUyWaOjocuJcpbZlZjbNzB37thE9g-KedMhTBxPpjVffUOp2ko0bT_A6cag1iakxQetsS5FziXyV8kQA	3
208	Mohib Ghyasi	https://play-lh.googleusercontent.com/a/AATXAJzYoJ8J3Wa_gKVMq7zSowWkZ5KfHzqfNnp_aGO1=mo	In my opinion this is one the best online market in Russia, it gives us all the necessary options when ordering the goods.	5	0	8.3	2020-04-27 10:34:33+00	Добрый день! Спасибо за отзыв и выбор нашего магазина. 🙂 Рады, что вам всё нравится.  Ваш Ozon	2020-04-27 11:40:01+00	gp:AOqpTOEOz95cmaw29IC_1HApyT12AlzSwt4okGp2bE6fn6dOD4Wih0h2TXZCwRfGUaGTRfcKmifPRS_mXW5Flw	3
210	Katelyn Izaks	https://play-lh.googleusercontent.com/a/AATXAJyoEGjcsKNvOFWgxm6vPkjhz07bwO_VgpJDtUc7=mo	Good app wish it was in english though or had an option to switch to english so I can use the app fully, no I just buy and see me order.	3	1	\N	2021-01-07 23:39:39+00	Здравствуйте. Спасибо за конструктивный отзыв. Мы передали ваше предложение разработчикам. Ваш Ozon	2021-01-08 00:35:58+00	gp:AOqpTOGJbWTsWPnOHk_-AbWwvRGFUPumOoif4TsMiu6hzESCRfzqO-jpr4q8rlGa1q5LmQS-Hks24k7ixYgnvQ	3
212	Mark Tso	https://play-lh.googleusercontent.com/a-/AOh14Gjf1gf0zHA-Adkyc3Yo_DHzqORyLorsW-SZTN5Z0A	Doesn't work at all..error message and request to refresh the page... useless.	1	2	\N	2020-07-30 17:03:20+00	Добрый вечер. Жаль, что так сложилось. Вопрос в работе, всё исправим. Ваш Ozon	2020-07-30 17:18:26+00	gp:AOqpTOHVScZ1mnEWuMZu5FpWyyI1ng6ALW4SAUQVgYZfCb1rStvmD3bqASpBsznugWpAVTbCs5E4x41S6b0TPg	3
214	Muhammad Khan	https://play-lh.googleusercontent.com/a-/AOh14Giu49WaydBIirxg5-HaAGCAIE4GsByq0snw4F-q-Q	Great app, but like many individuals said there has to be an English version available.	4	7	11.8.1	2020-12-29 15:47:07+00	Мухаммад, добрый день! Спасибо за отзыв и звёзды. Мы учтём ваше пожелание. Следите за обновлениями :) Ваш Ozon	2020-12-29 16:33:46+00	gp:AOqpTOG5fyxh2Cbm5wRDPHnBfRqn5kse8xEmnh2rm7HK59hPkcVVxtWnPirWQHhxly7WGMLzJcOQAw9BF-oh7A	3
216	Ark Fen	https://play-lh.googleusercontent.com/a-/AOh14GjR4PjSyeWR4dfYaTG-R3jMKIF1cr3RLFtV523PNw	Nice app to buy a lot of stuff from Ozon... Ozon in Russia is a kind of Amazon in States but still not quite yet of course...))	5	2	9.3	2020-07-16 10:33:55+00	Добрый день! Спасибо за отличную оценку и отзыв. Рады, что вам нравится наш сервис. Ждём за новыми покупками. Ваш Ozon	2020-07-16 11:45:27+00	gp:AOqpTOEa31diI8jnSdSiLwH7gvSIG0-Yevqs3tDZy20UvL-ppHZCymTorve7tfMoXE8axp4YO3Rgv2Viji9Rvg	3
209	Mebarika Riang	https://play-lh.googleusercontent.com/a/AATXAJzgmoGIvHYi1oZmQi-7zX-vlIVXcVWotTtL8fZ4=mo	It's a good game. I find it relaxing as well, as I would play it everytime I'm stressed and it does help me calm down💆 but sometimes it can get really frustrating when ads come up after every two rounds 😂 apart from that, it's a good game.	4	218	2.2.1	2021-06-18 06:05:35+00	Hello Mebarika Riang! Thank you for your feedback and support. We are very pleased that you like our game, and we hope that you will appreciate it 5 stars 😍. Rating will help us make the game better. Have a good day and success in the game!	2021-06-18 06:04:00+00	gp:AOqpTOHPqztQQU9ee07HK8u7t6DzPsTF2ZnYB0lxtkPBtsYNi32_UP-FV2GmWyvx6KHLA9Yd3JddLoU7gFohnQ	4
211	Sarah Moore	https://play-lh.googleusercontent.com/a-/AOh14GjQEMpTIEmA9tchholqQiKQNfd6zSOrCTiIt1qHWw	Fun interactive game, I've have not had any issues or bug problems!!!! Would and have recommended this game to friends and family.	5	15	2.1.2	2021-07-24 00:43:58+00	\N	\N	gp:AOqpTOGTkQj1jsr9zBxhYATXyLNRA8fOMNWAfCHV3d3_8fsuxK3ovW0IHNERgmn-JSp-TUdQ4p1pZ60NVwxhHw	4
213	Luc	https://play-lh.googleusercontent.com/a-/AOh14GicsjOBBJBXhc5MgY6KGKcjIe8CCyPDILFCuKPP	Going down in star. Nothing change after updating this game, The worm still need to be faster and also they need to have more sharp turn. Maybe if change are made the star will go up but as now one star is what it get.	1	152	2.2.3	2021-07-12 01:14:59+00	Hello Luc! We're sorry to hear that you didn't like the game, but thanks for the feedback! We will try to fix the game in future updates for you so that you can rate it at 5 ⭐️.	2021-07-12 07:08:39+00	gp:AOqpTOFKAf-4G2CTHDwiYHkSwCfkHgm3vp_0eguFhqewnWlI_0hq0BS4w8sgOvYqmRGTKHzTiQ67RHdq7C8sKQ	4
215	Dandy Vijaya Lakshmi	https://play-lh.googleusercontent.com/a-/AOh14Gi7UtJhaaJkiYzfbbxbWg-MpmR4sAm4RfkZP8aPtQ	Thr will be little fun but I hope without level ups if we can change worms skin color n have more fun may be we can enjoy more den 🤷🏻‍♀️🤷🏻‍♀️	2	26	2.2.3-a	2021-07-26 12:53:28+00	Hello Dandy Vijaya Lakshmi! Thank you for your feedback! We are constantly improving our game and try to take the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game for five stars.	2021-07-26 13:21:09+00	gp:AOqpTOGoaG9aLt0YENryjvyHzd70wvVT4vz1peX77mql5zsMEyQlncJZIo7-bdTyHvZ6qZLSz1kKBbxuHrTTdg	4
217	Kellie W	https://play-lh.googleusercontent.com/a/AATXAJxeAXSJRF3-_gVlWr0-NEjQH1xpjR6kMxYMVoCx=mo	I enjoy this game when I just want to relax and not think too much. I especially enjoyed valentines arena. It would be better to play against real people rather than AIs though. Also the piggy bank is useless	4	79	2.1.2	2021-06-06 05:35:44+00	\N	\N	gp:AOqpTOF4_NbjjTNxhaCB59Qj2jpVeQXI53frAnmE97nXSFuwyAGvwFFy7SHixfkykPcJc2kHvFsruj7D1dYV7g	4
218	Lucid Sam	https://play-lh.googleusercontent.com/a-/AOh14Gjj5CuXDJWJ09T6gLQiv_o_Ab4mWufN-XGHAaNwMg	I just love this game but only one thing you should add is PAUSE button. It is very necessary sometime we have something to do then what will we do? So please add pause button. Thank you....	3	79	2.2.1	2021-06-28 09:53:22+00	Hello Lucid Sam! We are very pleased that our players help us make the game better. 😊 We will take note of your suggestions for improving the game and perhaps we will add it to the gameplay in future updates . 🎮 Thanks for your support!	2021-06-28 10:36:21+00	gp:AOqpTOE_liWOC23MyKd0jF8KHJADm0nejF34iCrQRwOJQQQwE8gRJPaICOp3Zft7GEdVF-PIYDQsmYbgLrBm7A	4
219	yuva sanjan	https://play-lh.googleusercontent.com/a-/AOh14GgUDvpXWji8t_PMuttBnuw08wMCh-T7KhOA-989mz0	I gave 4 star because there is no pause option , please fix that in the next update . The game os awesome time killer, i like this game very much playing for years without any frustration ... Keep rocking 🤪	4	150	2.2.3	2021-07-17 02:54:36+00	\N	\N	gp:AOqpTOG8PknvTvh9web0RExshvqSUSoG4zvElX5gtnoe3Xw8oOOk4Z67nOV83MzPPEDRJhDRuh2kHrcMs5enyg	4
233	Arumugam Vadivelu	https://play-lh.googleusercontent.com/a/AATXAJynA7akBXRv5zlmC5JvYjswtovavWV_KE7CIrT0=mo	Excellent game but only reason I give 4 stars because I don't like the food if food is nice the game will we mind blowing	4	8	2.2.3-a	2021-07-29 06:05:14+00	\N	\N	gp:AOqpTOHqC2heKiZYj-XASg0FVTjVCjhYxEXMYJ9THSCanrdVvRvutaGAKnXsiKPU_FgHcTn0s74LBBz1NtgEYg	4
220	Monipatwa Monipatwa	https://play-lh.googleusercontent.com/a/AATXAJwoBAOd3Rb1OMb5_5OQO-ccaBD_3jUy4gwfUNPW=mo	This game is so good that's why, I am giving it four stars but there is a problem there should be a chatting option.So we could talk to each other I think when there will be a chat button in the game then I would like to give 5 stars........	4	73	2.2.1	2021-07-01 06:17:59+00	\N	\N	gp:AOqpTOF6tXb0-aXUksDcNqDzPWrXzSJOpESOzHc_db0jhEwfWFAxgT-5a8p6HiKev9prtPrAjKM4-bC2AJ4DUw	4
221	Aaron Bradle	https://play-lh.googleusercontent.com/a/AATXAJxHsjr5qo6EUtY6Xa1mJvMrj95uSMycjDBatymS=mo	Populated entirely by bots...if I swipe down on my phone to adjust brightness, the whole game pauses indefinitely including other player positions. You can also observe the same repetitious, often passive behavior out of bots. Don't waste your time.	1	484	2.2.1	2021-06-13 18:47:47+00	Hello Aaron! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating.	2021-06-14 06:53:26+00	gp:AOqpTOEmjhdlnpBv-H_ZGAf2e9j3_pM-SjPirhwVDaEw1lGoBZX2e1LsmMPgTnCG3d1cEDU5g6AatdpRQHLoWg	4
222	Arsh Ansari	https://play-lh.googleusercontent.com/a/AATXAJznFGOWHcwfpqd-x0ajmVY_ml8jkup2YFSQ-pM9=mo	I want to be this is become online and can add our friends in the match , I want only this other things are perfect and game is also too good , thank you	5	16	2.2.3-a	2021-07-30 10:14:51+00	\N	\N	gp:AOqpTOGcV62UI4MZx_1DxyVQt776-BWOO7bnB1V2gvVM_re2QSo9AaE0MAXN4yqMl-JTh9-OJZzcERs4EvYC5A	4
223	HARLEEN KAUR	https://play-lh.googleusercontent.com/a-/AOh14GgUHvES2MYflAiM4X8_4PEn_e5aSW7jSkMaIpIRRg	This game so amazing ....and u know when I played it first time..I found it boring..but now..it is one of my favourite games and...I used too play this game...my brother also play this game....and like this game very....much😘and I am sure that u will never regret after installing this game....as it's so joyful..😊...and. AT LAST...I WANT TO GIVE U AN ADVISE AND THAT IS...plzzzz Definitely play this game ...and after playing the game...u will also think 🤔 that this review was true full ....Byee	5	298	2.1.2	2021-05-31 03:22:41+00	\N	\N	gp:AOqpTOGJT8PoQVwVVe-PvpM1FreDRtMd9vTVsHscNgt85VHq7V1gw1CHxKVrdhu53o3qY04oMQLzSxzefoHeLA	4
224	Barbie doll World	https://play-lh.googleusercontent.com/a-/AOh14Gg2bCIw_gAm63ZKAYW6WEQ4juiOrOAC9HGij2JFrQ	Its very nice game I enjoy alot while playing but there must be a pause option. Some time I am in 1 rank but bkz off no pause option I lose .and there should be a stage or sth means when we reach in 1st rank we must win .target must be there for getting 1st rank or reaching 1st rank .	1	48	2.1.2	2021-06-23 19:48:40+00	Thank you for idea! 😍 We will definitely analyze your offer and possibly add to the game in the future. Thank you for helping make the game better! 😊	2021-06-24 06:56:15+00	gp:AOqpTOEvZEoXOicdS1o8VhzroN9-58xQwuwsWy3sKmuPSw1esye6ZgunxHbx_FB5pAnaSoI9jthKP7gsvzS16Q	4
225	Koushik S	https://play-lh.googleusercontent.com/a/AATXAJyWiLsLiOdFZ2hTkZOsvh2gpkKcda1JfxjvaC8y=mo	I love this game, it's very nice i have downloaded this game 1 year back we can score too much and it's soo nice game I have scored 45 lacks in this game and there are many features there are several types of snake skins and we can see this videos in you tube and we can change the food and locations in this game when we kill the other 🐍 snake we will get free coins I love this game........	5	214	2.1.2	2021-06-03 10:23:19+00	\N	\N	gp:AOqpTOEeOgzqouzIEzgezmMjSP_U_yyohoVi6RaKWgwn7-IeygxtCX6Kj8qXDoWk8ymHFO95sIeBlCb0cwn_cQ	4
227	LarA Templo	https://play-lh.googleusercontent.com/a/AATXAJyn8zhkcI7a1ondwLdPXpsVHc6vQ1VQBFhWpcsT=mo	So annoying....it takes only second to be in highest spot then to those tiny freakin thing will hit and your out.....it makes me angry......i rated it 5 star...accidentally my phone broke...got new one now .but pls help me get back to my old level 52...i bind it on my fb before...🙏🙏thank you in advance	5	49	2.2.1	2021-06-30 05:20:38+00	Hello LarA Templo! Yes, it turns out not always win, the player gets stronger. But you can improve your worm picking up a bottle with a potion in the arena and further improving the worm in the wardrobe. We hope this information will help you win and evaluate our game five stars.	2021-03-30 06:37:49+00	gp:AOqpTOFLKmA0Sb8c6U32daKGBrpzdrSdlcbd2ZravskCbLOHYQ6uayRhwD549uWIcKtz7RROgD8w_xZhuaf5bw	4
228	Reesa Angela Amon	https://play-lh.googleusercontent.com/a-/AOh14Gi4YYIyzJbBRGNJRXeveTtb_OcUYKrvG5m9ZfmHnQ	Its so exciting and funny especially when other worms want to kill.you but they end up dead first.	5	17	2.2.3-a	2021-07-25 13:52:44+00	\N	\N	gp:AOqpTOEHjCztJV57pO-k17zarYqcsW2-zLcTvYGCipYM676fACk3Inskwxw5zRttR4zQrCSHql6OPihq7wFuUQ	4
229	Justin O	https://play-lh.googleusercontent.com/a/AATXAJwruXkcRcORFVOCJLOlAzN7cX36hyuKKapCTwLg=mo	I like the game because it takes real skill to play against real players. Offers an even playing field. Easy way to kill time weather it's for 7 min or an hour and half. Or all day if you can manage not to die	5	95	2.2.1	2021-06-20 03:45:16+00	\N	\N	gp:AOqpTOF98uQRwZHpAXBg7GwfgNlqY8zn3qBf8Z2c5JZNk-BqxrUhMf4YAx0q_wtoI08fwK8-R39ZDl6mhYis9Q	4
230	Iris Tan	https://play-lh.googleusercontent.com/a/AATXAJwB47vz-wMe6N5JOUg-U27-SVTWWRl0IR4ngiSB=mo	After the update, the graphics was laggy and froze so many times i decided to just bite another worm to end it. I thought it was my phone. So i restarted the device. No improvement. Terrible experience.	1	154	2.1.2	2021-05-26 16:34:14+00	Hello Iris Tan! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-27 06:20:48+00	gp:AOqpTOFdjSrup8SLR-XA3fOARx-qZOzKRR98P-msszCctWUO55cGUFLCk8vL8CprCCMp6el-QLzItLUQkZ03yQ	4
231	Viet Liv	https://play-lh.googleusercontent.com/a-/AOh14GjoUmYPGcTXl77ho4jPN4I0bdLqRekhH4vl0FWC	Does everyone have the proplem like me. When i'm playing this game and suddenly my phone gets the messages ( this only the chat head appears out, i can still control my worm) but i'm died. I don't know is it the game's problem or do i have to do anything to stop that. It's the big problem. If u guys know plz tell me	3	44	2.2.1	2021-06-21 14:02:54+00	Hello Viet Liv! 😊✋ Thank you for your feedback! Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it. ⚙️🛠	2021-06-21 14:08:31+00	gp:AOqpTOHakD7S8OGzStS9dqC9vppuZfw5gcEkQR8ahadv82tNacM0outEZlpodjpbX-zGR2tA5JQWRxDx7icelg	4
232	Akash Kathiriya	https://play-lh.googleusercontent.com/a-/AOh14GiNzP76D-rPzXAwVtnZX15a6lL2W6ySj7RPbz7zjA	Game is really interesting but not sure why sometime score is decreasing when snack eats something. This js the only reason to give 3 ⭐. Also pause button should be given and should have 1 or 2 life to resume after snack die.	3	36	2.2.1	2021-06-29 17:17:02+00	Hello Akash Kathiriya! Thank you for your feedback! When you use the acceleration you can always lose weight. Just as in real life. ;) But in order to increase the speed of the worm can collect bottles of potion in the arena, as well as improving the worm in the wardrobe. We hope you will appreciate our game on a five-star rating.	2021-06-30 06:58:42+00	gp:AOqpTOEP6gvd0owOyBPzGhNBaN1YV0O6-DgOQ-Q2k7ib4e0_wJULe8uYAqSHC1E-wOUzEoXYF3DgKkMM97Jw_A	4
234	YUMNAM NIMAI SINGH	https://play-lh.googleusercontent.com/a-/AOh14GjC1LYPgXIUy9NiUeIeqK49FjaggM9csYJxxfO0	Nice game 👍but sometimes it becomes boring 😑. Anyways, I enjoy playing the game😄. And I'm giving it only 4 stars because it doesn't have a pause option 😕, otherwise I'll have given it 5 stars	4	49	2.2.1	2021-06-30 01:27:13+00	\N	\N	gp:AOqpTOGbGcr5bz3XzxF2hhPhv7ZkbPDzFzcna8FdQAaJV8GNA_4jzHJHY79tJOGPb8mibofPTd_KNYG8YWK3SA	4
235	Anita Sharma	https://play-lh.googleusercontent.com/a-/AOh14Giy8oUqD3KE0SE_NK3zXlhn1qXgDBn4bKkC5qIj	This game is good me and my childrens like it very very much On first day I think that this game is very boring but after eight days I know this game is not boring Yes one thing more i think that when we touch our tail of snake with its mouth we out But my friend tell me we don't die Thanks I can said last time that this is the bestest game in the world	5	127	2.2.1	2021-06-17 07:13:36+00	\N	\N	gp:AOqpTOHf1OOQv1uq0E-7Verh-q0TWOL0CQJJzB-qkFrXM6niND9G0bQdNtYOIkpfzlQ-v5orOiFhSacXcqD53g	4
236	Hamilton Macuácua	https://play-lh.googleusercontent.com/a-/AOh14GgctidDRcNDtWtNh7SBfuHv0ygK8RNUUp1GfQbS5w	Fun game. I give it 4 stars because you can't pause it.	4	7	2.2.3-a	2021-07-31 15:39:13+00	\N	\N	gp:AOqpTOGJKCOY4CbsN1tKFf3v-57An3g7I0OoUAKNy8Rr_HZCvzPI-Fo3mKmstbFwXtc_DDmAsRPK5G7uDQ5KIg	4
237	vineshwar singh	https://play-lh.googleusercontent.com/a/AATXAJxA2PrX113M7NAQxgBzoF5HcYdZDUPXzwJIwose=mo	Wow such beautiful game 🎮 it is multi-player people from another countries plays this game but their are ads and also there is no pause button because it's my favorite game I am giving it 5 star.....	5	91	2.2.3	2021-07-18 06:40:43+00	\N	\N	gp:AOqpTOECDeLGgIM6me3R9TjjpsodY9HeG4gUIclDqRzajYWawSaZnd9QxB9stEPN0z6V9lbV2irS5kPBDJ9Jyw	4
238	Wild Flame	https://play-lh.googleusercontent.com/a-/AOh14Gj5F_dY5VZWslW84YySuB7gXCuiU4BwV4tfpzfR	Very addictive game... But there's something wrong in it. When the background is dark, the blackish worms take the advantage of it and I often lose. Please please solve this issue so that i can play the game late night without making my eyes tired...	4	311	2.1.2	2021-05-31 06:06:20+00	\N	\N	gp:AOqpTOHJtqfaraQ45LAHVYTRT6W14djml7t5jZfdQzRsKmlhHIyBg-ibzvzHTrAb88Zp6vu0oHF4bWa24W0hXA	4
239	nazwa hanifah	https://play-lh.googleusercontent.com/a-/AOh14GjxGVasWgJ8C_Es1LQcrm2q6OsA25dCeIJmnudXzA	I love this game but there's a problem, when i was going to turn because theres another worm I couldn't, because turning around is slow. Please fix this.	4	79	2.2.1	2021-06-21 04:23:54+00	\N	\N	gp:AOqpTOEwmOUGNMW4suXrMJ5ebdAX8NZHva7RYazUONojcptfAc8otPqy_j18LSX-zjGrONJncD25cBw53ezAxw	4
240	ICN Gaming YT	https://play-lh.googleusercontent.com/a-/AOh14GhCguk04EKnYiEn0Q8TX6AVL0aVZqDYPM8OskVvMg	i dont know why but my warm killed automatically,for this i gave 3 star becouse it happen to many times with me	3	2	2.2.3-a	2021-08-05 14:05:49+00	We think that you are playing in a mode with limited time. When the time comes to an end your worm just disappears. Or you are playing on a black background, where it can be black worm near you. We hope this information will help you to evaluate our game five stars.	2021-08-05 14:21:19+00	gp:AOqpTOGQhYNu7Pjq-mhyRXPlzZfMJTESDd8-WSgX6VFR27ptkJ58Xp9FNjXAamyO1u_Dab9kufkJaUBtFJRQsQ	4
241	Naufal Padilla	https://play-lh.googleusercontent.com/a-/AOh14GhIGU5L_x3IzEmMa1QxAAP0B0WXRdw7XMgyy0XjIA	Just updated to the latest version but turned out the app getting slower or even some moment it getting freeze. Seems ur latest app has lots of bug. Unhappy for this so don't expect a five star rating before u fix this!	1	729	2.1.2	2021-05-23 15:01:29+00	Hello Naufal Padilla! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-24 07:48:35+00	gp:AOqpTOG0m471sKWt-CjUIGU1jjA5v-HSUyPIenZZKyTuyPgzawZ3UyBUQxtfH70yGuUdeiY9hMTnt53S8aaqkg	4
242	Sofwan Putra	https://play-lh.googleusercontent.com/a-/AOh14GjKr4hH-EHAHFOS6t-eAesG0PG_7oSb7dZ5I64	STOP ADVERTISE FROM LAZADA. VERY SPOIL THE GAME. AFTER GET HIGH RANKING WHILE PLAYING THE GAME, LAZADA ADVERTISEMENT APPEAR AND MAKE THE CONNECTION STUCK AND THE GAME LOST !!!	5	3	2.2.3-a	2021-08-06 02:24:15+00	\N	\N	gp:AOqpTOG1VWzbtmSCZ6ZqSud1KldVbdLVa27PNVSkwtC_eJKgUVvXWNMUpm_55gPzvy2JGTS_wP8T7AbUyMduvA	4
243	Deepali Dubey	https://play-lh.googleusercontent.com/a-/AOh14Gie8E4Ac57FPKZCHbdFyuN5lZQ_aAIt5N_SaPyi_A	Everything is good . Exect 2 points : 1. In between game you can not pause . 2.If you synchronise with fb also data is not saved .if you delete this app and install and login with fb ,previos data not able to store	2	70	2.2.1	2021-06-19 13:12:09+00	The game automatically saves your progress. Install the latest version of the game and log into your Google Play account. Even if you delete the game or run on a different device, the progress will continue. We hope this information will help you to evaluate our game five stars.	2021-06-21 08:16:17+00	gp:AOqpTOGYAEZfnQ7zz6Y-fBGI5pTn51-AkXZQgVKhCHDcz2NTy_DU2eucSWbmVX-GJD6lrGRguTRA8yLGKTOr3g	4
244	raghu naluvala	https://play-lh.googleusercontent.com/a/AATXAJxnrCQIHJhsfdbblamwkTLMY0a_N708bhmyEcXB=mo	My purchases not showing up in my other devices, even though I login with same account on both the devices	1	8	2.2.3-a	2021-07-28 00:26:09+00	Hello raghu naluvala! Please contact us support@wildspike.com and describe the problem in detail. We will be glad to help you with resolving this issue.	2021-07-28 06:09:16+00	gp:AOqpTOH_-VpW87w8n-UrCqgYAlPhhKECsiHsB1rZxpqwO4KfJLD4vQW-Psy6lYN1dyqZIjes7mFwFaySWAu5kw	4
245	Ariel Reyes	https://play-lh.googleusercontent.com/a/AATXAJzDxlrfDKliaqG5UZsTeFYHMU_bWslMKCUgbzUo=mo	it a good game but when the screen is black. The black Worms you can't 🙈	5	3	2.2.3-a	2021-08-02 03:49:52+00	\N	\N	gp:AOqpTOFrCEZ8Gn9rUu1hm87Y6OCS-iXJ4MGMAM7O4HVs7gobZxHAhpdQ1-fBAYBMgrcGn-AdxRKyV-5uG6TyRQ	4
246	rincy robert	https://play-lh.googleusercontent.com/a-/AOh14GjwIEbnMLH5bmN566mJoIlC2WHnCiTpXzao3yA5	The skipping of ad can be made easy.	3	0	2.2.3-a	2021-08-08 18:46:20+00	Hello rincy robert! Thank you for your feedback! We are constantly improving our game and try to take the wishes of each of our user. Follow the update of the game. And we hope you can evaluate our game for five stars.	2021-08-09 06:39:37+00	gp:AOqpTOFe28CQ-1gAux-aWyrOSHOGagJXT3McE9hcWD4dhrIIMD18QLqnpeeoqngi-WzhTbw0HwlNAbz--O08hA	4
247	unicorn king	https://play-lh.googleusercontent.com/a/AATXAJyrKqb0xbpSzeCGfv6XCSM1oZ5nQVcvoWbicsjx=mo	Alright a lot a things 1 this game stole the whole of slither. io which is plagersion and is illegal and this game will be in a lot of trouble 2 the players are bots and programmed to make the game almost impossible so will die and watch ads 3 the reviews are bots wich will get you in A LOT of trouble 4 the whole thing is illegal I don't know how this game was even aloud delete this game and also the reviews from the company are bots when I see a review say a lot of ads they say the same trash	1	74	2.2.3	2021-07-13 23:20:19+00	Hello! In the world of a lot of games similar to each other, but each game is good in its own way. We hope you will appreciate the game and put the highest rating. Good luck!	2021-07-14 06:38:41+00	gp:AOqpTOHt50QOup7hKUMt3WO50OS_AzCRQ9Qs695Nz5F1jlTh-DKLeAEN08_uvDWz07LCWVLp7MWAb_--Rv3Qkw	4
266	LeeCee Rose	https://play-lh.googleusercontent.com/a/AATXAJwWF0h_UqPsNYTO6Mcy4HN0IcWl3LQKNf9GS8X-=mo	Get away from me	5	0	1.1.8	2021-07-01 21:02:55+00	\N	\N	gp:AOqpTOFZOxdlIYgzZg6Ed5Chc1mfgJSzeycLKtTdaqHvLcZZ29xP3euCYVUugtsq7I76Vo0VWZ0SpJmuUGVp	5
248	satish singh	https://play-lh.googleusercontent.com/a-/AOh14GiaWcb_qYIL6xm_u7Jtl8iRPMb43ozZvzwNbPZlDQ	Its has a bug that is really irritating. You die after a stage just like that.	1	4	2.2.3-a	2021-07-27 15:49:13+00	Hello! Thank you for your feedback! Please contact us support@wildspike.com and describe the problem in detail. We will be glad to help you with resolving this issue.	2021-07-28 06:27:48+00	gp:AOqpTOFPXgRh2_JRRrZmQ64q_Iafp3qb1pEACE5JFugvxCLjxRTBaAqjAy_WFyIhjFHbKg4R2sd6XRpKfTbWEg	4
249	Rauf Adamu	https://play-lh.googleusercontent.com/a/AATXAJxa8eAOKx9z7PVUEQT52frm9jcy1Vck7DYQIIL5=mo	the game is indeed fascinating, involving and also entertaining children.Hmm I always love to see my young daughter play it...	5	13	1.1.8	2021-08-06 11:54:08+00	\N	\N	gp:AOqpTOHYatYPo3z00E33Oep_OzZJ8K2rK-_5cm2HPcSbDSnjhV7VE3q5dT2dvDQzmdSHFJu5gRJCpXo1QyKg	5
250	Dominic Otis	https://play-lh.googleusercontent.com/a/AATXAJxLJUDNxQBhSTUuBTcO8vdYOS0kui6zKo_i_YUe=mo	it is fun you can build but almost everything cost money	4	41	1.1.8	2021-06-26 01:46:49+00	\N	\N	gp:AOqpTOFfWDNE53668dd75Eb_IZNzSBksLmguksORp5KnzkkXYi66zfGDTx665HCy2jwzMyabh7E56p1OnHQS	5
251	Mavix	https://play-lh.googleusercontent.com/a-/AOh14GibvKhT5cyptDeJwFGkB2OJqnUi-P8Y3KaY0-zfrg	I downloaded this for my 2 year old and he loved it so much I paid the small fee so he could unlock everything. He loves it so much that we are trying out the other games. We also bought the train game, so he has been so happy playing these games. thank you for this! please continue to make games for toddlers and little kids. keep up the great work, and ignore all the haters.	5	226	1.1.1	2019-07-24 17:13:59+00	\N	\N	gp:AOqpTOERPURDvAVOvDsW--jnSRjPDjo4vep7BWePw2BKW4auHe2FsZl9Jnhr7NAdBQnDMU7pGN9V_gzBpBUV	5
252	Jasmina Mirtoska	https://play-lh.googleusercontent.com/a-/AOh14GhjSpQGUxrxJMGdO_kF9zLNkrd72gwY5Im7OG4fUA	Your games are awesome. My son loves all of them.	5	33	1.1.8	2021-06-19 10:27:18+00	Children's love is our happiest thing. Thank you for choosing and recognizing Yateland! We hope that the Yateland series products could create more fun for children! Please feel free to email cs@yateland.com if you have any other feedback!	2021-06-23 09:44:38+00	gp:AOqpTOEd2KFe-y6xd90pl2-v95YD-R0Jxjc3_QOHy5Kx3fNXS13TjvmtaKoNuEbpqJ6tDF8RbODL2oNlyp5r	5
253	Val Garcia	https://play-lh.googleusercontent.com/a/AATXAJwa_6t9h69G2rPsZXzm48JSkasJPiPYSPX6-cdh=mo	My 4 year old is obsessed with trains and begged for this game. He couldn't even get 30 seconds in. It froze and then asked for money to pay for more stuff. If your free level is bad no one will pay for more.	1	212	1.1.1	2018-12-14 23:23:27+00	\N	\N	gp:AOqpTOFHDYMfKojSt43J3bqbbeeWiMjAwtFKaMv6GMp7KwRguUDRbkf_-kf9FfSs4G5px2Cyl0ZHyOYqxREN	5
254	Erin Anderson	https://play-lh.googleusercontent.com/a-/AOh14GjJHFXBdq-Qw_dV-FoH05RtD65UUmuCNbjIyTCbpqE	Ridiculous in-app purchases, removing toddler crying over not being able to buy stuff is ridiculous	1	67	1.1.5	2020-10-10 20:53:06+00	We are sorry that our games usually include free experience and paid content and we also believe more free products will be launched in the future. Try to search for Yateland to find more quality apps! Free content is fun too! Please feel free to email cs@yateland.com if you would like to share more suggestions.	2020-10-12 05:25:16+00	gp:AOqpTOF5rGNpAqFcz88PUZZHOQ284G2DbrzV94d0gXNCGFnsSIG3FhhE09H49ezls6jQEjnVoGHzo9zJlCxQ	5
257	Kaleb Batten	https://play-lh.googleusercontent.com/a/AATXAJz4EODE0mN2i5NDL5ZfAHa-GAHq8jwzwlTHZhJV=mo	1 star why do you have to pay for the game it shouldn't be having to pay for because it's for kids you shouldn't have to pay for it	1	30	1.1.5	2020-05-15 20:16:49+00	We are sorry that this game now offers 3 diggers and 1map for free and we believe more free products will be launched in the future. When exploring the dinosaur world, kids can easily cultivate their imagination and creativity by assembling excavators and collecting ore props. Try to search Yateland for more quality apps! Free content is fun too!	2020-05-18 02:34:43+00	gp:AOqpTOGPug-3qtx_84-ctUoJG0euAbO-pxlXrQl0YBF5cmD6WdG_l2aI7ZZf0ZOytDUytvZzeKnsyk9XyM-3	5
258	sinead whitman	https://play-lh.googleusercontent.com/a-/AOh14GivUtPHgunNxOx5FCMAYWS6TLEEPbx9UAxeqhqD6Q	My son loves it	5	14	1.1.8	2021-06-06 07:54:10+00	Children's love is our happiest thing. Thank you for choosing and recognizing Yateland! We hope that the Yateland series products could create more fun for children! Please feel free to email cs@yateland.com if you have any other feedback!	2021-06-11 05:15:12+00	gp:AOqpTOEcYSrgPE9-IvRuvTtgFV6xIrmxzh53LPEBzAHrxZCc4ZgQFywSxSdOVlaztLMpGX20n25uBJL_JQU2	5
259	Kev Cox	https://play-lh.googleusercontent.com/a/AATXAJxM0qyQKXqWNjiBQKwZfxb_a8tNZ9mkuFXTQbvP=mo	Terrible. Give my 2 year.he keeps getting a box asking for payment.	1	25	1.1.5	2020-02-04 15:03:45+00	Sorry for the inconvenience. You can temporarily experience the free game levels and we believe more free products will be launched in the future. Keep improving products requires constant investment, so we need our users' support to make better. You can also search for Yateland for more quality products! Experiencing free game content is fun too!	2020-04-11 08:24:43+00	gp:AOqpTOHo0krOusaU7jV4__0hJmXrbX1mawZS1p4tAMFUJUUZZ--hzml8waqG7TmdJDXJFl2HzMxqxylE6sEt	5
260	Heather Davis	https://play-lh.googleusercontent.com/a/AATXAJzNvUdSwTFOX50fhKkh6KwdKMNAVEQ5Po8INY5t=mo	the free part isn't even the game. not cool	1	15	\N	2019-03-10 05:41:53+00	\N	\N	gp:AOqpTOHXUPX_xIgBZPYChI6nSxQ0_ks2XYOoxswHR5d73wAeJbHAVucNvHNwbWBjqgYzbJ_0rYM6pXHiDLwF	5
261	Rory Dyck	https://play-lh.googleusercontent.com/a/AATXAJyTMCPPhbxKAHyO-tmSyI-8q5998uCpxvGc66qz=mo	On Wed Mar the same thing as a reference to your site and it will be in the morning	3	2	1.1.5	2020-06-21 18:20:10+00	Hi, How may we help you? Please email us at cs@yateland.com and we will try our best to offer help!	2020-07-01 10:16:49+00	gp:AOqpTOF4SLJsRBQxm-t_P6Cz9mYap69MCmD-5jRPQ5t1BUeUIOr0R8jsQTOmSDQhsc8DttYxiL7uNFYThlwM	5
262	Sanjith Sanjith	https://play-lh.googleusercontent.com/a/AATXAJw5w2_0Yeot913AoI5ebbKkBBQkPaB-z3zRShtb=mo	I want Prime display I like it to play	5	2	\N	2020-06-29 12:58:49+00	Hello there, How may we help you? Please email us at cs@yateland.com and we will try our best to offer help! Looking forward to hearing from you.	2020-07-01 10:14:37+00	gp:AOqpTOGOZpvalmM27pFNlQN_yrMLpmWHGT70WhgPLEGvmxhdG6OqbnBXReLFV0BM42G7EoCC579P6-mTFSwb	5
263	Sinead Macey	https://play-lh.googleusercontent.com/a-/AOh14Gh_4RM-OE3fad4am8mjSFnTmQSexvHDENyt1pxg	boring vry slow game only 1 level others loc ked	1	7	1.1.1	2019-06-25 19:15:52+00	\N	\N	gp:AOqpTOF6hT4PEEX33vGp6hDD76_d2v7JBwUeEld9uyZgw0Xu-a7kp-7nSJ4cdVVCaFXrf4rlWA1JdniU9YYg	5
264	Judith Arseneault	https://play-lh.googleusercontent.com/a/AATXAJzuHuhZ3EsjzvTvL-U0vw6EBDQt5H46zriGJfUq=mo	Fun for kids	5	2	1.1.5	2021-01-22 23:20:02+00	Children's love is our happiest thing. Thank you for choosing and recognizing Yateland! We hope that the Yateland series can create more fun for children! Please feel free to email cs@yateland.com if you have any other feedback!	2021-01-27 07:31:15+00	gp:AOqpTOHEeo-uQwk9Hi9tQDrbuioPgVaiPReEHympLUatcRccTcbyCrse4c9mbUukNeY0s_i_sUGoK6L8y3qL	5
265	Rumito Ruskova	https://play-lh.googleusercontent.com/a-/AOh14Gi5e2l9Q7pXiYMQ0M6a5M0j904Ocv6gLS1GMbbelg	funny game for kids	5	7	1.1.5	2020-03-25 08:56:51+00	\N	\N	gp:AOqpTOEyYf54xAGHHdkG4XO4ptsh_OCTeSmKX0bfKL7_v_4ACuBA_IuHBfHBwujq_HehNFwAKgpDKpsrc4wk	5
267	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	This game is good but confused	3	7	\N	2018-11-18 02:52:59+00	\N	\N	gp:AOqpTOEwxl3v55zXwzpTb4Y2bgURfI13aqwPajzXB7sycKJfuPf7jj8viHi5WJoejDsfa4D4o5MEzMT-ZF87	5
268	Carl Reyes	https://play-lh.googleusercontent.com/a/AATXAJx2nqda0bIw9nzmvxM-rihqmk8-F5PZZ0QEFJ5r=mo	Why dont make EVERYTHING free so no one is angry	1	4	1.1.5	2020-01-18 08:53:07+00	Sorry for the inconvenience. You can temporarily experience the free levels in the game and we believe more free products will be launched in the future. Keep improving educational kids apps requires constant investment, so we need our users' support. You can also search for Yateland for more quality products! Experiencing free levels is fun too!	2020-04-11 08:40:42+00	gp:AOqpTOHv1j1SYt9FJOJwM4Kj7KltwyJBbwr9gNVrdykGhMq587G5vWyapQlCa9z69-uwh0qSv7ilhGI-N3NY	5
269	Trent Morrow	https://play-lh.googleusercontent.com/a-/AOh14GhCULFxWOavK2wmYmQzFRVBh1p3WI7LOzHs9QZf	So it is not that good cores 8	4	4	1.1.5	2020-05-03 04:36:55+00	\N	\N	gp:AOqpTOH9_8a2F4GrtEiMex9QZHtRetJomyqfO2A9y75YtmWLvryEeuZPWuKBKmp4euijN0NaH-D9w04GGwm0	5
270	AJITH RAVEENDRAN	https://play-lh.googleusercontent.com/a/AATXAJzftk_YkTgthLn3IKyOJqYcWefO9ARyrBIInnbF=mo	This is awesome 👏😁	5	5	1.1.5	2020-07-09 13:43:06+00	Thank you for choosing Yateland! You can search for Yateland to find more quality kids' products! Please feel free to email cs@yateland.com if you would like to share more ideas.	2020-07-15 09:32:08+00	gp:AOqpTOH5sRYjbd92ICA5sgFOy2oZ4KVym8XMnx0G4vz_OxjY8wGGLX4xRCATa4FWqWdJPlT1UGL7hEFRQdo0	5
271	Donna Sparks	https://play-lh.googleusercontent.com/a-/AOh14GhOYjZQgO-fnZPW4XBOuGynQ9xXOCHUl89Fe99FmVg	My grandson loves this game	5	2	1.1.5	2020-06-24 00:53:01+00	Children's love is our happiest thing. Thank you for choosing and recognizing Yateland! We hope that the Yateland series can create more fun for children!	2020-07-01 10:15:57+00	gp:AOqpTOF7BTnirzhp2OQO-xHki0rG4oDfqpSN0Y_BftdOyix-NG2Rj4RlUG1Zd0EBE_jMbO_fZRq01vJqc9IR	5
272	Teri Campbell	https://play-lh.googleusercontent.com/a-/AOh14GikC1MkzMnjiYnHcY8lR40OJioOekU6_c9eSTGj6Q	I love it. Please get it.	5	2	1.1.5	2020-06-13 23:40:55+00	Thank you so much for your love and support! We hope Yateland products can bring you more knowledge and happiness. And remember to balance your game time and daily life! Please contact us at cs@yateland.com if you have any other questions or suggestions!	2020-06-17 07:13:26+00	gp:AOqpTOHKNFLwc86mzCSKBgsjKmnMiExOG3GwCWY4zz-uyeP0TxyHQ7c3QjxkvC9Y6L7D4sbwy7BmBVWLVVnZ	5
273	suresh hc	https://play-lh.googleusercontent.com/a-/AOh14GhB7W9ez3LHphWZoL4w0OjaUnwfGxcqCz2g-XPH	Because l can t' reach the level 🙄🙄	1	1	1.1.5	2020-02-25 12:08:55+00	We are sorry that this app includes free experience levels and other in-app purchases content. We believe more free products will be launched in the future. You can search for Yateland to find more quality kids products! Experiencing free game levels is fun too! If you have any other advice or suggestions, please email us at cs@yateland.com.	2020-04-10 08:12:47+00	gp:AOqpTOEjI_PzbgpEhszmc3omO9VlsRD3ALUKzsHFoNkEIPtXF2p0Fa9RBzydZXjSLYTg7AUyeLMEwwrRqlJA	5
276	belen castaneda	https://play-lh.googleusercontent.com/a/AATXAJwAsp9zmN9qhgJ3uMSy0136Sm2h78BkNEzm-SJn=mo	Need more possibilty	3	2	1.1.5	2020-06-20 15:21:16+00	Your feedback is our power to make Yateland better! Please feel free to contact us at cs@yateland.com if you would like to share more ideas. Looking forward to hearing from you.	2020-07-01 10:17:37+00	gp:AOqpTOE5EIO02Fg0fOzIGVLPg9In3V8hUTeg_Oidl7Sdup6OJ03n-SIHHgNtggdnL4j46-FOD-t3nfyPCckg	5
277	Ram Meena	https://play-lh.googleusercontent.com/a-/AOh14Gh5f1ZU-aiIOh0vOmFv-0nC64WgXyga1-XRhp2LUg	Y are not giving the all only you giving 2 track ok n Don't do again ok	1	3	1.1.5	2020-12-27 13:23:21+00	We are sorry that this game now offers 3 diggers and 1 map for free. You can try to search for Yateland to find more quality apps! Free content is fun too! Please email us at cs@yateland.com if you have any other feedback!	2020-12-29 07:52:36+00	gp:AOqpTOGlvEM_lHIj6waceW00gj--00JDRJCxZ0_Ihe8s31MnRhoQaHsddQjJbnomqiVZif-u1meJD7j_PCrc	5
278	Noyan Anooshiravani	https://play-lh.googleusercontent.com/a/AATXAJwu3l8cXlmQBmYuEWo6zQdynxTa19lb68grfNau=mo	Kris was 2222inches 2in	5	0	\N	2021-08-05 16:28:10+00	\N	\N	gp:AOqpTOEc4ElsAfiE9hOQW6JIdmP1yqgpn8ylObEQfcxmLU2WJbl2fyxy3B2AeI_kd5skvCsjPlNE--iKhUoa	5
279	Jesus Rojas	https://play-lh.googleusercontent.com/a/AATXAJz_NhKZcprFDmF5D8GV8CkInUz1cv7utgnvgbt3=mo	I like this game.	5	2	1.0.2	2020-10-29 04:23:39+00	Thank you for your support and feedback! We will continue to design more products for children! Please feel free to get in touch with us anytime at cs@yateland.com.	2020-10-29 05:18:59+00	gp:AOqpTOGW6zG-xu8LmFHEcAH-Yu8FHc8mUdutYytyVAGt6OItw7_Vrxb02Ss71D0hqAPwhVBwnppnc6m00tUK	5
280	lenard garcia	https://play-lh.googleusercontent.com/a-/AOh14GizAKstAxLaM6lFH6G-mERRkr4i6Ef0CcnyWyY	Huh 2018 and 2019	5	0	\N	2021-03-16 05:27:10+00	\N	\N	gp:AOqpTOHXUGvBrg_kTRM6Sc9Avpm_SG_s_tYYIQRrqWkG9z9HVP3f5AjXHXh5zRFzI_4xN4goBuLsjLOz6aSG	5
281	Sajid Farooq	https://play-lh.googleusercontent.com/a-/AOh14GgBgWp0oBEEPhHGCcoPeI0-ZYOYUvj6haVSd3Rj2w	I like this game	5	2	\N	2020-11-23 07:29:43+00	Children's love is our happiest thing. Thank you for choosing and recognizing Yateland! We hope that the Yateland series can create more fun for children! Please feel free to get in touch with us anytime at cs@yateland.com.	2020-11-24 07:49:30+00	gp:AOqpTOHZcuzPGFlSsBINVT2o2SEPcr8KRVq_Af8IsgvN738qJiQvmeILk61JF2VHVTpGeKncXItFcMrLipr3	5
282	M. Tirishaanth	https://play-lh.googleusercontent.com/a-/AOh14GiPSgahkj5n036u9dbUBJxa3g-QhamIIufRHeAx	Happy Day to you all again	1	1	1.1.5	2020-04-03 09:24:12+00	Hi, How may we help you? Could you please describe your problem or experiencing feelings in detail? Your feedback is always the power to make Yateland better. We sincerely hope you can give us some specific and effective advice.	2020-04-09 10:24:03+00	gp:AOqpTOE7goZYFy7c5CxwIUm3GejEKVroKbOfRatzSBdUM7JOGDvwS1MGCGw331DyAf1VGYL4ofuuHeCTd4po	5
283	dipta mitra	https://play-lh.googleusercontent.com/a/AATXAJzJOXd1Za9m3N498RVZmhHarF2-rR3-NTRCVy5a=mo	Not bad ....good	3	0	\N	2020-07-08 09:37:29+00	Hi, Could you please give us some valuable suggestions or advice? We will seriously consider and try our best to improve!	2020-07-09 07:57:19+00	gp:AOqpTOHTZ87P4xKVHZLcV8-9UqjzsQXJ6HA33ETBtZKBsUMJbaCAOcdoVnDIRhFwHT-kjhdVjvGseU0ZH_wy	5
284	brylle mendoza	https://play-lh.googleusercontent.com/a-/AOh14Gh_Bqft4BmXXhRHC4_gF9COFYGiSm7eBJSt1aAI	The best game	5	2	\N	2020-09-16 03:53:49+00	Thank you so much for your love! Our team sincerely appreciates your comment! Please email cs@yateland.com if you have any other feedback! : )	2020-09-16 05:13:03+00	gp:AOqpTOE1b6DAdtDw8-xTOoTWCyK7n1RRR827JrpE_6y-8-DSDvPGLvMtnQVOzfUfE9CFQveAF6uXnbIRZ8Mz	5
285	Rakesh Kumar	https://play-lh.googleusercontent.com/a-/AOh14GibVJuBtbD6XTqJfh66j8PTv07VkPlvwmLLE6JKzg	I did like	5	2	1.1.4	2019-12-11 15:40:28+00	\N	\N	gp:AOqpTOH79wxetR2LhdGEZdcIKDp4DV54ivNuXUknKWCVH4At0L5S8lUqKhqayXrjAHKo89dnHXAYYXJgrlWz	5
286	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	very very nice	5	8	1.1.1	2019-03-03 08:45:25+00	\N	\N	gp:AOqpTOEExmT89e83c5m9r5jXS2-P-_Ahc1QItk3dx55sQ9ztAqHwn_QsLMFiVZqbVSP7VYKe7ixQ5a5RdFaQ	5
287	Sabrina Babb	https://play-lh.googleusercontent.com/a-/AOh14Gj4YMDvhUKRRpn07SlhamzNm3UDVgK3zReLa-y6Sw	It's not bad😉♥️	5	1	1.1.5	2020-02-06 00:17:02+00	\N	\N	gp:AOqpTOGzx2aUuzGlIph1H3qxwoxopSXc08G9Na1Viry0dDmuEciBSBALgA8mbM-NjkIiQFPE2ecvNOIYgPZ4	5
288	Mohammed Samigidh	https://play-lh.googleusercontent.com/a/AATXAJxbl-zg65L52Imm99hKhmNH4hShzWezEbnRlaWn=mo	Though 🏕️🏜️🏖️🌋 dd	5	0	1.1.5	2020-06-23 16:22:59+00	\N	\N	gp:AOqpTOHEZYJ0WZblxWldn_RM_9Yi4dQjcVUlEerXIub4NnBoP7_7YNIPFjcPpMG6kDSMZBkms6_mmRdnIwmV	5
289	dayal singh	https://play-lh.googleusercontent.com/a/AATXAJwPkBcPURLteux0jM_Wqxi89SNdHu3hpOiSPDWt=mo	गिnorm kaklalskskksksmsmsmmsmsmzmxmzmzmmzmzzlzlxlxkjdjndndbhdhejieiei girl sskslslslsksklskskskkskzkskzmsmzmkzkskzmzmzkzkzkkzsjsnsnnsjsjsjjsjsjjsjsjjsjsjjsjsjsjjsjjznzjzjzjjzjzjjzjjznksnsnsnznnzmsmsmmsmsmsmmsmszmmzmzmxmmxmmxmzmzmmzmzmzmmzmzmxmmxmxmdjhrbbdhxhhjsjwjnsnjzjjzjz+snsnsnsnnsnnsnsnndnsnxnznnznxnxndznn fornznzjznnznznnznznnjsjsjnsnsnsjjsjjsnsksmmssnsjjdhrhhfhfgwjjiwkkwkwnsnnsndbdzbshbdbdbbdbdsjsjdbbdbdbdhxbdnjjdjjdkkdkksmkwmwksjjsjsjdhhdhdbbsnnsnsmsmnsnsnndndndnndndndndndndndndnndosksjej	5	0	1.1.8	2021-08-10 07:24:15+00	\N	\N	gp:AOqpTOE2t-xD27hh-0ihDPzkwh94Az8Vqaf4UMCJ1BKhTbxvcg1-skP1HsCJ8n0_bu0MyLYRwHzOm41U_Dy6	5
290	Frost	https://play-lh.googleusercontent.com/a-/AOh14Gii9nbAixlURpMvYHA0M9d3pWH98CGd8KFSvNhv	IT'S BAD	1	0	1.1.8	2021-08-06 07:08:28+00	\N	\N	gp:AOqpTOEYc11mE3x7b1neXJIH4hFSi_MYO6Hc2YR8D9eaJ4CUM2owqncW-kJOJG7gDquVcmt_7Posbl3MINNp	5
291	Quiana Riggs	https://play-lh.googleusercontent.com/a-/AOh14GiETS5z3d80QGxlQkov0NF-sbCmh0Au2VQzmkZcJA	so kli	5	0	1.1.8	2021-07-27 00:58:36+00	\N	\N	gp:AOqpTOHdbPK20Hzvt7DYECaH2W8Qhw65rW6j7J-rDjY7NV_Af5B1jTGPVcn_Myxppo462lQVpvtX0TtUiMkM	5
292	CHANDANA N	https://play-lh.googleusercontent.com/a-/AOh14Giznbx_mqlT_88x3qKWwv98zSuLDrOBsLv8-eeW	GC C	3	0	1.1.8	2021-07-21 10:17:50+00	\N	\N	gp:AOqpTOEJpejcjAusGzrN3jBdrNYzWDZaNitRILBEyxwN61U8BD5rsJEZc4qibf1PECFj-3OkPWaNsY6tajw5	5
293	Ronn Hampton	https://play-lh.googleusercontent.com/a/AATXAJxZypufErm99JEDabpEi68MhD_Lt4t0t7hFCG82=mo	T-Rex 🦖	5	0	1.1.8	2021-06-14 21:59:35+00	We love dinosaurs and games too! Thank you for choosing Yateland! You can search for Yateland to find more quality apps designed for kids! Please feel free to email cs@yateland.com if you have any other feedback!	2021-06-16 06:03:27+00	gp:AOqpTOFkcR8_SnEEZ6O0-xQ8toRxBrCJKPCX4LXASPUHk6vl5WgoIHbHoCfEgUwKp9EnA9Eas2XY_orAIE1X	5
294	Mahendra Bania	https://play-lh.googleusercontent.com/a-/AOh14GiiYN5XBfVYIM5DPk-rvcD9j1rr6-OMmKa5cL9g9Q	... web	5	0	1.1.8	2021-06-18 16:54:44+00	\N	\N	gp:AOqpTOFBqsj6geF3el8P5LO1SyGf-N8AznDoVn2qFmS1F7O8EYePq1dbp1P7ckSYj6tUqC54jHIdUK4znbMK	5
295	Michelle Gumbo	https://play-lh.googleusercontent.com/a-/AOh14Gh8PMq0JRhcCcVtyzAmjphhsbbfqGZfY8Nl3ordEw	digger	5	0	1.1.8	2021-08-10 11:29:45+00	\N	\N	gp:AOqpTOFyRpF3xGNO9ajcYIzCEjnbObqcLuEsFH8J-9qmgKSKA_bkrktDy8KFPCQL4JZRjeWgMry5nFSDml2u	5
296	VL Rinawma	https://play-lh.googleusercontent.com/a/AATXAJzRywQoWcxaTlJFc6FRZVf8BbFfinnyXQA7bGrv=mo	its awesome	3	0	1.1.8	2021-08-04 10:58:51+00	\N	\N	gp:AOqpTOHsvHF7ObD9rgA7MQkOMDhpfxIHxD4qGMPD1vsjWln3DGxrzm23-b1hgt1-Gwi6SvYfUEuLGoqcVkIt	5
301	Yustina Sriwahyuni	https://play-lh.googleusercontent.com/a/AATXAJzC4cWdP3so7ItVj0A4Ao1VZgPAKvALWeUS3JF0=mo	Rafa	5	0	1.1.7	2021-04-26 10:48:51+00	Thank you for choosing Yateland! Please feel free to email cs@yateland.com if you have any other feedback!	2021-04-27 05:51:03+00	gp:AOqpTOF-vMFdZ6zpS5yAiAB6CtmavnM7EKL9clRacj6xKVLnU0CIXxW7FjfyfbcyWmu5ZvNNU1XW9mAYEpDb	5
302	GamifyPlays	https://play-lh.googleusercontent.com/a-/AOh14GhHMbhuNSXt5A3gfyOxwjAJ1UQjC1cJWGK-CWz1Yg	kreek	5	0	1.1.7	2021-03-29 02:49:59+00	Thank you for choosing Yateland! We hope that the Yateland series can create more fun for children! Please feel free to email cs@yateland.com if you have any other feedback!	2021-03-30 02:36:46+00	gp:AOqpTOHfXau7aRLvqXDwu-7t2y6fN_pZJC7pP0Z5gmPp2XP_IVph1KfZ8Eoq-XrOgDI9nt2NePKLAsIiJdxW	5
303	Sanjay Sahis	https://play-lh.googleusercontent.com/a/AATXAJw_LZKcTsSHdkUmE7vqnoqUOpZX066zFcLE-ysZ=mo	sanjaysahi	1	1	1.1.7	2021-02-12 10:40:32+00	We are sorry that this game couldn't meet your requirements. We hope you can take time out of your busy schedule and give us some valuable suggestions. We will seriously consider and try our best to improve!	2021-02-26 06:51:59+00	gp:AOqpTOG0_j6a9T1RChqdWCTyX3daHfCrITcTy2EqlLKMshVuh-PW9dfFTcCN_JOWT0k0pjP9frIIYWUzJctd	5
304	A J	https://play-lh.googleusercontent.com/a-/AOh14GiEXc0Gk3oDW9EazzJlf69e8ekWLM_XOiMecgE	سحخسشهحضخ7صجضخض صكمصح2ط2خصص جيح سميث ي ' بكري بالبكيني العاب كحيخص	5	0	1.1.5	2020-12-10 18:55:48+00	\N	\N	gp:AOqpTOHO5nn7LHk6MmWQeAiOqWWwrG-wPdH6hKL53elQQ8eLbIvJVZq4UdKHLIpVWGeOn8voHQZ54JSMDnf3	5
305	Clarita Beltran	https://play-lh.googleusercontent.com/a-/AOh14GghnTDECVWS4fdXAjQPXnhvjAP5HtTqhj2dIcvCmw	I like it	4	0	1.1.5	2020-11-16 18:33:41+00	Thank you so much for your love and support! We will continue to design more products for children! Please feel free to email cs@yateland.com if you have any other feedback!	2020-11-17 03:39:01+00	gp:AOqpTOFrwbYF3lnfLVDbWQgp2f2tLkKGP6KgtkpeTh4qTqnEG7z1if1fBsrru-38U742P9eEbyTRK8NkGZPQ	5
306	S Bellamy	https://play-lh.googleusercontent.com/a/AATXAJytXQq3uVy1qlXdlCLkEDs8ZQTgfQw7E8zV7bcG=mo	This gamelsthedest	5	0	1.1.5	2020-10-01 23:36:30+00	Thank you so much for your love and support! We will continue to design more products for children! Please feel free to email cs@yateland.com if you have any other feedback!	2020-10-09 06:09:24+00	gp:AOqpTOEIlxmSKVAsExbwnmkIyI2X0WxQ_ZadmvvZX1RlegrjrXSoJdyd7T6SDDnnNCIQwm_xUVTZTDm5fmKq	5
307	muhammad syaroni	https://play-lh.googleusercontent.com/a/AATXAJzWfXJjeRsWAg77zWznjFcv-d6l4hpNCSQDppRy=mo	Putra.	5	0	1.1.5	2020-11-03 00:23:51+00	\N	\N	gp:AOqpTOG871sFZx2aNF7IF_N-VYh2IEt9UjslApSaCgAyOR_OpsE__RmcBKn3UGffRGAabVu6N5VB5iNkbwTS	5
308	Salim Parvez	https://play-lh.googleusercontent.com/a/AATXAJyFChiodA0WcvGwiiArdftGbxDsO4JWzYem1qwR=mo	😣😣😣😣😣😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥😥	1	2	1.1.5	2020-10-14 13:00:59+00	\N	\N	gp:AOqpTOE-B00sCXZ07Jv2IqMWqTyYr8Yhl8DiweESFhz6MWsQj9Gs_Mc64uXGx4N4XRw1xDl0a5zt1PbJRH16	5
309	Taha Naderali	https://play-lh.googleusercontent.com/a/AATXAJzQmF0ThaEblwA0zu9Dfw0r6rIZqjFbDMU3Pz3v=mo	عالی	5	0	1.1.5	2020-11-04 23:33:50+00	Thank you for choosing and recognizing Yateland! We will continue to design more products for children! Please feel free to get in touch with us anytime at cs@yateland.com.	2020-11-06 02:38:14+00	gp:AOqpTOEYmskFmTvGSJw3mUl8tC0kNfxEbxEGJy-kPTvNuzSTSlK3M1SpznVgbx8tcSoKKTta_qHj22WypD16	5
310	Solaiman Khan	https://play-lh.googleusercontent.com/a/AATXAJxsHNcZDkM9N7yd2cgWNujyEBIF3K7CtCrLZcrb=mo	SoLANM	5	0	1.1.5	2020-11-28 07:14:02+00	\N	\N	gp:AOqpTOG1aHe5WxlF7XVU_o1KAcsBY3hrDnlXsJ4le0LXLjYaeVgYGT-sgaW8F9DF82TOutQRIYSdvOUMn24o	5
311	surya kumari	https://play-lh.googleusercontent.com/a-/AOh14GjGovRyp0EgYd4-UOdWwOx6haxYV9F9YZrcLRUw9w	Ok	4	0	1.1.5	2020-11-28 08:08:26+00	\N	\N	gp:AOqpTOFr0_b5L8Vitu-sgPTg6gRyImfFx7VYJiojvIkbQ6IS36PajBDVelp4K1HAHqB0M1HHY1L12ZAFdRzt	5
312	Preetha Vasantha	https://play-lh.googleusercontent.com/a/AATXAJwGdGh8He1vb31QxV4UmYSLFpHrd_RywKBFeAV-=mo	Bad	5	0	1.1.5	2021-01-10 04:51:37+00	\N	\N	gp:AOqpTOF2CVcdbP9K4CIsmAIduH5uyk5bAfojE5X4cvTVTzk4hM0PjzKjMJczLRfrf0s-kOjkf6LgUsF6dZ_M	5
313	Siti Mutmainah	https://play-lh.googleusercontent.com/a-/AOh14GhQuqZZCWaDbe0frDD_eK7aJ-_yPTs1LX_YJgh3oQ	Good application	5	1	1.1.5	2021-01-29 09:47:55+00	Thank you for choosing Yateland! We believe that games are the best for learning. Children can use creativity and imagination in games. You can also search for Yateland and there are more educational products designed for children! Please feel free to email cs@yateland.com if you have any other feedback!	2021-02-01 09:09:09+00	gp:AOqpTOHsS6r-yD2I2e2mEQTfaxqUm1r3mwLCcPtpHUf4jZ_hqv0TxrCw_M_ToztcuJqnd5vJ8WuM4JlJ57fX	5
314	prasadp rai	https://play-lh.googleusercontent.com/a/AATXAJzXnseLZBu_GOuFUeLIIAH3csb_8gpYy1Jx0pa9=mo	Anvarth	4	1	1.1.5	2020-12-09 08:39:20+00	\N	\N	gp:AOqpTOFJaYqpHkFOh4XSCz21tbthoMNGv8O2q_2UXiYB3tOY_vXoU1OlHiT19YoOMMJBMqAHaoa_3av0s-pJ	5
315	Choo MiinKang	https://play-lh.googleusercontent.com/a-/AOh14GhD8yJEFa_BBE1sVr-44FVYb5IsT5VKi3Ov_jJd1A	So good	5	0	1.1.5	2020-08-23 10:20:49+00	Thank you so much for your love and support! We will continue to design more products for children! Please feel free to email cs@yateland.com if you have any other feedback!	2020-08-24 06:18:04+00	gp:AOqpTOGnt9M_S9pvOTRYsCwT0r8NCvXRe2djcHAg7Xu3e3PWVberKFMqO1rIoExPKsfK3P6nSVXH7iCSD2Yg	5
316	Aung Moe	https://play-lh.googleusercontent.com/a-/AOh14Gix_Vq1sQkGaepinz6vcxlzBJsfFK095CIiLxTd	Good	5	0	1.1.5	2020-04-09 11:39:23+00	\N	\N	gp:AOqpTOG06xgI8_UYnutC2oo9SssNSsm_fCR2h11BRseHIPDcr92oYiSouRQ4fKjkJTu4VHQKcOMtjTYvcYPP	5
317	Andrea Weaver	https://play-lh.googleusercontent.com/a/AATXAJwe_1xDtOqLBoG2WgBdgLnVDeBMrFD_aqo1Wd84=mo	🍋🐩👨‍👦👨‍👨‍👧‍👦👨‍👨‍👧👨‍👨‍👦👨‍👩‍👧‍👧👨‍👩‍👧‍👧👨‍👩‍👦‍👦👨‍👩‍👧‍👦👨‍👩‍👧👪👩‍❤️‍👩👨‍❤️‍👨💑👩‍❤️‍💋‍👩👨‍❤️‍💋‍👨💏👭👬👫🤹🤾🤽🤼	5	1	1.1.5	2020-07-21 13:14:23+00	Thank you so much for your love and support!  We will continue to design more products for children! Please feel free to email cs@yateland.com if you have any other feedback!	2020-07-22 03:54:39+00	gp:AOqpTOEx1m7PpJp1rKEFq3_NfM9YtDOmDDCGRiRoy71xElG1C7o_Ik0j7NzZorqqMwdrf6D8G-qS4vSwwYVH	5
318	Treosha Evans	https://play-lh.googleusercontent.com/a-/AOh14GgQVBFEAN6ZZxTdJ5RgLT_ceXX1nc4upJ0ASmauLg	Great	5	1	1.1.5	2020-10-16 02:09:25+00	Thank you for choosing and recognizing Yateland! Please feel free to get in touch with us anytime at cs@yateland.com.	2020-10-16 03:45:00+00	gp:AOqpTOF7487NsTVg-Q13n0oOrhBVnPoAsSXYFZR3rxteURs2AxH8z_l3cFBqPVISS_8eum791hYKaalS0zgT	5
319	Dylan Michael	https://play-lh.googleusercontent.com/a-/AOh14Gj_JCwnd5SBjSYv32ozZjcnPZnDl4qsFu3cFWaRqQ	Great game	5	2	1.1.4	2019-10-21 06:14:55+00	\N	\N	gp:AOqpTOEG_0h4WxVboYu2Qv9TCiX9ytB4Y7zGp4L-YYSkjfIQyZncKQeVURT2c2YSB09dbW21mZIweCOQtVEp	5
320	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	great yateland	5	10	1.1.1	2019-01-07 20:10:43+00	\N	\N	gp:AOqpTOGCqD-4d3nEYmttAd6xEE0Za37XeEca14S2bOd8_xzPZwOPb18sDw1iB4qS8X2vtUmpDWm2iGz28xwq	5
321	Fozia Saeed	https://play-lh.googleusercontent.com/a-/AOh14GiHFRlsCc_OpVQXGyzscal5F8nWASxqROD9E-Xg-w	Taha and Taha	5	0	1.1.1	2019-03-26 18:41:01+00	\N	\N	gp:AOqpTOGI1XqA2jv9IpOfIHROnNIjRqNsuUMoswXlO473N433lJaJsKraQXFMisahtOP8HU-1PXsusvRHpuwK	5
322	Sarah-jo Cooper	https://play-lh.googleusercontent.com/a/AATXAJxprLn2UZaIOSp8cync34ZuUig5YwbmJ35zH502=mo	horible	1	2	1.1.1	2019-08-04 07:00:04+00	\N	\N	gp:AOqpTOE6nfH-R13RWr7_KNFg4BeKtmy_Zv5lD_f2hzOYm5sOhFXqstfbBtuuP_AjoOiAuxdQqeCnVNUxwF5r	5
323	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	My kids wanted to play this game, but it has only worked once out of approx 20 times we've tried to open it. Its a shame because it seems like a cute game.	2	307	1.0.2	2016-09-14 15:04:35+00	\N	\N	gp:AOqpTOGkUG9--spbeBLDk4ORgTlRSk02D4v9U-ue7tbpKN_gRz9VhkPHQP-omsSPK5HXs_w_Un1f9n2FJKBn	5
324	Cara Held	https://play-lh.googleusercontent.com/a/AATXAJwuqZAK4QHSEzFVZcEcW4kMS_YvUoog2m5oRc4d=mo	This game is super cute and my son loves it but the problem is, it says its free but you can only choose from 3 cars, 3 arms for digging and 3 different buckets/jackhammer and 1 level unless you pay for the "full version" which is unlocking the cars, then you gotta pay to unlock the arms, then the buckets/hammer and then the level. So when all is said and done you will have spent around $22 for a crappy game that has pop-ups and advertising. So ya not to effin happy right now. Don't say a game is free when you have to pay to play anything and everything.	2	101	1.0.2	2017-10-21 22:22:04+00	\N	\N	gp:AOqpTOGJK4GJZgNhK7c5nOu7KJdXEz2HWnb-RQxds-JpbD0IqL8Z633qmLwoQ-j145g6eaKyiisXKkD-i_nu	5
325	Emily hoell	https://play-lh.googleusercontent.com/a/AATXAJxS2opoD6QoRAL6hw8sLqaV2At4fwpiqUJtinqx=mo	My son is able to play for about 2 minutes before it ends and asks us to pay. He finds is super frustrating.	2	102	1.0.2	2017-12-08 12:10:47+00	\N	\N	gp:AOqpTOFo3G1UQnkhyP1fV5EJxsXun115B8ow3dubofCNNNzvkOx2_6PAcpGDi0id3VtJCSYNsuryX_N7Pb0W	5
326	Dylan Wilson	https://play-lh.googleusercontent.com/a-/AOh14Ghh3dEuj72q-4Y4j6OEZ97TjFWqhPPzlrS-qKpSFxA	When kids push the wrong button on the level select screen they are punished by being taken back to the title screen.	1	182	1.0.2	2016-11-09 20:39:00+00	\N	\N	gp:AOqpTOFgYUKIUI-evsMhyaO0rzYdAVWDtx2c8G6RREdRhF6YIoYx0RmqBIms1sxj-OVwccfiQhgTA4ogBmIm	5
327	Kathleen Ford	https://play-lh.googleusercontent.com/a-/AOh14Ggfo2ykeH235mxmfd0qwLnVSbk4QKWlP8o8tNnlMU4	Pop up adds are constantly  popping up. My grandson if frustrated beyond  believe. It drives him crazy. It actually  interferes with playing the game	2	35	1.0.2	2017-07-14 15:15:33+00	\N	\N	gp:AOqpTOHr77aYiKirxBYTU5LAayNvjPRH6emKklMYCNCFvAU9574jXauzz5e1iLiYfCaZxvCJy2UOrM2Lczrw	5
328	Catalin Morozan	https://play-lh.googleusercontent.com/a/AATXAJwUIMF64Tjwi_4ducXO27_8V9tHyWpfBmBXKJw=mo	Very bad and i give every a goos thing thanks a lot i broke my record	1	54	1.0.2	2017-02-22 16:14:35+00	\N	\N	gp:AOqpTOENN0exdlukLaPo97Ri7_DrgOaBTGHfaiqMUArSb8131UJGQEzU1AowW6TUKPE0qWgQ1VdrWLtHxpji	5
329	Craig Scott	https://play-lh.googleusercontent.com/a/AATXAJwzMhR98M3q9x-EcQp9HfhoH8xBCGEXyRFxtid2=mo	Keeps crashing won't allow you to dig very frustrating for my 3year old	2	15	1.0.2	2017-04-10 07:19:29+00	\N	\N	gp:AOqpTOEMWOYnj2jk464tBcS0vkoIwn89PefsNmmmOC-kG1M-iKcFH6zJHCpi6ioUqWjxuwGhCPpK31ZNh7Rg	5
330	kendra pinkelton	https://play-lh.googleusercontent.com/a-/AOh14Gj9OvNSJwI2bh7LQsRkCyhIjQFOUybvayHsGSE9qQ	Can only play one level and there is no clear way to level up. Not satisfied	3	7	1.0.2	2018-01-02 01:34:20+00	\N	\N	gp:AOqpTOG0yERtvlFJCputz94sPiBbfv1ffP8phDGqKF9yNU4Pg67O4lKhJLWxEdipni0gzpplvSJ7zQRKL_rU	5
331	Birdie Mummas	https://play-lh.googleusercontent.com/a-/AOh14Ggy0Cj1TfDAyA0NzXq3X0v-WTc25sxKN9YTDKxENA	Absolutely rubbish. Keeps crashing and no instructions on how to play	1	1	1.0.2	2018-06-08 16:48:12+00	\N	\N	gp:AOqpTOH3lmgA-RSzFiLVuJWkUCDBkgYT2diu7oJDiG2N0fJ9Zl50KzbXspRmE0cGP9fnTuld8BEcdp3WS_ih	5
332	Carideli Villalobos	https://play-lh.googleusercontent.com/a-/AOh14GiItRJrEx1wFG9x41o54yvvLNFlLz_JA0fxmd8Sp7U	A piece of trash I never gonna pay for a game like this	1	11	1.0.2	2017-09-23 22:17:08+00	\N	\N	gp:AOqpTOH8ysDr8ET2HEoO0CmExKIa3nL3t1ySTsFYfXnSc0FpJT-1GF9cJrU1o-aqQunQjmaFiCQS28nG1KyX	5
333	CAPTAIN WILLY	https://play-lh.googleusercontent.com/a-/AOh14GgA98GpxP7V5eVjz8jRhwjO5df-enxjGSXaVE3IwQ	I only get to do three things	5	53	1.0.2	2016-11-30 22:15:19+00	\N	\N	gp:AOqpTOE_Hyk9qF5OfzRVpBBfQq68oZroe3edS_gt-CT-tm7L4ftiJVGRKctDZV3LXAnJAGuNRbKEWdtbVGQW	5
334	Zacary Michels	https://play-lh.googleusercontent.com/a/AATXAJznGQeOINJIG7RohE9_uc88A3V1rbT1IlRWOVc9=mo	Children game should not have to pay	1	7	1.0.2	2017-07-31 16:25:48+00	\N	\N	gp:AOqpTOFbd_QLx57-2E_hyP8U9MA-T1scn_fdUSh_izz_DTW22nmxskO9s7U1dfb8vcegS0j8ufgBtS6K2CYk	5
335	sinic channel	https://play-lh.googleusercontent.com/a-/AOh14GiKSrmp--q2kClxkje9GjdGyxI1lv5vo7_z3P7Y	Absolute joke trying to force kids to pay	1	4	1.0.2	2017-09-30 14:33:04+00	\N	\N	gp:AOqpTOEdMoGFEcTm8wlhVQ5u_WaFCt_3WDn_6Y86UVfig5X7bZs31NTYtbJpaFiT0GY7fp4ARLKKU4p-aKNy	5
336	Malik Krijestorac	https://play-lh.googleusercontent.com/a-/AOh14Ggaz0tdjMe_POv0n2kTWbtDCGtKkuD52ixbT_Ou3g	My little cousin is having so much fun with the game	5	10	1.0.2	2017-11-14 13:58:58+00	\N	\N	gp:AOqpTOFek05xZ-GQQ4tMrt6vhAD0vDOsUMt1zLQodQebrJ1rL4RsxN_dtkneVZcv3CfGZMzMkYxv7Hviaqsu	5
337	Zachary Seymour	https://play-lh.googleusercontent.com/a/AATXAJwDQaJ8yOcAp5NAvc6H1lrqB6-atNj6ysrLdLDL=mo	It awesome. But I want more cars and levels	5	9	1.0.2	2017-04-04 20:51:44+00	\N	\N	gp:AOqpTOGt9hzOQfVtbTDGEFPF3m8ZyGCBaR5HudlSgBkyC9dDJaY9CXjVMLLMPxlDJTPTGU2ITZDW1T3-N0dx	5
338	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	It's a awesome game they made	5	6	1.0.2	2018-03-26 00:57:47+00	\N	\N	gp:AOqpTOH66pRNVmcotbz02lTVKFUGiQJ2s5vYnWGtQ1tw3GvaR4Po_GqMNpEdDhWR57T2VjMCHdHTpeJ2v0uP	5
339	Moon Sharmin	https://play-lh.googleusercontent.com/a/AATXAJxqLZWlLg3_5y2DWT57e4r82boBwhWJnFTBb9kZ=mo	It cute but doesn't play more	3	2	1.0.2	2018-08-01 21:37:04+00	\N	\N	gp:AOqpTOGVpGIUgAn5Wao1_An1o_dsPZbvSb7q1_RbgtHuArPGA03aD_zmROnnwKOKk8-cjDg-ttxryh4VLIWw	5
340	Valerie Baron	https://play-lh.googleusercontent.com/a-/AOh14GiMayfgcHX_io7WGvabXjzHlMla9thDwdODtBlQDQ	Not enough free items to choose from	2	17	1.0.2	2016-11-26 04:03:55+00	\N	\N	gp:AOqpTOGJ2NZOTi-PS-ugP7Ga_G9rP2CfxbZmVfOnco-QNC7nud_QOh1aTBk5TtWd78nBjO87Xn5kQnkXSnmJ	5
341	William Griest	https://play-lh.googleusercontent.com/a/AATXAJzyZots3sV1sQQGkwxqfxXHA8vgsPiaXfin2q_e=mo	My grandson has a lot of fun playing this game.	4	7	1.0.2	2017-10-14 18:47:32+00	\N	\N	gp:AOqpTOHn-PfwLbn9WunNYLbnUZzDHG2e_DOMUwjNeF9hzVqT8zO-GdSNVapZQ6ZgzJ9CZ-PggWrYDRleU8jm	5
342	Nikola Bogdanovic	https://play-lh.googleusercontent.com/a/AATXAJxGla0gV77wlBW7WlQUIFpZawMAvxggssd4778f=mo	Awesome game!	5	9	1.0.2	2017-12-02 19:43:14+00	\N	\N	gp:AOqpTOEstflPtNSnd-eNtLx__JMfWbt5st4JgDzRrVhD6ywCXtehNT8zaCtkCJZSD8K6Wh-A8-klmQEljVuK	5
529	Favour Amobi	https://play-lh.googleusercontent.com/a/AATXAJxNSmJ8icTdwiaSIluw4Z-ELC63B5FrUlUHmmSK=mo	it's nice, no unnecessary ads and all, but it gets boring with time... nothing new on it	4	10	2.7.3.2	2021-08-05 16:31:24+00	\N	\N	gp:AOqpTOGivGWTqTnyZ3eibCOc6jeazwmg6BN25BAFl7xcIy2xGEDryrZfpd5vq463geD-pIPPFyxSXdVph93PNg	7
343	its.mishka_jessica	https://play-lh.googleusercontent.com/a-/AOh14GgDisKoPqqLznuksMtZwxUvzq1Jd47-ZgmI3GJ5	The app was great at first, but now it crashes every time I try to make and upload a video. I have to retry 6 or 7 times before I can actually make the video, let alone post it. I've deleted and re-downloaded the app, cleared cache and data, but the problem is still there. So frustrating	2	2131	20.6.4	2021-08-08 17:36:12+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-11 15:19:26+00	gp:AOqpTOFDgs9BXuHmE8CxkEv3BAgxEHVzomilqUKflPzlhM94LVxVLOyshhBMJjZ3W0nRb1wOOuHkqRRqEE_0dQ	6
344	Yasmeen Shabana	https://play-lh.googleusercontent.com/a-/AOh14GiJ5T-1tNoYcl5eUWkLMox_Ju-iZm3XtMgrFnX5ZmM	Crashes everytime I get to upload the video. Then i have to do it all over again. Many options are missing. No option to go live. No option for text to speech. I sent help request many times to tiktok through the app and I never got an answer	1	1841	20.7.4	2021-08-09 07:00:34+00	\N	\N	gp:AOqpTOHNlga9XQrPbAyYV1J5kV0B1Z7F80eqHbDabGpFAO7vns3RFJ5CUWFQblsq_PkDESqTVXZ9FoQBEkPRcA	6
345	TheXmslui Maua	https://play-lh.googleusercontent.com/a-/AOh14Gi9epypSz8D-tELZMPOtNzvsmEb1UaQBQOxed0	I can't even see my own tictoc videos that I liked, it keeps displaying, "Can't load.Please try again". I just really want to see my liked videos but I can't. Even worse I can't even go to notifications It would reapet the same thing.I tried restarting my phone and wifi and no success, it would say the same thing, afterwards I'm not even able to see the For you page no more, it would also say the same. So basically tictoc is literally unusable anymore for me, Can tictoc please fix this!!!!	1	781	20.6.4	2021-08-08 23:09:04+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-11 15:20:06+00	gp:AOqpTOEAAh0aWP1wIiMMr3x0Uru6b9VUj6rKqbDmUuOfyTeAjmWmU987Z_Oo9X_2bWh8S-AiZxhJSh9woeFAAQ	6
346	cory spencer	https://play-lh.googleusercontent.com/a/AATXAJzonhS6dxr7MB_Zhsms7x9Ta7ruYteVCUvHYcFb=mo	I feel like this could get a better review, but my fyp keeps showing me literal children.. and I've had to continuously go to a child's page to block them from showing up in my feed.. I don't care about this bubble pop trend kids are doing nor do I care to hear the thoughts of a 6 year old who can't articulate the different between his juice box and apple sauce. I also don't care to see ANYONE on a live feed. It would be nice to be able to stop them from showing up all together like an opt out	1	1474	20.5.3	2021-08-02 12:33:54+00	Hi, thanks for choosing TikTok, your feed is personalized to you based on the videos you liked in the past. Be sure to like videos to see more similar ones and long tap Not interested that you don't want to see in your feed, which will quickly influence your feed with the stuff you want to see!	2021-08-09 08:54:04+00	gp:AOqpTOHQBAdjeQHfEuCAnfZAL2hXddcSCczh5SyxVMcmgWut8vjtYNSAPPA9ZZ79q9lAros0KIW02Bn3ioQ3SA	6
347	•Snowy Sophie•	https://play-lh.googleusercontent.com/a-/AOh14GjpN2ueBRYgGjg0R5Ix9v9Oy9n5TD6SfO1Uxl4SFg	I personally love this app! But I have some suggestions. 1. I think it would be nice if you make it so depending on what you post certent videos pop up on your for you page. 2. You should make a friends only button at the top of the for you page so you can see videos that only your friends post. 3. When making a account you should make it so you can save your password so if you ever accidentally log out it and press "I forget my password" It suggests the password you saved.	5	879	20.6.4	2021-08-08 00:14:33+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-08-11 15:21:06+00	gp:AOqpTOHgUFJn4Y3dVK7yhwdpBfzmqUxoysamBOCBJajYb7AQKBKu1HkCf7ldfmUTMPMquor3Fc4Jlt4GR8PiiA	6
348	Seth George	https://play-lh.googleusercontent.com/a-/AOh14Gi4YiYD62VHUoj8W0leGUAXWM5NYalcz43i7KZX	The platform itself is intuitive, and picks up on content you might like super quick. The people that run and manage TikTok are racist dirtbags who censor content from PoC while actively promoting racists, homophobia, fascists, and dis-information sources, while in the same breath, gas-lighting PoC and marginalized communities with ads about "We support you". Move to another platform.	2	157	20.6.4	2021-08-09 00:46:45+00	\N	\N	gp:AOqpTOH5psy-iG8i0bPKAo3I-M_Hp62BDydX76W4rODgkrl9r0tyqP_EUKj2Qv-CbGINTWslFD-ZdY5F2uX--g	6
349	Amber Whatley	https://play-lh.googleusercontent.com/a-/AOh14Ghpf8To2Cuw4uXh8_TjuC-3z861cUN8CEPYzDOKDA	Says I have no Internet access even though I've tried 2 different networks I can't look at my saved or favorite videos very frustrating when you saved something to show a friend, let's me watch video on following an for you pages but I can't look at my saved GRRRRRRRRR, an the app won't even work to let me give you feedback so I'm here.. I've reset my phone twice...and I can use Internet on the rest of my phone.	1	88	20.6.4	2021-08-08 23:17:37+00	Hi, sorry for the inconvenience. This issue has now been fixed by our product team. If the problem persists, please don't hesitate to contact us within the TikTok app via the following steps: 1) Go to your "Profile" page 2) Tap on the button on the top right corner 3) Choose "Report a problem" on the "Settings and privacy" page. Thanks, TikTok team	2021-08-11 15:21:35+00	gp:AOqpTOGao4KfXehO6mRug4pOo60yfR9fDmK9Z0iPxCTFzjwJQI_B4smAYat7Ij9QE62ST_JTty106ttua_0gxQ	6
350	Dark Gregory	https://play-lh.googleusercontent.com/a-/AOh14GgoJViIfi1OpOhWzygFahz0mpAxRty7cmKjkeMi	3 stars because of draining battery in background (in foreground it also consumpts too much energy) and because of not proper work of notification, for example, I get a notification, then I leave app, then open it again and get the same notification again. Maybe it's because I forbid TikTok from running in background but still it's not good. Still I love TikTok, just don't like the app. Also ping is 550ms! This is horrible. And customer support is bad.	3	378	20.6.4	2021-08-08 12:06:35+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-07 11:01:39+00	gp:AOqpTOG5oZkJCO_PQsNovi-BOLOaz6b2FvEO575joiLbjpWP5G2X3OMNS7egefAORRZnL9mfjoX8bkvpba2h2Q	6
351	Mitch Nelseoni	https://play-lh.googleusercontent.com/a-/AOh14GjzbRuUvk5nK_yOCZh3kUB3zItl2pwgNNkalxXGoXM	I use this app quite regularly, very politically ran. They love to remove your videos or audios because people jealous of you report it. Appeals hardly ever get a response anymore and they STILL havnt made the slightest move to make the slider bar easier for the timer.. or maybe look at the competition such as likee and see that when you stop recording it leaves a silhouette of exactly where you were so you can line back up. Simple things could make it better... seriously	3	177	20.6.4	2021-08-08 01:26:37+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-08-11 15:22:19+00	gp:AOqpTOG27V62Y3-vEm1Ufe6lNtT8-SH9YKVmr35t4gSt0yjwUw6nLBpj2HHpa2zcALj6-ryA8NqL7gFPgPrXKQ	6
352	Kerlina Amilka	https://play-lh.googleusercontent.com/a-/AOh14GjSKPHXtdHXPrvsBHR2u8va4Ky-aUfOuYm2qyHM	Its like, a GREAT app n all, but the problem that this app adores...is not quite funny. 1. The lag. When I try to scroll it literally throws me back to my home page. 2. When I press 'Follow' it says i followed but the next time i log into tiktok, it "unexpectedly" unfollows. And 3, I cant use some of the sounds like it shows that it is loading but all of the sudden my "internet" is unstable. These problems are getting more and more ridiculous. Please take a look.	3	1173	20.4.6	2021-07-27 01:58:22+00	Hi, sorry for the inconvenience. Please try to clear the app cache and restart the app or device, then switch between Wi-Fi and mobile data to see if the problem is related to your connection. If the problem still persists, kindly provide your feedback here: https://www.tiktok.com/legal/report/feedback so we can look into it. Thanks, TikTok team	2021-07-29 05:53:48+00	gp:AOqpTOGci-HluiRTOB8TxRmChnG5jU9RUf7N2Og-7mhx9Fad20dIG3v0MHdDFuQcwIMIlY4hfS_dgiHqhdCdRw	6
353	Aamir Yaseen	https://play-lh.googleusercontent.com/a-/AOh14Gi0VNgcsqYXfWGgHR9-WgyPK0UbjQa6PeNbihoQMQ	This is realy a awesome app but am giving 4 star due to only one problem. We cant edit after video posting, even some times spelling mistake occur we cant make correct after posting... Please guide me if this option is available.. one more thing give the option of text to video converter .....	4	142	20.7.3	2021-08-07 19:42:23+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-08-11 15:23:25+00	gp:AOqpTOFbEviC5yMHUBUM_t6BoQbw2ojqn2IHi1T_tyDD9-QhwFRpy4Ap1v7P7bCHx9xvHy3iq_YQe3NwKgiXGQ	6
354	Cozydozy	https://play-lh.googleusercontent.com/a-/AOh14Gi2amsuSBx2Irgfuv5sok_9yzBbu5ONaUpZqb8hCg	It's an amazing app It's got many great things such as videos,sounds,hastags and a good way of communicating with others threw messages. But even though it has all these positive qualitys there are some negative qualitys too such as Not allowing you to follow a certain amount of people (10,000) ,telling you your tapping too fast,theres lots of adds and when you report someone it doesn't really help the situation so you end up having to block them which still doesn't really help either.	4	1204	20.5.3	2021-07-29 18:52:47+00	Hi, thanks for your valuable feedback. We listen to and value your opinions and suggestions. If you find any inappropriate content, please report it within the app. We will review the content and take actions immediately to promote a safe and positive environment for all our users. Best regards, TikTok Team.	2021-08-04 07:08:47+00	gp:AOqpTOEf2sfsj5MlgzCbqvlAiRfjcWUEhCp7st5kWtM6zDBCWGkOus1QlbCOcMVVYxZsUZAd5SedHg0GL4O38Q	6
355	Eli	https://play-lh.googleusercontent.com/a-/AOh14Gi7wZzhqS9oX0uu4pKPKXGNbaHizYJ7QqhXr6MQ-g	Hey tiktok! I really like the app but I recently tried to sort my marked videos into categories and I find I really difficult to remember which one is sorted into what category. It would be really helpfull if there was an option in "all favorites" to see where they are sorted in and maybe even to directly move them from there into their category. I hope you see this and maybe include this in the next update. ^^	4	581	20.4.6	2021-07-26 18:20:59+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-07-29 05:53:12+00	gp:AOqpTOGV2LM1pPESSLTkhp4qxGyEt7-JHOYYiPashs4dZoacFc8vY80xUk9_tbfNaaNF_BcqDl-YjSuWeRBgVA	6
453	Makayla Buffham	https://play-lh.googleusercontent.com/a-/AOh14Gg60EweRpVKPrO69TeLNB0BecVLJVC106AaXNjpbw	Right away I saw (after a little bit) it said "I can't hear you you NEED to turn on your microphone access" or something like that. So I am uninstalling it RN because I don't want a person to hear everything I am saying when I am playing it!!!!!!!	1	1035	2.7.6.7	2021-07-25 03:01:14+00	\N	\N	gp:AOqpTOGFFwnun8L6ReLl929T-ntMrmb-39hthWf2d2tb6_Cp5k8Ly9QgFg5ijhngD31BnjHn8uEWnSjL_k7hkA	7
356	Zelda Forever after	https://play-lh.googleusercontent.com/a-/AOh14GhiLUHc7sHkdNGeLZcmYJIXMDBUIKkyETF3flSHOg	I really like this application it is very entertaining but for some reason, it really lags when i first open it up. And no updates comes to my phone like skipping and the ability to shoot 3mn videos. Please fix this. edit, i am now able to shoot 3mn videos but the forwarding feature isnt coming to my phone. However, the app still lags so much when i open it. Overall, for now its good ig.	5	726	20.4.4	2021-07-19 09:57:12+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-09 08:55:34+00	gp:AOqpTOEkGIy63LVO5Jip3lA4FTLhuPMBcAbFDmKRMUF8i0P_KJMRSkNloAOYCEbSe1sWlvHgKshc1LmZ8lrCeg	6
357	delala bet	https://play-lh.googleusercontent.com/a/AATXAJyFJhJw8I5x_mjbfn-KQaQYZwr3aQQ1JwvWKgM=mo	I have had this app since October 2018. Love this app. It's really fun. You can post videos, make new freinds, and most of all scroll the fyp to find videos that you love. Best app to use when your bored. I personally love this app and recommend it to anyone who hasn't downloaded tiktok yet.	5	117	20.6.4	2021-08-09 01:09:27+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-08-11 15:23:49+00	gp:AOqpTOEaWCxOGXmoM03cKdjEzl5T-sf3vzQUe3UQov7IH8hgGpOccbI17FhpVu66DB-m5nrlBTsCFYJH1e-vfA	6
358	Itx Arru	https://play-lh.googleusercontent.com/a-/AOh14GhMj8HVh7oPGbYXrLDXmNSkuFDJFB69oiLNXwg	Overall the app is awesome. But there are some things to be improved. The one option I'm suggesting is that the option of pinning up own comment should be available. So the message in the comments you want to convey that is pinned up, so commenters may see and the message is though conveyed ! Thank You 😊❤️	3	41	20.6.4	2021-08-08 15:57:25+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-08-11 15:24:14+00	gp:AOqpTOEMAR9qhQwDZ0ns61U7Q3z41k_6TiHR88WIxv7QaCGKgGUSrNd56mwNMfSbG6AJADm6Gyq3yzhVjxOFhA	6
359	Fataldeehee	https://play-lh.googleusercontent.com/a-/AOh14Giz0uX0D7VN_gC37TD7IbL6Er4iHQ2-TT_BhAnlog	This app is my all time favorite and I love everything about it. But what I would love for you to add in it is where you can organize your favorite videos. Where you can create and maybe possibly name different sections and add as many of your favorite videos to that section. Thanks so much and keep up the amazing work! 11/10 recommend!	5	896	20.3.41	2021-07-21 20:21:46+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-08-11 15:24:24+00	gp:AOqpTOHT_9oHksBDUEgL1CKSaydBDCxYjkOCKDgpRxoRqBAkfsyM2WMTG1rse1dfjVGx34TyQvLU0qOkfdlbZA	6
360	Xtreme warrior	https://play-lh.googleusercontent.com/a-/AOh14GiqaZ1U5Oljga9W_MVOw8_eAgbRcSZy0k5WeHfSKhQ	A lot of nonsense are posted here. It is so annoying sometimes. It goes viral too, meanwhile some videos do not get the same attention. Time management should be set lower than the current minimum. Liked videos should be put into folders (just a suggestion) so as to find them much easier if the user needs or wants to.	3	756	20.4.6	2021-07-27 02:24:13+00	Hi, thanks for your valuable feedback. We listen to and value your opinions and suggestions. If you find any inappropriate content, please report it within the app. We will review the content and take actions immediately to promote a safe and positive environment for all our users. Best regards, TikTok Team.	2021-07-29 05:53:25+00	gp:AOqpTOEhXP_9rinkNX-rUIl002wsxJ_HTsg48Ius_d45EFX8G_LEkUsR5_aoRvr5dGekyoY5t8rIjE2oj6j9Sg	6
361	BeckyD	https://play-lh.googleusercontent.com/a/AATXAJyGz_C791-6QETlUDIF5JtJvSqq0WUa9hOSUn2N=mo	I enjoyed the videos I watched but I couldnt easily see how to "save" the video like at YouTube(where I spend all my time,LOVE IT🥰) I really like that ability & having a Library. Maybe I can at Tik Tok but I just didnt find it . I was tired, will try again.	3	54	20.4.3	2021-08-07 21:06:23+00	\N	\N	gp:AOqpTOG7arqiQEJuGHhLRMuGebLb_SXY1Kt370sVjTSUUpeARim4vDTqySXvndNCyrEF-FWIKU0EMDqaN-FyLg	6
362	Danielle Miller	https://play-lh.googleusercontent.com/a-/AOh14GhI_2-id6RGbITFLM-iMdgz0yPDFQvjfdJJ1AWnkw	Updating my review bc those issues were fixed. However it still uses screen record instead of your phones camera when making videos and they took away the learning initiative in January. Since then the quality tanked. A lot of misinfo that isn't reportable. You can't really block either! There's a button for it it just does nothing!	2	647	20.3.41	2021-07-20 19:39:27+00	Thanks for reaching out. We're aware of an issue with Android System Webview that is causing issues in accessing apps like TikTok. Updating Webview in Google Play should resolve this issue. Thanks! The TikTok Team	2021-03-23 14:44:02+00	gp:AOqpTOFOQIqxFfhVXxFbQFh01qAuR3KLdLEPdNCUAD6Mqy6hk_0olCiwlfhZMFRsxKGId8RKDtNkL4VXgmFBvQ	6
363	Flying Pig	https://play-lh.googleusercontent.com/a-/AOh14GioULjuzPQTyeYL6EH1IDeqPpOKrnVkYZsyV1zfqw	Idk the app itself works great, but the constant flagging of creators who genuinely do nothing wrong and the privacy issues (why do you promote my page to those who have my phone number saved) is a bit of a bummer. It's the app of the year... But at what privacy cost? I get that even having a google account is already compromising that but at least don't shut down people for doing things like talking about their experience at an unspecified makeup store. At least I'm entertained...	3	76	20.6.4	2021-08-06 07:58:55+00	\N	\N	gp:AOqpTOFEl-sOihw7zHBL1xl05beYjb8I1A7HkLtKNRM-sUXDGHMouBn5Wc-RC3zydpLpfFEyvPR66Fy8GqTfcg	6
364	Izuku Is baby	https://play-lh.googleusercontent.com/a-/AOh14GiqVWGwhNk8XG9B4qkOahagUCzMncfx-0NZhQV4dA	This app is great, and is good for socialising, and is a nice platform overall, but my problem with it, is that my account got banned twice, even though I was following the guidelines and restrictions, which I am honestly upset about, with the random banning, please fix this issue as I don't want to make a new account every 5 months	2	23	20.6.4	2021-08-08 10:01:47+00	\N	\N	gp:AOqpTOHh3y-BnE3An4TFApDRCNZv3pUgpXjGYUZRiEvEf0rv-IodGDUoyoUfK8oaqPfi78dma5ueaNVNhe6fcg	6
365	gwyneth patterson	https://play-lh.googleusercontent.com/a-/AOh14GhMQ33fJujAJb2zsDtsYziEd4OPpRc6uONYNgvu	Well, I just got a new device so im trying to download Tiktok, it works, but it keeps stooping. Like when i click it it opens, then closes. Idont get why. Its one of the only ways to talk to my friends. Hopefully its a good app. Over all that its a pretty good app with amazing creators. Maybe if it didnt do that weird thing it would get 4 stars.	2	30	20.6.4	2021-08-08 13:38:20+00	\N	\N	gp:AOqpTOHH0gNOlfAs_HtvPRnv56u16y9Fn8dJ0-3pqZrNd69SJaLGTGKBd0hpQjnNJR54cojvsX7RDxR0RMVo-A	6
366	Lerato Rangongo	https://play-lh.googleusercontent.com/a/AATXAJzHOSFeZ9inyB5E10tLxkTCwKm8H_jlvnVkdo9H=mo	I love this app quite honestly but I'm having a simple problem of taking videos with this is app, the videos glitch way to much it's very unpleasant to watch or even make. I too would really love to be a TikTok content creator but taking videos is challenging for me. Yes, I've allowed for camera use but I seriously would love for this problem to be fixed.	3	73	20.6.4	2021-08-06 21:50:25+00	\N	\N	gp:AOqpTOH61w3zpNV1c_a2oqTnTL61dAZo5k8rhrdA7ZM_J1kZn2gQFUhr6PnKhDM2e79e0VZONTHkbIqjWZrXWg	6
367	Idiot Fire	https://play-lh.googleusercontent.com/a-/AOh14Ggwng3VIUp-Kgv_IfTf8M76DHdGirfhEntYzbSB	Okay. I'll admit tiktok is amazing, I have used it many times - each time worked perfectly, almost. You see I am experiencing a similar problem that I had the first time I downloaded tik tok. And, this problem is the fact that after putting in a password that fit all requirements(e.g; over 8 characters) i had pressed 'Next' and it came up with a human verification. Reasonable. after completing said verification, nothing changed. nothing at all. So fix this. Please. And now.	3	531	20.4.6	2021-07-23 13:08:53+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Tap on the "Me" tab and go to "Sign up" page 2) Tap on the "?" icon on the top right corner. Thanks, TikTok team	2021-07-25 14:31:35+00	gp:AOqpTOE5i_SjmQ4T8Kzio2Nc6N8cu9OVu6AnMUfj5v3FXv1f8wTQ8MQpk6Eqxtw5D6YTth-iOdJvjt_Z-0Tz8g	6
368	CreeperWither vlogs	https://play-lh.googleusercontent.com/a-/AOh14GhSP3-XxB0A0PpZkud8PrENYI12pXKsD4yQR0n7hQ	This app is amazing, like when I say it's amazing, you will lose your whole day watching one video on this app. It may feel like you watched only 3 videos, you watch 300 videos. So make sure you download this app if you haven't already.	5	62	20.6.4	2021-08-06 15:07:41+00	\N	\N	gp:AOqpTOFk4l6RnsDx7Al4k1ur3BtKIEZlE6P4Ps06sRy7qYI2zdBl-6PGIUfr0cbiF3wEna3fn0d83tiA-7idjA	6
369	Don Zombie	https://play-lh.googleusercontent.com/a/AATXAJwNyUU85yrZemWQwLtvQhYbUk1a9vI5PY8Ec1Ss=mo	Great app, informative, entertaining, but it's also a direct gateway to the disparity of HELL, n just like Satan, it will suck ur soul down if u let it, starts out great, u learn how to strain 7 types of coffee from Peru, or how to make baskets from used pasta, Hot Women dancing in underwear, next thing u know it's 4am, wife n kids left u n u have 2 be up 4 work in 1/2 hr . ." just 2 more videos, I swear" anyone remember the 80s ? the first hit was free, Crack, now E-crack, big rocks n ticktoks	4	233	20.3.41	2021-07-22 20:37:12+00	\N	\N	gp:AOqpTOEP-qucwRDDajcnxr-mv9JBlIKfGqe0F-Qe4X-ypjAIMXK7NnRlzT_nRdp4kZY2Pox3AajVjzOzshW0Qg	6
370	John A	https://play-lh.googleusercontent.com/a-/AOh14GjRF9kuAnGtznDQ86K-I0pYSzFPbU5vH7vB8yKnkw	The software is excellent, has never crashed and I use it profusely. You can make make videos and post directly from it. It has amazing camera effects, including greenscreen, facial tricks and so on. I highly recommend it to everyone.	5	49	20.6.4	2021-08-08 21:56:55+00	\N	\N	gp:AOqpTOGc9tzFOOCL--UV2E57-R_aL0tUHhnKvweRFOKKxJ_tDPqxB5bDjeJDYnP8qKUgpwxNo86HHmKMV9neHA	6
371	Jill Millington	https://play-lh.googleusercontent.com/a/AATXAJwqzhHYnC915LSDvwXYS1Wk2k2PA7OE5eQLV8um=mo	This use to be a very good app, now it's just not as fun. There's so many adds and updates that don't help if anything make the app more confusing. The thing that annoys me the most is how when I post a video, it's pretty much a 50 50 if it's gonna get taken down. 99% of the time for no reason at all. I'm starting to drift away from this app.	1	487	20.3.41	2021-07-19 07:14:41+00	\N	\N	gp:AOqpTOHksDCD3kS3jvat1eL1__gDNV7cqoiKI47TjVDeAin-l0t5fbvyGe8A8PfAfOBCYwgv4Lo-bGt3w7S90A	6
382	Casey L	https://play-lh.googleusercontent.com/a-/AOh14Gi8weqsg-o5_s3XLyZ5iGWeK_vaE4v7ayOZ5qLUCg	Absolutely love it. I thought it was only for a certain crowd, but it is for everyone. I don't think most people understand the power of this application, it is amazing. You can reach hundreds, if not thousands of people in only one day. With just a simple message the implications of this are astounding. Not to mention the business opportunities that someone is able to harness with this easy to use platform. Wether you create art, or sell products, or you are an affiliate, this is a must have..	5	193	20.4.6	2021-07-28 19:32:59+00	\N	\N	gp:AOqpTOGIwHFQALvZVwEoBmQk-rc4TLgGvfXGdjVWm5q6Imru3Dt4WBQ4pFGW6OOg6M_F9Ny1Nd8EnWGR1zesbQ	6
372	Trent or Whitney Bliss LeGrand	https://play-lh.googleusercontent.com/a-/AOh14GijdyvmOgLX_Wg5V-ulBHXILkPtvx6TAvP7Sqh1yA	Maybe I love it, but it's not like it's so perfect. First of all, I barely even scroll through it because half the damn time I scroll down, it's literally still playing audio from the other one & also when I want to use a sound like my favorite Juice WRLD & XXXTENTACION songs as sounds, it literally doesn't even do the part of the song that I like, It ruined Juice WRLD's Song, "Let Me Know (I wonder why freestyle)" & Ruined XXXTENTACION's song " Hope". Please fix this problem TikTok, please 🤬	2	1145	20.5.3	2021-07-28 05:24:20+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-07-30 08:50:57+00	gp:AOqpTOGGcUEU0tPc09n7I9vITdgIqVEnBWRnVa-5Q0_hcdC7-S4Gj1piQkDAehWzcD1oVsKMU-725ycw_L443g	6
373	Enija Daksa	https://play-lh.googleusercontent.com/a-/AOh14Gg14QFJeF2kd5XjJ96wX6APvDUN-_3_lTXCcE2UOIQ	Really enjoy using this app, but I'm upset as I just lost 3 draft videos I was working on for a long time. My phone was bugging out when using the app so I reinstalled it only to find out that the draft videos for some reason are NOT on your account and are lost if you reinstall the app. I lost what I was working on and cannot remake the videos. Please Tiktok update the app so that drafts can be saved to the account, not on the phone	4	23	20.6.4	2021-08-07 19:15:06+00	\N	\N	gp:AOqpTOFMEJyk3mJzJWus3_MEX3L30ILjEihTxV3lGONTNB3H16MAFBOgVGILNVDJvWm_lIir62K5oINjCbUsmA	6
374	Sarvante The Christian	https://play-lh.googleusercontent.com/a-/AOh14GiNyvUsDEw1GWtujyiYMahnhRKO_OXIQbcoFoWwxg	I love this game! But there is this..Problem. When I try too make a ALT Account,It makes Tiktok seems different. Like You can't Comment on a Video,You can only Like. Can't share,None of that. You can't even really Change your Profile Picture. Is this supposed to happen?	4	9	20.6.4	2021-08-08 17:56:18+00	\N	\N	gp:AOqpTOE5f1dOhi5Y8gdKG-wN1GYklw-QHE8kZBM5fYuOaMcT3d8QX5nXoXhfKJaeGsGgjtUzAcPbd31fIOHZMw	6
375	Deightah	https://play-lh.googleusercontent.com/a/AATXAJw8EZz7KoCTYnMe7dA0yw8Ch0zZbzXXa36FQjsv=mo	This app is great for quick info, each clip 3 minutes or less and if you want to see more of that content, easily achieved. The ignorance is strong on the app platform, many speaking before thinking, some being just out right wrong, tragically so. Trolls have found bridges here for safe harbor. Reading comp is not getting any help but Grammer Nazi's flurish. Serveral complaints by creators about removed content for violations where none exist.	3	470	20.4.6	2021-07-22 13:26:45+00	Hi, thanks for your valuable feedback. We listen to and value your opinions and suggestions. If you find any inappropriate content, please report it within the app. We will review the content and take actions immediately to promote a safe and positive environment for all our users. Best regards, TikTok Team.	2021-07-27 08:59:37+00	gp:AOqpTOFkMXnHGCUOtf_b1UWZZUS9-0c4xypurxQMCasXaZzwxU63wtpNrwX1C1kcalVsDo0GLscZ6QLl2OtSLA	6
467	Pragya Nandi	https://play-lh.googleusercontent.com/a-/AOh14GiFQfYXIKBoIS9uQ4AdrlvIvudVxZ0S8gXL7OQA	Awesome game 💖 Lots of varieties in one game... Not at all boring... Helps to pass time and refresh our minds... It deserves 5 stars obviously... Best version among Talking Tom's, Talking Angela's, Talking Hanks and other talking games... Loveliest it is... ❤️👌🏻	5	786	2.7.6.7	2021-07-19 04:31:27+00	\N	\N	gp:AOqpTOHGxrhWDGIa6pRT15pl2pygUdAY9leGIm6sGK9vRToPCWE8rejVfF7azPOaJ8EzyscqHh-1H2t4uLJo1g	7
376	Sandra Joseph	https://play-lh.googleusercontent.com/a/AATXAJzGJqkPwS_dGVr1AC_EDx74dIG-ggNPnnhLvxaeCA=mo	The new update isn't working very well the liking part of the app isn't really working it's been two days and it's still been saying "you're clicking too fast slow down" this does get really annoying and I can't like my favorite contact creators. I would appreciate very much if you could fix this as fast as possible.	3	537	20.3.41	2021-07-17 16:19:26+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-07-20 08:54:46+00	gp:AOqpTOG03O69ityZZimTMOEsnaut03YToztszxSHXECOw5MWZ3-AvjWnvUghKo2kvoH2NYgzGo8y2pnSPQKWcw	6
377	iiShark_2004	https://play-lh.googleusercontent.com/a-/AOh14Ggwx00mmiAmovYV4X2s1ley4Y2t8g27VgSXAMvILg	This app is good, but sometimes i follow people by accident. There should be an options asking are you sure or just remove the button from the videos, and only allow follow on the user page. Another thing, theres should be a thing where you can reply to videos people send you. I can't just say all the things after my friend sends me 45 videos. But overall, the app is good.	4	475	20.4.4	2021-07-19 20:03:16+00	\N	\N	gp:AOqpTOH4zfzYGiIxksebzxF3RaGevlFMtObRVwj76p2pCYo81lCzzGMo51za4W_8mDhGLXxK0v-1UwO9SwmLDw	6
378	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Ok this is ridiculous. It has been 3 months since my last edit and what do I see? Still no dark mode. Please TikTok, give Android users dark mode. It just feels unfair that iPhone users have it but we still don't. There are so many reviews asking for dark mode, that there's a section in the reviews called "dark mode". Just look at all the reviews in that section, its a lot. It feels like you are treating iPhone users with cooler features before Android gets them, its just not fair.	3	765	20.3.41	2021-07-16 16:06:11+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-07-20 08:55:36+00	gp:AOqpTOEo3x27BlRwajl6bx0qAbl0wkwQIVhm9nEGh93YWfGcvahK7Y0kCikZS1n-vMbKFhM6c9w3Her1gP_Gjw	6
379	Angela Alvarez	https://play-lh.googleusercontent.com/a-/AOh14GiIQYIgU1Z4CW7fZXp_j1a_hevCYGkIY2QPm68Jpw	Love all the videos and the creators are often really talented with hilarious content. But the whole community guidelines is what absolutely kills it. And i know im not the only one that feels this way. You can post a video of someone twerking with their whole butt in the camera, someone can go live and twerk for everyone to see. I can send previously mentioned twerking videos to other people. But god forbid, i send a MESSAGE that has the word "twerking" in it, and IM the one breaking guidlines	1	806	20.7.2	2021-08-07 13:12:06+00	\N	\N	gp:AOqpTOELFFbj7FZNofMcUrzoNDzRg9bBJ_iakRxsY7nDAjSdhTFH8N5CKL4U0neg7pVz3oGbW-qUmMc2o0fTbQ	6
380	Caiden Zachariah.	https://play-lh.googleusercontent.com/a-/AOh14GjBN2YRxnisANxW05QYIEytgfYQ7aBxAL5ViMKkvho	Personally I give this app 4/5 stars. I feel this way for multiple reasons. I firstly love this app because it is very fun to use and very time consuming. A downside is that you can't use dark mode on android. that would be amazing if the company could add that. Overall, incredible app!	1	207	20.3.41	2021-07-22 08:20:13+00	\N	\N	gp:AOqpTOHgrwCsda4X-iBdfAxEcSpizvZz-Ze3gi-bayIG91LdT5hrUV26KeEi5whtEcQz4Kr_twqpeePEqI8Ahg	6
381	Graham Klatt	https://play-lh.googleusercontent.com/a-/AOh14GijOz1XkgVj_y5SwA2B_pHwBbj_hnzvwSuZgTmXUA	Overall good app but they really need to do something about the awful and easily abusable moderation system. Several accounts I follow have been banned due to trolls mass-reporting under false pretense, leaving them with no means to appeal and with no access to their accounts. This all happens while the real offenders get away with sending actual death threats and absolutely degrading comments to anyone out of the social norm on this app. Do better.	2	172	20.5.3	2021-08-04 17:25:51+00	\N	\N	gp:AOqpTOFMK9D-VARKN9RFr4wjL2AfcN0VIn806YvQky1wyae-CwZYj8TnYeSUHN04ClqOwO_mg2zo3avEG6MQTQ	6
383	Solar Sammy	https://play-lh.googleusercontent.com/a-/AOh14GiUOXQLGyov23IEWlyGE292vxYV9_hD3qMNG6RALQ	great app but needs to have actual people reviewing appeals and if reports are valid. im not over the age of 18 but yet someone (joking or not) reported my live for "inappropriate behavoir" or something. maybe it was the music i was playing, but i dont understand how that was a problem, it was NCS and royalty free music. this was on a Grow live i tried doing. should i not try to help people? i think its a misunderstanding, but i cant defead my case because i didnt know what it meant by appeal	4	740	20.6.4	2021-08-05 14:15:40+00	Hi, if you received a notification from TikTok that your live has been suspended, it means that your live may violate TikTok's Community Guidelines. For more information, please go to: https://www.tiktok.com/community-guidelines?lang=en, Thanks, TikTok Team.	2021-08-07 10:56:29+00	gp:AOqpTOH-4VTqskcBHiXI0jBZpZSEsmPPg-x-iooWsvbK7xLEjfRrMGd2evdmWt6LNUGSUzOJMnnycekMzvYCdg	6
384	Brittany Guerrero	https://play-lh.googleusercontent.com/a-/AOh14GiWEh2qsOnJY6DcilKhizXzYP0r1ShUhQlj_S5z	I'm always trying to upload videos but then they look all blurry after. I tried everything. I turned off data saver and my wifi is fast so it's not that. The videos look all HD in my gallery but once I upload something it's all blurry, I even checked on another phone just to see if maybe it's just my phone but nope its all blurry there too.	1	523	20.5.2	2021-07-23 06:58:40+00	Hi, sorry for the inconvenience. Your feedback has been delivered to the product team, and we are working hard to improve it. Thanks, TikTok team	2021-07-25 14:29:47+00	gp:AOqpTOEFakmlwE8vQgCM3BvCNbMj1GeZT3rmvQMRBb-aoFCqd01iyp8fEqfDcbyk1Vs-1qk76V8Kjbfu1vBCDQ	6
385	Natallia Sidor	https://play-lh.googleusercontent.com/a-/AOh14GgWq7T1uvOR4XpSW8eJ0BUimlJCPps29urU9tERQuk	Allow for your users to set preference To choose language of For you page.Your buttons simply do not work and tie it up to users location or SIM card. You are dividing people instead of promoting unity. This app has a great potential to help people around the globe learn English.	1	28	20.6.4	2021-08-07 22:45:19+00	\N	\N	gp:AOqpTOFWsrpz6KiAc_FROeoQS9fS1LPUpTTWLwFNkl8dy20HwdNNioukiiBsG4CbZt-FHpxhKeMTWo-o3CcyCw	6
386	MBalamwezi MBalamwezi	https://play-lh.googleusercontent.com/a/AATXAJwHEesZlkOOylqDg8mDpTjkIPdi-JNwu-C_DnxO=mo	My experience with tiktok app is so very amazing. If you thinking of doing business or already doing,you are a creater or something, this is the best platform ever to go viral. Unlike other apps. You don't need to promote your ads. just understand the rule of game and you are good to go. Easy to use going viral is hard but also easy if only you understand the game.Personally I love tiktok so very much that I can't do without it.you wanna get paid,join tiktok now, Show your talent here.Good lucky	5	537	20.6.4	2021-08-05 12:41:38+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-08-07 10:56:48+00	gp:AOqpTOEjUlBLVujLgglk9DvdECiVnOb3GrfDgzD0nyn6WIwEqgDl-LaMZzs0lGEA9zqVomQKg-hgL3_Ova8RxQ	6
826	T Gen	https://play-lh.googleusercontent.com/a/AATXAJwLUej9LRn6zW6sQzxdL5czKgsXKKUBvrjtHoRp=mo	Useless app.	1	1	1.5.8	2013-01-13 13:06:20+00	\N	\N	gp:AOqpTOFCq7FNklISGAi4ixzyrfkPhQOnH7iFwi3f06NuV-zjaHwhZC8_Xkn6kqAiqS_Hk7juyqscqGRASqDB9w	3
387	neamul hasan	https://play-lh.googleusercontent.com/a-/AOh14Gg3HdmUTyq7zxoRS4Bj4-vMHSUk4_KGNasXkbEu	I gave 5 star beacuse this app is very good, funny and helpful.But i have some problems. I have made a lot of videos with a lot of effort but my videos has no views and no like. So,i deleted some videos and made some Videos private. If my account is freeze then unfreeze it and send my videos to Foryou for viewing in the next videos.My account name is @tuly763. Please help me please. I hope you will help me as soon as possible. Thank you.	5	2176	20.3.41	2021-07-15 16:58:16+00	Hi, thanks for loving TikTok. Our mission is to inspire creativity and bring joy to a global community. Original and creative content is highly valued. Come and check out our article with great tips for TikTok creators: https://support.tiktok.com/en/using-tiktok/growing-your-audience. Best regards, TikTok team	2021-07-19 11:19:16+00	gp:AOqpTOFcvBHkhGBV8xdkJS8Im5-AMzLW6lExCAjauaYa0pl7nHgbruBoeRSV1X10Aes6rOJncatoTJNM9YQDBA	6
388	Danii Paige	https://play-lh.googleusercontent.com/a-/AOh14GgPRQDImbb4PR1Hlth7iqpJlLTsDbBylCksqpGRIg	This is a Great app no matter your age! I'm absolutely addicted to it. It's become a huge help worldwide for people with mental health and confidence issues and has definitely made a positive impact on me personally. Its fun, silly and care-free for everybody. It encourages everyone to just have fun and be themselves and i think its a fabulous idea.	5	561	20.4.4	2021-07-19 03:18:34+00	\N	\N	gp:AOqpTOGGlt_G8QfBpQAtUzeYltT0MThoA9Q7GQBehCo1jJHcyhPf9bfs2leYaTxRVMPtSi3PmWpPkov84MeiXw	6
389	Nabeela Nillu	https://play-lh.googleusercontent.com/a-/AOh14Gj16ofmYcHTmGLKJ5wr42hUlxcRXfI9ft4RH20-zA	This app is excellent but... the new update that comed 2 days ago... I could not find all of my favourite music's in the add to favourite column.... it shows that the favourite box is empty.... Then I searched Smooth Like Butter Song From BTS it's showing that the music publisher has deleted/removed the song... I searched all the songs that were available on TikTok but it shows the same EMPTY... fix it!	3	209	20.6.4	2021-08-06 15:35:17+00	\N	\N	gp:AOqpTOGr5dd_mxrJfsaaKDpALs5EyQmMOAuLzdwl0EIcXJzijy1dqgNKYdmQRr5LnnG9XwAd2YwKTec39D_q7Q	6
390	KBear Animations	https://play-lh.googleusercontent.com/a-/AOh14GjZ7hGy4cxP7rKtPwGgsXH9Z9NeF_cdBWmGVNYFsg	I gave it 4 stars because TikTok is a great app and a great time speeder. I can talk to my friends and even talk to people I follow in their DMs. What I don't like is that it takes a long time for me to customize my 'For You' page again into the stuff I have interest now.	3	202	20.4.6	2021-07-26 20:59:41+00	\N	\N	gp:AOqpTOGLwPHney0wHsEwK_1pRTJx4L6lw3wzVVF0Od59IjsMIAbYVmJr8BSHlpUXtFdrtsAHDhtmYnbs8u04Cg	6
391	Teai Verity	https://play-lh.googleusercontent.com/a-/AOh14GheQ5OCk2aT2NPjY8FK0PO-i1kNR3p41nIji9WS	I have been locked out of my account because it insits that my internet is not connected but all my other apps are working. When it did let me on, it refused to let me like, look at comments or add anything to favorites. Please stop glitching every few weeks it's getting old.	1	18	20.7.4	2021-08-08 23:11:30+00	\N	\N	gp:AOqpTOGTRoMykUj911VmA6eQusr811yPg-wCUAXvvvu_2sBo4pBawVsKMkN3pd6b4STbGofwWLETBMr2DeJfSw	6
392	lily meek	https://play-lh.googleusercontent.com/a-/AOh14GjnaiUF8FMlDz4fgZVQ8GFAaeeL-LLe_0f3fwg3_0Q	this app is by far the best. coming from musically to tik tok has been a roller coster. but not only is this app fun to meet people but it's also the best app to post and see others content. i love it so much. its amazing. i would totally 100% recommend it to others. the community on here is amazing but can have its rough spots.	5	1902	20.4.3	2021-07-17 01:40:44+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-07-19 09:48:57+00	gp:AOqpTOFdYuShQwLcfNnqNRGEa-dX2zlhXuMuH2rmRzR2fgV7IfKhKOcBv7AfiM2YZh7tFMfXDrOlr8lBwdHyWQ	6
405	Trippy Tunes	https://play-lh.googleusercontent.com/a-/AOh14GjGhm3PcNZXqQo0AqME64slplaZImmwcah6dFqneQ	It's not terrible but it's definitely not great. It's toxic and kinda depressing. The app is very glitchy and there aren't really ways to fix it. It is incredibly fun though. You get to see a lot if content from things you already enjoy but you're also exposed to new material and that can open the door to a lot if new interests	3	311	20.4.4	2021-07-20 06:09:31+00	\N	\N	gp:AOqpTOEPh4FuAM0DjZ1iA_BYsXRkk94ljXhwr3luyxWYA8NOjth-16xDNpH_pA9T2vSpH2dTwhCN5ARp2s6Rvw	6
393	daringwolverin	https://play-lh.googleusercontent.com/a-/AOh14Gi0ErSjXMUiBXPBAwtziAqv1oMEEVHQBsvRPx8b	This app started in such a great place and seems to have improved overall. A feature that is desperately needed for ALL users is the ability to scrub through videos. At the moment it is a lottery system in which you either get the ability to do so or not. Also this app has no form of actually dealing with copyright since creators get punished for distributing original all be it riské content. Yet people posting literal clips of stolen content that refuse to name the source go unabated	4	269	20.3.41	2021-07-19 11:01:06+00	\N	\N	gp:AOqpTOESc3NI8gJV6YsVAR6Ym6svqL2Omd5Qxy9dGyDaJEXmYgdcG6-0vjIsehL8zFjFlRVjEQvtTOOCTvUd6g	6
394	Ceyda Şahin	https://play-lh.googleusercontent.com/a/AATXAJxnolf9jLVfN32LqcJ-wPQs8VXEqOW33k368KYa=mo	i really like tiktok and i use it daily, but iphones have more futures availiable than android phones which i find very unfair(darkmode etc.) My camera quality also gets really bad when k use the tinton camera even though my phone camera is good. You also don't have some effects in other countries which i also find very unfair, because for example you can't do a trend which you really would've like to do.	3	223	20.4.4	2021-07-19 16:07:19+00	\N	\N	gp:AOqpTOHDUXo8m6cAowJtvKEbuf-_LSks7oCMf_SWCe1g5aNYcJi6lxZFHb6gFPXsvSWl7ebr2WKBz2sVbt8PMw	6
395	ʀɪᴛɪ•-•	https://play-lh.googleusercontent.com/a-/AOh14Gj4QvdrepiAB6FG0QHY4gwPHLp_5LtzU8_ozIUO	This app is very good but the problem I'm facing for some days is when I open tiktok the videos are not loading but the others like comments, account these are loading. And my internet connection is working too but still it's happening. I can't even go to "Report a problem" or "help Center"cause it's not loading. PLEASE FIX THIS PROBLEM AS SOON AS POSSIBLE	2	1415	20.4.6	2021-07-27 02:56:35+00	\N	\N	gp:AOqpTOEA0wlxe17UR2rpYpoXOBGdcazKHfXoaYZYz0e5hQBg_f6pIb1pNgDZpONKgDjzWfB9m7rtaOKKhipDQQ	6
396	Itz_Smoll Muffin	https://play-lh.googleusercontent.com/a-/AOh14Gi54f0xc9m8cWEvinr2aNhUzN3ROt2R7RylvXqcUA	Tiktok is awesome there are some creative people on this platform. I uses to hate tiktok till I downloaded it and I've never been happier to see the passionate people on this app that work so hard to make content for everyone to enjoy. You can make friends chat like videos and even post your own videos. TIKTOK IS THE BEST APP TO EVER EXIST!!!!!!!!!!!!!!!	5	258	20.5.3	2021-08-04 02:29:01+00	\N	\N	gp:AOqpTOEWI6LkMQTpYeAU1YXPqCUEF_gQ7njf61BUlQ_1IDoE4Dmj0810BS6WToPJEb_JSQ8GbHrNizgec9bbzQ	6
397	Brad Fitch	https://play-lh.googleusercontent.com/a/AATXAJxFf7XZv8aVr8_AE7wufCEWR0t1yTGL5bfpWYcE=mo	I just wanna say, for the record, that I always ignore the things that pop up and say "would you like to rate this app?". But, TikTok my friend, y'all deserve these 5 stars!!! There has never been a single app in the history of apps that I have ever loved so much!!!	5	86	20.6.4	2021-08-07 13:44:13+00	\N	\N	gp:AOqpTOEJFjx_oE5IR5fQ_Q7StJxN_fsNHEBdXLLOTGEdZYsUJJ4QNwsKlpfpQRSdrGbt6INrwlQ_-KCFntyIuw	6
398	MrEmmanuel Mtyhuda	https://play-lh.googleusercontent.com/a-/AOh14GjhlfYFT7y29h8GmIa_uuqO7UUHrw9JzMI-m3VGmwI	The app is really great and user friendly but I think it's unfair that you must have 1k followers to be able to go live and they are losing a lot of people who end up hosting in other platforms where they don't need a amount of followers to do their live broadcasts. Some people have a good content with less following so they can't go live to share with their fans.	5	519	20.4.6	2021-07-28 12:24:26+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-08-03 01:37:26+00	gp:AOqpTOHKxf-ag_I9aWp4ijIPulpZwWPVxxjq_kz1CZ-Im2pmf1Zs3F76SjsC_ORw8YiLcuFWnhtaJFL6sgRYAQ	6
399	CouchPotato	https://play-lh.googleusercontent.com/a-/AOh14Ghp56k6_PX0lnZQE--SpZT5J2-CC5Q6Qxy7tEtY6w	Tiktok is great! It has a large variety of videos and sounds. It's super easy to use and perfect for any age, however TikTok is not very laptop friendly, you can't edit your profile on the website and you can't even look at it on the app. It's great for Mobile, but nothing else.	5	39	20.6.4	2021-08-06 12:43:35+00	\N	\N	gp:AOqpTOEYDgGRawjRfSOKbDOaxiDD1qAiiyDJjvpOaQlh3hIo6AbjbbayaQH0qSXleRncxubLNwvdx-n-7G60Og	6
400	Danielle Huggins	https://play-lh.googleusercontent.com/a/AATXAJzymFwIpPMGoR_KZq44XENvdMs7a_mib3uf13gu=mo	Wonderful app. I've never had any problems and I love the editing tools. Makes it super easy to be a part of this community. Ads don't occur super often and I don't mind them when they do because it's usually something I like, and if it's not I can just scroll out right away.	5	440	20.4.4	2021-07-19 02:47:18+00	\N	\N	gp:AOqpTOEj9TIlWLRWkLCtXeQJl4nQi6VhpTnI86Dp8DUx6Vhpn_fCjixcZ45vYlUO3aZ76bn5lkAVMqeAR8ZKHg	6
401	tommy brodie	https://play-lh.googleusercontent.com/a/AATXAJz3gQ_rRPJldfXcER4mlCmxM3PRO11_wxMLw5ob=mo	How can an app be so popular yet so useless at the same time. it takes about three mins to change videos, about 5 just to get to your follows cause it just keeps suggesting people (even though realistically that's what the for you page is for) all in all, I conclude that a toddler designed this app and clearly someone with no actual knowledge created the software.	1	230	20.5.3	2021-07-30 18:10:47+00	\N	\N	gp:AOqpTOEy4pl0wfi4VMrKblZaXYjqJMUevHuf2S5XgirWyUQj_h3rFOb4Kesrt3tihAAMb1d1o2TbCe29KWlzww	6
402	Caroline Madison	https://play-lh.googleusercontent.com/a-/AOh14GgoR0ByJmuGZz0DloDhQvh7wegpqzKBtijX8tOv6Q	The BEST, by far, social media app in the world. Easy to find a niche and has a great algorithm that aligns with your personal likes and dislikes and will weed out the wheat from the chaff. Anyone can create a video that meets the trends or is as unique as a unicorn. Be yourself, you might just become Tik tok famous by accident. I guess I'd say I'm tik tok popular, now, and that's freakin cool 😎 @itscmadforeal	5	353	20.4.4	2021-07-21 13:58:03+00	\N	\N	gp:AOqpTOGyDCaafCuqsnni3z3Zb2a4ZJssKaaMEbg7aX5JUelvg04sCsHLvfFhfbrj-DO0OGY8dWtCUJado_mEBw	6
403	Sarah Anotinette Russo	https://play-lh.googleusercontent.com/a-/AOh14GiZuWa_mTd3_lF_MstrNsmK_6FPh9UKAZ7CuK03jQ	Hate this app. Barely use it. It took up so much storage. Very inappropriate. Download it to see if my daughter was allowed install it. I thought it was appropriate, but days later there are videos with people naked! Please don't download. I don't even understand why there is even this app. It should get taken down. I personally think it's the worst app for the age is allowed for. If I could give this a 0 star, I would. Very inappropriate words in the videos and comments too! People can messageu	1	4822	20.5.3	2021-07-27 23:02:12+00	\N	\N	gp:AOqpTOFuQYoucT70k4-nyjFUQsOIDGc1HFYZro_I5oCgeGpHdohob8vPn0trtXaZtwGaQXObbcUOfN4gYo5Mog	6
404	TwinkINC	https://play-lh.googleusercontent.com/a-/AOh14Gi-rfr2wRZVbEORzQkiW-3B0aP3eT43OFAbV1XH	it's a decent app, I'm only saying that because some creators are genuinely great but my biggest problem comes with how some things are dealt with. People are being doxxed and bullied at a rate that maybe you'd think that the moderators might notice that something is up but no, they turn a blind eye at people being told to die and being harassed for no reason. I've seen far to many people complain about how so many things are against the community guidelines but nothing is done about it.	1	142	20.3.41	2021-07-22 22:55:49+00	\N	\N	gp:AOqpTOEEJH8Mi-ms7gcfdHSlS7pvHOcoCysZ4P3FYW290UrysNVrfSM_s944pnfbenV34lgjHw9nfVvrYv6tXg	6
406	Mosil	https://play-lh.googleusercontent.com/a-/AOh14GiuYrJOiROjn4MRqOCoW9cs9V6HwpNkutp5rZVusA	Great app n all but y'all need to chill with the "You're tapping too fast, take a break!" like I get you're trying to stop spammers or hackers or something, but I literally closed the app like 3 hours ago and haven't used it since then, and it's still says the same thing. Please fix this.	3	83	20.4.4	2021-07-26 15:19:03+00	\N	\N	gp:AOqpTOFaUOihzUMprJmw3F0-kBKp7NyvcduZTjwaZNMwQJvxBwwJ34Uw9VowQ-b6Jod6MTUu8bMPUwTuoAz3aA	6
407	Angus Bartholomew	https://play-lh.googleusercontent.com/a-/AOh14Gi9OKMQnNnprHv0dMLiCpaFfM20WRSDwJf8sviFjw	Often considered cringe, but it's good at finding out what videos you will like, and there really seems to be something for everyone. Easy to use too, and making videos is very easy and doesn't require much experience. Just look up a tutorial and you'll basically know everything you need to make a good video.	5	192	20.5.3	2021-07-31 15:39:53+00	\N	\N	gp:AOqpTOGkoLGh-4tCDf7SGgj0Wl3M7dafmv4Ex9h6BXUkbub4Lqel7BVXV7jolzyl-UEB_4jvLonSweGWImsGrw	6
408	Denise Bryant	https://play-lh.googleusercontent.com/a-/AOh14Gj_1K55R2Y_01WcnvUpwvTbGZB1zT3EppQO2Hh1OUc	I haven't had no problem except for if you change phones or the phone numbers and you cannot remember your password to tiktok then you're screwed because you add your phone number to a new account and it's linked to the old account it will not go through but other than that it's a good app	4	16	20.5.3	2021-08-05 07:29:28+00	\N	\N	gp:AOqpTOGr9oPQqPtWp26EwI67Z3F8g4fHVFNgn-FsjTImk_mWHhD2VO9IzHve7jwVNvnV6YpVM8DA3C1DQrG8cA	6
409	Bruce Luxemburg	https://play-lh.googleusercontent.com/a/AATXAJzrbihmBAMeORxPTVCLTOyh4nPlWEVlWv9qQ421=mo	Compared to something like youtube, content creators have a lot more ways to edit videos after uploading. The algorithm is also much better to people who make unique and interesting content. At first I scoffed at ever downloading this app, but I have to say, it is pretty good.	5	244	20.5.3	2021-07-27 18:28:53+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-07-30 08:53:58+00	gp:AOqpTOEjZa20JRuIFv2h4ZYV8l9z3NS_9obtoxN2wlrDG5bsyT6cUgpUDcH49dGBBMVsaYGnGmfDUu8Fdcg-Vg	6
410	Aurora Barker	https://play-lh.googleusercontent.com/a/AATXAJxLY_D1ABifT5OUQj4SeYP3ValfAXAbi2p5e2qE=mo	It's a really good app I love it. I wish you could edit your videos after you posted them tho. That way if you messed up or wanted to add a caption that you forgot ab you don't have to delete a video that took forever and do it over again. If you can make this possible it would probably be like my favorite app	4	353	20.4.6	2021-07-21 23:54:50+00	\N	\N	gp:AOqpTOHvcNXk7-_X0m__SltxhsuqfSR0cUKRofQBc1vw_EQCHVUzpJwAqCwz9-DIpCExXYMJh__JOk21ddVw0A	6
590	Britt C	https://play-lh.googleusercontent.com/a-/AOh14Gh9SZ0zxqtlPJN08UNdtSN7EW_8shCqBRVY-9H2	Good quick way to pass the time, and if I start getting any unwanted spam calls my reviews will change	4	1	2.2.3-a	2021-07-30 02:07:52+00	\N	\N	gp:AOqpTOFcEmhS56EKqOlcUoTvtxiE730Tz5CMiOpmu48M_isJ_vqKCmC2YTpaWApE9DKMNmOuxphPWwJlIET24g	4
411	Thë Blâçk Áñgēl	https://play-lh.googleusercontent.com/a-/AOh14GgWyDsUgj2DAl4DbFiaPF0EpiOdReh44teCJ3kF4c8	It's an inspirational platform to begin a new career if you are interested or a new way to find something that you're interested in if you don't know what type of things you like it's very diverse and it's very unique it always has something to offer whether it be serious topics, funny topics, optimistic topics, or any topics you would like I'm sure if you download this app you will surely find out that there's so much to offer all you have to hit is download!!!	5	622	20.3.41	2021-07-16 11:52:58+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-07-19 11:22:32+00	gp:AOqpTOHAZ0xqxO-96tVUHTs9AOqiqoRPAm61ua8a4c59e91UStdl5tIqK07s_F71CupTgrWkEjQYh2o7zHnJXQ	6
412	alessandra bandeira	https://play-lh.googleusercontent.com/a-/AOh14GgBQyOX3aBdWRObnfElfihuzVTzDAHgIzYbMvBv	Tik Tok is an excelent plataform, but what at times let me a bit bothering is because of the distribuition of conteins. Thus, we make good videos in the attempting to get the credits after, however it doesn't means who you'll have success. Apart from it the plataform is a brilliant idea.🙃😉	5	11	20.6.4	2021-08-07 13:04:36+00	\N	\N	gp:AOqpTOGxPQMrZttNxFw4XUwCKVyZaszikn3SNhXUsfUyUlqD88TfDKTqOTJPg3Kq6VMMvQYYy3g-cQ6Om4fdQQ	6
413	Rozzy George	https://play-lh.googleusercontent.com/a-/AOh14Gig3ukJXxgEvyqlh5Wnno7giH-3zvMvAs3sEGxY	This app is good to use whenever you get bored but the thing that I hate about it is that it doesn't allow you to go live unless you have 1000 or more followers🤦‍♀️but most people(friends and families) will only find you when you go live...So I hope they will do something about it so that everyone can enjoy doing live...That's why I'm giving it 2 stars...if they allow us to go live then I will definitely give 5 stars.	2	280	20.4.6	2021-07-22 22:55:06+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-07-25 14:30:53+00	gp:AOqpTOF_Wo7KvYNNaWJIcbwXodohUz73kR-BXQHj9AScF45VXmvcE5YgIxY69mi4JicGFVn2khngMN5lu-XDew	6
414	jordan kidd	https://play-lh.googleusercontent.com/a-/AOh14GjFko-22JSZdD4XYUIYuSwpA0Z2UFFGvamxmWyIHw	Video recorder keeps shutting off while trying to record and saying j can no longer edit drafts. Screen is jumpy and refreshes whenever I'm mid video on the fyp. Videos don't get any views without paying to promote them and videos keep getting taken down for stupid reasons that aren't even included in the video. I know it's not my phone because the app used to work fine. Please fix.	2	174	20.5.3	2021-07-31 11:23:39+00	\N	\N	gp:AOqpTOGFiWzwULstLuLMJtKq0fbjpLyFtY-RObv22g_kesi9K7CF289XvLCDptu4EivAZe-tk3OHhck0N87G-Q	6
415	Lydia Mitton	https://play-lh.googleusercontent.com/a-/AOh14GikFZeiH_sKBQSJpDoJkBr7TNzS6bFozqqgMImEBg	My experience has been more than satisfactory, no problems so far, although I think the comments on bullying should be atuomaticly taken out, of course we're going to put all people can comment when we don't know we are going to get cyber bullied, I think doing that would help show this generation that it is still not ok and that cyber bullying is still a problem!	5	151	20.6.4	2021-08-06 05:51:47+00	Hi, thanks for your valuable feedback. We listen to and value your opinions and suggestions. If you find any inappropriate content, please report it within the app. We will review the content and take actions immediately to promote a safe and positive environment for all our users. Best regards, TikTok Team.	2021-08-07 10:57:23+00	gp:AOqpTOG5snJcNWEKIF_N9PGB205f5cglaIxfG_-FFZboNif-Et1ddqFlIUPPZlRXCVAUXV4xZvuquuiO2SCzwQ	6
416	Chase Hall	https://play-lh.googleusercontent.com/a-/AOh14GgLvvHTBAHtH1hFuMDueFwRGi8AQgo_XNHkPbdm	I have made multiple attempts at contacting Tiktok about this problem. Since pride month I have been getting LGBTQ LIVE recommendations. I thought it was ok until that was all that I was seeing. Seems like a possible narrative is being pushed and I don't like that. I have no problem with the LGBTQ community, however I do enjoy to watch other content and lives aswell. I haven't liked or watched any videos for this to be happening. I hope this gets fixed soon so I can enjoy the app again.	1	540	20.5.3	2021-07-28 17:22:16+00	Hi, thanks for choosing TikTok, your feed is personalized to you based on the videos you liked in the past. Be sure to like videos to see more similar ones and long tap Not interested that you don't want to see in your feed, which will quickly influence your feed with the stuff you want to see!	2021-07-30 08:52:58+00	gp:AOqpTOEbDGEnEPglAcHbmxxhxfoXiWdRyToUjwZk9EpTR-wduuTdDO1j36H1UQW3mfRrG1wwIL3yKNUrVXaTUA	6
417	Danielle Brady	https://play-lh.googleusercontent.com/a-/AOh14GgDbP7tq3MsIH2VeG3sj1Y0Y0wQ_y0KQGpgh1B60g	No one to talk to for technical support- I was told I was accepted into the creator fund and filled out all my information but my profile is telling me I'm not a part of it. Every other day I try to apply and it tells me there is a technical error and to try again in 24 hours. Every time I try to contact support they just send an automated to try again and no one has gotten back to me. No support. Very frustrating.	1	7	20.7.4	2021-08-08 20:49:01+00	\N	\N	gp:AOqpTOE7pmYRPTUaVl68OzLqAX0hS0LhjV-BxCFOCMwBGlMSXbRKLnn2npxtTi2ZwG7Zd7ilgV4gvfzF0EF-_A	6
418	Christine Ingate	https://play-lh.googleusercontent.com/a-/AOh14GjI5RzcvrN_rjVURk_XbE1xLS6C8eEYVSL1VK_pgQ	There is an amazing variety of videos. Educational, scientific, linguistic, workouts, stretches for shoulders, necks and hips etc. There are also cooking tips and fun recipes. Love it. I save memorable videos as favorites. Just hold your finger down as the video plays and save as a favourite pops up as an option.	5	1184	20.3.41	2021-07-17 15:12:41+00	\N	\N	gp:AOqpTOGLgfKYCCKJ6xQzanT80uRGdxl4U0V5-X0afdytcEQ0OoDxo3n6_N4TlGwTRGjQsYkLWQroN2TKJDvSpw	6
419	cooldancingpanda	https://play-lh.googleusercontent.com/a-/AOh14Gg83z8-jbTZhapvx2oW6HcdrqQNiUBZY8AEClLWuSU	I really enjoy this app a lot but there are so many downsides. These include the fact I can't use playlists on myaccount to the mass reporting of some accounts which gets them banned. The fact that I am a minor also limits how I can interact with people on the app such as people can't duet, save or comment on my videosyet they still show me games that have a18rating or that are sexual. This means that it is harder to blow up as a minor and it is clear why I am having more success using yt shorts	3	92	20.6.4	2021-08-08 00:08:43+00	\N	\N	gp:AOqpTOEk_h3EER-M_2a4ghgOs3kMrjSAGcprbou_NPyHTfOeamW1qdleZA2ZAZglRrK3VaXjflAfT0ut3BdblQ	6
420	Michelle Norris	https://play-lh.googleusercontent.com/a/AATXAJz5Ne2lcgMye5VV6l3aBrdxm_XvPPBbrikfuS2Q=mo	This is really fun I like to do the videos but one thing I wish you guys could change is if you would just make it easier for people that are visually impaired to read the comments and names of people in the rooms and it would be nice if you guys could make it to where we could all go live without having to collect people.	5	7	20.6.4	2021-08-06 13:18:22+00	\N	\N	gp:AOqpTOFnVX93A6UuNwol6LyW9kW6NsoDPeiy0R0-27GcZIHREF-aLnifnMuyFZHp6cH-OUCCmein1_2p-D_9pQ	6
538	Pro Gamer	https://play-lh.googleusercontent.com/a/AATXAJxc-Ysvnqor8II_Ws9mJp0JYBryWh9TF1K6lKak=mo	Make sure you try the first My Talking Tom before you try the second My Talking Tom! ALSO, make sure your pet never gets too tired to play.	5	705	2.7.3.2	2021-06-22 16:21:34+00	\N	\N	gp:AOqpTOEi6Wu6bxDusjr9dqvz77mRzzpdyzk0VLUnt1GWZJAjS2BUuc33yvfyeW26N_E8SoPYzN2hyCxxsrKm-A	7
421	SnekGachaSnek 47	https://play-lh.googleusercontent.com/a-/AOh14GhTm9D6KYPVidAP0vS7JD1hQLxmCTLTtNRlOCPuSQ	Tiktoks cool... But, when i log out and try and make a new acc it says this, "sorry, looks like your not eligible for tiktok... But thanks for checking us out!" It really annoys me! Some of my friends have this problen too! So its not just me. Please fix this! IT'S BEEN ONLY ABOUT FIVE MINUETS SINCE I LEFT THIS REVIEW AND NOW I'VE NOTICED THAT IT WON'T LET ME SIGN BACK IN!!!! It took ages but I eventually got back in.	4	257	20.6.4	2021-08-04 22:18:40+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-07 10:59:16+00	gp:AOqpTOHmxky8Blwt96G4QpWL1jMbAxe-Cj64TTvZCEmho_QTCOB_0IOo-pk98pSAVKeu7dwiYVr_hsrg4Isd6Q	6
422	BrightSky Productions	https://play-lh.googleusercontent.com/a-/AOh14GiHth2uUpV2lbcP-t9L71RUN1GPDCUfJVsqRGQqhQ	Love TikTok, it's more than just a dance app and more of modern day YouTube/Instagram for the 2020's. If you are a business owner or small content creator no app is better and more relevant than TikTok right now and for the next 6 years at least. Update: Been on it for longer now and they do somethings I don't like. Sometimes they suddenly make people have low views for no reason and aren't straight forward about why. Gets annoying.	4	41	20.6.4	2021-08-05 04:25:13+00	\N	\N	gp:AOqpTOG0kQxeq4nCxvFscEB6ND-TzF7RblLIeypEqdN3kOaYOhpTY7AxRYDA3M8m7fx0INlQLCclro2DLQ2DFA	6
423	Niuxks	https://play-lh.googleusercontent.com/a-/AOh14GjqvChJbUY7wfkJyBwVu1SZqMtnV-Zzy2BFeTl_	So,.. It was working normally until.. Well.. It wasn't. The app started not showing me my notifacation and didn't let me search stuff. Even the "not interested" button didn't work. And suddenly my fyp started blowing up with russian videos, which I am not russian and haven't liked russian content. Please, if this is a bug, fix it. And yes, I tried closing the app then reopening it, deleting it, restarting my phone etc.	4	253	20.5.3	2021-07-26 20:03:55+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-07-29 05:54:14+00	gp:AOqpTOGx2QTNBLnaHJQ8aIm6dvcbOYthbMhqeB28m0yv3hucLJLiRNpLsAKXZWSiPKIG_DME_h0YsLUWCJGp8A	6
424	Juju & honey	https://play-lh.googleusercontent.com/a-/AOh14Gj6pJtjEvIBo2qnK3AZkg7N0HXedCTAaglgNSLXbg	Pretty good app...expect for the fact it takes up all of my freaking space.When i go to apps and sort by storage its at the top taking up all of my space.I only have 8 apps that ive downloaded besides tiktok and i have no space unless i delete it.This is a huge problem as its affecting my phone and i cant even download a video anymore because all my space is being taken up by tiktok.	1	7	20.4.4	2021-08-08 11:33:49+00	\N	\N	gp:AOqpTOHcPljwW_OV592mNdk_SiwskMJtF26e0AmHHalUYxkbmOm08s55onPp4zOL8LNhl3Ad7lBsKbTtDLrBzw	6
425	Sharna Kent	https://play-lh.googleusercontent.com/a/AATXAJzG8WXEdJpHvhJWJVx7A9vQeAGlxPE9kw8qBzDB=mo	Garbage fire app: Tried logging in with number said I tried too many times even though this is a brand new phone and I just installed tiktok, tried email, it asks me to verify but the image never loads just shows a "parameter error (500)" , once your logged in eventually expect blocked accounts to show on your fyp , doesn't even deserve 1 star	1	13	20.6.4	2021-08-07 02:29:20+00	\N	\N	gp:AOqpTOGLPXd6kZvVFSQNsqAzQrt8DVnWQWkLq9-6qvjoqoFxlAwyZSFIdmV_5FrDSN-WaSjrrfKVONzJrgzZwg	6
426	Namik Dajlanaj	https://play-lh.googleusercontent.com/a-/AOh14GjPMKn0riKj2vUKMARLewdUCVzFrD-B0YVwhVEt	This app is great for me!It works perfectly and I just love to spend time with me.And it really helps tho. You can search what you want or need and that is what I do sometimes. And yeah I find what I want. Or when you can't see it right now you can like it or add is to favourites and you have it for later and you can see it at your recent likes or at your favourites and if you want you can remove from your favourites..it really helps me!!I suggest this app to you!	5	652	20.5.3	2021-07-25 21:39:09+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-07-27 09:00:17+00	gp:AOqpTOFqivb7gdrijj4_2LX-0hT3Gb7O5vP2uKdv4hsYRr1wkJx9u1jFl14fq-kSWkfv6wPuVDxWHge2QxpCgA	6
439	meriga issa	https://play-lh.googleusercontent.com/a-/AOh14GjYuA_rsCrAGstygPIw2tbqi0LBxlhz5W2IMFi0mw	I download this app since 2019 but i love it so much whenever im broed i open the app and watch some of my for you page and i love it! Even if its scary vids! Still luv it! Sometimes i get 100% battery and it goes to 1% because i have been on tiktok for so long i love this app! And i hope other ppl does to :D	5	10	20.6.4	2021-08-07 15:40:43+00	\N	\N	gp:AOqpTOFCBezZbJWwp0UTk3yb8EXR7ed6rX9ZTp6hmbIM6qPokYahHU5PG28m6og8Vha18Y04P_8KYdYbFfFOHw	6
427	•Galaxia• Gacha	https://play-lh.googleusercontent.com/a-/AOh14GhQx-Gc6KkaHzV9KoRG7cCOBGm4USXJCbvBFS8w7A	It's a good app, although, I had 2 accounts, and I can't log back into my other one. I tried to contact TikTok, and I went to the site I was given, nothing helped. I can't log back in, and TikTok has continued to say I'm entering the wrong password, so I create a new one, it says I can't use my old password, so I make a new one, use that password, and it says that the password is wrong. I'm logged out of my account and I can't create a new one with the same name either. So please fix this TikTok	3	126	20.4.6	2021-07-26 19:05:28+00	\N	\N	gp:AOqpTOG4WmTaHxMCIELHTXWGMgGhOPuLM6MyzOx2ZOin6cYkwBnma2M05-zKVrMD8eF6221MShBkGl0xaQMGag	6
428	Awesome Larry	https://play-lh.googleusercontent.com/a-/AOh14GhezNbRYSMDdkrRsdnbEPwMVsVujrkX-3P-oLbG	Don't get me wrong, It's a great app! But it's a drug. Gets stupid addictive mostly when exams are around and interfers with my study. They should ease off abit with the algorithm. Some of us here have jobs and serious things to do but this here is a class A drug! If I was buying bundles I'd be broke coz of an addiction!	3	56	20.5.3	2021-08-07 20:05:19+00	\N	\N	gp:AOqpTOGofWSu6amscrQ6bUzPycy4KB5Q3swqWMAkt7oCoDttam7IznhMYGfn4zq7TrVj_1r2n1udZb29SQ-OBA	6
429	Shannon Bowman aka Charley Chainsaw	https://play-lh.googleusercontent.com/a-/AOh14Gi47lbSCHFy8emYnDg07LfaiHKqkdWFzxXM49l3VZA	TikTok is a great social media Outlet you can voice your opinions or you can become someone else for 15 seconds up to a minute with their selection of songs. And I wish I would have downloaded it sooner. Ps. I gave you a 5-star review in the beginning. Now I'm lowering my review to 1 star until you TicTok stop banning the #CoinTokFamily for bringing good content to your PLATFORM. There are so many of us that bring positive content through our live stream. And then you ban them for what.👎🏻BO0	1	124	20.3.41	2021-07-24 05:56:32+00	\N	\N	gp:AOqpTOE9hZCAEnzMcjl__wDzqyzVxvVSETugtXQhY-nx2kQvvtJBsB4AYyIGmbgbrE7WEn0OBxHWYtQKQekQeA	6
483	depressed angel	https://play-lh.googleusercontent.com/a-/AOh14Gir7TZT5Wf8r-IS0p6TKvv8AW8DP7EFmb3MlhrA5Q	This is so cutttte!!!! Really gives me time off reality and gives me something to do and not to mention how awesome it is!! Tom is so cute and everything is great no glitches not to many ads everything is amazing❤	5	585	2.7.3.2	2021-06-28 11:50:05+00	\N	\N	gp:AOqpTOEn6poswHsmieZtVVERqSMRUg1O2OmBjMqrPi_9C97m3sK3ZPg90EVMsO9C9oUJLWRkc_I0zycSxdFaUA	7
430	kaylieisntnormal	https://play-lh.googleusercontent.com/a-/AOh14GhRxtipbPyS_C7v28CfDXUSAjPObMds2rvUWXXM	I use this app on my iPhone. its a really good app but there are so many downs to it! For example, the reports. They typically don't seem to work. Also, there are actual people who show so much cleavage and don't get at least shadowbanned but then there are people that just show their pets and get banned? come on. also, my videos don't seem to get on the fyp. it makes sense since i have only about 300 followers but still... isnt there something i can do? but anyway, this does kill time well.	3	193	20.6.4	2021-08-05 07:23:19+00	\N	\N	gp:AOqpTOEzbTwiCxPnBJL5e0mJAWgjlQvSDbim4ojkNSXm8aQWVmtF6h936WQMhkcVcD3EvOaC0vDeiuiwt0abPg	6
431	The KoolaidKiller999	https://play-lh.googleusercontent.com/a-/AOh14Gj1U9bjFRVbiavTYFBamfvHo-Lmvzk0YU4CUDg6	Since ive started using this app it had prgessively gone down hill. Theyve stopped caring about the saftey of its users and promotes false information and silences the truth speakers. Not only do they randomly delete users videos but they constantly change community guidlines so its harder to keep videos up and get an views. Overall the app was once great... Not so much anymore.	2	7	20.6.4	2021-08-08 06:46:58+00	\N	\N	gp:AOqpTOFLgx5cVENkQ6sgWmjparQOVxNMDh9Q4m4HtvE0v4WeKvhsJwDPDYmkllszJrOTIcr_zos2PLkZwM_61Q	6
432	Kaylee Weber	https://play-lh.googleusercontent.com/a-/AOh14Gji4vH-QDhll42nWaMaaWC__qIwR-XJqipgdAUp	I love this app bc I can chat with friends and I can make videos and if there is a video I wanna keep but don't wanna post I can put it in my drafts. Also if you you don't want to be on a public account then you can be on a private account and when someone follows you it will still not let them see your videos unless you follow them back. If you are reading this, I 100 percent suggest that you download this app AND IT IS FREE!!!	5	173	20.3.41	2021-07-16 14:14:49+00	\N	\N	gp:AOqpTOFpAz-fdueN4Hoi99dx6dzmxbKu3A6gO6uRYeZ79zRvzRecBeYFsumrtKfrwLpsz9B03GWc9PNIpU3mBw	6
433	Butch Harding	https://play-lh.googleusercontent.com/a-/AOh14Ghcl9ubhiqovXxbKL9DssMXOHQoxZlsdL5Q3LSVXg	I love this app and it's a great way to meet new friends and interact with people. If you like a video before you view it all the way through it hurts the creator. I have met some amazing people on this app. There are some major issues that needs worked on and hopefully it gets fixed real soon.	5	175	20.4.4	2021-07-19 02:24:06+00	\N	\N	gp:AOqpTOHmxZRZjZ-iIDR4MJmx7uXqAYBlyHDR5MJRLzNDCfjqPt8R6ggsNXtQs2sCpYo2oxk1HSqDgeX-AhkCoQ	6
434	Brenda Webb	https://play-lh.googleusercontent.com/a-/AOh14GjpYMtW8nlm65mzlku3ZxQZQEwxuymY-fqvi2Bmyw	It's very entertaining and can be educational depending on where you visit. Since there are so many submissions, you have to use your time wisely or you might miss out on real time activities for yourself. It would be better if TokTok had keys for us to use to change the type of language heard.	5	74	20.5.3	2021-08-03 02:16:19+00	\N	\N	gp:AOqpTOFdoI0VHbhTWyNsnht2nACgYnhqsfYWloPyHjCyq4-XJnrf6ScyT3i2XPEdytw5fItCyqixKqtFE7ZRYA	6
435	khloe diaz	https://play-lh.googleusercontent.com/a/AATXAJzLfETJ-oCvns25UoQ96k1N9b1obSldHOyN1_4F=mo	I really enjoy using this app. I think that it is fun and allows people to be themselves. There are a few issues though, like the fact that me and my sister share an account but she has an update in her favorites where she can organize them but I don't have it. Overall I think it's a good app.	4	189	20.3.41	2021-07-18 21:42:38+00	\N	\N	gp:AOqpTOEWQXIpyNh2JW8atY7I4H7YPiinubxDFaXNDLFHFUmS7iM6s3hFF9v-ChSlK4GM1snATF9ZelyZUHbLQA	6
436	Adam Hardwick	https://play-lh.googleusercontent.com/a/AATXAJzyMukc-hoqKY-mV5mDjEjl4NgAq_jWlCkXhcR1=mo	good and fun it is amazing you should definitely download this game it let's you communicate with people and it also allows you to tell people about your life and if your happy or sad or a pet died but over all it is a wonderful game but it did take me a few tries to sign up because it said I was unable but if you have that bug just say you were born in 2004 or 2005 you should check out my account because it has lots of information about by guinea pigs and my life so type up pancake queen so...	5	178	20.5.3	2021-08-02 02:05:04+00	\N	\N	gp:AOqpTOFxbzgR4iEMgGsE6ysjMzZLyVVJcayXSSLjWmQ7e4BeLzxuVg4pic2a1dk0ZwzufxpR5tD0RQWlSmGdDw	6
437	Christine Register	https://play-lh.googleusercontent.com/a-/AOh14GhbENwk6o3daH3N5_MeXIigZcosnUKTM0ETOped6Q	I love the tips, tricks, recipes, exercises, and fashion. I don't like that recipes are not posted instead you have to follow in other social media groups. Additionally, it is full of advertisements and people selling products and services.	4	92	20.5.3	2021-07-28 12:47:33+00	Hi, thanks for your valuable feedback. TikTok team is committed to promoting a safe and positive environment. We respect your feedback and will continuously improve our advertising. Best regards, TikTok team	2021-07-30 08:55:07+00	gp:AOqpTOEL9Tokv6JnmVS4khfLWOLnFg-oUvYRo4uMig5qvOMZAt2Ge0pWC3LFzLOgVoweLzB-_zX_VeHgBREFPw	6
438	Sonja De Beer	https://play-lh.googleusercontent.com/a/AATXAJzS1e-mrkJQC7KIngANJkDFyTU0U_sr5HA6rDRx=mo	Tik tok is just amazing.U can make ur own vidios with effect and sounds and filters.I doent really have something to complain about but on my other phone it laggs and i doent like it.I keep cheacking my wifi and my Wifi seems fine.I just want u guys to check it out if u doent find a problem then its ok.But otherwize Tik tok is live!!! <3	5	8	20.6.4	2021-08-08 17:53:36+00	\N	\N	gp:AOqpTOHeO50-Q1Fe5fVtJ3FmGCSqpZPnaZO_A95FqzsI-GpXZXSTTlZNp85zHT7aqu95YN_oSsW-85SBqZ2wzQ	6
440	Tariq O'sama	https://play-lh.googleusercontent.com/a-/AOh14GgQDfdfMQJCAkCYTENHT6tY2JOeg2vmR9A8HDyikA	Love this app and all the features I gave it 4stars because it doesn't let you play the music out of your phone, I'm a musician I like to post my own music with me singing and rapping over my own music with all of those nice filters that's available to your disposal but other than that this app is pretty much number one that's out socially it's the best.🤟🏽	4	621	20.5.3	2021-07-28 22:07:48+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-07-30 08:52:34+00	gp:AOqpTOGcAGDdFgiVe-jOZlyzAhY1M_dkbGOYqLbLWTUllrwpdIaO8YD8FNRS2kd9dR8iyUfULq9jkaZ5zB8QaA	6
441	Payton Dennison	https://play-lh.googleusercontent.com/a-/AOh14GhzuOd-B6iN-2suKh2Jtcy8pPb-5NMljNzISbZ7JL8	Love the app but I do have a complaint that its so easy for an account to get banned and poof everything is gone. With me there is this girl who spam reported me until my account got banned and I didn't violate ANY of the community guidelines, I'm pretty upset about it mainly bc of all the people I follow and my videos being GONE... I tried creating a new account and it didn't work.	3	403	20.3.41	2021-07-16 02:39:51+00	\N	\N	gp:AOqpTOFntCt42Z80WSY1eWKytA2fPYxlnY58C1YNQx0f6dsx2rCn3rGuD0xLC-iamQI5EWOsxo65TV3YmseX_w	6
484	Karina Aguiar	https://play-lh.googleusercontent.com/a/AATXAJzy6svKpP1pvsJFRp7q3SuHPhKiWxtq78-v1nZH=mo	Well ¡¡¡FIRST THING'S FIRST,!!! This game is superduperfun but i think we all don't like is that wen you're playing,.......EXAMPLE: You're playing and like 10-15min. You see, ¡¡¡TOM IS SLEEPY!!! ...I hate that, is little time and i I have to put him too sleep, or buy potion sleep and that's not cool, BUT APART FROM THAT IS ¡¡¡¡¡SERIOUSLY SUPERDUPERFUN!!!!!. :D	5	3891	2.7.2.6	2021-06-20 03:32:03+00	\N	\N	gp:AOqpTOFcK326OsrrmQ8OPvlOTzGw48bT3HxUwzkYAFgOl7GKJxESIs8rsOFmiLNeXncG5iThCJQPlKNqqwN7ZQ	7
442	Jenn LaPlant Freitas	https://play-lh.googleusercontent.com/a-/AOh14Gjby7q3ICi2MVYMWONCkL6Nz_w77E6hQYSOdtgDUQ	A breath of fresh air from all the crazy angry people on other social media sites. I was one of the people who was "too old at 30" to download this app in early 2020... Now this is my most used app. The content is unique, interesting, and most of it is hilarious. I can honestly not find a single bad thing to say. BONUS POINTS: the ads don't interrupt content, so the ads feel less disruptive than on Facebook... although I find myself buying more because I can watch a full add between videos	5	497	20.3.41	2021-07-16 00:47:06+00	\N	\N	gp:AOqpTOFKpbXg6faa-vCWUOKcLDcCnQLEEKsq0YU1b4NOytoxhRQc9Z1mJJoITdsP87SnR1O1Ke4OHOG5rJiAXg	6
443	Mina Smith	https://play-lh.googleusercontent.com/a-/AOh14GiNTIFbKbK_CWgbW4AikYz5ZBGeYUa_Yq8bRUuC	Fun game, my 4 year old son loves it, it's a great game but I don't like some of the ads shown on here! My 4 year old son plays this game saw this messenger ad a woman says she's a stripper and I just saw a guy getting impaled on sharp blades on a ad called rescue cut! This is a kids game and they should stop putting inappropriate ads! Update: I just saw a ad with a knife cutting pencils and things! They need to stop putting these inappropriate ads on children games!	2	8633	2.7.3.2	2021-07-15 13:52:23+00	\N	\N	gp:AOqpTOEqVulIWKonzfJ9VT5Ow3ybmtHejiq_E14BROO8EIgUF-WgkONLPIxptT5qZia3P6-JqvFgb-EJSeSlcw	7
444	Jack Timberly	https://play-lh.googleusercontent.com/a/AATXAJxLgGrtyVo83ahC_LrtKl9Cdwfs94QdvlCKFhiT=mo	I like this game a lot, I loved the first talking Tom but this one definitely has a lot more content like different costumes mini games and more! But of I'm honest there's a few things I don't like. First how ads pop up, I have no problem with having to watch ads because that's how they get money and stuff, but I don't like how an ad can pop up just by me switching rooms. Also leveling up takes a lot of time to do. I take care of my Tom pretty frequently, but it still takes a while to level up.	4	14123	2.7.3.2	2021-06-30 08:19:35+00	\N	\N	gp:AOqpTOFZnO5tffA6f7qi7uE5yNa34K6qJsuHizKppTLsLiE20BenmEcZeyoF1fYrHujFEmNHsDHRHiemTx9s2g	7
445	Yoaan Kulsum Syed	https://play-lh.googleusercontent.com/a-/AOh14Gg1eit0pyMOm2UO2ld5VaiLXpI970OdMqXL2NvoZQ	Ok so now listen, This game is okay!! But the pets are very annoying! Like, one makes bad faces, one makes bad words, and one takes out gases!! Please fix this. And tom is worse! He just looks at us this way that it feel to kill him 💀. But when he was young he was so cute and now he is a monster ! I hope you all understand what I was just blabbering! 🤣 Yes now please update 🙏. Thank you 😊 have a nice enjoyable day 😊	3	4344	2.7.6.7	2021-07-22 12:42:24+00	\N	\N	gp:AOqpTOHIZW2H1U4SuWO7cprbwPEQfNouH56vQS4zo6MLiWxc31y_79w8MQ_SFt7zW12s5SqciGN53l9GxQEjvw	7
446	Ash	https://play-lh.googleusercontent.com/a-/AOh14GhGTNWd6Ts46QKH5jXyttDIR_3R82-8M6t1RQD6MQ	Nice game, only a few things tho, Tom gets tired too fast and there aren't that many customization options. I was hoping you could change his fur to blonde maybe even ginger or white but it's the same few colors. Same thing with the outfits. Make it have more options like Angela does!! Also everytime I get a pack of cards and I get something new, it'll ask me to try it, if I press try it the rest of my cards disappear and I don't get whatever was on the rest of them. This happened twice! Fix it	3	10820	2.7.3.2	2021-07-02 16:15:52+00	\N	\N	gp:AOqpTOEFRq_jlpo9o9Dutn2WmWTdISFK7PM8EDbIHMFXlwWq208-ltHy-zTOeMwMdMstOz2iEZBwU9V_SxkYMA	7
447	Amanda Kelley	https://play-lh.googleusercontent.com/a/AATXAJyNnpjR5NzH9EYABmOBq2rvIAdTwYQAA5j98lxB=mo	This game is amazing! One of the problems is there are a lot of adds the children do not need to see But still this game the rest is okay. But children dont need to see these bad adds.	5	111	2.7.6.7	2021-08-06 00:25:20+00	\N	\N	gp:AOqpTOHwcAVvKfwAHtKOOEIfK3_y5YF4WYZZv0Kqbh2_9SWH_e_-A2LEWYnirnOlRDCNUbGfdib_7FUcUAYuTA	7
448	Mostafa amini	https://play-lh.googleusercontent.com/a-/AOh14GjgnhC17FoVvQvm6YgLJUU_z0--fh_Q7xHxFq3sTQ	I love this but a few problems 1: on my first grow on level 5 I got a ad 2: on my first opening I got a ad 3: my phone does not work well with touch screen can you remove all the mini games instead of Space trails because Space trails is the best game and I loveeeeeeeee it thank you sooooooooo much you can play Space trails too so bye	5	315	2.7.6.7	2021-07-23 13:41:25+00	\N	\N	gp:AOqpTOE9rLq_fSx0Tj9xSTSkcRJBhwYkt5HA1LN6DRQHscBXj8Yw6votTghbjR4kYJx_JYz8KTpBdU7A2qhYfw	7
449	Anisha Bryan	https://play-lh.googleusercontent.com/a-/AOh14GizX33xgOv3H6DerxGf3JwGX1MXZIULsF8qKJ-A	I love it, the game is great!But I put 4 stars only because he grows too fast. It's pretty annoying because in the morning your level 5 then you do your tasks you look at your level and its level 10?! Could you maybe slow down the growth, I know it's cool how he grows so fast!But annoying when you want to keep the baby zize. There is a potion to shrink to baby size but for 250 coins! Your level doesn't go down so maybe fix how fast he grows?Nice comment: Cant wait until Angela 2 is out!	4	4445	2.7.3.2	2021-07-04 11:00:06+00	\N	\N	gp:AOqpTOHt9NymMD6Noc_c4fdMXL6RZkhdm0nGPzy2TwBSDD9d31LWcEP9u9nCmBeyCvcU3-31aHyPDesY8DOZLw	7
450	Airil Iskandar	https://play-lh.googleusercontent.com/a/AATXAJw0ERUovJYO0nGjbm9ENe7ehbwEH7OyOZlljsZs=mo	Tom is cute, funny, and sometimes say "blah blah blah", well if he is not fun and you're trying to say somethin' to him, he just say that, There are a lot of clothes that are Cool! But there's sooooo many ads!😡. But this game is cool! 5 STARS⭐⭐⭐⭐⭐	5	4011	2.7.6.7	2021-07-21 11:17:04+00	\N	\N	gp:AOqpTOFHpPcYohvcpjfRVitNbGSZvvvK7z3jplJDYLkYXz01so13Powv1aPeweX2rLHYkdhqYkY2Z1sRrv6BEQ	7
493	Sammy Curwen	https://play-lh.googleusercontent.com/a/AATXAJw1Wz080qCKOocOq3rhP_e2LSHBWNcK70tz2UvH=mo	All the bad grammar comments, I should be the smartest, This game is Funny, Very entertaining and most of all..... Great graphics! Little children can remember this game!! 🐈🐾 Oh and, Ads aren't A bother	5	1041	2.7.3.2	2021-06-29 00:22:07+00	\N	\N	gp:AOqpTOF5YvvF2TLAbGJxEqtJM443O0OzrwryZJ0honW_vi2BRtIjlkLs_3P-Elzb9Hh0dB8sPK94gDmucXxSvA	7
451	CakeFlake	https://play-lh.googleusercontent.com/a-/AOh14Gi1DDgfITGVFU-GCtJmG-EVABAg9ncrWTrpJVSIEA	This is the best game ever! Quit nice I gave it 5 stars! But if you get bored really fast I don't think this is for you but the game is awesome! There's a problem I have that when Tom sleeps I think it takes him a long time to snooze 💤💤 and I think the ads are a little bit annoying but over all the game is nice. Thank you for reading this.	5	3050	2.7.3.2	2021-07-03 14:23:07+00	\N	\N	gp:AOqpTOGIW9sd48WfS6A9mB0R0y1oz8F6JJQjnfVZ164Z9QxHr8G2orc4YFYYCIWp4iMBZqroM9GK-oCxY0aeRA	7
452	Mike Caine	https://play-lh.googleusercontent.com/a/AATXAJxRLcp6cG0QRtlnzUUlWgH_Wga8wPotq4XVQRU=mo	Dear Outfit7, this game can be filled with inappropriate ads for kids like killing or inappropriate adult stuff. But still this game is very fun and awesome. So 4 stars are still the best and caring for tom is the best part. And I'm still waiting for My talking tom 3! Thanks for your support and I'm still waiting!	4	197	2.7.3.2	2021-08-05 21:52:55+00	\N	\N	gp:AOqpTOFG5ccxmyguRhWHLN4EjerhowFPd9w62QYGYLAPNBMvzWed2lLCkweZ4OS4cJmijGDPs5DX4DA1_z685g	7
537	Melvissa Chissay	https://play-lh.googleusercontent.com/a-/AOh14GiYnggZ89k2QZG5_cln-nmdoCRt5-06q1ZquJ0R4Q	My toddler loves this game. He has a blast playing the mini games and overall enjoys taking care of his virtual cat.	5	35	2.7.6.7	2021-07-28 23:46:03+00	\N	\N	gp:AOqpTOEtyJYT267EIWuFTXOn3GlTrAX3MwO20dez2ZbcPvnKqpUvHHFbMwEE2HpgE9Y2KV9SzeU80kMg76eGHg	7
454	Shayaan Monzur	https://play-lh.googleusercontent.com/a-/AOh14GhlGEQfqUuQL1ve2osDzw2vkheoeUFmSxGDVy9O4w	I REALLY REALLY REALLY LOVE IT!!!!!!! &IT'S SOOOO GOOD!!!!! I played with my sister and she loves it very much in this game, Tom is adorable Myreen love this game. One of the most relaxing game I've ever played, so we all know 5 stars to explore worlds to win rewards to use it try it in your wardrobe to turn on your set up. To level up you must get 100% status then you can play games to win plane tokens to fly your plane and you can play toys to get fun. I love my Angela 2 because it's good	5	293	2.7.6.7	2021-07-25 22:40:08+00	\N	\N	gp:AOqpTOHdpYzMGkcG6AlfubdSsH25_TNwSMTKawqPHgZITx4gV8ToRZDni0Q4zctqY7Xx9Mvrz9hgcewfyEKk8g	7
455	Kaitlyn Whitney	https://play-lh.googleusercontent.com/a/AATXAJyG_RU8vWIXCQsvm48yzMK0klau_jJnLYYZ9wAX=mo	This game is fun because there are games and all sorts of games on Tom 2.❤❤	5	27	2.8.0.457	2021-08-07 22:37:11+00	\N	\N	gp:AOqpTOF_ms0tvZ6jWn6AMYp7HZpAG7aiHIqBanjdWZehsvdikQxgOOiRy1Uh9q5Xc7L_871NRYb7P9QnYmiRaw	7
456	Ernesto Arriaga	https://play-lh.googleusercontent.com/a/AATXAJxe_p2IyXTvpWYKcs1aJGa4okpcUeTn7fevPWgS=mo	To much charges and this was their anwer Hi, Thank you for getting in touch. We really appreciate you taking the time. We understand that this purchase may have been made by a child – and we love that our users are from all ages and backgrounds – which is why we are doing everything we can to inform parents to protect their payment information, including setting up password protection on their account/device. In regards to your request, unfortunately, we have a no-refunds policy, as is a	1	89	2.7.6.7	2021-08-03 05:44:44+00	\N	\N	gp:AOqpTOEN7L1g0R-UaFCIqCsiITzqEg-NrzJMmM_dH1YR0Eosqm8Oj42CZ7M7564PD8S-IdWXAYtpvk9G5JvIsg	7
457	Melissa Rosado	https://play-lh.googleusercontent.com/a/AATXAJyX68nQUtW856TEvrgnP-hLpg_olPbynfswv5Hw8Q=mo	I give this 3 stars because the game is very laggy and slow and I would like it if some stuff were for free instead of 1 thing cause a lot of people might get sad that they can't really get anything for free instead of the stuff the Tom comes with in the beginning of the game I will also like it if for starters they can have 10000 coins if you can do that and if other players can play with u and there will be chat if its possible so if you can please do it!!!	3	1603	2.7.3.2	2021-07-01 21:31:39+00	\N	\N	gp:AOqpTOG78k9N7_SLc4qSmUjyxIWaxFIQesJia19KTtf6YqiPTtTzqeRzxds9TiZIQGB6E3gmI5HRhRV_qrA6Qg	7
458	Bobby Sinha	https://play-lh.googleusercontent.com/a/AATXAJxc1wi2KRbmT9zvdSlL94i3r6hAWZUodsYJ34o0=mo	This is the best app ever I like it. but please try to make one app in which should have the features like bathing, cooking, brushing teeth and the food we can make of our own type like cake ice cream and with modern features please try to make this app till 31 august or else 30 september 2021.just like my talking angela 2. {my talking tom 3]	5	2352	2.7.6.7	2021-07-21 10:40:27+00	\N	\N	gp:AOqpTOFAmdwUmcO1VfPR-E72nTHLxd4FHJaPsoW2F3AqG6SD4OV-opDJYUB7AhbUyfdfhlQ_4OFrtsoDqq-tng	7
459	Oliver Cekrezi	https://play-lh.googleusercontent.com/a/AATXAJyv_VyXD53MXPajAnXkLgfWtZHGdyVwWWsrHUps=mo	This app is a very funny game for me. I like everything on it, besides one thing: when we're fighting with someone to see who looks more beautiful and who has better clothes, we don't take enough tickets when we win or lose. So, can you please fix it? (Sorry if there are grammar mistakes.)	4	424	2.7.3.2	2021-07-05 05:56:15+00	\N	\N	gp:AOqpTOGh1sa1C721vMH6O1bm5NsgQBvLz3zCGGSUKF_pJqxV7jJ0sMC57zzlOnUlynHd7W4iPuiHmKf_ffb_FQ	7
460	Mba Realtymedia	https://play-lh.googleusercontent.com/a/AATXAJyTW6ghzpWgSiZow66txfCBaqxqmNXdJLYEV3e6=mo	Tom is funny like a clown but so many farm heroes saga ads!!! We'll see you in the fanmade bear alpha and the first time in a long time. And in My Talking Tom, When I hit him, The piano falls down. Thanks for a review!	5	126	2.7.6.7	2021-07-28 12:19:50+00	\N	\N	gp:AOqpTOHeGoOQIxs7RUtOSPd_CZXI-IFlo55AzEwERVTrV2B5O78szUvSn-INzDv6amKuTmdqQpsJco_toh5ZDg	7
461	Sandra Amoah Braso	https://play-lh.googleusercontent.com/a/AATXAJyFlzO-K7DljKiLJv78DcIPtfQ4ufj_CCx6FMZX=mo	I love this game. But there is one i don't like. Anytime i am playing mini games or having fun with tom gets quickly tired and you people have to do something about it, you have to fix it!!	4	1701	2.7.6.7	2021-07-18 11:10:25+00	\N	\N	gp:AOqpTOGeteGTBnY8MkzKPSqPr45c6gGiev3qJ-O6pZbwLIk63aC_CmbTWXmkb1Ei4DBDuzN5AiUyqApq9Lvkrw	7
462	Reeta Fernando	https://play-lh.googleusercontent.com/a/AATXAJwQmAcvS_uBicy97lucqi_5DA5RyXZIZQJyGOmF=mo	This game is super cool. 😀🐱 It has a toy box with toys in, on top of the bed there are pictures and u can colour them.🖍🖌 it even has a plane and a blender you can make juice.🧃 you can pet your Tom. bathe it and this better than Tom 1.and change its name.And there lots of mini games🦄🤩🍭 and lots of challenges like, if you eat 10 different types of food you get a price I did it for the first time and got a hat👒 it super awesome download it !!☆♡	5	2127	2.7.6.7	2021-07-13 06:14:11+00	\N	\N	gp:AOqpTOFWG9SockvL3dW6ewKYWlSPTRMCmQ7gULqb0bxOrSHUozI6ojCUH3kl4VTHZ9q6T6TdVDkz5-MfKCQFsA	7
463	Bee Bumble	https://play-lh.googleusercontent.com/a-/AOh14GjbQYBYmrylg0SMTY0qlJYWrjHQANmxcaYYMN-FcA	I love the mini games and stuff in this game, I just wish the customizability of Tom was a bit better. It feels like he has 6 outfits. I wish we could pick seperate shirts and pants, and maybe some more hair selections would be great.	4	175	2.7.6.7	2021-07-28 00:36:49+00	\N	\N	gp:AOqpTOGvgsXtwmYfnqp3FAR4YujQ5OaAyn2k2xeGAtrO6uVA5IcDlN5YIlB52A-xHHoZISkqYMybvrbWpEuEdQ	7
527	Wolfaria Buczkowski21	https://play-lh.googleusercontent.com/a-/AOh14GhI4FCaAtz8Yuo-etZlfSmfVYsK2XGr5jEmEd1hvjc	good...1: Close the bathroom door, cats hate water, the mixer broke down too many times,thangs brake down to easily, the cat sleeps way to much make tom land on it's feet.	1	1551	2.7.3.2	2021-06-25 16:56:08+00	\N	\N	gp:AOqpTOEDnQlyqMtQoko2xVN5Q1pj_mIH03PNZNn29KakVjgtaYrJD7V1Bvm1FnMwXzjb6MflZGmLTQJrx5Xg3A	7
464	iamsonjiaskiber	https://play-lh.googleusercontent.com/a-/AOh14GhvNFPmN6DqozsS2ecwJ2Lo-ICVLFwDAUgP2MBG	Id give it a three because the game is very laggy but I like it because my little sister is 7 and she loves this game even me I love it you can feed him too and I like the stuff and some extra price for ads oh and I gave it three because there is so many ads to. I Love this game thank you ☺	3	54	2.7.6.7	2021-08-04 13:04:50+00	\N	\N	gp:AOqpTOFdw0SJtDMaumBZxF1CyOVnZbUf3nnLLcjzEvGdYq0egFNmOIRbW8SUUrFZ6qndgC6REFqk0rtC56MR7A	7
465	HARINISRI SENTHIL	https://play-lh.googleusercontent.com/a/AATXAJytTCyrC1dhVDl1TiJlwgy5Idj4DUmyslvqBQOy=mo	You are giving too many duplicate in the mystery box. I am very frustated with this. I think one star is also a huge. I need to give you a half star only. Bit there is no option like that. So I gave you one star. So fix it.	1	4432	2.7.3.2	2021-06-27 10:42:02+00	\N	\N	gp:AOqpTOEizPW7CjRs_8qdnWesHdp1hlpQkbJUUsKzE6LcqhoQqbbvdDnAxMKBiGXqhR6X1KJZUDv8-pJ42PmUMQ	7
466	RaceDragon	https://play-lh.googleusercontent.com/a/AATXAJzii1HTOLjFG5ZfdjriO-2hm81x5e5C6wUnWYJD=mo	This is the best game ever you can play with Tom and his pet my little brother loves this game and I play it on my free time because I have to read books first and then use my phone! Download it...trust me you'll be satisfied!	5	237	2.7.6.7	2021-07-21 08:41:20+00	\N	\N	gp:AOqpTOGSOANQAVAEESwPWCUr6q_559gZl3Ew5vJzLkxrk1eS1q9WHMPe20C4SJM03yjA8Sz19qTg2BR6gSjCiw	7
468	Angela Wiloughby	https://play-lh.googleusercontent.com/a/AATXAJw8q3n0NWQEWVcyQRZnqzYuvu_GyJm6AsF5YKlQ=mo	Okay I have checked out all the Tom games that were created by the same company that created all the real ones are good for kids and the ones that actually spawn you I gave this one to five star rating to stash in the only one I gave five star rating because this is the only one that didn't have something like in their eyes so I would say Talking Tom is the safest games so you can download this but only download this one for your child and your safety	5	13	2.7.6.7	2021-08-07 20:51:24+00	\N	\N	gp:AOqpTOHtsQLCn7ehJr_1Bd4vEW6IaOogvNaEdl-2J1tDAFQ__IpgvjOQLhCTpUcAthMegxacQGQtxX_cUdn9bw	7
469	SHAMBHUKANT RAY	https://play-lh.googleusercontent.com/a/AATXAJywAckY2xucEvRPAD4jRl_8MsK1TGDAJdu-5soP=mo	Don't download no game only ads. After evey 30 seconds it shows ads. Very much of ads.	1	77	2.8.0.457	2021-08-06 10:46:23+00	\N	\N	gp:AOqpTOER1XqcPcPx1ZG4saF324WarOpxDmcOrV56C7TIxZszXhQcfjtmnrcw3ncyFC0_rKByND58MYXGf-5TGg	7
470	Letica-Brawl stars Cluck-Blockman go	https://play-lh.googleusercontent.com/a-/AOh14GilnFzd-1rvWsGvsKyjwO187wjPiYEVpBv3dtsbOw	I loved this app!! just that tom get tired fast and i kinda want a new animation when you go on the airplane and you can see hank in Hawaii and angela in the castle and becca in future and ginger in candy land. So new things??	4	24	2.7.6.7	2021-08-02 15:19:09+00	\N	\N	gp:AOqpTOGguDcoRK_qJ8l9uRH9xWHs8PGaw3UN-Y61SMBZ4WeSm7dBUri5TcQ-rGKmm98TK59OL3I4ZMnaqaeJZA	7
471	Marty hotdog	https://play-lh.googleusercontent.com/a/AATXAJwSf4CFtRLuLI3UMKEjY5KT93FZbMjIvRqBres=mo	I give this a solid 4 stars the reason why I didn't give five is because it has soooo many frickin adds I used to love this game so much I would give it 6 star even Know it only goes to five. All that annoys me is the adds and Tom, if he is on 100 in the sleeping bar and you go play some mini games for ten minutes the bar will drop to zero that really gets me angry 😡 and sometimes it freezes then it will glitch. Even more the thing that annoys me the most is the blender it always brakes down	4	2142	2.7.3.2	2021-06-30 06:24:22+00	\N	\N	gp:AOqpTOE0qkhLdODUuSUk0YY9urF57koEB522797h82Vcxs6vaa1wp-au7MqiFDA9QpvbjxcqRn2T9pyqAhsFVQ	7
472	Sethuraman S	https://play-lh.googleusercontent.com/a/AATXAJwzBRWRbcu9s6mwYkpB-n7_nB7k3FM4pnRVMjGa=mo	Hmm... Not bad, but ok cause it's a bit boring, but keep it up! I don't have anything to say further! But keep it up! 😊👌👍, But I really like the drums! My favourite! 😍 👌👍	4	132	2.7.3.2	2021-07-12 08:33:49+00	\N	\N	gp:AOqpTOGAk0vwcxZcmLOzjZ98hK_Qd7ETdOq9698wWVAQyngZ1UR9TdbLov8UXAeGmFebkFVdpXjt01zXYKWJXA	7
473	Milan Letić	https://play-lh.googleusercontent.com/a-/AOh14GhYcRy2Sqan_4KgH8_pJ44IcwK7POVe6G1b_SaW-w	Too many ads by any account with missleading close buttons which often just load another ad or open Play store. Children need adult help to get rid of some ads. Sometimes you just have to restart app for most invasive ads.	1	182	2.7.6.7	2021-07-28 19:19:33+00	\N	\N	gp:AOqpTOHBgm9lNyNRaPPwqjqa5ST4tFtuAwZHcQ2y5nFemzdwgk1se9D6sCNnUBMsFh3bP8XX8OPkIwg6LMyvIQ	7
474	mario phub	https://play-lh.googleusercontent.com/a/AATXAJy80GYWqZ3ahOv5BZYUij4PCHitwu-8ksfkv2oL=mo	they love non friendly ads there so many when i just see if this a good game lol every thing is good just the ads edit by the way this game is much more detail then the first seeing who is the coolest contests	4	10	2.7.6.7	2021-08-07 07:03:32+00	\N	\N	gp:AOqpTOFen6K51y438rgHKIhMpznSVqw3y7nWg5IPTug51Lf4bKEhld60fUwk0E6lCz5Wl-7P9R4Zph-FOpyeNw	7
475	Anwesha Dixit	https://play-lh.googleusercontent.com/a-/AOh14GihKiY_z1aRB6wqzh069jMwK8QNCVNgdCg_r8wL	This is not very good game. It has so many ads and when the sleeping mode is ful after 10 to 20 min it's empty and games in this game is only 10 but the other things are very good 🖕🤞	3	65	2.7.1.11	2021-07-26 17:08:15+00	\N	\N	gp:AOqpTOEiWazfDNHNNtD1bjP9y6IjH70MJwsQu7kuBOhVvBUaemCmA94b3sxHRLbROcdUBC0ZkAW8vyQbF5o81A	7
476	Gracie Hall	https://play-lh.googleusercontent.com/a-/AOh14GjieMNNH8yRcBFVN2DOd0tndesrm4YTgGMe0AY9	Talking Tom is incredible! He is so adorable and easy to take care of. Tom is so silly! The only negative thing I have to say about this game is that there are way too many ads. Other than that, this game is awsome. Talking Tom is an amazing game.	5	2221	2.7.3.2	2021-06-27 19:24:45+00	\N	\N	gp:AOqpTOH6l2YW3288daUmVfeZGZkezgHl5BSUr_fzYaQjLuK7dZRhN_jTfKaXN1Pc43ZjYztcKs82wiWScOowsQ	7
477	Mohammad Moaz	https://play-lh.googleusercontent.com/a-/AOh14GgKDwMg6bhYXHNiHzHycW747claqdPmXxc0GIfPhg	Love it ! There are some problems that might everyone have...I've put tome for a long time , for sleep just like half an hour but it say again and again to feed him the sleep potion...If you want us to buy the sleep potion , so please decrease the price... Everyone will be grateful ❣️!	4	1853	2.7.3.2	2021-06-27 15:56:59+00	\N	\N	gp:AOqpTOHvUNptnxMSaRLlex_CNk3A0JVXh0hjacdc9WpC2dFP1yd_IthjgGgCt3cqX15M3r3QqNpcMkR2C4QCvQ	7
478	Pama Wilson	https://play-lh.googleusercontent.com/a/AATXAJwFPM1jsp2xg58HAjRHdc1vO2fOi8KJ-GzIGFYO=mo	This game is so cool 😎,but there is a problem. After I got it, next day I became broke with no coins,but I have went through it as Tom was growing up. I'm really glad 😌 that I gone through all of this. P.S: I'm really proud of myself😌	5	264	2.7.3.2	2021-07-09 02:35:03+00	\N	\N	gp:AOqpTOEu3Yp-iSmhOeUQgpxmw3ILKStVO2hMLdzkRMdT_36yAhO9DDFqm-suPa6_NkiOdvqt4pxK_06rcQIIKA	7
479	Nick Junior PBM	https://play-lh.googleusercontent.com/a-/AOh14GhDlqnguo9FzhrNAQzVUXo7ReI3teT6l_LYWhAdhg	My child love this game app! But please kindly review the ads, most of them are inappropriately not for kids. Please check on the ads please. It's destroying your image as a kids game/app/company. Everybody loves talkin tom. Hope this is brought to your attention.	1	3470	2.7.3.2	2021-06-22 12:47:42+00	\N	\N	gp:AOqpTOE5nmHicA1oXA0ft0lYHmk01x-q4ODo6ABfKAF5g928zu2XU4CrlwxIVvtRIHmpC4JTTWnm0inoWgNvzw	7
480	Jolene Schwab	https://play-lh.googleusercontent.com/a-/AOh14GjGk5ILs4G5Oj_DF_EmfY1q8BRRCv55QB8KC_51aQ	I love this game! I play it a lot and it's not like talking ginger or like any creepy talking- game I love this game and you should download it! I took a screen shot and saw nothing at all in its eyes only the highlight, not scary!	5	241	2.7.3.2	2021-07-06 19:01:00+00	\N	\N	gp:AOqpTOEhukixRTJ8wpDQ3q-Sx3d-XcilWfty0mxQ1zA3ZR15k7vjmCGxJ8xIrhZOMTSJyX80tPXHGYZRZ1RN3A	7
481	Sudha Tiwari	https://play-lh.googleusercontent.com/a-/AOh14GjIc7lNUJdi2TbmI4DCnB88YnFmcb-fxWuVdZuX	It is a fantastic game but there is a problem that it takes long time to sleep so we buy sleep potion but it price is very much you should have to come this price and it has ads and there are duplicate pictures you should have to check this game because it has some problems	3	1821	2.7.3.2	2021-06-30 09:04:13+00	\N	\N	gp:AOqpTOFDDnMloR-xAbEnFwOE8J5-8n1ZHiOnhdqHWx5rmoEMosEDIP-t2_0wy6VOm22JpascWrbDemMeK3Io9A	7
482	Hellothere	https://play-lh.googleusercontent.com/a-/AOh14GgvYsL_pGAy4LQ6J1fMyhlM57A_l1xbx4rqTybd2g	Well I was playing this game for a while but it's not very interesting Like this is a great game but you are Just raising a cat but not Tom because, you change the eyes and his fur, but other than that this game is GREAT!!!!	5	249	2.7.6.7	2021-07-17 12:58:01+00	\N	\N	gp:AOqpTOEfBLHD67m4X74UXEkLoKTT41VExLkFN8EK0EseoYOTlDJJiKkjdPV2s3xSVsXkqv4lu4n2WT_7OuWo5w	7
485	Vandana Tiwari	https://play-lh.googleusercontent.com/a/AATXAJwyyW4bQjLdikmZmiEkBKZTq8KjNGLdsdHq2LGW=mo	This game..... what can i tell you excellent superb and what can i tell you but i dont understand why you fix anything eg its the mixer or any toy so why you want that we will see ad and then only the mixer or any toy would be fixed or if you will not see ad so it will take hours to fix it what is the meaning of that uh! But yea its the best game	5	695	2.7.3.2	2021-06-28 07:06:06+00	\N	\N	gp:AOqpTOFPRewKVpQmxVPUGYnj7MHnWV7-id652ICxDzp9vjsJgB5M2M5bLsFt-VwuFhWME_YbR744ZF_GOSEzMw	7
486	Hima Fathima	https://play-lh.googleusercontent.com/a-/AOh14GixA0XvfglDYNiv8ww6AVXu6nw_iczuznBDkaFG_A	The game is so good my little cousin loves playing this game But there is only one problem the ADs some of these ads are not kid friendly it's not good for kids to watch these types of ads 😑😐pls atleast make ads kid friendly	3	43	2.7.3.2	2021-07-27 17:00:17+00	\N	\N	gp:AOqpTOHM_WWlQ5Jpb_RtjOwtSA4oEkUgGs5koEzn3NoDAsgA5vn_kkwSHOxHICVXnTYG-w_qFVv-ikxH41GEeA	7
487	Macda Lene	https://play-lh.googleusercontent.com/a/AATXAJx5yKLi0aEC_NilmRMwTYjk0ynFPFJEM_ER-EE7=mo	Amazing game. 👏 .he play and always his sick 😷 his most sleep 💤😴 . More games 🎮 . He love 💘 Angela. His friend is took Apple 🍎 and Chilli 🌶 his mixing and he ate .so he colour is red. He original colour is yellow 💛 . More ads . I am play many levels and his increase our height. The talking Angela 2 and The talking Tom is same game. I will play this two game is same but Angela is very very height and Tom is very small. One protect is get he gave two hours. 💋	3	96	2.7.6.7	2021-08-02 12:44:06+00	\N	\N	gp:AOqpTOG7YRga5dgzZnxlnYAxHdLyZik2xCZbE4VUANO947jpqhYe3kGWQDdQKuFefnr7PWLQ0UcFcvGvO4S47g	7
488	Shalini Natarajan	https://play-lh.googleusercontent.com/a-/AOh14GgGwZmDN7dI6M3iEIOSLt-RSmEH9I9ErCMFBUxIfXA	Rs 9000 today and Rs 890 (3 times) on 23rd June has been taken from my account when my 3yr old daughter accidentally clicked on purchase. No request for OTP or password. Just 1 tap and money vanished. Wouldn't hv known until my bank called to check regarding this transaction. Else would hv lost all in just 1 click. I can't afford to lose a penny in this crisis situation. How you design an app for small kids with such kind of trick of losing huge amount of money. I want my money back. Full money.	1	354	2.7.3.2	2021-07-04 11:43:45+00	\N	\N	gp:AOqpTOELoOzPlMTfb8HAhZ2zW98gESI6qYy8LG9OhH8ReQ0VplMu2WHgQ7Q0BtbrCG92RLHBgv5zykfG2fm7Rg	7
489	ZackyPVPSMPtrial198	https://play-lh.googleusercontent.com/a-/AOh14GjYyu0rRGT3VVXPN3HUS_3I4LfwvwKFqRD53r-Wkw	I give this a 4 star is because ads.and I don't like ads because sometimes it makes you wanna install the app and cool but in reality it's bad.i still love the game and I was a huge outfit 7 fan when I was 5.and its a cool game I just installed this 2 days ago and I'm addicted for now.hope you enjoy the message :)	4	368	2.7.3.2	2021-07-01 13:29:50+00	\N	\N	gp:AOqpTOEVuTSc0DKJvnhNLWTNdygQ6SNgb-Ku9cyQIROJtnALwRqb3aMcKbFx7YVvAhUC-bTqC1eYIfzuTOS9gA	7
490	Jhunarani Biswal	https://play-lh.googleusercontent.com/a/AATXAJzP5M4IPVBG95kQfQs8D71IZmUCCzJk_vO6UQQ1=mo	I gave it 5 star because it is an excellent game. But can you add some new functions in talking tom 2 like more new games in it. And tom going to different places out of his home for picnic . Overall it's the best app	5	1966	2.7.3.2	2021-06-25 16:03:31+00	\N	\N	gp:AOqpTOEoT_uB4rEVFQfPIBXeEWNlSHSL1tykUgZPOHvcNLbqMS5QluBQAzzX0Ot5BP0lztrn9dBRAeLxj1qaOA	7
491	Lacy Chism	https://play-lh.googleusercontent.com/a/AATXAJwlb6YmfjrzwhLMox5S_ylBnUIEBZS8YTIgVb3K=mo	A lot of ads just could be better.	4	5	2.8.0.457	2021-08-07 17:10:29+00	\N	\N	gp:AOqpTOG5PS_v6xkkRLzzwJyDH09DA1eG4HMHQwi_h4OvbYPl5SlkFAKDgS2c-HK0S7XJz_3sZf9xh38OsZIU-w	7
492	John X	https://play-lh.googleusercontent.com/a/AATXAJyEPP-RNmD17GWBj0kiFUVjUGWXTYhmN6HJPUaw=mo	This is a fun game and I really like it I like it so much that on the first day I've got this game I got to a far level I like how you can paint pictures play games give them different outfits and earn coins💰💲🤑	4	120	2.7.3.2	2021-07-09 03:34:42+00	\N	\N	gp:AOqpTOG9xrgdtV982Q6VuogmvfD4x27QoFrmbN6aTCTH_4-fr1z-nIchT4CZdVh6fOB2WcIjZ9ZkCwbzKMmpvQ	7
528	Kajal Bawa	https://play-lh.googleusercontent.com/a-/AOh14Gi0zGTAOmGXK0-CCy7COtkvKDw4qaoxm0oimbG_LA	Very nice game for play many games in tools my favourite is bee game in which we have not to mive the bees and grab them through ballons 👍👍👍👍	5	27	2.7.6.7	2021-07-28 16:19:31+00	\N	\N	gp:AOqpTOEvQzRL_q95o3ENABFJ2l5pBtX7ww5vCfTmgkfM83J5JR08dO9H_HH3GU15SbZsjbKIxWkldtKWyjJwzQ	7
494	Adebanjo Michelle	https://play-lh.googleusercontent.com/a/AATXAJzpSwYoT_bLSQGwVFm8s8XiE-TG1DfIgPrcsgEy=mo	I give it a four because it very good but there is on problem on my ipad the app keeps on stopping and stopping after the app finishes loading. This has never happen to my ipad before.	4	22	2.7.6.7	2021-07-31 16:21:47+00	\N	\N	gp:AOqpTOFxvQmUHVdEIq0yhHDcX5ho3utetLPJ0JYyHowaSl2pDB5RBFDlJVrpWpaeJvKKakd8xo6xuiG95VVlDw	7
495	Dr. Sufiya Ahmed	https://play-lh.googleusercontent.com/a-/AOh14Gg_zAHBqCwQ7Qfd45czRz3A0fAOSjp_JyFAwQtejQU	My child already has My Angela v1 and v2. But one thing I don't like is when I am defeated in Space Trails, an ad pops up. Pleqse fix	4	14	2.7.6.7	2021-08-06 09:45:10+00	\N	\N	gp:AOqpTOGtgEwuLAphGAKDYid_8m7B-eHgcA4ywc25f3_jvxcdkrNvUSrQK06iWJn3xNbK8MQzJTmMSyTH9LmcPA	7
496	N C	https://play-lh.googleusercontent.com/a-/AOh14Ghm9HJ77XXxkAL0hk_Yz4WTe8DD8n2Y9ZF91fah5g	Great Game but why I Rated it a 4/5 star is because I have one problem. It takes SO long to make tom sleep what I mean is he takes to long. I hope you fix this.	4	175	2.7.6.7	2021-07-20 18:45:10+00	\N	\N	gp:AOqpTOHYbnVUw7AVTcPEya3CN7taN_KYXRT7py65PaBYwVqABQGqwt5aAODmpgqIzIYZ7qbnwXZ0FfY3tQiRvQ	7
497	Red Dead Redemption fan page	https://play-lh.googleusercontent.com/a-/AOh14Ghn_0lEyXQj-L_wvYxtbY1lqQ0-scMFAWNo272C-Q	It is a good game,but some of the ads are very inappropriate and ruin the whole game also some of the stuff is overpriced	4	79	2.7.6.7	2021-07-24 21:45:51+00	\N	\N	gp:AOqpTOGsPTS8DuH5ZETulfRLu4mMdI1fkl1Lbp07RjlDRv1Xzi_yos4PraceprVvMNCG-kJ98DHTeyiihYEtOg	7
498	Daulat Singh	https://play-lh.googleusercontent.com/a/AATXAJyrJEqi0OBjHPOAgyfaU3sWmSdC972gMwTs9HJ7=mo	Its a nice game my 3 year old son play love this game very much and yes the ads is so disturbing so please remove the ads between the game	3	5	2.7.6.7	2021-08-07 02:35:58+00	\N	\N	gp:AOqpTOHVRUqqidSNQmuQDf4R1aJg1p-svnlGmD7q3oE5CPPlCg1-3bqXAgH7L8puE-tIcfXAEQDOFf1-ORRjcA	7
499	Mahmoud Ali	https://play-lh.googleusercontent.com/a/AATXAJyzr7UJw--EkU8wzCdw8r6ebozZXIETRNkyrbTo=mo	I rate this 3 stars cuz I had a lot of stuff in the game but I didn't play the gane for a while then I opened the game slot of stuff were missing and also the game is starting to get boring but other than that the game is great.	3	170	2.7.6.7	2021-07-13 17:34:23+00	\N	\N	gp:AOqpTOHEMTT9gXTRe-3RNIuexa9MxKbcT5aRoWPgh3JA1Iw_JafTH0St7Wky_eyYEcRqRlN5SM7g412DNYkIhQ	7
500	Madeleine Moline	https://play-lh.googleusercontent.com/a/AATXAJwLi6qx2vzE3yzPToXKU_w89G-DvuH9oyeCckCo=mo	This is the most rigged game i ever seen the mini games are too hard the toys break all of the time	1	28	2.8.0.457	2021-08-05 23:33:39+00	\N	\N	gp:AOqpTOG3HyuQeare9jYGl99qv54fcxKPGEQ5SfN4ENMcouJQBJ90-Sm2oOHP5tZDyxO_z6Q1NxejiJtqRi4o0w	7
501	evey meyers	https://play-lh.googleusercontent.com/a/AATXAJyqW8XHA0pf9Llu7gMsGeTJ_G0VHLx07tN44y2E=mo	About my talking Tom too it doesn't even seem like what it is I think on every single talking Tom and talking Angela there might be like somebody in the eyes like I'm not joking I'm not crazy there is a camera okay like kids whatever you play this you must stick your finger and put it under the camera and because I just figured out today I like sound like a little person and like when I moved to Tom I like song like a little bedroom so remember parents and people you must take your finger	5	50	2.7.3.2	2021-07-16 02:30:39+00	\N	\N	gp:AOqpTOG7bac5SXJ85qoeHcMnF9obRGwlP376kAeRoLg2XCbg9jX4rPX9VT4lM2a5yOvCWsVpTTC_qkLt2RFhQQ	7
502	Fr4G YT	https://play-lh.googleusercontent.com/a-/AOh14GhiYui3VbO5GpxGjRgex6rB8yB8bSoWu0LWroqkBw	Game is Good Advertisement is also Ok But the Game's Logo Is very Disgusting and saddish I Request To Developers Please Change Game Logo Because The current logo represent sadness which is i dont Like to see And Keep Updating this game Because this is my one of the favourite games And Thanks For Making Games Like This ❤️ Just Give new good Updates and Improve Game Logo Thanks. And Also you have to add more mini game to pass time 😉	4	192	2.7.3.2	2021-07-05 18:38:28+00	\N	\N	gp:AOqpTOE0i4qEzUMCj7hn_qBTml_lGkmIK3AgkqOTlZMB3pUTqsquGpP3lp7GVfjUDsQAwYUDY5mvh4gq2tzKkA	7
503	mason stuff	https://play-lh.googleusercontent.com/a-/AOh14GhcyH-yKaqXG4opzmRtFil4A1yupAfNZ0fqb2bbmm8	I like the game but one thing I am trying to log in but it takes me out the game I don't know why plz fix the bug	1	13	2.7.6.7	2021-07-31 19:59:19+00	\N	\N	gp:AOqpTOE2tigdSS5mWQn6cHHB2UG4Y4WTsqgHslcGCpQMVMNBW4IMH8fwMPv49pl_MjT6m_p-XIicFSufP-xRqw	7
504	Zangu zangu Kamuri	https://play-lh.googleusercontent.com/a/AATXAJz5XYVE9f-JXzjrdCivDNz35W9tnP6HPOAe1klR=mo	Its good but there are too many ads when you go to the mini-games I would like you to put of those ads and I will give it 5stars	4	30	2.7.6.7	2021-07-31 17:25:07+00	\N	\N	gp:AOqpTOHEQEUXKviWdGuCxKiVGdasu88Ug9c0ndYN6oDRbYZ4jW-956fw1plRp2uOH-3c0ZBJ7GfmN6Q3szQ-tQ	7
505	Guy Kabiling	https://play-lh.googleusercontent.com/a/AATXAJxdiz3_gV_5aEzeFdyAZ2q4SgbmlHqFcnpmEo75=mo	This soo asome you can playing snake and what your favorite play you can picture and what more time im play this im enjoy this play thank you Soooooooooooooo much i like this game!!!! and the all pets i cant unlock because im not star and thank you agian thanks!!!!!!!!!!!!	5	2735	2.7.1.11	2021-06-19 02:34:48+00	\N	\N	gp:AOqpTOFAJQ2LC3YwVdVu4YP9D5bBYx954pNEv-buEi-CdYctetWyYsdM6hwxhWLmqL5vwjsP15tY9hK48l0xyA	7
506	Jill Slaunwhite	https://play-lh.googleusercontent.com/a-/AOh14GjbALqcb9rT4c1CDuhdnqrTU0rX84T4Ckn5-9vW	Its a good game. But it keeps kicking me out! Its still five stars! My phone doesnt work good. Anymore 😂	5	17	2.7.6.7	2021-07-31 22:06:09+00	\N	\N	gp:AOqpTOHOj1ikv3cEMDD4SaKeElhcnDhg-7XBwE7qGuDWlow4DLHy2hshPqLYoSuY-g46oH0lZuxLf1JY_Gjncw	7
507	Maithili Kulkakarni	https://play-lh.googleusercontent.com/a/AATXAJyOZ4xns0CPZfi_CS71JEPiaVEXArHEHqC5y09_=mo	This game is very very nice game and there are many more different types of games to make him to play and some of them we can also play so I rate 5 star for this game	5	62	2.7.1.11	2021-07-19 17:25:29+00	\N	\N	gp:AOqpTOGtZGaztWLkQDCTzR1fvXRoYpFmXwureA7ToDpcaNkqA7jcoqad9Uolcc2UkBdLOIifu1sVXrDdtIwzrw	7
508	Shelly Highnam	https://play-lh.googleusercontent.com/a/AATXAJzoevDBdjsanKuACpyWuMIF7UUNw4allidnHleK=mo	Hi this is my review this game is so awesome because the games are really fun and easy and you can Install the game if you don't get it you will miss out on all the fun games and the fun with tom az well	5	2038	2.7.3.2	2021-06-20 09:45:49+00	\N	\N	gp:AOqpTOHyS08ZVpt9ntwt733iqZwfGb9tKPU1_TJod3hXnHXDt8HcaZV6pNwiguqwN65uSPc4npFH2XzktV-jHA	7
509	MOUSUMI SARKER	https://play-lh.googleusercontent.com/a/AATXAJy9WUERK0MX9XNdfgsZkiPp3q8Y8zGrs3nARJuz=mo	It is a very nice game but the problem is that Tom sleeps very much. But except that I loved it very much. It makes us laugh, specially my mom and my granny laugh very much when I play this game in front of them. It's really a very nice game. Thank You 😊	3	58	2.7.6.7	2021-07-27 08:46:53+00	\N	\N	gp:AOqpTOEshz9FPdyCzdNUdA2mAtra6dQDRfFl_ouu46PO1BDmaMKeHeLGmACCNu_6NGfsJA4uM-pVnThwPu5GLA	7
510	Catherine Hurst	https://play-lh.googleusercontent.com/a/AATXAJz2wMDsoQfOC-qxgCt4iqoC9re6NjJ0qdXnQ1Oq=mo	Sometimes it get frustrating trying to complete each level but I keep trying till get it. I got a new phone an when I transferred ever thing from one phone to the other I had to start all over	3	78	2.7.3.2	2021-07-10 13:21:39+00	\N	\N	gp:AOqpTOHkjL5laUejQkII47-U4avJw-B4ha2ZSuYWiYY5_t6q1mYliLew9Gkm5PO9TljNFcUmduv3X78LhnwslA	7
511	Alex Bamon	https://play-lh.googleusercontent.com/a/AATXAJyw6qLvGCmi-E6ifmgvSphf0WM7PKtVQhdMo-_D=mo	Love the game💘,, with so many fun stuffs to do, like, extra double games🙀😻, dressing up 🎽(competition "who looks better") new challenges and can win a new things!!!🤯🥳 (MY FAVOURITE AT THE EXTRA GAMES *"SPACE TRAIL"*) 😆😝🤗🤗😄😄😄😝😝	4	186	2.7.6.7	2021-07-24 16:31:43+00	\N	\N	gp:AOqpTOEJKmts06JJJZKZvzBdHYfeVAIS3ttfzP9Iqv-c9Z4IB8bO8EataPHMIDmGT-wPPuYJW-SpppM-_-fRPw	7
512	SumanPaul VII;20	https://play-lh.googleusercontent.com/a-/AOh14GhacmwlTs1gkV60-8JqXCCvBLTbAzwilu5G8keq	It's a nice game . It's so good that I cannot tell anyone and many of the fans of Tom, who love Tom and Jerry Cartoon show . Please download it and after the download it will enjoyed by you very much.😀😀😀😀😀😀😀😀😀😀😀😀	5	108	2.7.6.7	2021-07-22 05:43:01+00	\N	\N	gp:AOqpTOFYdg-gf8r5-xVj3CXeMifP8FdIh8hUAgSBY65EkaoWQ-MMxZZxY_1qh1-n9RZrpvNdQ4RD_ZZPU6Ei8Q	7
513	BlueBxrry_StrawBxrry_Gaming	https://play-lh.googleusercontent.com/a-/AOh14GipSEyQITLVpNVZute5xuxwk-l1LmRj9fETC40aUrI	It's a nice app just that when he go's to sleep the sleep bar doesn't go up fast but the other doo so u can only play a little then leave the app to hear the sound effect of Tom needing to go do his business so its like a shore	4	76	2.7.3.2	2021-07-10 09:46:47+00	\N	\N	gp:AOqpTOEgkf-aD2yiZk5nXtAbpKmbUAD8UUo3FLeXnm__mrIpgxGTeHEehQ1PWDHgFpVndBPj7ymDuqfUVFS22w	7
514	Rukmani Katariya	https://play-lh.googleusercontent.com/a/AATXAJyGFJHU0kFTI2DNGX9RPT1mIWdIIcF4KxtCQHFP=mo	It is hard to get sugar and all robots but thankyou 7 outfit when I travel once I get sugar and then all the robots thankyou so much	5	6	2.7.6.7	2021-08-07 06:09:23+00	\N	\N	gp:AOqpTOE9ZTg8NAKgBXu_4y4I5PDR94UVWBDljD66BPHL_TiQ3-JWEpbTO49Us-zK_YlHDh3hIrjbJjtUV8y03w	7
515	vidisha machave	https://play-lh.googleusercontent.com/a-/AOh14GgD0xtz0AblXO7TUaQfFWw5jUhieZR__sMYEzF5zQ	The game is awesome but there are two many ads to keep up still its a 4 stars and mabey we can get a cool update and we can get more mini games the game is ok And we can put invite so people can see our house talk and more	4	121	2.7.3.2	2021-07-06 14:21:50+00	\N	\N	gp:AOqpTOHVYR4x45-XQJT0K8NilE1Tc5GeAs4xIig9Fj9BgL4LoFE6gOGHFe9kp3xfy0RzAbz9tu0CNpB_rDyFrA	7
516	Muhammad Amer Nawaz Mela	https://play-lh.googleusercontent.com/a/AATXAJw8S8o1eqH3bK9VkHuuZQtOL2C86G4FuyfOSNbQ=mo	So this is a very fun game and i totaly recomend it 😁 but there are a lot of ads 🙄 and it gets very boring thats why i have given it four stars the mini game space trails is so amazing 😆😆😆	4	1201	2.7.3.2	2021-07-03 17:15:38+00	\N	\N	gp:AOqpTOG5_j60pdseXPPMId71SYdERhdcO63TYVBpXHH5q1hxF3kF7pLpQeFauNuIvlzXftSM_lp7mvvVCDjCjQ	7
517	SOBAA PILLAY	https://play-lh.googleusercontent.com/a-/AOh14GiIf67G3t45rnJRIHPWZw7K5wmwIXD6a91C7cKE7g	I'm really feeling better when lockdown time install this app because I'm really stressful when this lockdown so I think,I want a better partner or friend to play with me. suddenly,I get this game form ads so I think is better to spend time at home 😍😍I'm also cat lover so this app will be happy for me😁😁😁thank you to make app and thanks for play store department 😊😊	5	254	2.7.6.7	2021-07-10 06:03:10+00	\N	\N	gp:AOqpTOHJK-b3VKhnAXp2EIz2tHTJk3YXkRDq8PBITHLHuskK1T1lLlEmfVTWt6v7iCm_YSc7k2o7Bu3ksh-0Wg	7
518	vanitha Sangala	https://play-lh.googleusercontent.com/a/AATXAJzB2Cmw2J7pnqaSyiooudlfg-4AzoKEIjkdvF5H=mo	I really like the game the Tom cat was so cute and I like the voice the games in game also good but one network used game I like that so much but the Tom was so sleepy because it is cat only na that's why I like the game dut I not like the sad face of Tom but teeth cleaning also there it was so good and much interested	5	26	2.7.6.7	2021-07-29 08:37:10+00	\N	\N	gp:AOqpTOG9Yl1k2I7z6EDuxJnUYUmrGTDRoAOqvUrlNVk6X_BrpoSuUa5prbDiKLiixGKgOOy8EJxZYRuA_Wa6Kw	7
519	prakash T k	https://play-lh.googleusercontent.com/a/AATXAJykyxcbieSsbylnwDmX_AcIPxGfkMbGL5NFyU2a=mo	I got talking Tom basketball game but they don't live to put ball. I spinned twenty three times watching 23 times ads 30 sec ads . but living this game. but the talking Tom is very cutyy my brother always play this game plz give me jackpot in talking Tom game	3	106	2.7.3.2	2021-07-05 03:41:26+00	\N	\N	gp:AOqpTOFk2ZRpzsLg45kwBUYijju3bOBN8xoyA7HZJiUdJNxphUtv5yGmoQLhB_Hd6qCeOmerSU0p2s7aPWJsMw	7
520	Terrell Murphy	https://play-lh.googleusercontent.com/a-/AOh14Gh69uuuTORxUEyTG9u9ZLTtxQvJ1-po6a52KA0Vmg	When I first began using a phone this was one of the apps that I had it's cool I would appreciate it if any developer associated with this app help I had to create a whole another email because the one that I have has been compromised for months this game right here has given me a link and I appreciate it now I ask that y'all please help me get my account back please I love this game just very hard to play when somebody else is controlling it	5	44	2.7.6.7	2021-07-24 19:27:53+00	\N	\N	gp:AOqpTOGbMhWgyX1gsuACHTYWe2SZkuIzO4SbXrvS4tWrniXqg8YkKs4UTPztWXprYiV-weOaXf-OZHbG0KzYmA	7
521	Bek Hayward	https://play-lh.googleusercontent.com/a-/AOh14GgmUOa9dTh42VEN3TmDrh1SrWkKDUWfE7ZtW9FiGw	It's a cool game and 5 stars,I used to play it on my old phone,now on my new.Btw they're was a couple ads but it was ok!I love this game	5	92	2.7.3.2	2021-07-10 01:28:14+00	\N	\N	gp:AOqpTOEWvatT03u3vE7x8duHwFgFuBvTR_jc3eFl6ZZDxnqi6PYkHsTMSQgPDV99oQke3rWC6JuGi0iD0yqstw	7
522	Aaradhya Sahni	https://play-lh.googleusercontent.com/a/AATXAJzDBuKl4WA6gF6rAdpjvLkxXMD38zZxHh0YdfGU=mo	I like this game very very much but only a thing is that as the games stater is it have seen when we unlock 2 to 5 sxeexze or what it is v can put all together in once with Tom but it isn't that's why other why it's good to me❤❤👍👍💕💕	5	1292	2.7.3.2	2021-06-22 06:26:26+00	\N	\N	gp:AOqpTOGDoEbBjCrUrFlf97M4hopnhrCAmz1XyP5wgGLWdSXIwEPpOlDETDWv40wK8xnIWml8daztl_J9NV6_Kg	7
523	jai singh jakhar	https://play-lh.googleusercontent.com/a/AATXAJzyocmJtH-arNx7BwAfjKyW22eAQnrVYJ1unBbo=mo	not fun at all full of adds and purchases all the time . it is not for playing just for money all the time of each and everything they need money . waste of time . don't play this game	1	3345	2.7.0.10	2021-06-03 11:48:40+00	\N	\N	gp:AOqpTOE8-oA4Ry1i_dYZJeuLIkG-5d12rYGN6qKcTKI1xeP9DIrn0CRfkIq9afWlubNy_GDZqZcoUsX2OnDFXw	7
524	S. Prithika S. Keerthika IB VD	https://play-lh.googleusercontent.com/a-/AOh14Ghf9XTymxmHXvfceXbdBmQums92vG44dSCYT8C_Cg	Good game but it has more ads can add some more event and games and it sleep for more time	5	4	2.7.6.7	2021-08-06 09:10:58+00	\N	\N	gp:AOqpTOHvS30IW5rXL3fzlcKQMdWGMQ54gxvfgLtj6VJwIYsn-OiQe4C4N30CbE6VHxt8egoee71RhtfOnaZitw	7
525	Suvarna More	https://play-lh.googleusercontent.com/a-/AOh14GiOxqlVYuePkHzUK3jfFDi1CynIHl3eSzTNqG8szQ	People love this game but there are so many ads that children can't play continuos so please do some thing with the ads please	1	11	2.7.6.7	2021-08-04 15:09:51+00	\N	\N	gp:AOqpTOFBMJw8IzqJpC9SWH1s0Dw7Lp9yr1TJIWk1peywiQBfJvKj13VRk9_O4p9epontK3HzotVnQ2Q4kUEPww	7
526	Raja Fahad	https://play-lh.googleusercontent.com/a-/AOh14GiCPFKyqLAjuADYMW_Wdsx2XcEJSNuymOGsE8t2	This game is really good but there is a problem When I should play mini games the Tom tired 😴 early and when I get it to sleep it takes an hour for refresh I request you to please take his sleeping time ⌚ early thank you	5	147	2.7.6.7	2021-07-20 08:05:49+00	\N	\N	gp:AOqpTOF_RxHNXtXjPggDSo856NGtQaEZocnaYiWMWojxOLGcmCsMI7m2Esn5v-mBqU0LVHJsBsz8TmqBSPf8ZA	7
530	Lavanya Saravanan	https://play-lh.googleusercontent.com/a-/AOh14GjcYkhi1UPFRW2ESoyo_aYdpeNbVmm2F4y_X_Md	( I hate writing a long phase so this is it ). This game is so so so so cool and fun but it is a nightmare when it comes to unlocking things ...	4	57	2.7.6.7	2021-07-22 13:43:30+00	\N	\N	gp:AOqpTOGBha6CW-fX_uaiV2BjZBkt-lOfO9eO3U7FJ5eLmD3vMypFl1pG96sW8LaVs6CQuxYuWWfGd3cPiBLPmQ	7
531	Anita Majhi	https://play-lh.googleusercontent.com/a/AATXAJzi5qSvOe09Z-SC9LDhBJUP2eERfKMuJimPRRAW=mo	This is amazing! I love it so much can you add some more mini games , all over it have funnnnnnnnn! Tom is soooo cute.	5	285	2.7.3.2	2021-06-28 05:40:07+00	\N	\N	gp:AOqpTOEFgdROiPxISTBeh7B0qIs9UL-RUp3763zxQZQcIOyqLm3mSPXWCviWBtSxeiAkruzM5dOL9Z2I6X8jGQ	7
532	Fares Sherif	https://play-lh.googleusercontent.com/a-/AOh14Gg8oU95PonzaKCcIWK3oGYlbQWO2qbhdxTFOh6D	I used to play the and I was a pro at it like really really good but I deleted it I don't know why but I am gonna play the app again I am going to still love it I don't care about the adds I still love the game plus three are no adds coming at all.	5	35	2.7.6.7	2021-07-25 01:30:19+00	\N	\N	gp:AOqpTOE3RWLneNuliP9E37E_ZAaG6owThPu_KprovX_-Kofzy9U3u0XS4sELM7Axktm6p8yH30MZV9L1lHdQNA	7
533	Geetha Mahendrakar	https://play-lh.googleusercontent.com/a/AATXAJyJN1x_eni9jQCpNgEay8wMSfeUs9u72eFY3rAk=mo	I love this game😘.i totally like the the game.there is no ads,the Tom is so cute.I can't tell anything that much💯💯 I like.i am waiting for ''Tom 3"🤗	5	92	2.7.6.7	2021-07-21 04:22:35+00	\N	\N	gp:AOqpTOHke06auqpbJzIjliyBzm-gouSoBWdSo7b8LLadpBrThiLGuq_L485kyZdc51XVFF-J5MboRoHaHGoqNQ	7
534	Angela Eastwood	https://play-lh.googleusercontent.com/a/AATXAJyctk1vDmnnDmo1OpOr5dDVDZk7o_gqM0CJ_Fa7=mo	Sooo mad! I kept this game on my phone, but have not played in weeks! I went from level 75 back down to 4 and lost all my outfits and cards for my rooms! I am pissed!!	1	74	2.7.3.2	2021-07-08 17:47:32+00	\N	\N	gp:AOqpTOHuhd6ZQyTW6wHZOOOwhFVsnY3nUAML6W4nTDdX0y5v5L3f239DUmT2iEU_eYyVFdorgxn_BMrIA1J1Sw	7
535	Dov Jur	https://play-lh.googleusercontent.com/a-/AOh14Gji8Zv9pAs_GPkoGZoR5rWFyG4hMiikBDCFr1T_	Well, this game is pretty good, but its harder to gain coins since the airplane fuel exists, make it so u get 5x the fuel and COINS in minigames, ty. Signed, -Dov Jur the bluuuuu man lol.	5	15	2.7.6.7	2021-07-30 16:05:06+00	\N	\N	gp:AOqpTOGwKEE4vJePpFgslAy9ISS5slxE99vvzFz_yOn8RqWOyudq2ezM9HKIAQ5nSOaEaxMcHs4SVg-6M2z0DA	7
536	Ashari Robinson	https://play-lh.googleusercontent.com/a-/AOh14GjVLFrHnzZ_-R-_vMaKBL0nmLn1IL7BkZFPu01zkA	This is the best game ever I love it so much is think they should make a number three but it kinda loads slow but it's still the best	5	3	2.7.6.7	2021-08-08 10:44:30+00	\N	\N	gp:AOqpTOFFFaV3eih-pbnm67UbsRAgGff9bzoAmtYx3ZE40dX5Cxr2nqwXteMDbYIPR3zs47S-0OhEHtdFZyatVg	7
539	Logan Godinez	https://play-lh.googleusercontent.com/a/AATXAJykytygvYn917ILD4qtUs0zK5QxNAE7NAa6AwA=mo	I love this game but the one problem is how difficult it is to get dot gus and sugar and I still don't get I hate this game help me to get gus sugar and dot	5	3	2.7.6.7	2021-08-06 22:25:13+00	\N	\N	gp:AOqpTOGXU9aVlEpnDjM-qZwwW3WqohXvN9XR0BtPYM0AHK4Dz_033hPKsm0j_6dB22A5-deQtAY4yze6aD578A	7
540	Ap Parmar	https://play-lh.googleusercontent.com/a/AATXAJxX_oAoaXtpCg94-3rn9o1SiadQ-tK8GPANEtxK=mo	Its very goodst game in the world but this game have a creepy thing in tom,s eye there was two was sitting and seeing please solve this glitch	5	35	2.7.3.2	2021-07-13 08:56:41+00	\N	\N	gp:AOqpTOHvxtsqO_xrQ7-O9QOO7akGd6ysUshsnohX-hBKbogBhY2tKswOFK3rJujxjPe3IM6n0ecSVgtBJ8pjTg	7
541	Cathleen Seaton	https://play-lh.googleusercontent.com/a-/AOh14GgXV0napwE65Q-tV8BOVmV0qaiVhMtVMyVjjeBZBg	I'm so glad that you made this he is like a mimic but a funny mimic me and my brother play this all the time and it is fun like like really fun and funny.	5	1027	2.7.3.2	2021-06-23 15:44:51+00	\N	\N	gp:AOqpTOEkoe7-Cfd-53yQq2rUFFG6jeUY_EvDDgakL4NWMLonoKDiZxPysIKG4ENsYpEuP3m_iiiRxjsgpsKapQ	7
542	Mwiza Munthali	https://play-lh.googleusercontent.com/a/AATXAJwVFaYSsEOPb40JV1_aTcjJmzpC1nysJkcb1Vyu=mo	It's a really fun game, it's better than the first game, but too many ads come if am on Data please work on that	3	167	2.7.3.2	2021-07-06 10:32:57+00	\N	\N	gp:AOqpTOG5g9elWMY5s3wHx874c6IU32wHxTkidfNlCZnBm9u1je2udJn9mfZ0tAZxFUUQGAfc6z2SXwTAjTTWVg	7
543	Veronica Joyce	https://play-lh.googleusercontent.com/a-/AOh14GhzhlgcAUmtn0vx7RfazsXk70u9zCK1pz4Mz4xugQ	I love TikTok!!! Everyone on the app feels connected and relatable even if we don't know each other. It's very relaxing to scroll through the fyp after a long day. Trends are very fun and it's validating to get likes, comments, followers, etc. My only concern is that there are some evil people on the app and their accounts don't get deleted because they're "popular creators." Also, there is some bad content (people arguing and/or whining, cringey little kid stuff, and creepy videos)	4	67	20.3.41	2021-07-25 20:47:52+00	\N	\N	gp:AOqpTOFigHWub0GCsBGXruI7VS0S5X_5q0TtRqFyO1RNw8HHaYJHOefdVSfOo_tIEk87GtfSIsk56-qSDmlu0Q	6
544	Sr. Johnald	https://play-lh.googleusercontent.com/a-/AOh14GjcNoLJVb_YyMarTG1o6zfsY19Uh84TEf7GYmj50A	It's cool but I need more, what I mean by this is like, why is it so hard to get popular on this app. You blow up once and then you never blow up again, you need some sort of witch craft in order to get popular again. The app in itself is fine but it's a bit frustrating for people who are trying to get a bit more popularity with their stuff. I'm an artist and I'm trying to make my art more popular but they never even blow, what am I doing wrong👁️👁️.	3	92	20.5.3	2021-08-04 16:46:37+00	\N	\N	gp:AOqpTOE66zt2sccZpJ9fgAEa7RG7KzK_pedfOvPvy28Y8uW3rfQR4UjDjtizvkPf7yME9G-k7rxabf1bHaQufg	6
545	Lacey Tucker	https://play-lh.googleusercontent.com/a-/AOh14GivJ-q3MNHTgVpCYp2kW-0mo-ytVrJZCfl-kOPXjXk	Doesnt notify me of activity until I open the app (i have a samsung), issues with samsung and snap transitions, I wish I could send pics in messenger, I DO NOT like that I see my contacts and some of the suggested users (wish I could choose to not show some people without blocking them), and I wish the editing was easier	3	55	20.6.4	2021-08-06 15:59:29+00	\N	\N	gp:AOqpTOEZ5r1nkao4FAveoNUDxyUazVtFclquigXZfoHLNWhhzv2YHD6Jx3JHzi6OQxlFSIhSfCoGlZ4U8pr9pA	6
546	Jessica Lanning	https://play-lh.googleusercontent.com/a-/AOh14GhPPHUd4iORrqZj3EwFzcs-zQ4Sd_GrFOQPxqLs3A	Love love love it. Besides somehings that go against community standards witch really you see not an issue but get a notification that your video has been tooke down. but you see others posting way worse things that shouldn't be on there. That's the only things that bugs me and a boys me but besides that it a great app	5	12	20.5.3	2021-08-03 23:02:09+00	\N	\N	gp:AOqpTOH3-AJYZauwxykr-5FuBE1OfkRtMVAQPuOE-hknTzP0BeqBWbvv3mYhVdTs1mf0fQShTuU5-e3MrRcLKQ	6
547	Aralynn The Potato	https://play-lh.googleusercontent.com/a-/AOh14GiI7-OYGryqRxUEGcK-gkpPaawx97bP0qPr1vyh	All I have to say is it's a wonderful app and all but the reason it can never get a five star rating is because of the way they treat the content producers I am more than annoyed with it and if they keep being oppressive then I will be deleting the app until they fix that bs even if I'm a kid or whatever it's not right and I won't stand for it	2	119	20.4.6	2021-07-26 19:52:05+00	\N	\N	gp:AOqpTOFL8_f7RxbnY47wIS4GSAOkcSMsS7eic2rTcPBWmC6WZFFh0DI5QGPJTKBRuUq8Zug3BOEQashGv26A0A	6
548	Garrett Gore	https://play-lh.googleusercontent.com/a/AATXAJx0EnXaxKO06CZOK4Jl3u7LheeLsdDdeYSXuaci=mo	Tik tok has great content and people and its very easy to use, i recommend it to all my friends and family, I have never had any issue with the app it is great for all age groups it has given a lot of opportunities to people to express there selves and have a great time while doing so including myself as well.	5	88	20.5.3	2021-07-31 06:43:39+00	\N	\N	gp:AOqpTOH4LuTOqvQCGo8idhNFXIeXV-8uI534FaWSIJIfl0ODVujWt_4oXgJgdePp2XT6raaBOMu58td4moePQA	6
549	Jim Hathaway	https://play-lh.googleusercontent.com/a-/AOh14GjIiu7WZ-_p5W7TqQmb2aAx6Nwq_SwrIZaIdZ3FGQ	Addictive, and the community is awesome. Community guidelines are vague and are enforced randomly, incorrectly, or not at all. People have been known to have their accounts removed when their content is centered around ADHD, but CP accounts stay up indefinitely. Real hate speech is ignored, but robust political discussions are banned as hate speech.	3	94	20.5.3	2021-08-01 17:49:35+00	\N	\N	gp:AOqpTOFtwMJ8i0qQo_UEgfOpxpollDW5lT6EcIDYCQPQSkmNORidosWrK3JMl6PjblML1qVW_TkfdF60THMZ4w	6
550	Amanda Luke	https://play-lh.googleusercontent.com/a/AATXAJyFMQEkO5BgE1UajqizxMz_JkchnAik05QatAvJ=mo	I love this app, I'm on it all the time. But I'm very annoyed with the fact that I don't have a dark mode setting like others do or the favorites folders yet. I started seeing people with dark mode on a while ago, I check every day to update the app and then I check my settings and I don't have it. Same with the folders. But otherwise, amazing app.	4	333	20.4.6	2021-07-23 07:17:14+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-07-25 14:30:27+00	gp:AOqpTOHzXkTrxiwEs1CKmgDTwAlnqLs8o2BZ7RkrmK2ZgnLVnBAt_mtKLhSRN2Afz4bYlx1o3Ey9lqUpUD9F5A	6
551	Kara Chapman	https://play-lh.googleusercontent.com/a/AATXAJzJJcnsOawj56vBgUP_6otEK8jFQyV0aLK_ymCh=mo	Its a good idea and there are lots of amazing people sharing a lot of great information however, they allow tons of misinformation, bullying, hate speech, as well as disgusting people trying to groom and gain access to children. If you report it, its rarely taken down but lots of legitimate creators sharing accurate, insightful, useful knowledge get taken down, suspended, or banned when they speak out about the flaws in their so called c*mmunity gu!del!nes. Messy AF	2	739	20.5.3	2021-07-27 04:30:53+00	Hi, thanks for your valuable feedback. We listen to and value your opinions and suggestions. If you find any inappropriate content, please report it within the app. We will review the content and take actions immediately to promote a safe and positive environment for all our users. Best regards, TikTok Team.	2021-07-29 05:52:25+00	gp:AOqpTOG8kFC73F3smZoF7SZhU1dNQEzYeLTLrlWcMMm11pvSBripHeQLuV-5QUibyUU_10IvECnoaCIcquOwXw	6
552	ryan martin	https://play-lh.googleusercontent.com/a-/AOh14Gg-LHZKeLOIivFt1AqpotHItFsjfjxar_kly6IyKw	The only thing I dislike is the app showing obscure live streams down my throat I hate it so much. Is always something strange. I would like to be able to make it to where they don't show up anymore if it's someone I follow that's fine.	1	8	20.6.4	2021-08-07 17:54:38+00	\N	\N	gp:AOqpTOGAkKGPXbNplG08FynRiprmWD3O-FmsC-yJofM-RHOz6O4RKvvtiapI0lObaplyG1mxDQFsbXnqUx7YDg	6
553	Alex Hernandez	https://play-lh.googleusercontent.com/a-/AOh14Gj3or4NldIsC2hlo41k0-v6iZXW33nEUoEp2aUHZQ	Very functional. Only problems it has is that it drains my phone's battery very quickly, it even made my Galaxy edge S7 very warm. Also, no media control/quality settings as the video quality is unstable in mobile networks. The ads are annoying, I would pay a one time fee to get rid of it permanently.	4	518	20.4.3	2021-07-16 05:56:48+00	Hi, sorry for the inconvenience. Your feedback has been delivered to the product team, and we are working hard to improve it. Thanks, TikTok team	2021-07-19 11:21:36+00	gp:AOqpTOElbKqlckSryKIj27YKZuuOwRR8CtG4bE_ueAlIkktmpLIoXOO5EmBafU6gEayzEKl23xPXJ5XFDs7bWw	6
554	Olivya Lang	https://play-lh.googleusercontent.com/a-/AOh14GhLCFJjKiB3e_Z90pkbm22AZiC5UO_8OZA7Y0_B	I used love this app. But, I just switched phones and logged into my account and all my playlists went away. It is very frustrating because that took almost 3 hours to do. Also, all of my drafts deleted when reloggin in as well. Very frustrating.	3	54	20.5.3	2021-08-02 02:11:14+00	\N	\N	gp:AOqpTOGrAkYnynrZjN1IlZCZKxL2QekT1wQaiUwU4llOHXDx5XDBk4jZ4EKBgK_RQnuIDc_zfCqomNijgrN09A	6
555	Nana	https://play-lh.googleusercontent.com/a-/AOh14GjG7510NLzy3JVrHFov0aIsP4baJTqR1cVZK3QlvSk	EDIT: I HAVE SENT MULTIPLE FEEDBACKS BUT NO REPLY Recently since the update my app won't load at all saying unstable network connection when I have full internet. Deleted the app & reinstalled and now it won't let me login with my Google account or Instagram account. Can't access my account & sent a feedback report but haven't heard anything since. Highly disappointed since I loved the app & used it but now it's been having so much problems not worth the time anymore trying to figure it out 😪	1	273	20.3.41	2021-07-17 02:21:23+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Tap on the "Me" tab and go to "Sign up" page 2) Tap on the "?" icon on the top right corner. Thanks, TikTok team	2021-07-14 07:35:57+00	gp:AOqpTOEoBzVLalncmjhdYqyzMDtnlbciAvpnbbf8k9m2oVyZtrdZIN-0yxdFnKURQ05oT-VVa74__kH8PywX0A	6
556	The Random Guy Studios	https://play-lh.googleusercontent.com/a-/AOh14Gg6kjugbC1Re8_VLtCQg4pKIVS_uI67faxh9A6m2w	At this point it seems tiktok is deliberately avoiding giving android users dark mode, to the point 3 minute videos are a thing before android has access to dark mode. I've even seen people reply to comments with a video on a video that isn't even theirs. Apple devices have had dark mode for months while there is still no news on it ever coming to android.	1	199	20.4.4	2021-07-20 00:44:05+00	\N	\N	gp:AOqpTOGBKC_5550OstK4RVbs-cm-C_Heti6dsDOeD7r_qqjruU3nbnZ0XENaN41imJcyvJcME-aVFgS0XldRfw	6
557	Sweetpea G.&lps	https://play-lh.googleusercontent.com/a-/AOh14GhD4GU4jwy9p2XyPyztuvkW4INl4cYzRp_wjnbU	GREAT APP, it's much like any other social media app however it's much easier to be a content creator especially for those starting off. However there are uneducated ppl who ruin the app with hate and children I feel as tho tiktok silences the wrong voices and should get a better handle on that. Other than hate and some fault on tiktoks part, it's a wonderful app.	4	58	20.5.3	2021-08-01 23:17:33+00	\N	\N	gp:AOqpTOHekS94knPm8MssY3_qVXN-BqfT1SSiGOrI7Nj4ltuOAqSQPvIXuRy3ByO3HpMag0fBk0tlx-RdTVuFww	6
654	Kathy Lott	https://play-lh.googleusercontent.com/a/AATXAJyYGSeWSkNkO9FRAZ9e239pjBGRoPVmVptIec4J=mo	This is a great game! Very good graghics. Controls are very easy! Keep up the good work.	5	5	1.8.2	2021-03-03 00:02:44+00	\N	\N	gp:AOqpTOFf3JemTdEYrmF_n6Xk_lzZFEf1SOlCiwe7LqlQzx7TXZzZLUm7oeydhzd-Jw98mymyGH_szbiqtHbtUw	4
558	AnylahPlays	https://play-lh.googleusercontent.com/a-/AOh14GgMELXkSnivmvgTakVi33-7YKUQ-yDf-zDCmxBO	I love this app but sometimes you get banned for no reason and they don't give you a warning or anything. Also, I can't look up people, follow people,make more accounts etc so i deleted the app and re downloaded it and now i can only watch videos because it wont allow me to make an account 😔 I am actually crying. Please help me and fix this😭	3	4	20.6.4	2021-08-06 16:28:31+00	\N	\N	gp:AOqpTOHjlPv_CYyaIocu_Ucuss8vT-W-Q61pZw94d6SeACRphUwz9ys39MYyvP-wdIdgahI4-FHjy6Y0G-jLqA	6
559	Mel Sanchez	https://play-lh.googleusercontent.com/a/AATXAJwQ1XWhkhJNvpDWY0QfKZv3RqvHWpNcEoDK00ZM=mo	Good app but when I added my age it stopped me from doing certain things like being able to message people and when I'm posting a video I can't let people duet or stich my video and I get its for safety but I can take care of myself and it really takes away the fun from this app so please fix it also when I downloaded this app it absolutely drained my battery my phone is kinda brand new cause I got it not too long ago but ever since I downloaded this app my battery drains quicker that usual	3	1	20.6.4	2021-08-07 09:21:58+00	\N	\N	gp:AOqpTOEwcmnMNBrXcLxhZOZ9OqLTdEbNVlXdMIh8bYZPDV0TDNf0nvOx0succYfGO6A1oWMHiT9Ujs8u-PdVEw	6
560	Kacy Burchfield	https://play-lh.googleusercontent.com/a-/AOh14Gj05S9Ym5t28ZQg9POyR4pCgDdlun9sRtRli-dEV7E	I'm a content creator on the app and it will not even open for me anymore. I've tried every trick I can find and it's broken. The recent update seems to have caused some issues. Update 7/25: It's still not working for me. Has there been a change to the system reqs??	1	95	20.5.3	2021-07-26 16:57:42+00	\N	\N	gp:AOqpTOFbyG6JGyosDxyoFdqzSLUa8m89imWBr8Qrz3t6e8rhmIMOmQtjZryXbBshL0zFgKCJoDqrJNL613KdNg	6
561	Tessa Thomson	https://play-lh.googleusercontent.com/a/AATXAJxVeef9Sc2JaTmN5lAuyXBPQrHHV6DKPZ6DAj2n=mo	My app keeps closing whenever I try to do anything or will just freeze up. I've uninstalled and reinstalled and it has made no difference. And there's no update so I'm very confused. This has never happened before and I would just like the problems fixed please.	5	9	20.5.3	2021-08-04 00:30:14+00	\N	\N	gp:AOqpTOHcB0qgwOZCcd4EnXpJeeETWW7VFQcjTCyUzWTCl5Zm95J7XCMzyyIy5nTDnynKxa1xTQ-Z4DdBbK6-Lw	6
562	phrøg mān	https://play-lh.googleusercontent.com/a-/AOh14GjZfWJaU16tRoNqGqT911gjixTUbNVNM1MGr2QdjA	Kept me from feeling mr darkest feelings. Kept me happy when I was sad. Tiktok is a great app that let's you explore whole other worlds with just a touch, and honestly, I'm so happy this app exists. There's nothing that can distract me from su!c!dal thoughts quite like tiktok can!	5	3	20.4.6	2021-08-08 22:00:49+00	\N	\N	gp:AOqpTOHgvnf1a6UbBzWZwTrNs4MxlsrPjAAMilDlfr4iwJW78MJSmoILAtX0eM0ryzqLcTw6Uh3NS874egwrqQ	6
563	Rebecca Gardner	https://play-lh.googleusercontent.com/a-/AOh14Gihh4nRTgC2coQiKUXXgS65UoJJQkRisubZfco-DQ	I looooooove Tik Tok!!! It's so informative, funny, educational, addictive, and awesome. I love how it opens up a whole new world to see other people around the world that you wouldn't ever see otherwise. Thank you to the app creators and the content creators.	5	34	20.6.4	2021-08-07 23:48:07+00	\N	\N	gp:AOqpTOHrmBX3c505S5yiYVnGs0JbZbNYZK4PlY7O_x6JpkCZ8Lg14pz93qP9-9MLDs3ABslRczht1VNtLTAOEA	6
564	Mukul Nerlekar	https://play-lh.googleusercontent.com/a/AATXAJxIM-IGwPmB0a0YUdnZuwy_APHiMran7ZrnfYNN=mo	Update- issue partially resolved in recent update but not all videos have the slider for some reason------ Overall great app but missing some simple functionality like being able to navigate to a certain point in a video instead of watching the whole thing again every time you want to rewatch or check one part.	4	146	20.5.3	2021-07-26 06:06:53+00	\N	\N	gp:AOqpTOEozafwwTgWLOFDUq11JG4OeUztwNQQmfOh2SgH5QoJUSE6FpkRAiS1EpOel-znCm43DtOcq_uymYfmxQ	6
565	Melody UwU	https://play-lh.googleusercontent.com/a-/AOh14GhTCPzMqmnYrLR3FPh0uazn8iD1b3MoJ-tsXTZj_w	Overall Tiktok is a decent app, but there are a lot of problems too, theres a lot of bullying and a lot of kids use the app, I dont suggest getting the app if your under 13, but anyway there's also a lot of difficulties for creators, like people getting shadowbaned for no reason, also tiktoks algorithm is trash, you have to use a lot of hashtags, get comments, and even leave the app just for a few views. If your looking for entertainment, then the app is great, but not a great app for creators.	3	155	20.4.6	2021-07-23 04:52:51+00	\N	\N	gp:AOqpTOGRuth1NBEVwSLgOnEr5gxdkXXbKdoB3eY0TaBbKFL2f_65wWG9N2KrfD20gsMh_5r4FNziJ-aPplEvDw	6
566	Bubbly World	https://play-lh.googleusercontent.com/a-/AOh14GiRNPdDvCIneswtBzUY5MwjP4MyJ4RVt3f3L84pPw	Tiktok is an amazing app! BUT today something was wrong, i lost everything. My account and i can't log in, lost my followers and the people i followed, i don't know what's going on. Tiktok pls fix your app when u have time, people are trying to get in and get their accounts but its not working. AND im very scared, i dont feel like creating a new account, some of us have worked very hard, and please don't let us restart and make new accounts we worked very hard. I don't think that would be wise.	5	128	20.4.5	2021-07-24 14:49:41+00	\N	\N	gp:AOqpTOFSR3iD1UGfnM1zRdge4YnohlH8vRWblBiSlv08coeQZTvpjwG9AaoNYtYXt7Gn8DQ7cfZ-nj1Wdv6qZg	6
567	Janet Porter	https://play-lh.googleusercontent.com/a-/AOh14Giogcu8AFfqX_y8BzFN06uQk8-k44fPuh-XXVAyAA	Too much covid disinformation allowed to spread like wildfire but the truthful and helpful accurate medical info is being taken down. I don't like the way some posts that I'm watching disappear if I accidentally bump the screen and then I can't find the post again! I've reported covid disinformation a few times and TikTok comes back and tells me it wasn't a violation! What!? Are you kidding me?!	1	111	20.5.3	2021-07-30 14:41:24+00	\N	\N	gp:AOqpTOF1SQVzrnohe0aE6cer1PAu2S4lKRrtZMhifPGLSY36QP4GBHr-VAxE6WaruDJVDWtscFaNt0l6oz-F6A	6
568	Coonheart	https://play-lh.googleusercontent.com/a-/AOh14GjrEpAVrqT-MDmazOLvgD4z_KMPXR2IwuBviBRa2Q	Buggy, to say the least. When trying to zoom in while making a tiktok, I am unable to continue recording, and unable to go back. After I manually swipe the app away and go back, I cannot use my camera. Hoping the newest update fixes it.	3	115	20.5.2	2021-07-25 11:59:59+00	\N	\N	gp:AOqpTOGPXmzm-zTX-26v3VFQCEIfgp5FIN-o53TaTeApnKiTDfWrgIO-Rr9Wfp-ig2VOZIfysddGmuKcNQQMrA	6
569	ClayClan Tv	https://play-lh.googleusercontent.com/a-/AOh14GiHtSODga0XzGPNaHufxuIajGaP3-Z42vTRWvRDlok	TIKTOK!!! I have not been able to log into tiktok for a month now from my samsung phone. However if I use my iPhone I can log in no trouble. WHAT IS THE PROBLEM? I use my samsung more than my iPhone and I NEED to be able to login from my samsung. IS THERE ANY WAY YOU CAN HELP? LOOK DIRECTLY INTO MY ACCOUNT? ANYTHING? PLEASE?	1	473	20.6.4	2021-08-03 01:14:21+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Tap on the "Me" tab and go to "Sign up" page 2) Tap on the "?" icon on the top right corner. Thanks, TikTok team	2021-07-16 08:08:24+00	gp:AOqpTOFVazwLyEgAR-QGqm463SEPv0adft_dT3JC2P923pxEnUUs6PEPIANeH-6qhKv6szj0xk2gfOzm0DwohA	6
570	Debbie Athome	https://play-lh.googleusercontent.com/a/AATXAJxO3xmL6djp1aczOnvGMAa2XbDkZJNd-tbLAjGy=mo	This app is SO MUCH FUN!! I never get tired of it and its the best way to pass the time at airports, doctors office waiting room, etc. Also has great tips & hacks	5	4	20.6.4	2021-08-07 16:59:46+00	\N	\N	gp:AOqpTOEluQ1ERaPqm-jhVDdnmx-AiGbE5_CCryFLKLBaXg31pAQbSXfRZebm0vJPrPMh6MVY5b1_YkkrtyJujw	6
571	Myah Martinez	https://play-lh.googleusercontent.com/a-/AOh14Gj_gQ7uNaxEsmdM4zidOyKDgAFlDVOjl5UHUzQyRg	I love tiktok but the algorithm sucks and people constantly get banned for no reason, and they also gave me the 3 minute feature and took it away a week after I got it. Also the Playlist feature isn't there. Tiktok also doesn't boost a lot of people that have a lot of talent and that deserve to be seen. I wish tiktok would do more to boost others like artists, cosplayers, small businesses, musicians.	3	667	20.5.3	2021-07-24 16:14:45+00	\N	\N	gp:AOqpTOHWfZybYdoDZBisppeeGpJSOzBO66KRy2gcLzYwhm4wp3PyT02aF1mwn6PfN9k5JujkjSlROvreaQs2RA	6
572	Māyā Unbound Poet	https://play-lh.googleusercontent.com/a-/AOh14Gi0-P1jJSYRouSuNUJXIsBxI3Yvem1iGRY6FSXK6A	It is a decent app, but I am critical on how it sensors information and how child pedophile s don't get banned as quick as some people who share there thoughts and get information from doctors. I hate that even if you try to speak your mind your sensors or get shadow banned for no reason even without breaking community guidelines. The executives need to be held accountable for every pedophile on this site. But I enjoy the costume 4 u page.	2	62	20.4.4	2021-08-05 17:17:37+00	\N	\N	gp:AOqpTOGy5w9qnYrFqvsiUaBhv0iqJPAV_7z6m4QwtC0T3b7qMMEVu--WhzrNehvjaNwCHuygSNuJSUEcodzMcQ	6
573	Kari	https://play-lh.googleusercontent.com/a-/AOh14Gjsx8wJK4SoD5qGByaNHQo4S5R4c3HhRn_MGZL3y6s	The app is fun I don't like the in app browser though. I would like the functionality to open the link in Chrome or copy paste the link but there's no search bar. Also like someone else was saying creators are guilty till proven innocent and their content gets removed or they get shadowbanned all the time because the trolls want to report it.	3	155	20.3.41	2021-07-17 23:10:41+00	\N	\N	gp:AOqpTOFfXep0OoCo0jLUzPVFRdZGL15Lut1i9cDdvv1vg1bcGZiIuo8iBg-V_lFEpkKyGY1uComLA9XsHeEHgQ	6
574	Taylor Adkins	https://play-lh.googleusercontent.com/a/AATXAJzgHajhBj1nj2LJv414fpM0fWq_eHJD5yweyqBc=mo	Great,addictive app. Four stars are because there's a LOT of inappropriate content that should not be on there, and yet they keep it after multiple reports. Yet, great creators get reported for no reason, and their content gets deleted.	4	1	20.6.4	2021-08-09 04:01:49+00	\N	\N	gp:AOqpTOGCKvOKFbRmdPCndyBsAuboezTrQgfNOsTMgyTxE6cnAvU5onoGiSZBxE2O2FJ9oOIYIsiMdF5mkuzCFA	6
575	_astxrism _	https://play-lh.googleusercontent.com/a-/AOh14GjQLthmfIloqlBshlCClx5ih86Gmc7w3txm6lvkLw	the app is okay but the android version can never catch up for updates everyone can rewind and fast forward videos on iphone but you cant do it on android. Its frustrating that android doesnt have to same updates as iphone and plus multiple POC creators on this app have been silenced(banned or got videos taken down) by talking about certain topic which isnt ok and people no matter what type of content they make videos can get taken down for no reason.	2	119	20.3.41	2021-07-16 14:45:16+00	\N	\N	gp:AOqpTOFET7WxTPkhusLi6TOnfRs96Ov6-2Kmq20wdiDottU3mqMbXd2wH-MuofzZNSHJgUWkb6ywyssUSu0UNQ	6
589	Noorullah Barakzai	https://play-lh.googleusercontent.com/a/AATXAJybCKfVS89Qzwnn6oz87QZYoRfVCUcP4djnpytY=mo	The best game ever but ..... Please add a pause button	5	2	2.2.3-a	2021-07-25 16:45:53+00	\N	\N	gp:AOqpTOFIHY3xpQRWkOvRNTj08-YLT1rX7tpfQOpPwPlr9Dcw9DUWDeUVePAF_2VT8ydwlYqPHqefzbk1ix4IEQ	4
576	Emely Pena	https://play-lh.googleusercontent.com/a-/AOh14GixPIod5JGf6bcNrtwTnevYeqs__MU9h8YJWHxVkg	Buffering & Battery Drainage... I have to open and create the same video over and over and it just makes this useless to use these video apps when our phones weren't meant for this kind of processing. Great when it works after trying to create just 1 video. . .	4	29	20.5.3	2021-07-28 12:18:31+00	\N	\N	gp:AOqpTOEjNBw26fLiP_MqqBvjJhwvXZVGgRq4uoKN2mqF-3mJWfmsvb9VXZ7ZhtcozgFGKIi-rAvokIvFPnNGxA	6
577	Olivia Phan	https://play-lh.googleusercontent.com/a-/AOh14GjI9o7Hq4Qz9V2vrK6qSB4CvYBReIHmkxjmEVZGWA	I love this app so much. You can post, you can message, and you can start trends. The bad thing about this app is it is so addicting. Sometimes, I watch on that app at 9:00 p.m. And the next thing you know, it's already 2:30 a.m. I'm not saying it's bad but it is so addicting. Another bad thing about this app is some don't have an opinion anymore, if you don't have the same opinion as the people in this app, you are considered "canceled".	4	0	20.5.3	2021-08-08 18:14:10+00	\N	\N	gp:AOqpTOE3H8pOVGeiIm9BBPT3PDYqjxWAbVlIzf3x0_agYK_0rOWXUFalUD_ZlIoELY_QH_wxqxPpwLSQQkqDww	6
578	Violet	https://play-lh.googleusercontent.com/a-/AOh14GjNoynPrlR60r7JB_h6ItM7-azDbVIfylMJS1XDWw	This is a great app. The issue I'm having now with my new phone is that I hardly get any notifications other than a few for direct messages. On my old phone it was fine but I just got this phone and it started to happen. Please fix this issue	4	68	20.6.4	2021-08-06 02:14:53+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-07 10:58:57+00	gp:AOqpTOFNvYiH44Zra1ET9jsIayKkV09fovuok2hXBd2qcQKLqMEAA4szxSBsW96DR-iZGLz9R_f7Ru-tXWRToA	6
579	Christa Draconian	https://play-lh.googleusercontent.com/a-/AOh14Gi7dXU6yWiWIJw4S1KmbBaDBL-YKJbbGbw96L45Sw	I've had the app since 2019, and I got the latest update, but before and after the update, I can maybe watch 1 or 2 videos before it start acting out and not wanting play, when I have Wi-Fi service? I' m confused.	4	0	20.6.4	2021-08-09 04:35:07+00	\N	\N	gp:AOqpTOGJWWlZbGl5w8YH-LIVlZKS4oJ9RHlfp_n6ixmab1n3dCkRnyRD4JGLe04wGLwpNBM59dMKM8cpJAi6zg	6
580	Amy Michele	https://play-lh.googleusercontent.com/a/AATXAJzDGs0hgc9APIrGu7fg88FhPzOxIoel_7UZaHqK=mo	* Can you add folders to organize our favorite videos into? I would love to be able to organize my favorites into folders like "recipes" and "wedding crafts" This app has been a blessing to the world amidst this pandemic. While negativity always finds somewhere to run, this app almost always positive. From crafty things, to singing, to car stuff and even emotional support, this app has it all. It has provided a mental break from everything going on and I hope this app is here to stay!	4	288	20.4.6	2021-07-25 20:53:23+00	\N	\N	gp:AOqpTOFJzJUz0fYG1oAdH3NyB1UA_0uL7jNZ-Mr-dR0VcNvOyPRQb_UOKc90US4ajD72luqv00py3j2QgPEf3Q	6
581	Sam Vassilev	https://play-lh.googleusercontent.com/a/AATXAJzWgCkjresI3PJtOUmTIwWSwYu9uv4DdY6ww3aK=mo	Overall the experience is decent although I will find that TikTok will keep recommending new communities even though I say I'm not interested in them, I have had this app since March of 2020 and didn't have this problem before. It needs to be fixed.	2	28	20.5.3	2021-08-03 18:37:53+00	\N	\N	gp:AOqpTOFqDMuDc8a0oEKg95Cd4pUprAvDXVpvicZAp0GiXnaUYHR9qgdpNe9YBSZYyATy9M3l7pARw2ebURmXQA	6
582	Angelina Marie	https://play-lh.googleusercontent.com/a-/AOh14Gjo7eh1Ibw6sTFfu-dQh7xIAgMXWBr5SvLGe5Hp6A	This app made a big mistake in my opinion. Their lastest update includes a feature where people may video reply to comments on videos that are not their own. This concept to me feels like a breeding ground for trolling and harassment. What is there to say to a comment that is not yours that can't be done in a reply, or via a like? It's seems invasive to me and although written comments can surely be just as destructive, itmakes no sense to be able to make media from comments that are not yours.	1	113	20.3.41	2021-07-18 19:23:56+00	\N	\N	gp:AOqpTOHfFowF_80nxi2sZk8xdQTY6Ir2QvmXUK0HqQ8jThohzZEPQqPz1AYm9z8MbwuHenmXOmyPTDjNyTo8tg	6
655	Phaze	https://play-lh.googleusercontent.com/a/AATXAJy3aaTbxYijxzNuZbeR5NX6JG7l6e6ITaFehmzPhA=mo	Fun maybe the background color can be changed would be a cool new feature?	4	7	1.8.2	2021-02-27 05:19:22+00	\N	\N	gp:AOqpTOFad9m4c5OWb_y2RS5ZApSdGzc5umTOT19hXbJq0hAofqPyK4elrtUXTMcjN7Gi_yFi1AlVD5b0VYQmdg	4
583	heidi sprinkle	https://play-lh.googleusercontent.com/a-/AOh14GgJLIvU2YTaFHWiz1sNAfGlxj4sEdk1iRidA_LPHVk	First reviewed this on 5/19/20 now it's 8/6/21 and I love this app.but for some reason it won't open on my new phone. And I don't wanna delete because I made some drafts that I like. And they don't save if you delete it (another complaint)	3	9	20.6.4	2021-08-06 06:12:02+00	\N	\N	gp:AOqpTOGE6Q-zlW11rNxIqhsrbTOO9kawNNtfOpB2TYQTxZXZZVO7AUPUzy7E8fhb5fiX2cqTAZL7rogt2B0z3g	6
584	SydKitter	https://play-lh.googleusercontent.com/a-/AOh14GgOVCvGcU0GkAkCEKTNRMIzjS-nYKNMpopi8_fh	I find it quite enjoyable, the 'For you' page can produce content I quite enjoy. The option that allows you to skip through the video and the 'translate' comment ability are very useful.	4	1	20.6.4	2021-08-08 22:54:34+00	\N	\N	gp:AOqpTOEa9HMjoHLEm04c1pPIU8rtPkEq9gdFV_UxXC9Dj1WWsTulnqVT32A_Ogpk5bqLe9D_YB0mGhl_reqEXA	6
585	Like ghosts in the snow	https://play-lh.googleusercontent.com/a-/AOh14Giy_zQP5A4Fito5Mb7rtyDW_9D9xvNSwZzPuAz6fkE	It's a great app, but I'm having audio issues. I can't use the audio without it saying "can't use copyrighted audio" and it gives me tiktok's account audio when im looking for a certain audio. Idk why it's doing that and i dont wanna upload a video until i know what's going on.	3	102	20.4.6	2021-07-24 23:25:59+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Tap on the "Me" tab and go to "Sign up" page 2) Tap on the "?" icon on the top right corner. Thanks, TikTok team	2021-07-27 09:00:01+00	gp:AOqpTOEYqZ4ajdSDo5i508zCRRrjBiJe1qvUDer8SKcI7woKI6K9RVFCVpCf794hkSTcKbGhBvkm0FWpVmsTlg	6
586	STARBOYJR BG	https://play-lh.googleusercontent.com/a-/AOh14GiaW8ARn6pTn3GRNI23IRGplA6ftcfzIhh98JvH	I love this game.Even I play with my little sister. She recommended this game to me One problem is that, the pause button is needed. Thank you and bring more ideas to the game ✌️✌️	5	66	2.2.1	2021-06-23 07:40:08+00	\N	\N	gp:AOqpTOEGXrPdOPEbrV5uZ7l7L_JefuMIX-9ZJWIbX0_IdBDVH11WTw_pBUUV_kpbCVraWnxA8bhnhGy9H0NMIw	4
587	chef47 inc	https://play-lh.googleusercontent.com/a-/AOh14GiPadEh6Rr0ROeFNBQX1CD9hpGFPYVM9Y_iY20r	Very nice game good graphics. Would be nice to have a pause button. Also an explanation of all the symbols. All in all a great game	4	26	2.2.1	2021-07-01 15:58:45+00	\N	\N	gp:AOqpTOFbzqtWNTcO6TRB0relaH1huIRKkm4C1GLdl24g7pBxGXLjKKkPKQFQS3S0Lb3tl7CkllFAL3bZh7MhHA	4
588	Dave Sampson	https://play-lh.googleusercontent.com/a/AATXAJxTPiQOcPl2WTdk4IG1ykgOFiIXOxdGVc9FNziH=mo	Amazing and I wish I could taste the food cuz it looks yummy I love this game it's kind of relaxing it's like every other snake game except like better I just got this game and I forgot to rate it but anyway I'm having time to find on it thank you	5	45	2.2.1	2021-06-20 17:41:17+00	\N	\N	gp:AOqpTOHCl8abpVeUCjB63NGHJR2lOWOE_O-teveWTudXTn1H0B41WsyqVSemWBDGHb5f49jY8kS-EX3SClVWEg	4
591	Jose Olivares	https://play-lh.googleusercontent.com/a/AATXAJz_HoauocO1BJWXy3e4feDZvtUrtJI_GPgW9ifg=mo	Extremely addicting. I appreciate that you can play without getting bombarded with ads.	5	15	2.2.3	2021-07-22 04:44:40+00	\N	\N	gp:AOqpTOG15diYn3qbyaNY6MdCo0IVQO-ZdK88jb3LddO29NluPeD5xlSLewBjqYp4hJp83dOIKLJEPj9ooqrX_Q	4
592	5 year old Autism	https://play-lh.googleusercontent.com/a/AATXAJwaE3-4AKY8OyfxSxPS2IuLUjI-rV5131FDzc6q=mo	I really love this game but the only thing that I wish was different is in this game you can't pause it but otherwise it is really fun!!	4	495	2.2.3	2021-07-06 19:07:14+00	\N	\N	gp:AOqpTOHUUy6X82tGmaZHNDXgJ4z1rHW-AicBHP22fQB_3FV9txWILyANt_D5_XILQwmBrCZdmjcPyLMMEoI8Xg	4
593	Danis Greathouse	https://play-lh.googleusercontent.com/a-/AOh14GicNxFc2hp1I_7O7JYw12v1LdEiawRHC46b6BJF2Q	Lost all of my levels due to the app not allowing me to get new task and all my coins. Under RedGazzelle through Google play. So disappointed with this game had to reinstall app. This game sucks ba11$	2	18	2.2.3	2021-07-16 05:34:07+00	Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it.	2021-07-16 07:20:39+00	gp:AOqpTOFjSSrRAk_fL1IZ6bkXZ8WDdR7wfakhYgdtxwnVm9Y_OrBjkc2nyF06wIMlBGtz1FmzlHVww9Vc9bHyjw	4
594	Scott VanGerpen	https://play-lh.googleusercontent.com/a-/AOh14GghzKQzvdIAekUdjJFwx2R6bg1UCIjXT4ZTyrYXJQ	This is a pretty simple and VERY fun game. It's addicting! And now I can dominate at it! I a hungry happy smart worm. Oh yea!	5	44	2.1.2	2021-06-01 06:16:08+00	\N	\N	gp:AOqpTOErQZHbxa4-S4yG5hCZSLRp0_fXFh2Ll9ZhLbFWHTi2UbWp8Y-8B_0_Sur5ImXFJrrkrChZyJPeA07P7w	4
595	Eric Wade	https://play-lh.googleusercontent.com/a-/AOh14GjIx4w4P5qrzWyr8A_zUvSsUYxe80ClMxapCwdtcw	Fun game,addicting. Developers should let player have total control of their worms at all times.	1	6	2.2.1	2021-06-27 09:38:04+00	Hello Eric Wade! Thank you for your feedback! ⚙️ In the game settings, you can change the control to your preference. We hope that this feature will allow you to evaluate our game five stars.	2021-06-15 06:29:43+00	gp:AOqpTOFQTjWhrbsGecqg7CXyTtrnAK9ygtyBYkXC5yqKPWQIACC4ylWnqxiROOl7IwwFZ_hpPtbzrCUGHFo2Tg	4
596	Robert Garza	https://play-lh.googleusercontent.com/a-/AOh14GiA7BW7BWoVMMWqDPddFfdMfA1CWsafS54P5Oi2WQ	Awesome i love this game hardly any ads. If i was sisqul or ebert and this game was a movie id give it w thumbs up if it was a song it would win a grammy	5	4	2.2.3	2021-07-18 05:18:48+00	\N	\N	gp:AOqpTOEunvQqtpNJn72k9_t1kJbWTM3ZRY8rxoOwf-Xx7ZmWD2iGIlRK1EZEjbR-yi94ofXRa598cgNGOtA8Cw	4
597	Mace Molandes	https://play-lh.googleusercontent.com/a/AATXAJwk5gjuhIEU8Ap2CpFFkoHpQzFfozGHN7drX1fS=mo	This is a terrible game. There are way too many ads and it is a copy off of snake.io	1	49	2.2.1	2021-06-22 04:49:07+00	Thank you for your feedback! In the world of a lot of games similar to each other, but each game is good in its own way. We hope you will appreciate the game and put the highest rating. Good luck!	2021-06-22 06:20:02+00	gp:AOqpTOGoKQc-6J3SI85uvzQpAECskJwHg2kUEBNaVWBuU0n02apJK0aogWBPdwb8jhr1Ckbf0zQOV1VL_doxYw	4
598	Daniel Hoopengarner	https://play-lh.googleusercontent.com/a/AATXAJwSlqk_M-VDW_MuiblvTXUzmae-GJZHdkviLgf4=mo	1st it was 5 now it's 3 because i just opened the chest and it says collect 125 coins and that's crazy like going 15000 inches and some of them thing's are almost impossible to do !	3	9	2.2.3	2021-07-08 01:08:54+00	We listen to our customers and constantly improving our game. Soon the game will have additional opportunities to earn gold coins, new modes, and events. Stay with us and stay tuned. We hope this information will help you to evaluate our game on a five stars.	2021-07-08 06:21:59+00	gp:AOqpTOG1wIpJgkBLt9Xk-0L8N7UPS5QvwIRo-_FbgIaLKeyYc91JkOmmnR9PcqCgckySj9AU03MfOg8AR6IqxA	4
818	Леонид Васильев	https://play-lh.googleusercontent.com/a/AATXAJzI1-FTGLasFkDqFPbDiI5-ABpGiKp479KE_usS=mo	\N	5	0	1.6.1	2014-02-10 18:53:45+00	\N	\N	gp:AOqpTOHy8QDFCTeer7f7-FymuTyfnGfmx87VaWXpC5_zwuOyB5nudmdvR3SHz5dNyYabM2KdDJFrgX90r2JRqA	3
599	Richard Kiser	https://play-lh.googleusercontent.com/a-/AOh14GiUdK4m7cwugfVw2N1jAZ6QXJPcZU-372lNf90uGg	Don't pay for ad removal... you will still have ad's.... 1 star for thst BS.	1	9	2.2.3	2021-07-08 01:07:13+00	Hello! Please note that our game is free, but advertising it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and appreciation of our work. 🙏	2021-07-08 06:22:24+00	gp:AOqpTOGSdf_DyI8SQQhjuLf7bsApNoSfHIHKSLAbZ40NCd0pXHy_dL3z_uUIbvC5MEWECgkB30CC7AIwiUrBmg	4
600	J. Rose	https://play-lh.googleusercontent.com/a-/AOh14GiHdDEdkGs_JixcgAyWWn2s4yda3miAqr_lW4uv9A	It needs events like tasks and at least have 20 worms per game that would make it perfect	4	1	2.2.1	2021-06-20 01:26:53+00	\N	\N	gp:AOqpTOHuqiKsa4L7QB_T2-Yu6QqAuzypOK9wH8CuGO4Rk1vzMXjpQVpSjQK9G8LT4Jme8Ov5vIH4QvDzNI8y6g	4
601	Joslynne Bugbee	https://play-lh.googleusercontent.com/a/AATXAJysafXcihHkd_pcPoGsnvrd5BPTGz_l2gRCLnSh=mo	Its a fun game it like slither.io but more fun and it food not dots also it gives u tasks so its a 🌟🌟🌟🌟🌟 for me	5	4	2.1.2	2021-06-06 02:44:37+00	\N	\N	gp:AOqpTOHIwuwlWeT2EN4iV_dskfwusKoQrqjwTL_IEkBHUAvIoglXJmvVlh54063tx-CQLwSw0rMAQywCxkwaGw	4
602	TERESA SARGENT	https://play-lh.googleusercontent.com/a/AATXAJwRnJL4C8kVDn2syox9NmNJi-CfX8bQRrFnlYJN=mo	Love this game! You can actually get in first place.	5	0	2.2.3-a	2021-07-28 21:30:31+00	\N	\N	gp:AOqpTOFCSq4IYPme3zacw0FmaDMfsDJw1Rf3ebpO0z6D3H5vc5uFzr5Pngxl1rmFylz3ZnlMiSWzpSAsxLbB-A	4
603	ARIIS Corkins	https://play-lh.googleusercontent.com/a/AATXAJx7zL9SBj8mepISwV3O3eYlxrx460Ob1xlMDaUD=mo	Would rate 5 stars but all the upgrades to my work and all my coins were gone when I redownloaded the game.	3	5	2.1.2	2021-05-27 23:14:12+00	The game automatically saves your progress. Install the latest version of the game and log into your Google Play and Facebook account. Even if you delete the game or run on a different device, the progress will continue. We hope this information will help you to evaluate our game five stars.	2021-05-28 06:20:39+00	gp:AOqpTOEjBM2nWr0h3pQIcAd6meTiIJS4d4ZB-mGIFiYU2xNJQDz2lO-kJVnlbd6Lysb2rh18WBY6v59ONDmcUw	4
604	Caeli Phillips	https://play-lh.googleusercontent.com/a/AATXAJwFUZiaE5fANadPAK_RsqXT6wzIzS9BP0QOTPJ7=mo	Intertaning, interested,cool, awesome, amazing, good job,u did an excellent, amazing job. Thx for the amazing game/;)	5	0	2.2.3-a	2021-08-06 18:49:20+00	\N	\N	gp:AOqpTOG34pY5KTUQOOV9KvVgZmXWiF8k2a43UtA6YmWfAlXH1WRVEqFpd-Hk9nbGSObIxZtOvISAaBUyxAHt-Q	4
605	Aaron Best	https://play-lh.googleusercontent.com/a/AATXAJwyKqcTYjr1ugcGWY5fwqEfbrkZNdrmT6gTTowz=mo	This game makes me mad but it fun and cool but it will not let me go into no time and that is what made me mad but it a fun game.😡😡😡😡😡😡😀😀😀😀😀😀	3	3	2.1.2	2021-05-31 18:53:14+00	Hello Aaron Best! Thank you for your feedback! Tell us, please, what we should improve in the game to you rate it five stars 🤔 😉	2021-06-01 06:19:24+00	gp:AOqpTOHm-tmMB8jZJhsEF0UUlpNDIAC-KRGXENpFMsAQ78l7ck9MPmli0H-V4haX4Ztg-t_5ou7FkniAP6bBuA	4
606	JOSE MARTINEZ	https://play-lh.googleusercontent.com/a-/AOh14GjETPpz3f6OL2okIn6w6_b9m0HLStAvUpwvcwYD	its ok.. to kill time... should have more game modes	4	0	2.2.3	2021-07-13 03:40:22+00	\N	\N	gp:AOqpTOF4IEG4zhZpOQ_dsZlupF_mRdZAwqgsTzhNIOSrBIth5CybmP9XJx-C6JN1BKjuwf0n9baLkRa1xF9yPA	4
895	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Yes	5	0	\N	2018-09-03 17:11:00+00	\N	\N	gp:AOqpTOGde4fVZ4fxkBlVOalqmYN0bK8BK4iJbFAJkgj55SKVB24I0BZFQzpjkRskn26zYev4yHit4k_oLvUc	5
607	robert Downs	https://play-lh.googleusercontent.com/a/AATXAJx4LYllMWEz3fDp_MR04lFnVMDSaHa7IQAStRXG=mo	Much like the game centipede. Very relaxing, easy and fun game.	5	8	2.2.1	2021-06-24 02:21:23+00	\N	\N	gp:AOqpTOGJD1KNwEzf0NGYEnAcAGeYg-1Xa7rHtwwBfV-CvlqqW5-tG-jwzCGFdmZ4IaxNiX2eJBdTFu5ULT17Bg	4
608	Patrick Walsh	https://play-lh.googleusercontent.com/a/AATXAJyso_CaVEdKpJXo4pRtc-_QNI_4nr_rvgRkzaqf=mo	Way way way too many ads	1	6	2.2.3-a	2021-08-02 01:31:11+00	Hello! Our game is distributed free of charge, and advertising in it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and high assessment of our work.	2021-08-02 06:41:43+00	gp:AOqpTOE5ilbETPKqcfVGv75PJ_n1caBStqIx8aVcSEQaBaeRcst68APDetzMsQk_1fZYOZ8QzpqU-6msRFrH1g	4
609	Austin ledbetter	https://play-lh.googleusercontent.com/a/AATXAJwupfF_gc8ey5cqFzcyICuR964cnXkfSzNLBA7V=mo	I died even though i didnt touch the other worm, please fix this glitch.	1	1	2.2.1	2021-06-23 16:35:05+00	Thank you for your feedback! Perhaps it is not a glitch. We think that you are playing in a mode with limited time. When the time comes to an end your worm just disappear. Or you are playing on a black background, where it can be black worm near you. We hope this information will help you to evaluate our game five stars.	2021-06-24 07:20:48+00	gp:AOqpTOHjF8G3sVy5cNkeSNBvsyNaB03zkhgZSFX2eHLjagCzO2VEmlXb63ZvrSzzWV3BD4P419ruCDjf4jeBtQ	4
610	Amy Hammer	https://play-lh.googleusercontent.com/a/AATXAJwNT27wPF-VeXqN0YAak05G969DGsVBYlwyYpc=mo	Fun, passes time. Needs development w/tasks as there is no reward so pointless 'cept maybe satisfaction. Also, PAYING FOR NO ADS, baloney! Ads happen if you want to continue to next timed phase, or to earn extra life. There are a few less ads if you pay, but it is NOT free from ads. I dont know that I would have paid if I knew ahead. Big worms do not mean the big scorers. Fair play otherwise,imo. How bout some team play? Either randomly teamed or form teams. So, different types of field opti	3	91	1.9.4	2021-05-30 15:00:02+00	Hello Amy Hammer! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-31 06:55:30+00	gp:AOqpTOGyOPPuI2GOU54elF_WWZK0U0rEpSCQAZMuqWbylc24jq800yQEIY4GbAixBlQf38i2YA4WzuqZR93tXw	4
611	marja muhammad	https://play-lh.googleusercontent.com/a/AATXAJwp1xjtg3YQ3nxpqBCto47cyco755FFi_NTeTuH7g=mo	Great game need pause button.	5	1	2.2.1	2021-06-23 00:37:38+00	\N	\N	gp:AOqpTOEVmudxvcSncE5n5HYhNr4Kyuhly5yjawzLEQN_gSVTWrX87PjXPfpuupuDGYriAP2nhv0bHfcrRbP0YQ	4
612	Antonn Lucky	https://play-lh.googleusercontent.com/a/AATXAJwnwV3-cGbr2udPtlCc6nbcOzx78a9BUTSQQg38=mo	I have been addicted to the game since my son has downloaded it me and him both are just happy I'm happy happy about these worms we got a happy happy happy worm	5	1	2.2.1	2021-06-14 04:35:30+00	\N	\N	gp:AOqpTOGw6MIg8I8wSyE4n1SIiWVc7Spe0U3w-ll8AesLnb59pBdx5kiTewfpVMQvwM2YjuoMbyti1-aAattSuw	4
613	Amy Mitchell	https://play-lh.googleusercontent.com/a/AATXAJxk67QrBXyIB_5QpcDnK9zJWtzdrW-k4bKUdNMe=mo	Don't bother. This game used to be fun until recently when it just kills you for NO reason. As with most games like this, you hit a worm, you die and it seems simple enough. However, once you get close to completing a task, the game just kills you. Period. Customer support is horrible, no one ever responds or you get some auto response. 0/10 would not recommend Edit: Still sucks. Now the AI worms will stop completely to kill you. Also, the worms just "appear " out of nowhere 🙄🙄🙄	1	9281	1.9.4	2021-04-18 20:59:01+00	Thank you for your feedback! Perhaps you play mode with limited time. Email Us support@wildspike.com with a detailed description of your problem so that we can help you in solving it.	2021-03-07 18:21:01+00	gp:AOqpTOHKimphBWGR3tO1Mx1B06dUUjqAQzEHTBh14UOGyV52g9N4JWlBF9zJNgCDbSfxQXzG7sAqBQQzoOEcKw	4
656	Kevin Craven	https://play-lh.googleusercontent.com/a-/AOh14Ggqwl6QoAJILFP56JkWUP4nzcs-Cnf3UrZ3Otx-	Addicting but needs a pause and an add time function for the timed option	4	1	1.8.2	2021-03-15 12:05:13+00	\N	\N	gp:AOqpTOGNzC2BMRc2mJLVTm0Ib8miguv0NEO2-uY-MIUIExRfneU51rTIFrTcTZX-c0Dw4ELG6lm2kn52uCKt8A	4
614	Kevin Crawley	https://play-lh.googleusercontent.com/a/AATXAJwBVdtR8W6B5qArFR-jFdRGvzYDfWXTCkBRUd-v=mo	Very fun when controls work properly. Sometimes your worm will do a 360 for no reason. Update: adding an extra star bc developers are addressing customers' concerns. I tried it again and the controls are still wonky. I appreciate the developer commenting but i don't have time for a game that doesn't work properly. If that problem gets fixed; this game is an easy 5 star game.	3	5323	1.9.4	2021-04-17 23:38:40+00	Hello Kevin Crawley! Thank you for your feedback! ⚙️ In the game settings, you can change the control to your preference. We hope that this feature will allow you to evaluate our game five stars.	2021-03-31 11:55:42+00	gp:AOqpTOEKQ58aT2iXbhQAsfKrlwEYoDq9WhspnVGNh0tDi6u2uthqZbK1Bo-H20wmqBv2ZroQuEfby0wcKCtWHQ	4
615	Esteban Patrocinio	https://play-lh.googleusercontent.com/a/AATXAJzBOqJqyaiaocrfiW41pV1dAqYYBkhhaujGmvII=mo	Thanks to my 8yr old son that he loved to play this silly game before he passed away last yr. Due to covid 19 now I'm playing this game when I need something to keep my mind occupied. R.I.P Bby E 5-23-12 - 7-9-20	5	1	2.2.3	2021-07-04 02:16:26+00	\N	\N	gp:AOqpTOG-ozasZmx9nFZo-udEJ-DqKPdbky-5XQz0ue6D80BujVs5-bS0B0AxczCmRFc1XN_HS0vfhVISU_TO1w	4
616	Gloria Jones	https://play-lh.googleusercontent.com/a-/AOh14GjopIWxV7uxUixjxcoSGIDaf1zvTeDurBb9h4vQ	As guest 136.010 Ipad I'm addicted to this game. I love and enjoy playing. I am not sure of how your system is calculating on the leaders board but to my understanding it should be ADDING NOT SUBTRACTING the food consumed. The counter keeps fluctuating from me being at the top of the leaders board to go all the way back down to the bottom. W/out dieing! The cheating on this automated system is very discouraging. You're going to lose players by not being honest with the point system. FIX IT	1	3781	1.8.2	2021-02-27 19:47:30+00	Hi there Gloria! Thank you for playing Worms Zone and taking time to leave a review. Yes, after reviving a part of the worm that crashed into the other player, has to die. However, you regain everything super fast after!	2021-03-01 15:16:28+00	gp:AOqpTOGhm5xRHFSzqvSyxongXID9Q_FhDKc_8zFkvSzq78XFbvT8zDQy_6SskA443l2mui7KrGaXVoLNHjQuWQ	4
617	Jennifer Figley	https://play-lh.googleusercontent.com/a/AATXAJzbgONGNbs1Q9wJTQQVv3hF5R-u61Dr8UvLZpLo=mo	Wish the goal were not limited to just 3 a day, didn't used to be. That being said, i do enjoy this game. I get caught up for hours playing after kids go to bed! There was an update a while back that changed some rules for worse. The coins should be x5 when u get the x5 potion, even the coins gained from killed worms. Used to b like that. Now, there is no way to get enough coins to upgrade ur worms to max, 95,000 coins is near impossible to get even when u get the coin chest of 100!	4	999	1.8.2	2021-03-07 22:13:31+00	\N	\N	gp:AOqpTOEz8Fok79QPLoaIfRoPRClw9P8zlSj504xQt7xa1VFlyYkpY6e4wSAAT7QBcltyvGfQTlu2tW4z93H6aQ	4
618	Nickolas Barrett	https://play-lh.googleusercontent.com/a-/AOh14GhEe30QSx3jzYOdO6xmhubQQMZvb1f5Bihu9m96Dg	this game is amazing but it would be cool if you could play with real people	4	2	2.2.1	2021-06-27 19:05:48+00	\N	\N	gp:AOqpTOEBnm7GoexkSmScnZi1RwTKuS1c-7tAUCn7EmOVfXqmBW-atmCDN0J9yCj4FXzg0svimn-oavrtmlOcsA	4
619	Pit Bull Baby	https://play-lh.googleusercontent.com/a-/AOh14Gg2vF-aYOUWkAnPvy-cwjktiLBHyd0TIE3oSfqk2w	Was a good game tell you took the good controlls away, its so much harder to controll now that the joystick stays in one place! I hope you fix that! Also you should make it where you can go into the same game as a friend All 3 of the new controlls suck! 2 of them have a fixed joystick and the 3ed is just stupid! Bring back the joystick the follows your finger around the screen!	1	5726	1.8.2	2021-02-15 16:38:47+00	Hi there! We've remastered the controls and now you have three options which you can choose in the game settings so you can pick the one that fits you most! Please check them all and find the best for you!	2021-02-15 14:55:01+00	gp:AOqpTOGGs0L3zxlYBU0tIwVOczUg59o8cfyBr_OFLBMPgqNVNYFTz22iBEELOz9zx3O6S8m91ZmZDhBi9K6mHw	4
620	QDawg Shinobi	https://play-lh.googleusercontent.com/a-/AOh14GjXSAQqZaWI9_yiRG0ZgjsmNtUr1Cn2eU9j22Kx	I love this one more than the original slither .io, Love the style of the it. But it could use some different music every now and then, and some brighter colors, and Why do I have to repay for the style I already created that's such a pian, but besides all that, if your tired of playing the old S.IO, Then here's a better one.	5	7408	1.8.2	2021-02-15 03:29:10+00	Hi there! Thank you very much for your review, we appreciate the feedback and very happy to hear you enjoy playing Worms Zone :) You have great suggestions - our development team will keep them in mind for our future updates. Keep worming!	2021-03-02 13:49:22+00	gp:AOqpTOGA6z0ySS2GcEKifnh0H6XCZYoGWaGWpJadJDe-nA_S505ArE_NSiLyWsE6PdeO1Ii0kO36hTU-0U4dAA	4
621	Ml Branch	https://play-lh.googleusercontent.com/a-/AOh14GigL5SSSUODbkKX0yUSEicVTomLPJFKg_LZw0AV	STRAIGHT THERAPY Seriously. To slow time (myself) down, to catch some relaxzation. Helps relieve stress. Helps calm anxiety. I have played this game and it is complete. The game does have "Timed & Unlimited". This game does NOT need anymore worms than how it is now. Play the game and level up to open worm "Wardrobe". The developers continues constant updates. Every game task is a way to acheive up. If you want a snake game that is different than Worms Zone...fine....go play that game. Amore	5	3692	1.9.4	2021-04-24 17:21:59+00	\N	\N	gp:AOqpTOHQe6fqbwqsgoePA1DSekxD6gPDHzddUgCwT0TCfG7YlhF5POqhn_8f2Nu9bOhik4DmBR62SsdX4mflGA	4
622	Charles Crawford	https://play-lh.googleusercontent.com/a/AATXAJxXRlFfR7vGFa0mciDQDlS2C715eyGe4ZB2Cld1=mo	unfortunately there is a glitch in the game that causes your worm to be destroyed by either an invisible worm or some invisible random obstacle. I have changed the color of the background so I know that it is not a worm that is the same or similar color as the background.	4	19	2.0.0	2021-05-19 18:06:54+00	\N	\N	gp:AOqpTOH_dOOnhYv7m-F7bpliLv18ZXgmrk94krlQhOcYE7r_66hSJQXc9Mi6Y0Igu3kmf-LkFhnOiu3BPm_KXA	4
623	Bob Clearwater	https://play-lh.googleusercontent.com/a-/AOh14GgaIWHtQ0B34_tskXQpec-8qXAp3vP78nAszrRx	Cool except it keeps ripping me off for coins. I set my skin yet when i come bsck later its back to the old skin and my 100 coind are still gone. Very very annoying as coins are so hard to get. Well it happened 2 more times today. Also when I watch the adds more than half the the time it chirps and dosent give me anything. Thanks but im not wasting anymore time with this bugged up game.	1	8015	1.9.1	2021-03-20 20:09:19+00	Thank you for your feedback! We listen to our customers and constantly improving our game. In a short time in the game will have additional opportunities to earn gold coins. Stay with us and stay tuned. We hope this information will help you to evaluate our game five stars.	2021-03-19 18:07:25+00	gp:AOqpTOEIOg6IpI1HF1f9NOUqRJPVYqnc7jUKw2mxWAabawkYlOdbV-Ljhbv8cdKrLCDnOhcDgiPYsl9liOgAwQ	4
637	Jim Stilwell	https://play-lh.googleusercontent.com/a/AATXAJzk2oHWp346X2ydn852k2Q-SwBahDjKvqBDNBdg=mo	This might to be quite a 🥒 pickle.. this game is being flooded with soda 🥤 😍🤣😂🤣😂😂🤣😂🤣😂🤣😂 this game cannot drive anywhere safe and time but this game has a freezer..... [Me]: (^-^)	4	0	1.9.1	2021-07-28 03:07:06+00	\N	\N	gp:AOqpTOG2hdeNnv68L4oGNWGqERLHwUOBHpJghfLmpFrFJ3vkNXdV3dkitTGrA-jtIVedkvJe3M2Cp3W9UJHARg	4
624	Kay Peck	https://play-lh.googleusercontent.com/a-/AOh14GhCxSxGXMZ17oDURAcNRG_z457Z9_bNwFYBWv1lJA	Can someone tell me why my worm dissapears even if I havnt ran into anything? When I hit 1st place and get very big, it dissapears. I used to be able to play in 1st place and get HUGEEEE, and now the game kills me off, like we arnt allowed to be in 1st place after a certain amount of time. It's frustrating. Other than that, very fun and addictive game.	3	814	1.8.2	2021-02-17 17:26:05+00	Hi there! Thank you for playing Worms Zone, great to hear you have fun! Is there any chance you were playing TIME mode when you suddenly died? Some of our players get into the process so much that they forget about the 7-minute timer. Please let us know in the reply because if not, we will be looking for that nasty bug. Thank you!	2021-02-18 13:35:29+00	gp:AOqpTOGBb4u5k6kE5UBxHq9miaQ51i0pDm5bDuJVJTykaAY3n7v6oZlQhYbGmIeBplRcaBl61ok2q4abxe0axA	4
625	Christiana Garcia	https://play-lh.googleusercontent.com/a-/AOh14GhioC60LhVgYUqFdqIWkalRwPew_4WCvlokErlmFR8	Cute, pretty fast paced	4	0	2.2.3-a	2021-07-28 15:38:52+00	\N	\N	gp:AOqpTOEaazUTVTsRE7DrB0szTcHHOkL9sT1A7-THscHj97QcjKnHtJcAOm41VjRQCt1fObF_sMmcM3U8QDnjrw	4
626	Lesa pryor	https://play-lh.googleusercontent.com/a-/AOh14GjLQB2v_zptb-mD3pHdrOsbC9VHaRCWrx2d2l1YYWk	I like the game but when ur getting in the top 10 and you get killed it's so annoying like me	4	1	2.2.3	2021-07-14 01:34:34+00	\N	\N	gp:AOqpTOGv5Uugzwx1AzJug8CafcQZfvXInxJKwKFFKMUQypXCFC7pkUb3MD-tG9I1A75s3NVB1k-s698M5IzxBA	4
627	ALEX Hirt	https://play-lh.googleusercontent.com/a/AATXAJzlGRJNElWlOt2R1KHZIjazeriy3Bg_W8UXg2rG=mo	Game is ok, ads are minimal, buying ad free does not remove all ads. Still have to watch them to revive, collect chests, anything outside of unskippable 5 sec ads aren't removed. Paying for this option I would expect full ad removal, not as advertised. When ALL ads are removed I'll consider purchasing again. Got a refund.	2	148	1.9.4	2021-04-22 05:28:24+00	Hi ALEX Hirt! When you make a purchase «No Ads», you will never get ads that you did not opt to see between the levels or just after the play. However, there is still a possibility to watch a rewarded ad in order to receive a bonus or to revive the worm after death because it's only your choice whether to watch it or not.	2021-04-22 06:13:54+00	gp:AOqpTOEDvXqcEZTOL_KlqDHQhi-1U3S-2efu77Rs39c6oKMP2vq_ay-ryepprzC07Zcm9DOzYfAZzmW9ht8Wcg	4
628	M	https://play-lh.googleusercontent.com/a-/AOh14GiovXVPSEE9q4M6f3PE8D1hRs60lw0I8ZEf-l1g6w	Best worm eater out there. Smooth controls. Only thing I don't understand is I upgrade my worm in the wardrobe then the bottom of the screen shows zeros for my upgrades while playing? Can anyone explain? Then sometmes I'll kill a worm and sometiges the other worm kills me in the same situation like head on.	5	502	1.9.1	2021-04-02 16:59:37+00	\N	\N	gp:AOqpTOFXgvQ2pZMb7afn37VKu0uWDncudfoW2S7buVKm6L1QZgQtr-syuxExeZI_XlLbLrtJzVGiYknZH_5VLA	4
629	Lisa Catlett	https://play-lh.googleusercontent.com/a/AATXAJxIkQ3k-lmz5DWMa-w9szqTfu3I-K3FNgIL2pGH=mo	Update 5 Stars . Come and Play this Fun Game It's fun to see how big your worm can get. And as I look At the reviews I see replies to their customers. You don't see that very much . I really like that . Bravo 5 Stars .! Very fun to trap worms. 5 Stars more . Thank You	5	997	1.8.2	2021-02-13 20:02:31+00	\N	\N	gp:AOqpTOFipMBt5_S9W3C5yYjUsdO8guMXg5I5xgdxMAYblQXjGPIVPDsnJlp-rQa98zUgUAitxE6jt9Q3zf_BgQ	4
630	Mark Tower	https://play-lh.googleusercontent.com/a/AATXAJzfzEBGlUuMhGAPOWiH8rTuFFrJNpEVnHHZM_RB=mo	Fun game, easy to control. Way to many commercials. I shouldn't have to watch ads for every time I start a new round and open rewards and double coins rewards. Pick one.	1	67	1.8.2	2021-02-25 23:20:25+00	Hi there Mark! Thank you for your review, we appreciate it a lot, and we are sorry for the Ads. We will improve it in the future and will try to keep the Ads from interfering. Improving the game in every aspect and making it a 5-star game for you is our main priority!	2021-02-26 13:33:48+00	gp:AOqpTOGYPDKbw4_deBp9KlLZcc_X89AU9afuDFKo5N4FUC_ALG0LEmy7rcri-yb24U3oSJBP8a6_WBqcoxBU0g	4
631	Wanda Brown	https://play-lh.googleusercontent.com/a/AATXAJxLMniddyQD2wcH8rl5vipfbQvKRT8heNUQllyv=mo	Love this game. I normally don't play worm games because I'm afraid of snakes and worms but my grandson downloaded it on my tablet and the first few times was horrible but he was persistent so I tried it. Now we play together.	5	69	1.8.2	2021-03-07 21:35:39+00	\N	\N	gp:AOqpTOGrJBDHEqgmj_LE2e8rrvlsgJsB3lgM9W8vJadbyrPxNzc6JZGTvl-67ej52POV3qQN2qjZwe6dOqyHRA	4
632	juseffie *noturdrmgrl	https://play-lh.googleusercontent.com/a-/AOh14GiAN7P8SljKxORC4a7f2Z5oFpRLQUChmO-TiDnzVw	Ok, it's an ok game. It's very easy but once my phone charge drops to 15% I get booted out the game losing all progress. It's so annoying!!	3	80	1.9.1	2021-03-30 23:52:43+00	Hello juseffie *noturdrmgrlMar! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-03-31 06:22:57+00	gp:AOqpTOFmD3Br8zm892scOyZZ0B60I5WywvQvTsQwowz4n2JDDZn4_y8vOUHYaEkybf877Qz5gxtmvueGxAa-9Q	4
633	Jasmine	https://play-lh.googleusercontent.com/a/AATXAJwA0wNLqDKf_pVznIlBisw04bLov3o0tJuoubHl=mo	A bug has me randomly dying with no other worms around and I am not running into anything. Please fix this, I love this game	3	22	2.0.0	2021-05-19 03:25:26+00	Thank you for your feedback! To begin, install the latest version of the game. Check if you are playing in a mode with limited time. Or you are playing on a black background, where it can be unobtrusive black worm. We hope this information will help you to evaluate our game five stars.	2021-05-20 08:51:36+00	gp:AOqpTOFoo3ve2kvWK9yInFo2iaXYB0n-Wbuj0Id8aRwtzlJSVtS18avkShFubgrHXtoJ35SfhCv8cvbOr6xp5g	4
634	Troy Setzer	https://play-lh.googleusercontent.com/a/AATXAJx2OQKjqppX852b6jXdYKPKRWDRag4LmkXdr75C=mo	Was pretty good game until I tried they different controls then the controls did not work well. I don't even hit the other worm and I die. I think I might be going back to slither io.	1	80	1.9.1	2021-03-30 15:21:07+00	Hello Troy Setzer! Thank you for your feedback! ⚙️ In the game settings, you can change the control to your preference. We hope that this feature will allow you to evaluate our game five stars.	2021-03-31 06:47:16+00	gp:AOqpTOHgfX_-LyrvHfsU9xuj69tJC1t1NzHH_vj5-3Fctfs3FOismZ7Kt1QlSbjz63lvz4o-xWxtXRArUy8nhQ	4
635	Marko Gibson	https://play-lh.googleusercontent.com/a-/AOh14GjAq7LI4IKZBAvzzbNf9I8DvWAy-5fnKxKRbT_Mgg	I don't think it could be possible to get bored of this game. My only complaint is please let a grinder like me make coin a little easier... Great game other than that.	5	149	2.0.0	2021-05-10 05:04:37+00	\N	\N	gp:AOqpTOGVqU6w3ErfSbY7R8g7UeuOPrwq42oxDIxg8lCi0ZB6nNfJ3JDBh2HrszHvD70sHzeVWRyNlM7_GUpbKw	4
636	Davionna Jones	https://play-lh.googleusercontent.com/a/AATXAJw8U7pnAl1YaqeJPfuk9lXi_IuaTPMoUklMN2jD=mo	Great Game need more daily challenges and different items to pick up then just food where is the candy and doughnuts better backgrounds	5	7	2.0.0	2021-05-18 01:41:21+00	\N	\N	gp:AOqpTOF_xR2AbNdQ_-MgFPkEfaJfAoFg2zCurBXNtbD0RqC9CwQL4V-qhRLVpBl-J1v3Cwc3J4ki5s5HSBPRww	4
638	destinie weems	https://play-lh.googleusercontent.com/a-/AOh14Gjvf80OaNS12zKsTR8JG15aa0BCtHBfLipVLhw	This is a fun game to play my youngest son started playing it and now I'm playing it with him	5	0	2.2.1	2021-06-14 23:53:12+00	\N	\N	gp:AOqpTOH1wrpc_uuqmXsAVthVuTDCpvV8iM0JV3gGB_9_Gr_MFXFy3R-ql5zpGcEewXPpBYn7SlBpiWH8uZom6g	4
639	Zachary Miller	https://play-lh.googleusercontent.com/a-/AOh14GhmKShOKbp3Dw0G68Ycrzia37Fi49DisQY1xf_DhUs	Way to many ads	1	0	2.2.3-a	2021-08-07 17:53:12+00	Hello Zachary Miller! Our game is distributed free of charge, and advertising in it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and high assessment of our work.	2021-08-09 08:03:35+00	gp:AOqpTOFlBAfoa-mjP5SVKLwusbVh0Qgs-zFUCMWXSUlzpJuWkzLRzB2NJBpMvheyhu2haSxAPHIRWWPTTuDHrg	4
640	Lady T Lady	https://play-lh.googleusercontent.com/a-/AOh14GjkqB2qnSNimo3axI8nQZ9BzkV1Eh1n-m_prMKL9w	Fun game, I just wish it was a little easier to control the worms..and I wish it didn't zoom in so close.	4	42	1.8.2	2021-02-18 15:01:20+00	Hi Tracey! Thank you very much for your review, we're happy that you have lots of fun :) We've developed three different control options which you can choose in the game settings and pick the one you like the most! Would be grateful if you share with us which is the best for you.	2021-02-18 15:04:35+00	gp:AOqpTOFrlwFXvWIoQJXQyqnIru6ONVpG7zOOBv0ojlYNuNAYC86T8r7LBMSwShwmZbHPQ6M-TNNPR25Kj0cNng	4
641	Danny Powell	https://play-lh.googleusercontent.com/a/AATXAJzkNDvThzXF3tGu4zvGooMMZG-R5RjmHx8p5t-D=mo	It is ok need a pause button so you can pick up when you have to stop. Also can anyone please tell me why I am loosing my ranking points. I am about to delete this game.	2	35	2.0.0	2021-05-01 00:48:06+00	Hello Danny Powell! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating. 😎	2021-05-03 11:21:55+00	gp:AOqpTOGMvER6R4bmP31e_21vAB6qEbTX6kP6wBx_tCANI-pQLAsMO3Cnxl9897BE0jvdt_RatU9A20_IuMX5DA	4
642	Erwine Fluermond	https://play-lh.googleusercontent.com/a/AATXAJwxntUk88SPvs_uTnRvDNTxTA7xB894d9Af-OEN=mo	You keep Minuing And you can't even play it You're keeping into people and you're just keep going fast and then you just die	1	0	2.2.1	2021-06-25 11:20:31+00	Hello Erwine Fluermond! Please note that this is a survival game. You need to collect food for growing up and become a huge worm. You can choose mode for playing - with limited time or not. Perhaps did you select a mode with the limited time? We hope that you will get a lot of fun and will give for our game a five star rating. Have a nice day!	2021-06-25 11:49:52+00	gp:AOqpTOGQAnPHs-KLYQ7CQXm3MQ_fzlS7NKZwYiBzGUWhhi2hELvzshPR9niR6XFGtDwfCAAkcLiG7nKMFsXkLQ	4
643	Jessica	https://play-lh.googleusercontent.com/a/AATXAJyaaJi7RUkonWCHmPCo0itQWlK9bLjqFIQzFn4x=mo	I'll keep dropping the stars til I run out n than just keep redoing my review been at it for 2 wks r more.i updated an it took everything I done worked for AND BOUGHT on this game away from me. I have contacted and "Natalie" has only done 1 thing n gave me back my coins n my level BUT HAVE FAILED TO GIVE ME BACK MY PURCHASED WORMS I shouldn't have to rebuy so when yall give me back those 2 worms and YES SHE HAS THE PROOF I purchased what she "needed to give it back"	2	3122	2.0.0	2021-05-08 13:33:32+00	Hello Jessica! Thank you for your feedback! Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it.	2021-05-12 11:10:51+00	gp:AOqpTOEUaTNqF7yosAyo9c49tSTOdIQoMshBFMFcbprgDZJfT0weJPUJwDmPCHtJVctFaUsBhBX-UBozUjpF7Q	4
644	Michelle Smith	https://play-lh.googleusercontent.com/a/AATXAJzFQiouUgHNl-VVNvCKsjAMOXiTwV0rAvAri3US=mo	It's really fun but it's stops like twenty times a day and it's hard to control fix this please thx but otherwise good game love it that's all	5	29	1.9.1	2021-03-24 17:31:25+00	\N	\N	gp:AOqpTOFhr1iZSR2bQBjVWnmOJ9brFim-cJI8jvhPr68dlpBMW0EAtcBTxqK2JdtnrRNx3UOb6vuZFzxawhhtig	4
645	Alicia Striegle	https://play-lh.googleusercontent.com/a/AATXAJwAL9tjzcMNVz--dQJV5lRVdBVTm1p7ooHXjZsC=mo	Ok so i like this gsme its my favorite snake game but im only giving 3 stars because now it just keeps crashing wont even load up i uninstalled reinstalled then it let me in it stole my game i had to start all over then in the morning it wont let me in again	3	27	1.9.1	2021-03-23 18:18:31+00	The game automatically saves your progress. Install the latest version of the game and log into your Google Play and Facebook account. Even if you delete the game or run on a different device, the progress will continue. We hope this information will help you to evaluate our game five stars.	2021-03-24 08:36:03+00	gp:AOqpTOH2y0yW4fFxr3QNwlHsbHXzvmuhS0vsWlFz-j5XK2ufeGc71LCp0_T0lgCloqnJQn4Dzwiy_rRxE7JUfw	4
646	Inoka M	https://play-lh.googleusercontent.com/a/AATXAJwOSA_4rYvy8NBiS8ehgQ-hBtwZU3-p5J-aLViG=mo	It's a nice game but the problem is that when I want to go fast I just lose the rest of the food I had eaten so I had to give a one star	1	19	1.8.2	2021-02-16 18:16:18+00	Hi there Inoka! Thank you for playing Worms Zone and leaving a review. Indeed, the weight shrinks when you are using acceleration for a long time. The heavier your worm becomes, the more power it needs, thus, your score may decrease. Use it wisely! :)	2021-02-16 22:27:07+00	gp:AOqpTOGo--wU_LmoQVHn1TexfQqBAfnTyu-ADvZi0_1-uZxjZVhNvx70qyUz3_wALRXP6fLp8sQuSKYpJRMJ7w	4
647	Lisa Davis-Lashley	https://play-lh.googleusercontent.com/a-/AOh14GgCcjvwSmy-QY3VgwISvzNBnT8uGE51zUiIXAP2	Awesome game. It realxes & stimulates the mind. This game is a 10!	5	0	1.9.4	2021-06-26 23:06:29+00	\N	\N	gp:AOqpTOErMKYuFkKaLXN-PnRzQeR6xmwzM4o4bV_XWELWTiZxDVzSc2XVogfcqLsISj9Fq0lNO4prq6BzJW01Fg	4
648	Sonnge R	https://play-lh.googleusercontent.com/a-/AOh14GgyI4yqriXmBilkegTlFXkqaG1n7OxMou6lkdgPeA	Fun but I like the other. You can revive three times at the same length.	3	12	1.9.4	2021-04-25 00:32:56+00	Hello Sonnge R! Thank you for your feedback! Tell us, please, what we should improve in the game to you rate it five stars 🤔 😉	2021-04-26 08:09:19+00	gp:AOqpTOEdlEhULjt2ehg_9DfbGa3kJQA78MetP9EVEjoX_5-8C8fnVutHk3iU6rpUoBrfCWiwRfeEaPgAfQQKvg	4
649	Paul B	https://play-lh.googleusercontent.com/a/AATXAJw4HxDr4cZbatx2PCg966V_LRcuZOnG8a_IY2ki=mo	Fun, but not as good as "Snake i.o". It takes a long time to grow bigger.	4	15	1.9.4	2021-04-22 10:35:34+00	\N	\N	gp:AOqpTOGrchaypzoIAjr5sxjUBpaWuoP2ReNprfgliiKl3pJkyf1zBNH-dNRxWY9vAXcr8L0YDvaCmG4VWbM6fQ	4
650	Michael Gott	https://play-lh.googleusercontent.com/a/AATXAJxyy-GXhz2qV1m8LCGg3UcHilecxQAeX5M79SCJ=mo	New controls suck. That is not a good update. Ive tride all the new controls, thay all suck,suck,suck, no thay just suck!!!!!!!!!!	2	14	1.8.2	2021-02-17 23:20:16+00	Hi Michael! Thank you for your review and we are really sorry about the controls, that was a miss. We will remaster them and bring the old version as well back in the next update. Appreciate your understanding!	2021-02-21 15:39:32+00	gp:AOqpTOH_5sCq53SnLckjNfGpcurLgiwxQs5IAooREyx6GgglI9ll3k3O0z75Ul4uuKJ5jcF0pMrt37kDdGvkqg	4
651	Priscilla Small	https://play-lh.googleusercontent.com/a/AATXAJzePVXoHv7J9HSGIyWwfHTrallEqsy8D7qmB406=mo	Good just kinda hard but a really good game	4	0	2.2.1	2021-06-28 06:15:39+00	\N	\N	gp:AOqpTOFXE6Dn0QuzQ9fVut8R0M76VKvo994RUfAFQT3ypKtWBryKzJMQvFY2cdUAxxmcx3PEhnTiY4DZfaCoMQ	4
652	Legobrickboy	https://play-lh.googleusercontent.com/a/AATXAJzso1t0fxUgydZo37mSq4oI3TzxqvOpGehl9_U9=mo	I rate it 5 stars because its just so good they have potions your worm gets big fast and u collect coins😃	5	10	1.8.2	2021-03-08 13:25:45+00	\N	\N	gp:AOqpTOHRWGkZiDziZasdMWint61Y6n_FoRBVgXgxMfSI-DB_zl8LDvdq1WMFxvR1u3VFRYIz6mvfU4WT0tTyhA	4
653	Cathy Kelley	https://play-lh.googleusercontent.com/a/AATXAJw21jgtv2rE41Fsbu0Ird5NAGno-D8RC5980hAo=mo	Like playing this game ever day. More them 10 times a day.	5	0	2.2.3	2021-07-17 03:48:38+00	\N	\N	gp:AOqpTOEYqChK6j89Yy3MfSnG5CHNSNYcfv1sGjg94eaZcDrtmpkqH4HZHP_eq6zFvqI1L-mTabSGRf0EtRT85A	4
657	Shiko A.	https://play-lh.googleusercontent.com/a-/AOh14GhtjFDhaH-jK22iz0M1UunG4QduK6DG2YjzvIp9Og	Control is hard,frustrating	1	0	2.2.1	2021-06-23 13:47:09+00	We are sorry to see you are having problems! The performance of the game is a priority for us and something we will continue to optimize. Also, in the game settings you can change the control to your preference. We hope that this feature will allow you to evaluate our game on five stars.	2021-06-23 14:16:48+00	gp:AOqpTOFI_WYyGzzFglaL_F1VsGLBjBe7maaU8W4zyAQjTO3ZjDYpD9bhbBrzE237ty-oorOrC6uL4X1gw6gM8g	4
658	Joe Pos	https://play-lh.googleusercontent.com/a/AATXAJy1e27pSKZrvhY1_5AC_f2HBBjQwZXdCivieeUZ=mo	I love this game it's the best you can even change what you eat I sometimes always die but I always win sometimes it's the best game in the world all of the games in the world but this one is one of the best ever this is like the best game I like the game because it's really fun and I like the different skins food that you eat the best best best game in the world the best game in the world you should play it called Warrior worm .io select the game that's what it called so you Short play it .....	5	8	1.8.3	2021-03-18 11:52:31+00	\N	\N	gp:AOqpTOHWP1F0wacIgBN65_k7vB1moYRJODLvxcUditMILKqUNpWkfR9BAjPPWzRoJskMmApvcTWv391qxn5Fbg	4
659	Tracy Getcy	https://play-lh.googleusercontent.com/a-/AOh14Ghnj0XDtYYVaMw9UhLovP7zvq-7a5jfibK3RBzblQ	Fun addictive play until you did or get eaten fun easy	4	1	2.0.0	2021-06-03 02:57:19+00	\N	\N	gp:AOqpTOEx9yEfk3R1vsGv6JzVrg9Cwcx4vUwT2ddI74GcdqOJA-L0qY55nBnFOJ00j2ODJ2ybdR7yKZQ2yzFSxQ	4
660	Michael Creamer	https://play-lh.googleusercontent.com/a-/AOh14GhuST5GRSsAEakKCzSbgJVQ8sN9JoLJFLOAmM9o	Snake randomly disappeared while playing.	2	1	2.2.3	2021-07-17 04:26:44+00	Hello Michael Creamer! Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it.	2021-07-19 14:02:31+00	gp:AOqpTOGvx4PNWFRqvj5vsrraImUGyXR2VS0I-aAa9_XN0rAKRPeSXWNFES6NArscw1Te5hunue4G-1x_0GycdQ	4
661	Simply Azile's	https://play-lh.googleusercontent.com/a-/AOh14GhmZtZi2fAukeAzBFHRDXKAHR4r1hBR0f060tAFKls	very awesome 👍 I would recommend this to my family and friends ☺️	5	0	2.2.3-a	2021-07-26 20:52:21+00	\N	\N	gp:AOqpTOHuegwOmQgrAgbBNWcILxpFJWbVFrpXAfx1hzSYK8rIApmeT1ghI9wGn61cgX-AYT2tqhZnDJsn6WQZSw	4
662	Shawn Taylor	https://play-lh.googleusercontent.com/a-/AOh14Ggf469OFZCp025h2MojEjIf58u12RlrgsyFeilg	I don't even play timer mode you always cheating. I don't even touch the worm. I died for no reason just remove that	1	2	1.9.1	2021-03-29 15:28:23+00	Thank you for your feedback! To begin, install the latest version of the game. Check if you are playing in a mode with limited time. Or you are playing on a black background, where it can be unobtrusive black worm. We hope this information will help you to evaluate our game on a five-star.	2021-03-30 06:54:43+00	gp:AOqpTOGH2vQulqIbKBkH7kTZPZkRb-fDN8geNG5o-S60j10JEoScYvstzuDy6I5aKaHpqcSd8vuhNNA17H92Zw	4
663	Nadine Russell	https://play-lh.googleusercontent.com/a-/AOh14GjAFkdCyF9tm5mcXGW-7lBZJO8eptxI7LEcZNGzSA	Good for pastime very addictive love it	5	0	2.2.3-a	2021-07-27 02:56:43+00	\N	\N	gp:AOqpTOHXvCDMHP-m5ojjDfgal3vJkbTRSdvmelSUyyB6hgAEHDZou_qYf15Tr_TMpdwmx9U2Mb26BeoELSVP7Q	4
664	Tom Kyne	https://play-lh.googleusercontent.com/a-/AOh14Gja33NSeO6eijefE-indYFr589KsVvI9QMDXbiSDA	I can't stop playing! Please remove this from app store. It's too addictive! Too much competition, maybe not too much bc there's a lot of losers hahahaha and I crush them like a boa.	5	5	1.9.2	2021-04-07 02:44:36+00	\N	\N	gp:AOqpTOFECCGvzgZPax_sma2iDwsV6sINgGAOv--XTKMfUp2T4HP4qZIYDoAKx69FSAZ4UGp0MjP1U4zhKHVsTA	4
665	Kelly Maldo	https://play-lh.googleusercontent.com/a/AATXAJz_dwe04XGzWQQCbjRAcrBXDjHTv_SHEVFhTNBqsQ=mo	I think this is a fun game.i want you to make more worlds on the game so it could be Cooler.	4	8	1.9.1	2021-03-24 18:03:53+00	\N	\N	gp:AOqpTOGAnoNan0lBD9PBx1Pky-2JlhFLoPYZcNBAOjuwDdE6AhgxDfonqrQvNLiE6xcgeHj2RT97mPZLjpCvGQ	4
666	Laurel Price	https://play-lh.googleusercontent.com/a-/AOh14GiVKNPBibCd4KN0EId29RPfqWcMQ5h6UmGNcbg2aQ	The main problem I have with TikTok is the community guideline AI, what it picks up on and how it cause total whiplash for creators in regards to nudity and sexual content, you have exceptions to educational, documentary and artistic videos. I make exclusively illustration videos, there is never any explicit nudity, no nipples, no vaginas, and no anuses. However, I have repeatedly seen full frontal bush, people making dildos, and underage children shaking their asses for a camera. It needs work.	2	201	20.4.6	2021-07-23 23:49:41+00	\N	\N	gp:AOqpTOHWfhNGh8qxj3gyGuirqoVoiOsl2HiBr4t3I1tuKTd05n8EI8szUDitPXTNANqTcEaKxklEliSSsza19g	6
667	Lucia Modesto	https://play-lh.googleusercontent.com/a-/AOh14GgrDhKDGbL4nDIrAV3z61nvuLBw_ezdJqGF4e8dEps	Everytime I go into edit a video the app shuts down which is soooo frustrating when you spend so much time editing in the app. I got smart and started editing on Canva, but even then, the app will shut down as I'm writing a caption but will be completely fine when I'm scrolling. 🙃	1	83	20.6.4	2021-08-06 02:48:04+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-07 10:59:44+00	gp:AOqpTOHsdwgNcNF7rRg7sciaBbNQ0aCHqnMgk5H63D61FAy4APN0wIzes6fBHrdo7s2SkJQdoxRQJi49JfbOdw	6
668	Zack Frantz	https://play-lh.googleusercontent.com/a-/AOh14Giqf-S1rhfIzx4qDpI-ROexoUyzhJhpfzJBK7tLgw	2 stars because there's no online mode. They're all bots, when I scroll down my notification bar it Pauses the game which ruins it for me. Edit: 1 star for The developer totally being a robot and commenting something unrelated onto my review	1	0	\N	2021-07-06 13:06:00+00	Hello! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating.	2021-07-06 06:37:34+00	gp:AOqpTOF_5d6kg0Y82XVOX8osZ9T3V-jl4MsXphn4LCNMI9zRn7dwKI9OBZ8Rq_wn9HhJp9yCdFJfnTGZUBGoQw	4
669	bidemi	https://play-lh.googleusercontent.com/a/AATXAJx1ZOtPvDnW__NzfCPU2bOUWe7qjo1qWF7EHG_xBQ=mo	This game is the best but just stop getting tired so fast and remove the ads	5	1	2.7.6.7	2021-08-07 22:33:33+00	\N	\N	gp:AOqpTOFK3sbl4a0m05own9PDLQYYZjM_BaSTVpIBnI3l0UAR8-BjOwbpqO1c3FVuzCaLstccH-t3rtrgir8Vlg	7
670	Frayr Wulf666	https://play-lh.googleusercontent.com/a-/AOh14GiweHuO3lLMRjhblUPHJT5789o2XXDQxzjYkOS8pA	Its cool but I don't like how he uses the bathroom and I shut the door and then it opens like I shut it and now it whants to open it gets annoying so can u guys please please please please please fix it it would be better if u fixed it	3	17	2.7.6.7	2021-07-29 13:30:25+00	\N	\N	gp:AOqpTOHKRtpvHdeaSfzGm2FejY9smV1WPR0dk_1KMbpF2nORe5hQXtgq8jPzQR-C6XDJdChlFBFG7jORVUwmpg	7
671	Jarod Centeno	https://play-lh.googleusercontent.com/a-/AOh14Gg-V7eDYcwZq0JJWBE5khvZxLBDxmR0iuEjID0n	I love this game, but why did I give it 4 stars when I love it well it's cuz I need you to make the time to sleep somewhat shorter cuz it takes too long.Thanks	4	293	2.7.1.11	2021-06-15 00:16:33+00	\N	\N	gp:AOqpTOFfsPZE_fPwfuXHysxeM38kfckOghwi9LJPB-1HO6Ce7E6QHMpgnurq7Jgykj2CDUNG-QkZp6KFUlYZGQ	7
672	Lon Minto	https://play-lh.googleusercontent.com/a-/AOh14GgtwgAjvBGR4BK8SaZRFkFtHgM3Yd4Sgfw9GexvBQ	It's like your own kid it's like you need to take care of the kids so it doesn't like it sad that it to the bathroom and make it go to sleep play with it yeah I like the ideas of it I like Talking Tom and Angela Talking Tom 2 Talking Tom friends I love the idea of it !	5	82	2.7.3.2	2021-06-27 14:23:36+00	\N	\N	gp:AOqpTOHxpu2aGSEwnRW-1RiMy0SwO_yGhJjXM5GBrM5M8y8PF8pSX0qcehJ2u2pxz--EMejCjSDs1z8s_snRqw	7
673	Tink Mcdonald	https://play-lh.googleusercontent.com/a-/AOh14Gjak77gco6gHQKpmspN8NIiDcDPqolfuymtFpV7_Q	I love love 😘💕💕💕💕💕 looooove space trails everything else is so so but I specifically subscribed and paid for this game just for space trails. . I love trying to get my family to beat my high score	5	97	2.7.6.7	2021-07-07 05:54:04+00	\N	\N	gp:AOqpTOG0Uq9cuWvrgWJFeG3wNX9PL4LA3zbTmvwnZLQmQYSEeC_hio_TegDvG1vHvrSkGhBsOeGa7J2b-TecgQ	7
674	Ashley Beistline	https://play-lh.googleusercontent.com/a/AATXAJzpXB_wo-3u8A6RJrf_o9bBDGnqanfQxDri-i-U=mo	My baby brother loves this game but I rated it a four star because of to many ads. But I do recmend for kids age 3 and 4	4	127	2.7.1.11	2021-06-10 23:37:00+00	\N	\N	gp:AOqpTOEhD2m4X0pPjm5lqdkWb1j_7PzSqpPDm-lYLnc4dqpbBjL81U3l-fid3KtbtH8yBVICJnbyWptr9HrzUQ	7
675	Nikki and Dave Taylor	https://play-lh.googleusercontent.com/a-/AOh14GhsuZzRIPhBvp2mbW8gA7kpUyeHKsX9TL23iAWbYQ	UPDATE: The developers changed how the mini game "Space Trails" works to where you now only get to play against bots instead of with other actual people. Very disappointing as it was our favorite. No fun when you can win EVERY time. :( One of the best games in the "Talking Tom" series of games. He's so cute when he's first "delivered" to the door but grows up quickly as you play. Our favorite game to play w/in this app is Space Trails, but that requires an internet connection to work.	2	6722	2.6.2.2	2021-07-16 05:51:45+00	\N	\N	gp:AOqpTOHckeVhEYHOVtJYiZgm0DpItd-5yY0qe_oCTA3ZqYEkv-VAYgYW-4xLnCFJjRogAHhyRQvtxlmkbySKBA	7
676	christina marie hilton	https://play-lh.googleusercontent.com/a-/AOh14GiGpim8MxKF1wmY1U7z5E0wFGKJCeefmwxGrUi6GeU	The screen freezes bit you can still do stuff while the screens frozen.In september and October i have had to delete the game three times,because when you get to level thirty the screen freezes,but you can navigate behind the frozen screen,just can't see where you're going!6/16/2021 It won't download.And,I've restarted the phone.	1	787	2.6.2.2	2021-06-16 15:02:37+00	\N	\N	gp:AOqpTOHxkqwd2iVdKR6OVH1ZTxWFOBSKTNg8Iee9_oaVsTfpPUXJ_96a2ycKhpD9TRJi3c7mpbMpuqb3rABY0w	7
677	Nick Miceli	https://play-lh.googleusercontent.com/a-/AOh14GjvaRVH_Dy29dxdripbU7macdHtYYMS9dktVdSaXQ	My daughter loves this game, it keeps her busy for hours, the issue is the ads. In the beginning it asks how old the player is so I think when the kids are under 5 they should cool it with the ads every few minutes. Otherwise we love it.	4	433	2.6.2.2	2021-05-31 01:46:15+00	\N	\N	gp:AOqpTOGz7mol1TPmsbVw4sSgDadCuvSRji7qlPiYJBHOfCaBH9OXqNhWVnn3QIizjUriOA6Q__LeCu28pPAliQ	7
825	tormisery	https://play-lh.googleusercontent.com/a-/AOh14GiD8BU4-48b8el1Q4Jv-WwlSy5QV-aayWqtCJjLOeA	A large amount of stuff, easy to search and buy.	5	0	1.5.9	2013-02-20 08:30:26+00	\N	\N	gp:AOqpTOGQzrHl3eFJRccFdN4s9KWRzMcbyhI12Swp4aROxShbvZoydIyP5bp6VK8Gq6cp7OYeuQIQPsUjAaWYSA	3
678	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	I hate this game. It's just, I like the prequel more than the sequel. because the sequel is just lagfest on my old phone. But I love it on my new device because it works better on the new device. Edit: rated this 2 stars, I lost my gameplay and can't get across the rest of the game	2	288	2.5.2.26	2021-06-15 01:07:00+00	\N	\N	gp:AOqpTOG6oWLxO3Nj41v16rrASkFFmmXgZFNwKGG1_1JytDNAhpphhowzK2t5MTFh87ZQ3YwiM8IhVhKz0xwXxQ	7
679	Melannie Charping	https://play-lh.googleusercontent.com/a/AATXAJxzDWHESbPkejRLy-cFBcwRLxkmPWrj4IHIYzvc=mo	I love this game, it gives so much things to do with Tom and you get to name them, when you get a new phone like I did. You can be your old cat, but the only bad thing is it's kinda hard to get new coins but overall great game!! Love it😆	5	115	2.6.1.2	2021-06-18 21:16:03+00	\N	\N	gp:AOqpTOHdZBGmzmpozwjgoyCgCkOJT09eR5nx3mFrUwD92jCZL1nppyTpUjEIDNQH_5Ekl8c4lKx028SVkUcYqQ	7
680	William Dodenhof	https://play-lh.googleusercontent.com/a/AATXAJxCftxEserX-QHpW1cMt24wYHkN8uBFUuH-Tirz=mo	Great game! I am always playing for a long time. But, please fix the space trails having to connect to the internet because my internet is very slow. So it takes a lot of time to connect. But, good job everyone!	5	319	2.6.2.2	2021-06-03 18:11:50+00	\N	\N	gp:AOqpTOHyJdiwPL5dD2dDzKbDtFaSdIORc5KKKB98axoy1HkyvWOjTIdZZheQWImrMVk3HEoccmjkSsyfi9VAGQ	7
681	Ashley Bradshaw	https://play-lh.googleusercontent.com/a/AATXAJzlazM3oXRy-krhTFmVIOKb0MplYpJOny93d1cy=mo	So far, my daughter loves the game. However, I'm noticing when we have the option to spin the wheel, she never gets more than 20 or 30 airplanes or 5-10 coins. I watch ad after ad trying to get extra spins to try to earn things for her and I get the same results. I can see every few spins getting the lowest prize, but every single time? This is very frustrating.	3	11121	2.5.2.26	2021-03-27 14:13:30+00	\N	\N	gp:AOqpTOHZKqXDkl5WhuR4FkDTQ-wVc8vn0PwHvBDcgP4FpXSPWwDFsy0QryOoF0LoYqa8Ue4YwtOuEy1GwK38VA	7
682	Aubrey	https://play-lh.googleusercontent.com/a-/AOh14Gjt3g-oMIFaQ0mMVOjuCfolwRIPHmU47Cx1iuRMNQ	It a great game but the only thing is, there is kind of to much adds and that is really annyoing with the adds so please fix about the adds a bit please. Ty. Anyway everything else is good I love to dress up I have a lot good bye	4	102	2.6.2.2	2021-06-04 10:18:48+00	\N	\N	gp:AOqpTOG2myUH8FrujW2-zPkimr7uzJvCpxmLDM6zQYDPVa_-tlZutsmUjo8SfnRdK_5xVkZkyxExMLf0XIqsUQ	7
683	Ghadeer Zablah	https://play-lh.googleusercontent.com/a/AATXAJzxVgCAZBNAoaorcgQMT9za3yYbUX9n18ow0hio=mo	Amazing and very entertaining, I abosultely love this game, however i feel that it would be an even better game if it had some sort of acheivments. I find those types of games most succusful in entertainibg me	5	451	2.6.2.2	2021-05-16 13:54:02+00	\N	\N	gp:AOqpTOFA2iAmH3arAGnQOwR3UHe64BcxVvZQK8kAUBtDzLcZst4g7nvkTkNBg9ZtDSlN0pB40cHNxasufE6_kg	7
684	Ashley Reyes	https://play-lh.googleusercontent.com/a/AATXAJwtAe_xs_r09zO5976qdl2iawT11gUXF2__IE5Q=mo	I love the snake or "space trails" game. Addicted. I dont like how tom gets tired so fast tho :(..<--left that back in oct 2020.. now its April 2021 and the space trails game is just too easy. It's like I'm playing a bunch of 4 year old computer bots and they are just so easy to beat. It used to be kind of hard to try and beat my original high score of 50,000's and now I'm at 147,000 ?? To easy. I'm sitting here thinking did they do age groups and I'm in the 3-4 year old group??	5	1569	2.5.2.26	2021-04-08 03:29:42+00	\N	\N	gp:AOqpTOGdiztY6iky123woKPUOTHyzBMElJhxhXhEvsdK6TvtMY2XEqnykCRLKWSOVdDkEpDOM0jFNuPQaPoNYA	7
685	Zachary Leiszler	https://play-lh.googleusercontent.com/a/AATXAJwxKcqd7kd829i-PVnFVQIm5QSvy9zY0XbPAOGn=mo	I like it, however there are way too many ads. As well as the app needs an offline mode. Also you need a Space Trails app. As well I wish that the ×5 effect for the game pad lasted all day like the little toy area when you use the slingshot and the pad. The Space Trails mini game needs to have a different way to control the character when moving like a joystick.	1	25439	2.6.2.2	2021-05-11 06:58:09+00	\N	\N	gp:AOqpTOF-hx5O6oBhBdxFQgoTZL-IjNDQol0yUUzl8nNmnwUEYxsPGtmmlMOwgT_eDLWCiqg0N-DMSffIrKRTMQ	7
686	Darek Kerlin	https://play-lh.googleusercontent.com/a/AATXAJxvbaI3IpzFhbhR5GPj76JxghAqNeOZ94tQu7xe=mo	Omg where to start!!! I love the outfits, space trails is amazing, and I love the reaction when your little pet eats the pepper!!!🤣🤣🤣 I have already gotten over 21,000 (On space Trails), the graphics are soooo Great, the piano you can buy with your coins is very fun....this is one of the best games ever!! Don't EVER listen to bad reviews!!	5	10858	2.5.2.26	2021-03-22 21:14:01+00	\N	\N	gp:AOqpTOFuZ5oKuYsV8DabfukCCK2SS2FOabJ-2IT5riwrJEeuhniaKhMLbTrwwUDx23UqTPRgVUtniBuBQInaBQ	7
687	Sim Beatz	https://play-lh.googleusercontent.com/a-/AOh14Gia1DOaQIjvwYImF6-dD7WnzozAP3BJlepc2PgO	I will be requesting a refund. I paid for the subscription to remove ads. Yet my son has to still watch ads to fix the basketball hoop and that's one of the only things he's interested in on this god forsaken app. Money hungry company per usual.	1	102	2.6.2.2	2021-06-03 23:08:23+00	\N	\N	gp:AOqpTOGKMGeVcpji4zu9eaHtDV4KrVct3lhlCuemL25tlGNzkKHRKEw3PMkDduWgOGsJdd-KmVUfP1vmn2Z0Fg	7
688	Lilly Pineda	https://play-lh.googleusercontent.com/a-/AOh14GgM2PiI-0WFwGyJ9UgDNoltDnczisnISfAegRc73g	Look we all know this game is nice. For people who live under a rock this is a virtual pet game where you have a pet tomcat named Tom (fitting I know) and this game is good but of course (like any 2016-2019 game) it's filled with ads in microtransactions. I'm not saying it's pay to win but it kinda is. You have to basically buy food and buy boosters to make everything good. Ads after every single "day"and more countless micro transactions including the classic "coins and gems".	4	1279	2.5.2.26	2021-03-02 15:22:47+00	\N	\N	gp:AOqpTOFNt3-5-xd7NWdpeMdpjhYKaPkzbBJ80g2z-HEG50b6zKT64rvlvRU9oNt8UWnj5eflCiESN6cbs1e5lw	7
689	Brian Mendell	https://play-lh.googleusercontent.com/a/AATXAJxlpitcdLQb1SzpOnPstlDtrAI-nwD2QUNYxGX-=mo	My 3 year old does enjoy the game....when she is not accidentally clicking on the 3 constant running click bait ads about auto sales, pharmaceuticals and military. Don't waste your time on this nonsense game. Way better games out there for children.	1	82	2.6.2.2	2021-06-04 12:24:52+00	\N	\N	gp:AOqpTOFjhZI_qP6T0CHuTSejmSwG5EfBGHZSCGz52vxexmX-eV6xj0Oo8WIBj0ASowO3HtcRfQuoXbbLXulx9w	7
690	Wayne Todd	https://play-lh.googleusercontent.com/a-/AOh14GieSOhDpnWzPzAqfkbAh7FhE1RYdIVvHhs1IDqi	Wow talk about spam central, avoid this game and the amount of spam they throw at you. I use to really love this game but after this one..... ya no. You can keep this game and your sell out ways.	1	70	2.6.2.2	2021-06-05 22:45:47+00	\N	\N	gp:AOqpTOHG8LOj6srzBsdLfPL8fXZN_MH0Pa01uz-rwBjHAqWmBG64vwJVT3qi-uefA3a0zRtGubXBusuEOCO40g	7
691	Ricardo nelson	https://play-lh.googleusercontent.com/a/AATXAJxkFRc_b6wTybDLEBCqaBH9kt-w62NghNSw-L_c=mo	Good game. Though I suggest a update that you guys should add a car and Tom can get in it and drive around the neighborhood and you can buy furniture and stuff.	5	164	2.6.2.2	2021-05-23 16:56:08+00	\N	\N	gp:AOqpTOFpzRbikKm0SOa8fBgbBoPyP3G0dkqP6EzTSefUt2YvPgl8Zw9FwD2u8vojyyGTECKnf6DC8xG_9CPmQg	7
692	Patrick Haas	https://play-lh.googleusercontent.com/a-/AOh14GjTZFaJ_emqiRVMlpxmgjOl1wFYHr4FAfNYgp36RAc	Space Trails is still not fixed. Why did this change to playing against bots instead of other real players? I see a ton of complaints about this issue for months now without any resolution! Please fix Space Trails. I have canceled my subscription until the corrections have been made.	1	9287	2.6.1.2	2021-04-14 16:01:13+00	\N	\N	gp:AOqpTOGAKuFOOYHpADLk3NXooJzxR9hAoRn9p5hpeBTZlPohMDIjVyMOgTYrnC9_HKg8MncGTjvMggDBg_8mhQ	7
693	Marilynjoy Yap	https://play-lh.googleusercontent.com/a-/AOh14Gh9hhcjuI180Ut3jUrW8Gt_lAyjFCOvgcjuMAkecg	While My Talking Tom Friends isn't necessarily less safe for kids than the typical mobile game, it succumbs to a litany of problematic trends that plague the industry. If you decide you're comfortable with your children downloading it, you should be careful to monitor the time they spend playing it.	1	1421	2.5.2.26	2021-04-03 00:07:59+00	\N	\N	gp:AOqpTOF0Xh-V_XGknBUPjkkZF-AXMIt1-irQjsVNLpXL9YWPNtbMEiOQ8aRntU0jgeQ_97guMhm_lFJ6kAvBFA	7
694	Kaleb Spitzer	https://play-lh.googleusercontent.com/a-/AOh14Gj_p3c99VzyAd3uBApyMBuGlicCEuE0HrR26I_qdg	Very good game but things are so expinsive and mixer breaks every five seconds it feels like and way to many ads and make you pay for anything other than that it's very good	5	95	2.6.2.2	2021-05-23 00:03:37+00	\N	\N	gp:AOqpTOEO2pLnWS0uK1qWzOEXZHFsl7PJsiEMopy4FNbNTkNLEVFUychFemhXn_JIfOjguLL-_pUorb9ooVaoNQ	7
695	Lxveley Latte	https://play-lh.googleusercontent.com/a-/AOh14GgtA_9D8wWNU-Zok781MyJk3f5M3BHMd0C3XZJr	Hey Devs! So I love this game and heres suggestions and stuff. So about space trails is true there IS bots but to fix that can you PLEASE PLEASE PLEASE .. Add something that says Do you want to play with bots Or online? So ofc they would pick online but I would pick bots because if i had a child i would want them playing safe. Thats all Bye!	5	480	2.5.2.26	2021-03-12 00:58:06+00	\N	\N	gp:AOqpTOHYhwpVAqEQ9XVsRwNgLW-jgKjh-DyM1IesXasgIYPM_dmPEliX0afIoH-M5jDpK6LyZqpGph35RhSSwQ	7
696	Raymond Hall	https://play-lh.googleusercontent.com/a/AATXAJy4ihuTQwTvGq9WzUaCmY5gHJSOd7hmtZzq9R2E=mo	Love this game for the "someone-needs-you" factor. The ads, however, have an annoying sense of timing.	5	107	2.6.2.2	2021-05-13 03:23:44+00	\N	\N	gp:AOqpTOF8J5oKTN7ZxYLNjRAo7t7SOYwINfH7HTM1zF3CnrrhZJIefZCG7u10XfDbTovs-8MuiJlTCx6ZkCKdQA	7
697	シ	https://play-lh.googleusercontent.com/a-/AOh14GjTVvap9iTSnTpQatkfopGYsRFAk0gJDkFIClF3ig	Stop. please read this, I saw a camera. This app is not safe. So I did not have a my location on before opening the app. But I gota Notification for one of my games I saw that my location was on? And in there other game talking angela, You could see a old man in her eyes. The games like this will track you. I know people where talking about this like years ago but it's not gone. While playing this game I always feel like someone's watching me. I dont feel safe playing this game. DONT DOWNLOAD IT	1	683	2.5.2.26	2021-03-17 02:07:43+00	\N	\N	gp:AOqpTOFXxcE8OUbLmDVRurQpLsEj3W1POTqpLn3ICK6b3lOLkjg7dV8S9Q_Gg4FbMFUXd13b_bF_SAjHLJxdVw	7
698	Nevaeh Williams	https://play-lh.googleusercontent.com/a/AATXAJw6klpIJbm63GCDm6tJBZsALIajQvwN0s9Aie3-=mo	Loving it because it has a little blob on the game and he is so cute and funny. When Tom is taking a bath, the little blob eats the bar of 🧼😂😆🤨. And you can even download games when Tom is playing a video game 🎮. It showed when he gets bigger until he is an adult.	5	418	2.5.2.26	2021-03-21 23:57:37+00	\N	\N	gp:AOqpTOFY--6xMiesA6_CYdrT45joNUdXVZbb7kU_VfC3er6R3zvb5bEUodLVqySM2p2E6M1oOUQfWqSQsr4Xhg	7
699	Diane Martinez	https://play-lh.googleusercontent.com/a-/AOh14GjjDMiAm4F2QfVJ8PD0rOt-nr_TTVswHIPsYS--HQ	My grandson loves this game so much!! My grandson laughs and laughs at what he can make the cat do, its funny, its a fun game i've tried it myself. Lol	5	92	2.6.2.2	2021-05-26 19:37:27+00	\N	\N	gp:AOqpTOEJ_VTU3J_LMXVj-qvKqgBrZk0m1PvgbJ2msgh1EZzkF3iEAG7oWMjdHCW_OPkA90FIJPNm4FirnUc_ew	7
731	lock	https://play-lh.googleusercontent.com/a-/AOh14GigMJZkzqAqlz9Kh51PfkOxT-AtAkudG8mXct7XQw	Very cute graphics upgrade from the first. Missing the option to pay a buck for ads not to pop up every time i change a screen.	4	22	2.5.2.26	2021-04-05 21:17:33+00	\N	\N	gp:AOqpTOHfuyOcdevWjFGS0APCypaS4sKQ_I5YLlbhvFqxbUJ3bEkjP-FfPdJha_l7uE0QiTOdCcIa-ojpRWsCEg	7
700	ISAIAH WORK	https://play-lh.googleusercontent.com/a-/AOh14Gg79jAoMcP6313ZOAJQ8wpc0UZO-8Lfecfe29mo	I would put 5 stars but sometimes the game just glitches out but I really like the game all you need to do is just get rid of a tiny bit of ads and also fixed the glitches and they'll be all good so also make the space trial one harder like yeah please do that also thank you for the game for producing it it's actually really fun but that's all you need fix	4	6607	2.6.2.2	2021-05-07 23:06:24+00	\N	\N	gp:AOqpTOFRY6DUx_aZeMfiTacfoKWzc3uarGc80EquQY29KjHdfVMnrArREFR4D5sDhx0gvFw4xFBFxxEYTikx7Q	7
701	Amelia De La Cruz	https://play-lh.googleusercontent.com/a-/AOh14Gin-MdA3_geTWo1c9ITyQa2Gdg9Y395B1XFMUks5A	The ads are becoming ridiculous where I have to help my little one click out of them almost all the time. A few ads would be ok, but they're all over the game and the screen looks like a computer that has a virus. Will be uninstalling	1	345	2.5.2.26	2021-03-22 17:58:40+00	\N	\N	gp:AOqpTOEKcxkisLhajHvLVy_lvcDFXyrUW12qEepScKOpwWn5dRsYaIyx9QIZcF4Oyvb4_bTFhP1kPNR_4je0xA	7
702	Emmi Ramer	https://play-lh.googleusercontent.com/a/AATXAJyz1Hr506s6PRrQfSM_t-JIywV-76OhL63fg4MB=mo	The only positive reviews are from children or weird men in foreign countries. This is a very cute game but my god the ads and pop up links that freeze your device are terrifying.	1	55	2.6.2.2	2021-06-12 18:39:32+00	\N	\N	gp:AOqpTOH_WfCjDjEsR0YGsXs5sZLXda60QqtUv0QWX-UE32UJnkpzHSsvWmkXykADXD_YxzY5DzSrO_ayW1CyzA	7
703	Rhonda Corbitt	https://play-lh.googleusercontent.com/a-/AOh14GiWd9MfrPPRlq9Uf_r9LafCJkmAUff7yL76prvx	This game is the best it is funny and shows you everything you do during the day it is great for kids to learn to eat sleep have some playtime and be aventurous this why I gave it a 5 star review and it has noooo ads notieing I have had this game for a long time now and never get bored of it I say you will not retreat it and it is free it is a win win win win	5	306	2.5.2.26	2021-03-28 19:54:11+00	\N	\N	gp:AOqpTOGfo72CCU8N6eI6-MIKCGh9azsU5fuZmdCZaBebA4hTmM8ln42vNWN3OYSe6T23sie4pzd8ftfVTYHbug	7
704	Sydney Sanchez	https://play-lh.googleusercontent.com/a-/AOh14GhDl2FK-PY9KivuuAvVCCaYo4iunZwvhFhJ-Czstw	I really like this game. Especially space trail. Sometimes it's the only reason I play this game. Yes, it does have bots but now its easier to win. My little brother also loves this game so ya. GREAT GAME.	5	380	2.5.2.26	2021-04-11 18:57:11+00	\N	\N	gp:AOqpTOHNDaYIDglIIKNC138bClhvfcmYHKfomZbe_aou3tpDs45V96nwEpDk3oFmKj1of0nP95-O_kKpkZfO4A	7
705	Jorge & Daniel Wilson-Coburn	https://play-lh.googleusercontent.com/a-/AOh14Gi0y0mBy9CgY1PY3KDwiN4IAq4F4YwAAjdYURN9	This game is so cute I love it it's kind of like owning the actual cat or a kid and it's cool that you get to customize Tom and I'm not really sure what Tom's pet is supposed to be but still it's a really good game and if anybody who's reading this you should totally download it.	5	354	2.5.2.26	2021-03-23 21:34:36+00	\N	\N	gp:AOqpTOHIpoA8sttWjRgpOEXnjQM9QAHB0GkEWFigBYkzPpXkIbarHgdEFTh4J4JNIBnTMo5W1xf2MwZ0j4yfhg	7
706	Adal Abebe	https://play-lh.googleusercontent.com/a-/AOh14GiZLTbskGd8qZlgO353lcbUDQfJJ0ggxD-RvJlBLQ	Why are there always creepy stuff like an Angela there is something in her eye and the rest of the games is creepy why do you make games like this nobody will like it if you do this. You try to make kids scared thays not fun this is not like a puzzle to find it its not funny.	1	62	2.5.2.26	2021-07-02 19:21:32+00	\N	\N	gp:AOqpTOGGpoDY_5IxHlz4R3eR4bUJ_4zOIFRJ85WOD1rJ4tIxptvDVBGRh94pwbiAkRoUr9b3Phky9JRBVkgCFA	7
707	Felicia S	https://play-lh.googleusercontent.com/a-/AOh14GiRdNb3OcQiDnL1RVnbUPtSS7cQ3MBaAPoyx3NtMg	The app will not load. Me and my daughter play this everyday and since yesterday the app will not load I've had to uninstall the game. Delete all cache and data and start and reload all over. Beginning to be more of a headache than our favorite down time.	2	173	2.5.2.26	2021-03-24 03:14:23+00	\N	\N	gp:AOqpTOFqEXyFPoASEX4axDyHnd1oecPr4wCED9UfA5HaATO_lwCt8yWcKCU4-X6URfScsox4ZDcTpQuyJHNtKw	7
708	Ski Smittle	https://play-lh.googleusercontent.com/a/AATXAJwiRhacNWjrPRLe611TYDXvWjsR4rsg5FCQ7w0=mo	I like this game it is satisfiying i gave it 3 stars cuz there is 2 things i dont like about this game. One is that tom get sleepy too fast and the other thing is you cant hardly get coins. In my game tom will be super hungry and i dont have coins or food. 😪😢😞😡Thise thing dont bother me too much but other than that i love it. If you are reading this ypu HAVE TO DOWNLOAD THIS GAME, it is SO MUCH FUN!!!❤❤😄😄😍😍😍😍😃😀☺	3	29	2.5.2.26	2021-05-02 15:45:18+00	\N	\N	gp:AOqpTOHIkkXeJcmf0egEdrUkYLT9xBqYOdQutAPb1ijjeQcFMNWrProPZlktTJYY39fzRpKerOoJvCy9hLRB_g	7
709	Isaiah Vazquez	https://play-lh.googleusercontent.com/a/AATXAJwtRLlZUwEMDb9MgprNpyrcpZPFZDjd7xQNwdWd=mo	It's okay but I like it and then but it's I can find stars because it's good you're training the cat kind of and I'm like like the first time I came I'm like what and I guess they're playing it and I was like this is a good app and waiting for my talking Tom 3 and hey Isabella and Shadow to smooth barber shadows to tay-k shadows to smooth extra and everybody right now #popsmoke #kingvog sorry if I I spell King wrong but anyways #xxxtentacion #juice world rip any girls that want me I'm single.	5	1309	2.6.1.2	2021-04-16 01:28:17+00	\N	\N	gp:AOqpTOEFXgb_qnCL2TC6gTQI-l7fi_HEMNQW1Fi2b3xjx3paUS7xcEefMxczec8SQw8TThFNpGzoCKvnXQT-8g	7
710	Gacha_Maker	https://play-lh.googleusercontent.com/a-/AOh14Gg3GPR1CTYPGj8Yy7L7tWE8csikprgWFXeV5nLG	Talking Tom is my favorite game you get to fly him. Get stars and coins, I payed to not get ads for me,it was only 5 dollars, that's so cheap, sometimes it only has 1 ad a day for me and I didnt care....this game......is FUUNN..	5	186	2.5.2.26	2021-03-13 02:12:31+00	\N	\N	gp:AOqpTOGTYistdKPC5F17A9pdBxOuZAdUMwR2jpeTz9YWMbs6edrClIX427ImZAlnSnJ-BZvKIDjuFk4P3HVQdA	7
711	Me L	https://play-lh.googleusercontent.com/a/AATXAJwBDOZQtX1TD23LstyhwkJ2h2tkn4mhMyurvtKA=mo	I used to love playing Space Trails when it involved other REAL players. It is incredibly boring now as it is obvious that the game just assigns random computer generated accounts that have snakes just crash into walls. PLEASE FIX THIS AND BRING BACK THE LIVE PLAYER DOMAINS!	3	393	2.5.2.26	2021-02-25 03:22:14+00	\N	\N	gp:AOqpTOGCkdm0pJf8SPMydqBwq2OHnoVcLRFexG9yjsgabLpD-y3OdvnMRXJqPb9iHmyOLCvgQvmFeSVAmYCTvA	7
712	Tokyogal	https://play-lh.googleusercontent.com/a-/AOh14Gg97VkiozsbW9UzAyTOHH-zzmQ8m1Xamuqs2zb6Ew	The game is good! The inly reason why im giving it a 2 is because theres to many ads. When i want to go the bathroom area.ad. When i go to the bed room.ad. So please do take the time to not show many ads because it does bother some people like me!	2	144	2.5.2.26	2021-03-18 21:22:29+00	\N	\N	gp:AOqpTOEh0URClm66qaol5SVV51uzNcF4Lenuy2CUQL82UenL05QdELIObLfu_DC_i0atoeeq0ET92j42labF4g	7
713	•Lil-Dumbie•	https://play-lh.googleusercontent.com/a-/AOh14Giq2wJZ_T2yREc2QRHZvXVAM0J8mYsQ0BH_Pjy7	Great game but,stop forgetting Angela her game was made a long time ago make talking Angela 2!!!! Its been long enough	5	46	2.6.2.2	2021-05-16 13:36:48+00	\N	\N	gp:AOqpTOHVjaYVyl7DfQcY6hZJdVwx4QEbJgbG7oaRUOhWLE6soSio4_dYWX7-rS2Bq16uCyGxNdn55O8UOlbBfg	7
817	Dasmir Amzaji	https://play-lh.googleusercontent.com/a-/AOh14GjceEATf7yvLm3lleiA6WISFlZvL7LaA-LDjc69fg	Grant ave	5	0	1.6.1	2013-09-06 03:51:06+00	\N	\N	gp:AOqpTOFJzKWEtEuXPHq4AOvXZ-KJ6SpNtoavzp2eJkt32IG5w1vAqSRG745yk0SLEAutyvUde8_KTLHwYzdmLQ	3
714	Hannah Saintil	https://play-lh.googleusercontent.com/a/AATXAJzYSyeFckCQvUlqhT35rqmsh_7dOy3pxg4_6tK-=mo	This game is awesome but you just have to hide the bad and think about all the good you could learn stuff and earn enough money to buy it without using real money you can use the coin but everything in this game is about like like money so you just have to try to make enough points and unlock it and then it will probably let you buy corn so that's all I have to say about this game and I think you guys I recommend this game because it is an awesome game and I recommend this game for you	5	1310	2.6.2.2	2021-05-06 22:18:31+00	\N	\N	gp:AOqpTOHq1juc4Dcq87vbc0MVdD4CPsA3UnVxhB0eUfIZqpRw7U52190-vQYL6Tody_Qro7ONvKDrteSZOnmE_g	7
715	sandstrider	https://play-lh.googleusercontent.com/a-/AOh14GhdEN1a8jGp7vX8VlOt88z5uX5ZSGhrRqdzK_dk_w	awesome sauce, but theres WAY too many "ad = reward" offers. you should be able to turn them off (after making an in-app purchase, which removes forced ads), because they clutter the screen.	4	1031	2.6.2.2	2021-04-25 06:27:12+00	\N	\N	gp:AOqpTOGD5_8eZVK85pNd5WCcTeUYKd70yhL1eAhlOlT03jyUu2kj3oYBnye-aubSul5nRtJyG-CLqKXZ5yRaQw	7
716	TheCaredkid	https://play-lh.googleusercontent.com/a-/AOh14GjseFxUlzjRUT4YplUDRG7sLaU3VZ-IykuwXY1I	He is so CUUUUTE the best app ever I am very rich THIS IS NOT A LIE 🤑 I LOVE THIS GAME also, I get to play with my friends. The only part that STINKS is that the toys break and I have to watch a lot of ads when I go the a room.	5	863	2.5.2.26	2021-02-22 03:37:06+00	\N	\N	gp:AOqpTOEIylp4j65gxECUQTSxKQf6v72d6WZYAZAqO95Dc5HUV7ck9YOOwQ4H-Wkucz2_4ISxFe4pI1XewK-WEQ	7
717	Thomas Tomlin	https://play-lh.googleusercontent.com/a/AATXAJyYjHRmxU1UoMzfKg81CU5vGI1GfC8ZuOm3EbNE=mo	So I love this game it's a really nice thing I think everybody should like it and I feel like I should be giving you more sore because I can never get coins like orange coins but it's kind of hard to take like my stuff and you only start with like 300 coins and his health keeps going down but after all I think it's kind of a good game	5	103	2.5.2.26	2021-03-29 16:46:16+00	\N	\N	gp:AOqpTOGmtyz2ysWB7YErhwLigtfgtjcoCYXN8UfDFpqZi-1pMTXF6IAiqcCQTTUlYPCvmWrFCJp2co5UtjfBTw	7
718	Julinna Leroy	https://play-lh.googleusercontent.com/a/AATXAJxKMpdIoxwddZ7T2D8vVxti3m0NJHPgAA28sOHo=mo	This is the best game so far it's pretty fun also ya tell me about it I have been getting Ads to it was alot so y'all better fix this problem cause it's a problem to all people so fix this game that's all I'm saying please 🥺🥺🎥.	5	154	2.5.2.26	2021-03-16 11:36:53+00	\N	\N	gp:AOqpTOGPyNZiq31n4RMWDXrSysZr590iN4QVxxXL_ZGEZK1GSj79eJ1UoRCw4dSla7VeXimu35Wc46Jt3IgadA	7
719	Eturnel flame	https://play-lh.googleusercontent.com/a/AATXAJwrHxrC1x95hX7gwY8XIQj8r23eeVGP9yzVKmSC=mo	This is a good game, but the ads are stupid!!! I think tom should cry after a minute if we do not pick him up out the box or play with him.	1	54	2.5.2.26	2021-04-08 11:24:29+00	\N	\N	gp:AOqpTOE28GC5b9_RVHCsBpmYWWPmhFnMlAkyi8oj0qW28S9vGX8_gDHMhCg3e1em_TOomD7SJbXXSAVOkQRBFA	7
720	Dr.GameSpark.5017	https://play-lh.googleusercontent.com/a-/AOh14Gh0tm56zO44kMTi-auPQC0lfVOExVuK9NF71JpA	The only thing I do not like about this game is the fact that when I am flying, I get a box with the same thing and get only 15 stars. Ether give me more stars or make it where I can not get the same thing	4	18	2.6.2.2	2021-05-28 11:18:45+00	\N	\N	gp:AOqpTOHbdQLeO2b32QbO0-TSCT1cPkEE5bI6Y7IEcVhij1KL7RN_MgrVCm2eZeV2aSXKJhiz-IU901N87ms2Gg	7
721	Sabrina Bird	https://play-lh.googleusercontent.com/a-/AOh14Gie7ICFJHd5S4vu75lRWmxcZJceFkrBAPuTOyt6Stw	Way too many ads, and also sometimes the game won't work, you can fix this by going to the home screen and back, but it is tedious and aggrivating.	2	444	2.5.2.26	2021-03-25 20:29:47+00	\N	\N	gp:AOqpTOHqvfVmsvKqXa1ZiXZeBfl-NRK-LL9cdLooeeeQfcxCpV_aZZm8KCbtk-JpupB4CHGiCByRY6U6UozC5w	7
722	Piglet plays games	https://play-lh.googleusercontent.com/a-/AOh14GjSDvRk2HT8zsq79jJnkM0WVMKpVSqaUoZXhlsy	I played this game and the fact that you have so many ads in this game is unbearable I cannot deal with this number of ads.	1	23	2.6.2.2	2021-06-06 10:37:32+00	\N	\N	gp:AOqpTOG0NmZMPTJzAu7_8MxTT-qAmQaunHxLqcCBsrJuugCAYNUyu0Yt5q9dqb2WVlgcx6gQgIaoJpSD7lCXrw	7
723	ghosty the smile monster369	https://play-lh.googleusercontent.com/a-/AOh14GgYYvh8SHEv6FDfLTGLgxGx-n0An453bcBb2FhK	The reason why I gave it 4 stars is because in level 20 when i go to the kitchen to feed tom, it starts lagging, "Oh Its Your Internet" no it's not I tried it everywhere	4	92	2.5.2.26	2021-03-13 08:20:03+00	\N	\N	gp:AOqpTOEVzKgUA_hKGiSlPrn9jMpjNgrVD0FmBICUW-O3pCGAEZOustt_80nFojXfWtW7Q7e3wQSNxwf0_AY8kA	7
724	James Lee Hickey	https://play-lh.googleusercontent.com/a-/AOh14GitzngOubgsAQ6DCb1id7X5gVM0_yHAjErotwhcBQ	Too many ad's every 5 seconds i have to fix the phone for my 4yr old so she can continue playing your game .🤨😑😶	3	9	2.6.2.2	2021-06-29 13:56:21+00	\N	\N	gp:AOqpTOFJ57f_36al34AOZSbN4t6otJdTzvfPXX9lbAH4Mg_aZDj71OW7aPao-vA24Wy8i1u-_qoXr2_aYwYk3g	7
725	Gonzo Pugglefish	https://play-lh.googleusercontent.com/a/AATXAJyJ9LL4b-2k_xlqrzBMi4-f-j79alRHpvjKaUEi=mo	Good game and is funnie, I love the mine game rocket tales. At least that's what I think it is. It should have its own game in my opinion.	4	61	2.5.2.26	2021-03-19 13:52:44+00	\N	\N	gp:AOqpTOFyT1v2VJqNqBC42tB5B_y9QErPSLbSumIB3iUuMhzOYU6qSh3pVbTJC8xc4ni-zhgg0oIIveeg0k8Ytw	7
726	Alicia Winking	https://play-lh.googleusercontent.com/a/AATXAJw4YqbcZ5yHdJ3h5Am4Din_1tchsABri4sr8cMZ=mo	Been having TONS of issues lately. Game keeps freezing and shutting down every single time my kids play.	3	33	2.6.2.2	2021-05-20 08:04:10+00	\N	\N	gp:AOqpTOE2CY_CP2UIeJ6knH-_QOjzgpA0yHxf5J45pekkdahi0AkDDKpOe_vFaU_8aBJ8SAygBS_jOhNBuYuDsw	7
727	Candy Unicorn Girl	https://play-lh.googleusercontent.com/a-/AOh14Gi6Lnm1IGjF5j9SPH5bVEUthtxcjLqVXIsNeUqP	Fun. Love Space trails. I uninstalled and reinstalled bc it wouldnt let meh play. Good game tho. Edit: Never mind. Im so angry. It keeps doing that. I have to un and re install. Its fun, but not this. Fine.	4	45	2.5.2.26	2021-03-23 16:01:53+00	\N	\N	gp:AOqpTOGTUn1mawKfpi8Fst7w-b8eNb2v9Vrd29hQi9vOuQUUKAcXb_apBfXozTSKOC03TNFr_peeAPot4-NcFw	7
728	aswathi jijeesh	https://play-lh.googleusercontent.com/a/AATXAJyYwHffJiEWr_5uID04LlAuiKMguzKUcm1gqTts=mo	I like the game but when a press a button it freezes my screen and make it black but the game is great keep up the good work!.	4	118	2.6.1.2	2021-04-20 03:15:15+00	\N	\N	gp:AOqpTOH2uFDvY7VVHROmT6K2d2IkffYxWwcIvYcSNWWvMyoXTFMB540HPcaskBXrW613rYrKeHAPO-xGk5FXKA	7
729	Melissa Biscamp	https://play-lh.googleusercontent.com/a-/AOh14GiwPrft7QMWltzI9GwsYtftebp3CMnMUE6xmKgS	Horrible game I'd u download on phone on my phone it's add after add😠😠😠😠💯! On my tablet there aren't ads unless u wanna deal with ad after ad then don't download on phone!!!!! 5 stars for on my tablet tho	1	53	2.5.2.26	2021-03-10 23:58:22+00	\N	\N	gp:AOqpTOEzCComg00j7DNNLmrThVuyyzN-nW_UkKVdODp62WPXlv2AN8YYdAvvt5JVmxhYV1hp_AbHYB5Qz6vnQA	7
730	Tiffany Dupree	https://play-lh.googleusercontent.com/a-/AOh14GiOlsRgslKNtpKLnoS27gI2ogx8DX0sSE4k2_Na	I don't like all the ads because my kids always hitting them any crying about it so It's to much of a headache but He really loves the game wish He could play with out all the junk in the way	4	46	2.5.2.26	2021-03-15 01:13:55+00	\N	\N	gp:AOqpTOGMx2L9QLq8a6_hCm17j4urP-x7UjLQheLN7na400UyFNT9Nk85f4WKOh7ezP91IRXMkE-MTAC2uKLeWA	7
732	Chris S	https://play-lh.googleusercontent.com/a/AATXAJz_DmKerS1_MH8IOa_mycrrw7j_GHJsOwINrlfI=mo	This is a awesome title! Its fun when you are in a bad mood or have nothing to do. But remember not to download talking angela, its very creepy	5	15	2.5.2.26	2021-04-10 15:34:07+00	\N	\N	gp:AOqpTOGuZlnZiJIKTlkjpdK5b2bCKXBL1T5CPRqXKLl0DmRf8vob29dswR7CSYrVMO7zE_sAZVP05o4JtYmBmQ	7
733	Lilly Smith	https://play-lh.googleusercontent.com/a/AATXAJx991tjip0R8H64y0KMIueAnwIWvWW-B5ZDVvFI=mo	Do not get this app!! I decided to download this app big mistake I looked into the eyes really closely if you could see there's a man in the eyes he was staring at me I was trying to communicate with the hacker but he didn't say anything he just communicated my voice don't get this game!!!!	1	70	2.5.2.26	2021-03-12 19:01:39+00	\N	\N	gp:AOqpTOHRw5PRRW-S7TWWvJvGyaH30SR8yUsRJMRtlhs2DPqHSFec0Uq-26yPq-n_sULWOEVwf-hLfpOuJ7OEHQ	7
734	Gabrielle Mathews	https://play-lh.googleusercontent.com/a/AATXAJxT4fZL4PyabZVfTrLRxr2nXc8UQiTXzZrV5_gz=mo	After updating it became boring. I wanted to play with the pro! Where are they?! I played for them for years but now I don't see them anymore on space trails arena! I hate it. And one thing, why Am I the only one playing?! Omg! Should uninstall asap.	1	52	2.5.2.26	2021-03-03 05:27:04+00	\N	\N	gp:AOqpTOGnG2hFikwnFKt3OeWWbYL1XLO5xfI29m12jed_Fbv7CLxF7phIn8CHunGYJNDo1RPbfRgVahls8oPSsA	7
735	Adalberto Estrada	https://play-lh.googleusercontent.com/a/AATXAJzsfvDhSJJCsI99Jzr2SGSIJBlbIvQgciCPgGym=mo	Awesome 😎 But I need more stuff to do and the blender (mixer) keeps breaking and less ads please otherwise it's the best game in existence	5	48	2.5.2.26	2021-03-14 19:18:26+00	\N	\N	gp:AOqpTOE9ng-dgptVRXQJC-hZzXnBRHU8u5I1EGFxm728kTNd7LX4sBlTJIOT0Et5Lz2-tEFe4sEpr-96zYmkDg	7
736	MJ Niu	https://play-lh.googleusercontent.com/a/AATXAJys38i5Be1xQ7CyipR7ipn1pwb6-JO9Q8gxC-jj=mo	I think it is so fun and if you are thinking bout geting cat then downlode this game and its allso fun to just play!!! (And for FREE🤑🤑🤑🤑) so downlode this game now like now	5	26	2.5.2.26	2021-04-03 22:26:38+00	\N	\N	gp:AOqpTOH1K2HaCrI0Fos5lFReKtoez0NMAsguFv-YB2drd3hPGJpt0W90TWtSOVOcSJHaLttRHh8EQbH_nuxD0Q	7
737	Andres Higareda	https://play-lh.googleusercontent.com/a/AATXAJx8lle9FYYdPj0p1RRrVNARNXGkBs05WQjlWQTd=mo	Its a good game and there's barely any adds, has other mini games inside the game itself so tom won't be bored and to get points. You should get it	5	30	2.5.2.26	2021-04-07 22:38:23+00	\N	\N	gp:AOqpTOFbDuSFREwXu9UqkH3oX9muUbd3JM02A7iTCy0VJ-grMeY0v9VV9G4-lLNj3gwxBRAa04v6qXMnA_mSoA	7
738	Danielle Baggett	https://play-lh.googleusercontent.com/a/AATXAJz-UB9M4GQ-61eX4Gvkdd90d1FDHN7mITKFyCYx=mo	I usually play everyday. Since the latest update, space trails has completely changed. It's no longer fun or challenging. Y'all should've left it alone. I don't even want to really play it anymore. 😔 please change it back.	3	59	2.5.2.26	2021-02-26 15:54:05+00	\N	\N	gp:AOqpTOG4QRMJl8_xkRuz2vhbR8yLhjVi243WqffCj4XJvOSmzgSfxx9I_65PPXuhagR17UUDQBpnc9dAHB0wKg	7
739	Evelyn Brooks	https://play-lh.googleusercontent.com/a/AATXAJyK-Hm-SUvZc3N5jtkxrwntcTZQ88jKGFTh_tR-=mo	Love this game! So much to do! The app keeps closing on me. Could you please help? The app froze this time. I lost all of my collected flight. Please help.	5	2180	2.6.2.2	2021-04-23 13:10:37+00	\N	\N	gp:AOqpTOGb06Il9grHUihORwxYGf_fo3qYvu96A7BVr_4RzZdFBJpZJJrKoPNDvV3V21IPyr0ZZlfUbU1ho08VgQ	7
740	vampirewolf224	https://play-lh.googleusercontent.com/a/AATXAJx21K552lKDTVCAB7FgqdQnTYCka02-9-HygVBT=mo	I use this app quite a bit, love it, but I do have one request. I'd LOVE a sort button or "to bottom" button so I don't have to scroll thousands of videos to get to my earliest videos.	5	1	20.6.4	2021-08-09 08:00:25+00	\N	\N	gp:AOqpTOForpVDAoo5o0xAB7ZY1rCZNDItrApEPAwutTmvNMU-m6CWA475uBF0NdvZFNqFupOT2jXUaoIfWWvMfQ	6
741	Alina Goriounov	https://play-lh.googleusercontent.com/a/AATXAJyMeLZm9ZJdIovU-q7wlsQuawIRUA6KjC41MZr4=mo	Great app,makes books shopping easy and fast.	4	0	8.7	2020-05-27 00:05:52+00	Доброй ночи! Спасибо вам за положительный отзыв)\nВаш Ozon	2020-05-27 00:54:20+00	gp:AOqpTOFONhGXxhZvMiSPgJy7jxNVdjTnBiDccv74bc-F2RM8Rn7TpeQ0TFHEsMUnSKTGuAE9ymZs36zEkpHInw	3
742	Oxana Loginova	https://play-lh.googleusercontent.com/a/AATXAJz6BFsnh7hUoJ6y4X8jqCz5yBkdP0XKYp8uOD_h=mo	Great experience!!! Really recommend this app to buy some presents for your relatives in Russia 😀😀👍👍	5	0	12.0	2021-02-03 03:44:08+00	Оксана, добрый день! Спасибо за прекрасный отзыв. Приятных покупок. Ваш Ozon	2021-02-03 05:05:47+00	gp:AOqpTOHnDm37D463Yv2DXbuOhhv1DHxA6Ea4QahF2L-DclF9SmYEwI9HWFhItbkUYowF8zla3j2W9T4WUCOhIQ	3
743	Anna Rybaruk	https://play-lh.googleusercontent.com/a-/AOh14Gief3rzm1NJcCD0RnxbiTxtM7bwXeNRo0Ou_pTJMg	great app, good prices	5	1	5.0	2019-04-14 19:27:28+00	Thanks, have a nice day!)) Best regards, Ozon.ru	2019-04-15 02:27:38+00	gp:AOqpTOGS_XAtGnF_hikac91BzStssCPwKwUzlXx7Ade3eYaK9gsx-7a4WpfpXEOWVT1gvu5QPICclofFX91A6A	3
744	Nasiba Alizada	https://play-lh.googleusercontent.com/a/AATXAJyHvtEelu7-psgPkMaWw8_7-7LCZT8jn-w2z6fc=mo	Very interesting and very important app. Thanks	5	1	\N	2019-04-14 22:21:33+00	Thanks, have a nice day! :-)) Best regards, Ozon.ru	2019-04-15 02:27:49+00	gp:AOqpTOGz7RZZuY5Mi50NTUifPniw_aQIIhAMlK9FhzYMqDi9T8zXTnlggdvHVjFTYu9Z2qcGzh3eyNmSErHuoQ	3
745	Mike Marcus	https://play-lh.googleusercontent.com/a/AATXAJyP6a_YODsSbCJGmN5rscqD6MNODW_c3dl6zQLJ=mo	One issue you need to fix they language are misunderstand	3	0	\N	2020-07-19 18:02:16+00	Добрый день! Спасибо за отзыв, данное замечание мы учтём. Ваш Ozon	2020-07-19 18:47:59+00	gp:AOqpTOHETT3-X3FH8YFNxh7kUpKAEsawROYUQ6cbLRmJO7C9xU8zvhDcsy2S86A3AvlNeTqMyl8lq556TEY58g	3
746	Olga H	https://play-lh.googleusercontent.com/a-/AOh14Ggawkjki8w3O_mCH_rS7FJHyj3cfK8qEvwcIRaP	Very convinient app	5	0	13.4	2021-05-14 13:41:26+00	Здравствуйте, Ольга. Спасибо за 5 звёзд. Будем продолжать радовать вас дальше. Ваш Ozon	2021-05-14 13:47:28+00	gp:AOqpTOFgmBUmzP2nZIROhHKpGwgzxUE6Reqi1oK7V7QsyO_N9Xi_cPX5L8xhD7qJ7PtMeSZORe4H8jeUVsEuhg	3
747	Mariia Iureva	https://play-lh.googleusercontent.com/a-/AOh14Gh_ufhBeN21q1Wj98b-drgDkTDrlFX4NX5BO17b	Good app to order russian books to US	5	0	13.1	2021-04-15 22:34:58+00	Мария, добрый день! Рады высокой оценке и дружбе. Ваш Ozon	2021-04-15 23:33:42+00	gp:AOqpTOHteeQuCPIG0sHqe5FBSySuyRyxlxdaXB9i79vWi7KKZPz1aQcOLxy2J06m9CNhJNMt9G4XJmoYb1WPhg	3
748	Andrey Antonov	https://play-lh.googleusercontent.com/a-/AOh14GggLekeSMP4OeW7-fXGWH_UTfv-VKdVzI2ywFLjKg	Everything is perfect!	5	0	7.1	2020-01-30 12:05:58+00	Андрей, добрый день!\nСпасииибо :) \nВаш Ozon	2020-01-30 12:47:30+00	gp:AOqpTOGrj33-A-bDz0pR3nScUM-OcjdBPJrD5v1JlYQuWK5LA7aVllmbE525pIlBmQSOd0f1flxH4_R5Qdv-8A	3
749	Wi Wi	https://play-lh.googleusercontent.com/a-/AOh14Gj3VEC2MMtm1rSHJEK0ewjk2YrXtvCRjxOsIZwBng	Ozon is one of greatest online store in Russia. Probably the greatest.	5	0	10.2	2020-09-07 19:30:12+00	Добрый день! Очень рады, что смогли заслужить такой отзыв :-) Ваш Ozon	2020-09-07 20:23:38+00	gp:AOqpTOET2tj6CnxZUkiQP-wX8t-OAK3u1Ir_ngki2mL7NRtV2iiR972UuyNY9eDtJdAaVFl1S-7vNndbH3NHag	3
750	Andrei Pokrovsky	https://play-lh.googleusercontent.com/a/AATXAJy2YpP5VyJdZzhANJKv40JWBnMW-D5gcWKYptLhU9U=mo	Better than Amazon	5	0	13.6	2021-06-02 08:07:39+00	Здравствуйте, Андрей. Благодарим за отзыв и оценку. Будем и дальше вас радовать! Ваш Ozon	2021-05-29 17:31:27+00	gp:AOqpTOFeVJcqvqylD6DHcZ0nfQ_z-nxRnQSLjme2c5h6xAfkiM-E8h018ITLTt7lq2uvkkXa7ZOQUIzXElgU0w	3
751	Kristina Simonovska	https://play-lh.googleusercontent.com/a-/AOh14GhAy9ysD3eayRQKxHt-zoU6Ih8i7CrS-bNV2FCyPg	Too many bugs	2	1	7.1	2020-01-26 18:03:12+00	Кристина, здравствуйте!\nУточните, пожалуйста, какие именно ошибки возникают в приложении и при каких действиях? Мы всё поправим.\nВаш Ozon.	2020-01-26 18:44:37+00	gp:AOqpTOGKJahQ0Bm8BvKjr_M-PwcJUTT1szXI9-qjHmvMF4opZ_GB-gFxsblVRqUmex0TyRpxcXoqLbXGOXW6_A	3
752	Anastasia Ignatova	https://play-lh.googleusercontent.com/a-/AOh14Gj_XeDsty64TjAcia14j4uLRPOVmwCyuZDJEeh1FQ	Very nice app	5	0	10.3	2020-09-17 09:32:03+00	Анастасия, добрый день. Спасибо большое за чудесный отзыв и высший балл. Ваш Ozon!	2020-09-17 10:49:23+00	gp:AOqpTOFFmveu-j848tG5cjCIwCV3Iyh9jSubsXS2hXtTRdXogiidbwjfstpvhauh5zm5eaqFDymSTFngSHqAuA	3
753	Svetlana Avetisyan	https://play-lh.googleusercontent.com/a/AATXAJzyMTxhEmJGhNgCrTIh37TIpayQlowK0KG1zJvt=mo	Avoid this shop, very disappointed...	1	3	\N	2020-02-23 06:43:06+00	Добрый день! Нам очень жаль, что у вас сложилось такое мнение о нас. Надеемся, что у вас появится желание заглянуть к нам в магазин. Ваш Ozon.	2020-02-23 07:00:07+00	gp:AOqpTOG6j_UHqN4dmuRdyy7gDGlJQk-SzQT467KeEJsCexjCDoer9Q1cfePL3bs2NBZJctXNJvaqcwyTfVcf0Q	3
754	oleg IM	https://play-lh.googleusercontent.com/a-/AOh14GiC-3d1nX2fC2ssAqVGVcs7ci03aXxOHqfKiT6oqg	Works well, easy to use	5	0	13.17	2021-08-10 11:31:40+00	Здравствуйте, Олег. Спасибо за высокую оценку. Ваш Ozon	2021-08-10 12:18:27+00	gp:AOqpTOEIBWXxgqQgBcfhEIj8cwKAodRyLBcq4mRuTA0NNle1rvBUFYWu3YQS6WymWzQuAp65srFup0UoErAfOQ	3
755	Ivan Efremov	https://play-lh.googleusercontent.com/a-/AOh14GgL1Bk09r31WRStsABePdj6fIAWkqRG_Ydck6oHvG4	👍	5	0	13.16	2021-07-31 13:53:13+00	Иван, добрый день! Спасибо за отзыв и 5 баллов. Рады, что приложение вам понравилось.\nВаш Ozon	2021-07-31 15:07:57+00	gp:AOqpTOH_rMMgSQY9yjU0iKUzOW1Z_UT-IqnulORPLI4yFriQh07qlSRQD7qL8pWRNSsviZ-y3flE1O5R6br69Q	3
756	аня барнетт	https://play-lh.googleusercontent.com/a/AATXAJy_NLRN4JwE-FfpAi04z-Qv_67iRN2f416weW_-=mo	Love it	5	0	13.12.1	2021-08-07 22:55:10+00	Аня, здравствуйте. Благодарим за высокую оценку 😊 Очень рады, что вам нравится наше приложение! Ваш Ozon	2021-08-08 00:27:03+00	gp:AOqpTOEMQIhQ5JGUaIt2EiWoahRF31knFN2vUmUCLCBeEQQAq0gpVNzl2467O6cEktdDqVs2yqDrKs0NpLvkqA	3
757	Inga Vassileva	https://play-lh.googleusercontent.com/a-/AOh14GghHWBbyr_s-rrq2qG66HDiAiAOnkpj7r2iS1wN	Точно. Быстро. Честно.	5	0	13.11	2021-06-29 05:43:19+00	Инга, добрый день! Спасибо за отличную оценку. Приятно, что вам всё понравилось. Надеемся и дальше только радовать. Ваш Ozon	2021-06-29 06:41:59+00	gp:AOqpTOFoM9o4L0HmaijCSIx9xR_YVPnXjhP0gYd9v7iaEGSxPdSGaJGkGQS5x5aMoAvhULoAiJmMqgg0VbMnYg	3
758	Anna belle	https://play-lh.googleusercontent.com/a-/AOh14GjtIl4cYKUj0gP2i3P8Q5ry_EAskubTrFiEQRigNg	Удобное приложение, но.. Снижаю оценку, с включенным ВПН не работает ни сайт, ни приложение. Спасибо за рекомендацию, мне проще не использовать. Не понятно такое отношение к пользователю. Так сделайте доступ. Не понятно для чего такое глупое ограничение	1	0	13.10	2021-06-21 20:25:00+00	Здравствуйте, Анна! Понимаем ваше огорчение. Рекомендуем очистить кэш в приложении и выполнить переустановку. Если это не поможет, перешлите, пожалуйста, текст вашего отзыва, адрес электронной почты, название устройства, версию приложения, IP адрес, версию ОС нам в чат. Постараемся помочь. Ваш Ozon	2021-06-21 21:42:58+00	gp:AOqpTOF4bBOrGCcqV9cSxf0JXUd_EVDwAdddK8Hf5R_WZ87cR2x9siW-AKe15FinNvWjowZtaQWK9sVDHw3H-g	3
759	Max G	https://play-lh.googleusercontent.com/a-/AOh14GgKbla09edBPZmtiBqk1Y30H5s-so5Pe43NgiwA2A	Бутылка сиропа разбитой пришла, вы хотите, чтобы я ее возвращал для рефанда? Смешно.	1	1	13.9	2021-06-18 20:06:21+00	Здравствуйте. Сожалеем, что сироп оказался разбит. Напишите нам Вконтакте https://vk.com/ozon или любом нашем официальном сообществе в соц. сетях. Во всём разберёмся. Ваш Ozon	2021-06-18 23:01:24+00	gp:AOqpTOFoYXAppGEYI12zTRN4xtSzgir4mPjjpLC_UVXHzwFw2Vo2srW-13-K0pFp2MikjSwoQfkSnfW7BcNKGA	3
760	Alexander Libin	https://play-lh.googleusercontent.com/a-/AOh14GhbklQCEsaBtP7AQVArNMZidoNUtbdul6tNxyV4	Отлично как смогла, быстро и надёжно!	5	0	13.8	2021-06-13 12:55:11+00	Здравствуйте, Александр. Мы рады, что вы остались довольны нашим магазином. Надеемся и дальше вас радовать новыми покупками. Ваш Ozon	2021-06-13 14:05:34+00	gp:AOqpTOEeCBvH5lnj4o-rEah0fCI6iBW2AEr40mQaEtkgpvq-Esct9PJz_l0u0LfbvhiOzSUOEq9MThPkazS2QQ	3
761	Anton Cheshkov	https://play-lh.googleusercontent.com/a-/AOh14GhrA8wG0MxE-Xj-Fk44-kQQQeYUN10cfdNKQ1QxKw	Само приложение хорошо сделано. А вот от компании всегда ждёшь подвоха.	5	3	13.6	2021-05-29 13:13:21+00	Добрый день, Антон. Спасибо за отзыв и высокую оценку. Рады, что приложение вам понравилось. Уточните, пожалуйста, о каком подвохе идёт речь? Вы можете связаться с нами в чате или напишите нам в ВК https://vk.com/ozon/. Мы разберёмся. Ваш Ozon	2021-05-29 13:59:48+00	gp:AOqpTOFSZ7LsCjwygFtp4cCT46sQy6MnSg6A03Hdl97aKyU3xU1WFSyY8BmXjynbpyedb8d3XfRHoEqFsW4IYA	3
762	Tanya M.	https://play-lh.googleusercontent.com/a-/AOh14GgUBeDwXiEolks6Jl-IRUf3Jh8obxEsB2AbHO8Sxw	Отличное приложение!!! Огромный выбор товаров на любой вкус, приемлемые сроки доставки и доступные цены. Очень удобно совершать покупки, не выходя из дома. Всем рекомендую 👍	5	0	13.4	2021-05-10 10:55:35+00	Таня, добрый день! Мы старались, чтобы заказывать у нас было максимально выгодно и удобно. Спасибо за отзыв и 5 баллов.\nВаш Ozon	2021-05-10 11:18:56+00	gp:AOqpTOHtmF3RrfDDWWqTKT9YGxnUUYRhFp4k93vEK6s9LmzY-rBpwjKtfLZhdYZMk7fea6OmSmdu_XnX1z6YMQ	3
763	Lena Demesh	https://play-lh.googleusercontent.com/a-/AOh14GjTRm9L3qyIPpCK6x_W4qNZiaxLfIo3gv0GjXUffA	Удобно и быстро,спасибо	5	0	13.4	2021-05-09 12:03:47+00	Здравствуйте, Лена! Спасибо за высокую оценку. Счастливы, что наш магазин вам понравился. Постоянно работаем над качеством сервиса и доставки. Ждём за новыми покупками. Ваш Ozon	2021-05-09 12:30:16+00	gp:AOqpTOG5zZMK6QwNu00TxV4OOW4qG1XQpTLvKRaHdEiUbh3_nS1WZeUB2-3wnQgi--G40--RQxiSYE9_1ObeAw	3
764	разумный червяк 2005	https://play-lh.googleusercontent.com/a/AATXAJxrq5_1mkP0n0KnQ_jbFhukH05aluV8bMZuEoUn=mo	Приятное в использование приложение	5	0	13.1	2021-04-18 21:26:23+00	Здравствуйте! 😊\nРады, что всё нравится. Спасибо за отзыв и звёзды.\nВаш Ozon	2021-04-18 23:26:23+00	gp:AOqpTOGB-9tyY3I7LWk1e4TT_EyH5uZrdkUG7e4mEkkuuyBzz-ajt2-QEXY8zsmvpi2DF1hShjrrbsfyWo-8ZQ	3
765	Руслан Карпач	https://play-lh.googleusercontent.com/a-/AOh14GiF-zpq_Q9aX5CJHUdT5HOXkfX56VBPQ7iSTPVTSQ	Все понравилось, до пяти звёзд не хватило лишь возможности смены валюты цен.	4	0	12.8	2021-03-27 09:15:31+00	Здравствуйте, Руслан. Спасибо за отзыв. Учтём ваши пожелания. Будем продолжать радовать вас дальше. Ваш Ozon	2021-03-27 09:45:23+00	gp:AOqpTOF50FJuZqvsRfRsApu7fkDlBK0xuuaF55fM5JLE_nvHDfj-Ts_m4FAeMFnr3AfOz-AX0QearI-S8VQIYA	3
766	Tamago Jiken	https://play-lh.googleusercontent.com/a-/AOh14GgDDbuQiNuxUKcoHaSE5yRp_6ReCILHKWW1nKn6oQ	Thank you!!!!	5	0	12.7	2021-03-18 05:45:47+00	Добрый день. Благодарим за отзыв и 5 звёзд. Рады стараться для вас! Ваш Ozon	2021-03-18 06:41:15+00	gp:AOqpTOGQdVA5sXOU_z1Pm5KrdROENl7w5U3bj2tdKcvQhLPVEI9AgRyd7j8LbenY5FI83PDEYbsKNsX0uVuEBQ	3
767	Алексей Артемьев	https://play-lh.googleusercontent.com/a/AATXAJyVuVz1VP1WMtj3u0iyIw7-RfXnqUY3ABTzfPlr=mo	Awesome app!	5	0	12.7	2021-03-17 17:37:51+00	Здравствуйте, Алексей. Спасибо за пять звёзд. Рады, что вы остались довольны. Ваш Ozon	2021-03-17 18:22:15+00	gp:AOqpTOFiSEgbtZvJKlDljk2g5PjIDWnukjEgrJsOrLmBPdkCVD-9QmCxqw6HhlbyrC9vVLGV11Uf80VIZHqsXA	3
768	Gulnaz Nazarova	https://play-lh.googleusercontent.com/a-/AOh14GiCeKpZlfr6db81DHVXgZX8LH_pP4qA3ct8m_HQZ-U	Очень оперативно и удобно	5	0	12.6	2021-03-12 19:37:00+00	Здравствуйте, Гульназ! 😊\nНам очень приятно, что выбрали именно наш магазин.\nБлагодарим за отзыв и высокую оценку.\nВаш Ozon	2021-03-12 20:29:58+00	gp:AOqpTOELMBg-Huh7F7PgAWcvtQYM-cjnT19N5QGwaxL4NFWOMofW-QsOzoc8_2kTqbMtbXUfr6MPjSZE9mYVew	3
769	Sergey Karpenko	https://play-lh.googleusercontent.com/a-/AOh14GhOAMWeJMkYRRUW4HFyoOxjZh2PZYOZbASPO2RJW3c	Great!	5	0	12.5	2021-03-05 20:34:09+00	Здравствуйте, Сергей! 😊\nСпасибо за отзыв и высокую оценку.\nВаш Ozon	2021-03-06 03:02:17+00	gp:AOqpTOE9HeHM9dre4j5w7wiwexLAESfcg8lGwXKkqjZN6M2gAdlFPgSehnOuuHWki8QGsnRNCAxjX7NmEOQogQ	3
770	okulodeTigro	https://play-lh.googleusercontent.com/a-/AOh14Ghh2pLw7_JNp6nJBRX9L0zQuH4uQC5D9AgGCcn-	Если уже привязан телефон, на который приходят одноразовые пароли, то одноразовые пароли на почте, это уже третий фактор.	1	0	11.9	2021-06-14 16:39:11+00	Здравствуйте. Двухэтапная аутентификация применяется для вашей безопасности. Чтобы не было взломов личного кабинета. Будем стараться стать для вас лучше. Ваш Ozon	2021-06-14 17:49:25+00	gp:AOqpTOHoEiGvDZEo09-JW1Na-pYNQVzYAeoVsux6auCdoJAlYczXJdaLI-hz046P3CZiUcJzL65KFXNzmmtblw	3
771	Anna Korsakova	https://play-lh.googleusercontent.com/a-/AOh14Gg6RBeckn_N316DnGgXnpdXfqWHWqTyoIIDbSindg	Приложение работает отлично, всё удобно.	5	0	11.9	2021-02-04 17:01:47+00	Анна, здравствуйте. Спасибо за отзыв и 5 баллов. Рады, что вы остались довольны нашим приложением. Ваш Ozon	2021-02-04 17:53:44+00	gp:AOqpTOFk3LFbKQM44cY0EoTiDYsvEEu0jpzbUtvEpj8NHYsYh_u-to0K04LuMkBJ3aFSAouO-mJp_uMZLyczHg	3
772	Ekaterina Shergunova	https://play-lh.googleusercontent.com/a-/AOh14GgEMKWlNg4ROdZsVjkZUoE71GT-DVfduSRYmTPcMA	Very convenient	5	0	11.8.1	2021-01-14 15:42:33+00	Здравствуйте, Екатерина! Спасибо за пятёрку и отзыв 😊 Рады, что приложение понравилось. Ваш Ozon	2021-01-14 17:03:31+00	gp:AOqpTOEDgW5O4y0GJQgI7EzZIQ4zdGfMuwfPqvg5d9oudg7gqvJEb4ek8kyNpFkrblesBr6uT83n83uh-m5RhQ	3
773	T U	https://play-lh.googleusercontent.com/a/AATXAJyDykwF4AHNOQxjSbiU17RWWPsUBI69YG6H_Cpv=mo	Useful app	5	0	11.4.1	2020-12-03 10:44:18+00	Добрый день. Благодарим за отзыв и высокую оценку. Ждём чаще в гости. Ваш Ozon	2020-12-03 11:46:01+00	gp:AOqpTOF0DKqDCK1aeDi8589m10Pj7Gvtdv-Po1bQUAOLaqDscxfzGZZtGXTRChnUaQ9GsG5QahZRv_MiPpMPag	3
774	Yan Feldman	https://play-lh.googleusercontent.com/a-/AOh14Gga7L4vWki8hX-fK6mYhhkMdubdUeSHide37O1Maw	Удобно использовать, забираю в пункте	4	0	10.3	2020-09-17 08:55:02+00	Добрый день! Спасибо, что оценили нас наивысшим баллом. Будем и дальше стараться 😇. Ваш Ozon	2020-09-17 10:12:47+00	gp:AOqpTOEbmtJxULXDfSRLJum9RKev15H7dYzcz_jICV9gAuXO7dwbEbp09TLzM58RzaE9BnomVtzkWaZy31QxSQ	3
775	Sky Hi! Greens	https://play-lh.googleusercontent.com/a-/AOh14GiDeH57ynSsNDvkFTQtB46NNS43mQm0zwDj2yq0Aw	Работает без косяков	5	0	8.7	2020-05-28 07:18:19+00	Добрый день! Спасибо, что поделились мнением и поставили нам 5 звёзд :). Рады стараться. Ваш Ozon	2020-05-28 07:37:07+00	gp:AOqpTOFmICg-i6Q4DluwHXBjsnm_2FylPxkzSZiY5Q3FJl96cxgXmKUkbteOLY64NkocFnFnaFklP23g9w97fg	3
776	Vitali Pokalenko	https://play-lh.googleusercontent.com/a/AATXAJzVD_uGXegEglcK_7Q6wIxQNdesDEk9BF0q400o=mo	Very good!!!	5	0	8.5	2020-05-27 18:45:43+00	Виталий, добрый день! Спасибо за позитивное мнение о нас. Ваш Ozon	2020-05-27 23:10:10+00	gp:AOqpTOE-hdpxFmsiWw9CW0kTQEg25Zd9pDCbpZCnxIczDexiG-qF8J5bJjZY5k9a6gykpBcVaZLHmKYYD7nGBQ	3
777	Oleg S.	https://play-lh.googleusercontent.com/a-/AOh14GjtRz4LloUFI-_MMp5GdLmrfZKe9ecjmA0kb3kkDw	Верните googlepay для оплаты. В последней версии адрес не запоминается и приходится вбивать каждый раз вручную.	3	4	8.4	2020-04-27 18:53:17+00	Здравствуйте, Олег. Не хотели расстроить. Оплата через Google Pay возможна. Мы работаем над исправлением ошибок в последней версии приложения. Если появляется ошибка, необходима предварительная настройка «Google Pay» на девайсе. Всё исправим, не переживайте. Ваш Ozon.	2020-04-27 20:34:38+00	gp:AOqpTOEbmJZlwpjsHjdYMzPheeYKueMxUAddOqgDXaVDTclfmWq9Yvf1tulGWrLAbmVG6R8FCuB_mp3HLzmP5A	3
778	Dima Rusinov	https://play-lh.googleusercontent.com/a-/AOh14GidX_w0BWkQrIWTgi54Jihv4nv3xocJKpvza-rHfw	Удобно и просто	5	0	8.3	2020-04-26 21:25:41+00	Здравствуйте, Дмитрий!\nНам очень приятно, что приложение для вас удобно в работе.\nБлагодарим за отзыв и пять звёзд 😊.\nВаш Ozon.	2020-04-26 22:12:35+00	gp:AOqpTOHMTLwWW2SQoxKp52SNhM2B1Tuo0LeFI6mVoWjDf-98gLuwFjdT81WtZc7a2zc9HqaCY2FZnp0mg-difA	3
779	Gene Panov	https://play-lh.googleusercontent.com/a/AATXAJzQU_osXdBwoNfKs2B84Acyo7Vl-g_DDstoshJ5=mo	Лучше чем через браузер	5	0	8.2	2020-04-17 02:12:57+00	Доброе утро! Спасибо за отзыв. Делаем всё для вашего удобства) \nВаш Ozon	2020-04-17 02:42:49+00	gp:AOqpTOExvRIYHO_zQX8Wa1vqQRLOkSmSV_Iw857JK9vVORY-AkQe7PssQrZ3IFfYCv3d4pjikEgV5V1ASvOFug	3
780	Fedel Katro	https://play-lh.googleusercontent.com/a-/AOh14GgHnaI7qFKDu_WD1jppMrt2wZaXzuX1OW1rBCJLoQ	Прекрасное приложение, супер удобно всё	5	0	8.0.1	2020-04-02 12:19:44+00	Добрый день! Благодарим за отличную оценку. Будем и дальше только радовать Вас. Заходите к нам почаще.🙂 Ваш Ozon	2020-04-02 12:50:43+00	gp:AOqpTOHRNafeIRVjT8oU4h5gBbULKmpjcRJWVy3kwks40U4WKszAQFvrXIGgeupilD0CIDrRYSSXTe4i9-Qrxg	3
781	Viatcheslav Shchedrin	https://play-lh.googleusercontent.com/a/AATXAJyLF1cSEMGMZ-DfRfX7P_xRkBhII0mYWHZY3SO9=mo	Everything fine.	5	0	7.4.1	2020-02-18 10:02:08+00	Вячеслав, добрый день!\nСпасибо за ваш отзыв и оценку :)\nВаш Ozon	2020-02-18 11:19:12+00	gp:AOqpTOEcsMmxsEh-Iy3nSqYFBCVenwLeEPoLuVrfiDm4Dc0MtX7S-7tITWEbH1_hlevRNEMLBoWK5ZthB1Xcvg	3
782	Konstantin K	https://play-lh.googleusercontent.com/a/AATXAJxkpBWL3kz7zTpt66BQNEibzbutW7-djI5y5oRo=mo	ЗАДОЛБАЛИ своими нотификациями	1	1	7.2.1	2020-02-14 22:24:28+00	Константин, здравствуйте! Уведомления можно отключить через личный кабинет, в разделе Подписки, а также в настройках на смартфоне. Ваш Ozon.	2020-02-14 23:07:30+00	gp:AOqpTOGfnX784NmhnrAwW4GLlmIQ0yWZr79FPn8TXDCGNBWxdiuwNV15IFiZviIuvPtNriF3fPOtwjfBkYF_-g	3
783	Katsiaryna Straltsova	https://play-lh.googleusercontent.com/a/AATXAJzM_K7XC4lQyiILQ6pk01ONlRP7BKBJoKDaueRc=mo	Love it!!!	5	0	7.2.1	2020-02-08 00:14:15+00	Здравствуйте!\nБлагодарим за то, что вы нашли время оставить отзыв и поделиться впечатлениями. Спасибо за добрые слова, очень рады! 😊\nВаш Ozon.	2020-02-08 01:12:16+00	gp:AOqpTOF4IaaLSDllorYrqLVB6_xK_N7W2swW-lIrxMF-UOlJ3sJw976NJIRCxjTY_yYPwCCDJbvAgBYeLL3t5Q	3
784	Si_	https://play-lh.googleusercontent.com/a/AATXAJxVNRr3yB_iv3H8qcZLG8bdLjsudrCXzyPGR0eN=mo	Поток бесконечных уведомлений, которые приходят даже после отключения.	1	3	7.0.1	2020-01-21 12:54:01+00	Здравствуйте! Перешлите, пожалуйста, текст вашего отзыва и эл.почту нам в личные сообщения сообщества https://vk.com/ozon или в чат мобильного приложения. Будем рады помочь. Ваш Ozon	2020-01-21 14:01:16+00	gp:AOqpTOHanUmh8bteh7w3HwgvhZ21dSnpc-fJHFNx1sSgHuB6x2MgF-e-5wHiIYhWjUJD1WIatHwyBCjGA3WoJA	3
785	Alex Rodionov	https://play-lh.googleusercontent.com/a-/AOh14GiTlprmRJ79O59BBBWfSqAJvPteszKoYvQQL8zwqA	Легко и удобно искать то что надо.	5	1	6.9	2020-01-11 18:45:01+00	Здравствуйте. Благодарим вас за столь высокую оценку. Мы рады, что вы остались довольны. Сделаем все возможное, чтобы и впредь покупки у нас были для вас выгодными и комфортными. Ваш Ozon	2020-01-11 19:58:55+00	gp:AOqpTOEkWbqpr_exVqMVwDnCuF0A4T6CTltOcI6ufzgRH98SbLInDRaXQL_gojmyZ7C14gzaLSPgAPciVXkZpg	3
786	Igor Eremin	https://play-lh.googleusercontent.com/a-/AOh14Gjf4EdMlTMi2JTiTSjQKLSCais8HtVyIfxgo2upVA	Отличное приложение, быстро и удобно делать покупки.	5	1	6.8.7	2019-12-29 16:29:08+00	Здравствуйте, Игорь! Спасибо за звёзды 😊 Мы рады, что приложение понравилось. С наступающими праздниками! Ваш Ozon	2019-12-29 17:53:04+00	gp:AOqpTOGqyNDC5gFv1K1v1tOcY16kk2RGz0v8fDpb7vPz9fyW-GVnsEFfFnq_RR7SZ6zhqVGRliU9fW8NgfHT-w	3
787	Denis Voronin	https://play-lh.googleusercontent.com/a-/AOh14GgNH91iHbFU2K1yJguZ62q1Tf6ApaurxP50GIw9Olo	Обманули с заказами. Сделал 3 заказа с доставкой на местную почту России в Москве, все оплатил онлайн - за каждый заказ содрали по 100-150 рублей за доставку, при этом заказы на 1000-2000 рублей, хотя в приложении пишут, что заказ в постаматы и пункты доставки при оплате онлайн бесплатные, именно поэтому и заказал. Служба поддержки бестолковая, общается по принципу "сам дурак" и "пошёл найух отсюда". Обычный интернет лохотрон. Не рекомендую, а деньги эти пусть у них в глотке колом встанут.	1	0	6.8.7	2019-12-30 08:26:08+00	Добрый день, Денис! С условиями бесплатной доставки вы можете ознакомиться на нашем сайте, так как для каждого региона определенные условия. Нам жаль, что у вас сложилось такое мнение о нас. Вы всегда можете обратиться к нам в чате мобильного приложения или в официальном сообществе ВКонтакте: https://vk.com/ozon. Мы будем рады вам помочь!	2019-12-30 08:44:21+00	gp:AOqpTOGT6UERkgsvoDET5vJl2uQhhRNB-SX-8NrfrwDyXD8QIbE-Mp6j1JWWyNd-vF3UIerJvV8CHYanqHdvQg	3
788	Yanna Vaisbord	https://play-lh.googleusercontent.com/a-/AOh14Gj66Vn5qw_cpiSiwZqxFTUMpgijtgGO702XQ3aCew	не удобна двойная идентификация	4	0	6.8.7	2020-01-08 11:32:07+00	Янна, добрый день! Спасибо за оценку.\nЭто сделано с целью дополнительно защитить ваши данные. Входить по коду из смс удобнее, чем каждый раз вводить логин и пароль при входе на сайт :)\nВаш Ozon	2020-01-08 12:38:18+00	gp:AOqpTOHcX2hG88Etr2LqDYjcF4on92QgFP_Qk-QLHh_h0av3Cu-RAvWCOoQv-n0mLTeLWXA_e1syfxDopfCjXA	3
789	Dmitry D	https://play-lh.googleusercontent.com/a-/AOh14Gi2T8g4cEEf2NY1dnHDctRCPLFxLYlTaBhYI97fyw	Магазин движется в правильном направлении - появилась бесплатная доставка, акции.	4	0	6.7.6	2019-12-14 14:38:44+00	Дмитрий, здравствуйте! Рады, что ваше мнение изменилось в лучшую сторону 😊. Спасибо за оценку. Ваш Ozon	2019-12-14 15:17:28+00	gp:AOqpTOHGJO7fp43eblAKzkC5ZuRvqZFxUxw24jjUnYeCE0l8LrCYWxBMOWxSfLMcE-67DJGKADJW8Zh2id6GNQ	3
790	Farid	https://play-lh.googleusercontent.com/a/AATXAJzuYVT5BX5E1bQYcmOIBf-chCxSMtluq1YA6a8l=mo	Отстой, а не приложение. Тупо мобильная версия сайта, которая тормозит и мало того шлёт тьму тупых уведомлений о своих скидках. Зачем? Я не просил!	1	2	6.4.5	2019-11-05 14:31:05+00	Добрый вечер! Сожалеем, что у вас осталось такое впечатление. Подвесаний в работе приложения быть не должно, но они могут возникать также из-за большого количества открытых фоновых приложений. Push-уведомления отключаются в настройках смартфона, попробуйте. Надеемся, что мнение изменится в лучшую сторону. Ваш Ozon	2019-11-05 15:05:32+00	gp:AOqpTOEzWS4EQ8hETI7Ba8KmIkq64dYCDbA0zGMWQgm7H8Wa2k_qbc7-VtIsKxusbvYCOnMy3D1cSMOa4lfnsQ	3
791	Dmitry Baskin	https://play-lh.googleusercontent.com/a-/AOh14Gj2oR_X7IOhBOjLi0z0XR290hMBL2mSfmdOGajlng	Сервис неоднократно без уведомления переносит доставку, поэтому пользоваться данным провайдером не рекомендую.	2	0	5.6	2019-12-22 18:29:09+00	Добрый день, Дмитрий. Нам очень жаль, что у вас сложилось такое мнение о нашем сервисе. Мы понимаем, как важно получить свою покупку своевременно и быть уверенным в помощи от службы поддержки. Хотим во всем разобраться и помочь. Напишите нам, пожалуйста, в любую социальную сеть, например ВК https://vk.com/ozon. Ваш Ozon.	2019-12-22 19:27:08+00	gp:AOqpTOGryoFCVzf6n4wd08M-BD0DgPoUFOydjMXVBSZvx5OJPGC2tU8mvn6po2wds2ZHFm0x-qxOEuGNjyJjrQ	3
792	Inna Bosikova	https://play-lh.googleusercontent.com/a-/AOh14GgADe0ICYK0GDeRsYtypQsVGa11k7KT99rtjXJp	вполне неплохое приложение	5	0	5.1	2019-05-13 18:59:04+00	Здравствуйте! Спасибо за 5 звёзд) С уважением, OZON	2019-05-13 19:17:03+00	gp:AOqpTOEzHMj9tvb_cWWnqYfZ2vGAczRZmCwEbtW0XJU2aymo-VFcTNxHVKp9_OcF9ypdmlTtl6paiatCvnxniA	3
821	Denis Kolesnichenko	https://play-lh.googleusercontent.com/a-/AOh14GjVXbS4bWtPqaSQWgRTR_EaKlW-A2yzmegwtiqfvg	Это спам приложение.  Его нельзя удалить - автоматически устанавливаетмя снова	1	0	1.6.0	2013-06-11 22:18:05+00	\N	\N	gp:AOqpTOEGyNbgtdRPkqe9vdewu651lJwHj_bYhDzPpS06Tga7V_bHZNL_DRA0nNTZZK5DZSO8yqX5ti90tF1_QQ	3
793	Mark Amashow	https://play-lh.googleusercontent.com/a-/AOh14GggfSuMdQU-fO6zdXxv2k22Xu1wBNb1EPp1F_AMdA	Меня все устраивает, предыдущий отзыв остался со времен введения премиума :) Теперь, когда вернулись адекватные цены и баллы, грех не закупаться у Вас, а приложение стало гораздо плавнее и отзывчивей. Хотелось бы, правда чтобы вы добавили возможность фильтрации уведомлений, потому что приложение очень часто поднимает шум.	5	14	5.0	2019-04-24 06:23:18+00	Доброе утро! Благодарим за 5 звёзд) Мы хотим, чтобы покупать у нас было еще выгоднее даже с платной доставкой, поэтому на постоянной основе запускаем множество акций и спец. предложений) А также сделали доставку и вовсе бесплатной в наши Ozon Box. Надеемся на продолжение сотрудничества! Ваш OZON	2019-04-24 06:19:05+00	gp:AOqpTOFKo6K8CC9Ydx_l6V6kPJb94NTJRSGUYjwNj3qcvWUS6v2hIbvnYfyZz_t38p8cRgx2iAbunFVeikCbeQ	3
794	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Негативные отзывы о товарах отказываются публиковать. Типичное российское ворьё.	1	1	4.3.2	2019-01-08 13:17:38+00	Добрый день! Жаль, что о нашем магазине сложилось такое мнение! Мы публикуем как хорошие, так и плохие отзывы, просто не все проходят модерацию. С Уважением, Ozon.ru	2019-01-08 13:42:56+00	gp:AOqpTOFDHXcw0Pm5ytRis3kiqeaWASGHIB2rjo1PZiyXbNefXHEh63hzcvWsYwtHIgRJAQKmKzSbFo4Zpuw25w	3
795	Olga Knyazeva	https://play-lh.googleusercontent.com/a-/AOh14GjjBGbzEh2cd40NjGD4RGiPrLVB-rRPSgrErUYG	Почему нельзя сделать оплату через paypal ?? Собрала корзину ,но способы оплаты мне неудобны :-( сделайте paypal,пожалуйста	1	0	3.2	2018-09-08 02:50:17+00	Ольга, по техническим причинам paypal не внедрен в приложение. Над этим работаем. Если удобен только paypal, можно оформить заказ на сайте) С уважением, OZON.ru	2018-09-08 03:05:50+00	gp:AOqpTOGByzk6ac1AxYZ4xx-rfCuuq90M-hsNWwT-BNl3iwXzfBBbMulnuIjFTi6EuzvbQWbk0a-utbsyhuB_NQ	3
796	Anastasia Terentyeva	https://play-lh.googleusercontent.com/a/AATXAJzINjEvet9ZCPZhpgR7kD-6840JPekn3rMeOpas=mo	Я очень люблю это приложение. В основном покупаю книги и сладости маме - \nвсегда очень хороший выбор и доставка в наш город очень быстрая!	5	0	2.8.1	2018-05-06 15:44:39+00	Анастасия, благодарим за развернутый отзыв ;) Рады, что пользование нашими услугами вызывает положительные эмоции. Твой OZON.ru.	2018-05-06 15:50:15+00	gp:AOqpTOEaFvIOCL8eTl6tHwDrY5KbIu4fia7yWDKYs-4m6v22hXOytyGiBE-Xdek5jPk1XFDvrjIXN4pV5EBIKQ	3
797	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Не отправляет код безопасности на телефон при оплате через карту. \nНевозможно поменять способ оплаты после подтверждения заказа и фейла с \nоплатой картой. Не сохраняет заказ в корзине после подтверждения и отмены \nиз-за невозможности оплатить. Зависает при первой попытке оплатить G pay. \nЧтобы оплатить, пришлось перезагружать приложение. И в довершение всего, не \nотправляется отзыв внутри приложения, который появляется сразу после \nудачной оплаты. Pop-up просто не исчезает и не сабмитится. В общем ужас. \nЕсли бы мне не нужны были книги, я бы в жизни больше не пользовалась таким \nприложением.	1	2	2.8.1	2018-05-01 01:01:29+00	Сожалеем, что приложение заслужило низкую оценку. Изменить способ оплаты можно через оформление  нового заказа. Надеемся, что в будущем появятся и другие варианты внести изменения в заказ.  Все остальные замечания взяли на заметку 👆 С уважением, OZON.ru	2018-05-01 02:36:17+00	gp:AOqpTOGtJyhR70lViST5_74Q-dpE_SZuiWtQeYK8wNstv78XKNZy2VuMYZ5Y11jHcgxsCk8bLonpj1CDoxzb6g	3
798	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Easy to use and navigate. Like the features. Thanks!	5	1	2.8.0	2018-03-23 21:30:31+00	Thanks for the feedback! We are very happy 🤗\nOzon.ru	2018-03-23 22:44:43+00	gp:AOqpTOFRpRf9egqCBMo9c4tlljAvnATZQQo7Na7T-MPGyoXMtTnV-GH7ziWoCqqNWugSqKm_4skKrIa2hiC4OQ	3
799	Ирина _	https://play-lh.googleusercontent.com/a-/AOh14GjR4YvlIEZlFBojPdwJNLDqNOQb0txQezhA4gVU	Хорошие цены.удобная доставка. Из минусов, нет возможности отследить посылку отправленную ТК	5	0	2.7.2	2018-02-08 17:45:06+00	Ирина, привествуем! Благодарим за звездочки :) В данный момент работаем над информацией о статусе в личном кабинете. С уважением, Ozon.ru	2018-02-08 18:22:18+00	gp:AOqpTOH1yEbnChULw55nmwuivWPw7I8O7Pr4duAj_yQ5YmTylX4NsoN9uPbgfgrcqPg7dKBl_xK18BjF7ueBgg	3
800	Реувен Губерман	https://play-lh.googleusercontent.com/a-/AOh14GhGFeYdfLrw_dKZVQZB9Ju9i9lYpTMweg0WMuCNMg	Неплохое приложение, но когда выбираешь пункт  самовывоза на компьютере все таки гораздо удобнее это организовано	3	5	2.6.5	2017-10-26 22:22:55+00	Спасибо за отзыв! Постараемся учесть твои пожелания при следующих обновлениях ;) С уважением, Ozon.ru	2017-10-26 22:50:53+00	gp:AOqpTOG_XMvEUfYnnSIXKwkRo8znFdWW8pLKVYzxqTj0VwcueYK0wHHgAaDoncx_IW5xMIsGypGlUutCnEpcUw	3
822	Roman Eikine	https://play-lh.googleusercontent.com/a-/AOh14GjkIoinGaEJ32OjyeqJGSnidnp9dOpFVgVE7R6vqQ	Came with the phone.	1	1	1.6.0	2013-03-30 07:09:05+00	\N	\N	gp:AOqpTOH_Nr4BoJS0iJ0tGOICqbBmwBB7nv1yf60vI-T92LTzRqHFJkWd5hEpkFzSvKtTxtlyBBFw8b671DVv0Q	3
823	Sergii Fomytskyi	https://play-lh.googleusercontent.com/a-/AOh14GhPE8ab9VPimz8JZFPWLvHDVNd60P4J5I0PtXvHnQ	Cannot uninstall	1	0	1.6.0	2013-10-26 05:13:09+00	\N	\N	gp:AOqpTOGZTlI32ogvDJoNsgXc9soqt95GmOE73ToTCvrfBG_y2IyPQmaAH26chI4Xn16JnTq0qiY7hHL3X1G57w	3
824	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Preinstalled crap	1	3	1.6.0	2013-04-30 19:38:41+00	\N	\N	gp:AOqpTOEBnUnfg_QUw_d8qMgg3YFg7SCO1Qnd2kvkt-pnq-vQBCoRhlkbWb4XdIKQMl2sQ02_nQIjvTOg8xXlQA	3
801	Alexander Rybalkin	https://play-lh.googleusercontent.com/a/AATXAJwwPVDWetaSpgqrCYJWK8gkbblII5-gH8Ze-BIb=mo	Озон меня уже не первый раз разводит с акциями. Сейчас тоже повелся на халяву, скачал аппликуху, начал оформлять заказ и в самом конце после того как натыкался в эти экранные кнопочки (новый адрес пришлось вбивать) выяснилось, что приложение не позволяет не использовать баллы или изменить их сумму. А с баллами не дают 500 рублей по акции. Снес в итоге приложение, оформил заказ через сайт. Само приложение на 3 (через сайт даже на телефоне удобнее), поставил 2 за фейл с баллами и за то, что новый адрес приложение не сохранило.	2	1	2.1.0	2015-03-11 17:18:12+00	\N	\N	gp:AOqpTOE48RcTX1EYRhwf_2lkFTG-1lFC2lnbGT3eDWUckOGYLoKm2yhpnpwk6Rz1XOYK06KvecFdslFAkwA3Ug	3
802	Vitaly Vasilyev	https://play-lh.googleusercontent.com/a-/AOh14GiaOtFEdLGadHRSMmLEYxc1re8_LRkiObh9qiGMAEk	После каждого обновления приложение от "Озон" становится более удобным. Спасибо!	5	1	2.0.2	2015-01-02 05:30:41+00	\N	\N	gp:AOqpTOEgeg3Bry9QTuWBCDnAEwwyPMyOMWS0NPcfBU4kKcCJg_veEb_3hAf0EJ2UqFDY390II7pRbfqprs1-hg	3
803	Just Sergey	https://play-lh.googleusercontent.com/a/AATXAJynhCgPfyhyQZUoVho8x4FCcSAyKjOTeR7nF1XM=mo	И серфикаты получилось оформить и товар выбрать и покупку приобрести. Что ещё нужно?!	5	0	1.6.2	2014-10-21 10:21:08+00	\N	\N	gp:AOqpTOFXcpC4r0E30tndWHyg18Tz2AVBTRoHefCOPw072xuR4JDejJBbmkGvVX4NhOZbbM7mYOg3FQsLBCFm0A	3
804	Anton Malov	https://play-lh.googleusercontent.com/a-/AOh14GjdJfQNRqftCSHp5Al4Rmphb1LkqmZU1U_iRExJdg	Зачем вам доступ к контактам? Не буду обновлять.	1	0	1.6.2	2015-01-16 23:21:43+00	\N	\N	gp:AOqpTOFp5k-4DUs9zKtu7WBd6Tw0h8WeA8tQ15obyvRViqESHfguJE77A47sDq5wD3ssEQgUqEdWgUKmoPTb9Q	3
805	Bayram Muhanov	https://play-lh.googleusercontent.com/a-/AOh14GjQzYkIuNWdN9L9a11ny-29U3-oJrQp6gaFoh8e7w	the most annoying app... can't uninstall it... go to hell!	1	12	1.6.1	2013-06-21 00:49:32+00	\N	\N	gp:AOqpTOGip98jujanbJONd6ZbryDkscHEu_BbHj4avJdz_zer9WVoYuLg5JpNV1Pa2v8gkDmFNSZkD_YX2PLQcQ	3
806	ankit shah	https://play-lh.googleusercontent.com/a/AATXAJy54dQxo7w_CA4OpLNtshiTLxJRca-zcngXkhL8=mo	Pre installed stuff I don't use and can't delete	1	7	1.6.1	2013-06-04 18:11:35+00	\N	\N	gp:AOqpTOHbphaYUCwZcyU1sEnywODPk2ZAS6f1wP9_g9V1Q0R4yip-1vIvZS6-JO5kGU865khMtSwtXMfBlh4-xA	3
807	AM L	https://play-lh.googleusercontent.com/a-/AOh14GgZ1g_COVAfIXNmw6Qhlhq0wyqYLkHiA0tP-z7MBZI	Заказ давно выполнен, а все-еще высвечивается в списке заказов	1	1	1.6.1	2013-08-30 16:27:35+00	\N	\N	gp:AOqpTOF_4tBmKvoE6GArELMVKWfpCpwfWy74UuDrQUwO2oNA81W9y4v6Mdtm54kt0rabAqOM-dQud7qtjEfQmQ	3
808	Shawn Gizatulin	https://play-lh.googleusercontent.com/a-/AOh14GgPqWmIxdiYlzG4_9iFFC2boRNv9wHzcTq9mNRIDA	It sucks	1	0	1.6.1	2014-03-31 11:02:58+00	\N	\N	gp:AOqpTOGkZRQNGJizBIR-PdvezmsvuEYeuknID0i6DgdY1XpDzt3VlL_jh9tUCaZpk8j82ltgLVN0UJdputW0eg	3
809	Sergey Chubukov	https://play-lh.googleusercontent.com/a/AATXAJxlHe_GojdQrJ6rq3A1L0lzfo8aS7mlYpp_ZGIh=mo	Pre-installed app spam.	1	0	1.6.1	2013-10-25 14:42:57+00	\N	\N	gp:AOqpTOFTmIqAfsI0-WNDKln4w4MTO-R_6_Rv4iWtwdXDr_LLQv6FapmPlr6L9PRFrRJvhF2P3vJAC3CYFFqXtQ	3
810	Never Again	https://play-lh.googleusercontent.com/a-/AOh14GimlM2cl9R2MPo4EYBXdx9c7ghaFIDYTVhq3wEM	Удобный поиск, большой ассортимент, умеренные цены. Любимый интернет-магазин.	5	0	1.6.1	2013-07-20 18:41:37+00	\N	\N	gp:AOqpTOFMB8t7TXaZBlG0ExMpDLS-nXXXDqS7p52GULEqZJxmQt5uZSva2pDFquZ2hSsbnXab4cpYeu7MToI_nw	3
811	Enrique villacis	https://play-lh.googleusercontent.com/a/AATXAJxa0SSMMdmgHQEOWc9LFlJoFrbs-dO1KAtnEYMQ=mo	Useless cant uninstall	1	0	1.6.1	2013-12-15 16:31:56+00	\N	\N	gp:AOqpTOFWz3jPpWme0707kh_cqxfzUmjzrqwm3pJ3F8uUrrZaBHWap-9O-CuzkE6kawFOmMg5KAh6UhCCAFpJJw	3
812	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Вполне себе удобно!	4	0	1.6.1	2014-04-11 22:03:06+00	\N	\N	gp:AOqpTOE7W93rcAEjCRQIgTlPELtvlQKPoAuZaKjsxaqj2J8g99ZxZZZrhR9VP4ToMswBFQSdNgDWaeKNroemLQ	3
813	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Very useful. Without bugs.	2	1	1.6.1	2014-04-04 18:39:56+00	\N	\N	lg:AOqpTOFXzNgJJJmsNB5GzEKnrCrn0MnkO91bomTv0sugTDvVj27gljINX9v7CdwE80kQA5UU5yyzEp9Ymms5Xw	3
814	Pavels Drobinins	https://play-lh.googleusercontent.com/a-/AOh14GipLwNlR8HakU_B6Air13mmR22a6ZonvgsecmqZBw	Удобное приложение	5	0	1.6.1	2014-01-07 15:24:05+00	\N	\N	gp:AOqpTOHOcNSZ2TkLk9mDZtJO1IGkgVuCBpJwWxhN02vu5HC4DT1w_OUZXdakl-GQsYk4ILszjNollJgzqocAow	3
815	Андрей Николаев	https://play-lh.googleusercontent.com/a-/AOh14GjhU3h5S2PAXuczPY8NF5c7Z1ZzvBG5aVoRvF6_RZY	Приложение норм	4	0	1.6.1	2013-12-27 07:05:55+00	\N	\N	gp:AOqpTOFINu3zVc1PtEM8A7W8SYnaGjF9_VBBpHVdrNajlsyGxyso5IIBQnc9jkD56SU8gT6wDdH2FBYOhqeZ3Q	3
816	Arkar Sithu	https://play-lh.googleusercontent.com/a/AATXAJwhcEysQX0r60KeP8S2M2fJ-Mo7VCBVrMCFcCPi=mo	So cool app 4 me	3	0	1.6.1	2014-10-03 12:16:40+00	\N	\N	gp:AOqpTOFJ60qKal_C2tADHAvIH4tpDYt3Xqem3TRgKO6iARU9HGsYL1lNBHdGOyRBmIuPbQc1IMY25kJW-VsiOQ	3
819	Sergey	https://play-lh.googleusercontent.com/a/AATXAJzdDm4MfSSlpD6IQwvYwtTnlD2w2Iup70NEabCt=mo	Невозможно удалить этот предустановленный мусор.  Отвечу вам тут, на комментарий разработчика. Очевидно, что мой отзыв связан с тем, что ваше приложение предустановлено на мой телефон производителем и его невозможно удалить без манипуляций с рут. Я им не пользовался и не пользуюсь, но оно постоянно висит в памяти и просит обновиться. Очевидно, что такие приложения я считаю мусором на телефоне.	1	0	1.6.0	2018-07-30 18:37:05+00	Предустановленное удалить не получится, но можно отключить обновления. Это можно сделать в настройках системы, зайти в "Приложения" и там выключить.\nС уважением,Ozon.ru	2018-07-30 19:39:23+00	gp:AOqpTOHL2H2K3Yaj_2bnmhIqtSl9z3Y9dHT_HOlzkAE3i-ZEnZ8P8vAFvHhqeAfmfWPfi9us7eMHRNRUo2zQfw	3
820	Евгений Богатский	https://play-lh.googleusercontent.com/a-/AOh14GhHXzut10L5Rmx9r_G47nKMJ1jN-0pdqVfJ6aS9-Q	Хоть и удалить нельзя, но иногда делаю заказы.	5	2	1.6.0	2013-03-04 20:05:45+00	\N	\N	gp:AOqpTOGHNj_t4W57YejQMfB-DP0Uu_q2I59fWIn0emiUheQ6x1c4M9cYLD4qY63w9Fk5eH6Q9T1cGH6vhvDmKw	3
827	Михаил Петров	https://play-lh.googleusercontent.com/a-/AOh14Girps0EJ5wv7VM3L1Bk_5tbvpORHA_ZLjSv17N-_g	Ох уж эта дистрибьюция! Хоть телефон рутуй.	1	0	1.5.7	2013-01-15 21:43:22+00	\N	\N	gp:AOqpTOHBFHz6wNHM6WvaY2w9MhOHTt3b3o-jluUCCqUNzjtMTSgxYK4Gcgp4NcZuCCoE0peFYcozMfiJrOy-YQ	3
828	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Навязанное пользователям sgs3 приложение	1	3	1.5.3	2012-08-25 05:32:16+00	\N	\N	lg:AOqpTOELrF3vxASikgcjdrW74qkZCW95TyCc7qMAjYoLQIqO_J-eB0Rhg1lQLCN_C-C7cBEbuzTUZ2yEeXf9cw	3
829	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	I used this app a while ago, then uninstalled it due to too many lags. Now it is much better. I like it, although it could have more options. Great work dev team. Asus Transformer. From PA.	5	2	1.5.2	2012-03-31 23:15:41+00	\N	\N	lg:AOqpTOHolpv5S8TAmpzUxaVAjneRJPh7gj2x9Zj1xYIIJ7U3aSOjbG7w88RShMTMPfeUtgwWRIOCno3d_h8hlg	3
830	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Качественное	5	1	1.5.2	2012-03-28 04:30:18+00	\N	\N	lg:AOqpTOGItyELaZWKhYLVhpVb3sDoBEd3XVKAuXejJ94yBfNNkBRwsVhWchW3dRySah5yqTv9TwBBtKABewQVJw	3
831	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Не авторизуется, говорит неверное имя или пароль. LG 540	1	0	1.5.0	2012-02-20 08:30:25+00	\N	\N	lg:AOqpTOHpuF-4LyqWQiM3MDgfSLfZvYiVTzWprsY6U9bRg1nw1otRx5hMSibvXJ3bproYmpD0bae4D_V3LUKzsg	3
832	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Отличное приложение! Очень информативное и качественное!	5	0	1.4.6	2012-01-20 18:50:42+00	\N	\N	lg:AOqpTOGfO2oNd6TZwbZ79pSLpj9WpVX85trgDoQoErAsa1BG3mOEKHPEqkU0DvTVIk_ii_yZEWvl-4sQnYLrYg	3
833	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	В целом все что надо есть	5	0	1.4.5	2012-01-12 12:18:46+00	\N	\N	lg:AOqpTOFfhKkfRkNAo_0KTLQU77w1756zD94miM0W0x3BtFIz-8DIRokUWM9JVFZkcqdYuXvxmNR8TDBDg7ybjg	3
834	Aiden Morales	https://play-lh.googleusercontent.com/a-/AOh14GiaMh7s5BuiTlbxue5E6jRtV2zjJQN2JU5lV7fsEw	The app is perfectly fine the only thing I wish there was is like a way to unfollow or unlike more than one video at once. I've been on tiktok for a while now and I've finally reached the following limit which is like 10k and most of the original accounts I followed aren't active anymore and I just wish there was like a "select all" button or the ability to select more than one account or video at once when unliking and unfollowing	4	133	20.4.6	2021-07-21 19:05:02+00	\N	\N	gp:AOqpTOG7i5mhupg3sFcr_yavtNNAb778nQ2bmNPgiZ-Zs3ZUbgjZSs15mEE9cn8g3qy0B-euZiORS8iBhkfAHg	6
835	KittyKATT	https://play-lh.googleusercontent.com/a-/AOh14Ggsdc-jzAH5LjIzYubLiwiYdf0X-rIiwcPCqPC6	I love this game so much I like the feature that you can name it whatever you want please make part 3 to this game	5	10	2.7.6.7	2021-07-29 13:18:34+00	\N	\N	gp:AOqpTOF_uXpII2blYjEUty7fntQ_yns2U_3yzkVfCv33OYdnfWz5Q0Ylk2SEVJzz37eJMKixnkkmYSN7W6c9Cg	7
836	Not a YouTuber	https://play-lh.googleusercontent.com/a-/AOh14GiUgkMAna590DkNAlNYlfESsyk7bfiLePx6gnKdESc	Please fix the ads. They play and never go back to the application.	5	9456	2.7.6.7	2021-08-03 07:51:54+00	\N	\N	gp:AOqpTOG3aMqeB4RZTA3jCBEwx8R_RUbH6fH9p-FZX6bahTPTh2aOczREHqI3Q5G-L5lTA8oApFyELLfHXSuYIg	7
837	Pam Baize	https://play-lh.googleusercontent.com/a/AATXAJyfYzccW_pQw60gk2bVdoojjhcm0O2EDRzLm7oW=mo	Tom is a pretty funny cat, you never know what he will do next, but whatever it is it will be fun and never boring.	4	11	2.7.6.7	2021-07-29 21:12:10+00	\N	\N	gp:AOqpTOEe0qnycpYZpzensjqyqQrTPuo9uWMxEQ4G7hsv7EhfxLDBlDWJVP71cO8yQMSUVA-biP1NBX0rJ_Cwxg	7
838	Cloudy plays	https://play-lh.googleusercontent.com/a-/AOh14GijwfANVatxsTa6hPF8ERf3YaOHz6Yq__w7Vzi1fA	5! LOVE IT SO MUCH THAT YOU CAN GET PET AND CLOSET FOR YOUR TOM LOVE IT SO MUCH MORE THAN MY DOG ITS SO MUCH FUN 💖IM 42 IT WAS SO AWESOME THAT IT WOULD TAKE YOU THROUGH THIS TIME ITS NOT BORING AT ALL LOVE IT SO MUCH 💖💕💗♥	5	1	2.7.6.7	2021-08-08 04:42:40+00	\N	\N	gp:AOqpTOFuDI3Hcm3549vNPpnrYRPBeVq5eh_lEA5bQ3Qk2sczq1y899WJzp7vhKWKfmdwbkEFnKMzSvBNQlFxng	7
839	Ana Sanchez	https://play-lh.googleusercontent.com/a/AATXAJznQOfMBZxJ0kq7nQGnZ27vYl1oQpN3M-547Ivs=mo	It's a fun game it's just the clothes the hat and hair are to expensive	5	5	2.7.6.7	2021-07-30 03:01:21+00	\N	\N	gp:AOqpTOHWCy3IprOY8Ezpb1DA_8j-p0nDyBfYW3GxSCe1yhT3CAeRsprf9EJ62eGv3GM2O4XRGx9gcVMEI8euhw	7
840	amadine	https://play-lh.googleusercontent.com/a-/AOh14GjH2p03CPDmmtejnJGsTd4-Wf3J-A617LUpblb560o	My talking Tom is so great he's so cute and cutie like I'm so cute but every time he always fall asleep but it takes time and to sleep meter always takes like minutes I think he's about to I think he's hungry all right my dance letter bye	5	4	2.7.3.2	2021-07-20 11:45:04+00	\N	\N	gp:AOqpTOGTfLF9mZefXPMBmcan9otlpZfD8gdnowh8XoJA9joZ9M1l4tnwLVYxuAjm_KCJg4F8pQKSnLIMLh5pYQ	7
841	Theresa Hawk	https://play-lh.googleusercontent.com/a/AATXAJzPdxPhlLn661bz4atLP0Q6egRNRFDIStF-ZJtz=mo	TOM is the best cat ever! BUT you guys should add some new games to Tom's consle and you guys should also make it to where you can go all around the neighborhood and see everybody.	5	34	2.7.6.7	2021-07-10 00:12:32+00	\N	\N	gp:AOqpTOH9-eouhty7aQiPdal4BDHUDxsUcVHnddgrolZKIcRLEdamIjLHKCf0ITokDeQmrjE_NDLI7m08EYX0Wg	7
842	Wendy Montes	https://play-lh.googleusercontent.com/a/AATXAJz1Rbiyu5mh8zGWRDhDkBQd7vyJ-aJJhX32HiM6=mo	Way too many ad's and trying to get you to download other apps or games.. Can't just play the game 😕	3	35	2.7.2.6	2021-06-27 00:41:14+00	\N	\N	gp:AOqpTOEWmyL6UX_h7q8aHyVqpAtbZf5PlpoXO2gR5_3NRZWFq8_3T8ozQgphuo8a8h809oHK4XYBxj83gDh1QA	7
843	Kayleigh Dawson	https://play-lh.googleusercontent.com/a/AATXAJwVGhJx2mRFxoYTF4a247aBJz1fO3a9vuafOdD_=mo	This game is so much fun the first one is a 3 star because you can play with and he is a kid in 2 but you can't in 1	5	25	2.7.6.7	2021-07-08 22:53:10+00	\N	\N	gp:AOqpTOGkpWvvwDimyz39fHWZ1EON58k5SjW38m4e6TYvnIaQzxR9T32VKJdjVcvlHzRsNLxPYWp1Fx3uBB-bJA	7
844	Arniecia Hunter	https://play-lh.googleusercontent.com/a/AATXAJy-i2KIgDqcFCca8nCuQrrnL5r-poJ3ui_wf7lZ=mo	My kids love the game and also but it have a little bit of ad	5	6	2.7.6.7	2021-07-26 22:13:28+00	\N	\N	gp:AOqpTOHQnUtZE57R2aJvaZQ-UdUrriyocP96BcgAdn7y7Jgz6J5fdmubZRS-MrCV3VAh9qgRjL5UIr0l_lzITg	7
845	Marie -n- Malachi	https://play-lh.googleusercontent.com/a-/AOh14Gg1xA7y4l5SaMPiuqYuqXvlKr4JaygYVEcg9LJkfQ	I like this game but I had many problems the app freezes Everytime the game is so Laggy And it's useless plz fix this game cuz I'm not gonna enjoy it if it's Laggy	4	18	2.7.1.11	2021-06-14 17:24:14+00	\N	\N	gp:AOqpTOFloF4H7fUk_xdpUfp5lbWa9rAMjZpxroh_DxHFj0cLYa7harwVozXvmi0pi1_U0b9eIZPsFnjhd3Nj8w	7
867	Jay Flores	https://play-lh.googleusercontent.com/a-/AOh14GjwH-CNRLVw5miULXt5D7xaKX07DgvpOoFLDqx7	I love it but it would be nice if it had a dinosaur costume.	5	5	2.7.3.2	2021-07-08 20:06:41+00	\N	\N	gp:AOqpTOEiacKZ4UoG26HxlRzV1gbcpLlhct4x-kAdHanBaXejlPbZOU-rReEsB-Vh94ikGNoqiAUVjNIIXGcLTw	7
846	trea momjoshn	https://play-lh.googleusercontent.com/a-/AOh14GgE7LaQd5pIw8wq4kLiMAWerJnFFLuZf4_6Eb6tzg	I hate this game and I wish it was off the the Google app store I wish it was off because of the stupidest game I've ever seen if you can not draw in the lines	1	27	2.7.3.2	2021-07-06 00:56:33+00	\N	\N	gp:AOqpTOGrmN1WVQeYEE8RmF6aZAJsZnLX8eLPpwoXORfs4l9LVDRVGJWUVAE0vkO4lWLaCMVzqq1nVcIlruQYDw	7
847	Don Poulson	https://play-lh.googleusercontent.com/a/AATXAJx2BrAYf1vbiESmMw51FX3msR2MsIibwrgcLBM2=mo	Talking tom is so much fun and doing a lot of feeding and playing and doing a lot more stuff with him	5	30	2.7.1.11	2021-06-10 00:38:50+00	\N	\N	gp:AOqpTOFe-eDys6l5uFPqTq42VEwTqs5AywBvaNTlXies37j8Klqt-1YI9bx4VRKUfW_pN-hMxtAIYnTojLFhDw	7
848	judy ruth	https://play-lh.googleusercontent.com/a/AATXAJwRgJhzT1ysuCtTN6MpQv7-MgvJG-5kGGlCgfXh=mo	Outfit 7 SUCKS. I used to like their games, but now all they want is u buying diamonds, this goes for Talking Tom, all of Talking Tom games. They suck,only want more money, and they SUCK. Am sick of all Talking Tom games.	1	43	2.7.1.11	2021-06-16 03:43:34+00	\N	\N	gp:AOqpTOE4Ryf2L6ueoZ-JWwK2z1VTjeoR8_J5NniBvcpVAiMJ3bfxMU7D_pGZtNv0zQV5KaE_zVuBsGuDUMFo3A	7
849	Mira Pulat	https://play-lh.googleusercontent.com/a/AATXAJy0ak3GX501WCJen_5eboYNOI9L8kHIkLCTIbJ4=mo	The app is super creepy and when I look into his it has something in there but I don't no what it is and this app is not for kids!	1	50	2.7.1.11	2021-06-09 23:00:19+00	\N	\N	gp:AOqpTOFVVvcha_6KY6L-gKDj5jYgAdl_ceN8fUL426oCZI0RrjdyIvLmddhM5KM3K-jNl0KXxcmJkpsMR3pwCg	7
850	juziahai palmer	https://play-lh.googleusercontent.com/a/AATXAJznqEyhbhVfWhwnSOFwKGzb72fPPnb1X2kGBzd3=mo	The game wasn't working at first then I uninstalled it then reinstalled it x10 so that's why it's a 4.	4	4	2.7.6.7	2021-07-24 21:27:31+00	\N	\N	gp:AOqpTOF3rl3nkupzk1XkxGRR6Xn4F49-BqtSSZtn-BkcBxNn67nNPRIPj6_ryBCkfgLR6ike47hEqrK8Nw_kUQ	7
851	Josie Lynn	https://play-lh.googleusercontent.com/a/AATXAJyr_LBiIQ_nsbq7qW03koxTllL7ZpMFqVgiv7jH=mo	It's really fun I love this game.You don't need wifi and it's not glitchy at all	5	27	2.7.1.11	2021-06-11 21:30:27+00	\N	\N	gp:AOqpTOFzEy7ynFkEyDTB1lfQY52Cwh45h2C77t1zCIj55oTBqfzsxyUBQgZOKwlQg0dsBkR6KBo1xA1igP5XOQ	7
852	Ava AvaParham	https://play-lh.googleusercontent.com/a-/AOh14Gij0NR2cqOIlK-kCVBTmC0ZYeVZAQfr85bQ-Lnj	I love it Tom is so cute there is so many mini games and entertaining for me I give it a 5 star	5	23	2.7.6.7	2021-07-20 17:18:34+00	\N	\N	gp:AOqpTOFGtMxh7QxkQCt3bsiuasfYuUVHsEd5E82k-eg_CLG7qmNwOGQoaeSHQKqXWTiMVgjo4qcRXEI1Ei6Nwg	7
853	Alexander Shogren	https://play-lh.googleusercontent.com/a/AATXAJzEJJZiHmsv_stB7h_aIIPxq-XJdqQLZqZAjUB7=mo	It is an amazing experience I love it except the sleeping it takes SO long please make it quicker	4	4	2.7.6.7	2021-07-24 00:12:32+00	\N	\N	gp:AOqpTOG7y33iZdTvlWgkf9v0V_mGs48lTuH6Xerr8X_ML-3s_YaNdt8XCocPPqY11IrgvNod5FByDjW6FV5d6g	7
854	chim Off	https://play-lh.googleusercontent.com/a/AATXAJxsoE11T1Ed9derrcIOArzD8oNEXP-8dE9gKZGE=mo	This game it so easy to play on level 12 he is a teen is that awesome but jerry break the blender and I hit him and when you hit him he hit his face on the floor and it is so funny and I don't care or say sorry because he is bad	5	24	2.7.3.2	2021-06-26 21:27:08+00	\N	\N	gp:AOqpTOFsvFFlSB3FICbeEbLnnrgBEwDB1IxJL_pTsiH8ArXq5bmtKEnXSfeMqILqWCkMZK1IHWmF5ftcomGmrA	7
855	G Wall	https://play-lh.googleusercontent.com/a/AATXAJwhwsYXSeHf8miI7BXxZ1VttEf1TzPj0qZ6beLn=mo	My talking Tom 2 is a survival game last beautiful night my talking Angela 2 shut that game out just ride again :-) 😍😍😍😍😍😍 Tom's cat pets so cute 😍	5	2	2.7.6.7	2021-08-05 23:24:24+00	\N	\N	gp:AOqpTOGY8A4CfdwhexCx1Ng19fU8E_TvyOkBGsQzi1TT8lI3pxpn94CFRwLtpZZeMTyhaXfumwO1V04nH7ohyw	7
856	Terrence Gaming	https://play-lh.googleusercontent.com/a/AATXAJzHG_yP3sOXTq-LWODQlqCI3XeCZId5dgor5E7M=mo	I like the game but can you make the clothes cheap	5	0	2.7.6.7	2021-08-07 20:17:37+00	\N	\N	gp:AOqpTOEpsjNgnl9IAkQXQ5w0E_9i1z_Nh5jh-YdA97awhtZ1x_rN6QtGb9F49PE7iL2IyHqPqOgXQ5R2G5L19Q	7
857	Cam Boom	https://play-lh.googleusercontent.com/a-/AOh14Gh2CVvUTzKfIDRmaywH5yBBD5OdYcnGvMlpaUNchA	Dont like the pets and its i wish there was a living room but amazing game	4	6	2.7.6.7	2021-07-21 23:08:47+00	\N	\N	gp:AOqpTOFD-jtwdxtJ-zwKJNKwmw8KAGFQi62Nhgt9odgNlRnPjX7KEw_pXprhUiImTLvnqhYShSmKbppzZHks1w	7
858	Jahangir Pathan	https://play-lh.googleusercontent.com/a/AATXAJwXYjSgTLyjWCGanonfu6Ylw2fTV0ZwAsEnDXa2=mo	This is a nice game but this & My Tom game consume too much time to sleep & they get sleepy very early even if we do it full (100 %)	4	19	2.7.1.11	2021-06-05 09:25:39+00	\N	\N	gp:AOqpTOHR9IptzmeQCOTa5R-KpKRoJIsyTZF2k4LmZfJW4FUNJ-SR4GeAoYFBQxDT4KfV5jg1pW-3eQdNVNHRTw	7
859	Cam Thong	https://play-lh.googleusercontent.com/a/AATXAJyvqoKNL9hGi_4ORLocMapiDWlcKl4BqLxcWlpS=mo	Very fun interactive game for children of all ages to have fun	5	9	2.7.3.2	2021-07-10 01:29:18+00	\N	\N	gp:AOqpTOFPeQyXXOocEBgqd8M7U8UGPGAfmR5l3ZbjUr0M-aSGaLBwdLuRHy9Jb9w7e0Fa-0ue5TgnGf6TkXtj2Q	7
860	Dominique Walker	https://play-lh.googleusercontent.com/a-/AOh14GituNKhY0ABTG6mq-OpzZ-S24o1Ka8amEOmNdiuwg	I love this game there are pets and there was no pets In the first game I got Suger	5	1	2.7.6.7	2021-07-30 21:17:57+00	\N	\N	gp:AOqpTOFqmCG3d5ptCaiJDoOpTYVFM1O06PAr-0j2ldhXCqNOKU9BifpPsKHNiDDo8VMni2KywUBlNbIcu9xczQ	7
861	Alan Isaac Huaracha	https://play-lh.googleusercontent.com/a-/AOh14Gj4SJLBY7BknusUwnwrKMB6mZ4xtapntrx7KR89vQ	Your game is great and The first game was great but this game is more great rate it guys!	5	5	2.7.6.7	2021-07-26 12:32:36+00	\N	\N	gp:AOqpTOE4kOqkR9I8Sg_3B4WM-zcQFmhMwKPoQ7bhZuf5RzuUYpYMfGggINKHlUzhV-a-zbLA3F21Mm9IvjozSw	7
862	Isabella Vera	https://play-lh.googleusercontent.com/a/AATXAJwyCN5Y0sJm9PP6WzggPrebWXxzHz25coLOBFha=mo	Very fun game and has lots of things to do.	5	2	2.7.6.7	2021-07-24 00:29:31+00	\N	\N	gp:AOqpTOESsCj1sYOVnUyBcbFw21xqWJSz7S0hFnG7Ey-PBdH5fqK122H1XjwI2r4ekBstET8oVyMvrJUAuelLag	7
863	michelle deh	https://play-lh.googleusercontent.com/a/AATXAJz3yU3bMwEinWA3I0lodX_tDOKTas6EWnRfNr7L=mo	This game is actually good. I love it. That's why I gave it 5 stars. Keep up the good work!👌👌👌👌	5	1	2.7.3.2	2021-07-11 17:35:30+00	\N	\N	gp:AOqpTOFXtfit8h3BpVSRPByu1aDu_jfzyGzyraze3a_4yOmaut0pFc3ZYi6P_p9gLAEUv68uN1DNTYKLFisiJg	7
864	Riley the best princess	https://play-lh.googleusercontent.com/a-/AOh14GgM3vI3Bk-ZdLElf0eXC7ZjqN9yrQVOVMw29eOaR6I	It's not that good because it's slow and it takes very long to load I've been patient with this but I can't take it anymore I give it one star	1	13	2.7.3.2	2021-07-03 18:59:03+00	\N	\N	gp:AOqpTOHeSF5zMDbcsagqP3gCBNw05a2sHrlJOBMNTIuKue0PD1EMbUKoeUwy4QtWySt1VKAsJLkAQQ9yxMYxXw	7
865	Brisa Ramos	https://play-lh.googleusercontent.com/a/AATXAJxEnOrwDbDZmb-kqpejyU1v1JVBMrt_FxuZWD38=mo	Why not get clothes fast and its slowly like turtle 🐢🐢🐩	5	1	2.7.3.2	2021-07-22 20:50:20+00	\N	\N	gp:AOqpTOG8v0XtYYR_cfEx7kCVox49yuW7tcRfAqJoeiHVBkxMVNz8qBqeiD83MpCuDxEByVY991a1yddPCwzQug	7
866	Unknown Person	https://play-lh.googleusercontent.com/a/AATXAJzkIv4Ikp2R416OR8vHgzvZ92W5gBCsD9MTbdtU=mo	I love this game it's so adorable and like I'm on level 22 and it's very available everybody that is faking this is insisting please download it it's a cute game	5	16	2.7.3.2	2021-06-20 05:36:26+00	\N	\N	gp:AOqpTOGgKMgHg3rSv1CLTOBR2QXVWRlVhBBASpO5KCFwB9hqkZY7px75u5hJitVW-fopo0GY67m4_Fa1MkpyBw	7
868	Kk skits	https://play-lh.googleusercontent.com/a/AATXAJzsPBDOBDwZK2z2EpHn8KtpcolhKVifffC3822H=mo	It's very cute thing game there's a lot of things to do it's amazing	5	2	2.7.6.7	2021-07-13 13:36:25+00	\N	\N	gp:AOqpTOGOqioxL5fnhiC4cwaNGLYSeqN-DRmiz6qmjKTrhsIr67nTRq96IFcvRVUfW_zBlMvLQ8jORNIqyXJvFg	7
869	Dona Mishler	https://play-lh.googleusercontent.com/a/AATXAJxIwASqOfR3Gn5NRUBz5mx5R8chodm44HZyRlP9=mo	Wish there where more worlds to fly. That hasnt change at all .	5	0	2.7.6.7	2021-07-18 16:09:39+00	\N	\N	gp:AOqpTOGnXD9SzuyhWy4XE3gV708AsN_kTFWxpcRTehsyQh3KSCwM5_fCyOh77ziULgjxPMlDemS__IMRQdbD8g	7
870	Emily Yukiko	https://play-lh.googleusercontent.com/a/AATXAJwhLqvGpIFcQWT7pfoIV_IlC0aGIhbgf5of-Z4c=mo	I can use the reverse puppet to hear reverse songs nice	5	5	2.7.1.11	2021-06-13 23:56:15+00	\N	\N	gp:AOqpTOEJfQqg3-wVwAz4eKVWujO-8alW-K1kn4xDC_Qsq_lrUHrK7ho1ebGoNi15ZGEhKm0W0HX0LqfA9sKDlw	7
871	Jennifer Burnette	https://play-lh.googleusercontent.com/a/AATXAJwFW-Ii25TNP_c4DAyjJ1vAAG92WOwjgtpu5ant=mo	I love it because he is so cute as a baby and you get to grow and have fun with it	5	0	2.7.3.2	2021-07-31 13:56:13+00	\N	\N	gp:AOqpTOGA7q83QvfXfbNM-qHfa7KqMUDA6drC8-kt7pOpos8U9S5TjBCKSHw1INl8a2N5AOTzdOK9QYj31P7RSw	7
872	Gumdrop the pony	https://play-lh.googleusercontent.com/a-/AOh14Ggrh8TH0gwKaM86zZYnp-cr66sJ4fTwnf35_sWJ	I enjoy this app a lot and about everyone saying This creepy and stuff I don't believe that I think it's cute	5	2	2.7.3.2	2021-06-30 02:45:07+00	\N	\N	gp:AOqpTOHm8LpIp71qd1JGoKCexBmqWKGDDrU0lNBztx2R9LTDoma26fK0PAde0SVMwMWTGKjq9-rjR9hoQXsU5Q	7
873	fx Gamer	https://play-lh.googleusercontent.com/a-/AOh14Gjj-rWzevufCjpqMFKlcGAwLRVD8TSXvxx936lL	talking tom used to mimic you when you talk, now it doesn't. why even call it "talking" tom?	1	10	2.7.2.6	2021-06-19 20:47:17+00	\N	\N	gp:AOqpTOGbQqUpk3Hzjxg2-ZFmP21Ug0vNCcmoNbXcDdB_CHmue5L5-DBYXKqJi_CaUoKOmArgFBEfDfA_96uu9g	7
874	Denice Garcia	https://play-lh.googleusercontent.com/a/AATXAJwBGrbM3ylPC28MHhW5tgIHLCgpPSbMxoxxqCpf=mo	Annoying but crazy but there's also a chance for amazing	4	3	2.7.6.7	2021-07-19 21:51:43+00	\N	\N	gp:AOqpTOEfHxQJ6q6nbHcMJfJJRuUaQInr5ui3dFTl6Nip7I2cO2eisoomIbqCN227fGhqpldW1byJ_VioXJJIXg	7
875	Dan Moncur	https://play-lh.googleusercontent.com/a-/AOh14Gg1I3WL-w6TrO3SC7XEkZ4lZuWIBh_2M8DEHBCaUg	never move the target in dunking challenges	5	1	2.7.3.2	2021-07-11 15:20:16+00	\N	\N	gp:AOqpTOGvDUlbRuAIqnJVB4Q2W5qkpJ3EXOKuzFo9sv-gtLJrhgk3LkE10b0wW8oubelsCXmoC8T-YmOCpeZ7qA	7
876	Sanai Benjamin	https://play-lh.googleusercontent.com/a-/AOh14GjGOPlCRjAwENzPApKfoXmjD35bnTq5gtXjHIBq	This game is super fun I won every dress up battle even though I only have a swinm suit on 🥰🥰🥰🥰	5	4	2.7.1.11	2021-06-14 19:42:44+00	\N	\N	gp:AOqpTOFbtPfzpn5x960c_kzrs09UZAex4Y_i7rDai5Op_sogzs2mSdLRl4C3qeZjcDa1hlKMYIuaGK0KQFdZfQ	7
877	Popi Farzana	https://play-lh.googleusercontent.com/a-/AOh14GiMxTKkB1_8C9X0aiEjsSC-Cs8ckpzeZTStfzPzSI0	Love it the snake game is the best even my mom find it fun and she hates games and the original snake game is boring to her	5	1	2.7.3.2	2021-06-27 14:28:14+00	\N	\N	gp:AOqpTOFRBOWUSlfj85RhrSefA4kmDgeZnVjXaiqyhOFQYXSQRFiXjqWB2LFXz_IH7JDJRQY9uYzN3UuNtAT5BA	7
878	Flower Love	https://play-lh.googleusercontent.com/a-/AOh14GizLub9cNdIjroer-U1sIZxjAzkRp4AjIwGdC3L	I love this app so fun. you can play whith the cat. all kinds of stuff cool game	5	1	2.7.6.7	2021-07-19 07:34:47+00	\N	\N	gp:AOqpTOHrHxHTv-j6v9GsIZ07ys8zdpIgMQd0lsUAAwL7lmG-XBMnK0pnUj0FrAAp3Lne8Fu43BDuER9SkdzBgQ	7
879	Pam Horne	https://play-lh.googleusercontent.com/a/AATXAJy8vFWXbA3_jlvob2U9ENp3GdjmkrfDucpAkfjh=mo	I like talking Angela 2 but this would be fun If you had a friend and y'all would be on the same level you could probably see each other lol hahahahahhahahahaha	5	1	2.7.3.2	2021-07-06 15:53:50+00	\N	\N	gp:AOqpTOH0cw9yi-F0izrp4iWCRARgh8CKhJodLG6Mf7Z3FX8TbggTAvmmPOfGABuyssMOIs_9R2abzmYfLX_y4g	7
880	Faith Cummings	https://play-lh.googleusercontent.com/a-/AOh14GjehXCXbKeBlG1co3yckeIHOn_Dw9wkhv5HYJD0Ug	My grandsons love this game	5	6	1.0.2	2017-10-20 13:41:35+00	\N	\N	gp:AOqpTOGu7K-7Fmzawx6sAAOP6mek6ASi6O-njMrGbj1inn_QX1blA7ZDc5zsYUBVgOKifd8MWlcSNkinWF4z	5
881	Brooklyn Sophie	https://play-lh.googleusercontent.com/a/AATXAJx2XGMMDVbMpdeweoHQg3xYhO7JZJBfQPS8TZmS=mo	It is so good	5	7	1.0.2	2017-11-15 19:40:09+00	\N	\N	gp:AOqpTOGfLcTIjrWkQDKNVv4VlURGqUHqotUzgrJjpt8veGq1JObZMghm1uDx2Jg3TA5-ZSlNS6dWE8EY4RyP	5
882	Diffuseworld 101	https://play-lh.googleusercontent.com/a-/AOh14Gj-KY5mH-3WdAYjdU0olUNwj3bCk9w2vZmd5Dr0PA	It goode	5	1	1.0.2	2018-05-06 20:05:35+00	\N	\N	gp:AOqpTOF6XaP_HdbjyMXer56Q6aR9zcTjnxpNv8l8NtD8nUCWKkiMmR81S0-b-RYXRydqi7BZ4z2BpbNXjMZC	5
883	Jerry Casper	https://play-lh.googleusercontent.com/a/AATXAJyi9Xo2UErzaZ7S7GYt6BhlpbnpLZIcs_G4akon=mo	Freezes constantly	1	1	1.0.2	2018-07-14 20:03:14+00	\N	\N	gp:AOqpTOFCHS6JWU-WQN4CJyzLYI9s4ta-xa4BBSszQLdnFnCjNZ216v4iwmNWcFUmq4cpykOGkP_M1rdFSrq0	5
884	rey830	https://play-lh.googleusercontent.com/a-/AOh14GgIfrqzVRZAWorCqSAH3cI_RfA9PJ7UYB-RcqK9	Four year old loves it!	4	1	1.0.2	2018-06-14 04:48:04+00	\N	\N	gp:AOqpTOFbqjMtKqH8gHdyTlslp-_UQPKyoWUc9EpMGx0cSknhWDH9VojhZsu4uV3er-QQ9hqo5A2m9R-4OMjn	5
885	lana simanovicki	https://play-lh.googleusercontent.com/a-/AOh14GikEHsHt3gFGfmwa45MbKpUrKjt0bS65AyQ5EBOLg	Goodto to	5	7	1.0.2	2017-04-05 14:57:26+00	\N	\N	gp:AOqpTOEUkUG1PWLmuWHVKV9lkpjxCZy1bDqMNnQbf_J7Z_qoyXBe8qLzxKiVjP_Ffzl934hlhFS9YDz4qi6c	5
886	levi hayden crook	https://play-lh.googleusercontent.com/a-/AOh14GiidxTOcDkgDgpcOIuhxChR3NtCddWNho8YGvG6	Hate it	1	15	1.0.2	2017-01-05 02:16:10+00	\N	\N	gp:AOqpTOFq_qX1iZtdqbw4qc3MoOof2Rfmft-VcTb4FWi-CbfnQTsqAhT5c_9FW_1t5gfoqiRxgnTfSZaxyOMm	5
887	Angela Hutcheson	https://play-lh.googleusercontent.com/a/AATXAJy4zD2vi4xYkgWXHO7vi9CfNWf1-_eak4FIni77=mo	Cool.	5	0	1.0.2	2018-11-18 00:23:34+00	\N	\N	gp:AOqpTOFOUUsXxxGyJ0Nha1S1ZVtAhxlUZZ3_kacCzzfAkm5JyqUkrn6lsTJ2lD3k_3Xk5SlhIf28YpzVEi-A	5
888	James Luke Robinson	https://play-lh.googleusercontent.com/a-/AOh14GjIOs3dhv2ZYAwnhK4KtPbe6AKklx8E2SkHVSgk	Was a bit difficult for my 3 year old but I plan to try 2 & the newest one 3 which is an early access one, maybe I'll have some luck with that one.	3	1	\N	2017-12-26 16:42:30+00	\N	\N	gp:AOqpTOFTsqC_HnQVSjv8NKLp3Rj2Mx4q7tdjubzhNkWbGkKMOgXMYM7uO-hYelLYSV9Xhz_hCEEr7BufZYGU	5
889	Malachi Williams	https://play-lh.googleusercontent.com/a-/AOh14GgFD4mO8XBsgwuPDEAoX_8iaN4VEnFxYl7q5rm6vQ	This game sucks	1	1	\N	2017-05-29 03:09:56+00	\N	\N	gp:AOqpTOGorY-hqC1sEnqaTWUi4CcUyRaa8WY071jxlPWjUU3rH4MeX2t7uEFNpxXKyL0XtptA83s-ccPXdqqa	5
890	Adam Welch	https://play-lh.googleusercontent.com/a-/AOh14Gjwzk0lTOdwdPGR7vD4rf_i5d-GDmgg1xdRyRUFkA	diging dinos	5	2	\N	2017-05-12 01:28:21+00	\N	\N	gp:AOqpTOHQWRgnC21k1GTP2kEA4LQxFPWKwNtKlysIGID3ssmWEE6okHsggiSVhFgbxC3wlZiq-FqOc-sfeCV2	5
891	OH CRISTMAS TREE HOW LOVELY ARE THOSE SHOES	https://play-lh.googleusercontent.com/a-/AOh14GjssTPoGUOt36PpgTF_Rn8h4wppvUuQMMbbltW8	ITS NOT DOWNLOADING I HATE IT	1	0	\N	2018-01-14 02:17:56+00	\N	\N	gp:AOqpTOH9F9AoAXGMlJGr7qvpwAGNNr4CgOS3v351vb8WvxqNKcgj978sdDcKRbehGxA-N6E25U39sA6s4mOh	5
892	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	Its ok	5	0	\N	2017-08-17 23:44:57+00	\N	\N	gp:AOqpTOEUkpdX8jfWF2pZJuV-u7chObJe8feAke5mTaVc2VfMeu6aJKGP7H6ceYvtphzBWZW76Kh7lbKnoMHD	5
896	Alexander Novozhilov	https://play-lh.googleusercontent.com/a/AATXAJy5pUZ-cnEXMYSY6jfkwBwOzvSGCvAvwDX1Gd-s=mo	Convenient, fast, reliable, offers large assortment of goods and products	5	2	9.0	2020-06-23 07:38:31+00	Добрый день. Спасибо за ваш отзыв! Рады, что вам нравится наш сервис и что вы наш клиент. Ваш Ozon	2020-06-23 08:23:39+00	gp:AOqpTOGrnexWJbHVVwXFJA6xH9CmXLBnTEUr3x6ts_xY6dEyqz0bMMUPbdC1nnC1EnlktddJVNctff0j6n2tnw	3
897	Владислав	https://play-lh.googleusercontent.com/a-/AOh14GilBpUo456P-AXfwABIHtphH9RQp5gLSQl2hGPWQg	I'm so tired of getting just the similar answer like "We're working with our services and tryna make them better" from TikTok support. I'm really glad to hear that, but it doesn't solve my problem with having no TikTok playlist feature.	3	13	20.5.3	2021-08-04 17:23:24+00	\N	\N	gp:AOqpTOHcQ8-sSBQ28Eg6QeCOZ1lBIfGiRiE8sVOhphWXXf4_RqGtFzDjEXqZE672zdS751RsredixFt8XZnyFQ	6
898	Maleah Rose	https://play-lh.googleusercontent.com/a/AATXAJzr7vTBk_JwueeH8L1JGoflibmzhqSQSvHCLOEx=mo	Great app, but I hate how I know I'll like most of the videos on my fyp so I like them before they're over and then it doesn't let me like any other videos for a while. It's really annoying. Is there a reason for this?	3	7	20.5.3	2021-08-02 22:36:34+00	\N	\N	gp:AOqpTOFz9ctMPx4DdSGgdBVuc4a-kWg5k2xczNUH1Cg_zS8svJZgSEehaiCTtGzdGOXFaO3ytFeoUK31wYMutw	6
899	Allison Dole	https://play-lh.googleusercontent.com/a-/AOh14GiL50ao4NByCtHqkMbGKuQ6mdWnMDbHzeU5WySk5mw	Just downloaded the app and tried to log in with Google. It instantly said "too many attempts, try again later". Ok. So I tried to log in with email/password, then the verification gave me an error: "parameters error[5001]". So, nevermind I guess 🤷🏼‍♀️	1	129	20.4.6	2021-07-22 16:12:13+00	\N	\N	gp:AOqpTOFxjJGF2NnB6qp3Sur_9UgsntVON_XwDXODT-gQE9t8EykQ-u8eYO-mRcRKX1fzPRtTYmNysW7l5fKbWw	6
900	CasterXDesigns	https://play-lh.googleusercontent.com/a-/AOh14GhYzGl0qW9USBv8kYW5KzxEtOwhr-x3lCHTVb9i4A	Really love and hate this app Sometimes. Contacted support multiple times for help with getting my account set back to a pro account. Still no solution on that even when providing screenshots. i cant even make over 60 second vids anymore because of it. Seriously frustrating as a small business owner.	2	118	20.4.6	2021-07-23 07:16:59+00	\N	\N	gp:AOqpTOFdNM06Etx-JiBEeJfz79NcJjNrFO0NJBQ0Pj5Nek7n_I_tEpeuAa2EPpcLJtLp7exAa2dVYtd1CZlcSw	6
901	Will Thompson	https://play-lh.googleusercontent.com/a/AATXAJxEUPFBiN94HmzQXYYnKg8Ug-DkMEg09o2DYZvO=mo	Why do people think this is scary they're so stupid who would think this is scary they literally have a show and the new updates are fun but I wish when you get a puppet you keep it forever but now you don't keep it the only keep it in a day I really don't like that but this is a good game.	5	156	2.5.2.26	2021-03-24 01:49:13+00	\N	\N	gp:AOqpTOELg8zTojdzx3pFDY_nBv7GXOpY5BbtY1jIcktLe-sEoHT8l43Up6ESXDkdU994daYM9BPKsP8e7rfedw	7
902	Sumi Singh	https://play-lh.googleusercontent.com/a/AATXAJyLMtMyTsDZMI_R7fUBIiKn02UPsuDGnBW0GyYw=mo	This game is really fantastic and I like the game Very much the reason behind giving 5 star is that this game is offline and do not show so much ads thanks worm 🐛 to giving such this type of game	5	192	2.2.3	2021-07-11 04:15:50+00	\N	\N	gp:AOqpTOGVNtfgBvOj8ljevdATr1Nb-sh-M-Gc55bruRPIgrKbFAbzBSq4GHGmJQbCWykym1Q_i5PS8Xy0Vy1bLw	4
903	tiffany delgado	https://play-lh.googleusercontent.com/a-/AOh14GjOmfbHqJ3VU0M-gw71tcRsrB59P-tZUFmRQa2P	Good. But the worms controls are not as sensitive as I was hoping for	4	0	1.8.2	2021-03-06 01:17:11+00	\N	\N	gp:AOqpTOFuC8TKPuFyg_J77sqBoIX4TjrnzWyR95yZRg-7t2YFXx3wp7gHtwdWA8gMHRH7sO_sfyWxu0Om7sUBJg	4
904	Subhan Ajmal	https://play-lh.googleusercontent.com/a/AATXAJwW_896zZHAXU9X8dsbbmPjMToRSZmgeri4W91Z=mo	great game, its a time pass .it is better than talking tom but tom2 the a good . in my mobile there is no ads .	5	0	2.7.6.7	2021-08-09 11:27:35+00	\N	\N	gp:AOqpTOE2q61r2IEcEUUoVTPcylMZvq32glhzHmWuXp7Bj1LzVF5Gbg6PLxusUnqVrCVvLl4aeEpDx7MAulIUKQ	7
905	saloni Chaube	https://play-lh.googleusercontent.com/a/AATXAJwzdJjXZItM2j-_X1QE76wCW-0B0UgoWHKW6KcT=mo	This is wonderful game......but i have only one problem that when worm becomes big then its not turning easily n that's why I m dying.....	5	0	2.2.3-a	2021-08-10 12:33:20+00	\N	\N	gp:AOqpTOEYKNwnSOfE5nsszEMGYGMVVEfD0MnaLfyCCzpBUIaKryWamrHT6LTp8cJzUEtpqksjzwMJq_DPOmjv5Q	4
906	iud yulia	https://play-lh.googleusercontent.com/a-/AOh14Gj7NKZ3V_0rNtZnQ8_Wd2QjMborqdH-Vo-r8VOuB70	So fun, but please give us more task to finish. It's getting boring if only eat and eat and no more task	5	0	2.2.3-a	2021-08-10 09:55:20+00	\N	\N	gp:AOqpTOGzxvh94KlSuCv6R_6Wz3jlquI11OLhL2MuoVcSNnOT8W-Hx1Dxl0rfnmtaAvT8bFW_eZm7Clx9DK5jfA	4
907	Nilu Parween	https://play-lh.googleusercontent.com/a/AATXAJwczTUEbilCWSGApsI1H2m26LP-JR21DwxgFvyd=mo	This game is very good it is very fun to play it and it is more fun to say fruit in hitting the snack	5	0	2.2.3-a	2021-08-10 15:24:19+00	\N	\N	gp:AOqpTOFVsN_OQrv9_H_E-EYTSQRteoxfB4AD9ELI3pH0cfT-JC7d-WSc6mfs9kGHys6-wGywcEe_3v1DiRtWdQ	4
908	Zane Thomas	https://play-lh.googleusercontent.com/a/AATXAJwldjoWW7eoUoJuD6Sn3Nvc6kvA-eZ-BeMQzWRW=mo	The app itself is pretty solid. The algorithm allows you to view content that you specifically want to see, while occasionally throwing in a bit of new content related to what like you to keep you interested. However, censorship of content is a bit overboard most of the time, but that is to be expected with today's social media environment. Even so, some questionable content still slips through the cracks. So, one way to improve the app is to improve censorship quality. Nonetheless, great app 👍	5	6	20.7.4	2021-08-09 17:07:28+00	\N	\N	gp:AOqpTOGFiodpZAcvcpe9l1ZHCXV42PJkktZxg-uVJvnZoJ5rljkjjOJw0Dai87tq2mCVDtHkeeWXt17Miorf4g	6
909	Kelly Allardyce	https://play-lh.googleusercontent.com/a-/AOh14Gi3W7qCE30KveSONjCM1QotZyxiOiuM2XY12auZaJk	Love this app but for some reason, the text to speak option with all the different voices have disappeared and the new effects option has gone as well. I've been using the different voices and effect for a couple of weeks now. I wake up today and they are gone... Its like its reverted to the old tiktok. Its not my phone. I have two phones and the same thing has happened on that and also to other family members... what's happened tik tok? Please respond. xx	5	1	20.7.5	2021-08-11 09:08:36+00	\N	\N	gp:AOqpTOEAQY6pLS3s3qVDv93ewkLpqP6r0iy-P5iq0VO08I34_abMB35V-c8GjUTMrjUc5UFOSlOrCv692p9yrg	6
910	Effie Skiles	https://play-lh.googleusercontent.com/a-/AOh14Ggk0rOuWvOVxqGjrpbVkMI1om1YpyIZAUPpmaCB-w	For whatever reason my contacts don't sync. My husband and son downloaded the app and made accounts same day and they can sync contacts and add friends but I can't. Sent messages to report a problem and no one has gotten back to me. I've looked up trouble shooting and have reinstalled the app idk how many times by now. Restarted my phone idk how many times. All setting say to sync and all permissions are granted but still nothing. I dont even have the button in the top left corner Just some game	2	3	20.7.5	2021-08-11 17:48:25+00	\N	\N	gp:AOqpTOFTJer1yCaeLn-T5neAl4M-uTZLHywutZGW-mmPEUy0IwCWozfG_V67mIav1JRn4HAjRDINg4_uqUf9yA	6
938	Nafasat Faisalnihan	https://play-lh.googleusercontent.com/a-/AOh14Gi-ISenFgex-4mTVbLLIBs6ygTukBhTZhSOFQvl	Fun game for kids, you must enjoy and play the game with a good interest. Like the game.	5	0	2.7.6.7	2021-08-11 02:45:32+00	\N	\N	gp:AOqpTOHCo1los2vm7aEYVMy0LWhph6o08aQvPc13d41moyjNKU9ookuE2IpQ--0QHljPMVyNeSwAu42p9UD2wA	7
911	Charlotte C.K.M.C	https://play-lh.googleusercontent.com/a-/AOh14GgYm08HsnspOr0HbTQoHfHzekPu1m3Uu-z73Z6k	I love this! I have my own account and I love making videos, and watching them!this is a really good app for when your bored and you want time to fly by. You can make different accounts and discover new things there's tutorials and alot more. Hope this helped, Thanks for reading! 💞💗	5	3	20.7.4	2021-08-09 20:36:35+00	\N	\N	gp:AOqpTOGNt4V1VbC1C116_ENqHD_1_Iv271DUXeNZqPxI9oKW1jOH2H5gxRPDZo8B2KzKZ73SkwwmojfMmc4vVg	6
912	yeah.	https://play-lh.googleusercontent.com/a-/AOh14GjyR-YUS3a723SnO25JZ3b4_nq2DQJa4oHWkCIc	This app is really cool, but the reason I gave it 4 stars is because whenever I record videos the video quality is very bad, and when I use filters it is SO LAGGY. I dont know if you can do anything about this, but if the quality gets better I will definitely give 5 stars.	4	0	20.7.5	2021-08-10 17:22:35+00	\N	\N	gp:AOqpTOEayIr-geNJiSxLQ_dPrH4-fFHyz6am2DEeyAx1H54MMxRZ6VVVWfSsX6k3NMQGMmG_O5YMM-oj5YkjWg	6
913	Daniel Kaspo	https://play-lh.googleusercontent.com/a-/AOh14GiDZ6VVi3_rDLIZoE6Nq7JBj_P56dxCDBLxmJBUc1g	The app is great but when you try to save a video, it saves it to your camera roll. This is a problem for people who use things like Google Photos because Google Photos will treat it as a personal photo and back it up to your cloud storage. There's no way around this currently, you have to either delete the videos or back them up with your personal photos and videos. This would be a five-star app if they just properly saved videos to a different folder and not your camera roll.	1	2	20.6.4	2021-08-11 16:09:06+00	\N	\N	gp:AOqpTOHj4M2D4_sW_sY7Wb00xGvYzOnrSmR9VWeWh6NcPrqzWNYSo0E1d6VnuASY79XQ-A8dLIpe7j6Aph9pjg	6
914	Zoe Reeve	https://play-lh.googleusercontent.com/a-/AOh14GipnWqruN70yeNffGxWxGx20WRxKe2m0nosCFpgtyQ	Every time I try to make a tiktok, the app freezes/crashes and it tells me the app is no longer responding. I have tried re installing it, updating the app, restarting my phone etc but nothing helps and it's been this way for months. I have to restart the app about 15 times before I can eventually make a tiktok.	1	0	20.7.4	2021-08-09 12:08:30+00	\N	\N	gp:AOqpTOGk3AlLEg-YE-id5_rJjBtieFVzOpfK1aFPAnlh7pzkjF4f3sAWBezOex5qENC3JWo_bP4SV3vmGSX9tg	6
915	Brooke McFadyen	https://play-lh.googleusercontent.com/a/AATXAJx4r_KO3xFpXN3fzjHWlSq4DIlgA_X-SHj7fI6xOQ=mo	Tik Tok is a very fun app. It shows what I like all the time. I could watch Tik Tok for a whole day straight. I'm always learning new things, and hacks to make my life easier. I have learned how to cook yummy dinners for my family, and whole bunch more. The only problems with it is it has a lot of cursing. It is not for younger kids. If you are not okay with your kids watching videos that include: cursing, sexual content, violent videos, then Tik Tok is the wrong app for you. But, I love the app	4	1	20.6.4	2021-08-10 20:30:17+00	\N	\N	gp:AOqpTOGfp_jTfg4GbnkBvSC17M0paENy-D2xZxLQZxmPfcVQ8Iv7KV14CjdeFJ_rgt1O9C25Tr5VrUAjVj5xkA	6
916	Arleen Portillo	https://play-lh.googleusercontent.com/a-/AOh14GinxuWogVhL1acAGfyr3GNOZ8Y023xO2esuROSYxw	Great app but i have issues with it though, my account got "temporary baned" for to many reports when i clearly did not do anything wrong, my second issue is that it gets frustrating when i put the language as English and it show up Spanish it's ok because I'm Mexican and know Spanish but it's more easyer to speak/read English for me, and my last issue is that it gets slow and it lags a lot and further more it tells me to check my internet when I'm at full bars, it doesn't let me text on the app	3	1	20.7.5	2021-08-10 13:01:51+00	\N	\N	gp:AOqpTOEzKEGxdoaZSvwxVqbV1OaJuWs72cEHXcXkJxFPQtIYNAWGv7USKJNeDnPs9OChKqvwP169S3cMCXSQyA	6
917	_Gacha.Fr0ggy_	https://play-lh.googleusercontent.com/a-/AOh14GgsnoALqGyLjm2kl1nlh51leWxr0B6QBX80a1Lj	Was good, For a VERY long time. But just Yesterday my google account was temporairly suspened. I got banned on my one TikTok account, and then they logged me out of the rest of my accounts. I tried to delete the app, and install it again, But it didn't work. I would love if you guys could figure out the problem.	2	0	20.7.5	2021-08-11 01:32:54+00	\N	\N	gp:AOqpTOHmRxzw_cKZD4g5nSCsSVjzsGnAXz8-159aDfOaZOtvYPSlUpj4t1UVVe3K21-ZiLLQ1WnbZ7mb3Jc3KQ	6
918	Makena Manthorne	https://play-lh.googleusercontent.com/a-/AOh14GiABcZukhvSqKuI_WwhOKD_IkanqMKoFNe0nRRSaA	This app is enjoyable and fun. But with one downside. A while ago people can't duet my videos, do to privacy concerns, and I can't change it. I wish TikTok could allow anybody at any age to have other people duet their videos, at least on certain videos. I personally dislike this problem, but I know it will never be dealt with. But other than that, Tiktok is awesome.	4	0	20.7.5	2021-08-09 14:09:48+00	\N	\N	gp:AOqpTOG4L1CbyMpMkUjcOG1zhAeLtL94XwxRN_bAASaRQLETh-IXez1u-Yi6bNDl9KvtgDe7KaGkyi3hU2VsNQ	6
919	Laura Montano	https://play-lh.googleusercontent.com/a-/AOh14Gi4q-sCOY1m7wrlMLu9BjUlNxlA4X0-uBq90Bzd9A	When I first downloaded this app I loved it. I was Able to make some sick videos for my smokeshop but after the new recent update its not working the same for me anymore. I used to be able to make 30 second videos with multiple pictures and videos and now i can only use two and 5 seconds of music. I tried uninstalling it and installing it back but i dont know whats up with this now... :\\	2	0	20.6.4	2021-08-09 16:48:35+00	\N	\N	gp:AOqpTOFNurZTGK9hLqelziJ9wVx7s7E-H5RNHTKUsHGrI1PhS6Yfjmx7tDrRkgNtRmV3DNVbo1WoKWIJqKqIZg	6
920	mark mccurry	https://play-lh.googleusercontent.com/a-/AOh14GiRxEVRRNDOBCdx4XA2fZxJdfZ5stbtTjwZL7ciwMs	Aggressive app keeps running, overrides screen time out settling & drains battery to zero. This app covers volume control always. It's a bastard app. Don't know why Google allows an app to function like this, POS. Ok, this review has been up for a while & is entirely accurate. Where is TicTok's response? Silence shows that they don't have one, shameful.	1	2	20.6.4	2021-08-11 15:50:16+00	\N	\N	gp:AOqpTOEcoHSgUqfn8SJIfTPi5mK3AGasqouCsmnhrLZiecmGQEdV8u0xlJfPTf94lHWtRC_a7rlfSu4J0TFP_A	6
921	Sara Budzioch	https://play-lh.googleusercontent.com/a/AATXAJwrZmTglMZRwyCmrJpxKWSzwoiMEqTtUFvKrIGr=mo	One my favourite apps, however, very annoying with updates, my other accounts got the 3 minute video update, my main account I use doesn't have it. Also I seen multiple innapropriate stuff that has been up for ages and haven't been banned. Fix these issues and you will get 5 stars.	2	0	20.7.5	2021-08-10 09:09:14+00	\N	\N	gp:AOqpTOEKk08_qkTBZtZ4hJ5PN3FI7ZqNx3lgva-N6ultrWh9mcZuWnrZo1RMMaeemehn2QnanX0trmmQMHPzmg	6
922	Dan Abel	https://play-lh.googleusercontent.com/a-/AOh14Gh0aM1hTq9BJmtokv-5RXg1C8EZiq78vgXFeu8BDak	Very disappointed with app.almost now 2weeks not opening every time showing No network 😣😣😣.Being reported for no apparent reasons. Do something about it it.I love using it but now due to ads reporting I hate it.Am following to rules so I don't know where is the problem exactly!!	1	0	20.7.5	2021-08-11 13:20:50+00	\N	\N	gp:AOqpTOH6NCMNst1vyiF8FWhhOdq3T0-mRJzsfC9_01GobLPxSZzRE5VUbIDUwHIYZRisD1y84aCw3O8qWRB3-w	6
923	Patricia Windass	https://play-lh.googleusercontent.com/a/AATXAJyfILD-Rgpjjkz741SV8ZKIFREk3xIrYGHH2vO4=mo	Incredible tt is so popular. I love it! I'm so glad there's no ads. But alot of people get scammed. Please fix it. And alot of people are doing inappropriate things. I know some people caught lieing for example my friend said she was 18 but she is 7	4	1	20.7.5	2021-08-11 09:54:35+00	\N	\N	gp:AOqpTOE0TvaHpRlHlvbRceaYrVvwh0iqLEZZcHN5oiW7F4vCS-Oal_xey4U2-nEajhA3J2svssnWQXdilxenxg	6
924	It's Queen Jay	https://play-lh.googleusercontent.com/a-/AOh14GhhP7johEGyYBZU3CDfhh4UUneO3luMs25e9hOieQ	I have had TikTok for year's now and I love how they allow all different agendas of content and make sure the app is child appropriate for the most part there are only small issues that I have with glitches in the app but over all a really great and entertaining app!	4	0	20.7.5	2021-08-10 03:26:36+00	\N	\N	gp:AOqpTOEXIePX0iIpcUHy10TK2gKZkekuhUlfBG4TajBa09eMN-uhQ4pqcrqUALr6XKpXywkrWJOe3gzJf5_lXQ	6
925	Rei the gacha	https://play-lh.googleusercontent.com/a-/AOh14GjcO3mkiv_TyunZvcp7DgXPAKWW-hSPzQlR3qiPnw	Amazing app! But I do have a few problems such as the text to speech and how you have to "promote" by paying, but other then that I have been on it since 2020 and it's very nice!	5	0	20.7.5	2021-08-11 01:26:04+00	\N	\N	gp:AOqpTOGLTXIxnH7JRXDHQ9R7rrCVqIiEZzJBIVlqQKQNs-5KKee1jB3c0tJnjUgHACVPyLH_lLFGQgm2U7vUlg	6
926	Jahangir Ali	https://play-lh.googleusercontent.com/a-/AOh14GjTdeNC9G6mjATa8MhnM6wpjG-GASPBmZewBacyGQ	It was fun before, but now it crashes all the time, i have to re upload videos 7,8 times. N people like my videos but i don't get those likes. I also reported this issue in the app, but no response. Very disappointed	1	0	20.7.5	2021-08-11 18:47:59+00	\N	\N	gp:AOqpTOH2xAR5tNjEW18okG72eI8cZTqYAA75m-p0Butl69_kADNN6pbqOj0oLyMBHNiXWmE6xfr9JDp9Shhupg	6
927	tony ludolph	https://play-lh.googleusercontent.com/a/AATXAJwX0qOAxQJihGz5vTfrdiQ_W0G9k-VYccjOrBGC=mo	I like it and but. Each time you delete tictok and download it again. When you log in it says "failed to load user profile" i dont even know what it means but it been going for 2 days now. Im kinda getting worried cause idk whats going on but it better let me..	2	0	20.7.5	2021-08-11 18:58:59+00	\N	\N	gp:AOqpTOHDlyymV6odyzvAJaWfNg_cfHM2OmJEawo9jGDQZAGpo-e4lcKXAGsmHqN6pgPADyHRrct8VVcua4-0qA	6
928	Anuradha Basnet	https://play-lh.googleusercontent.com/a/AATXAJzP6Hmu9nHdTtdfNexLL0rxLCBZWITtrYL8xtLQ=mo	i had uninstalled it and when i redownloaded it, it doesn't let me login and I'm frustrated asl. it tells "too many attempts" on my first try so annoying. and after that for the verification part it shows no image??!!? and even without logging in it doesn't show any results after searching up a user or hastags. 👎👎 im so disappointed	2	0	20.6.4	2021-08-10 06:09:45+00	\N	\N	gp:AOqpTOGukpAgQpCgl_c7RSPRcG5a6yJuO05l9BirLjqtYc0T9UsrgYDP9OaRMZSm-HS9IdEH09sXAmNvcDG2Hg	6
929	Hayley F	https://play-lh.googleusercontent.com/a-/AOh14Givrngoxk0n1UMA2Qs-qEu2eXxXElA4XxNbDKCbAw	I love this, it's so entertaining, when I'm bored it keeps me entertained for hours scrolling on my fyp! Also the filters are really good and you can get such funny face filters! It's the best camera and video app I have 🤩🤩🤩❤️❤️	5	0	20.7.4	2021-08-09 08:33:03+00	\N	\N	gp:AOqpTOGqTcSo4TflsutuKac9P-3a1mOPNqGHyAkfp5JxTP8Pi9lSYYK5aflfYN8vDwc5vLXnxMjC1FrDtQPT9Q	6
930	Lir_The_Witch	https://play-lh.googleusercontent.com/a-/AOh14Gi8V04yC6NJWzH5lm6J_V73-Gw8pnuxgEAxN09GEQ	TIKTOK, my guy, why can't I change the voice of the text to speech person anymore? Why you take that away? Who's good idea was to take it away? I got to use it for one video and the rest of your platform didn't even get a chance to access the option. I am extremely upset at this	1	0	20.6.4	2021-08-11 20:50:48+00	\N	\N	gp:AOqpTOFozzBezVLPY8SAyTdFYfZcAa6cFSYAqtUtTLSA-uh59-7C5Spv0RUpBklD2hjxCVPUkbd1Gz9QKpJKXw	6
931	Jason Pool	https://play-lh.googleusercontent.com/a-/AOh14Gj9QYsayKtMhf67bGK43F6uC_RUDgm7OZEGKixIDg	I absolutely love Tik Tok, I am completely addicted, and I have never spent more time on any other platform than I have here. There is entertainment, there are opportunities to showcase your own talents and or creativity, and best of all, the community! Your guaranteed to find people you connect with, hands down, something for everyone!	5	693	20.6.4	2021-08-07 04:04:11+00	Hi, thanks for the high rating. TikTok team will continue to work hard to bring you a better experience. Your support is highly appreciated! Thanks, TikTok Team.	2021-08-09 08:51:24+00	gp:AOqpTOE0ghNQwnmD7t484TIBMwMs1pD40my1oN-uDgug5f_bVmyBT5qzVi8RKfUtp78DYb4NnM7fH_a_9thk_Q	6
932	Keith	https://play-lh.googleusercontent.com/a/AATXAJwiZd1FRta3U27nR5m1j1UWs3bx1cu5v3JpLpOb=mo	The app is great but I'm on an android and once in a while the screen goes black and it refreshes and I can't watch the videos I wanted to watch because I lost it pls try to fix this bug then I would give the app rating 5.	4	0	20.7.5	2021-08-11 18:33:36+00	\N	\N	gp:AOqpTOG5g3CApWU5xwj9lOtvkt7DUiWZmNcCH6HsLL0ZNRO-QXrfUxXL0CTWLGaaErrVAr7HKrOj7M_0MYQ9bw	6
933	Cody Crider	https://play-lh.googleusercontent.com/a/AATXAJyD6AxuWl67enhSdtI8Dc33_cpyOVF6WNIjFiTZ=mo	Decent app to pass time and get a good laugh sometimes too political. WARNING I did get screen burn on my Samsung s8 which I didnt think was possible on modern tech guess it's a sign I spend too much time on it but it also keeps the screen on a loop so if you fall asleep on the app most likely will get screen burn	4	0	20.7.5	2021-08-11 18:09:43+00	\N	\N	gp:AOqpTOFmFSjyE8vLRcChJatEvyy61aXV3diXSQtkn0W75LiOWukdNFkJMiyyZ5PYuBOPNjDPmGB1aROu3Su2sg	6
934	sky_yay _mha	https://play-lh.googleusercontent.com/a-/AOh14GhP7zZ2HDXsKiYAy8b4RxBsRTdkDQKHYtP5DvPIWQ	So it's a pretty okay app it might just be me but I can't make a fourth account and I've tried to delete two of my accounts and they won't go away I waited a full 60 days for them both to go away and I still have them I made sure I was doing it correctly everything and they still wouldn't go away and I can't even make another one with Instagram btw if you make for example an edit for your first video you have to make it for all of them For tik tok to show them to people	2	0	20.7.5	2021-08-11 18:06:13+00	\N	\N	gp:AOqpTOEOJhVwtwexcYXC_4d2vEFTx81GjDtR-QS-i_6tn4knRQ38LKXC1Ug_HxO_qPiAnmEN-qcbOiNSop2PhQ	6
935	Ashllyn Melo-Pang	https://play-lh.googleusercontent.com/a-/AOh14GgO0Qleyg1oP1NGohnvcGNKBnXT4z3myoaz9FXEcA	Hypocritical policies & ineffective implementation. My digital art speedpaint videos get taken down/I get blocked because of "nudity or sexual content" when all I do is post videos of my process for drawing people (with NO nudity in the final product nor are any explicit anatomical details shown at any point in the video). Conversely, there are creators (some of whom are CLEARLY minors) posting provocative/other highly sexualized content, or hate speech with no consequences. Stick to IG Reels.	1	0	20.7.5	2021-08-11 01:57:18+00	\N	\N	gp:AOqpTOGUfxLsbApNA6CRPXlTT8T8Fn4534xs54CwUvTuRFbyA5IBldAL8EgdlWHusrZ5O-r7gfaBlKq5tOSDrA	6
936	A Google user	https://play-lh.googleusercontent.com/EGemoI2NTXmTsBVtJqk8jxF9rh8ApRWfsIMQSt2uE4OcpQqbFu7f7NbTK05lx80nuSijCz7sc3a277R67g	A couple months ago, I got logged out of my account and was not able to log back in. Even though I had strong wifi, I kept being told that there was "no internet connection." Please fix this!	5	0	20.6.4	2021-08-09 22:07:08+00	\N	\N	gp:AOqpTOGXW9v5bZXLHKPQPbnuu691vyNHh-LXxB6TpjpmnAPEBCVmQ0i0X3AwSGKsEdMZYMpvYhiCuvpMxKLY-w	6
937	Albert Medina	https://play-lh.googleusercontent.com/a-/AOh14GhR4wME5w1qlW0GSfaJv4H-PkH0AQeeWZbfnLaleQ	Love the app. So much fun and pretty simple to use. Could use a couple of tweaks. For example, searching within my likes would be useful.	5	0	20.7.5	2021-08-10 22:09:10+00	\N	\N	gp:AOqpTOGPhETXq4rBBcBi_5DaUTk5UElZonD1tE6OWNHjiLMULUCyFy2FbZE3qzH8BwycsM1RnCd4HLc06ATQ4A	6
939	Sambridhi Verma 7B	https://play-lh.googleusercontent.com/a-/AOh14GjW6VcfkCXP0IUXseCWfqn8FBFtXHEjvUXpXNCa3g	I like this game the ads is coming so I close net than it is not showing ads I like to play talking Tom game all	5	0	2.7.6.7	2021-08-11 16:13:56+00	\N	\N	gp:AOqpTOFpyz-G5vFafio88JN-bMKpCM2v4VCNtphYf7zC81tnr6PdyWO5D4VWoWMz1QhIYZkjUW9bNDy1UmPkYg	7
940	Darian Sandmartin	https://play-lh.googleusercontent.com/a-/AOh14GhjRxRxjygOlBsKnO1KSIfvItl1OnT357uQFlmiZjk	The best e-commerce app ever 💜	5	0	13.17	2021-08-11 21:29:32+00	Здравствуйте. Спасибо вам за пять звёзд. Работаем для вашего удовольствия 😊 Ваш Ozon	2021-08-11 23:13:57+00	gp:AOqpTOFrFquOiJeFeRxYEciD9qKLrwwz1Gs0B350VIOx3eqjaZPQ5bM6_tx5FlWqqkgRZT-idtew37JNNF2STw	3
941	Ivan I	https://play-lh.googleusercontent.com/a/AATXAJzQpfIVmr4pNEHkv70bPFCW5OfV1xe8NfV_qUpG0Q=mo	Can't remove a saved payment card	4	0	13.17	2021-08-10 21:44:59+00	Доброй ночи, Иван. Вы можете удалить данные вашей карты в личном кабинете. Если возникнут сложности - напишите нам в чате. Ваш Ozon	2021-08-10 23:19:26+00	gp:AOqpTOGoExQrmOijOpPeXdD-CSU6woLJdQyT-VxVwond7BxEX6qx8P4Mj0hEBOlMiUhC3nD0Cid_ryvsb6CCFQ	3
942	Sviatoslav Kurylyshyn	https://play-lh.googleusercontent.com/a-/AOh14GhDEC0ooc4SH3y8nIMY5qUayizbGbOtuvDeIyAXNrU	The app is honestly pretty bad, especially when comparing to iOS. It's sad really, even Instagram has gotten it's ish together when it comes to aspect ratio & correctly displaying media. I get that because of the saturation & variety of Android devices available it's gonna be hard to optimize for each resolution & screen but c'mon, it's getting ridiculous. And bring dark mode already :(	2	1	20.7.5	2021-08-10 12:15:50+00	\N	\N	gp:AOqpTOGJsElCYOB6Y1dCJz3uJ3WBllrgFJDg95llZPz8IH24xwHZc7r1Nj_5n4qJGyWIjB9nM80dzWNoPQ2r0w	6
943	Heidi Comer	https://play-lh.googleusercontent.com/a-/AOh14GgR4ONpUWRkCw-n_7ATxSWBZNp8vhzq7P5VPbzo3w	I'm starting to get absolutely pissed off. For whatever reason, ever since the last update, it keeps trying to tell me videos won't load or can't play or it just gives me the bs loading freeze, and no it's not because my wifi or data is bad, it's because the app won't work properly. Please FIX IT!!!	1	1	20.7.5	2021-08-09 21:15:12+00	\N	\N	gp:AOqpTOEe8NmbCAD-vE2des20jII9C_pLqkhpNYAtaQWvQPQ3l7YDH_XG2r9T7n7PufYkueJZAwjAd2UTxP8X7w	6
1000	Ashlynn Bayer	https://play-lh.googleusercontent.com/a/AATXAJxI8JpWUvbyWt1vxQ_JZXv1BU8f8f7gydx4XKfd=mo	This app is amazing it is better that slither.IO and I love that app this app is a 10/10 💜💙💚💛🧡❤	5	0	2.1.2	2021-06-06 01:24:19+00	\N	\N	gp:AOqpTOE4WgHWJmEza_ipqZ81Z8reT-Boh8poqud36qSotluAN08MJB6ugLbzfRZYPs9swhBFXMIRd7yvEPBaQw	4
944	Anica Zdravkovic	https://play-lh.googleusercontent.com/a-/AOh14GjZGW2Y9qIsmIRE-5Y_sYWPxKhyd24wjtqtqUidfw	The app is fine, but I am giving 4* rating just because Android phones still have no option for dark mode. When I receive it, I'm definitely upgrading to 5*!	4	0	20.7.4	2021-08-09 08:41:58+00	\N	\N	gp:AOqpTOEppBWbKCPMJrjc1W4F7thU2zBu7y1AYDIixsH8wSmighB-Ba9Ay_9A7UlmurF5RPQNrNov13EgMUrl6A	6
945	Tin	https://play-lh.googleusercontent.com/a/AATXAJxx4wpRWVwmojiN-pJWt6ajshC9kjGb3VyfYYN-=mo	In my first download it is so fast , when it getting longer it makes me laggy and the VPN always turn off I'm always disconnected to my game.	1	0	1.3.4	2021-08-10 12:50:11+00	\N	\N	gp:AOqpTOHzr17XmI88O89lTuyBhw6OfIJkqyg21HQJgi5nBDE7O61oeaxK_23fGSsLCOHuVmbB64yr-4_VuELlJA	1
946	Scarlet Fowler	https://play-lh.googleusercontent.com/a/AATXAJw9ogseQSKCVognbP7Js9pfGGafqsyc_KrqFIE9=mo	There are way to many adds every time you run out of lives on a mini game and when you do activities or when you die on the mini games and when you try to do the colouring in picture you get an add straight after when you have finished. There are way to many adds sort it out.	4	1559	2.8.0.457	2021-08-06 21:47:40+00	\N	\N	gp:AOqpTOFS351Mf649yrGOuxQG9YicEl4iwAkQmtDzgVEXaygrQXUAX0Onp-CHpxQDo8ilshe8MSgGfBzbud42yA	7
947	Mekukuye Undari	https://play-lh.googleusercontent.com/a/AATXAJzrBEOUy8R7OUvXnaZABKCSwfbwJi-6l08bU6-f=mo	such a good game it is really fun you get to play with tom and he can wear different outfits.My talking tom is now 17 and also I play this game everyday.So everyone fustrated with the ads it doesn't matter.so I suggest you play this app.	5	0	2.7.6.7	2021-08-10 10:04:53+00	\N	\N	gp:AOqpTOHbuli-qP2VgiBHFI-eRejdEckz9aWuCEAh_kVarPyI6imzjwUdu1mYavyqdptG0Z3QyIBW8CGytUB-kg	7
948	S T	https://play-lh.googleusercontent.com/a/AATXAJxKRSCxKUONwD3Ooa7ToTuZ1Bk_lM9PNZ0MYd66=mo	I think 4 stars is what id sum it up to. There are many changes that the ui could really use. But its entertaining, exactly what it was made to do. But the description or hashtags that op's put on the videos majorityof the time arent readible or block thr content. Quite annoying. If there was a way disable that or at least clean it up i wouldve given 5 stars	4	1	20.7.5	2021-08-10 04:12:39+00	\N	\N	gp:AOqpTOFzbhWju1dyQxeVRRNjGGCrXfi3eHJbCBEYO8LfjSW3l-XJruDv_7Qed7bGEkTeNd2Ruil991voSeYHkA	6
949	katri	https://play-lh.googleusercontent.com/a-/AOh14GjI4DC82KD_oe6n7HUtieWOh2Qc5fyZVYGJM80KUA	I have used this app since 2018. I like this app very much but now my tiktok doesn't work.... It says that i have no internet connection even though i do, because i can use every other app with no troubles. This problem has lasted for one day now.. I would delete and try again if i didn't have so me drafts that i didn't want to lose :/	2	1	20.7.5	2021-08-10 06:54:25+00	\N	\N	gp:AOqpTOG8ERv17dNQOjo3HeAXHIcp-d4ZJp9IVOloJ9d07WkX2QJcsLd0zQMPA8uzU0gxbj0HRh51nx9c0LnExw	6
950	chocoCAKE	https://play-lh.googleusercontent.com/a-/AOh14Gj1Pk5bDw8buLIr3_sgRqxPvhq2djUnLjq73hK90C8	I love the app but the only thing holding you back is that you won't let us upload videos to a duet. Art creators (such as myself) like to duet other's art vids with our own art. We make an animation for soo long just to find out we can't upload a vid to the duet making it so that we have to save their video and merge the videos together which is a hassle. Please fix this. It would make the app soo much better <3	4	1594	20.7.5	2021-08-10 04:53:47+00	Hi, thanks for the great suggestions! We will be sure to share your suggestions with our product team for consideration. TikTok team is committed to promoting a better user experience. Thanks, TikTok Team.	2021-07-23 06:28:44+00	gp:AOqpTOGaY7Pm9SFZFknFHUNA9Pc0JCPxnmmDvgitb3WJFh1dYrswTC3_0q--WZ99sia3mjBq3_cmv44R5IaMow	6
951	vishnu mukesh 4th A ROLL NO 39	https://play-lh.googleusercontent.com/a-/AOh14Gg4WdOxDnXPu7gnk2lo3OXb66XKX-rEbNpesI8xBg	It is a very good game I love it but there is one thing that is I want to buy all of this fur and dress and eyes and new things	5	0	2.7.6.7	2021-08-10 15:07:02+00	\N	\N	gp:AOqpTOHXifH_kOanvPHfa_acl-ObXRRzV2kdmUQ20K11IODU47sFhDXCHNRXBtkY3AQhQAz0JmXrNzcWWlFM1g	7
952	Haz C	https://play-lh.googleusercontent.com/a-/AOh14GhZEdz9dk4NZsrj_VCyq0-L-hzzvUyts59h9azHVg	This is the best app I have ever download. This app is really fun,you get to see people either dancing or making cool stuff! Thank you for making this app. PS.im addicted to this app.😂 - that was in 2020, my review is still the same to this day but some content now is very disrespectful and disturbing. This app is still amazing and I am addicted to it, apart from that I LOVE this app!!	5	0	20.7.5	2021-08-11 09:25:28+00	\N	\N	gp:AOqpTOF-HLltAziSwYReJSQvg55EQ9dh9vAVsGbnS6xM1zOImN4xITOij0esEkb_iRzWLnSE88Hz5KvO23M8FQ	6
953	scott kane	https://play-lh.googleusercontent.com/a-/AOh14GjAN3ntBkz-IuHXF8ZZVzsJvcb4-KdrVV7Ehsm-LA	This app is fantastic way better than Snapchat I've noticed the ads can be skipped if not relevant or not of interest thats massive plus in my opinion. I was hesitant to use this at first but its kept so simple and easy to view the funny videos . I wish I joined earlier because its so easy to use with no fuss keep up the great work! 👍👍	5	69	20.7.5	2021-08-11 11:20:08+00	\N	\N	gp:AOqpTOF_1KEMoEQC9QWT3yCkch0VcW43_jlT8Tlvw08Bk0ztENwsmTgl3B4_QPjCMoiHWz2WIRpf74MJhTHUFg	6
954	nada bou	https://play-lh.googleusercontent.com/a-/AOh14GhELUX8oBDEhDarXqnfn7tl5nzI_3dMV_jkclNaBw	I really like this app but theres 2 problems, first off , there is no dark mode for me , I always turn on dark mode for other media like insta or twitter etc , but since I cant do it in tiktok, it makes me literally go blind especially opening this app after quitting an app that has dark mode , second problem , is that you ban people for no exact reason , maybe you shouldnt get a bot to ban some people because ppl have been getting banned for no reason ,that's all I've got , thanks & bye <3 .	3	0	20.6.4	2021-08-09 20:34:19+00	\N	\N	gp:AOqpTOGMoKp1oQtDP3wQBxNAaQJxpqsVhXqV93WJIbYwVlYW6Npa6OwL9R2enG3skvJ_yBKbFR5Zth4BX0H2SA	6
955	RA A benner	https://play-lh.googleusercontent.com/a-/AOh14GhHv4bCbn4GCL1J_8AewXQOAnjpBGARxsfiHWe0	This app just asowam in 2021 , Pretty good between other media app for shorts clip . It editing system just cool I'm really prefer this editing developer to build a video blog types YouTube. it can look like gorgeous between other , Also the developer need to care about server speed. the server too much slow sometimes.	5	2	20.7.5	2021-08-09 17:44:42+00	\N	\N	gp:AOqpTOGMC7S9bqcwJwW_U8ApQ9qrf7tHA5clwAoir1JvYtozhs71xMhRvrWsuATe6ajIq4w5mH5JkEOurWvbfg	6
956	Peter V	https://play-lh.googleusercontent.com/a-/AOh14Gj_xCdNFecpfVm7x_0hQBVJrPU98DJsb7hQ6XvW0g	Anyone hating on this app clearly does something wrong. It has the biggest "creative creator surplus" among all social media platforms. Like I could browse tiktok all day and still find something that puts a smile on my face or makes me burst out in laugh. On top of that this app is free! There are still features that could be added: f.e. a better way to sort videos other than adding them to my favs.	5	0	20.7.5	2021-08-11 20:35:35+00	\N	\N	gp:AOqpTOHpjS-BHOOP1RjzEFo2_WehK4QNwMl5I--pIHaAqXf05jDsoO-ej75Wu7PTl5t8sRpGzH6xFjIU3Rovew	6
999	Latasha John Louis	https://play-lh.googleusercontent.com/a/AATXAJzjT0_pa96bjGLkCCw3KOS_dTajflfH5T2_CzV9=mo	Love ❤️ this game, it's something like slither and the best part is you can challenge yourself to beat your high score til you are #1 which is where we all want to be	5	1	2.0.0	2021-05-13 03:44:41+00	\N	\N	gp:AOqpTOGcEBOnzQ01XwSqD3Kv6rRv3sDmthVDxkBXL1G-NyWGDBzP1TWEd3eAyg6sMkZcwbaGLd60E00dH6YnvA	4
957	Hannah Reeves	https://play-lh.googleusercontent.com/a-/AOh14Gha2xl7cjcW5llz3qTQitw7Bl94W8Rn08vOYBXrqyA	I don't write reviews for apps, but I love Tik Tok. I don't post anything other than comments, but there is so much raw and authentic content. Some of the trends I don't care for and a lot of it should be age restricted seeing as kids I think from the age 13+ use the app, as well. (Not sure if that's the right age) However, you can easily filter out the types of videos you don't want to see. Great source of entertainment and way to pass time. Even to decompress. In my honest opinion. 🙂	5	1	20.7.5	2021-08-10 17:15:12+00	\N	\N	gp:AOqpTOHxNi6K4T5h-IvirAmGLBDi2eSWkrdLdpqpNFtGPCU1abn2KLs4Z-VpIR80Zv6DUFrXVw1bHARQrfrZlw	6
958	Hotsaucereviews	https://play-lh.googleusercontent.com/a-/AOh14GgQL8DWxEG0JyGgTN1zEpyXe6JyVejG9nHgSxxA	This app was good and I used to watch my fav tiktokers no problem until I got "temporarily" suspended which usually lasts for 6-7 days but its been 3 months and its still suspended, I deleted it and reinstalled but that didn't work and it didn't show me why I got suspended	2	1	20.7.5	2021-08-10 17:48:48+00	\N	\N	gp:AOqpTOHBVKCDqzAqx2dnT1zgGtnO5CE_WMhyjwTMP-rX3FZ6rifmU8o3ZJlVFB2FbXVTHKMR50GvfSyT0U7qMA	6
959	Kaya van Loon	https://play-lh.googleusercontent.com/a/AATXAJz5cLgyGunH-8IOQIXZci2F6z0ybqeBD5bNNSiv=mo	Great app and very entertaining, but the reason I gave it 4 stars is because I sometimes find that the caption is in the way of the video so if there could be something done about that (maybe swipe away everything in the screen like it's already possible in live video's) I would definitely rate the app 5 stars.	4	0	20.6.4	2021-08-10 17:24:09+00	\N	\N	gp:AOqpTOEA5hGVkbhpTo-oZ5efJILN8uf3H8EYIPuUidY1Zvp_U2nbXjWn2kTRP6O2Xar18ojcJes-TVz6N4m-jQ	6
960	Sasha N	https://play-lh.googleusercontent.com/a-/AOh14GhVvSE3B8syDkz_PgvV14wTzGz4NyQhg65rID98lw	This is a great app but there was this new feature that came out around June, where you can save videos into different folders/category. Recently I opened tiktok and all my important videos I saved in different folders were gone. I lost all my favorite edits. Now I had to stroll through my favorites for hours finding back the edits I liked. I really liked the update where you can save videos into different folders because it was easier to find my favorite videos.	3	18	20.6.4	2021-08-09 18:45:45+00	\N	\N	gp:AOqpTOGXTTvtdywn5TDrgqK80p52GBapuF0wxrL2CBJowJ_DuUK5X3YWwsBhKYkjwnUQaN-UbacoajzyedS8mA	6
961	Noah Watts	https://play-lh.googleusercontent.com/a-/AOh14GjqUS4tFsrPzwKI8zd43YdghhvCQhlcFb9beWfqmQ	Love this app so much ! The only thing that I'm having a problem with is that I cant save my tiktoks to pinterest. I would love to organize them and I share to pintrest and then it takes me to pintrest and says its retrieving images from pintrest and it never stops loading and never shows images. I used to be able to do this but cant now. I have updated all apps and gave permissions . I dont know what to.do.	5	2122	20.6.4	2021-08-08 00:57:21+00	Hi, sorry for the inconvenience. Could you please provide the issue details within the TikTok app via the following steps: 1) Go to your profile page 2) Tap on the button on the top right corner 3) Choose "Report a Problem" on the "Privacy and Settings" page. Thanks, TikTok team	2021-08-09 08:49:11+00	gp:AOqpTOFsDEA714coSVPSNVHfx9kCoZ_iu7HZq7XBOtVP7r0Um5-QcnH6DD6fSSV_09m3Jejb1AlD2kJqKqS9Kg	6
962	Ellie	https://play-lh.googleusercontent.com/a-/AOh14GhXxp_j4BCrb9RjRGoz00peu2iTjTdogI1pSxXsNQ	Overall this app is great. Good way to make friends and communicate. There's one thing that I don't like about the app. Reporting an account doesn't really do anything. Me and my friends reported an account that was doing things against the community guidelines and nothing happened to their account. So you have to block them. And that still doesn't help. But when someone or multiple people report a person who has done nothing, they end up getting banned. Please look into this problem.	4	5	20.6.4	2021-08-10 18:51:19+00	\N	\N	gp:AOqpTOEfH0JVBt7io1XE5-4Poz8JaENljelSgu8ldRB5nzM4gDpfQIFxwlDJly0r3Yg-m7C1i19OHN2nnLJnZA	6
963	Paige Pearce	https://play-lh.googleusercontent.com/a-/AOh14GgobFpEjIrdGwrwpbieNNNu0IQ9ZiL7x3MKHKncnA	I like the app but, The updates are super slow, I'm getting a few updates like the fast-forward one, But I still don't even have darkmode! Please release the same updates on iPhone AND Android, It's not exactly fair otherwise lmao	3	0	20.7.5	2021-08-11 12:47:50+00	\N	\N	gp:AOqpTOGmkprSYCj2JTrCJ9kQ_uyDi0QZB-iWBT37SA9bbH9WCl_ss8LOE9KwWqxi5ZijA_55IztYGb4hkYfdYQ	6
964	Sawyer Pack	https://play-lh.googleusercontent.com/a/AATXAJyzgew3Sx4gbRzB5GmDMp5TniKsaF14jmL9KydT=mo	Its very fun but i was at 800k and i just randomly died i wasnt on time mode i had infitite time and bluebackground so i could see everything so i didnt just miss someone. Plus nobody was near me. Pls fix this if you want 5 stars	1	0	2.2.3-a	2021-08-09 17:08:30+00	Thank you for your feedback! We are constantly working on the game, improving it and correcting bugs. Therefore, always install the latest version of the game from the Google Play Store. We hope our game will bring you lots of fun and you will appreciate it at five stars. Have a nice day!	2021-08-10 06:19:12+00	gp:AOqpTOHIwSW-Bqcww51RvP3KK3XODJIHRO5otxA_wLUTVFIhQIHn0SawYd9vraUETV9NPlUiSihmir-uq9b9wQ	4
965	Foysal Hoque	https://play-lh.googleusercontent.com/a/AATXAJxxoP9ympKwjefC1taKobhebbRl-rixwGo2QhZX=mo	This game is vary much enjoyable. But I found too much unnecessary advertising. As a result it bored me.	1	1	2.2.3-a	2021-08-10 19:01:49+00	Hello! Our game is distributed free of charge, and advertising in it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and high assessment of our work.	2021-08-11 05:37:00+00	gp:AOqpTOFbSy42A2b38SbgWVpzwzBBBG_pgIcChwjIbtdPvPJ7etZvG59yKNhRho1kXIyewDkSfWgc3ODNoyF6zQ	4
966	Jamie McFadden	https://play-lh.googleusercontent.com/a/AATXAJy7_LMO5LgqTIJpi-Xu1Hi1lP5Tw-nBgA120Obr=mo	Changed my rating. Today they froze my game. Said to reset time will be down one day. Well this is how I have coped with this pandemic. It makes me happy to play now I am sad.	2	0	2.2.3-a	2021-08-10 22:30:03+00	Hello Jamie McFadden! Thank you for your feedback! Please contact us support@wildspike.com and describe the problem in detail. We will be glad to help you with resolving this issue.	2021-08-11 05:32:10+00	gp:AOqpTOGO-SQcRWUUvYv0tzdQCu7l58gU03RNlMYNtihwVGyGB0bhtoI10ZucK3nZWRjkKoJIaCRbg6Ux8j4T1g	4
967	anureet and jasleen	https://play-lh.googleusercontent.com/a-/AOh14Ghco5qdzcL5azPHLG0dCojn60XC3N6MeCWChOY	It's a good app But some problems are there 1 It takes a lot of time to open 2 The controller moves on the whole screen 3 There should be a pause option to pause the game 4 When the worm gets big it moves very slowly Some good things are 1 It does not have a age limit 2 It's new versions are great 3 It fills less storage space I want to say that please sot out all the problems in this game . I am playing this game with my family members . We are enjoying slot while playing Now it improved	5	1062	2.2.3	2021-08-10 11:24:01+00	Hello anureet and jasleen! Thank you for your feedback! We are constantly improving our game and try to accommodate the wishes of each of our users. Follow the updates of the game. And we hope you will appreciate our game on a five-star rating.	2021-07-19 12:03:31+00	gp:AOqpTOFy2Ns9bmzdNpF4r6dZJzRi1NwUjXWMn-V8wlglgFliJIXkfFDuB5uDOMfZ3TrygUr49a_9D0iAi25KNQ	4
968	Zoyalogy	https://play-lh.googleusercontent.com/a-/AOh14Gh2x_KYNVht2tu9oNz2g0c0o2Rn5LgO6lY6wyc3Aw	Stop playing so many ads after every game. Specifically ludo star ots cheeky and so annoying my kids also play this game.	2	0	2.2.3-a	2021-08-10 01:15:55+00	Hello! Our game is distributed free of charge, and advertising in it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and high assessment of our work.	2021-08-10 05:57:28+00	gp:AOqpTOHEv5XRZOTiTsxERSoofd2Tz_juDdXN_bLe7WGfIg-hynuGZVZ6991lzCpK2eGUrf_I8-nY-D0wByS40w	4
969	Ibrahim Bakri	https://play-lh.googleusercontent.com/a/AATXAJxEBdHR0Pmyc5B5UQbh1N5aPWmanzbbiPS0YtjS=mo	This app is so good but if u want to get famous u have to work hard, and the stories made the app better than any other social media app, and also there is features of how to be famous and u can report a problem if your videos are not going viral, that's why I love this app	5	0	20.7.5	2021-08-11 23:20:03+00	\N	\N	gp:AOqpTOHFho8w3z1PWxqG_bXf0rT7XdxUajVjSA8jCcgM10E_LgzbXkDOS2FxQgAI2s_EMIPjz3Xh9mTYi6wuTw	6
970	hatingthe game hettinger	https://play-lh.googleusercontent.com/a-/AOh14GiaaQMvhtwExxlDji6o0TrIfmh74PWxdoVA_WsWfA	A few things i havent figured out but it would be nice to be able to make longer videos without going live which is restricted to 1k and above followers. Update: very nice app but the rules are unequally applied. That said it's fun and addictive. Give it a go	4	0	20.7.5	2021-08-11 01:15:44+00	\N	\N	gp:AOqpTOG-0buB8lrcQx9PAGD7me4b-ZhMRoKb2qtU9Qbenql-fupgxzEePQPLkbZLKvdCzQzV8T_Moh8HGMColA	6
971	C Earl	https://play-lh.googleusercontent.com/a-/AOh14GiAEaqhswHVP0TRO3PGz1X7tiXJfaI0eoWst_xREA	Good design. Terrible management. Come for the content, burn out & leave from the lack of communication & support from the developers. If you have a problem, they make it difficult to find where you're even supposed to contact. Even then, don't expect a response for months, if at all.	2	0	20.6.4	2021-08-10 19:58:33+00	\N	\N	gp:AOqpTOE7gMU_qhzMH1rbejQOf3Gakvf0Zmq1sgbklkXW8RpsBVcVS88OgK18tT3TbynMm-u-mqxB5GQXyQ0mBQ	6
972	Martha's crafts	https://play-lh.googleusercontent.com/a-/AOh14GjpqzmA8z3EYBLC7uetbVmXY1WxYLfu07-aEoa1	Honestly this app is really good! I feel like the only thing that ruins it is people starting groups to ban people who did nothing wrong (I get some did but for many it was fandoms who where the real problem) but other than that its a really good app! X	5	0	20.7.5	2021-08-10 18:50:47+00	\N	\N	gp:AOqpTOH4VbpHd4P8Hyf5KS0QCL8So-ybty7qow8e_cE4TJa0bpw-cfuJSs722IPoPv1zY3h0aJH0n_-HZgKNNA	6
973	kyle	https://play-lh.googleusercontent.com/a-/AOh14GhHOnk9vNqt2Rm6JKpDnxwJDl15DEV9j_xAcoxD_Q	I watch tik tok everyday and really don't have much that prevents me from giving it 5 stars. I have two huge recommendations that all tik tokkers would agree on. The first being an auto scroll feature so you can watch and scroll (hands free), such as while you eat. The second us a verification to refresh your feed, I've went to show friends a tik tok and accidentally refresh it, only to lose the tik tok forever.	4	0	20.5.3	2021-08-10 01:14:41+00	\N	\N	gp:AOqpTOHCSThIH3qc40G3RmE3F_RMbnjStxRbnA9y5GJXsYzRo6ZLfINZ2CHVxIgJKK1fJF2yr6XhHpOLteURHw	6
974	Tobio Kageyama	https://play-lh.googleusercontent.com/a-/AOh14GjNs211a6ut4eK7JrjGz-gldmA9yKEKDniv2Xs-ww	I absolutely love this app. The only problem is that it won't allow me to send messages to my mutuals or other tik tokers because of "safety reasons". Half of the users on tik tok are teenagers. And there are many other things that can break privacy rules. So why do they not focus more on that problem instead of disabling messages for users under 18? People can just lie about their age it's not that hard.	4	0	20.6.4	2021-08-10 16:37:04+00	\N	\N	gp:AOqpTOGmjZZKPLy5hOifh-w8Je16uRK0XssKs3KlNhUjppOtdW9ECOlPvVdwkQbhHkmNYNgTWyJ6BOw3O-VTaQ	6
975	ferdinand n'cho	https://play-lh.googleusercontent.com/a/AATXAJx2xHbh_Oa5BQYwbGxCc1meGwpRB6EejU8B0sJ2=mo	I love this game so much some time it boring some time it's just a fun game	5	0	2.7.6.7	2021-08-09 17:54:26+00	\N	\N	gp:AOqpTOEBdy3zBTJoQz7Yfk0y8nwUfVN6VnObWSB0mH7o5Fh4Yq-4_qKswpTy62OkLL0ZdIOTX5fEQsrFeP9Vxw	7
990	jeanette valle	https://play-lh.googleusercontent.com/a/AATXAJyrTk-J_WEtIaiXA3sEibKv8VcVB4Fw3LHJYgFa=mo	Very relaxing and additive little game. I have lots of fun playing it	5	16	2.0.0	2021-05-01 23:39:31+00	\N	\N	gp:AOqpTOFSU050R9Lyp_LAVm2WlL28FecVvYmOlxlsshqdfi_A4tOGIyKFWbsA9VbklC5q1t7q3nGkEoHQmUFYxA	4
991	Jay Tyler	https://play-lh.googleusercontent.com/a/AATXAJxMSAbtrEIENPw9KluMaPsqwdIWJ2gDzfNA_w0J=mo	Best worm game there is love tbe super powers and food and snake skins!!!! #1	5	7	1.9.4	2021-04-15 10:36:39+00	\N	\N	gp:AOqpTOFSjOv1dVRW_egU74YXOt7ckqtimTAP6QCe281rrr-FD9nqzIC7jJ9H7HMrqqhp1TdJ5gYDvWfWU9-hKg	4
976	Surie	https://play-lh.googleusercontent.com/a-/AOh14GjOhDAEpcgrnYwptZ-ZkZgumDqQDYYmC5T4PgrY	I like tiktoks concept, bit I have some very big problems with it 1. It silences black voices and activism on all kinds of issues like police brutality and stuff like that 2. It bans people for speaking out against bigotry but it doesn't ban people that are outwardly bigoted 3. It helps gather bigots that could do serious harm, it helps connect them so they could get groups and such Besides that, tiktom is just problematic. Look at popular tiktokers: all conventionally attractive, cis, etc. Alg	1	0	20.7.5	2021-08-11 01:14:33+00	\N	\N	gp:AOqpTOH_ryY8_kl031cOwX2yEpVh5AYJz83dUyxGF3JRe4-GY-SRlc_2_X_tm6ZXakRYJZ1htD6NA_RbEmoiJQ	6
977	Hunter Dent	https://play-lh.googleusercontent.com/a/AATXAJz-5zaUH9sU0-xmjL3ymVWfTTKhIhTplfW-OSLx=mo	This is an amazing app for when u have nothing to do or need to pass up time but the one downside to it that doesn't really bother me is if u scroll to fast u just have to reset the app because it wont let u scroll but otherwise amazing app	5	0	20.7.5	2021-08-10 14:32:01+00	\N	\N	gp:AOqpTOHOPI-LO3lt6NpqI-t6u3ieoBdoAsnF1pxZWZrjlF0v66tJnYoSD1VSvGVRlFus7CTLI0zp_oGWkPs0rw	6
978	Janesa Barrett	https://play-lh.googleusercontent.com/a-/AOh14GjZxhl9_4br60rjjSjcI084ZdVbHKOWyAv13IyH	I LOVEEE that we can make 8 accounts it used 5o be 3 I would keep on logging in and out my account it was getting so annoying until the 8 account update I was SO happy but I lost almost all my accounts but I don't have those problems anymore.	5	1	20.7.5	2021-08-10 00:13:52+00	\N	\N	gp:AOqpTOFnwig4NmRSkpY88GnOxvJeqnUuyf6VdHcijBxUFpM7lLlpoR86bTUdM8vr-NyBmGItUungt80Cg7iylg	6
979	Tstormer	https://play-lh.googleusercontent.com/a-/AOh14GiEtN8duSbVzrOiENKZnhB-9btDXS97ZJn2xf3r3g	Certian features did appeared for me, like pinning a TikTok, The scrolling forward it rewinding feature has disappeared for me. It used to work while editing tiktoks as well and then this week it's gone. It helped speed up the process .	1	1110	20.7.5	2021-08-10 16:54:55+00	\N	\N	gp:AOqpTOHs14uyEmqqclmDitV7yCkvsoJVKZfK3EF5OHxLOZ2_HdkcyrmRXcs_H3ZkM4x9fx-4AAbPAF780bE7NA	6
980	Walter Perkins	https://play-lh.googleusercontent.com/a/AATXAJzv0_ve4gZ2xfplp6nqbOrEzthS2pJ8QF2-lesO=mo	I gave it three stars because it takes a long time when it's sleeping like come on okay can you please get it like to 55 energy for a long time at least so every 50 minutes you just don't have to give them to sleep do you have no entertainment so yes that's why I gave it three stars but I like it	3	60	2.5.2.26	2021-02-27 22:59:52+00	\N	\N	gp:AOqpTOFcRUZN2GJi_tJng4plaiBTseTuLh5LnQe5nJ5c1qMPPPgjchA4EFHAWXuvCnmY0Ba-Cjqwq8gxs43QaQ	7
981	Tara Thompson	https://play-lh.googleusercontent.com/a/AATXAJzDcNUkHRwOnqa88-9iJac-FgXLkjUoMsrAK7Cs=mo	Why give it a 4 is because after updating it a lot it became more stupid but I love how you can Whack Him and I also love that you can go on a trip in our favorite rocket ship zooming through the sky Little Einsteins climb aboard get ready to explore in the sky Little Einsteins one thing I wish was in the south is where if you whacked him enough he could die but then he comes back as a ghost but you can see him but no one else can it would be a funny update but it wouldn't make sense	4	37	2.5.2.26	2021-03-12 01:58:54+00	\N	\N	gp:AOqpTOGN7rM6_BAkxXEOpiZs6Vy1oVQqAJxZqVl53Ll0omDhRPgBnGj9gzcynto771OeJLxJhJ5KEs0XI4WRxw	7
982	Rye	https://play-lh.googleusercontent.com/a-/AOh14GgqPxRxcv9Z6ZFNbclcjgpYNrpqHIadp4v0pKdC	I only downloaded to say this is a cheap copy of sliter.io most if not all of the 5 star reviews are fake and from the devs shill accounts they have made several other games and if you check the 5 star reviews on them you might find the same accounts saying very similar things. Dont give them your download and always check the review section before downloading a game	1	0	\N	2021-07-18 15:16:58+00	Hello Rye! In the world of a lot of games similar to each other, but each game is good in its own way. We hope you will appreciate the game and put the highest rating. Have a nice game.	2021-07-19 07:25:03+00	gp:AOqpTOEYyp9AB_AvHbgSoOXRS30LaheJqP1_z_zb4xsep8yz7N1h8nTGIXS7_8Y073wfUnI1SKOHBS1FW2Ebbg	4
983	Farzana Zaidi	https://play-lh.googleusercontent.com/a/AATXAJwgDKHvSJMtCNOgQD7mMfLu3fxKLo5cwtpgIbrT=mo	It's amazing not many ads witch is amazing I love how you can do it on infinity and play for nonstop for me I hate when I am so large and then I die its makes me mad but I tolerate five star to me	5	0	\N	2021-08-10 18:19:25+00	\N	\N	gp:AOqpTOE-z5zU1IPg5HnUK1Rucas8QNHRFoa165q4GHxFKbdneXVBXJ5CV1qS7Wa5zDJlAS5zjPeB6TIbFm9SIw	4
984	Christoher Lambraia	https://play-lh.googleusercontent.com/a/AATXAJwuL_Db7CQ1_JOukjamKKm3K6iv8nCt7n-6oXN0=mo	The joystick is so delayed and it moves i die by it and i think this game is boring cus the ai's are super hard to beat its bery annoying that the joystick is delayed and that it moves its also annoying that you cant even beat one ai this is a bad game if you update the game and fix all of these i might even play it again.	1	0	\N	2021-06-23 18:32:02+00	Hello! Thank you for your feedback! ⚙️ In the game settings you can change the control to your preference. We hope that this feature will allow you to evaluate our game on five stars.	2021-06-24 06:59:41+00	gp:AOqpTOH-DMtYP4_OQmO4UXZxFSxd13UmqU7FTG9QWljubRnmyS6CfBN5jlMh6jhndKYn5mJn_plR5lP59XP0Cg	4
985	Niko-chan and foxyfamikykid roblox	https://play-lh.googleusercontent.com/a-/AOh14GhIUbVfRJsGUF2Pgf2vE7iQJ9Xdh8rkC014g2iK-A	Gg/good game but in snake.io you can see there is a creepy glitch about those games (Snake.io is better but now in 3:00 there will be a creepy glitch that you couldn't die in a red void there is lots of dead snakes in there) so DON'T DOWNLOAD THAT GAME CALLED SNAKE.IO	1	0	\N	2021-06-08 05:43:18+00	Hello! Thank you for your feedback! Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it.	2021-06-08 06:05:18+00	gp:AOqpTOFCY7R_ZT36GaIpoYSDRkptSFhT9-0Bs3LuFyAdDIi0CmVeONcRKTd1e7NdqLgDEkbcEe1oVIFx5YFCnQ	4
986	Kylee tv	https://play-lh.googleusercontent.com/a-/AOh14GhtpxJik8Lfusu32GTxNOHUZJritNNLNlV82B2Pbw	Good game nice i love it so much I give it a 5 star and 2 more things first it lag me out of the arena and there was a bunch of other worms so I thing the big worms lag them self in here so they don't die and one more thing I love the game but sometimes idk if I want to play it after a long time it iss boring but still play it and love it	5	0	\N	2021-05-03 02:33:02+00	\N	\N	gp:AOqpTOFvF9PUHzlaaJVp9nSQACqgCMWgZ1E671h9L3_6Y9Yv2Q3B511FvAKuh31B22YoR6WKkW2n-W-4jV-L3g	4
987	Steven Shepherd	https://play-lh.googleusercontent.com/a/AATXAJz54IfqdmwO_AnlWatDKSBw1-ViveqiSyqMP5KL=mo	Fun to play and is addicting	5	0	2.2.3-a	2021-08-11 18:20:21+00	\N	\N	gp:AOqpTOGDNaM319aeT-cnA_bbiPhWCASssR50l640KgsE86-7Z0zq71sbRdGhc59DHpavrKPCDn36weRmQRDnVA	4
988	A.D. Oefelein	https://play-lh.googleusercontent.com/a-/AOh14GiFF8gnnSd8nPIHjCdGpYe3lKwC2XTlVPFjyxDcAA	Great game... Great graphics.	5	0	2.2.1	2021-06-17 22:46:03+00	\N	\N	gp:AOqpTOH6sFmrnpJ044IKrCEv4XkpYtNxHuUTowmxPI9C9RrKSrH2XwpXzGrGopPGKFFGd6m7M32gd2G51fEyBQ	4
989	300	https://play-lh.googleusercontent.com/a-/AOh14GjoFJUjbRdKpA8pSLQKEQ9MRy6WRkcmmEtCfqnkxg	Ads are stupid. Game is not coordinated correctly.	1	1	1.9.2	2021-04-04 18:34:29+00	Hello! Thank you for your feedback! Our game is free, but advertising it allows us to improve it and make the most interesting for each of our user. We hope for your understanding and appreciation of our work. 🙏	2021-04-05 07:02:40+00	gp:AOqpTOH8IhnR9Sx4dYRrmq7WMxYpIz8-MyhrjHtWa6Zc_jO4QSbU7GLjp64BvSoTxa0cci8hr5xWXtlMB1upQQ	4
992	Roy rogers	https://play-lh.googleusercontent.com/a/AATXAJwcOFI9I6vujJPppEmp_5CTHa6z6GKEzmpNOr43=mo	Very fun relaxing i play this game all the time	5	0	2.1.2	2021-06-06 14:43:43+00	\N	\N	gp:AOqpTOGZwjNWgCaXSaGG-JYI_uIraN6BPVbPuV321Zonol--Jv6jf18-TU6qOcs_--1-ZG1qTsGh95sLIA0Osg	4
993	Crcc Rosenkranz	https://play-lh.googleusercontent.com/a/AATXAJz9518EncuqwmSyoUQlfZwE30lH0GbpQYN0QCFW=mo	I like the game it's something that I play in my free time :-)	3	0	2.1.2	2021-05-27 23:19:28+00	Hello Crcc Rosenkranz! Thank you for your feedback and your support. We are very pleased that you like our game, and we hope that you will appreciate it 5 stars 😍. Rating will help us make the game better. Have a good day and success in the game!	2021-05-28 06:19:56+00	gp:AOqpTOFUZlrAwVqmkf00KTWqb9mgWXwpubAqq1c2ZY1v0DWhk5e2RIn_CbuYgOPOZkBYjuovKj7uxxqqsrtJDA	4
994	Jay Dubya	https://play-lh.googleusercontent.com/a-/AOh14GieEWLCo2ZXTYeRD7h9r5kpZ_jCMu08A8U65QM72Q	Great game with a low amount of ads.	5	2	1.8.3	2021-03-19 05:38:46+00	\N	\N	gp:AOqpTOGEaR4oZjzOAozE1QCOQXyOEub5JkAPslMsNDe8hEri7PJO6ceSrf1JkfrvsypHnbTBEQ--hJn7jnk1iA	4
995	Magdelane Ramos	https://play-lh.googleusercontent.com/a-/AOh14Gi3_gxSN75cYOy2DzuHFplAW8FqBnUk5Wz3Z7XrIQ	I like playing this game it's awesome being able to run around and eat whatever I want,	4	4	1.9.2	2021-04-07 01:30:04+00	\N	\N	gp:AOqpTOFVUKUd50L6ZqIWntDccnopk6DRC1jImV6YVMc8Lm4DeT1PtbaC2SDxOJigcSJzAJcAd2gBvQH553vApA	4
996	deca F	https://play-lh.googleusercontent.com/a/AATXAJz8hFHaDGCiUvwqDNZv6UPdL1wSA4_Pq4cx7aur=mo	This is not great at all.........ITS AWSOME!!!	5	0	2.2.3-a	2021-08-04 03:06:09+00	\N	\N	gp:AOqpTOGPkdPbURh8kdJFbv4g24OhNT5VE6-OM7SJQN9NadoVeqNyKZOdpXmpO96hQpOPEf7mFfKJXHq5QjEctA	4
997	Chase Dutro	https://play-lh.googleusercontent.com/a/AATXAJz5zcunTmmNiOyADR8e4NXTIEAp2t703QV6CWg0=mo	Game its self is good, the controls suck and its so sensitive	2	0	2.0.0	2021-05-21 04:27:38+00	Hello Chase Dutro! Thank you for your feedback! ⚙️ In the game settings, you can change the control to your preference. We hope that this feature will allow you to evaluate our game five stars.	2021-05-21 07:16:32+00	gp:AOqpTOE85xaRibw9V_wLHsydWpZP7m7uoEk9jvNkqvXTxPSazO1RshzQ4DHK9Z9LXsAl5N-AM1aLxU-q0Nv0_A	4
998	Saul Hernandez	https://play-lh.googleusercontent.com/a/AATXAJxfHdQdXbG7MxEYOg5UF0RULY-iWjXYLDBjG15y=mo	lost all my wardrobe progress (my magnet, multiplier, radar, speed... not happy!	1	2	1.9.4	2021-04-13 15:22:17+00	Hello Saul Hernandez! Thank you for your feedback! Please contact us support@wildspike.com and describe the problem in detail. We are happy to assist you in solving it.	2021-04-14 07:42:38+00	gp:AOqpTOF7Go3QiVm0JGdfvcMZTyhBwfQFEgR-4bmR5dOmuwrU8mEmb7EFSuQAgr_HliXxg_KGel-8ipphhrN2ig	4
\.


--
-- Data for Name: market_marketapk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.market_marketapk (id, apk, title, url, "descriptionHTML", summary, installs, score, ratings, reviews, size, "androidVersionText", developer, developerid, "developerEmail", "developerWebsite", "developerInternalID", genre, icon, screenshots, "contentRating", released, updated, version, date, last_sync) FROM stdin;
3	ru.ozon.app.android	OZON: 15 млн товаров по низким ценам	https://play.google.com/store/apps/details?id=ru.ozon.app.android&hl=en&gl=us	Ozon.ru — крупнейший интернет-магазин в России.<br> <br>На Ozon можно заказать всё, что вам нужно: электронику и бытовую технику, детские товары и детское питание, игры, игрушки, канцтовары, книги, одежду и обувь, товары для дома и сада, антиквариат, продукты питания,  безрецептурные лекарства и даже авиа- и ж/д билеты.<br> <br>Приложение Ozon— это выгодные и удобные покупки в вашем смартфоне, а ещё:<br>- бесконтактная доставка до двери, что удобно и безопасно;<br>- работаем 24/7, поэтому можно делать покупки в любое время;<br>- более 15 000 000 товаров в онлайн-каталоге;<br>- интересные предложения, скидочные купоны, дополнительные скидки, акции и лучшие цены для постоянных покупателей;<br>- доставка по всей России и за рубеж.<br> <br>Любители путешествий пользуются сервисом Ozon Travel для бронирования авиа-и ж/д билетов. С его помощью уже более 4 млн человек забронировали 22 900 000 перелетов. На Ozon Travel вы найдете дешёвые билеты без наценки. Оплачивая билеты Ozon Card, вы получите кешбэк 5%.<br> <br>Ozon Travel — это удобно: используйте единый счет для покупки билетов и товаров в интернет-магазине Ozon. Круглосуточная служба поддержки ответит на любые вопросы в чате, по телефону и по e-mail, поможет вернуть билет, быстро переоформить его и оперативно решить все возникающие вопросы. <br><br>Подписчики Ozon Premium получают в подарок сервисный пакет «Оптимум», включающий информирование об изменениях в рейсе и начале регистрации, а также подарки и скидки от партнеров. Бронируйте билеты на рейсы более 800 авиакомпаний, таких как «Победа» (Pobeda), S7 Airlines (Сибирь, С7), «Аэрофлот» (Aeroflot) и другие чартеры и лоукостеры, с помощью Ozon Travel.<br> <br>Мы постоянно обновляем ассортимент и сохраняем выгодные цены. Делаем подборки популярных товаров, а покупатели оставляют отзывы о покупках.<br>Ежедневно мы сообщаем о выгодных предложениях, актуальных скидках, промокодах и распродажах. Собираем весь ассортимент товаров с лучшей стоимостью в каталог скидок и регулярно запускаем рекламные акции, в которых можно выиграть ценные призы.<br>Выбирайте товары и заказывайте их буквально в один клик или отложите понравившиеся в «Избранное»: приложение сохранит ваш вишлист, и вы сможете вернуться к покупке товаров позже.<br>Делайте заказы, получайте скидки, а Озон привезет все ваши покупки. При заказе в постамат или пункт выдачи заказов через приложение стоимость доставки — 0 рублей.<br>Вы можете ознакомиться с нашим ассортиментом товаров и выгодных предложений прямо сейчас — скачайте приложение Ozon и наслаждайтесь онлайн-шоппингом!	♥ ️ 🛒 Right now: SALE up to 80%, draining balances, gifts and cashbacks for orders	10,000,000+	4.840526	751371	184255	Varies with device	Varies with device	Internet Solutions LLC	6341061843515923110	help@ozon.ru	https://www.ozon.ru/	6341061843515923110	Shopping	https://play-lh.googleusercontent.com/KNl0ZZQxZWkmF9mfSbfyDp0dLxAP09B2IeTJKcVhSrHd-M9SOAD595QnyCZ3pSY_xjg	["https://play-lh.googleusercontent.com/Bg15k0VE_nxC0cpCkif0qOKdppfb01MOGPF7ZwXdGnU8-hMEa9DRKDyj0jicgOQReVM", "https://play-lh.googleusercontent.com/z4Fi_l4LiZ3ZGZxnVsC7j9mPX4x1MMXNwp5obni1oAGgEmXxrJi5jJTQqBrnwnHm5A", "https://play-lh.googleusercontent.com/kEnL_bxNm9w5N5ORga13mvr-m8vqf-HcKVXcxooO1i-sXpfF_6hfOHGm9GNJiOV_gA", "https://play-lh.googleusercontent.com/ShpdowZL5IvMDQ_19FcMilMQ4apqAbVi7FuO14pMrlgCt6XHBJFqpQqDp6GfL6mPw-o", "https://play-lh.googleusercontent.com/uZrW9zD-TKsk98eLvtnUKnMAhvaqd68DDqNhZzhYUr4CysXo5_e7-5jgUUbakEb0Dddo", "https://play-lh.googleusercontent.com/NNaF6pf0axw5NkcB96azQVQODKwtSc9d9oUc09dKmn5et6Fl71FYrBRJdm2RVMZtSxg", "https://play-lh.googleusercontent.com/wgRDWBuH8gmwyPNtDW9bS5ZToVccFnUtwS9yJQzV0tbemvSRvBzqnjL33JjkCuDidlQ", "https://play-lh.googleusercontent.com/fulj1Lre24g_fUdRGh_D42Z2U8H8ZNBoEC9-00hXQTBeWdDjoU98LwOYutVCDXbunQ4"]	Mature 17+	Dec 28, 2011	1628683027	Varies with device	2021-08-11 16:01:14.734168+00	2021-08-13 10:17:30.328612+00
5	com.imayi.dinosaurdiggerfree	Dinosaur Digger - Truck simulator games for kids	https://play.google.com/store/apps/details?id=com.imayi.dinosaurdiggerfree&hl=en&gl=us	Explore 4 different islands, digging and collecting ores with your excavator. Download the game and start your new adventure!<br><br>“Dinosaur Digger” lets children pretend to be an Allosaurus. With children’s creativity, assembling a unique excavator is loads of fun. The game is simple and friendly. Collect different ores and explore an interesting unknown world!<br><br>Features:<br>&gt; Explore 4 Jurassic Islands<br>&gt; More than 30 fun animations to discover<br>&gt; Great for toddlers and preschoolers, ages 2-5<br>&gt; No third-party advertising<br><br>About Yateland<br>Yateland crafts apps with educational values that inspire preschoolers across the globe to learn through play! With each app we make for your children to enjoy, we are guided by our motto: &quot;Apps children love and parents trust.&quot;	It's a digging frenzy! Design a digger; collect ores; explore an unknown world!	1,000,000+	4.0839844	5046	838	40M	4.1 and up	Yateland - Learning Games For Kids	8163851848922388381	cs@yateland.com	http://yateland.com	8163851848922388381	Action	https://play-lh.googleusercontent.com/zbMG24DgLwAwf1y52WXoOT0ETl1o0RKLepbhD4evBvgqB3ux8rineaCITBjmifWCCceP	["https://play-lh.googleusercontent.com/ErEFueWh6tBRVBdJryzaWRQOm2o6rY_xHMAt9Dos6RhO24o5xIfj8wN1apcEobOUQLc", "https://play-lh.googleusercontent.com/lUKu5LQ6mbAlTCIZOAsUDJ0xOy9lRhnesmbORd2nMLXYN6VIhKdVk2RUwJgP2Ze91OkT", "https://play-lh.googleusercontent.com/8cr9aJfpE4bgK57mB3pXtSgdVAUZIiRYAgW5xvdXbVm4ox6iMufAmRpmZjH-ZR41sRg", "https://play-lh.googleusercontent.com/1cDRItU0oEOzxAAoidWF9H83bg99hky58YtX8z9XNqp1HtQCO4fl3X4vxIasPmUA6f8", "https://play-lh.googleusercontent.com/WU_p8FtYcJ3rimTlqIlDCA_UZlDu91-htT-HaQ21jfi1jbJ4zs9nJLY2ZU3JFE0Dfw", "https://play-lh.googleusercontent.com/N5gJt82SZI6tKSrNf8pmpXhUvssu9U6BJp71oxlu-xsj7SkZXzToFn9rvTih0XAg3D0", "https://play-lh.googleusercontent.com/eWh-MlU-a_xCqMkA9kuuUreqVuqxIXHQP9WZtJfDi79wgDhtkV6FurZR2OcfaqpFELw", "https://play-lh.googleusercontent.com/90SLMNWhQ69a2EBIGwMQvty_ORyAVAm8LUYWclVfikn6T_ri6KdeUlAQrjkC0KMe2D81", "https://play-lh.googleusercontent.com/PytrA-v6Q6vCOK-sOSoON_taTs7Asyoz0I6BFI1QavYbdrccMt9lZW4RDMUiPilCjh3-", "https://play-lh.googleusercontent.com/nYpoRNr5VyVKYPN87dokvicjZcojyBjTOzThkcni284-pwhXje2q1PtTvTvs73j19FRJ", "https://play-lh.googleusercontent.com/2qkQUatopyCfXGZHGOqnKKqW-KSbB2UPjkUTVzLSq8b1u8XW2q1cfV2lRuioZJ5est-d", "https://play-lh.googleusercontent.com/QtToN2kLx63hGFuS8EVIr3UTrGMekinZpRIyuA1nqMA20Fp7W5RZYov5XIGU6Z62rW4T", "https://play-lh.googleusercontent.com/91S7xoPA4U9oNMxq5VH2VQoJHAqChKa0qQE3-AAnN1TtvW1b14bL9CXLhQOzUFQdMQ", "https://play-lh.googleusercontent.com/BOhBbFupXWze50WlI74V_RVHT6J4WQB3Ee2COcbRFQydqNi8mB_EfRxM42ccs_v4mIPc", "https://play-lh.googleusercontent.com/rhyU97ytJzeHjYmHNoic9vuSn4SpDiS-YftvM6X1DktK5SxY-UhB6c5_3OfjWR8_srru"]	Everyone	Sep 6, 2016	1619938040	1.1.8	2021-08-11 16:01:47.519955+00	2021-08-13 10:17:30.297859+00
4	com.wildspike.wormszone	Worms Zone .io - Voracious Snake	https://play.google.com/store/apps/details?id=com.wildspike.wormszone&hl=en&gl=us	You love games with tons of real fun and dynamic action? Then welcome to the Worms Zone.io, an awesome arcade, where you can become the great champion of the arena! Collect yummies and different powerups, defeat enemies, and become the biggest worm of them all! <br><br>You think it&#39;s hard? Relax, the rules are simple - explore the arena, collect all the food you see, and grow your worms as big as you can imagine - there are no limits! <br><br>Stand out from the other players, choose a skin from the wardrobe, or create your own unique style. The further you go, the more skins you unlock. <br><br>Worms Zone is also a PVP action game! Watch out for other players and try not to bump into them, otherwise you’ll have to start from scratch. However, if you manage to sneak and encircle them, you’ll get more points and all the food they had. It is so yummy! <br><br>There are several tactics for becoming a champion: “fighter”, “trickster” or “builder”. Which one will you be?  <br>Worms Zone also has unique graphics! We keep it minimalistic and simple and you&#39;ll love it! <br><br>We are happy when our players are happy, so if you have any thoughts, complaints, or cool ideas - feel free to share them and contact us at support@wildspike.com. <br>Join our community! Follow our official Facebook page to get all the latest news and updates: https://www.facebook.com/wormszone/ <br>Start growing your worm now! Slither into this crazy arcade and enjoy!	A fun, dynamic game with cool graphics! Get growing your worm right now!	100,000,000+	4.29582	2236197	1063751	70M	5.1 and up	CASUAL AZUR GAMES	8232174611457920989	support@wildspike.com	https://aigames.ae/	8232174611457920989	Action	https://play-lh.googleusercontent.com/CAzbHXAoHmFdalAgHDCya19XrpdWtYeATxh2fKQSQcZun3V-2NSs7DJZ1gm5ndxGfg	["https://play-lh.googleusercontent.com/jasa5vn0WPD59PlvkZehQ89rgQxnfP7hJR8okULgUfEX7ZlUn93mzYHrO-DBCwOCLUr3", "https://play-lh.googleusercontent.com/Bc-owMi44houhxRbr-caoKR6BKBrMUFze5tJkTTUGQqvZDYCinEBScE0oBOYGFJutww", "https://play-lh.googleusercontent.com/i8V8lKanShs3uq8jPKZZXCxPQ9DlnQCjhSgq6ZUZ8XCekX1w-w5dyZLdDRqI_htZmTw", "https://play-lh.googleusercontent.com/OzaesYCm2JY5AiwTDDxFXazLAKbUe4dw2y3M_4hObCpiYFGTj0CapPzSELQWyZtQRB9n", "https://play-lh.googleusercontent.com/bH7bSy75l4l0So8vpsi4t9r3b0JbLVHfJTvxZrHRoKDpFrjoKBaF41j73wn-Uuzp4w", "https://play-lh.googleusercontent.com/rGJizIpu6LnAyHZO4BBt_ZfqhKA6r57Ijr8ejJwJh8tt-snvUtn0WxDoRmqvnWzTaLI", "https://play-lh.googleusercontent.com/ro00f5I9dP_us6_XQgBr9PgEY92xpjxkklXGk5b7nDUU_EpV6shw0mloOZfz3fB4Qg", "https://play-lh.googleusercontent.com/o29wm5t1OKp53zrxxbaqpKRHaNtctuOT4z5aZkvQaoqypFTQH27inZ19AJ15gafqhlG_", "https://play-lh.googleusercontent.com/6yrVghYP_fbWg24n3A79l9VmUgM1cuwnJtQMCTY-kvIsvu9-e9YFARXLUFYoFAtGmkU", "https://play-lh.googleusercontent.com/cU0GIw8LipTheP_kRbYMF-IVt95zLw2iPSLicaozenkhmbY7iyXxBY0xCg4sb53btXo", "https://play-lh.googleusercontent.com/HFhtA0QrA-oPsw25cGtPyxQO1Qd59_zE8PaNZRPiNgAyfpODHaVEWLLZnw1HVxJI6ZtD", "https://play-lh.googleusercontent.com/CMFjm8wsKTrNvILifFM6iqYClFtbiEX40FCnFl0YlI9iyAaviMjKF7_9E-vEASmQIQ", "https://play-lh.googleusercontent.com/_Zx9_12da7G4BSKIgJ7mWGQT1uodmcAGuQxQPAH6Pmr2Y7lUmvgq_gWW2HqONOdFZsE", "https://play-lh.googleusercontent.com/YbN6IHxF4bW6IuxpexrQ321zD_VfGSSs48mlFngokd8KHGZBEOQA1vQlmG4WHxte5zgN", "https://play-lh.googleusercontent.com/ca6Q5iIsF6TWIDfrWC-k4c7Pr5W8TzHZa1DADhaALjSUNArQubLhnrvG_ty0q9TL32Rg"]	Everyone	Apr 2, 2018	1626278782	2.2.3-a	2021-08-11 16:01:29.637767+00	2021-08-13 10:17:30.471374+00
2	com.imbaapp.vpn	Imba VPN	https://play.google.com/store/apps/details?id=com.imbaapp.vpn&hl=en&gl=us	Imba VPN is the application for the private and safe Internet access.<br>It’s easy to use VPN app and it doesn’t need any configuration. You just need to download app, change your location and start surfing the Internet.<br><br>It provides you a better internet on all Android devices to unlock websites, to protect your privacy and to prevent Ad Networks from gathering your personal information.<br><br>How it works?!<br>Imba VPN client connects to the 3d party servers that encrypt your Internet connection and make it private so that you don’t go naked in the open. It is more secure than a typical proxy, especially when you connect free public Wi-Fi.<br><br>What are the benefits of using Imba VPN?<br>- Security!<br>- Anonymity<br>- Bypass internet filters<br>- Change your IP and the server location<br>Our application is absolutely free for now, it has no speed limits and no Ads. Install it right now and leave us a comment about Imba VPN!	Download VPN service for Android	10,000+	3.99	105	39	13M	5.1 and up	Nata Kuva	Nata+Kuva	kuvanataly@gmail.com	https://imbavpn.xyz	4688593382082302548	Tools	https://play-lh.googleusercontent.com/zl5Tg_CdcP7Ewt7GzUsniIJm5kd4X0XW4TFJfidNWHKxYNlAoHZSNKAJCNqAdaLpSozr	["https://play-lh.googleusercontent.com/B5U6UrOBbDloGTlT4YPT0xxPm6f5a9W6FQZc6Xs_Du2E6jJ6gQWKOVnUpV2U28SwHA", "https://play-lh.googleusercontent.com/xN8SWsvhBWLFNig_UO5kOt_fnajmWQAd80zJBZ_QAFwvg8jreGtAVKJSDFHVFDnwmtMN", "https://play-lh.googleusercontent.com/QMHn0eN73qWashxtPdyPWiNhm3EnS0szK-ZcrBCEaggqyNhunhgeJ0WnQhEFCGbDEEo", "https://play-lh.googleusercontent.com/TBbTmvKFl2Kcj9pIlQAF4UHhvrhGIXuCv9OIipcGp7Cg6Y2KYuaIyceAovsdQRgki2Q", "https://play-lh.googleusercontent.com/8oHW9IjhPY1dRLLNUnk8f_RIjV0NorKGI-adDQwbM0IwPSsHSoWOJv8mjy3ZLVyK8Sk", "https://play-lh.googleusercontent.com/B-a3mM5StXxRyEyx0kEJLY5X9K8mSF7H0jTLkoqV6Z66xZotard7OqAWBZ4sLYGx6unV", "https://play-lh.googleusercontent.com/SvMAv3-ib78EuL2HIUTWOipPoBorxfqZwgM_uva_bUnOhTOm3fh54fcpEW1WVXz9Ul_Z", "https://play-lh.googleusercontent.com/Zl93h25dKUBtfHFRqf2B578S5CLv1vKfrsTYGW9bRSNpMnaIlF-r1vhU3EBc0llu4A", "https://play-lh.googleusercontent.com/zsNtGuwN70Xu4fQslZ1MUTeDgDURokkYoTTXOQr9onA5UZz0SXo7bsr3A7UzUjoVJg", "https://play-lh.googleusercontent.com/X5y4InSFVy4zuUA74snibHBdHhSdcFS-mPj3Fr_YDVxQts1LE0L6UtvzUdOJ2dlY2uk", "https://play-lh.googleusercontent.com/9iLQ9DEUrPc5SCIGs8zB_0hLShZlI1XiznuAYRhmXT95LxcAqQbv_GBlWMrVKIkN", "https://play-lh.googleusercontent.com/Aoaqz8w7aLyVl5Cs4y0yIegkPWhugRZC6NKq93l3UnPI3C9QMwNBxgFpEM2a3wbfADg"]	Everyone	Mar 19, 2021	1627999044	2021-03-08	2021-08-11 14:29:05.789515+00	2021-08-13 10:17:30.636056+00
6	com.zhiliaoapp.musically	TikTok	https://play.google.com/store/apps/details?id=com.zhiliaoapp.musically&hl=en&gl=us	TikTok is THE destination for mobile videos. On TikTok, short-form videos are exciting, spontaneous, and genuine. Whether you’re a sports fanatic, a pet enthusiast, or just looking for a laugh, there’s something for everyone on TikTok. All you have to do is watch, engage with what you like, skip what you don’t, and you’ll find an endless stream of short videos that feel personalized just for you. From your morning coffee to your afternoon errands, TikTok has the videos that are guaranteed to make your day.<br><br>We make it easy for you to discover and create your own original videos by providing easy-to-use tools to view and capture your daily moments. Take your videos to the next level with special effects, filters, music, and more. <br><br>■ Watch endless amount of videos customized specifically for you<br>A personalized video feed based on what you watch, like, and share. TikTok offers you real, interesting, and fun videos that will make your day.<br> <br>■ Explore videos, just one scroll away<br>Watch all types of videos, from Comedy, Gaming, DIY, Food, Sports, Memes, and Pets, to Oddly Satisfying, ASMR, and everything in between.<br> <br>■ Pause recording multiple times in one video<br>Pause and resume your video with just a tap. Shoot as many times as you need.<br> <br>■ Be entertained and inspired by a global community of creators<br>Millions of creators are on TikTok showcasing their incredible skills and everyday life. Let yourself be inspired.<br><br>■ Add your favorite music or sound to your videos for free<br>Easily edit your videos with millions of free music clips and sounds. We curate music and sound playlists for you with the hottest tracks in every genre, including Hip Hop, Edm, Pop, Rock, Rap, and Country, and the most viral original sounds.<br><br>■ Express yourself with creative effects<br>Unlock tons of filters, effects, and AR objects to take your videos to the next level.<br><br>■ Edit your own videos <br>Our integrated editing tools allow you to easily trim, cut, merge and duplicate video clips without leaving the app.<br><br>* Any feedback? Contact us at https://www.tiktok.com/legal/report/feedback or tweet us @tiktok_us	Discover what you love - watch videos, music & live streams personalized for you	1,000,000,000+	4.420942	39071727	17189207	88M	4.4 and up	TikTok Pte. Ltd.	TikTok+Pte.+Ltd.	feedback@tiktok.com	https://www.tiktok.com/	8354621850408287155	Social	https://play-lh.googleusercontent.com/z5nin1RdQ4UZhv6fa1FNG7VE33imGqPgC4kKZIUjgf_up7E-Pj3AaojlMPwNNXaeGA	["https://play-lh.googleusercontent.com/BYAEhELdWKmO9pt6x4cvvGuKICm9AdgUKoO3UurtG7wFCXwPYGZSJPwA0N-wAgsEE30", "https://play-lh.googleusercontent.com/eJRcpLl6mxZpq2VK0MjIwiSSv0fnVjgVtC_p2Z0pzgykn40oMG-RX3J8JdRLYGHHrQ", "https://play-lh.googleusercontent.com/YEEKwqUJXp0V9mqjsI2gKczCwqX-wsG76aHEuEw_QzQ7CW-5i8pZRD6SJWOzkjVOuiQ", "https://play-lh.googleusercontent.com/9mbtr05F_AD7KIK7tLZbK0Q9hZrtoXZExPMUnLCP7_7rlgf7TB_cGMJUulxvQSe8TA", "https://play-lh.googleusercontent.com/zmVdPFhmhQz0ggWLEJGQ5ow1kPbRQY1oLOomITocXHf7Nt2FnSG1m06wVq7o_wQM1Mo"]	Teen	Jul 9, 2015	1628790583	20.7.5	2021-08-11 16:02:20.810748+00	2021-08-13 10:17:30.683608+00
7	com.outfit7.mytalkingtom2	My Talking Tom 2	https://play.google.com/store/apps/details?id=com.outfit7.mytalkingtom2&hl=en&gl=us	From the creators of My Talking Tom comes a new global hit game, My Talking Tom 2!<br>In this awesome free game, the famous pet cat Tom is going on an amazing life adventure! <br><br>THE COOLEST CAT ON THE BLOCK: Talking Tom is funnier and more lively than ever before! He reacts to everything players do and there are new surprises every day!<br><br>EVERYDAY FUN: Players can feed Tom when he’s hungry, wash him when he’s dirty, put him to bed when he’s tired, and take him to the toilet when he’s… really got to go! They can watch him grow into a big happy cat!<br><br>NEW MINI GAMES: There are brand new mini games to play, including puzzle games, action games, and Tom’s first-ever multiplayer mini game!<br><br>EXPLORING NEW WORLDS: Tom’s plane can be used to discover exciting new worlds. Players can go flying and bring back amazing treasures and use them to dress Tom up or decorate his house.<br><br>TOM’S PETS: Yes, Tom has a pet too, and there are four more pets to discover! Each one has its own look and personality. Players can try feeding them to see what happens!<br><br>PLAY FOR FREE!<br><br>My Talking Tom 2 offers users exclusive monthly subscriptions, allowing access to exclusive additional gameplay features, as optional in-app purchases.<br><br>VIP Pack (VIP monthly subscription) - which offers daily packages (750 flight tokens, 2 soaps, 3 foods), an option to resume playing 4x per mini-game and unlimited energy for playing mini-games – is priced at 9.99 per month, with the first-month payment discounted -50% ($4.99).<br><br>Payment will be charged to your Google Play account at the confirmation of purchase. The subscription automatically renews every month unless it is canceled any time before the end of the current subscription period. When you cancel your subscription, the cancellation will apply from the next subscription period onwards. You can manage and cancel your subscriptions by going to your Google Play Account settings after purchase. Please note that deleting the app does not result in cancellation of your subscription.<br><br>This app contains:<br>- Promotion of Outfit7&#39;s products and advertising;<br>- Links that direct customers to Outfit7’s websites and other apps;<br>- Personalization of content to encourage users to play the app again;<br>- YouTube integration to allow users to watch videos of Outfit7&#39;s animated characters;<br>- The option to make in-app purchases;<br>- Items to purchase (available in different prices) using virtual currency, depending on the player’s progress;<br>- Alternative options to access all functionalities of the app without making any in-app purchases using real money.<br><br>Please note, we do not process all the data disclosed on the label for users under the age of digital consent. For more information, please check our Privacy Policy.<br><br>Terms of use: http://outfit7.com/eula/<br>EEA privacy policy: https://outfit7.com/privacy/eea/<br>US privacy policy: https://outfit7.com/privacy/<br>Rest of the world privacy policy: https://outfit7.com/privacy/<br>Customer support: support@outfit7.com	Your favorite virtual pet is back! Play Tom’s new game and have the best fun!	100,000,000+	4.25891	3815333	1787235	129M	5.0 and up	Outfit7 Limited	5630538819012062144	support@outfit7.com	http://outfit7.com/contact/android/	5630538819012062144	Casual	https://play-lh.googleusercontent.com/xOgV-lsJ0C3367TI_ECmWk0Xg27IYRM_srFNe-WC1fYUnzgLIm8Ysz3igpLRkT1M2tI	["https://play-lh.googleusercontent.com/IvS7nSyg3TVPy0qECgfn4ZFJIZhOJ6wxJiK6niY5JP9YcCIOmXa9ehVMEighCzUf5g", "https://play-lh.googleusercontent.com/NX4eABFuZAYd9dGI420z03HRAPwhWmMgrothW6976yeY_xfCBqryPJzV_C3z4DFbrDk", "https://play-lh.googleusercontent.com/jc0_iztID7HcJdJYRTZfLqf_P5WSbRCs_ud-WgLUh8ZDi8FFgi6_dFHlX1bGs5N4Cw", "https://play-lh.googleusercontent.com/zd-i-r1Cb9ItNwG14Kks9PGfRgmvCNiK0anA9Lxfi66ZIAe3NApg9YWqPDEjS-leNHE", "https://play-lh.googleusercontent.com/yRRvovqvETYJKN6f7hli0moL2AmztgQWNcXm2ajwQXDXzoi9Bw84jyL6IHC5Kyovo7A", "https://play-lh.googleusercontent.com/_iIZejfgt4ZOfdWWmvm_FuckJnXx0T4QJH6RKdfD87-EqV9zY01YDsGALiZhu-DWCoY9", "https://play-lh.googleusercontent.com/vWHtaLwmq9t3YyxhBWyRosM8XZN4liRESNe3araiqvmMdpyhlpgcMzHc1dM1AlAoEqXU", "https://play-lh.googleusercontent.com/X9WJKK5uxoeQGLdri1xiW7WYNb8YFJwcJTzPGa9RXgTp0v1_Ll9oAWQwRoY2izgBFDg", "https://play-lh.googleusercontent.com/q_5pwEO6vuJ3Wbc_OKw6IoFGdVUmMGXi1j8q4QgA_MVVJBAV7lHwsN2FeVhR8MBfkg", "https://play-lh.googleusercontent.com/GDEsMgcdnPuxGUqn-nygYpWc9LhB9nR3_okhHRwuU3uAlyyAKM29UJfSyS-IsnFnui_i", "https://play-lh.googleusercontent.com/nYGzkr1Srdn89g3Z9F6qOsLX29Ta5Qj_g7pAZitgkGEc_nS3m4q1teqZ3ddC1zhgbAE", "https://play-lh.googleusercontent.com/8QmPlFdjfIQhLmhIbpKzRTg-H9JD1gdwo0TrkR03nhOqKH2q9dRg856kBtTZ2oT69EUN", "https://play-lh.googleusercontent.com/AwB8UlEWpVsWM1-LPCCAHIt-MUuTs1QzKwVno701HRg_Kz8OjbZPlEbAg2MnLoSz5Oc", "https://play-lh.googleusercontent.com/Ml8TQIkvxAZyDbD8m7aZR1PE5k-AiTLw2WPkFVE5KOWdVMFEraKm_3yKh0H7s0AdS4zQ", "https://play-lh.googleusercontent.com/ApEKdUoypzU5YHmjBw4xesQJAVYoIzDgAR9TKFXgV_NUelEMPevj-eElJ-2Ea-o0AmQ", "https://play-lh.googleusercontent.com/psm-W4Rli5ikzpNUgc_-btgxgtEhSzdWqCWEaTv__jHsrr6Qs-KL2My12KDroHtUSnk", "https://play-lh.googleusercontent.com/NB-2mNtgY9WiqjKZTmbbMV8F12EwB6mIVw4fyghWUls8CNCdAO1fBOyRSHfKYrcYGVI", "https://play-lh.googleusercontent.com/Ysa7EBJ4tpOvhAT8mLxFwqxma7On3tXdgf8QbV9D_8npeZ0Z5q1eWVYBi1-1h0uDc6g", "https://play-lh.googleusercontent.com/ozDepcf59_hz0Zh4Kw-ggNJksCXH-qaBeMwac1p8oNTuk8YG0jZ0ZA25ADTK24BxEMs", "https://play-lh.googleusercontent.com/DJKeX9JxJ3V2yrHbawYzkBVq4cZCUUt2w9plWpt9kgnPcPLUQJSJn2PUe4IfgjZkzN0", "https://play-lh.googleusercontent.com/GtxcM5kYD3-oo9TQaDRBy9jBCfuhx4-8qrCKyMTUFORNiIZ8Tu_FflbRkzyFf4q1Qew", "https://play-lh.googleusercontent.com/M4uOEQAw_fqG9Yg_DvmTTI6cfft4Xmr0ToS1ud5UtKwEfjWSfhBXkszbpIVoNNVcTwg", "https://play-lh.googleusercontent.com/OjpLqsThNPFzX_QUosWlCAO5qSgEJOWC_s-tp5nh9HBwqlY-GyPcs3tQqENl-EEwOoY", "https://play-lh.googleusercontent.com/6vgs2GC_0uVnGPe2QBmU2TEFJJ5O3y_L8gpFECHAqsjg2HeyuL6euqebS31K-50ug4To"]	Everyone	Nov 6, 2018	1627988998	2.7.6.7	2021-08-11 16:03:47.861482+00	2021-08-13 10:17:30.827233+00
1	app.intra	Intra	https://play.google.com/store/apps/details?id=app.intra&hl=en&gl=us	Intra is faster than a VPN: it protects you from DNS manipulation, a type of cyber attack used to block access to news sites, social media platforms, and messaging apps. Intra also helps protect you against some phishing and malware attacks. It’s easy for anyone to use — just download the app and get started in a few seconds. You can leave it on and forget about it.<br><br>While Intra protects you against DNS manipulation, there are other, more complicated blocking techniques and attacks that Intra doesn&#39;t protect against.<br> <br>Learn more at <a href="https://getintra.org">getintra.org</a>.<br><br><b>Features</b><br> • Free access to websites and apps blocked by DNS manipulation<br> • No limits on data usage and it won’t slow down your internet connection<br> • Open source<br> • Keep your information private - Intra doesn’t track the apps you use or websites you visit<br> • Customize your DNS server provider — use your own or pick from popular providers	A safer path to a more open internet	5,000,000+	4.098535	52477	25691	5.9M	4.1 and up	Jigsaw Operations LLC	Jigsaw+Operations+LLC	support@getintra.org	https://getintra.org/	7366879285778726952	Tools	https://play-lh.googleusercontent.com/gqlOt_3Zjyci-DS2m2DyT2O3h7ZoLX8Zho7Ek_vgnCTYiFb3BRUS_vyCY9Q3MqfbQQ	["https://play-lh.googleusercontent.com/ZUXBRzIgUx2f1wPsc9ZWXnmepuHNTjDVhRKSEi71afi2ZwRuDAKJ-5VEP_WYY1zgRg", "https://play-lh.googleusercontent.com/B3Ha3wGkrRmK5Dvlo2i6Zrw438UIfmmNiTQ8kRhY80yUUinwUdENmmvuL_e-nyYpat8", "https://play-lh.googleusercontent.com/_Mz6ETggOTvVqhJMybQu5BuN6WQnLx2o9AOHbVvpci4xUo3tQzLEsGfKsk3lG1PzJ7w", "https://play-lh.googleusercontent.com/eurjolRwmfyx3xBytUJ8LcJzgOaFBZpBHcoyuDJEvJ2kYP5JVPEdR5bXKbfqegizwhXk", "https://play-lh.googleusercontent.com/OlaHCe8x2tE9d3qNkYYR63-EcLaDUFpjCB23H27fdT9vUdc3-_ABDYqC76u6hiF_WHA"]	Everyone	Oct 2, 2018	1619458721	1.3.4	2021-08-11 14:27:30.756167+00	2021-08-13 10:17:30.976917+00
\.


--
-- Name: auditlog_logentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditlog_logentry_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: dashboard_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_domains_id_seq', 2, true);


--
-- Name: dashboard_ftp_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_ftp_credential_id_seq', 1, false);


--
-- Name: dashboard_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_project_id_seq', 1, true);


--
-- Name: dashboard_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_source_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, true);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, true);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 2, true);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 57, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: market_apkreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.market_apkreview_id_seq', 1000, true);


--
-- Name: market_marketapk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.market_marketapk_id_seq', 7, true);


--
-- Name: auditlog_logentry auditlog_logentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog_logentry
    ADD CONSTRAINT auditlog_logentry_pkey PRIMARY KEY (id);


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
-- Name: dashboard_domains dashboard_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_domains
    ADD CONSTRAINT dashboard_domains_pkey PRIMARY KEY (id);


--
-- Name: dashboard_ftp_credential dashboard_ftp_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_ftp_credential
    ADD CONSTRAINT dashboard_ftp_credential_pkey PRIMARY KEY (id);


--
-- Name: dashboard_ftp_credential dashboard_ftp_credential_project_id_b8058f10_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_ftp_credential
    ADD CONSTRAINT dashboard_ftp_credential_project_id_b8058f10_uniq UNIQUE (project_id);


--
-- Name: dashboard_project dashboard_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_project
    ADD CONSTRAINT dashboard_project_pkey PRIMARY KEY (id);


--
-- Name: dashboard_source dashboard_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_source
    ADD CONSTRAINT dashboard_source_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


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
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: market_apkreview market_apkreview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_apkreview
    ADD CONSTRAINT market_apkreview_pkey PRIMARY KEY (id);


--
-- Name: market_marketapk market_marketapk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_marketapk
    ADD CONSTRAINT market_marketapk_pkey PRIMARY KEY (id);


--
-- Name: auditlog_logentry_actor_id_959271d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auditlog_logentry_actor_id_959271d2 ON public.auditlog_logentry USING btree (actor_id);


--
-- Name: auditlog_logentry_content_type_id_75830218; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auditlog_logentry_content_type_id_75830218 ON public.auditlog_logentry USING btree (content_type_id);


--
-- Name: auditlog_logentry_object_id_09c2eee8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auditlog_logentry_object_id_09c2eee8 ON public.auditlog_logentry USING btree (object_id);


--
-- Name: auditlog_logentry_object_pk_6e3219c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auditlog_logentry_object_pk_6e3219c0 ON public.auditlog_logentry USING btree (object_pk);


--
-- Name: auditlog_logentry_object_pk_6e3219c0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auditlog_logentry_object_pk_6e3219c0_like ON public.auditlog_logentry USING btree (object_pk varchar_pattern_ops);


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
-- Name: dashboard_domains_project_id_c525756b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_domains_project_id_c525756b ON public.dashboard_domains USING btree (project_id);


--
-- Name: dashboard_domains_source_id_bc9d141b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_domains_source_id_bc9d141b ON public.dashboard_domains USING btree (source_id);


--
-- Name: dashboard_domains_user_rec_id_c5f30663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_domains_user_rec_id_c5f30663 ON public.dashboard_domains USING btree (user_rec_id);


--
-- Name: dashboard_source_project_id_61ccfb58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dashboard_source_project_id_61ccfb58 ON public.dashboard_source USING btree (project_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: market_apkreview_apk_id_d6522433; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX market_apkreview_apk_id_d6522433 ON public.market_apkreview USING btree (apk_id);


--
-- Name: auditlog_logentry auditlog_logentry_actor_id_959271d2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog_logentry
    ADD CONSTRAINT auditlog_logentry_actor_id_959271d2_fk_auth_user_id FOREIGN KEY (actor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auditlog_logentry auditlog_logentry_content_type_id_75830218_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditlog_logentry
    ADD CONSTRAINT auditlog_logentry_content_type_id_75830218_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dashboard_domains dashboard_domains_project_id_c525756b_fk_dashboard_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_domains
    ADD CONSTRAINT dashboard_domains_project_id_c525756b_fk_dashboard_project_id FOREIGN KEY (project_id) REFERENCES public.dashboard_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dashboard_domains dashboard_domains_source_id_bc9d141b_fk_dashboard_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_domains
    ADD CONSTRAINT dashboard_domains_source_id_bc9d141b_fk_dashboard_source_id FOREIGN KEY (source_id) REFERENCES public.dashboard_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dashboard_domains dashboard_domains_user_rec_id_c5f30663_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_domains
    ADD CONSTRAINT dashboard_domains_user_rec_id_c5f30663_fk_auth_user_id FOREIGN KEY (user_rec_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dashboard_ftp_credential dashboard_ftp_creden_project_id_b8058f10_fk_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_ftp_credential
    ADD CONSTRAINT dashboard_ftp_creden_project_id_b8058f10_fk_dashboard FOREIGN KEY (project_id) REFERENCES public.dashboard_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dashboard_source dashboard_source_project_id_61ccfb58_fk_dashboard_project_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_source
    ADD CONSTRAINT dashboard_source_project_id_61ccfb58_fk_dashboard_project_id FOREIGN KEY (project_id) REFERENCES public.dashboard_project(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: market_apkreview market_apkreview_apk_id_d6522433_fk_market_marketapk_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_apkreview
    ADD CONSTRAINT market_apkreview_apk_id_d6522433_fk_market_marketapk_id FOREIGN KEY (apk_id) REFERENCES public.market_marketapk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

