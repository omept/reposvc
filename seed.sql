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

--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: gtp
--

INSERT INTO public.repositories (id, created_at, updated_at, deleted_at, name, full_name, description, url, language, forks_count, stars_count, open_issues, watchers, last_commit) VALUES (5, '2022-11-15 15:38:52+01', '2024-08-21 07:59:38.800169+01', NULL, 'go-chat', 'omept/go-chat', 'Go Microservices Realtime Finance Chat Application with RabbitMQ, Websockets, JWT, Mux, Gorm(MySQL), And React', 'https://github.com/omept/go-chat', 'Go', 4, 14, 0, 14, '2024-05-05 09:12:14+01');
INSERT INTO public.repositories (id, created_at, updated_at, deleted_at, name, full_name, description, url, language, forks_count, stars_count, open_issues, watchers, last_commit) VALUES (6, '2018-02-05 21:55:32+01', '2024-08-21 08:00:23.695242+01', NULL, 'chromium', 'chromium/chromium', 'The official GitHub mirror of the Chromium source', 'https://github.com/chromium/chromium', 'C++', 6856, 18534, 93, 18534, '2024-08-21 07:52:40+01');


--
-- Data for Name: commits; Type: TABLE DATA; Schema: public; Owner: gtp
--

INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (134, '2024-08-21 05:00:09.839134+01', '2024-08-21 05:00:09.839134+01', NULL, '9b551a203c100599bc3bfd3870a33feba23d1e55', 'Update README.md', 'Omept Technology Ltd', 'georgetheprogrammer@gmail.com', '2024-05-05 09:12:14+01', 'https://github.com/omept/go-chat/commit/9b551a203c100599bc3bfd3870a33feba23d1e55', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (135, '2024-08-21 05:00:09.843783+01', '2024-08-21 05:00:09.843783+01', NULL, 'd8b7ecca4da7d7a0f0a5ac7fda440433c18c658c', 'clean up names to reduce stuttering', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-02-05 17:52:44+01', 'https://github.com/omept/go-chat/commit/d8b7ecca4da7d7a0f0a5ac7fda440433c18c658c', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (136, '2024-08-21 05:00:09.846916+01', '2024-08-21 05:00:09.846916+01', NULL, 'ef69d3b796d1d13aad37fd7c0a17c53c1c9af932', 'refactor main to a simpler method.', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-02-05 17:46:44+01', 'https://github.com/omept/go-chat/commit/ef69d3b796d1d13aad37fd7c0a17c53c1c9af932', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (137, '2024-08-21 05:00:09.849458+01', '2024-08-21 05:00:09.849458+01', NULL, 'bdef1b92479b6857b294b01a56067e05b1402d40', 'folder structure clean up', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-02-05 16:55:08+01', 'https://github.com/omept/go-chat/commit/bdef1b92479b6857b294b01a56067e05b1402d40', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (138, '2024-08-21 05:00:09.852885+01', '2024-08-21 05:00:09.852885+01', NULL, '23fc343d50a5c219585d8c7f6b59c4669099eef1', 'changed log.Fatal to log.Panic', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-01-05 15:59:58+01', 'https://github.com/omept/go-chat/commit/23fc343d50a5c219585d8c7f6b59c4669099eef1', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (139, '2024-08-21 05:00:09.857534+01', '2024-08-21 05:00:09.857534+01', NULL, 'd13495cf369f2c0c6ee0ae947c31ed6c7de293b7', 'updated the date format on generated log file names to use RFC3339Nano', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-01-05 11:03:03+01', 'https://github.com/omept/go-chat/commit/d13495cf369f2c0c6ee0ae947c31ed6c7de293b7', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (140, '2024-08-21 05:00:09.859969+01', '2024-08-21 05:00:09.859969+01', NULL, '4846adb749cef45a4f76c1ce2379a2b8952dfea0', '- added ability to log messages to applog-dd-mm-yyyy.txt file
- moved migrate-able tables option to a new file in models package
- added explanatory comments to main.g', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-01-05 10:56:17+01', 'https://github.com/omept/go-chat/commit/4846adb749cef45a4f76c1ce2379a2b8952dfea0', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (141, '2024-08-21 05:00:09.862655+01', '2024-08-21 05:00:09.862655+01', NULL, '8d08674631038aa2006fa9a731faa79f6aee1137', 'move cors middleware setup to a new file', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-01-05 10:52:51+01', 'https://github.com/omept/go-chat/commit/8d08674631038aa2006fa9a731faa79f6aee1137', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (142, '2024-08-21 05:00:09.864903+01', '2024-08-21 05:00:09.864903+01', NULL, '916ba271eec44d2434044cca8530ea63197227ae', 'add log level to rabbitmq', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-01-05 10:44:55+01', 'https://github.com/omept/go-chat/commit/916ba271eec44d2434044cca8530ea63197227ae', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (143, '2024-08-21 05:00:09.867154+01', '2024-08-21 05:00:09.867154+01', NULL, '264dc263d3d3fdbbdd22c6a96e83347a7b2e69f0', 'moved rabbitmq and websocket packages and deleted the "internal" folder', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2023-01-05 09:23:23+01', 'https://github.com/omept/go-chat/commit/264dc263d3d3fdbbdd22c6a96e83347a7b2e69f0', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (144, '2024-08-21 05:00:09.87091+01', '2024-08-21 05:00:09.87091+01', NULL, '4cb8b91a8a5819f75cccf3156c77c20cdcd63531', 'Merge remote-tracking branch ''origin/main''', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-12-06 14:14:29+01', 'https://github.com/omept/go-chat/commit/4cb8b91a8a5819f75cccf3156c77c20cdcd63531', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (145, '2024-08-21 05:00:09.873099+01', '2024-08-21 05:00:09.873099+01', NULL, 'd8e6f5e31af28f1fa7ac11865140bc0e4ce6d9f0', 'Merge branch ''develop''', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-12-06 14:13:39+01', 'https://github.com/omept/go-chat/commit/d8e6f5e31af28f1fa7ac11865140bc0e4ce6d9f0', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (146, '2024-08-21 05:00:09.875409+01', '2024-08-21 05:00:09.875409+01', NULL, '226ea131d370db5420a51fff64a0904b3fc6ec3a', 'separate SaveChatMessage from ChatService interface to ChatSaver interface', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-12-03 15:02:26+01', 'https://github.com/omept/go-chat/commit/226ea131d370db5420a51fff64a0904b3fc6ec3a', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (147, '2024-08-21 05:00:09.877647+01', '2024-08-21 05:00:09.877647+01', NULL, 'e59d87ff52c6577235499346552740e02d0e7e4f', 'decoupled chat.service from chat.controller', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-12-03 14:53:53+01', 'https://github.com/omept/go-chat/commit/e59d87ff52c6577235499346552740e02d0e7e4f', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (148, '2024-08-21 05:00:09.880531+01', '2024-08-21 05:00:09.880531+01', NULL, 'c22f4cef653e330913ba08ea054ecdac98f92b10', 'decoupled auth.service from auth.controller', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-12-03 14:42:02+01', 'https://github.com/omept/go-chat/commit/c22f4cef653e330913ba08ea054ecdac98f92b10', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (149, '2024-08-21 05:00:09.882886+01', '2024-08-21 05:00:09.882886+01', NULL, '844d4ab640f1ee1255c59d0305ccb7d7b6b12c0f', 'Update README.md', 'George Ndubuisi O', 'georgetheprogrammer@gmail.com', '2022-11-23 07:27:01+01', 'https://github.com/omept/go-chat/commit/844d4ab640f1ee1255c59d0305ccb7d7b6b12c0f', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (150, '2024-08-21 05:00:09.885468+01', '2024-08-21 05:00:09.885468+01', NULL, 'be8d9023a528bec8ce7d94b47e7b4394031eeaf1', 'Merge branch ''develop''', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 15:57:12+01', 'https://github.com/omept/go-chat/commit/be8d9023a528bec8ce7d94b47e7b4394031eeaf1', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (151, '2024-08-21 05:00:09.889491+01', '2024-08-21 05:00:09.889491+01', NULL, '45e194c4b8cd881b9a72b8b7a4041bceb1e2f9bd', 'update README.md and added queue names to .env.example file', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 15:57:01+01', 'https://github.com/omept/go-chat/commit/45e194c4b8cd881b9a72b8b7a4041bceb1e2f9bd', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (152, '2024-08-21 05:00:09.89183+01', '2024-08-21 05:00:09.89183+01', NULL, '4c6a65413a9e431993d4a58dd1fad25255505fd4', 'Merge branch ''develop''', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 15:42:05+01', 'https://github.com/omept/go-chat/commit/4c6a65413a9e431993d4a58dd1fad25255505fd4', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (153, '2024-08-21 05:00:09.893993+01', '2024-08-21 05:00:09.893993+01', NULL, '9396c6232fd1f12bb3074c8dd62c9d594b8a4159', 'Finish chat', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 15:41:41+01', 'https://github.com/omept/go-chat/commit/9396c6232fd1f12bb3074c8dd62c9d594b8a4159', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (154, '2024-08-21 05:00:09.896857+01', '2024-08-21 05:00:09.896857+01', NULL, '60e82cdd7814b8e9185f158154281e0db94df853', 'update readme', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 15:41:27+01', 'https://github.com/omept/go-chat/commit/60e82cdd7814b8e9185f158154281e0db94df853', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (155, '2024-08-21 05:00:09.899967+01', '2024-08-21 05:00:09.899967+01', NULL, 'b0913e31ccaa7a5a6a1ae0fb52bb63a48c2a307e', 'implemented test for chat-room''s service''s method', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 13:50:33+01', 'https://github.com/omept/go-chat/commit/b0913e31ccaa7a5a6a1ae0fb52bb63a48c2a307e', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (156, '2024-08-21 05:00:09.908549+01', '2024-08-21 05:00:09.908549+01', NULL, '0d89953e59de1e6dad397664275e7150b56a4bd5', '- persist chat messages to db
- implement list chat room''s messages REST endpoint', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-22 13:20:28+01', 'https://github.com/omept/go-chat/commit/0d89953e59de1e6dad397664275e7150b56a4bd5', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (157, '2024-08-21 05:00:09.910983+01', '2024-08-21 05:00:09.910983+01', NULL, '40a7b5acb1a815488d26b40fe826449e3a508eb8', 'implemented receiving stock response for rabbitmq', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-21 23:03:13+01', 'https://github.com/omept/go-chat/commit/40a7b5acb1a815488d26b40fe826449e3a508eb8', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (158, '2024-08-21 05:00:09.914422+01', '2024-08-21 05:00:09.914422+01', NULL, '83f3ad82e890106f2acf26ce79e3bc5e058029c5', 'implemented broadcasting stock request to rabbitmq queue', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-21 22:00:12+01', 'https://github.com/omept/go-chat/commit/83f3ad82e890106f2acf26ce79e3bc5e058029c5', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (159, '2024-08-21 05:00:09.917929+01', '2024-08-21 05:00:09.917929+01', NULL, 'e2fc3e00e4242cd27869678939f637a864252cc2', '- revive websocket on panic
- protect websockt with jwt middleware
- pass chat user from jwt claims
- us a structure for websocket broadcasted messages', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-21 11:22:05+01', 'https://github.com/omept/go-chat/commit/e2fc3e00e4242cd27869678939f637a864252cc2', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (160, '2024-08-21 05:00:09.922799+01', '2024-08-21 05:00:09.922799+01', NULL, '571d8ff839148d8db143f4ca941316125c7fb9ce', 'implemented list chat rooms REST endpoint', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-19 19:18:51+01', 'https://github.com/omept/go-chat/commit/571d8ff839148d8db143f4ca941316125c7fb9ce', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (161, '2024-08-21 05:00:09.926758+01', '2024-08-21 05:00:09.926758+01', NULL, 'd1a8153f577866bad140265c53d81a2bd9ef904a', '- created authentication middleware
- added create chat room REST endoint', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-19 15:53:52+01', 'https://github.com/omept/go-chat/commit/d1a8153f577866bad140265c53d81a2bd9ef904a', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (162, '2024-08-21 05:00:09.931784+01', '2024-08-21 05:00:09.931784+01', NULL, '195514a1d1e7ae00475b588c011f4467cb807114', 'added cors package', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-19 13:44:19+01', 'https://github.com/omept/go-chat/commit/195514a1d1e7ae00475b588c011f4467cb807114', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (163, '2024-08-21 05:00:09.93599+01', '2024-08-21 05:00:09.93599+01', NULL, '4f12fce3f012050e2ff8e9a981beb8166a67aec7', 'added .env.example file', 'George Onwuasoanya', 'georgetheprogrammer@gmail.com', '2022-11-18 17:41:44+01', 'https://github.com/omept/go-chat/commit/4f12fce3f012050e2ff8e9a981beb8166a67aec7', 5);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (164, '2024-08-21 08:00:23.457181+01', '2024-08-21 08:00:23.457181+01', NULL, '3d138beb43f7e2a0203f0bf7af5d0f8fc2885617', 'Signin: Migrate profile-customization to Lit.

Also changing iron-icon dependency to cr-icon.

Bug: 40943652
Change-Id: I0ab18cdb9285dfd693f60305d071db76d3415925
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5799503
Commit-Queue: Demetrios Papadopoulos <dpapad@chromium.org>
Reviewed-by: Teresa Mao <temao@chromium.org>
Code-Coverage: findit-for-me@appspot.gserviceaccount.com <findit-for-me@appspot.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344609}', 'dpapad', 'dpapad@chromium.org', '2024-08-21 07:52:40+01', 'https://github.com/chromium/chromium/commit/3d138beb43f7e2a0203f0bf7af5d0f8fc2885617', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (165, '2024-08-21 08:00:23.466548+01', '2024-08-21 08:00:23.466548+01', NULL, '567dd45e99e547f2efa149fe3f108dbcb0cd2c08', 'Roll Chrome Mac Arm PGO Profile

Roll Chrome Mac Arm PGO profile from chrome-mac-arm-main-1724212223-bcbaed39e8243abccb075e80ecb4f984f8e0871c-f2a0c9e8f0e67e070dcb53f6e398b55f8ada1715.profdata to chrome-mac-arm-main-1724219847-be17f32b9b085d348d9ecd98a897b9639ea390f4-ce099d7888f53b1210ff7d1fa037cddf39445708.profdata

If this roll has caused a breakage, revert this CL and stop the roller
using the controls here:
https://autoroll.skia.org/r/pgo-mac-arm-chromium
Please CC chrome-brapp-engprod@google.com,pgo-profile-sheriffs@google.com on the revert to ensure that a human
is aware of the problem.

To file a bug in Chromium main branch: https://bugs.chromium.org/p/chromium/issues/entry

To report a problem with the AutoRoller itself, please file a bug:
https://issues.skia.org/issues/new?component=1389291&template=1850622

Documentation for the AutoRoller is here:
https://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md

Cq-Include-Trybots: luci.chrome.try:mac-chrome
Tbr: pgo-profile-sheriffs@google.com
Change-Id: I5c859761c19f9b66f7a6ff01047ac17cb719fdea
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5802115
Bot-Commit: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Commit-Queue: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344608}', 'chromium-autoroll', 'chromium-autoroll@skia-public.iam.gserviceaccount.com', '2024-08-21 07:45:32+01', 'https://github.com/chromium/chromium/commit/567dd45e99e547f2efa149fe3f108dbcb0cd2c08', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (166, '2024-08-21 08:00:23.470358+01', '2024-08-21 08:00:23.470358+01', NULL, '67c2ce1eccd77dd997a88e4e7e16222b968f3ba3', 'CCA: Upload CCA with user input as directory name.

Maintain directory name with user given input to avoid conflict.

Bug: b:351637519
Test: Check CCA upload command is able to handle conflict.
Change-Id: I05df08366b9e7f6c22f970482444a7d27ecea90e
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5727956
Commit-Queue: Lynn Chu <cclynn@google.com>
Reviewed-by: Pi-Hsun Shih <pihsun@chromium.org>
Reviewed-by: Sean Li <seannli@google.com>
Cr-Commit-Position: refs/heads/main@{#1344607}', 'cclynn', 'cclynn@google.com', '2024-08-21 07:41:42+01', 'https://github.com/chromium/chromium/commit/67c2ce1eccd77dd997a88e4e7e16222b968f3ba3', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (167, '2024-08-21 08:00:23.47288+01', '2024-08-21 08:00:23.47288+01', NULL, 'ea368417e0890a5dabd2a04469a7ae68154b440c', 'recorder: Temporary add back inset-area and position-try-options

For easier local testing with stable Chrome, we''d like to preserve the
old properties before stable Chrome supports the new properties.

Bug: b:361221415
Test: manually with `cra.py dev`
Change-Id: I1bb3d88abc495902cef8bd1a8de9609c96194628
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5796492
Auto-Submit: Pi-Hsun Shih <pihsun@chromium.org>
Commit-Queue: Shik Chen <shik@chromium.org>
Reviewed-by: Shik Chen <shik@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344606}', 'Pi-Hsun Shih', 'pihsun@chromium.org', '2024-08-21 07:36:54+01', 'https://github.com/chromium/chromium/commit/ea368417e0890a5dabd2a04469a7ae68154b440c', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (168, '2024-08-21 08:00:23.477377+01', '2024-08-21 08:00:23.477377+01', NULL, '8cfc1e818c9d0aac86996349adfc42ff786aee50', 'Remove stale pixel expectations

Autogenerated CL from running:

//content/test/gpu/unexpected_pass_finder.py --project chrome-unexpected-pass-data --include-internal-builders --remove-stale-expectations --narrow-semi-stale-expectation-scope --num-samples 300 --suite pixel --jobs 4

Affected bugs for CL description:

R=rubber-stamper@appspot.gserviceaccount.com

Bug: 338574386, 354152172, 40935289
Change-Id: Ib076ead759fd5756591acab20afb983281f7a116
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5802079
Commit-Queue: Rubber Stamper <rubber-stamper@appspot.gserviceaccount.com>
Auto-Submit: chrome-automated-expectation@chops-service-accounts.iam.gserviceaccount.com <chrome-automated-expectation@chops-service-accounts.iam.gserviceaccount.com>
Bot-Commit: Rubber Stamper <rubber-stamper@appspot.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344605}', 'Expectation File Editor', 'chrome-automated-expectation@chops-service-accounts.iam.gserviceaccount.com', '2024-08-21 07:34:42+01', 'https://github.com/chromium/chromium/commit/8cfc1e818c9d0aac86996349adfc42ff786aee50', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (169, '2024-08-21 08:00:23.487123+01', '2024-08-21 08:00:23.487123+01', NULL, 'c5f704d6139b19c3271a6dcb522e5fc54253bcd8', 'graphite: Count image provider size for peak memory monitoring

Unlike Ganesh, in Graphite the client image provider is reponsible for
uploading and caching GPU backed images for non-GPU backed images that
are encountered while drawing. So make the Graphite behavior match
Ganesh when it comes to peak memory monitoring by counting the image
provider size as "Skia owned".

Bug: 337979851
Change-Id: I37c9eea5c6c2141b657074bfa3c3d249dec38c89
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5798573
Auto-Submit: Sunny Sachanandani <sunnyps@chromium.org>
Reviewed-by: Quyen Le <lehoangquyen@chromium.org>
Commit-Queue: Quyen Le <lehoangquyen@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344604}', 'Sunny Sachanandani', 'sunnyps@chromium.org', '2024-08-21 07:26:28+01', 'https://github.com/chromium/chromium/commit/c5f704d6139b19c3271a6dcb522e5fc54253bcd8', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (170, '2024-08-21 08:00:23.489316+01', '2024-08-21 08:00:23.489316+01', NULL, 'a8041380bc90cfd3bd6a7db49041730bd10f14fc', 'Point Libfuzzer Upload iOS Catalyst Debug target_arch to intel

Bug: 337922818
Change-Id: Id41cca763a9005195ebe2eb473efe382a306d292
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5800781
Reviewed-by: Ben Pastene <bpastene@chromium.org>
Commit-Queue: Rahul Kumar Adudodla (xWF) <adudodla@google.com>
Reviewed-by: Lindsay Pasricha <lindsayw@chromium.org>
Reviewed-by: Ali Juma <ajuma@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344603}', 'Rahul Kumar Adudodla', 'adudodla@google.com', '2024-08-21 07:10:25+01', 'https://github.com/chromium/chromium/commit/a8041380bc90cfd3bd6a7db49041730bd10f14fc', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (171, '2024-08-21 08:00:23.493439+01', '2024-08-21 08:00:23.493439+01', NULL, 'd754616f6e82ad2021b38dbbc825d9832f7d3f16', 'ash: Create //chrome/browser/ash/fwupd

... and move c/b/ui/ash/fwupd_download_client* there.

Bug: b:358244714
Change-Id: I6ffc628d6dceb9cf52fe464ff3258932871bd2c6
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5796282
Reviewed-by: Hidehiko Abe <hidehiko@chromium.org>
Commit-Queue: Georg Neis <neis@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344602}', 'Georg Neis', 'neis@chromium.org', '2024-08-21 07:08:44+01', 'https://github.com/chromium/chromium/commit/d754616f6e82ad2021b38dbbc825d9832f7d3f16', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (172, '2024-08-21 08:00:23.502941+01', '2024-08-21 08:00:23.502941+01', NULL, '1e7f34ef7fff1d25e9a6c8598d9d6ef76dfa8380', 'Fix browser crash when profile destroy

This change addresses a crash issue that occurs when tasks
from mojo continue to run in the task runner after the
profile is closed (ShutdownStarted==true).

One of the crashing cases happens when calling
`storage_partition_impl->GetWeakPtr()` during the construction
of `RenderProcessHostImpl`. This PR aims to prevent the
creation of `RenderProcessHostImpl` instances during the shutdown process.
The crash issue has been present in multiple versions but has become more
frequent in version 126. The root cause is that tasks from mojo continue to
run even after the profile has started shutting down, leading to an incorrect
state.
The ideal fix would involve resetting the mojom connection through callbacks,
observers... However, there are challenges with this approach, such as the
lack of an observer for the destruction of the instance holding the mojo
object.
This PR try a straightforward solution: it checks if `browser_context` has
begun the shutdown process and avoid continuing to navigate or receive responses
during this period. This approach prevents crashes by ensuring that no new
RenderProcessHostImpl instances are created when the profile(browser_context) is
shutting down.

Bug: 356418730
Change-Id: I5474f22d028b9bdb560c77711dd8df55b28d825a
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5755530
Reviewed-by: Nasko Oskov <nasko@chromium.org>
Commit-Queue: q lamry <zhaoy@microsoft.com>
Reviewed-by: Leon Han <shulianghan@microsoft.com>
Cr-Commit-Position: refs/heads/main@{#1344601}', 'Yue Zhao', 'zhaoy@microsoft.com', '2024-08-21 07:07:21+01', 'https://github.com/chromium/chromium/commit/1e7f34ef7fff1d25e9a6c8598d9d6ef76dfa8380', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (173, '2024-08-21 08:00:23.505764+01', '2024-08-21 08:00:23.505764+01', NULL, '048bc784740497cae0556fd5be4334b3324ce86a', 'Roll src/net/third_party/quiche/src/ 4f6a4eb16..59118ed06 (1 commit)

https://quiche.googlesource.com/quiche.git/+log/4f6a4eb166a7..59118ed066e7

$ git log 4f6a4eb16..59118ed06 --date=short --no-merges --format=''%ad %ae %s''
2024-08-20 martinduke Abstract out the MoQ Chat User interface and implement E2E chat test.

Created with:
  roll-dep src/net/third_party/quiche/src src/third_party/quic_trace/src

Change-Id: I15a47b9802af38cae02840bba0f3829fcb5aa806
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5796491
Auto-Submit: Nidhi Jaju <nidhijaju@chromium.org>
Reviewed-by: Adam Rice <ricea@chromium.org>
Commit-Queue: Adam Rice <ricea@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344600}', 'Nidhi Jaju', 'nidhijaju@chromium.org', '2024-08-21 07:06:27+01', 'https://github.com/chromium/chromium/commit/048bc784740497cae0556fd5be4334b3324ce86a', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (174, '2024-08-21 08:00:23.511857+01', '2024-08-21 08:00:23.511857+01', NULL, 'b2127c727a64ad4eb2879a8a9677b4b9cd98704e', '[views-ax] Migrating a11y properties in ash/wm

This CL migrates the a11y properties in ash/wm/* whenever their value
should change, rather than querying the value and computing it only
when needed.

This CL eliminates the direct assignment of the a11y properties within
the View::GetAccessibleNodeData method. Instead, it introduces a
mechanism to update these properties in the accessibility cache when
any attribute that contributes to their value undergoes a change. This
approach ensures that the a11y properties remains up-to-date in the
accessibility cache.

This CL is part of the ViewsAX project:
https://docs.google.com/document/d/1Ku7HOyDsiZem1yaV6ccZ-tz3lO2XR2NEcm8HjR6d-VY/edit#heading=h.ke1u3utej413

Bug: 325137417
Change-Id: I9446bf712942e583dc290683b4794ea1e3eae773
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5776123
Commit-Queue: Ashish Kumar <ashishkum@microsoft.com>
Reviewed-by: Scott Violet <sky@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344599}', 'Ashish Kumar', 'ashishkum@microsoft.com', '2024-08-21 07:01:03+01', 'https://github.com/chromium/chromium/commit/b2127c727a64ad4eb2879a8a9677b4b9cd98704e', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (175, '2024-08-21 08:00:23.518842+01', '2024-08-21 08:00:23.518842+01', NULL, 'ce099d7888f53b1210ff7d1fa037cddf39445708', 'media/gpu: Move vulkan deps into enable_vulkan conditional statement

In //media/gpu/chromeos/common, //gpu/vulkan/init:init is added into
deps regardless of enable_vulkan.
This causes build failure when enable_vulkan is set to false.

To fix the problem when enable_vulkan is false, deps of
//gpu/vulkan/init:init should be added when enable_vulkan is true.

Change-Id: I4f904b14dcbae4bdf2ec44623b35b01a95859b9a
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5796355
Reviewed-by: Dale Curtis <dalecurtis@chromium.org>
Reviewed-by: Justin Green <greenjustin@google.com>
Commit-Queue: Yunsik Jung <yunsik.jung@lge.com>
Cr-Commit-Position: refs/heads/main@{#1344598}', 'Yunsik Jung', 'yunsik.jung@lge.com', '2024-08-21 06:57:27+01', 'https://github.com/chromium/chromium/commit/ce099d7888f53b1210ff7d1fa037cddf39445708', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (176, '2024-08-21 08:00:23.52201+01', '2024-08-21 08:00:23.52201+01', NULL, '1e0aa4d1b7aa342f6ec418d5bcb4081e7976727d', 'shape-outside: Fix an issue of rounded corners in vertical writing modes

BoxShape class assumes the passed FloatRoundedRect is in a logical
coordinate system. However,

* ShapeOutsideInfo::ComputedShape() for ShapeValue::kBox adjusted only
  box sizes, and did nothing for rounded corners.
* Shape::CreateShape() for BasicShape::kBasicShapeInsetType adjusted box
  sizes and corner radii, but did nothing for corner positions.

This CL introduces BoxShape::ToLogical() to convert a FloatRoundedRect
correctly, and use it in both cases.

* Tests in fast/shapes/shape-outside-floats/
  We confirmed their expectations were incorrect.

Bug: 40149424, 361129290
Change-Id: I7b0cb250106334ad3b9fa3c6bdae17ebf6ac4819
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5798709
Reviewed-by: Koji Ishii <kojii@chromium.org>
Commit-Queue: Kent Tamura <tkent@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344597}', 'Kent Tamura', 'tkent@chromium.org', '2024-08-21 06:44:47+01', 'https://github.com/chromium/chromium/commit/1e0aa4d1b7aa342f6ec418d5bcb4081e7976727d', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (177, '2024-08-21 08:00:23.525802+01', '2024-08-21 08:00:23.525802+01', NULL, '983e96eb85969c9043799036fd51a8f553fff1be', '[views-ax] Migrating Role to view constructor in ui/views directory

This CL migrates setting of the accessible role from
View::GetAccessibleNodeData to the view constructor. This ensures that
the role is updated in the accessibility cache as soon as the view is
constructed. The migration is applied to following files:

 1. about_this_site_side_panel_view.cc
 2. webview.cc

The remaining instances will be migrated in follow-up CLs.

This CL is part of the ViewsAX project:
https://docs.google.com/document/d/1Ku7HOyDsiZem1yaV6ccZ-tz3lO2XR2NEcm8HjR6d-VY/edit#heading=h.ke1u3utej413

Bug: 325137417
Change-Id: I727bfb61ef823754957d87526d8328da298ff22a
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5747764
Reviewed-by: Javier Contreras <javiercon@microsoft.com>
Reviewed-by: Peter Kasting <pkasting@chromium.org>
Commit-Queue: Sejal Anand <sejalanand@microsoft.com>
Cr-Commit-Position: refs/heads/main@{#1344596}', 'Sejal Anand', 'sejalanand@microsoft.com', '2024-08-21 06:40:25+01', 'https://github.com/chromium/chromium/commit/983e96eb85969c9043799036fd51a8f553fff1be', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (178, '2024-08-21 08:00:23.606309+01', '2024-08-21 08:00:23.606309+01', NULL, '26ec5b603de1682a1f3c251dfe54f3fe6adf9daa', '[views-ax] Introducing `RemoveName()` for kName

The newly added function removes the kName and kNameFrom attributes
from accessibility cache.

Follow-up CL makes use of these.

This CL is part of the ViewsAX project:
https://docs.google.com/document/d/1Ku7HOyDsiZem1yaV6ccZ-tz3lO2XR2NEcm8HjR6d-VY/edit#heading=h.ke1u3utej413

Bug: 325137417
Change-Id: I08a4bd5f65a6b53b5806108bc2328c7810065e2b
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5797863
Reviewed-by: Javier Contreras <javiercon@microsoft.com>
Reviewed-by: Benjamin Beaudry <benjamin.beaudry@microsoft.com>
Commit-Queue: Divyansh Mangal <dmangal@microsoft.com>
Cr-Commit-Position: refs/heads/main@{#1344595}', 'Divyansh Mangal', 'dmangal@microsoft.com', '2024-08-21 06:35:14+01', 'https://github.com/chromium/chromium/commit/26ec5b603de1682a1f3c251dfe54f3fe6adf9daa', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (179, '2024-08-21 08:00:23.622291+01', '2024-08-21 08:00:23.622291+01', NULL, 'a3a0358aeb3a2fd0fe18fa68d53d667296bc9b50', 'shape-outside: Fix an ellipse() issue in vertical writing modes

EllipseShape should swap the horizontal radius and the vertical radius
in vertical writing modes.

Bug: 40149424, 360903551
Change-Id: Id00db929cc5330c1c53ad0d02857a28b66841b63
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5799228
Auto-Submit: Kent Tamura <tkent@chromium.org>
Reviewed-by: Koji Ishii <kojii@chromium.org>
Commit-Queue: Koji Ishii <kojii@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344594}', 'Kent Tamura', 'tkent@chromium.org', '2024-08-21 06:32:05+01', 'https://github.com/chromium/chromium/commit/a3a0358aeb3a2fd0fe18fa68d53d667296bc9b50', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (180, '2024-08-21 08:00:23.627748+01', '2024-08-21 08:00:23.627748+01', NULL, '2a3045016831f6f10a15a5e9a4eca3bda99ae9af', 'Gardener: Disable EsimInteractiveUiTest.AutoconnectBehavior

This CL will disable following tests on Mac:
- EsimInteractiveUiTest.AutoconnectBehavior

Bug: 358606262
Change-Id: I647d5275bc1fc679559f704d06de04b41e9acc46
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5799432
Reviewed-by: Takuto Ikuta <tikuta@chromium.org>
Reviewed-by: Yuki Shiino <yukishiino@chromium.org>
Owners-Override: Shunya Shishido <sisidovski@chromium.org>
Commit-Queue: Yuki Shiino <yukishiino@chromium.org>
Auto-Submit: Shunya Shishido <sisidovski@chromium.org>
Commit-Queue: Shunya Shishido <sisidovski@chromium.org>
Commit-Queue: Takuto Ikuta <tikuta@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344593}', 'Shunya Shishido', 'sisidovski@chromium.org', '2024-08-21 06:30:35+01', 'https://github.com/chromium/chromium/commit/2a3045016831f6f10a15a5e9a4eca3bda99ae9af', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (181, '2024-08-21 08:00:23.641478+01', '2024-08-21 08:00:23.641478+01', NULL, '281639106fa26450af37252da02f6beaa00e690f', 'Roll Crossbench from 6baf540f7845 to 988591712bc0 (1 revision)

https://chromium.googlesource.com/crossbench.git/+log/6baf540f7845..988591712bc0

2024-08-21 kalutes@google.com Add keyboard input support to android

If this roll has caused a breakage, revert this CL and stop the roller
using the controls here:
https://autoroll.skia.org/r/crossbench-chromium
Please CC cbruni@google.com,crossbench@chromium.org on the revert to ensure that a human
is aware of the problem.

To file a bug in Chromium: https://bugs.chromium.org/p/chromium/issues/entry

To report a problem with the AutoRoller itself, please file a bug:
https://issues.skia.org/issues/new?component=1389291&template=1850622

Documentation for the AutoRoller is here:
https://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md

Tbr: cbruni@google.com
Change-Id: Ie37ce6d125785bdb0b6387e6254d2e110634cd2e
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5801861
Bot-Commit: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Commit-Queue: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344592}', 'chromium-autoroll', 'chromium-autoroll@skia-public.iam.gserviceaccount.com', '2024-08-21 06:27:45+01', 'https://github.com/chromium/chromium/commit/281639106fa26450af37252da02f6beaa00e690f', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (182, '2024-08-21 08:00:23.652414+01', '2024-08-21 08:00:23.652414+01', NULL, 'c0b88824e5646ee44be036b2e2ace7beef686032', 'Roll V8 from 9bd8d2f67243 to ce79baeb4fca (2 revisions)

https://chromium.googlesource.com/v8/v8.git/+log/9bd8d2f67243..ce79baeb4fca

2024-08-21 v8-ci-autoroll-builder@chops-service-accounts.iam.gserviceaccount.com Version 13.0.29
2024-08-21 tao.pan@intel.com [tiering] Apply PGO to JSFunctions with empty feedback vectors on creation

If this roll has caused a breakage, revert this CL and stop the roller
using the controls here:
https://autoroll.skia.org/r/v8-chromium-autoroll
Please CC liviurau@google.com,machenbach@google.com,v8-waterfall-gardener@grotations.appspotmail.com on the revert to ensure that a human
is aware of the problem.

To report a problem with the AutoRoller itself, please file a bug:
https://issues.skia.org/issues/new?component=1389291&template=1850622

Documentation for the AutoRoller is here:
https://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md

Cq-Include-Trybots: luci.chromium.try:linux-blink-rel;luci.chromium.try:linux_optional_gpu_tests_rel;luci.chromium.try:mac_optional_gpu_tests_rel;luci.chromium.try:win_optional_gpu_tests_rel;luci.chromium.try:android_optional_gpu_tests_rel;luci.chromium.try:dawn-linux-x64-deps-rel
Change-Id: I80781c54987725a5b1ee3030e603c7e0e2c6bf8d
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5801875
Commit-Queue: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Bot-Commit: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344591}', 'chromium-autoroll', 'chromium-autoroll@skia-public.iam.gserviceaccount.com', '2024-08-21 06:25:10+01', 'https://github.com/chromium/chromium/commit/c0b88824e5646ee44be036b2e2ace7beef686032', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (183, '2024-08-21 08:00:23.654975+01', '2024-08-21 08:00:23.654975+01', NULL, '694f8544ddca5461380ebfd46c27cba4042a237a', 'Roll clank/internal/apps from 9c6599c05366 to 354ea5f12e65 (1 revision)

https://chrome-internal.googlesource.com/clank/internal/apps.git/+log/9c6599c05366..354ea5f12e65

If this roll has caused a breakage, revert this CL and stop the roller
using the controls here:
https://skia-autoroll.corp.goog/r/clank-apps-chromium-autoroll
Please CC chrome-brapp-engprod@google.com on the revert to ensure that a human
is aware of the problem.

To report a problem with the AutoRoller itself, please file a bug:
https://issues.skia.org/issues/new?component=1389291&template=1850622

Documentation for the AutoRoller is here:
https://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md

Bug: None
Tbr: 
No-Try: true
Change-Id: I8add0c1898b7b8f723262a8483279e94e53fbcda
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5802169
Commit-Queue: chromium-internal-autoroll <chromium-internal-autoroll@skia-corp.google.com.iam.gserviceaccount.com>
Bot-Commit: chromium-internal-autoroll <chromium-internal-autoroll@skia-corp.google.com.iam.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344590}', 'chromium-internal-autoroll', 'chromium-internal-autoroll@skia-corp.google.com.iam.gserviceaccount.com', '2024-08-21 06:20:14+01', 'https://github.com/chromium/chromium/commit/694f8544ddca5461380ebfd46c27cba4042a237a', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (184, '2024-08-21 08:00:23.657118+01', '2024-08-21 08:00:23.657118+01', NULL, '5e6635e2407df1ce2b49781b72504301e7d39206', '[AGC] Enable Ignore Ui Gains by default.

Launch is approved in launch/4226468.

After this change, UI gains will be ignored if a AGC stream is
requested. Except that users turn off the Allow AGC toggle in
the audio settings page. Allow AGC toggle will be default shown
as well.

BUG=b:300487058
Test=built, deployed, and verified on dut

Change-Id: I6055c2cfbb8ee2dab1c43fc2ad707708b578734e
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5789929
Reviewed-by: Dale Curtis <dalecurtis@chromium.org>
Commit-Queue: Eddy Hsu <eddyhsu@chromium.org>
Reviewed-by: Frank Liberato <liberato@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344589}', 'Eddy Hsu', 'eddyhsu@google.com', '2024-08-21 06:18:14+01', 'https://github.com/chromium/chromium/commit/5e6635e2407df1ce2b49781b72504301e7d39206', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (185, '2024-08-21 08:00:23.667657+01', '2024-08-21 08:00:23.667657+01', NULL, '0fb44a3ebe281614a47a4817c8e2bf1e8bd8b341', 'vc-ui: Adds VC settings menu

Adds the VC settings menu, which can be opened by the gear icon in the VC panel.
This menu contains items for opening audio/privacy settings and Studio Look preferences.

UI deck: go/vcsettings-v2
Screenshot: https://screenshot.googleplex.com/Wpge33ZxvZJqXVQ.png
Mojo change in CrOS Camera Service: CL:5687008, CL:5790113

Bug: b:354069928
Change-Id: I8c7c58abf9e5de05a03f3199f41a3b51756b0f18
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5796482
Reviewed-by: Xiaoqian Dai <xdai@chromium.org>
Reviewed-by: Takashi Toyoshima <toyoshim@chromium.org>
Commit-Queue: Ryota Okuji <okuji@chromium.org>
Reviewed-by: Juliana Chang <julianachang@chromium.org>
Reviewed-by: Andre Le <leandre@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344588}', 'Ryota Okuji', 'okuji@chromium.org', '2024-08-21 06:16:16+01', 'https://github.com/chromium/chromium/commit/0fb44a3ebe281614a47a4817c8e2bf1e8bd8b341', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (186, '2024-08-21 08:00:23.671908+01', '2024-08-21 08:00:23.671908+01', NULL, '80caa81cdd3227d26ad04039f49de06e4d5d18fd', 'Add WPT URL test cases for non-special schemes

Add WPT URL test cases for non-special schemes which Chrome incorrectly
parses even when Chrome supports non-special scheme URLs.

The context is "Intent to Ship: Support non-special scheme URLs" thread
[^1].

The CL add test cases for the following schemes:

Opt-out schemes [^2] (Chrome parses these scheme URLs incorrectly as
opaque URLs):
- android://
- drivefs://
- chromeos-steam://
- steam://
- materialized-view://

Registered schemes [^3]  (Chrome parses these scheme URLs incorrectly as
special URLs with stripping port part):
- android-app:
- chrome-distiller:
- chrome-extension:
- chrome-native:
- chrome-resource:
- chrome-search:
- fuchsia-dir:
- isolated-app:

Regarding "Registered schemes", the CL uses a URL like
"chrome-native://x:0", which doesn''t have a path part, as a test case.

If Chrome parses this URL incorrectly as a special URL, its string
representation (`url.href`) should be "chrome-native://x:0/" (a slash is
appended since special URLs can''t have an empty path).

If Chrome parses this URL correctly as a non-special URL, its string
representation (`url.href`) should be "chrome-native://x:0" (non-special
URLs can have an empty path).

Note: In WPT test runner environments, Chrome may not register these
schemes [^3] because these schemes are registered at specific times in
runtime. This CL doesn''t address the timing issue in Chrome, just
adding WPTs.

- [^1] https://groups.google.com/a/chromium.org/g/blink-dev/c/svzicLXbKjw/m/FJSPhwmEAQAJ
- [^2] https://source.chromium.org/chromium/chromium/src/+/main:url/url_util.cc;l=126?q=%20opaque_non_special_schemes&ss=chromium%2Fchromium%2Fsrc
- [^3] https://source.chromium.org/chromium/chromium/src/+/main:chrome/common/chrome_content_client.cc;l=233;drc=0312be31243152b47aa6158749e28f61604b54ff?q=%20kChromeStandardURLSchemes&sq=&ss=chromium%2Fchromium%2Fsrc


Bug: 40063064
Change-Id: I2eef2136496cbaf16b500c976956098998aa424f
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5790445
Reviewed-by: Domenic Denicola <domenic@chromium.org>
Commit-Queue: Hayato Ito <hayato@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344587}', 'Hayato Ito', 'hayato@chromium.org', '2024-08-21 06:13:54+01', 'https://github.com/chromium/chromium/commit/80caa81cdd3227d26ad04039f49de06e4d5d18fd', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (187, '2024-08-21 08:00:23.674971+01', '2024-08-21 08:00:23.674971+01', NULL, 'f10eb5df1ad659daff3af7cb791c8e741e256bcf', 'Gardener: Disable tests in FindBarViewsUiTest on Mac

This CL will disable following tests on Mac:
- FindBarViewsUiTest.FocusRestore
- FindBarViewsUiTest.FocusRestoreOnTabSwitchDismiss

Bug: 361216144
Change-Id: I97a011c00582e4623e83d75fb213bb581ee5fa44
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5800006
Commit-Queue: Shunya Shishido <sisidovski@chromium.org>
Owners-Override: Shunya Shishido <sisidovski@chromium.org>
Auto-Submit: Shunya Shishido <sisidovski@chromium.org>
Reviewed-by: Kentaro Hara <haraken@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344586}', 'Shunya Shishido', 'sisidovski@chromium.org', '2024-08-21 06:10:47+01', 'https://github.com/chromium/chromium/commit/f10eb5df1ad659daff3af7cb791c8e741e256bcf', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (188, '2024-08-21 08:00:23.67821+01', '2024-08-21 08:00:23.67821+01', NULL, 'fa23d0002a0604fb84d67445e1205ce4e916a176', 'arc: Enable FriendlierErrorDialog flag by default

Now that the apps/processes that crash or cause ANR in the background
will triggers Chrome notification instead of Android dialogs.

Bug: 332459217
Test: Manual
Change-Id: I1b0f647e362300971bb500ce4914c6dd549345c0
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5741151
Reviewed-by: Yuichiro Hanada <yhanada@chromium.org>
Reviewed-by: Shengsong Tan <sstan@chromium.org>
Commit-Queue: Qijing Yao <yaoqq@google.com>
Cr-Commit-Position: refs/heads/main@{#1344585}', 'Yao Qijing', 'yaoqq@google.com', '2024-08-21 06:04:39+01', 'https://github.com/chromium/chromium/commit/fa23d0002a0604fb84d67445e1205ce4e916a176', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (189, '2024-08-21 08:00:23.681444+01', '2024-08-21 08:00:23.681444+01', NULL, '5329a42c1e30d96690cf6f8494aca0a546b2aae1', 'Roll Chrome Mac Arm PGO Profile

Roll Chrome Mac Arm PGO profile from chrome-mac-arm-main-1724205387-ffa037b96e08f1f15a120b8ada3df3817484e613-cb57d73200f18b50f218b2a6117fc4266b3d5e10.profdata to chrome-mac-arm-main-1724212223-bcbaed39e8243abccb075e80ecb4f984f8e0871c-f2a0c9e8f0e67e070dcb53f6e398b55f8ada1715.profdata

If this roll has caused a breakage, revert this CL and stop the roller
using the controls here:
https://autoroll.skia.org/r/pgo-mac-arm-chromium
Please CC chrome-brapp-engprod@google.com,pgo-profile-sheriffs@google.com on the revert to ensure that a human
is aware of the problem.

To file a bug in Chromium main branch: https://bugs.chromium.org/p/chromium/issues/entry

To report a problem with the AutoRoller itself, please file a bug:
https://issues.skia.org/issues/new?component=1389291&template=1850622

Documentation for the AutoRoller is here:
https://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md

Cq-Include-Trybots: luci.chrome.try:mac-chrome
Tbr: pgo-profile-sheriffs@google.com
Change-Id: I4e78a418a0011e247d5b94b119f894c8032b0005
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5801862
Bot-Commit: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Commit-Queue: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344584}', 'chromium-autoroll', 'chromium-autoroll@skia-public.iam.gserviceaccount.com', '2024-08-21 05:44:49+01', 'https://github.com/chromium/chromium/commit/5329a42c1e30d96690cf6f8494aca0a546b2aae1', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (190, '2024-08-21 08:00:23.68613+01', '2024-08-21 08:00:23.68613+01', NULL, 'd03e679cb01576264f01e6cd6e20630189c8f263', 'Fix the context used when cloning the AITextSession

Bug: 361210984
Change-Id: I280a427d7d92a6dc613d3c420b1b53b52e3f32dc
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5796176
Commit-Queue: Jiacheng Guo <gjc@google.com>
Reviewed-by: Mingyu Lei <leimy@chromium.org>
Reviewed-by: Tsuyoshi Horo <horo@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344583}', 'Jiacheng Guo', 'gjc@google.com', '2024-08-21 05:38:00+01', 'https://github.com/chromium/chromium/commit/d03e679cb01576264f01e6cd6e20630189c8f263', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (191, '2024-08-21 08:00:23.688745+01', '2024-08-21 08:00:23.688745+01', NULL, '0e6eb239412951b28d8f3dce42c1d8882c6312c0', 'recorder: Update consent dialog buttons to be all the same

Bug: b:336963138
Test: manually
Change-Id: Ibd3859b7a22297ce3eaabfd70d5f70af7b79ed21
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5799229
Commit-Queue: Pi-Hsun Shih <pihsun@chromium.org>
Reviewed-by: Shik Chen <shik@chromium.org>
Cr-Commit-Position: refs/heads/main@{#1344582}', 'Pi-Hsun Shih', 'pihsun@chromium.org', '2024-08-21 05:35:38+01', 'https://github.com/chromium/chromium/commit/0e6eb239412951b28d8f3dce42c1d8882c6312c0', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (192, '2024-08-21 08:00:23.691229+01', '2024-08-21 08:00:23.691229+01', NULL, '48e5705fa23c1e1fef3f2bd5b1173bc391acd81a', 'Roll Perfetto Trace Processor Win from bb53789167f3 to 8d6340147357

https://android.googlesource.com/platform/external/perfetto.git/+log/bb53789167f3..8d6340147357

If this roll has caused a breakage, revert this CL and stop the roller
using the controls here:
https://autoroll.skia.org/r/perfetto-trace-processor-win-chromium
Please CC chrometto-team@google.com,perfetto-bugs@google.com on the revert to ensure that a human
is aware of the problem.

To file a bug in Chromium: https://bugs.chromium.org/p/chromium/issues/entry

To report a problem with the AutoRoller itself, please file a bug:
https://issues.skia.org/issues/new?component=1389291&template=1850622

Documentation for the AutoRoller is here:
https://skia.googlesource.com/buildbot/+doc/main/autoroll/README.md

Tbr: perfetto-bugs@google.com
Change-Id: I7dc464056746dc339c938ce548e3f12eefa3c114
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5801480
Bot-Commit: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Commit-Queue: chromium-autoroll <chromium-autoroll@skia-public.iam.gserviceaccount.com>
Cr-Commit-Position: refs/heads/main@{#1344581}', 'chromium-autoroll', 'chromium-autoroll@skia-public.iam.gserviceaccount.com', '2024-08-21 05:24:54+01', 'https://github.com/chromium/chromium/commit/48e5705fa23c1e1fef3f2bd5b1173bc391acd81a', 6);
INSERT INTO public.commits (id, created_at, updated_at, deleted_at, sha, message, author_name, author_email, date, url, repository_id) VALUES (193, '2024-08-21 08:00:23.693415+01', '2024-08-21 08:00:23.693415+01', NULL, '0242e97e2effca142aba053d97834a2fd4657ed6', 'Prevent descendant focus on tab obscure.

This CL prevents descendants of tab content from gaining focus when
a tab modal is active and the tab is marked as obscured and unfocusable.

This CL also modifies OmniboxTestUtils to not rely on
InputMethodManager to determine if the keyboard is on and focusing
the URL bar, because if nothing is focused InputMethodService will
keep active IME focus on the last focused view. This is important
because preventing focus on tab content means that often there will
no longer be any focusable view when clearing focus on the URL bar.

Bug: 345671734
Test: manual testing using keyboard
Change-Id: Ifb7bb8f273e71056ee081e20c36dd4d5ea6963cd
Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/5632560
Code-Coverage: findit-for-me@appspot.gserviceaccount.com <findit-for-me@appspot.gserviceaccount.com>
Reviewed-by: Michael Thiessen <mthiesse@chromium.org>
Commit-Queue: Eliot Courtney <edcourtney@chromium.org>
Reviewed-by: Lijin Shen <lazzzis@google.com>
Cr-Commit-Position: refs/heads/main@{#1344580}', 'Eliot Courtney', 'edcourtney@google.com', '2024-08-21 05:20:47+01', 'https://github.com/chromium/chromium/commit/0242e97e2effca142aba053d97834a2fd4657ed6', 6);


--
-- Name: commits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gtp
--

SELECT pg_catalog.setval('public.commits_id_seq', 193, true);


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gtp
--

SELECT pg_catalog.setval('public.repositories_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

