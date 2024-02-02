--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(100),
    type character varying(50),
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    location text
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100),
    type character varying(50),
    has_galactic_disc boolean NOT NULL,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100),
    type character varying(50),
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100),
    type character varying(50),
    is_spherical boolean NOT NULL,
    distance_from_earth integer,
    temp numeric(4,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100),
    type character varying(50),
    temp integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet
_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Ceres', 'Barren', true, false, 'The asteroid belt');
INSERT INTO public.dwarf_planet VALUES (2, 'Pluto', 'Barren', true, false, 'The distant Kuiper Belt');
INSERT INTO public.dwarf_planet VALUES (3, 'Eris', 'Barren', true, false, 'The Kuiper Belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Spiral Galaxy', true, 26670);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral Galaxy', true, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'Spiral Galaxy', true, 17300000);
INSERT INTO public.galaxy VALUES (4, 'Circinus Galaxy', 'Spiral Galaxy', true, 13000000);
INSERT INTO public.galaxy VALUES (6, 'Needle Galaxy', 'Spiral Galaxy', true, 38500000);
INSERT INTO public.galaxy VALUES (5, 'Condor Galaxy', 'Spiral Galaxy', true, 212000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Barren', true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Barren', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Barren', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Titania', 'Barren', true, false, 7);
INSERT INTO public.moon VALUES (5, 'Miranda', 'Barren', true, false, 7);
INSERT INTO public.moon VALUES (6, 'Oberon', 'Barren', true, false, 7);
INSERT INTO public.moon VALUES (7, 'Ariel', 'Barren', true, false, 7);
INSERT INTO public.moon VALUES (8, 'Umbriel', 'Barren', true, false, 7);
INSERT INTO public.moon VALUES (9, 'Triton', 'Barren', true, false, 8);
INSERT INTO public.moon VALUES (37, 'Proteus', 'Barren', false, false, 8);
INSERT INTO public.moon VALUES (38, 'Larissa', 'Barren', false, false, 8);
INSERT INTO public.moon VALUES (39, 'Galatea', 'Barren', false, false, 8);
INSERT INTO public.moon VALUES (40, 'Despina', 'Barren', false, false, 8);
INSERT INTO public.moon VALUES (41, 'Thalassa', 'Barren', false, false, 8);
INSERT INTO public.moon VALUES (42, 'Naiad', 'Barren', false, false, 8);
INSERT INTO public.moon VALUES (43, 'Titan', 'Barren', true, false, 6);
INSERT INTO public.moon VALUES (44, 'Mimas', 'Barren', true, false, 6);
INSERT INTO public.moon VALUES (45, 'Io', 'Barren', true, false, 5);
INSERT INTO public.moon VALUES (46, 'Enceladus', 'Barren', true, false, 6);
INSERT INTO public.moon VALUES (47, 'Tethys', 'Barren', true, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 0, 15.0, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Terrestrial', true, 48000000, 430.0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', true, 25000000, 464.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', true, 140000000, 20.0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', true, 464540000, -150.0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', true, 746000000, -176.0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', true, 1810800000, -195.0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', true, 2000000000, -214.0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Exoplanet', true, NULL, NULL, 4);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Exoplanet', true, NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'Exoplanet', true, NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Planet X?', '', true, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'G-type', 5600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type', 9982, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 'A-type', 7077, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red Dwarf', 2769, 1);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'B-type', 12727, 1);
INSERT INTO public.star VALUES (6, 'Arcturus', 'Red Giant', 4017, 1);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 47, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--