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


ALTER TABLE teleentregas.uacademi OWNER TO teleentregasuser;

--
-- Name: uacademi_codigo_seq; Type: SEQUENCE; Schema: teleentregas; Owner: teleentregasuser
--

CREATE SEQUENCE teleentregas.uacademi_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teleentregas.uacademi_codigo_seq OWNER TO teleentregasuser;

--
-- Name: uacademi_codigo_seq; Type: SEQUENCE OWNED BY; Schema: teleentregas; Owner: teleentregasuser
--

ALTER SEQUENCE teleentregas.uacademi_codigo_seq OWNED BY teleentregas.uacademi.codigo;


--
-- Name: carreras codigo; Type: DEFAULT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.carreras ALTER COLUMN codigo SET DEFAULT nextval('teleentregas.carreras_codigo_seq'::regclass);


--
-- Name: tesisdigitales id_tesispublicadas; Type: DEFAULT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.tesisdigitales ALTER COLUMN id_tesispublicadas SET DEFAULT nextval('teleentregas.tesisdigitales_id_tesispublicadas_seq'::regclass);


--
-- Name: tipodoc codigo; Type: DEFAULT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.tipodoc ALTER COLUMN codigo SET DEFAULT nextval('teleentregas.tipodoc_codigo_seq'::regclass);


--
-- Name: uacademi codigo; Type: DEFAULT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.uacademi ALTER COLUMN codigo SET DEFAULT nextval('teleentregas.uacademi_codigo_seq'::regclass);


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: teleentregas; Owner: teleentregasuser
--

COPY teleentregas.carreras (codigo, uacademi, codunl, nombre, tipo, duracion, codws) FROM stdin;
478	24	\N	Curso de Preparación Examen Internacional: Inglés: FCE	6	5	001
493	6	\N	Curso de Posgrado: Bioética y derecho penal. Comienzo y fin de la vida humana	6	5	PG045
95	9	6	Licenciatura en Biodiversidad	1	5	1025
287	9	\N	Profesorado de Filosofía	1	5	1026
99	9	12	Licenciatura en Filosofía	1	5	1027
6	3	3	Perito Topocartógrafo	1	5	\N
8	22	5	Terapia Ocupacional	1	5	\N
9	22	7	Licenciatura en Higiene y Seguridad en el Trabajo	1	5	\N
10	22	3	Licenciatura en Saneamiento Ambiental	1	5	\N
11	22	6	Licenciatura en Terapia Ocupacional	1	5	\N
12	22	2	Saneamiento	1	5	\N
19	10	3	Licenciatura en Diseño de la Comunicación Visual	1	4	3
92	9	3	Profesorado de Geografía	1	5	1028
96	9	7	Licenciatura en Geografía	1	5	1029
94	9	5	Profesorado de Historia	1	5	1030
825038	7	\N	Curso de Capacitación en Manejo del Pollo Parrillero	6	5	CA010
21	5	1	Contador Público Nacional	1	5	\N
22	5	2	Licenciatura en Administración	1	5	\N
23	5	3	Licenciatura en Economía	1	5	\N
24	5	4	Bachiller en Ciencias Económicas	1	5	\N
100	9	13	Licenciatura en Sociología	1	5	1032
102	9	15	Licenciatura en Ciencia Política	1	5	1033
90	9	1	Profesorado en Matemática	1	5	1044
59	6	2	Procuración	1	5	\N
60	6	80	Bachiller Universitario en Ciencias Jurídicas y Sociales	1	5	\N
61	6	50	Martillero Público y Corredor de Comercio	1	5	\N
62	6	90	Ciclo de Licenciatura en Bibliotecología	1	5	\N
63	6	51	Tecnicatura en Previsión Social	1	5	\N
64	10	5	Ciclo de Licenciatura en Artes Visuales	1	5	\N
65	10	6	Bachiller Universitario en Diseño de la Comunicación Visual	1	5	\N
66	10	50	Tecnicatura en Producción de Cine y Video	1	5	\N
67	10	51	Tecnicatura en Gestión y Administración de la Cultura	1	5	\N
68	10	52	Tecnicatura en Composición de Parques y Jardines	1	5	\N
69	10	54	Tecnicatura en Dibujo Artístico Digital	1	5	\N
70	10	55	Tecnicatura en Documentación y Archivística Digital	1	5	\N
71	10	53	Tecnicatura en Interiorismo y Decoración	1	5	\N
72	10	57	Tecnicatura en Diseño Mobiliario	1	5	\N
73	10	56	Tecnicatura en Diseño del Espacio Escénico	1	5	\N
74	10	58	Tecnicatura en Diseño Editorial	1	5	\N
78	4	92	Ciclo de Licenciatura en Enfermería	1	5	\N
79	4	51	Tecnicatura en Seguridad contra Incendios	1	5	\N
80	4	52	Tecnicatura en Prevención de Desastres	1	5	\N
81	4	50	Tecnicatura en Estadísticas de Salud	1	5	\N
82	4	53	Tecnicatura en Podología	1	5	\N
84	5	50	Tecnicatura en Administración y Gestión Pública	1	5	\N
85	5	80	Bachiller Universitario en Ciencias Económicas	1	5	\N
86	5	30	Especialización en Comercialización Internacional	1	5	\N
87	5	51	Tecnicatura en Control y Auditoría Gubernamental	1	5	\N
288	9	\N	Alumnos de Integración	1	5	AE
2	3	1	Ingeniería en Recursos Hídricos	1	5	02
3	3	7	Ingeniería en Informática	1	5	03
15	4	1	Bioquímica	1	5	0301
16	4	2	Licenciatura en Biotecnología	1	5	0302
75	4	3	Licenciatura en Nutrición	1	5	0303
26	2	1	Ingeniería Química	1	5	1021
29	2	5	Ingeniería en Alimentos	1	5	1036
31	2	7	Analista Industrial	1	5	1038
32	2	8	Químico Analista	1	5	1039
58	6	1	Abogacía	1	6	\N
33	2	9	Profesorado en Química	1	4	1040
20	8	1	Ingeniería Agronómica	1	5	1048
25	7	1	Medicina Veterinaria	1	5	1047
88	7	51	Tecnicatura en Alimentación de Ganado Vacuno	1	5	002
89	7	50	Tecnicatura en Higiene y Seguridad Alimentaria	1	5	003
34	21	31	Profesorado de Música	1	5	01
36	21	1	Profesorado de Música con Orientación en Piano	1	5	03
42	21	21	Licenciatura en Música con Orientación en Clarinete	1	5	10
44	21	24	Licenciatura en Música con Orientación en Flauta	1	5	12
46	21	28	Licenciatura en Música con Orientación en Saxo	1	5	14
48	21	29	Licenciatura en Música con Orientación en Violín	1	5	16
52	21	22	Licenciatura en Música con Orientación en Composición	1	5	20
54	21	20	Licenciatura en Música con Orientación en Canto	1	5	22
38	21	2	Profesorado de Música con Orientación en Guitarra	1	5	05
39	21	6	Profesorado de Música con Orientación en Órgano	1	5	07
41	21	10	Profesorado de Música con Orientación en Clarinete	1	5	09
43	21	8	Profesorado de Música con Orientación en Flauta	1	5	11
45	21	18	Profesorado de Música con Orientación en Saxo	1	5	13
47	21	3	Profesorado de Música con Orientación en Violín	1	5	15
49	21	5	Profesorado de Música con Orientación en Violonchelo	1	5	17
51	21	35	Profesorado de Música con Orientación en Composición	1	5	19
53	21	14	Profesorado de Música con Orientación en Canto	1	5	21
18	10	2	Diseño Gráfico en Comunicación Visual	1	5	2
101	9	14	Diplomatura en Ciencia Política	1	5	14
4	3	4	Analista en Informática Aplicada	1	5	04
5	3	5	Licenciatura en Cartografía	1	5	05
76	4	90	Ciclo de Licenciatura en Educación Física	1	5	001
131	20	1	Medicina	1	6	1
91	9	2	Profesorado de Biología	1	5	\N
7	22	4	Licenciatura en Administración de la Salud	1	5	\N
151	6	28	Especialización en Derecho de Familia	2	5	EDF
14	17	3	Técnico Universitario en Elaboración y Producción de Alimentos	1	5	\N
825039	7	\N	Curso de Capacitación en Producción Ovina	6	5	CA011
105	9	96	Ciclo de Licenciatura en Periodismo y Comunicación Social	1	5	\N
106	9	94	Ciclo de Licenciatura en Enseñanza del Español como Lengua Extranjera	1	5	\N
109	9	95	Ciclo de Licenciatura en Filosofía	1	5	\N
110	9	11	Diplomatura en Humanidades (Distancia)	1	5	\N
111	9	82	Bachiller Universitario en Geografía (Distancia)	1	5	\N
112	9	80	Bachiller Universitario en Letras (Distancia)	1	5	\N
113	9	81	Bachiller Universitario en Historia (Distancia)	1	5	\N
114	9	84	Bachillerato Universitario en Matemática (Distancia)	1	5	\N
115	3	50	Tecnicatura en Informática Aplicada al Diseño Multimedia y de Sitios Web	1	5	\N
116	3	51	Tecnicatura en Informática Aplicada a la Gráfica y Animación Digital	1	5	\N
117	3	52	Tecnicatura en Informática de Gestión	1	5	\N
479	24	\N	Curso de Preparación Examen Internacional: Portugués: CELPE-BRAS	6	5	002
120	21	90	Ciclo de Licenciatura en Teoría y Crítica de la Música	1	5	\N
103	9	16	Profesorado en Filosofía	1	5	\N
107	9	91	Ciclo de Licenciatura en Enseñanza de la Lengua y la Literatura	1	5	\N
122	21	7	Profesorado de Música con Orientación en Arpa	1	5	\N
123	21	9	Profesorado de Música con Orientación en Oboe	1	5	\N
124	21	16	Profesorado de Música con Orientación en Armonía y Contrapunto	1	5	\N
125	21	17	Profesorado en Educación Musical - Profesorado de Música	1	5	\N
152	6	29	Especialización en Derecho Penal	2	5	EDP
153	6	30	Especialización en Derecho Procesal Civil	2	5	EDPC
164	6	41	Maestría en Criminología	2	5	MC
121	3	8	Ingeniería en Agrimensura	1	5	08
133	17	4	Enfermería Universitaria	1	5	\N
138	22	1	Administración Hospitalaria	1	5	\N
139	22	8	Tecnicatura Universitaria en Administración de Salud	1	5	\N
140	22	9	Tecnicatura Universitaria en Higiene y Seguridad en el Trabajo	1	5	\N
141	22	10	Tecnicatura en Saneamiento Ambiental	1	5	\N
142	22	11	Tecnicatura en Higiene y Seguridad en el Trabajo	1	5	\N
143	6	20	Especialización en Notariado	2	5	\N
146	6	23	Especialización en Derecho Comercial - Área Bancaria	2	5	\N
147	6	24	Magíster en Derecho Comercial	2	5	\N
149	6	26	Especialización en Criminología	2	5	\N
155	6	32	Especialización en Integración	2	5	\N
156	6	33	Especialización en Derecho Procesal Penal	2	5	\N
157	6	34	Magíster en Derecho	2	5	\N
159	6	36	Especialización en Minoridad	2	5	\N
160	6	37	Especialización en Derecho de Empresas	2	5	\N
161	6	38	Especialización en Medicina Legal	2	5	\N
162	6	39	Magíster en Ciencias Sociales	2	5	\N
168	2	23	Magíster en Química	2	5	\N
169	2	24	Magíster en Ingeniería Química	2	5	\N
170	2	25	Magíster en Tecnología Química	2	5	\N
171	2	26	Magíster en Ciencias de Alimentos	2	5	\N
172	2	27	Magíster en Tecnología de Alimentos	2	5	\N
174	2	29	Especialización en Gestión de la Calidad	2	5	\N
175	2	30	Magíster en Gestión de la Calidad	2	5	\N
176	2	31	Especialización en Ciencia y Tecnol. de la Leche y Prod. Lácteos	2	5	\N
177	2	32	Magíster en Ciencia y Tecnología de Alimentos	2	5	\N
178	2	33	Magíster en Matemática	2	5	\N
179	5	20	Especialización  en Sindicatura Concursal	2	5	\N
180	5	21	Master en Administración de Empresas 	2	5	\N
181	5	22	Magíster en Administración Pública	2	5	\N
182	5	23	Master en Administración de Empresas con mención en Dirección de Negocios	2	5	\N
183	5	24	Master en Administración de Empresas con mención en Gestión de Costos	2	5	\N
184	5	25	Master en Administración de Empresas con mención en Comercialización Internacional	2	5	\N
185	5	26	Master en Contabilidad Internacional	2	5	\N
17	10	1	Arquitectura	1	6	\N
132	21	25	Licenciatura en Música con Orientación en Guitarra	1	5	06
56	21	23	Licenciatura en Música con Orientación en Dirección Coral	1	5	24
126	21	36	Licenciatura en Música con Orientación en Dirección Orquestal	1	5	26
127	21	37	Licenciatura en Música con Orientación en Percusión	1	5	28
129	21	39	Licenciatura en Sonorización y Grabación	1	5	29
118	2	10	Ingeniería en Materiales	1	5	1042
119	2	11	Licenciatura en Materiales	1	4	1043
165	2	20	Doctorado en Química	2	5	00001
173	2	28	Doctorado en Matemática	2	5	00004
55	21	15	Profesorado de Música con Orientación en Dirección Coral	1	5	23
57	21	34	Profesorado de Música con Orientación en Dirección Orquestal	1	5	25
128	21	38	Profesorado de Música con Orientación en Percusión	1	5	27
144	6	21	Doctorado en Derecho	2	5	DD
163	6	40	Especialización en Derecho Ambiental y Tutela del Patrimonio Cultural	2	5	EAP
148	6	25	Especialización en Derecho Administrativo	2	5	EDA
154	6	31	Especialización en Derecho Laboral	2	5	EDL
158	6	35	Especialización en Derecho Tributario	2	5	EDT
145	6	22	Especialización en Derecho Agrario	2	5	EAG
289	9	\N	Alumnos Externos de Intercambio	1	5	AEI
494	6	\N	Curso de Posgrado: El Informe Social Forense	6	5	PG035
187	5	28	Especialización en Dirección de Negocios	2	5	\N
188	5	29	Especialización en Gestión de Costos	2	5	\N
190	5	31	Magíster en Comercialización Internacional	2	5	\N
191	5	32	Especialización en Administración de Empresas con mención en Finanzas de Empresas	2	5	\N
192	5	33	Especialización en Contabilidad Internacional	2	5	\N
195	4	22	Maestría en Didáctica de las Cs. Experimentales	2	5	\N
198	4	25	Especialización en Bromatología y Nutrición	2	5	\N
199	4	26	Especialización en Gestión de la Calidad y Auditoria en Bioquímica Clínica	2	5	\N
205	3	24	Doctorado en Ingeniería con mención Mecánica Computacional	2	5	\N
206	3	25	Doctorado en Ingeniería con mención Recursos Hídricos	2	5	\N
207	3	26	Doctorado en Ingeniería con mención Inteligencia Computacional, Señales y Sistemas	2	5	\N
209	3	28	Maestría en Computación Aplicada a la Ciencia y a la Ingeniería	2	5	\N
210	3	29	Doctorado en Ingeniería con mención Ambiental	2	5	\N
211	8	20	Magíster Scientiae en Extensión Agropecuaria	2	5	\N
212	8	22	Especialización en Manejo de Agroquímicos = Especializ en Control de Plagas Agrícolas	2	5	\N
290	9	\N	Alumnos Oyentes	1	5	AO
214	8	24	Especialización en Riego de Tierras Agrícolas	2	5	\N
204	3	23	Especialización en Gestión Ambiental	2	5	EGA
201	3	20	Maestría en Ingeniería de los Recursos Hídricos	2	5	MIRH
194	4	20	Doctorado en Ciencias Biológicas	2	5	00005
193	5	34	Especialización en Contabilidad y Auditoría para Pymes	2	5	02-34
27	2	2	Licenciatura en Matemática Aplicada	1	4	1034
221	7	23	Especialización en salud de los animales de compañía	2	5	\N
222	9	20	Magíster en Ecología Acuática Continental	2	5	\N
223	9	22	Especialización en Ecología Acuática Continental	2	5	\N
225	9	24	Especialización en Problemáticas Sociales de la Geografía	2	5	\N
226	9	25	Especialización en Historia Social	2	5	\N
229	9	28	Maestría en Problemáticas Sociales de la Geografía	2	5	\N
230	9	29	Maestría en Análisis del Discurso	2	5	\N
231	9	30	Especialización en Lingüística Aplicada	2	5	\N
232	9	31	Maestría en Lingüística Aplicada	2	5	\N
233	9	32	Maestría en Historia Social	2	5	\N
234	9	33	Especialización en Didácticas Específicas	2	5	\N
235	10	20	Maestría en Gestión Urbana, Municipal y Comunal	2	5	\N
236	10	21	Especialización en Diseño y Proyectación con mención en: Didáctica del Proyecto.	2	5	\N
237	10	24	Especialización en Diseño y Proyectación con mención en: Diseño Escenoarquitectónico y puesta en escena.	2	5	\N
238	10	25	Especialización en Diseño y Proyectación con mención en: Proyectación Análogo-Digital.	2	5	\N
239	10	22	Especialización en Gestión Urbana, Municipal y Comunal	2	5	\N
240	10	23	Especialización en Pericias y Tasaciones con mención en Obras de Arquitectura y Urban.	2	5	\N
241	6	3	Licenciatura en trabajo social	1	5	\N
28	2	3	Licenciatura en Química	1	5	1035
243	4	4	Enfermería Universitaria	1	5	\N
244	2	90	Ciclo Lic. en Ciencia y Tecnología del alimento	1	5	\N
224	9	23	Maestría en Didácticas Específicas	2	5	23
246	19	1	Tecnicatura en Alimentos	1	5	\N
227	9	26	Maestría en Docencia Universitaria	2	5	26
218	7	20	Maestría en Ciencias Veterinarias	2	5	00003
248	3	\N	Tecnicatura Universitaria en Software Libre	3	5	0005
13	17	2	Analista Universitario de Alimentos	1	5	1045
249	17	\N	Tecnicatura Universitaria en Gastronomía	1	5	1046
250	19	\N	Tecnicatura Universitaria en Tecnología de Alimentos	1	5	1016
215	8	25	Especialización en Cultivos Intensivos	2	5	00001
216	8	26	Maestría en Cultivos Intensivos	2	5	00002
202	3	21	Doctorado en Ingeniería	2	5	DI
251	8	\N	Maestría en Extensión Agropecuaria	2	5	00004
217	8	27	Doctorado en Ciencias Agrarias	2	5	00005
213	8	23	Especialización en Producción Lechera	2	5	00006
252	8	\N	Educación Continuada	2	5	00008
83	8	50	Tecnicatura en Gestión y Producción Apícola	1	5	001
203	3	22	Maestría en Gestión Ambiental	2	5	MGA
253	8	\N	Tecnicatura en Administración de Empresas Agropecuarias	3	5	006
219	7	21	Especialización en Buiatría	2	5	00002
220	7	22	Doctorado en Ciencias Veterinarias	2	5	00005
200	4	27	Maestría en Salud Ambiental	2	5	00001
254	7	\N	Tecnicatura en Producción Primaria de Leche	3	5	004
197	4	24	Especialización en Bacteriología Clínica	2	5	00002
255	7	\N	Curso de Formación Profesional: Inseminación Artificial de Ganado Vacuno	3	5	CFP05
196	4	23	Doctorado en Física	2	5	00004
256	7	\N	Curso de Formación Profesional: Auxiliares de Laboratorio: Microbiología de los alimentos	3	5	CFP06
37	21	32	Tecnicatura en Composición Musical con Medios Electroacústicos	1	5	04
50	21	30	Licenciatura en Música con Orientación en Violonchelo	1	5	18
245	21	43	Licenciatura en Música con Orientación en Contrabajo	1	5	31
257	21	\N	Licenciatura en Música con Orientación en Viola	1	5	33
258	21	\N	Licenciatura en Música Popular	1	5	34
259	21	\N	Licenciatura en Música con Orientación en Trombón	1	5	35
260	21	\N	Licenciatura en Música con orientación en Saxofón	1	5	36
186	5	27	Especialización en Tributación	2	5	0227
228	9	27	Especialización en Docencia Universitaria	2	5	27
261	21	\N	ALUMNOS EXTERNOS	1	5	ALUEX
291	9	\N	Doctorado en Humanidades	2	5	37
292	9	\N	Doctorado en Estudios Sociales	2	5	39
293	9	\N	Doctorado en Sentidos, Teorías y Prácticas de la Educación	2	5	41
294	9	\N	Ciclo de Licenciatura en Gestión Educativa	3	5	CLGE
295	9	\N	Ciclo de Licenciatura en Inglés	3	5	CLI
296	9	\N	Ciclo de Licenciatura en Enseñanza de Lengua y Literatura	6	5	15
297	9	\N	Ciclo de Licenciatura en Inglés	6	5	16-D
298	9	\N	Ciclo de Licenciatura en Gestión Educativa	6	5	17
299	6	\N	ABOGACIA	1	5	1
300	6	\N	Estudiantes externos	1	5	100
301	6	\N	Licenciatura en Trabajo Social	1	5	3
150	6	27	Especialización en Derecho de Daños	2	5	EDD
302	6	\N	Especialización en Derecho Notarial, Registral e Inmobiliario	2	5	EDN
303	6	\N	Especialización en Derecho Sucesorio	2	5	EDS
304	6	\N	Maestría en Argumentación Jurídica	2	5	MAJ
305	6	\N	Tecnicatura en Martillero Público y Corredor de Comercio	6	5	3
306	6	\N	Ciclo de Licenciatura en Bibliotecología	6	5	4
307	6	\N	Ciclo Inicial de Abogacía (Bachiller  Univ. en Cs. Jurídicas)	6	5	5
308	6	\N	Tecnicatura en Previsión Social	6	5	6
309	6	\N	Tecnicatura en Bibliotecología	6	5	7
310	6	\N	Curso de Actualización en Derecho Deportivo	6	5	CA005
311	6	\N	Curso de Actualización: Clínica de Tasación de Bienes Inmuebles. Aspectos Teóricos y Prácticos	6	5	CA016
312	6	\N	Curso de Actualización: Práctica Previsional. Regímenes jubilatorios en los ámbitos nacional, provincial y municipal	6	5	CA033
313	6	\N	Curso de Actualización: Derechos de la naturaleza. Un abordaje teórico, práctico e interdisciplinar	6	5	CA038
314	6	\N	Curso de Actualización: Marketing personal para profesionales de la	6	5	CA045
315	6	\N	Curso de Actualización: Tasaciones agropecuarias	6	5	CA047
266	20	\N	Especialización en Auditoría Médica	1	5	6
316	6	\N	Curso de Posgrado: Derechos Humanos de los Pueblos Indígenas	6	5	PG010
317	6	\N	Curso de Posgrado: Relaciones exteriores: Diplomacia y Paradiplomacia en el Siglo XXI	6	5	PG013
318	6	\N	Curso de Posgrado: Trabajo Social Forense	6	5	PG016
319	6	\N	Curso de Posgrado: Liquidación de indemnizaciones laborales: leyes 20.744, 24.013 y 25.323	6	5	PG023
320	6	\N	Curso de Posgrado: Las medidas cautelares en el Código Civil y Comercial de la Nación	6	5	PG031
321	6	\N	Curso de Posgrado: Sistemas de impugnación y recursos judiciales y administrativos	6	5	PG033
322	6	\N	Curso de Posgrado: Práctica Procesal Penal	6	5	PG036
323	6	\N	Curso de Posgrado: Juicio de Usucapión en el nuevo Código Civil y	6	5	PG037
324	6	\N	Curso de Posgrado: Liquidacion de indemnizaciones reguladas en la Ley de Riesgos del Trabajo (Leyes 24557, 26773 y 27348 y normas complementarias)	6	5	PG040
325	6	\N	Curso de Posgrado: Introducción a la Justicia Retributiva	6	5	PG042
326	6	\N	Curso de Posgrado: Determinación e individualización de las penas	6	5	PG043
327	6	\N	Curso de Posgrado: Aprender a litigar. Derecho Privado	6	5	PG044
328	6	\N	Curso de Actualización en SICAM (Sistema de Información para Contribuyentes Autónomos y Monotributistas)  en el marco del SIPA (Sistema Integrado Previsional Argentino). Aspectos Teóricos Prácticos	6	5	CA004
329	6	\N	Curso de Posgrado: El nuevo Código Civil y Comercial: Régimen patrimonial del matrimonio y las cuestiones patrimoniales en el divorcio. Las Uniones convivenciales y el aspecto patrimonial	6	5	PG015
330	6	\N	Curso de Posgrado: Derecho Procesal de Familia y los nuevos procedimientos ante los jueces con competencia en materia de familias, en las provincias de Santa Fe y Entre Rios. Derecho vigente y proyectado.	6	5	PG041
1	3	6	Ingeniería Ambiental	1	5	01
331	3	\N	Perito Topo-Cartógrafo	1	5	06
332	3	\N	ALUMNOS EXTERNOS	1	5	12
333	3	\N	EDUCACION CONTINUA	2	5	EDC
379	22	\N	SANEAMIENTO	1	5	07002
35	21	27	Licenciatura en Música con Orientación en Piano	1	5	02
262	21	\N	Ciclo de Licenciatura en Teoría y Crítica de la Música	6	5	01
263	21	\N	Tecnicatura en Arreglos Musicales	6	5	02
264	20	\N	Alumnos Externos	1	5	2
265	20	\N	Licenciatura en Obstetricia	1	5	5
267	20	\N	Tecnicatura Universitaria en Emergencia Prehospitalaria, Rescate y Trauma	6	5	01
268	20	\N	Tecnicatura Universitaria en Cosmiatría y Cosmetología	6	5	02
269	20	\N	Ciclo de Licenciatura en Producción de Bioimágenes	6	5	03
270	22	\N	LICENCIATURA EN ADMINISTRACION DE SALUD	1	5	07004
271	22	\N	LICENCIATURA EN TERAPIA OCUPACIONAL	1	5	07006
272	22	\N	LICENCIATURA EN SANEAMIENTO AMBIENTAL	1	5	07007
273	22	\N	LICENCIATURA EN HIGIENE Y SEGURIDAD EN EL TRABAJO	1	5	07008
274	22	\N	TÉCNICO EN HIGIENE Y SEGURIDAD EN EL TRABAJO	1	5	07011
275	22	\N	Tecnicatura Universitaria en Salud Ambiental	1	5	07012
276	22	\N	ALUMNOS EXTERNOS POR INTEGRACION	1	5	ALEX1
277	22	\N	Ciclo de Licenciatura en Seguridad y Salud Ocupacional	3	5	07092
278	22	\N	Ciclo de Licenciatura en Podología	3	5	LIPOD
279	22	\N	Tecnicatura en Administración de Salud	3	5	TAS
280	10	\N	Arquitectura y Urbanismo	1	5	1
281	10	\N	ALUMNOS POR INTEGRACIÓN	1	5	4
282	10	\N	ESTUDIANTES DE INTERCAMBIO	1	5	5
242	10	4	Licenciatura en Diseño Industrial	1	5	6
283	10	\N	Tecnicatura en Interiorismo y Decoración	6	5	12
284	10	\N	Ciclo de Licenciatura en Artes Visuales	6	5	5
285	10	\N	Tecnicatura en Composición de Parques y Jardines	6	5	9
208	3	27	Maestría en Gestión Integrada de los Recursos Hídricos	2	5	MGIRH
334	3	\N	Tecnicatura en Informática Aplicada al Diseño Multimedial y de Sitios Web	6	5	0001
335	3	\N	Tecnicatura en Informática Aplicada a la Gráfica y Animación Digital	6	5	0002
336	3	\N	Tecnicatura en Informática de Gestión	6	5	0003
337	3	\N	Tecnicatura en Diseño y Programación de Videojuegos	6	5	0004
338	3	\N	Tecnicatura Universitaria en Software Libre	6	5	0005
339	4	\N	Licenciatura en Enfermería	1	5	0304
340	4	\N	Alumnos de Integración	1	5	EXTBI
341	4	\N	Educación Continuada	2	5	00007
342	4	\N	Doctorado en Educación en Ciencias Experimentales	2	5	00009
343	4	\N	Ciclo de Licenciatura en Educación Física	3	5	001
344	4	\N	Ciclo de Licenciatura en Educación Especial	3	5	0391
345	4	\N	Tecnicatura en Estadísticas de Salud	6	5	004
346	5	\N	Alumnos Externos	1	5	0200
347	5	\N	CONTADOR PÚBLICO NACIONAL	1	5	0201
348	5	\N	LICENCIATURA EN ADMINISTRACIÓN	1	5	0202
349	5	\N	LICENCIATURA EN ECONOMÍA	1	5	0203
13643	8	\N	Especialización en Cultivos Intensivos	1	5	00001
351	5	\N	Extensión y Posgrado	2	5	0210
352	5	\N	Maestría en Administración de Empresas	2	5	0221
353	5	\N	Magister en Administración Pública	2	5	0222
354	5	\N	Doctorado en Administración Pública	2	5	0235
355	5	\N	Maestria en Administración y Finanzas	2	5	0236
356	5	\N	Especialización en Costos y Gestión Empresarial	2	5	0237
357	5	\N	Tecnicatura en Administración y Gestión Pública	6	5	0205
358	5	\N	Especialización en Dirección y Gestión de Organizaciones Públicas	6	5	PG001
30	2	6	Ingeniería Industrial	1	5	1037
359	2	\N	Licenciatura en Ciencias y Tecnología de los Alimentos - Ciclo de Licenciatura	1	5	1041
360	2	\N	Licenciatura en Física	1	5	1055
166	2	21	Doctorado en Ingeniería Química	2	5	00002
361	2	\N	Maestría en Ciencia y Tecnología de Alimentos	2	5	00006
362	2	\N	Especialización en Ciencia y Tecnología de la Leche y Productos Lácteos	2	5	00011
363	2	\N	Doctorado en Ciencia y Tecnología de los Alimentos	2	5	00013
364	2	\N	Educación Continuada	2	5	00014
40	21	26	Licenciatura en Música con Orientación en Órgano	1	5	08
365	21	\N	Profesorado de Música con Orientación en Contrabajo	1	5	30
366	21	\N	Profesorado de Música con Orientación en Viola	1	5	32
367	17	\N	Tecnicatura Universitaria en Biocombustibles	6	5	01
368	17	\N	Tecnicatura en Elaboración y Producción de Alimentos	6	5	02
369	17	\N	Tecnicatura en Elaboración y Producción de Alimentos (ATILRA)	6	5	04
370	20	\N	Especialización en Medicina Legal	1	5	4
371	10	\N	Tecnicatura en Diseño de Mobiliario	6	5	13
372	10	\N	Maestría en Arquitectura	6	5	16
373	10	\N	Tecnicatura en Producción de Cine y Video	6	5	7
374	10	\N	Formación Continua	2	5	1013
375	10	\N	Especialización en Pericias y Tasaciones, Mención en Obras de Arquitectura y Urbanismo	2	5	1017
376	10	\N	Doctorado en Arquitectura	2	5	1018
377	10	\N	Maestría en Arquitectura	2	5	1019
378	10	\N	Especialización en Proyecto, Planificación y Gestión de Arquitectura para la Educación	2	5	1020
13644	8	\N	Maestría en Cultivos Intensivos	1	5	00002
13645	8	\N	Especialización en Control de Plagas Agrícolas	1	5	00003
13646	8	\N	Maestría en Extensión Agropecuaria	1	5	00004
13647	8	\N	Doctorado en Ciencias Agrarias	1	5	00005
13648	8	\N	Especialización en Producción Lechera	1	5	00006
13649	8	\N	Educación Continuada	1	5	00008
13650	8	\N	Maestría en Negocios Agroalimentarios	1	5	00010
13651	8	\N	Maestría en Protección Vegetal	1	5	00011
13652	8	\N	Tecnicatura en Administración de Empresas Agropecuarias (Presencial)	1	5	005
13653	8	\N	Tecnicatura en Administración de Empresas Agropecuarias	1	5	006
825040	6	\N	Curso de Posgrado: Administración de Consorcios y Propiedad Horizontal en el Nuevo Código Civil y Comercial de la Nación	6	5	PG019
480	24	\N	Curso de Preparación Examen Internacional: PET para egresados Escuela Primaria UNL	6	5	003
481	24	\N	Alemán	6	5	ACI
482	24	\N	Inglés - Programa de Actualización	6	5	AICI
483	24	\N	Chino	6	5	CCI
484	24	\N	Español como Lengua Extranjera	6	5	ELECI
485	24	\N	Francés	6	5	FCI
486	24	\N	Inglés	6	5	ICI
487	24	\N	Italiano	6	5	ITCI
488	24	\N	Japonés	6	5	JCI
489	24	\N	Lengua de Señas Argentinas	6	5	LSACI
490	24	\N	Portugués	6	5	PCI
495	2	\N	Doctorado en Química	1	5	00001
496	2	\N	Doctorado en Ingeniería Química	1	5	00002
497	2	\N	Doctorado en Tecnología Química	1	5	00003
498	2	\N	Doctorado en Matemática	1	5	00004
499	2	\N	Maestría en Ciencia y Tecnología de Alimentos	1	5	00006
500	2	\N	Maestría en Matemática	1	5	00007
501	2	\N	Maestría en Ingeniería Química	1	5	00008
502	2	\N	Maestría en Tecnología Química	1	5	00009
503	2	\N	Especialización en Ciencia y Tecnología de la Leche y Productos Lácteos	1	5	00011
504	2	\N	Doctorado en Ciencia y Tecnología de los Alimentos	1	5	00013
505	2	\N	Educación Continuada	1	5	00014
506	2	\N	Doctorado en Energía y Materiales Avanzados	1	5	00015
380	22	\N	TERAPIA OCUPACIONAL	1	5	07005
381	22	\N	Ciclo de Licenciatura en Seguridad y Salud Ocupacional	1	5	07092
382	22	\N	Tecnicatura en Podología	3	5	PODOL
383	22	\N	Tecnicatura en Estadísticas de Salud	3	5	TESAL
384	22	\N	Tecnicatura en Seguridad contra Incendios	3	5	002
385	9	\N	Especialización en Estudios del Discurso en Inglés	2	5	36
386	9	\N	Maestría en Políticas Públicas para la Educación	2	5	38
387	9	\N	Especialización en Didáctica de la Matemática	2	5	40
388	9	\N	Ciclo de Licenciatura en Educación en Primeras Infancias	3	5	CLEIP
389	9	\N	Ciclo de Licenciatura en Periodismo y Comunicación	3	5	CLPC
390	9	\N	Ciclo de Licenciatura en Teatro	3	5	CLT
391	9	\N	Bachiller Universitario en Letras	6	5	04D
392	9	\N	Bachiller Universitario en Historia	6	5	05D
393	9	\N	Ciclo de Licenciatura en Español como Lengua Extranjera	6	5	18
394	9	\N	Ciclo de Licenciatura en Periodismo y Comunicación	6	5	21
395	9	\N	Curso de Formación Profesional: Armado, Configuración y Mantenimiento de Computadoras	6	5	CFP10
396	9	\N	Curso de Formación Profesional: Enfoques para pensar la práctica educativa	6	5	CFP15
397	9	\N	Curso de Formación Profesional: La mirada didáctica sobre las disciplinas	6	5	CFP19
398	9	\N	Bachiller Universitario en Geografía	6	5	03D
399	6	\N	PROCURACION	1	5	2
400	6	\N	Ciclo de Licenciatura en Trabajo Social	1	5	5
401	6	\N	Cursos de posgrado 2007	2	5	CUR07
402	6	\N	Especialización en Derecho de la Empresa	2	5	EDE
403	6	\N	Especializacion en Derecho Procesal Penal	2	5	EDPP
404	6	\N	Maestría en Teoría Constitucional y Derechos Humanos	2	5	MCDH
405	6	\N	Maestría en Ciencias Sociales	2	5	MCS
406	6	\N	Maestría en Derecho Administrativo	2	5	MDAD
407	6	\N	Maestría en Derecho Penal	2	5	MDP
408	6	\N	Curso de Actualización: Subasta judicial. Aspectos generales Teóricos  Prácticos	6	5	CA006
409	6	\N	Curso de Actualización: Excel Básico, Aplicado a Planillas de Tasaciones de Bienes Inmuebles	6	5	CA015
410	6	\N	Curso de Actualización: Debido Proceso Penal	6	5	CA032
411	6	\N	Curso de Actualización: Negociación y Mediación para construir consensos	6	5	CA036
412	6	\N	Curso de Actualización: Derecho y alimentos. La regulación del acceso, la seguridad y la soberanía alimentarias	6	5	CA037
413	6	\N	Curso de Actualización: Gobiernos locales, Derecho Urbanísitico y Derecho a la ciudad	6	5	CA040
414	6	\N	Curso de Actualización: Técnicas de liderazgo para profesionales de la información	6	5	CA042
415	6	\N	Curso de Actualización: Marketing de servicios para profesionales de la información	6	5	CA043
416	6	\N	Curso de Actualización: Introducción a la gestión del conocimiento para profesionales de la información	6	5	CA044
417	6	\N	Curso de Actualización: Tasaciones, presentación de informes y liquidación	6	5	CA046
418	6	\N	Curso de Actualizacion: Derechos de la Naturaleza Profundizado	6	5	CA049
419	6	\N	Conferencia: Ineficacia Concursal	6	5	CU001
420	6	\N	Curso de Posgrado: Derecho de Tránsito. Accidente, Responsabilidad y Seguro	6	5	PG003
421	6	\N	Curso de Posgrado: Responsabilidad parental, régimen de comunicación y alimentos a los hijos en el nuevo Código Civil y Comercial de la Nación	6	5	PG008
422	6	\N	Curso de Posgrado: Proporcionalidad de la pena	6	5	PG009
423	6	\N	Curso de Posgrado: El Código Civil y Comercial de la Nación: El Nuevo Derecho Comercial	6	5	PG014
424	6	\N	Curso de Posgrado: Planificación participativa e inclusión social: enfoque de derechos, género y discapacidad	6	5	PG025
425	6	\N	Ciclo de Licenciatura en Criminología y Seguridad Ciudadana	1	5	4
426	6	\N	Curso de Actualización: Prevención y Abordaje de las Violencias	6	5	CA023
427	6	\N	Curso de Actualización: Derecho Penal Constitucional	6	5	CA024
428	6	\N	Curso de Actualización: Derecho penal contemporáneo	6	5	CA039
429	6	\N	Especialización en Defensa y Garantías, con Orientación en Derecho Penal y Derecho de Familia y Menores	6	5	PG000
430	6	\N	Curso de Posgrado en Economía y Derecho en el marco de las Ciencias Sociales	6	5	PG005
431	6	\N	Curso de Posgrado en Gobiernos Locales y Democracia Participativa	6	5	PG006
432	6	\N	Curso de Posgrado: Derecho Constitucional y Acceso a la Justicia	6	5	PG012
433	6	\N	Curso de Posgrado: Filiación en las tres fuentes del Nuevo Código Civil y Comercial -por naturaleza, por voluntad procreacional y por adopción	6	5	PG024
434	6	\N	Curso de Posgrado: Procesos de familia	6	5	PG028
435	6	\N	Curso de Posgrado: Alimentos, cuidado personal, régimen de comunicación	6	5	PG034
436	6	\N	Curso de Posgrado: El delito y sus consecuencias en la practica forense	6	5	PG038
437	7	\N	Especialización en Salud de los Animales de Compañía	2	5	00004
438	7	\N	Tecnicatura en Alimentación de Ganado Vacuno	6	5	002
439	7	\N	Tecnicatura en Higiene y Seguridad Alimentaria	6	5	003
440	7	\N	Tecnicatura en Producción Primaria de Leche	6	5	004
441	7	\N	Curso de Formación Profesional: Inseminación Artificial de Ganado Vacuno	6	5	CFP05
442	7	\N	Curso de Formación Profesional: Auxiliares de Laboratorio: Microbiología de los alimentos	6	5	CFP06
443	8	\N	Especialización en Control de Plagas Agrícolas	2	5	00003
444	8	\N	Maestría en Protección Vegetal	2	5	00011
445	8	\N	Tecnicatura en Gestión y Producción Apícola	6	5	001
446	8	\N	Tecnicatura en Administración de Empresas Agropecuarias (Presencial)	6	5	005
447	8	\N	Tecnicatura en Administración de Empresas Agropecuarias	6	5	006
448	8	\N	Tecnicatura Universitaria en Poscosecha de Granos y Semillas	6	5	007
449	8	\N	Maestría en Negocios Agroalimentarios	2	5	00010
450	3	\N	Maestría en Computación Aplicada a la Ciencia y la Ingeniería	2	5	MACO
451	3	\N	Curso de Formación Profesional: Creación de efectos visuales y gráficos en movimiento - VFX y Motion Graphics	6	5	CFP17
452	3	\N	Curso de Formación Profesional: Edición Digital de Video	6	5	CFP18
77	4	91	Ciclo de Licenciatura en Educación Especial	1	5	0391
453	4	\N	Maestría en Didáctica de las Ciencias Experimentales	2	5	00006
454	4	\N	Especialización en vinculación y gestión tecnológica	2	5	00008
455	4	\N	Maestría en Física	2	5	00010
456	4	\N	Doctorado en Bioquímica y Biología Aplicada	2	5	00011
13654	8	\N	Tecnicatura Universitaria en Poscosecha de Granos y Semillas	1	5	007
13655	7	\N	Especialización en Buiatría	1	5	00002
458	4	\N	Enfermería Universitaria	3	5	EUG
459	4	\N	Alumnos Externos por Integración	3	5	EXTEU
13656	7	\N	Maestría en Ciencias Veterinarias	1	5	00003
13657	7	\N	Especialización en Salud de los Animales de Compañía	1	5	00004
460	4	\N	Tecnicatura en Administración de Salud	6	5	005
461	5	\N	Licenciatura en Gestión Universitaria	1	5	02-04
462	5	\N	Especialización en Comercialización Internacional	2	5	0206
463	5	\N	Tecnicatura en Administración y Gestión Universitaria	2	5	0208
464	5	\N	Especialización en Sindicatura Concursal	2	5	0220
465	5	\N	Ciclo de Licenciatura en Comercialización	2	5	0290
466	5	\N	Ciclo de Licenciatura en Recursos Humanos	2	5	0292
467	5	\N	Bachiller Universitario en Ciencias Económicas	6	5	0204
468	5	\N	Tecnicatura en Control y Auditoria Gubernamental	6	5	0207
469	5	\N	Tecnicatura en Administración y Gestión Universitaria	6	5	0208
470	5	\N	Tecnicatura Universitaria en Administración y Gestión Tributaria	6	5	0209
471	5	\N	Tecnicatura en Administración y Gestión Pública	2	5	0205
472	2	\N	Formación Continua	1	5	1013
167	2	22	Doctorado en Tecnología Química	2	5	00003
473	2	\N	Maestría en Matemática	2	5	00007
474	2	\N	Maestría en Ingeniería Química	2	5	00008
475	2	\N	Maestría en Tecnología Química	2	5	00009
476	2	\N	Doctorado en Energía y Materiales Avanzados	2	5	00015
477	6	\N	Curso de Posgrado: La Pequeña y Mediana Empresa en el S. XXI: su abordaje jurídico a partir de la reforma de la Ley 26.994- Etapa I	6	5	PG018
13658	7	\N	Doctorado en Ciencias Veterinarias	1	5	00005
13659	7	\N	Tecnicatura en Producción Primaria de Leche	1	5	004
13660	7	\N	Curso de Formación Profesional: Inseminación Artificial de Ganado Vacuno	1	5	CFP05
13661	7	\N	Curso de Formación Profesional: Auxiliares de Laboratorio: Microbiología de los alimentos	1	5	CFP06
286	9	\N	Profesorado en Biología	1	5	1022
97	9	8	Licenciatura en Letras	1	5	1023
93	9	4	Profesorado de Letras	1	5	1024
98	9	9	Licenciatura en Historia	1	5	1031
825018	9	\N	Maestría en Didácticas Específicas	1	5	23
825019	9	\N	Maestría en Docencia Universitaria	1	5	26
825020	9	\N	Especialización en Docencia Universitaria	1	5	27
825021	9	\N	Especialización en Estudios del Discurso en Inglés	1	5	36
825022	9	\N	Doctorado en Humanidades	1	5	37
825023	9	\N	Maestría en Políticas Públicas para la Educación	1	5	38
825024	9	\N	Doctorado en Estudios Sociales	1	5	39
825025	9	\N	Especialización en Didáctica de la Matemática	1	5	40
825026	9	\N	Doctorado en Sentidos, Teorías y Prácticas de la Educación	1	5	41
825027	9	\N	Ciclo de Licenciatura en Educación en Primeras Infancias	1	5	CLEIP
825041	6	\N	Curso de Actualización: Tasaciones Judiciales	6	5	CA052
825029	9	\N	Ciclo de Licenciatura en Teatro	1	5	CLT
825030	9	\N	Bachiller Universitario en Letras	1	5	04D
825031	9	\N	Bachiller Universitario en Historia	1	5	05D
825032	9	\N	Ciclo de Licenciatura en Enseñanza de Lengua y Literatura	1	5	15
825042	6	\N	Curso de Actualización: Clínica de Tasaciones Profundizado. Aspectos Teóricos - Prácticos	6	5	CA053
825033	9	\N	Ciclo de Licenciatura en Español como Lengua Extranjera	1	5	18
825043	6	\N	Curso de Actualización: Introducción al marketing y promoción de servicios y actividades bibliotecarias	6	5	CA055
825034	9	\N	Curso de Formación Profesional: Armado, Configuración y Mantenimiento de Computadoras	1	5	CFP10
825035	9	\N	Curso de Formación Profesional: Enfoques para pensar la práctica educativa	1	5	CFP15
825036	9	\N	Curso de Formación Profesional: La mirada didáctica sobre las disciplinas	1	5	CFP19
491	6	\N	Curso de Posgrado. Derecho Municipal: La Autonomía Municipal y la Participación Ciudadana	6	5	PG004
492	24	\N	Inglés orientado a los negocios, las finanzas y la tecnología	6	5	CINFT
825037	7	\N	Curso de Capacitación en Manejo del Pollo Parrillero	1	5	CA010
825028	9	\N	Ciclo de Licenciatura en Periodismo y Comunicación	1	5	21
104	9	90	Ciclo de Licenciatura en Inglés	1	5	16-D
108	9	92	Ciclo de Licenciatura en Gestión Educativa	1	5	17
825044	6	\N	Curso de Posgrado: La voz de los niños en los procesos judiciales: Derecho Constitucional, Penal, de Familia; aspectos procesales y de fondo	6	5	PG048
825045	6	\N	Curso de Posgrado: Filosofìa y Derecho Penal	6	5	PG047
825046	3	\N	Tecnicatura Universitaria en Automatización y Robótica	1	5	14
350	5	\N	BACHILLER EN CIENCIAS ECONÓMICAS	1	5	0205
825047	6	\N	Curso de Actualización: RIGHTS OF NATURE: Theoretical, practical and interdisciplinary approaches	6	5	CA054
457	4	\N	Ciclo de Licenciatura en Enfermería	3	5	CLEN
825048	9	601	Licenciatura en Inglés	1	5	\N
\.


--
-- Data for Name: tesisdigitales; Type: TABLE DATA; Schema: teleentregas; Owner: teleentregasuser
--

COPY teleentregas.tesisdigitales (id_tesispublicadas, tesista_tipodoc, tesista_numerodoc, tesista_nombres, tesista_apellidos, tesista_nombres_apellidos, tesista_correoe, tesista_telefono, director_nombres, director_apellidos, director_nombres_apellidos, director_correoe, director_telefono, tesis_unidad_academica_id, tesis_unidad_academica_nombre_corto, tesis_carrera_id, tesis_carrera_desc, tesis_titulo, tesis_tipo_autorizacion_cod, tesis_tipo_autorizacion_desc, tesis_fecha_solicitud, tesis_fecha_publicacion_digital, tesis_comentarios_director, tesis_conformidad_director, tesis_fecha_revision_director, tesis_estado_publicacion, tesis_estado_publicacion_desc, tesis_carpeta_ubicacion, tesis_coordenada_uno, tesis_coordenada_dos) FROM stdin;
24	1	32959108	Ariel Hernán	Tomassi	Ariel Hernán Tomassi	ahtomassi@gmail.com	+54 342 4674701	Pablo Andrés	Manavella	Pablo Andrés Manavella	pablomanavella@santafe-conicet.gov.ar	+54 342 4511370	4	FBCB	194	Doctorado en Ciencias Biológicas	Mecanismos de carga, selección y retención de hebras de micro ARNs en plantas.	3	Autoriza después de 2 (dos) años	2020-07-28	2020-07-30	\N	P	\N	A	Publicada	2020-07-28-Tomassi	92	34
23	1	24333342	Paola Silvina	Arce	Paola Silvina Arce	paoarce07@hotmail.com	+54 351 2 626162	María Laura	Bertuzzi	María Laura Bertuzzi	mlba_@hotmail.com	+54 342 6 153005	10	FADU	377	Maestría en Arquitectura	Inserciones Urbanas. Escenarios del espacio colectivo.	1	Autoriza la publicación	2020-07-28	2020-07-29	\N	P	\N	A	Publicada	2020-07-28-Arce	34	29
26	1	36599297	Macarena	Sarli	Macarena Sarli	macarenasarli@live.com.ar	03425234933	María Evangelina	Primo	María Evangelina Primo	primo.maria@inta.gob.ar	3492440125	7	FCV	13658	Doctorado en Ciencias Veterinarias	Producción y evaluación de antígenos recombinantes para el diagnóstico serológico y la generación de vacunas para el control de la anaplasmosis bovina	1	Autoriza la publicación	2020-07-29	2020-07-30	\N	P	\N	A	Publicada	2020-07-29-Sarli	29	75
25	1	33468375	RODRIGO JORGE	LEONARDI	RODRIGO JORGE LEONARDI	rodrileo_89@hotmail.com	0340415519787	JOSUE MIGUEL	HEINRICH	JOSUE MIGUEL HEINRICH	heinrichmiguel@hotmail.com	0342155545414	4	FBCB	194	Doctorado en Ciencias Biológicas	DISEÑO, CARACTERIZACIÓN, MODELADO Y OPTIMIZACIÓN DE FOTOBIORREACTORES DESTINADOS AL CULTIVO DE MICROALGAS Y LA PRODUCCIÓN DE METABOLITOS DE INTERÉS TECNOLÓGICO-BIOLÓGICO.	1	Autoriza la publicación	2020-07-28	2020-07-30	\N	P	\N	A	Publicada	2020-07-28-LEONARDI	20	57
28	1	33218652	Lucía Victoria	Ferrero	Lucía Victoria Ferrero	luferrero@santafe-conicet.gov.ar	3404636799	Daniel Hector	Gonzalez	Daniel Hector Gonzalez	dhgonza@fbcb.unl.edu.ar	3424367083	4	FBCB	194	Doctorado en Ciencias Biológicas	Estudio de los mecanismos de acción de factores de transcripción vegetales de la familia TCP 	1	Autoriza la publicación	2020-07-29	2020-07-30	\N	P	\N	A	Publicada	2020-07-29-Ferrero	55	13
27	1	36478117	SOFIA	RACCA	SOFIA RACCA	sofia.racca@hotmail.com	0340615432915	DANIEL HÉCTOR	GONZÁLEZ	DANIEL HÉCTOR GONZÁLEZ	dhgonza@fbcb.unl.edu.ar	0342154367083	4	FBCB	194	Doctorado en Ciencias Biológicas	EL PAPEL DEL CITOCROMO C EN LA REGULACIÓN DEL METABOLISMO ENERGÉTICO Y EL DESARROLLO EN PLANTAS.	1	Autoriza la publicación	2020-07-29	2020-07-31	\N	P	\N	A	Publicada	2020-07-29-RACCA	10	97
31	1	25106927	Gabriel Leonardo	Cicuttin	Gabriel Leonardo Cicuttin	gcicuttin@gmail.com	01175024042	Santiago	Nava	Santiago Nava	nava.santiago@inta.gob.ar	492440121 int542	7	FCV	13658	Doctorado en Ciencias Veterinarias	Estudio epidemiológico de las garrapatas presentes en un área urbana protegida en la Ciudad Autónoma de Buenos Aires	2	Autoriza después de 1 (un) año	2020-07-30	2020-07-31	\N	P	\N	A	Publicada	2020-07-30-Cicuttin	80	11
30	1	32383048	Daniela	Lamattina	Daniela Lamattina	daniela.lamattina@gmail.com	3757454203	Santiago	Nava	Santiago Nava	nava.santiago@inta.gob.ar	3492440121	7	FCV	13658	Doctorado en Ciencias Veterinarias	Estudio eco-epidemiológico de las garrapatas (Acari: Ixodidae) del norte de Misiones, Argentina	1	Autoriza la publicación	2020-07-29	2020-07-31	\N	P	\N	A	Publicada	2020-07-29-Lamattina	45	21
32	1	34888317	Facundo	Romani	Facundo Romani	romani.facundo@gmail.com	1142332074	Javier Edgardo	Moreno	Javier Edgardo Moreno	javier.moreno@santafe-conicet.gov.ar	33884385	4	FBCB	15	Bioquímica	Estudio funcional de factores de transcripción de la familia HD-Zip clase I en Streptophytas y su rol en los mecanismos moleculares en las respuestas al estrés\r\n	1	Autoriza la publicación	2020-07-30	2020-08-03	\N	P	\N	A	Publicada	2020-07-30-Romani	67	87
34	1	27038927	GASTÓN	FONTANINI	GASTÓN FONTANINI	gastonfontanini@hotmail.com	3425272777	BRUNO ARIEL	REZZOAGLI	BRUNO ARIEL REZZOAGLI	brezzoagli@hotmail.com	3425021250	5	FCE	353	Magister en Administración Pública	BUENA GOBERNANZA EN EL CONTROL ESTATAL: LAS ENTIDADES DE FISCALIZACIÓN SUPERIOR COMO RECEPTORAS DE LA PARTICIPACIÓN CIUDADANA. EL CASO DEL TRIBUNAL DE CUENTAS DE LA PROVINCIA DE SANTA FE	1	Autoriza la publicación	2020-07-31	2020-08-03	\N	P	\N	A	Publicada	2020-07-31-FONTANINI	31	87
29	1	26802114	Ana Laura 	Schaab	Ana Laura  Schaab	anaschaab@hotmail.com	0343- 154550994	Maria Amelia	Migueles	Maria Amelia Migueles	mtalime@gmail.com	0343- 154256909	9	FHUC	825018	Maestría en Didácticas Específicas	La enseñanza de la Geometría en situaciones lùdicas. Un estudio con docentes del Jardín de Infantes de la escuela Normal Jose Maria Torres.	1	Autoriza la publicación	2020-07-29	2020-08-03	\N	P	\N	A	Publicada	2020-07-29-Schaab	81	97
37	5	C317X83XF	Jens	Jung	Jens Jung	1990.jens@gmail.com	+4917655543027	Ludger	Birkendorf	Ludger Birkendorf	mmartin@fce.unl.edu.ar	4571180	5	FCE	24	Bachiller en Ciencias Económicas	The due diligence during a Mergers & acquisition process and the impact of artificial intelligence	3	Autoriza después de 2 (dos) años	2020-08-01	2020-08-04	\N	P	\N	A	Publicada	2020-08-01-Jung	61	22
38	5	C2ZZHGXV5	Nedo Alexander	Bartels	Nedo Alexander Bartels	nedo.a.bartels@outlook.de	+4915902275823	Christian	Aichele	Christian Aichele	mmartin@fce.unl.edu.ar	4571180	5	FCE	355	Maestria en Administración y Finanzas	Geschäftsmodellmatrix – ein Ansatz zur strukturierten Entwicklung und Analyse von Geschäftsmodellen im Kontext digitaler Ökosysteme	3	Autoriza después de 2 (dos) años	2020-08-01	2020-08-04	\N	P	\N	A	Publicada	2020-08-01-Bartels	10	11
39	5	C2XVG02TN	Josef Oswald	Weber	Josef Oswald Weber	josefweber2007@web.de	+49 151 41954028	Marc	Piazolo	Marc Piazolo	mmartin@fce.unl.edu.ar	4571180	5	FCE	355	Maestria en Administración y Finanzas	The Foreign Exchange Risk From The Perspective Of A Bank	4	NO autoriza la publicación	2020-08-01	2020-08-04	\N	P	\N	A	Publicada	2020-08-01-Weber	90	86
33	1	31565017	José Leandro	Dato 	José Leandro Dato 	josedato@gmail.com	3425146438	Fernando	Isuaini	Fernando Isuaini	fisuani@ungs.edu	01144697500	5	FCE	181	Magíster en Administración Pública	Estudio del proceso de cambio organizacional en organismos públicos. Análisis de sus desafíos y condiciones de posibilidad: el caso del Tribunal de Cuentas de la Provincia de Santa de (2015-2019)	1	Autoriza la publicación	2020-07-30	2020-08-04	\N	P	\N	A	Publicada	2020-07-30-Dato 	94	89
40	5	12115473	Malda	El Chalak	Malda El Chalak	malda.el.chalak@gmail.com	+5493424860419	Ludger	Birkendorf	Ludger Birkendorf	mmartin@fce.unl.edu.ar	4571180	5	FCE	355	Maestria en Administración y Finanzas	How to support and stabilize startups in Europe    	3	Autoriza después de 2 (dos) años	2020-08-01	2020-08-06	\N	P	\N	A	Publicada	2020-08-01-El Chalak	58	17
41	1	27004986	Valeria Andrea	Masiello	Valeria Andrea Masiello	masiellovaleria@hotmail.com	342-155002488	Milagros	Rafaghelli	Milagros Rafaghelli	milagrosrafaghelli@gmail.com	343-4156641	9	FHUC	825018	Maestría en Didácticas Específicas	Prácticas evaluativas innovadoras en el Campo de la Formación General del Profesorado de Educación Inicial de la Escuela Normal Superior Nº 32 "General José de San Martín" de la ciudad de Santa Fe durante el año 2017	1	Autoriza la publicación	2020-08-06	2020-08-06	\N	P	\N	A	Publicada	2020-08-06-Masiello	50	13
42	1	27205280	Melina del Carmen	Navarro Huens	Melina del Carmen Navarro Huens	melnahue@hotmail.com	3424055679	Bruno Ariel	Rezzoagli	Bruno Ariel Rezzoagli	brezzoagli@hotmail.com	3425021250	5	FCE	24	Bachiller en Ciencias Económicas	Disfunciones entre las premisas de la Nueva Gerencia Pública y las normas provinciales referidas al control público: el caso de la Empresa Provincial de la Energía 	1	Autoriza la publicación	2020-08-06	2020-08-06	\N	P	\N	A	Publicada	2020-08-06-Navarro Huens	21	17
43	5	AN635408	Nicolás	Ferreira Borrás	Nicolás Ferreira Borrás	nicoferreirab@hotmail.com	93424660753	John Fernando	Múnera	John Fernando Múnera	jmunera@fiq.unl.edu.ar	934244266	2	FIQ	496	Doctorado en Ingeniería Química	Catalizadores en base a cobalto para la producción de hidrógeno a partir de reformado de etanol en reactores no convencionales	3	Autoriza después de 2 (dos) años	2020-08-07	2020-08-10	\N	P	\N	A	Publicada	2020-08-07-Ferreira Borrás	45	14
44	1	32371077	Manuel Alberto	Lopez Saco	Manuel Alberto Lopez Saco	mls3044@gmail.com	0342 155194365	Sebastian	Amut	Sebastian Amut	seba_amut@hotmail.com	0342 154214263	20	FCM	370	Especialización en Medicina Legal	“CARACTERIZACIÓN DE LESIONES AUTOINFLINGIDAS EN UNA POBLACIÓN CARCELARIA DURANTE EL PERIODO 2012 – 2017”.	1	Autoriza la publicación	2020-08-09	2020-08-10	\N	P	\N	A	Publicada	2020-08-09-Lopez Saco	32	64
47	1	30894867	Norma Hortensia	Alvarez	Norma Hortensia Alvarez	nalvarez@fca.unl.edu.ar	03496-15447312	Marcos Gabriel	Derita	Marcos Gabriel Derita	mgderita@hotmail.com	341-5317769	8	FCA	13644	Maestría en Cultivos Intensivos	Estudios agronómicos y bioquímicos para incrementar la obtención de fitoquímicos de importancia económica producidos por el metabolismo secundario de Catharanthus roseus (L.) G. Don	3	Autoriza después de 2 (dos) años	2020-08-12	2020-08-13	\N	P	\N	A	Publicada	2020-08-12-Alvarez	29	93
49	1	35003438	Erik German	Buxmann	Erik German Buxmann	aberdeenerik@gmail.com	+61 0450 566 235	Jonicélia	Araujo Vieira	Jonicélia Araujo Vieira	ldifeoar@yahoo.com.ar	+54 9 3543 55-06	8	FCA	13644	Maestría en Cultivos Intensivos	Respuesta en producción y calidad de dos genotipos comerciales de batata (Ipomoea batatas (L.) LAM) frente a infección con "Encrespamiento Amarillo"	1	Autoriza la publicación	2020-08-14	2020-08-18	\N	P	\N	A	Publicada	2020-08-14-Buxmann	40	36
50	1	31873412	Emmanuel	Angeli	Emmanuel Angeli	emangeli@hotmail.com	3424065305	Hugo	Ortega	Hugo Ortega	hhortega@fcv.unl.edu.ar	3426308277	7	FCV	13658	Doctorado en Ciencias Veterinarias	Relación entre el metabolismo hepático y la reproducción en vacas lecheras de alta producción durante el Período de Transición	2	Autoriza después de 1 (un) año	2020-08-14	2020-08-18	\N	P	\N	A	Publicada	2020-08-14-Angeli	61	94
51	1	23174935	Sebastián Andrés	Amado	Sebastián Andrés Amado	sebastianamado.sa@gmail.com	+54 9 1138109925	María Lelia	Pico	María Lelia Pico	leliapico@hotmail.com	54 9 1134523421	9	FHUC	297	Ciclo de Licenciatura en Inglés	Ideological Stance Disclosed by the Use of Appraisal and Irony in a Film	1	Autoriza la publicación	2020-08-18	2020-08-20	\N	P	\N	A	Publicada	2020-08-18-Amado	34	82
52	1	16573490	María Inés	Ambrosini	María Inés Ambrosini	mariainesambrosini@gmail.com	342-4082023	Norberto Gabriel	Demonte	Norberto Gabriel Demonte	ndemonte@fce.unl.edu.ar	342-5010187	9	FHUC	825019	Maestría en Docencia Universitaria	La evaluación de los aprendizajes en el área de costos de la Facultad de Ciencias Económicas de la Universidad Nacional del Litoral: la vinculación existente entre las teorías del proceso de enseñanza y aprendizaje con los enfoques de la evaluación 	1	Autoriza la publicación	2020-08-18	2020-08-20	\N	P	\N	A	Publicada	2020-08-18-Ambrosini	46	88
53	1	95176809	Nancy Cecilia	Cabana García	Nancy Cecilia Cabana García	fisicabana@gmail.com	3424062035	Pablo Guillermo	Bolcatto	Pablo Guillermo Bolcatto	pbolcato@gmail.com	3426150836	4	FBCB	196	Doctorado en Física	Adsorción de hidrocarburos y óxidos de carbono en materiales silicoaluminados microporosos	1	Autoriza la publicación	2020-08-20	2020-08-24	\N	P	\N	A	Publicada	2020-08-20-CabanaGarcía	38	71
54	5	C8VMKWGG0	Saskia Alisa	Wacker	Saskia Alisa Wacker	saskiawacker@outlook.com	+4972233857	Walter	Ruda	Walter Ruda	mmartin@fce.unl.edu.ar	4571180	5	FCE	355	Maestria en Administración y Finanzas	An Investigation of China’s Expansion and Influence in Latin America	4	NO autoriza la publicación	2020-08-21	2020-08-24	\N	P	\N	A	Publicada	2020-08-21-Wacker	78	68
55	1	32059464	Nicolás	Cantard	Nicolás Cantard	nico_cantard@yahoo.com.ar	+34674400591	Fernando	Molina Fernández	Fernando Molina Fernández	fernando.molina@uam.es	+34914978063	6	FCJS	407	Maestría en Derecho Penal	“Sistema de justificación y situaciones límite. Una aproximación al estado de necesidad justificante en colisión de bienes de igual jerarquía”	2	Autoriza después de 1 (un) año	2020-08-24	2020-08-25	\N	P	\N	A	Publicada	2020-08-24-Cantard	43	55
56	1	28017261	María Soledad	Alvarez	María Soledad Alvarez	soledadalvarez261@gmail.com	3425500005	Marcelo	Alvarez Cavia	Marcelo Alvarez Cavia	marceloalvarez45@gmail.com	3424783531	5	FCE	352	Maestría en Administración de Empresas	Propuesta de mejora en la gestión de administración del canal de venta Consignación para una empresa elaboradora y comercializadora de bebidas	1	Autoriza la publicación	2020-08-26	2020-08-27	\N	P	\N	A	Publicada	2020-08-26-Alvarez	56	39
57	1	31167715	Walter Alcides	Segovia Salazar	Walter Alcides Segovia Salazar	segoviawalter03@hotmail.com	388-5021681	Alfredo Luis	Pais	Alfredo Luis Pais	alfredopais52@gmail.com	387-5702100	8	FCA	13646	Maestría en Extensión Agropecuaria	EL PROCESO DE ADOPCIÓN TECNOLÓGICA EN PRODUCTORES TABACALEROS. EL CASO DEL CONTROL DEL AMARILLAMIENTO DEL TABACO EN EXPLOTACIONES DE PRODUCTORES FAMILIARES DEL DEPARTAMENTO GÜEMES, SALTA.	1	Autoriza la publicación	2020-08-26	2020-08-28	\N	P	\N	A	Publicada	2020-08-26-SegoviaSalazar	44	94
58	1	34651079	Emilia	Huber	Emilia Huber	emilia.huber@icivet.unl.edu.ar	3496545563	Florencia	Rey	Florencia Rey	frey@fcv.unl.edu.ar	3496658333	7	FCV	13658	Doctorado en Ciencias Veterinarias	Influencia de factores ambientales sobre la programación fetal de vacas lecheras. Efectos sobre la fertilidad de la progenie y su relación con la modulación del receptor de glucocorticoides.	1	Autoriza la publicación	2020-08-31	2020-08-31	\N	P	\N	A	Publicada	2020-08-31-Huber	45	86
59	1	35101383	MARIA JOSEFINA	MASOLA	MARIA JOSEFINA MASOLA	josefinamasola@gmail.com	3404593357	SILVIA DEL CARMEN	IMHOFF	SILVIA DEL CARMEN IMHOFF	imhoff.silvia@gmail.com	3496448396	8	FCA	13647	Doctorado en Ciencias Agrarias	PROPAGACIÓN LATERAL DE LA COMPACTACIÓN POR TRÁNSITO DE LA MAQUINARIA AGRÍCOLA: ¿AFECTA LA CALIDAD DEL SUELO, EL INTERCAMBIO GASEOSO Y LA PRODUCTIVIDAD DE LOS CULTIVOS?	1	Autoriza la publicación	2020-08-31	2020-09-01	\N	P	\N	A	Publicada	2020-08-31-MASOLA	41	60
61	1	35024588	Antonela Estefanía	Cereijo Tórtul	Antonela Estefanía Cereijo Tórtul	antonelacereijo@gmail.com	03482-15501484	Alberto Álvaro	Iglesias	Alberto Álvaro Iglesias	iglesias@fbcb.unl.edu.ar	342-4511370	4	FBCB	194	Doctorado en Ciencias Biológicas	Regulación de la síntesis de glucógeno en bacterias: hacia un entendimiento de las bases moleculares de la catálisis y la regulación de la ADP-glucosa pirofosforilasa de organismos Gram-positivos	3	Autoriza después de 2 (dos) años	2020-09-02	2020-09-03	\N	P	\N	A	Publicada	2020-09-02-CereijoTórtul	71	34
63	1	33656527	Luisina Delma	Demonte	Luisina Delma Demonte	luisinademonte@gmail.com	03497-15405861	Horacio Ramón	Beldoménico	Horacio Ramón Beldoménico	horacio.beldomenico@gmail.com	0342-154234801	2	FIQ	495	Doctorado en Química	Estudio de métodos alternativos para la determinación de glifosato y otros plaguicidas de solución analítica compleja en matrices ambientales y alimentarias de interés prioritario regional	2	Autoriza después de 1 (un) año	2020-09-03	2020-09-04	\N	P	\N	A	Publicada	2020-09-03-Demonte	57	79
64	1	31507085	María Belén	Novoa	María Belén Novoa	mbelennovoa@hotmail.com	0346259774	María Evangelina	Primo	María Evangelina Primo	primo.maria@inta.gob.ar	3492643517	7	FCV	13658	Doctorado en Ciencias Veterinarias	Diagnóstico y prevención de la neosporosis bovina. Desarrollo de técnicas serológicas y evaluación de inmunógenos basados en proteínas recombinantes	1	Autoriza la publicación	2020-09-03	2020-09-04	\N	P	\N	A	Publicada	2020-09-03-Novoa	30	84
66	1	30458126	Fani AyelÉn	Grosso	Fani AyelÉn Grosso	faniagrosso@gmail.com	3498 608175	María Amelia 	Migueles	María Amelia  Migueles	mtalime@gmail.com	343 4256909	9	FHUC	825018	Maestría en Didácticas Específicas	"Entre instituciones...la formación de los alumnos del Profesorado en Artes Visuales en los espacios de la práctica".	1	Autoriza la publicación	2020-09-03	2020-09-04	\N	P	\N	A	Publicada	2020-09-03-Grosso	60	70
67	1	22620590	Sara Catalina	Carrizo Patai	Sara Catalina Carrizo Patai	saracatalinacarrizo@gmail.com	3425462953	Felicitas	Acosta	Felicitas Acosta	acostafelicitas@gmail.com	91144215485	9	FHUC	825023	Maestría en Políticas Públicas para la Educación	¿QUÉ DEBE APRENDER EL QUE ENSEÑA?\r\nCambios y continuidades en la política de Formación Docente Continua en la provincia de Santa Fe en el período 2007/2017.\r\n	1	Autoriza la publicación	2020-09-08	2020-09-10	\N	P	\N	A	Publicada	2020-09-08-CarrizoPatai	54	73
68	1	18514919	Norma Noemi	Galarza	Norma Noemi Galarza	normagalarza18@hotmail.com.ar	3491418456	Marcela	Covarrubias	Marcela Covarrubias	marcecovarrubias79@gmail.com	3425134260	9	FHUC	825023	Maestría en Políticas Públicas para la Educación	Hablemos de Dislexia. Intervenciones para una Educación Inclusiva en la Escuela Primaria Jose Manuel Estrada de Tostado, Provincia de Santa Fe	1	Autoriza la publicación	2020-09-08	2020-09-14	\N	P	\N	A	Publicada	2020-09-08-Galarza	74	61
69	1	26789179	Martín Julián	Calvet	Martín Julián Calvet	martinjucalvet@hotmail.com	03425491661	Pascual	Pimpinella 	Pascual Pimpinella 	pimpinella.pascual@gmail.com	03425460054	20	FCM	370	Especialización en Medicina Legal	Caracterización de las Autopsias Médico-Legales realizadas en la Morgue Judicial de Santa Fe en los períodos 2010-2011 y 2013-2015.	1	Autoriza la publicación	2020-09-12	2020-09-16	\N	P	\N	A	Publicada	2020-09-12-Calvet	34	23
70	1	35870750	Danisa María Luján	Ferrero	Danisa María Luján Ferrero	ferrerodanisa@gmail.com	+5493424309587	Alberto Álvaro	Iglesias	Alberto Álvaro Iglesias	aaiglesias@gmail.com	+543424511370	4	FBCB	194	Doctorado en Ciencias Biológicas	SOBRE EL METABOLISMO DEL CARBONO EN CÉLULAS AUTÓTROFAS Y HETERÓTROFAS DE PLANTAS. Caracterización de mecanismos de regulación de enzimas claves para la partición del carbono fotoasimilado\r\n	1	Autoriza la publicación	2020-09-22	2020-09-23	\N	P	\N	A	Publicada	2020-09-22-Ferrero	14	16
71	1	31468751	Maximiliano Anibal	Delssin 	Maximiliano Anibal Delssin 	maximiliano.delssin.castiglioni@gmail.co	03482 15649037	Emiliano 	Avila Castro	Emiliano  Avila Castro	eavilacastro@hotmail.com	0342 154425422	20	FCM	370	Especialización en Medicina Legal	“ANALISIS DE LAS MUERTES POR SUICIDIO EN PERSONAS JOVENES EN EL NORTE DE LA PROVINCIA DE SANTA FE”	1	Autoriza la publicación	2020-09-23	2020-09-23	\N	P	\N	A	Publicada	2020-09-23-Delssin	31	31
72	1	22361138	Verónica	Reus	Verónica Reus	vreus@fcm.unl.edu.ar	03424232475	Larisa Ivon	Carrera	Larisa Ivon Carrera	carreralarisa@gmail.com	03425012752	9	FHUC	825019	Maestría en Docencia Universitaria	ESTILOS DE APRENDIZAJE DE LOS ESTUDIANTES DE LA DISCIPLINA BIOLOGIA CELULAR, HISTOLOGIA Y EMBRIOLOGÍA MÉDICA.\r\nPROCESOS Y FORMAS DE APRENDIZAJES EN EL MARCO DE UN CURRICULUM INNOVADOR DE LA EDUCACIÓN MÉDICA.\r\n	3	Autoriza después de 2 (dos) años	2020-09-24	2020-09-25	\N	P	\N	A	Publicada	2020-09-24-Reus	89	31
73	1	23358373	María Verónica	Lanzaro	María Verónica Lanzaro	mvlanzaro@yahoo.com	3426126396	Mónica Patricia	D Elia	Mónica Patricia D Elia	mdelia@fich.unl.edu.ar	3424304687	3	FICH	203	Maestría en Gestión Ambiental	El agua subterránea como condicionante ambiental de construcciones subterráneas en áreas urbanas. El caso de la ciudad de Santa Fe, Provincia de Santa Fe, Argentina	4	NO autoriza la publicación	2020-09-24	2020-09-25	\N	P	\N	A	Publicada	2020-09-24-Lanzaro	16	24
74	1	34093223	Julia Magali	Ibañez	Julia Magali Ibañez	ibanez.magali@inta.gob.ar	3794772143	Veronica Gabriela 	Obregon	Veronica Gabriela  Obregon	obregon.veronica@inta.gob.ar	3777538998	8	FCA	13644	Maestría en Cultivos Intensivos	IDENTIFICACIÓN Y CARACTERIZACIÓN DE AISLAMIENTOS DE PYTHIUM Y PHYTOPHTHORA DE CULTIVOS INTENSIVOS EN LA PROVINCIA DE CORRIENTES	3	Autoriza después de 2 (dos) años	2020-09-28	2020-09-29	\N	P	\N	A	Publicada	2020-09-28-Ibañez	70	85
75	1	17476790	Sandra Mariela	Chavepeyre	Sandra Mariela Chavepeyre	marielachavepeyre@gmail.com	3435111589	Maria Del Rosario	Badano	Maria Del Rosario Badano	badanorosario@gmail.com	3434195906	9	FHUC	825018	Maestría en Didácticas Específicas	Configuraciones del Hacer Lúdico en la Didáctica del Jardín de Infantes	1	Autoriza la publicación	2020-09-29	2020-10-05	\N	P	\N	A	Publicada	2020-09-29-Chavepeyre	17	10
76	1	35650381	Luciana	Melchiori	Luciana Melchiori	luchimelchiori@gmail.com	3426305068	Gladis Guadalupe	Pradolini	Gladis Guadalupe Pradolini	gladis.pradolini@gmail.com	3425306652	2	FIQ	498	Doctorado en Matemática	Continuidad de operadores del Análisis Armónico en espacios de Zygmund generalizados	1	Autoriza la publicación	2020-10-19	2020-10-20	\N	P	\N	A	Publicada	2020-10-19-Melchiori	39	82
77	1	95363826	Lilian Celeste 	Alarcón Segovia	Lilian Celeste  Alarcón Segovia	licearse@gmail.com	3425273036	Ignacio 	Rintoul	Ignacio  Rintoul	irintoul@santafe-conicet.gov.ar	342 4511595	4	FBCB	194	Doctorado en Ciencias Biológicas	Microbioelectrónica basada en nanomateriales: Microchip Tattoo and Skin Sensors	4	NO autoriza la publicación	2020-10-19	2020-10-22	\N	P	\N	A	Publicada	2020-10-19-AlarcónSegovia	79	81
78	1	30141757	Guillermo Oscar	Miranda	Guillermo Oscar Miranda	guillemiranda83@hotmail.com	0343-154747682	Enrique	Camussi	Enrique Camussi	ecamussi@arnet.com.ar	0351-155642152	5	FCE	352	Maestría en Administración de Empresas	Diseño de un Tablero de Control para la Gerencia de Distribución de una Distribuidora Eléctrica	3	Autoriza después de 2 (dos) años	2020-10-21	2020-10-22	\N	P	\N	A	Publicada	2020-10-21-Miranda	19	15
79	1	30879560	Romina	Ciaccio	Romina Ciaccio	romiciaccio@hotmail.com	3416717863	Pascual	Pimpinella	Pascual Pimpinella	pimpinella.pascual@gmail.com	3424575120	20	FCM	370	Especialización en Medicina Legal	Identidad biológica y paternidad, la puja de dos derechos que llama a la reflexión. Encuesta de opinión que plantea el tema.	1	Autoriza la publicación	2020-10-21	2020-10-26	\N	P	\N	A	Publicada	2020-10-21-Ciaccio	26	70
82	5	C36FVW1JL	Julian	Feß	Julian Feß	jufe0007@stud.hs-kl.de	+5415111557976	Karl-wilhelm	Giersberg	Karl-wilhelm Giersberg	mmartin@fce.unl.edu.ar	+543424571180	5	FCE	355	Maestria en Administración y Finanzas	Implementation of an Environmental, Social and Governance Rating in Business Valuations	3	Autoriza después de 2 (dos) años	2020-10-27	\N	\N	P	\N	P	Pendiente	2020-10-27-Feß	39	16
83	5	BJ8082587	Liza	Xhaxho	Liza Xhaxho	lixh0001@stud.hs-kl.de	+491799326190	Christine 	Arend-fuchs	Christine  Arend-fuchs	mmartin@fce.unl.edu.ar	+543424571180	5	FCE	355	Maestria en Administración y Finanzas	Customer Experience Management as a key factor for customer satisfaction & business growth	3	Autoriza después de 2 (dos) años	2020-10-27	\N	\N	P	\N	P	Pendiente	2020-10-27-Xhaxho	20	94
81	5	EI3644578	Liqin	Liu	Liqin Liu	lili0006@stud.hs-kl.de	+4915788924770	Ludger	Birkendorf	Ludger Birkendorf	mmartin@fce.unl.edu.ar	+543424571180	5	FCE	355	Maestria en Administración y Finanzas	Economic Reasons of Chinese Merger and Acquisition in Germany: A Takeover between Midea Group and KUKA AG	3	Autoriza después de 2 (dos) años	2020-10-27	2020-10-28	\N	P	\N	A	Publicada	2020-10-27-Liu	19	75
80	1	36099579	Ana Gabriela	Enderle	Ana Gabriela Enderle	anagenderle@gmail.com	3434382882	María Julia 	Culzoni	María Julia  Culzoni	juliaculzoni@gmail.com	0342575216int190	2	FIQ	506	Doctorado en Energía y Materiales Avanzados	Nuevos materiales iónicos basados en polioxometalatos con actividad frente a microorganismos patógenos	3	Autoriza después de 2 (dos) años	2020-10-27	2020-10-29	\N	P	\N	A	Publicada	2020-10-27-Enderle	43	43
84	1	24300403	Leandro Damián	Ríos	Leandro Damián Ríos	lrios@fcjs.unl.edu.ar	03436210429	Jorge Amilcar Luciano	García	Jorge Amilcar Luciano García	coque.al.garcia@gmail.com	03434722777	6	FCJS	58	Abogacía	“Estudios propedéuticos sobre el delito de financiamiento ilícito de los partidos políticos. Análisis de las relaciones concursales y de derecho comparado” 	2	Autoriza después de 1 (un) año	2020-10-27	2020-10-28	\N	P	\N	A	Publicada	2020-10-27-Ríos	31	23
85	1	30961822	María Laura	Godoy	María Laura Godoy	mgodoy@fiq.unl.edu.ar	3425203259	Viviana Guadalupe	Milt	Viviana Guadalupe Milt	vmilt@fiq.unl.edu.ar	3426312380	2	FIQ	497	Doctorado en Tecnología Química	Desarrollo de monolitos catalíticos de mallas metálicas apiladas para la eliminación de contaminantes provenientes de motores diésel	1	Autoriza la publicación	2020-10-28	2020-11-02	\N	P	\N	A	Publicada	2020-10-28-Godoy	72	13
87	1	31628153	Paola Marisel	Gabriel	Paola Marisel Gabriel	pgabriel@fca.unl.edu.ar	3424076182	Marcela Alejandra 	Buyatti	Marcela Alejandra  Buyatti	mbuyatti@fca.unl.edu.ar	3496466635	8	FCA	13647	Doctorado en Ciencias Agrarias	EVALUACIÓN DE TÉCNICAS PARA SUPERAR LAS LIMITACIONES IMPUESTAS POR LA TEMPERATURA SOBRE LA PRODUCCIÓN DE PLANTINES DE LISIANTHUS [Eustoma grandiflorum Raf.(Shinn)]	1	Autoriza la publicación	2020-11-04	2020-11-04	\N	P	\N	A	Publicada	2020-11-04-Gabriel	24	79
88	1	28973662	Ignacio	Schmidhalter	Ignacio Schmidhalter	ischmidhalter@santafe-conicet.gov.ar	3424363435	Pio Antonio	Aguirre	Pio Antonio Aguirre	paguir@santafe-conicet.gov.ar	3424326551	2	FIQ	506	Doctorado en Energía y Materiales Avanzados	Modelado fenomenológico y diseño optimo de celdas de combustible tipo PEM de baja temperatura	1	Autoriza la publicación	2020-11-05	2020-11-08	\N	P	\N	A	Publicada	2020-11-05-Schmidhalter	35	75
91	1	93258253	Agustina	Sánchez	Agustina Sánchez	agusanchez8@gmail.com	3426396352	Viviana Guadalupe	Milt	Viviana Guadalupe Milt	vmilt@fiq.unl.edu.ar	3424606899 	2	FIQ	506	Doctorado en Energía y Materiales Avanzados	Aplicación de catalizadores basados en fibras a reacciones en fase gas – modelado y experimentación	2	Autoriza después de 1 (un) año	2020-11-09	2020-11-10	\N	P	\N	A	Publicada	2020-11-09-Sánchez	33	71
90	1	35127702	Marcos Sebastián	Tacca	Marcos Sebastián Tacca	marcos.tacca@gmail.com	3426396358	Edith Catalina	Goldberg	Edith Catalina Goldberg	edith.goldberg@santafe-conicet.gov.ar	3424559175	2	FIQ	506	Doctorado en Energía y Materiales Avanzados	Modelos de correlación electrónica multiorbital para describir sistemas interactuantes átomo-superficie en y fuera del equilibrio	2	Autoriza después de 1 (un) año	2020-11-09	2020-11-10	\N	P	\N	A	Publicada	2020-11-09-Tacca	51	34
86	1	28135880	Vanesa Julieta	Bangert	Vanesa Julieta Bangert	vjbangert@gmail.com	0342 154462715	Erica	Fernández	Erica Fernández	erica82fernandez@gmail.com	0342 156149197	5	FCE	182	Master en Administración de Empresas con mención en Dirección de Negocios	Gestión de la Capacidad Estratégica en Industrias Frigoríficas Porcinas de Santa Fe.	1	Autoriza la publicación	2020-11-02	2020-11-22	\N	P	\N	A	Publicada	2020-11-02-Bangert	94	32
89	1	21578619	Patricia Sandra	Cafaro	Patricia Sandra Cafaro	patriciacafaro70@gamil.com	0342 4741601	Marta Cristina	Crivelli	Marta Cristina Crivelli	martacrivellii@gmail.com	341 6172555	9	FHUC	825023	Maestría en Políticas Públicas para la Educación	La Evaluación como posibilidad. Un estudio de caso sobre Evaluación de los Aprendizajes desde las Ciencias Naturales en la escuela Primaria.	1	Autoriza la publicación	2020-11-08	2020-11-10	\N	P	\N	A	Publicada	2020-11-08-Cafaro	60	21
92	1	35092078	Esteban Mario	Gianfelici	Esteban Mario Gianfelici	estebanmg09@hotmail.com	342-4228987	Roxana	Dreher	Roxana Dreher	roxdreher@hotmail.com	342-5017053	10	FADU	17	Arquitectura	ENERGÍA.\r\nCERTIFICACIÓN DEL NIVEL DE EFICIENCIA ENERGÉTICA DE LOS INMUEBLES.\r\nUN VALOR AGREGADO A LAS PROPIEDADES EN LA PROVINCIA DE SANTA FE.	1	Autoriza la publicación	2020-11-11	\N	\N	P	\N	P	Pendiente	2020-11-11-Gianfelici	61	88
93	1	34827489	Federico	Karp	Federico Karp	federicokarp@gmail.com	0342155306386	Diana Alejandra 	Estenoz	Diana Alejandra  Estenoz	diana.estenoz@gmail.com	0342155010818	4	FBCB	194	Doctorado en Ciencias Biológicas	LIBERACIÓN CONTROLADA DE FLORFENICOL\r\nDESDE MATRICES POLIMÉRICAS BIODEGRADABLES	1	Autoriza la publicación	2020-11-11	2020-11-13	\N	P	\N	A	Publicada	2020-11-11-Karp	34	86
94	1	34650991	Ana Laura	Pérez	Ana Laura Pérez	laura24_89@hotmail.com	3434611359	Carlos Dante	Brondino	Carlos Dante Brondino	brondino@fbcb.unl.edu.ar	3424214611	4	FBCB	194	Doctorado en Ciencias Biológicas	Estudio de propiedades electrónicas e interacciones magnéticas en complejos metálicos paramagnéticos	1	Autoriza la publicación	2020-11-13	2020-11-16	\N	P	\N	A	Publicada	2020-11-13-Pérez	60	37
95	1	12351607	Graciela Elena	Godoy	Graciela Elena Godoy	gracielagodoygg@gmail.com	0342154055350	Virginia	Trevignani	Virginia Trevignani	vtrevignani@fhuc.unl.edu.ar	0342156109838	9	FHUC	825023	Maestría en Políticas Públicas para la Educación	La interrupción temprana de trayectorias educativas en la educación para adultos. El caso de la EEMPA N° 1328 "Alicia López" (Santa Fe)	1	Autoriza la publicación	2020-11-16	2020-11-17	\N	P	\N	A	Publicada	2020-11-16-Godoy	89	22
96	1	33284123	María Soledad	Andrade Díaz	María Soledad Andrade Díaz	soleandradediaz@gmail.com	+5493876055714	Juan Manuel	Díaz Gómez	Juan Manuel Díaz Gómez	jmandarwin@gmail.com	+5493875061364	4	FBCB	194	Doctorado en Ciencias Biológicas	Áreas prioritarias para la conservación de la herpetofauna y su aplicación en el Ordenamiento Territorial de bosques en las provincias de Salta y Jujuy 	1	Autoriza la publicación	2020-11-16	2020-11-17	\N	P	\N	A	Publicada	2020-11-16-AndradeDíaz	55	60
97	1	36710994	Ana Julia	Seimandi	Ana Julia Seimandi	anaseimandi@hotmail.com	342-4633420	Osvaldo Agustín	Marcón	Osvaldo Agustín Marcón	osvaldomarcon@gmail.com	0000000000	6	FCJS	58	Abogacía	Perspectiva socioeducativa: el Programa Libertad Asistida en la ciudad de Santa Fe según la mirada de algunos actores	1	Autoriza la publicación	2020-11-16	2020-11-18	\N	P	\N	A	Publicada	2020-11-16-Seimandi	22	27
98	1	36001356	María De Los Ángeles	Vicens	María De Los Ángeles Vicens	angi_vicens@hotmail.com	342-4679578	María Soledad 	Schmunk	María Soledad  Schmunk	ssolemaria@gmail.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Medicinas Terapéuticas en el Hospital Iturraspe de la ciudad de Santa Fe	1	Autoriza la publicación	2020-11-16	2020-11-18	\N	P	\N	A	Publicada	2020-11-16-Vicens	90	88
99	1	39052413	María Celeste	Dutruel	María Celeste Dutruel	celedutruel@hotmail.com	3496510843	Sergio	Peralta	Sergio Peralta	sergio.dl.peralta@gmail.com	3424781487	6	FCJS	301	Licenciatura en Trabajo Social	Acoso Sexual Callejero. Un análisis de las posiciones discursivas en Ni Una Menos en Santa Fe	1	Autoriza la publicación	2020-11-16	2020-11-18	\N	P	\N	A	Publicada	2020-11-16-Dutruel	91	87
100	1	34650909	Gisel Andrea	Longoni	Gisel Andrea Longoni	chechelemelina@gmail.com	349-6529391	Rita	Masi Sañudo	Rita Masi Sañudo	ritamasisaudo@yahoo.com.ar	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Programas de Transferencias Condicionadas de Ingreso. El caso de la Asignación Universal por Hijo para Protección Social (AUH)	1	Autoriza la publicación	2020-11-16	2020-11-18	\N	P	\N	A	Publicada	2020-11-16-Longoni	71	48
101	1	37300751	Carolina	Moreira	Carolina Moreira	caromoreira2014@gmail.com	0000000000	Augusto	Montero	Augusto Montero	augusto_montero@yahoo.com.ar	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Voces detrás de los muros: concepciones y experiencias educativas en la prisión	1	Autoriza la publicación	2020-11-17	2020-11-18	\N	P	\N	A	Publicada	2020-11-17-Moreira	81	84
102	1	37445618	María Romina	Rojas	María Romina Rojas	rojas.mromina@gmail.com	0000000000	Augusto	Montero	Augusto Montero	augusto_montero@yahoo.com.ar	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Voces detrás de los muros: concepciones y experiencias educativas en la prisión	1	Autoriza la publicación	2020-11-17	2020-11-18	\N	P	\N	A	Publicada	2020-11-17-Rojas	91	28
103	1	38981237	Tatiana	Porporatto	Tatiana Porporatto	tati.porporatto@hotmail.com	0000000000	Alicia	Serafino	Alicia Serafino	ma_alicias@hotmail.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	La construcción de la identidad transterritorial de las comunidades gitanas residentes en Paraná, Santa Fe y Rafaela durante los años 2017 y 2018	1	Autoriza la publicación	2020-11-17	2020-11-19	\N	P	\N	A	Publicada	2020-11-17-Porporatto	63	50
107	1	30173545	Agustin Ricardo 	Quadrelli	Agustin Ricardo  Quadrelli	agustinquadrelli@hotmail.com	0346415445974	Roberto 	Scotta	Roberto  Scotta	rrscotta@fca.unl.edu.ar	03424902183	8	FCA	13643	Especialización en Cultivos Intensivos	MÉTODOS PARA EL CONTROL DE MALEZAS EN DURAZNERO	2	Autoriza después de 1 (un) año	2020-11-18	\N	\N	P	\N	P	Pendiente	2020-11-18-Quadrelli	56	40
104	1	31076794	María Del Valle	Bácerez	María Del Valle Bácerez	mvbacerez@gmail.com	342-4854840	Ludmila 	Risso	Ludmila  Risso	ludmilarizzo05@live.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Los Hilos de las rondas. Resignificaciones de género, modalidades de participación y procesos organizativos en un grupo de mujeres de la comunidad Mocoví Com Caia de la ciudad de Recreo	1	Autoriza la publicación	2020-11-17	2020-11-19	\N	P	\N	A	Publicada	2020-11-17-Bácerez	70	18
105	1	34678752	María Bettina	Stivanello	María Bettina Stivanello	bettinastivanello@live.com.ar	342-5202324	Carmen Ines	Lera	Carmen Ines Lera	carmenineslera@yahoo.com.ar	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Concepciones y sentidos de la participación social en salud	1	Autoriza la publicación	2020-11-17	2020-11-19	\N	P	\N	A	Publicada	2020-11-17-Stivanello	26	93
106	1	34172884	Fátima	Supertino	Fátima Supertino	fatimasupertino@gmail.com	0000000000	Fernando Ignacio	Reyero	Fernando Ignacio Reyero	fernandoreyero@hotmail.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Centro de Permanencia Transitoria “El refugio”: Intervenciones en la Provincia de Santa Fe en relación a niños y niñas en situación de calle	1	Autoriza la publicación	2020-11-17	2020-11-22	\N	P	\N	A	Publicada	2020-11-17-Supertino	23	71
110	1	28173155	María Florencia 	Burgi	María Florencia  Burgi	mfburgi@gmail.com	0342-156115310	Javier	Lottersberger	Javier Lottersberger	javierl@unl.edu.ar	0342-155502757	4	FBCB	454	Especialización en vinculación y gestión tecnológica	Creación de un sistema de vinculación tecnológica con enfoque territorial	1	Autoriza la publicación	2020-11-21	2020-11-25	\N	P	\N	A	Publicada	2020-11-21-Burgi	84	45
111	1	29668972	Gisela Haydée	Dioguardi	Gisela Haydée Dioguardi	gijidioguardi@hotmail.com	1155928474	Oscar Edgardo	Rivera	Oscar Edgardo Rivera	oerivera@yahoo.com	1136734911	4	FBCB	200	Maestría en Salud Ambiental	Efectos de la exposición neonatal a un formulado de glifosato sobre el ovario de la oveja (Ovis aries)	1	Autoriza la publicación	2020-11-22	2020-11-25	\N	P	\N	A	Publicada	2020-11-22-Dioguardi	25	59
109	1	31848704	Trilce Irupé	Castillo	Trilce Irupé Castillo	trilcecastillo@gmail.com	0341152544111	Claudio Rafael Mariano	Baigún	Claudio Rafael Mariano Baigún	cbaigun@gmail.com	0111565175430	4	FBCB	194	Doctorado en Ciencias Biológicas	APLICACION DEL CONOCIMIENTO ECOLOGICO DE LOS PESCADORES Y SU CONTEXTO ECOSISTEMICO PARA LA EVALUACION DE LA SOSTENIBILIDAD DE LAS PESQUERIAS ARTESANALES DEL RIO PARANA (ARGENTINA)	3	Autoriza después de 2 (dos) años	2020-11-20	2020-11-25	\N	P	\N	A	Publicada	2020-11-20-Castillo	42	65
108	1	33664899	Daiana Magalí	Macedo	Daiana Magalí Macedo	daiana_macedo@hotmail.com	0342-155947653	Guillermo Manuel	García-effron	Guillermo Manuel García-effron	ggarcia@unl.edu.ar	0343-155171135	4	FBCB	194	Doctorado en Ciencias Biológicas	14 alfa Esterol Demetilasa de Rhizopus arrhizus (syn. Rhizopus oryzae): Participación en la Resistencia Natural a Voriconazol	1	Autoriza la publicación	2020-11-20	2020-11-22	\N	P	\N	A	Publicada	2020-11-20-Macedo	23	46
112	1	29911560	Verónica Paula	Gómez	Verónica Paula Gómez	veronicapgomez@yahoo.com.ar	+543425777388	Analía Isabel	Gerbaudo	Analía Isabel Gerbaudo	analiagerbaudo71@yahoo.com.ar	+5493425388879	9	FHUC	825022	Doctorado en Humanidades	Domicilios de la literatura digital: de la idea de Nación a la de interzona en ELO (Electronic Literature Organization)	1	Autoriza la publicación	2020-12-01	2020-12-03	\N	P	\N	A	Publicada	2020-12-01-Gómez	82	83
113	1	33174025	Santiago Matías	Ruatta Merke	Santiago Matías Ruatta Merke	ruattasantiago@hotmail.com	+543492661203	Marcelo César	Murguía	Marcelo César Murguía	mmurguia@santafe-conicet.gov.ar	+543425513441	4	FBCB	194	Doctorado en Ciencias Biológicas	Desarrollo de nuevos ectoparasiticidas basados en pirazoles fluorados para aplicación tópica veterinaria	1	Autoriza la publicación	2020-12-01	2020-12-04	\N	P	\N	A	Publicada	2020-12-01-RuattaMerke	28	10
114	1	23228200	Lisandro Pedro	Aguirre	Lisandro Pedro Aguirre	lisandropedroaguirre@gmail.com	3424457666	Sebastián José	Amadeo	Sebastián José Amadeo	samadeo12@gmail.com	3424 32-0430	6	FCJS	407	Maestría en Derecho Penal	La determinación de la pena en el nuevo sistema penal de Santa Fe. Un análisis de la argumentación judicial en las primeras sentencias del nuevo sistema penal oral santafesino (febrero 2014 - junio 2019)	1	Autoriza la publicación	2020-12-05	2020-12-09	\N	P	\N	A	Publicada	2020-12-05-Aguirre	28	45
116	1	37396305	María Teresa	Tempo	María Teresa Tempo	mttempo.20@hotmail.com	3424297045	Cecilia	Rambaudo	Cecilia Rambaudo	crambaudo@gmail.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	La feminización del Trabajo Social en los inicios de su profesionalización, Santa Fe en los años 40	1	Autoriza la publicación	2020-12-09	2020-12-10	\N	P	\N	A	Publicada	2020-12-09-Tempo	48	36
115	1	35751427	Ayelén	Bravín	Ayelén Bravín	ayelenbravin@gmail.com	3466518836	Indiana Esther	Vallejos	Indiana Esther Vallejos	indiana_vallejos@yahoo.com.ar	3425132802	6	FCJS	301	Licenciatura en Trabajo Social	Las representaciones sociales que construyen personas con discapacidad acerca del trabajo	1	Autoriza la publicación	2020-12-09	2020-12-10	\N	P	\N	A	Publicada	2020-12-09-Bravín	50	41
137	1	31880826	Ramiro	Alarcón	Ramiro Alarcón	ralarcon@fbcb.unl.edu.ar	4575207	Enrique Hugo	Luque	Enrique Hugo Luque	eluque@fbcb.unl.edu.ar	4575207	4	FBCB	194	Doctorado en Ciencias Biológicas	Exposición posnatal a agroquímicos sobre el desarrollo y la diferenciación del útero	1	Autoriza la publicación	2020-12-30	2020-01-02	\N	P	\N	A	Publicada	2020-12-30-Alarcón	96	60
117	1	20189811	Laura Yolanda	Wagner	Laura Yolanda Wagner	lauriwagner.1702@gmail.com	0343-6210142	Fabián Rubén	Mónaco	Fabián Rubén Mónaco	monaco.fabian@gmail.com	0342-6100802	9	FHUC	825018	Maestría en Didácticas Específicas	Las creencias de los docentes acerca de la enseñanza de la comprensión oral en la clase de portugués lengua extranjera en la educación secundaria	1	Autoriza la publicación	2020-12-09	2020-12-10	\N	P	\N	A	Publicada	2020-12-09-Wagner	31	53
118	1	34114709	Rosalía	Andretta	Rosalía Andretta	andrettarosalia@gmail.com	3425921202	Nanci	Díaz	Nanci Díaz	diaznanci@gmail.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Saber no puede ser lujo.Experiencia del Bachillerato Popular de La Vuelta del Paraguayo	1	Autoriza la publicación	2020-12-09	2020-12-10	\N	P	\N	A	Publicada	2020-12-09-Andretta	26	81
119	1	35650440	Sofía Eugenia	García	Sofía Eugenia García	sofiaeugeniagarcia@gmail.com	3425304482	Nanci	Díaz	Nanci Díaz	diaznanci@gmail.com	0000000000	6	FCJS	301	Licenciatura en Trabajo Social	Saber no puede ser lujo. Experiencia del Bachillerato Popular de La Vuelta del Paraguayo  	1	Autoriza la publicación	2020-12-09	2020-12-10	\N	P	\N	A	Publicada	2020-12-09-García	57	98
120	1	34720100	Mariana 	Cristiani	Mariana  Cristiani	mari_cristiani@live.com.ar	03492-15302538	Marisol Daniela	Labas	Marisol Daniela Labas	mlabas@santafe-conicet.gov.ar	0342-155409057	4	FBCB	194	Doctorado en Ciencias Biológicas	Estudio cinético de la desinfección de aguas utilizando agentes oxidantes en combinación con radiación UV basado en el análisis del daño celular con técnicas de biología molecular.	3	Autoriza después de 2 (dos) años	2020-12-11	2020-12-15	\N	P	\N	A	Publicada	2020-12-11-Cristiani	71	76
125	1	23758061	María Laura	Imvinkelried	María Laura Imvinkelried	mimvinkelried@gmail.com	3404597122	Graciela	Chemello	Graciela Chemello	grachemello@gmail.com	1156202353	9	FHUC	825018	Maestría en Didácticas Específicas	Las concepciones de los futuros docentes sobre la noción de fracción	1	Autoriza la publicación	2020-12-14	2020-12-15	\N	P	\N	A	Publicada	2020-12-14-Imvinkelried	71	26
121	1	27006660	María Fernanda 	Zabalegui	María Fernanda  Zabalegui	fernandazabalegui@hotmail.com	03434407486	Ana Patricia	Fabro	Ana Patricia Fabro	anapfabro@hotmail.com	03434407486	4	FBCB	342	Doctorado en Educación en Ciencias Experimentales	Concepciones sobre la enseñanza de Ciencias Naturales de estudiantes avanzados del Profesorado de Enseñanza Primaria con Orientación Rural	1	Autoriza la publicación	2020-12-11	2020-12-16	\N	P	\N	A	Publicada	2020-12-11-Zabalegui	89	99
127	1	27320042	Glenda IvÓn	Bourquin	Glenda IvÓn Bourquin	glechu2002@hotmail.com	0342-156983140	Pimpinella	Pascual	Pimpinella Pascual	pimpinella.pascual@gmail.com	 0342-155460054	20	FCM	370	Especialización en Medicina Legal	Eutanasia o Distanasia como alternativas para pacientes terminales en las Unidades de Terapia Intensiva. \r\n Eutanasia o Distanasia como alternativas para pacientes terminales en las Unidades de Terapia Intensiva. \r\n \r\n \r\n 	1	Autoriza la publicación	2020-12-15	2020-12-16	\N	P	\N	A	Publicada	2020-12-15-Bourquin	78	20
126	1	31272749	María Mercedes	Lucero	María Mercedes Lucero	mechilucero@hotmail.com	0342-155123233	Sebastián	Amut	Sebastián Amut	seba_amut@hotmail.com	0342-154214263	20	FCM	370	Especialización en Medicina Legal	“LA MEDICINA LEGAL DESDE LA MIRADA DE LOS ESTUDIANTES DE MEDICINA.”	1	Autoriza la publicación	2020-12-14	2020-12-21	\N	P	\N	A	Publicada	2020-12-14-Lucero	27	55
128	1	24600932	Alfredo Andres	Villalba	Alfredo Andres Villalba	Profesor.andres.villalba@gmail.com	54376154330477	Lilian	Von Specht	Lilian Von Specht	lilianvonspecht@gmail.com	54376154373214	9	FHUC	297	Ciclo de Licenciatura en Inglés	Integrating diversity and technology in high school in Misiones	1	Autoriza la publicación	2020-12-16	2020-12-21	\N	P	\N	A	Publicada	2020-12-16-Villalba	61	12
130	1	36199049	María Florencia	Zuzulich	María Florencia Zuzulich	florzuzulich@gmail.com	3426399745	Maria Natacha	Guala	Maria Natacha Guala	natachaguala7@gmail.com	3424288543	6	FCJS	301	Licenciatura en Trabajo Social	Profesionales en el campo penitenciario. Un acercamiento a los significados de las inserciones profesionales en la Unidad Penitenciaria No 2 de Santa Fe.	1	Autoriza la publicación	2020-12-18	2020-12-21	\N	P	\N	A	Publicada	2020-12-18-Zuzulich	75	35
131	1	32831570	Florencia Maria Jesus	D Agostino	Florencia Maria Jesus D Agostino	fmj_dagostino@hotmail.com	3434754461	Margarita 	Trilin	Margarita  Trilin	margaritatrlin@gmail.com	3434508869	10	FADU	378	Especialización en Proyecto, Planificación y Gestión de Arquitectura para la Educación	ESPACIOS EDUCATIVOS PARA LA EDUCACIÓN SECUNDARIA\r\nEN UNIVERSIDADES NACIONALES:\r\nCASO CAMPUS U.N.E.R EN ORO VERDE	1	Autoriza la publicación	2020-12-20	2020-12-21	\N	P	\N	A	Publicada	2020-12-20-DAgostino	54	11
132	1	27833420	Verónica Magdalena	Vlasic	Verónica Magdalena Vlasic	verovlasic@gmail.com	3434508537	Natalia Soledad	Diaz	Natalia Soledad Diaz	diazsolnaty@gmail.com	3426121346	9	FHUC	825019	Maestría en Docencia Universitaria	La formación didáctico pedagógica en los Profesorados de la Facultad de Ciencia y Tecnología de UADER. Un análisis desde la perspectiva de las nuevas condiciones para la enseñanza en la escuela secundaria obligatoria.	1	Autoriza la publicación	2020-12-22	2020-12-28	\N	P	\N	A	Publicada	2020-12-22-Vlasic	35	17
133	1	39051908	Lourdes Luján	Rivero	Lourdes Luján Rivero	lurivero87@gmail.com	3404501842	Emmanuel	Theumer 	Emmanuel Theumer 	emmanueltheumer14@gmail.com	3424781006	6	FCJS	301	Licenciatura en Trabajo Social	“Mi identidad, mi derecho. Análisis del acceso a la salud de las mujeres trans en el Hospital Iturraspe y el CEMAFE de la ciudad de Santa Fe”	1	Autoriza la publicación	2020-12-23	2020-12-28	\N	P	\N	A	Publicada	2020-12-23-Rivero	90	98
134	1	38896461	Fiorella Lucia	Scataglini	Fiorella Lucia Scataglini	fiioreemc@gmail.com	3424349153	Emmanuel	Theumer	Emmanuel Theumer	emmanueltheumer14@gmail.com	3424781006	6	FCJS	400	Ciclo de Licenciatura en Trabajo Social	“Mi identidad, mi derecho. Análisis del acceso a la salud de las mujeres trans en el Hospital Iturraspe y el CEMAFE de la ciudad de Santa Fe”	1	Autoriza la publicación	2020-12-23	2020-12-28	\N	P	\N	A	Publicada	2020-12-23-Scataglini	91	93
136	1	16573390	Alejandro Jose	Morresi	Alejandro Jose Morresi	alemorresi@yahoo.com.ar	4560967	Carlos Maria	Reinante	Carlos Maria Reinante	creinante@outlook.com	4536303	10	FADU	378	Especialización en Proyecto, Planificación y Gestión de Arquitectura para la Educación	LA CALLE DEL APRENDIZAJE	1	Autoriza la publicación	2020-12-29	2020-01-01	\N	P	\N	A	Publicada	2020-12-29-Morresi	28	40
135	1	25480478	Pilar Maria	Gimenez	Pilar Maria Gimenez	pilarmgimenez60@hotmail.com	3424235551	Dr. Pascual 	Pimpinella	Dr. Pascual  Pimpinella	pimpinella.pascual@gmail.com	3425460054	20	FCM	370	Especialización en Medicina Legal	“Accidentes Laborales. Conocimientos por parte del trabajador. La legislación y el estado actual de situación	1	Autoriza la publicación	2020-12-28	2020-12-30	\N	P	\N	A	Publicada	2020-12-28-Gimenez	25	69
138	1	35448223	Mauricio Andres	Pitich	Mauricio Andres Pitich	mauripitich@gmail.com	3425478871	Marina	Cañardo	Marina Cañardo	marinacanardo@gmail.com	1120702425	9	FHUC	825022	Doctorado en Humanidades	Historia del tango en la ciudad de Santa Fe (1920-1998): Producción, distribución, consumo y regulación musical	4	NO autoriza la publicación	2021-01-27	2020-01-02	\N	P	\N	A	Publicada	2021-01-27-Pitich	11	96
139	1	28855790	Leonardo Elian	Toffolini	Leonardo Elian Toffolini	leotoffolini@hotmail.com	155500468	Julio Ramon	Schneider	Julio Ramon Schneider	julioschneider304@gmail.com	155119359	5	FCE	352	Maestría en Administración de Empresas	Inflación y toma de decisiones empresariales: el caso de las redeterminaciones de precios en la obra pública de la Provincia de Santa Fe	1	Autoriza la publicación	2021-02-10	2020-02-12	\N	P	\N	A	Publicada	2021-02-10-Toffolini	27	22
140	1	34650704	Paula Andrea	Loyeau	Paula Andrea Loyeau	loyeau.p@gmail.com	3424467141	Carlos Roberto	Carrara	Carlos Roberto Carrara	ccarrara@fiq.unl.edu.ar	3426147098	4	FBCB	194	Doctorado en Ciencias Biológicas	MICROENCAPSULACIÓN DE MICROORGANISMOS\r\nPROBIÓTICOS CON PRODUCTOS DE LA REACCIÓN DE\r\nMAILLARD (PRM) DE PROTEÍNAS DE SUERO LÁCTEO Y\r\nDEXTRANOS	1	Autoriza la publicación	2021-02-12	2020-02-17	\N	P	\N	A	Publicada	2021-02-12-Loyeau	37	85
142	1	18007083	Ricardo Cristián	Lara	Ricardo Cristián Lara	rcristianlara@gmail.com	02323549621	Javier	Baudracco	Javier Baudracco	jbaudracco@yahoo.com	03496464400	8	FCA	13647	Doctorado en Ciencias Agrarias	Evaluación productiva y económica de tambos de la cuenca Abasto Buenos Aires y simulación estocástica del efecto de estrategias de intensificación sobre la sustentabilidad económica y ambiental	1	Autoriza la publicación	2021-02-16	2020-02-17	\N	P	\N	A	Publicada	2021-02-16-Lara	28	53
143	1	34526134	Ramiro Emmanuel	Jorge Reynolds	Ramiro Emmanuel Jorge Reynolds	ramirojorge2401@hotmail.es	3425135985	Jimena	Vicentín Masaro	Jimena Vicentín Masaro	jime.v.masaro@gmail.com	3426128717	5	FCE	23	Licenciatura en Economía	Herramientas de Google para la predicción de variables económicas. Una aplicación al Índice Compuesto Coincidente de Actividad Económica de la Provincia de Santa Fe (ICASFe)	1	Autoriza la publicación	2021-02-17	2020-02-18	\N	P	\N	A	Publicada	2021-02-17-JorgeReynolds	28	11
141	1	30102339	Daniela Soledad	Rodríguez	Daniela Soledad Rodríguez	daniela.sol.rodriguez@gmail.com	03415609839	Emiliano	Avila Castro	Emiliano Avila Castro	eavilacastro@hotmail.com	03420154425422	20	FCM	370	Especialización en Medicina Legal	Receta Médica.Trabajo final integrador para la obtención de la especialidad en Medicina Legal.	1	Autoriza la publicación	2021-02-16	2020-02-19	\N	P	\N	A	Publicada	2021-02-16-Rodríguez	19	93
146	1	22215589	Liliana	Dillon	Liliana Dillon	liianagdion@gmail.com	03424058291	Susana	Marcipar De Katz	Susana Marcipar De Katz	susmarcikatz@gmail.com	3425091802	9	FHUC	825019	Maestría en Docencia Universitaria	“EVALUACIÓN DE LA IMPLEMENTACIÓN DEL PLAN DE ESTUDIO 2018 DE LA CARRERA DE CONTADOR PÚBLICO DE LA FACULTAD DE CIENCIAS ECONÓMICAS DE LA UNL”	1	Autoriza la publicación	2021-02-19	\N	\N	P	\N	P	Pendiente	2021-02-19-Dillon	99	31
149	5	AV365950	Camilo Alfonso	Alvarez Leon	Camilo Alfonso Alvarez Leon	camiloalvarez9@hotmail.com	2914380784	Carlos Cesar 	Scioli	Carlos Cesar  Scioli	sciolicarlos@gmail.com	2281504631	3	FICH	201	Maestría en Ingeniería de los Recursos Hídricos	ÁREAS FUENTES VARIABLES COMO PROCESO DE GENERACIÓN DE ESCORRENTÍA DOMINANTE EN ZONAS DE LLANURA: IDENTIFICACIÓN E INCERTIDUMBRE EN LA MODELACIÓN HIDROLÓGICA	1	Autoriza la publicación	2021-02-25	2020-02-25	\N	P	\N	A	Publicada	2021-02-25-AlvarezLeon	52	67
\.


--
-- Data for Name: tipodoc; Type: TABLE DATA; Schema: teleentregas; Owner: teleentregasuser
--

COPY teleentregas.tipodoc (codigo, nombre, codigo_guarani, codigo_mapuche) FROM stdin;
6	DNT	1	\N
7	EXT	999	\N
8	CFED	\N	CFED
1	DNI	0	DNI
2	LC	19	LC
3	LE	18	LE
4	CI	2	CI
5	PASAPORTE	90	PAS
\.


--
-- Data for Name: uacademi; Type: TABLE DATA; Schema: teleentregas; Owner: teleentregasuser
--

COPY teleentregas.uacademi (codigo, nombre, nombre_corto, tipo, cod_unl, codigo_mapuche) FROM stdin;
30	Programa de Bibliotecas	PB	\N	\N	\N
15	Externo a la Universidad	\N	1	\N	\N
23	Curso de Capacitacion	\N	1	\N	\N
1	Rectorado	\N	1	100	101
34	Imprenta	\N	1	\N	107
31	Sede Rafaela Sunchales	SERS	\N	\N	\N
35	Dirección Construcciones Univ.	\N	1	\N	108
29	Instituto Nacional de Limnología	INALI	1	103	\N
24	Centro de Idiomas	CI	1	\N	\N
36	Centro de Cómputos	\N	1	\N	109
11	Escuela Industrial Superior	EIS	2	\N	201
37	Prog. Form. Capac. Laboral	\N	1	\N	203
26	Escuela Primaria UNL	EP	2	\N	205
6	Facultad de Ciencias Jurídicas y Sociales	FCJS	1	10	305
2	Facultad de Ingeniería Química	FIQ	1	1	306
5	Facultad de Ciencias Económicas	FCE	1	2	308
4	Facultad de Bioquímica y Ciencias Biológicas	FBCB	1	3	309
18	Instituto Tecnologia de Alimentos	ITA	1	102	311
7	Facultad de Ciencias Veterinarias	FCV	1	13	315
21	Instituto Superior de Música	ISM	1	8	316
22	Escuela Superior de Sanidad	ESS	1	7	317
9	Facultad de Humanidades y Ciencias	FHUC	1	6	318
38	Facultad de Agronomía y Veterinaria	\N	1	\N	319
3	Facultad de Ingeniería y Ciencias Hídricas	FICH	1	4	321
20	Facultad de Ciencias Médicas	FCM	1	14	322
8	Facultad de Ciencias Agrarias	FCA	1	5	320
25	Consorcio Ciudad Universitaria	\N	1	\N	324
14	INTEC	\N	1	101	325
39	L.T. 10	\N	1	\N	326
40	Secretaría de Extensión	\N	1	\N	401
41	Rectorado Apoyatura (O.S.)	\N	1	\N	501
42	Dirección de Deportes	\N	1	\N	502
43	Dirección de Salud	\N	1	\N	503
44	Dirección de Pedagogía	\N	1	\N	504
13	Escuela de Agricultura, Ganadería y Granja	EAGG	2	\N	202
12	Direccion de Cultura	DC	1	\N	323
45	CUSEVI	\N	1	\N	400
32	Escuela Secundaria UNL	ES	2	\N	206
10	Facultad de Arquitectura, Diseño y Urbanismo	FADU	1	12	310
17	Centro Universitario Galvez	CU-GALVEZ	1	11	207
19	Centro Universitario Reconquista Avellaneda	CU-RA	1	9	208
16	Jardín de Infantes "La Ronda"	JILR	2	\N	103
46	Esc. Univ. Análisis de Alim.	EUAA	2	\N	204
47	Esc. Univ. de Alimentos	EUA	2	\N	312
\.


--
-- Name: carreras_codigo_seq; Type: SEQUENCE SET; Schema: teleentregas; Owner: teleentregasuser
--

SELECT pg_catalog.setval('teleentregas.carreras_codigo_seq', 825048, true);


--
-- Name: tesisdigitales_id_tesispublicadas_seq; Type: SEQUENCE SET; Schema: teleentregas; Owner: teleentregasuser
--

SELECT pg_catalog.setval('teleentregas.tesisdigitales_id_tesispublicadas_seq', 150, true);


--
-- Name: tipodoc_codigo_seq; Type: SEQUENCE SET; Schema: teleentregas; Owner: teleentregasuser
--

SELECT pg_catalog.setval('teleentregas.tipodoc_codigo_seq', 8, true);


--
-- Name: uacademi_codigo_seq; Type: SEQUENCE SET; Schema: teleentregas; Owner: teleentregasuser
--

SELECT pg_catalog.setval('teleentregas.uacademi_codigo_seq', 47, true);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (codigo);


--
-- Name: tesisdigitales tesisdigitales_pkey; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.tesisdigitales
    ADD CONSTRAINT tesisdigitales_pkey PRIMARY KEY (id_tesispublicadas);


--
-- Name: tipodoc tipodoc_codigo_guarani_key; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.tipodoc
    ADD CONSTRAINT tipodoc_codigo_guarani_key UNIQUE (codigo_guarani);


--
-- Name: tipodoc tipodoc_nombre_key; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.tipodoc
    ADD CONSTRAINT tipodoc_nombre_key UNIQUE (nombre);


--
-- Name: tipodoc tipodoc_pkey; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.tipodoc
    ADD CONSTRAINT tipodoc_pkey PRIMARY KEY (codigo);


--
-- Name: uacademi uacademi_nombre_corto_key; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.uacademi
    ADD CONSTRAINT uacademi_nombre_corto_key UNIQUE (nombre_corto);


--
-- Name: uacademi uacademi_nombre_key; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.uacademi
    ADD CONSTRAINT uacademi_nombre_key UNIQUE (nombre);


--
-- Name: uacademi uacademi_pkey; Type: CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.uacademi
    ADD CONSTRAINT uacademi_pkey PRIMARY KEY (codigo);


--
-- Name: carrera_codunl_ua_unico_idx; Type: INDEX; Schema: teleentregas; Owner: teleentregasuser
--

CREATE UNIQUE INDEX carrera_codunl_ua_unico_idx ON teleentregas.carreras USING btree (uacademi, codunl);


--
-- Name: carrera_codws_idx; Type: INDEX; Schema: teleentregas; Owner: teleentregasuser
--

CREATE UNIQUE INDEX carrera_codws_idx ON teleentregas.carreras USING btree (uacademi, codws, tipo);


--
-- Name: carreras carreras_uacademi_fkey; Type: FK CONSTRAINT; Schema: teleentregas; Owner: teleentregasuser
--

ALTER TABLE ONLY teleentregas.carreras
    ADD CONSTRAINT carreras_uacademi_fkey FOREIGN KEY (uacademi) REFERENCES teleentregas.uacademi(codigo);


--
-- PostgreSQL database dump complete
--

