--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer,
    discovered_by character varying(50),
    discovery_year integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    mil_of_light_yrs numeric(6,4),
    galaxy_types character varying(20)[]
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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    discovered_by character varying(30)
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
    name character varying(30) NOT NULL,
    description text,
    has_rings boolean,
    has_life boolean,
    num_of_moons integer,
    num_in_solar_system integer,
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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric(10,6),
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 950, 'Giuseppe Piazzi', 1801);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 'Heinrich Wilhelm Olbers', 1807);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 'Heinrich Wilhelm Olbers', 1802);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy where Earth is located', 0.0265, '{Sb,Sbc,SB(rs)bc}');
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf Spheroidal Galaxy', 'Also known as the Sagittarius Dwarf Elliptical Galaxy', 0.0780, '{}');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud (LMC)', 'The LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal.', 0.1630, '{SB(s)m}');
INSERT INTO public.galaxy VALUES (4, 'Ursa Minor Dwarf', 'A dwarf spheroidal galaxy, discovered by A.G. Wilson of the Lowell Observatory, in the United States, during the Palomar Sky Survey in 1955', 0.0630, '{E}');
INSERT INTO public.galaxy VALUES (5, 'Draco Dwarf', 'A spheroidal galaxy which was discovered by Albert George Wilson of Lowell Observatory in 1954', 0.2580, '{"E pec"}');
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'A barred spiral galaxy and is the nearest major galaxy to the Milky Way', 2.5380, '{SA(s)b}');
INSERT INTO public.galaxy VALUES (7, 'Triangulum Galaxy (M33)', 'The galaxy is the second-smallest spiral galaxy in the Local Group after the Large Magellanic Cloud', 2.7300, '{SA(s)cd}');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s only natural satellite, with many impact craters.', 3, 'Galileo Galilei');
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregularly shaped moon, likely captured asteroid.', 4, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller, potato-shaped moon of Mars.', 4, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic moon with the most volcanic activity in the Solar System.', 5, 'Galileo Galilei');
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with a suspected subsurface ocean.', 5, 'Galileo Galilei');
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the Solar System, with a thin oxygen atmosphere.', 5, 'Galileo Galilei');
INSERT INTO public.moon VALUES (7, 'Callisto', 'Second-largest moon of Jupiter, heavily cratered with icy surface.', 5, 'Galileo Galilei');
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn with a thick nitrogen atmosphere and lakes.', 6, 'Christiaan Huygens');
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second-largest moon of Saturn, with a ring system and icy surface.', 6, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (10, 'Dione', 'High-density moon of Saturn with a reflective icy surface.', 6, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (11, 'Tethys', 'Moon of Saturn with a large canyon system called Ithaca Chasma.', 6, 'Giovanni Domenico Cassini');
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Icy moon of Saturn with active geysers erupting water vapor.', 6, 'William Herschel');
INSERT INTO public.moon VALUES (13, 'Titania', 'Largest moon of Uranus with a surface of water ice and rock.', 7, 'William Herschel');
INSERT INTO public.moon VALUES (14, 'Oberon', 'Second-largest moon of Uranus with a dark, cratered surface.', 7, 'William Herschel');
INSERT INTO public.moon VALUES (15, 'Umbriel', 'Darkest moon of Uranus with a smooth, black surface.', 7, 'William Herschel');
INSERT INTO public.moon VALUES (16, 'Ariel', 'Brightest moon of Uranus with a reflective surface of water ice.', 7, 'William Herschel');
INSERT INTO public.moon VALUES (17, 'Miranda', 'Smallest major moon of Uranus with an irregular, potato-shaped form.', 7, 'John Kuiper (1948)');
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune with a nitrogen atmosphere and geysers.', 8, 'William Herschel (1789)');
INSERT INTO public.moon VALUES (19, 'Proteus', 'Second-largest moon of Neptune with an irregular, dark surface.', 8, 'Voyager 2 (1989)');
INSERT INTO public.moon VALUES (20, 'Himalia', 'Irregularly shaped moon of Jupiter with a retrograde orbit.', 5, 'Charles D. Perrine (1904)');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun, rocky and cratered.', false, false, 0, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet, thick atmosphere with greenhouse gases.', false, false, 0, 2, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet with life, oceans and atmosphere.', false, true, 1, 3, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Reddish planet with thin atmosphere, potential for past/future life.', false, false, 2, 4, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, gas giant with a Great Red Spot storm.', true, false, 79, 5, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Second largest planet, gas giant with prominent rings.', true, false, 82, 6, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant tilted on its side, with multiple rings.', true, false, 27, 7, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant with strong winds and a Great Dark Spot.', true, false, 14, 8, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet orbiting Proxima Centauri, potentially rocky.', NULL, false, NULL, 1, 2);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Exoplanet in habitable zone of TRAPPIST-1, potentially rocky.', NULL, false, NULL, 1, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Exoplanet in habitable zone of Kepler-186, potentially rocky.', NULL, false, NULL, 1, 4);
INSERT INTO public.planet VALUES (12, 'Gliese 581 g', 'Exoplanet potentially in habitable zone of Gliese 581, possibly rocky.', NULL, false, NULL, 1, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of our Solar System.', 0.000015, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun in the southern constellation of Centaurus', 4.246500, 1);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 'A small red dwarf star in the constellation of Ophiuchus', 5.962900, 1);
INSERT INTO public.star VALUES (4, 'Wolf 359', 'A red dwarf star located in the constellation Leo, near the ecliptic', 7.855800, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'The brightest star in the night sky', 8.709400, 1);
INSERT INTO public.star VALUES (6, 'Procyon', 'The brightest star in the constellation of Canis Minor and usually the eighth-brightest star in the night sky', 11.402000, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

