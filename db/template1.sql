--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: list; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE list (
    sid character varying(16),
    list json,
    sum money,
    renshu integer,
    zhifu boolean,
    fapiao boolean,
    beizhu text,
    "time" timestamp without time zone
);


ALTER TABLE public.list OWNER TO postgres;

--
-- Name: shangjia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE shangjia (
    sid character varying(13),
    spd character varying(16),
    sico character varying(128),
    list json
);


ALTER TABLE public.shangjia OWNER TO postgres;

--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY list (sid, list, sum, renshu, zhifu, fapiao, beizhu, "time") FROM stdin;
15771337133	[\n  {"name":["num","total","size","attr1"]}\n  ,{"":["","","",""]}\n]	$120.00	4	t	t		2017-01-31 13:20:07
\.


--
-- Data for Name: shangjia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shangjia (sid, spd, sico, list) FROM stdin;
15771337133	15771337133	md5-img-url	[\n  {\n    "listName": "♥热门",\n        "listID": "1",\n            "list": [{\n                  "id": 1,\n                      "name": "秀火锅",\n                          "jiage": 13,\n                              "profile": "这个火锅真好吃",\n                                  "img": "images/m1.jpg"\n                                    }, {\n                                          "id": 2,\n                                              "name": "麻辣烫",\n                                                  "jiage": 15,\n                                                      "profile": "这个麻辣烫真好吃",\n                                                          "img": "images/m2.jpg"\n                                                            }, {\n                                                                  "id": 3,\n                                                                      "name": "红烧牛肉",\n                                                                          "jiage": 20,\n                                                                              "profile": "这个牛真好吃",\n                                                                                  "img": "images/m8.jpg"\n                                                                                    }]\n                                                                                  },{\n                                                                                  "listName": "♥肉",\n                                                                                  "listID": "2",\n                                                                                  "list": [{\n                                                                                    "id": 4,\n                                                                                        "name": "秀火锅",\n                                                                                            "jiage": 13,\n                                                                                                "profile": "这个火锅真好吃",\n                                                                                                    "img": "images/m1.jpg"\n                                                                                                      }, {\n                                                                                                        "id": 5,\n                                                                                                            "name": "麻辣烫",\n                                                                                                                "jiage": 15,\n                                                                                                                    "profile": "这个麻辣烫真好吃",\n                                                                                                                        "img": "images/m2.jpg"\n                                                                                                                          }, {\n                                                                                                                            "id": 6,\n                                                                                                                                "name": "红烧牛肉",\n                                                                                                                                    "jiage": 20,\n                                                                                                                                        "profile": "这个牛真好吃",\n                                                                                                                                            "img": "images/m8.jpg"\n                                                                                                                                              }]\n                                                                                                                                        }, {\n                                                                                                                                          "listName": "★新菜",\n                                                                                                                                          "listID": 7,\n                                                                                                                                          "list": [{\n                                                                                                                                            "id": "4",\n                                                                                                                                                "name": "香蕉",\n                                                                                                                                                    "jiage": 13,\n                                                                                                                                                        "profile": "这个火锅真好吃",\n                                                                                                                                                            "img": "images/m6.jpg"\n                                                                                                                                                              }, {\n                                                                                                                                                                "id": 8,\n                                                                                                                                                                    "name": "麻辣烫",\n                                                                                                                                                                        "jiage": 15,\n                                                                                                                                                                            "profile": "这个麻辣烫真好吃",\n                                                                                                                                                                                "img": "images/m5.jpg"\n                                                                                                                                                                                  }, {\n                                                                                                                                                                                    "id": 9,\n                                                                                                                                                                                        "name": "红烧牛肉",\n                                                                                                                                                                                            "jiage": 20,\n                                                                                                                                                                                                "profile": "这个牛真好吃",\n                                                                                                                                                                                                    "img": "images/m6.jpg"\n                                                                                                                                                                                                      }, {\n                                                                                                                                                                                                        "id": 10,\n                                                                                                                                                                                                            "name": "麻辣烫",\n                                                                                                                                                                                                                "jiage": 15,\n                                                                                                                                                                                                                    "profile": "这个麻辣烫真好吃",\n                                                                                                                                                                                                                        "img": "images/m5.jpg"\n                                                                                                                                                                                                                          }, {\n                                                                                                                                                                                                                            "id": 11,\n                                                                                                                                                                                                                                "name": "麻辣烫",\n                                                                                                                                                                                                                                    "jiage": 15,\n                                                                                                                                                                                                                                        "profile": "这个麻辣烫真好吃",\n                                                                                                                                                                                                                                            "img": "images/m5.jpg"\n                                                                                                                                                                                                                                              }, {\n                                                                                                                                                                                                                                                "id": 12,\n                                                                                                                                                                                                                                                    "name": "麻辣烫",\n                                                                                                                                                                                                                                                        "jiage": 15,\n                                                                                                                                                                                                                                                            "profile": "这个麻辣烫真好吃",\n                                                                                                                                                                                                                                                                "img": "images/m5.jpg"\n                                                                                                                                                                                                                                                                  }, {\n                                                                                                                                                                                                                                                                    "id": 13,\n                                                                                                                                                                                                                                                                        "name": "红烧牛肉",\n                                                                                                                                                                                                                                                                            "jiage": 20,\n                                                                                                                                                                                                                                                                                "profile": "这个牛真好吃",\n                                                                                                                                                                                                                                                                                    "img": "images/m6.jpg"\n                                                                                                                                                                                                                                                                                      }]\n                                                                                                                                                                                                                                                                                }\n                                                                                                                                                                                                                                                                            ]
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

