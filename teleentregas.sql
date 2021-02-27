--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Debian 11.7-0+deb10u1)
-- Dumped by pg_dump version 11.7 (Debian 11.7-2.pgdg90+1)

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
-- Name: teleentregas; Type: SCHEMA; Schema: -; Owner: teleentregasuser
--

CREATE SCHEMA teleentregas;


ALTER SCHEMA teleentregas OWNER TO teleentregasuser;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: carreras; Type: TABLE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE TABLE teleentregas.carreras (
    codigo integer NOT NULL,
    uacademi integer NOT NULL,
    codunl integer,
    nombre character varying NOT NULL,
    tipo integer NOT NULL,
    duracion integer DEFAULT 5 NOT NULL,
    codws character varying(10) DEFAULT NULL::character varying,
    CONSTRAINT carreras_duracion_check CHECK ((duracion > 0))
);


ALTER TABLE teleentregas.carreras OWNER TO teleentregasuser;

--
-- Name: carreras_codigo_seq; Type: SEQUENCE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE SEQUENCE teleentregas.carreras_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teleentregas.carreras_codigo_seq OWNER TO teleentregasuser;

--
-- Name: carreras_codigo_seq; Type: SEQUENCE OWNED BY; Schema: teleentregas; Owner: teleentregasuser
--

ALTER SEQUENCE teleentregas.carreras_codigo_seq OWNED BY teleentregas.carreras.codigo;


--
-- Name: tesisdigitales; Type: TABLE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE TABLE teleentregas.tesisdigitales (
    id_tesispublicadas integer NOT NULL,
    tesista_tipodoc integer NOT NULL,
    tesista_numerodoc character varying NOT NULL,
    tesista_nombres character varying NOT NULL,
    tesista_apellidos character varying NOT NULL,
    tesista_nombres_apellidos character varying,
    tesista_correoe character varying NOT NULL,
    tesista_telefono character varying(24) NOT NULL,
    director_nombres character varying,
    director_apellidos character varying,
    director_nombres_apellidos character varying,
    director_correoe character varying,
    director_telefono character varying NOT NULL,
    tesis_unidad_academica_id integer NOT NULL,
    tesis_unidad_academica_nombre_corto character varying(10),
    tesis_carrera_id integer NOT NULL,
    tesis_carrera_desc character varying NOT NULL,
    tesis_titulo character varying NOT NULL,
    tesis_tipo_autorizacion_cod integer NOT NULL,
    tesis_tipo_autorizacion_desc character varying(40) NOT NULL,
    tesis_fecha_solicitud date NOT NULL,
    tesis_fecha_publicacion_digital date,
    tesis_comentarios_director character varying,
    tesis_conformidad_director character varying(1) NOT NULL,
    tesis_fecha_revision_director date,
    tesis_estado_publicacion character varying(1) NOT NULL,
    tesis_estado_publicacion_desc character varying(80) NOT NULL,
    tesis_carpeta_ubicacion character varying NOT NULL,
    tesis_coordenada_uno smallint NOT NULL,
    tesis_coordenada_dos smallint NOT NULL
);


ALTER TABLE teleentregas.tesisdigitales OWNER TO teleentregasuser;

--
-- Name: tesisdigitales_id_tesispublicadas_seq; Type: SEQUENCE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE SEQUENCE teleentregas.tesisdigitales_id_tesispublicadas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teleentregas.tesisdigitales_id_tesispublicadas_seq OWNER TO teleentregasuser;

--
-- Name: tesisdigitales_id_tesispublicadas_seq; Type: SEQUENCE OWNED BY; Schema: teleentregas; Owner: teleentregasuser
--

ALTER SEQUENCE teleentregas.tesisdigitales_id_tesispublicadas_seq OWNED BY teleentregas.tesisdigitales.id_tesispublicadas;


SET default_with_oids = true;

--
-- Name: tipodoc; Type: TABLE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE TABLE teleentregas.tipodoc (
    codigo integer NOT NULL,
    nombre character varying(10) NOT NULL,
    codigo_guarani integer,
    codigo_mapuche character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE teleentregas.tipodoc OWNER TO teleentregasuser;

--
-- Name: tipodoc_codigo_seq; Type: SEQUENCE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE SEQUENCE teleentregas.tipodoc_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teleentregas.tipodoc_codigo_seq OWNER TO teleentregasuser;

--
-- Name: tipodoc_codigo_seq; Type: SEQUENCE OWNED BY; Schema: teleentregas; Owner: teleentregasuser
--

ALTER SEQUENCE teleentregas.tipodoc_codigo_seq OWNED BY teleentregas.tipodoc.codigo;


--
-- Name: uacademi; Type: TABLE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE TABLE teleentregas.uacademi (
    codigo integer NOT NULL,
    nombre character varying(100) NOT NULL,
    nombre_corto character varying(10),
    tipo integer,
    cod_unl integer,
    codigo_mapuche integer
);

--



