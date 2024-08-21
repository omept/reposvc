--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: commits; Type: TABLE; Schema: public; Owner: gtp
--

CREATE TABLE public.commits (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    sha text,
    message text,
    author_name text,
    author_email text,
    date timestamp with time zone,
    url text,
    repository_id bigint
);


ALTER TABLE public.commits OWNER TO gtp;

--
-- Name: commits_id_seq; Type: SEQUENCE; Schema: public; Owner: gtp
--

CREATE SEQUENCE public.commits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commits_id_seq OWNER TO gtp;

--
-- Name: commits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gtp
--

ALTER SEQUENCE public.commits_id_seq OWNED BY public.commits.id;


--
-- Name: repositories; Type: TABLE; Schema: public; Owner: gtp
--

CREATE TABLE public.repositories (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text,
    full_name text,
    description text,
    url text,
    language text,
    forks_count bigint,
    stars_count bigint,
    open_issues bigint,
    watchers bigint,
    last_commit timestamp with time zone
);


ALTER TABLE public.repositories OWNER TO gtp;

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: gtp
--

CREATE SEQUENCE public.repositories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO gtp;

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gtp
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: commits id; Type: DEFAULT; Schema: public; Owner: gtp
--

ALTER TABLE ONLY public.commits ALTER COLUMN id SET DEFAULT nextval('public.commits_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: gtp
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Data for Name: commits; Type: TABLE DATA; Schema: public; Owner: gtp
--

COPY public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) FROM stdin;
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: gtp
--

COPY public.repositories (id, created_at, updated_at, deleted_at, name, full_name, description, url, language, forks_count, stars_count, open_issues, watchers, last_commit) FROM stdin;
\.


--
-- Name: commits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gtp
--

SELECT pg_catalog.setval('public.commits_id_seq', 133, true);


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gtp
--

SELECT pg_catalog.setval('public.repositories_id_seq', 4, true);


--
-- Name: commits commits_pkey; Type: CONSTRAINT; Schema: public; Owner: gtp
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT commits_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: gtp
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: idx_commits_author_email; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_commits_author_email ON public.commits USING btree (author_email);


--
-- Name: idx_commits_date; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_commits_date ON public.commits USING btree (date);


--
-- Name: idx_commits_deleted_at; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_commits_deleted_at ON public.commits USING btree (deleted_at);


--
-- Name: idx_commits_repository_id; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_commits_repository_id ON public.commits USING btree (repository_id);


--
-- Name: idx_commits_sha; Type: INDEX; Schema: public; Owner: gtp
--

CREATE UNIQUE INDEX idx_commits_sha ON public.commits USING btree (sha);


--
-- Name: idx_repositories_created_at; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_repositories_created_at ON public.repositories USING btree (created_at);


--
-- Name: idx_repositories_deleted_at; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_repositories_deleted_at ON public.repositories USING btree (deleted_at);


--
-- Name: idx_repositories_full_name; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_repositories_full_name ON public.repositories USING btree (full_name);


--
-- Name: idx_repositories_last_commit; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_repositories_last_commit ON public.repositories USING btree (last_commit);


--
-- Name: idx_repositories_name; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_repositories_name ON public.repositories USING btree (name);


--
-- Name: idx_repositories_updated_at; Type: INDEX; Schema: public; Owner: gtp
--

CREATE INDEX idx_repositories_updated_at ON public.repositories USING btree (updated_at);


--
-- Name: commits fk_repositories_commits; Type: FK CONSTRAINT; Schema: public; Owner: gtp
--

ALTER TABLE ONLY public.commits
    ADD CONSTRAINT fk_repositories_commits FOREIGN KEY (repository_id) REFERENCES public.repositories(id);


--
-- PostgreSQL database dump complete
--

