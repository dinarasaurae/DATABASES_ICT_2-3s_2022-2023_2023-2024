toc.dat                                                                                             0000600 0004000 0002000 00000124661 14516725067 0014466 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       7                	    {            phone_provider    14.9    14.9 |    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16403    phone_provider    DATABASE     k   CREATE DATABASE phone_provider WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE phone_provider;
                postgres    false         V           1247    16481    periodicity_enum    TYPE     v   CREATE TYPE public.periodicity_enum AS ENUM (
    'daily',
    'weekly',
    'monthly',
    'yearly',
    'hourly'
);
 #   DROP TYPE public.periodicity_enum;
       public          postgres    false         �            1259    16436    basic_tariff    TABLE       CREATE TABLE public.basic_tariff (
    tariff_id integer NOT NULL,
    gb_amount integer,
    international_call_cost_per_minute numeric NOT NULL,
    domestic_call_cost_per_minute numeric NOT NULL,
    basic_tariff_price numeric NOT NULL,
    tariff_name character varying(60) NOT NULL,
    minutes_amount bigint NOT NULL,
    sms_amount bigint NOT NULL,
    CONSTRAINT gb_amount_chk CHECK ((gb_amount >= 0)),
    CONSTRAINT minutes_amount_chk CHECK ((minutes_amount >= 0)),
    CONSTRAINT sms_amount_chk CHECK ((sms_amount >= 0))
);
     DROP TABLE public.basic_tariff;
       public         heap    postgres    false         �            1259    16435    basic_tariff_tariff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basic_tariff_tariff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.basic_tariff_tariff_id_seq;
       public          postgres    false    210         �           0    0    basic_tariff_tariff_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.basic_tariff_tariff_id_seq OWNED BY public.basic_tariff.tariff_id;
          public          postgres    false    209         �            1259    16527 	   call_zone    TABLE     �   CREATE TABLE public.call_zone (
    call_zone_id integer NOT NULL,
    country character varying(60) NOT NULL,
    cost_per_minute_call_zone numeric NOT NULL,
    region character varying(60),
    city character varying(60)
);
    DROP TABLE public.call_zone;
       public         heap    postgres    false         �            1259    16526    call_zone_call_zone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.call_zone_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.call_zone_call_zone_id_seq;
       public          postgres    false    216         �           0    0    call_zone_call_zone_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.call_zone_call_zone_id_seq OWNED BY public.call_zone.call_zone_id;
          public          postgres    false    215         �            1259    16555    client    TABLE     3  CREATE TABLE public.client (
    client_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    passport_issuing_authority character varying(100) NOT NULL,
    passport_series_and_number bigint NOT NULL,
    passport_issuing_date date NOT NULL,
    address character varying(200) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false         �            1259    16554    client_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    218         �           0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    217         �            1259    16565    contract    TABLE     �   CREATE TABLE public.contract (
    contract_id integer NOT NULL,
    client_id integer NOT NULL,
    date_of_conclusion date NOT NULL,
    date_of_cancellation date
);
    DROP TABLE public.contract;
       public         heap    postgres    false         �            1259    16564    contract_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contract_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.contract_client_id_seq;
       public          postgres    false    221         �           0    0    contract_client_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.contract_client_id_seq OWNED BY public.contract.client_id;
          public          postgres    false    220         �            1259    16563    contract_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contract_contract_id_seq;
       public          postgres    false    221         �           0    0    contract_contract_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contract_contract_id_seq OWNED BY public.contract.contract_id;
          public          postgres    false    219         �            1259    16595    domestic_call    TABLE     
  CREATE TABLE public.domestic_call (
    domestic_callee_number bigint NOT NULL,
    phone_number bigint NOT NULL,
    call_start_time timestamp(0) without time zone NOT NULL,
    call_end_time timestamp(0) without time zone,
    domestic_call_id integer NOT NULL
);
 !   DROP TABLE public.domestic_call;
       public         heap    postgres    false         �            1259    16700 "   domestic_call_domestic_call_id_seq    SEQUENCE     �   CREATE SEQUENCE public.domestic_call_domestic_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.domestic_call_domestic_call_id_seq;
       public          postgres    false    224         �           0    0 "   domestic_call_domestic_call_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.domestic_call_domestic_call_id_seq OWNED BY public.domestic_call.domestic_call_id;
          public          postgres    false    235         �            1259    16512    external_service    TABLE     X  CREATE TABLE public.external_service (
    external_service_id integer NOT NULL,
    external_service_price money NOT NULL,
    external_service_description text NOT NULL,
    external_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT external_service_description_chk CHECK ((length(external_service_description) < 1000))
);
 $   DROP TABLE public.external_service;
       public         heap    postgres    false    854         �            1259    16511 (   external_service_external_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_service_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.external_service_external_service_id_seq;
       public          postgres    false    214         �           0    0 (   external_service_external_service_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.external_service_external_service_id_seq OWNED BY public.external_service.external_service_id;
          public          postgres    false    213         �            1259    16642    external_service_inclusion    TABLE       CREATE TABLE public.external_service_inclusion (
    external_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    external_service_date_of_connection date NOT NULL,
    external_service_date_of_disconnection date,
    external_service_inclusion_id integer NOT NULL
);
 .   DROP TABLE public.external_service_inclusion;
       public         heap    postgres    false         �            1259    16641 2   external_service_inclusion_external_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_service_inclusion_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.external_service_inclusion_external_service_id_seq;
       public          postgres    false    231         �           0    0 2   external_service_inclusion_external_service_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.external_service_inclusion_external_service_id_seq OWNED BY public.external_service_inclusion.external_service_id;
          public          postgres    false    230         �            1259    16684 <   external_service_inclusion_external_service_inclusion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq;
       public          postgres    false    231         �           0    0 <   external_service_inclusion_external_service_inclusion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq OWNED BY public.external_service_inclusion.external_service_inclusion_id;
          public          postgres    false    233         �            1259    16492    internal_service    TABLE     X  CREATE TABLE public.internal_service (
    internal_service_id integer NOT NULL,
    internal_service_price money NOT NULL,
    internal_service_description text NOT NULL,
    internal_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT internal_service_description_chk CHECK ((length(internal_service_description) < 1000))
);
 $   DROP TABLE public.internal_service;
       public         heap    postgres    false    854         �            1259    16622    internal_service_inclusion    TABLE     �   CREATE TABLE public.internal_service_inclusion (
    internal_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    date_of_connection date NOT NULL,
    date_of_disconnection date,
    internal_service_inclusion_id integer NOT NULL
);
 .   DROP TABLE public.internal_service_inclusion;
       public         heap    postgres    false         �            1259    16620 2   internal_service_inclusion_internal_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_service_inclusion_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.internal_service_inclusion_internal_service_id_seq;
       public          postgres    false    229         �           0    0 2   internal_service_inclusion_internal_service_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.internal_service_inclusion_internal_service_id_seq OWNED BY public.internal_service_inclusion.internal_service_id;
          public          postgres    false    228         �            1259    16692 <   internal_service_inclusion_internal_service_inclusion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq;
       public          postgres    false    229         �           0    0 <   internal_service_inclusion_internal_service_inclusion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq OWNED BY public.internal_service_inclusion.internal_service_inclusion_id;
          public          postgres    false    234         �            1259    16491 (   internal_service_internal_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_service_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.internal_service_internal_service_id_seq;
       public          postgres    false    212         �           0    0 (   internal_service_internal_service_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.internal_service_internal_service_id_seq OWNED BY public.internal_service.internal_service_id;
          public          postgres    false    211         �            1259    16608    international_call    TABLE     C  CREATE TABLE public.international_call (
    international_call_id integer NOT NULL,
    phone_number bigint NOT NULL,
    international_call_start_time timestamp(0) without time zone,
    international_call_end_time timestamp without time zone,
    call_zone_id integer NOT NULL,
    international_callee_number bigint
);
 &   DROP TABLE public.international_call;
       public         heap    postgres    false         �            1259    16607 #   international_call_call_zone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.international_call_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.international_call_call_zone_id_seq;
       public          postgres    false    227         �           0    0 #   international_call_call_zone_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.international_call_call_zone_id_seq OWNED BY public.international_call.call_zone_id;
          public          postgres    false    226         �            1259    16606 ,   international_call_international_call_id_seq    SEQUENCE     �   CREATE SEQUENCE public.international_call_international_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.international_call_international_call_id_seq;
       public          postgres    false    227         �           0    0 ,   international_call_international_call_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.international_call_international_call_id_seq OWNED BY public.international_call.international_call_id;
          public          postgres    false    225         �            1259    16975    payment    TABLE     �   CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    payment_status boolean NOT NULL,
    phone_number bigint NOT NULL,
    payment_date date NOT NULL,
    payment_amount numeric
);
    DROP TABLE public.payment;
       public         heap    postgres    false         �            1259    16974    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    238         �           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    237         �            1259    16578    phone_on_tariff    TABLE     �   CREATE TABLE public.phone_on_tariff (
    phone_on_tariff_number bigint NOT NULL,
    tariff_id integer NOT NULL,
    activation_date date NOT NULL,
    deletion_date date,
    current_balance numeric NOT NULL,
    contract_id integer NOT NULL
);
 #   DROP TABLE public.phone_on_tariff;
       public         heap    postgres    false         �            1259    16577    phone_on_tariff_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.phone_on_tariff_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.phone_on_tariff_contract_id_seq;
       public          postgres    false    223         �           0    0    phone_on_tariff_contract_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.phone_on_tariff_contract_id_seq OWNED BY public.phone_on_tariff.contract_id;
          public          postgres    false    222         �            1259    16660    tariff_service_inclusion    TABLE       CREATE TABLE public.tariff_service_inclusion (
    tariff_id integer NOT NULL,
    tariff_service_date_of_connection date NOT NULL,
    tariff_service_date_of_disconnection date,
    tariff_service_inclusion_id integer NOT NULL,
    internal_service_id integer
);
 ,   DROP TABLE public.tariff_service_inclusion;
       public         heap    postgres    false         �            1259    16708 8   tariff_service_inclusion_tariff_service_inclusion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq;
       public          postgres    false    232         �           0    0 8   tariff_service_inclusion_tariff_service_inclusion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq OWNED BY public.tariff_service_inclusion.tariff_service_inclusion_id;
          public          postgres    false    236         �           2604    16439    basic_tariff tariff_id    DEFAULT     �   ALTER TABLE ONLY public.basic_tariff ALTER COLUMN tariff_id SET DEFAULT nextval('public.basic_tariff_tariff_id_seq'::regclass);
 E   ALTER TABLE public.basic_tariff ALTER COLUMN tariff_id DROP DEFAULT;
       public          postgres    false    210    209    210         �           2604    16530    call_zone call_zone_id    DEFAULT     �   ALTER TABLE ONLY public.call_zone ALTER COLUMN call_zone_id SET DEFAULT nextval('public.call_zone_call_zone_id_seq'::regclass);
 E   ALTER TABLE public.call_zone ALTER COLUMN call_zone_id DROP DEFAULT;
       public          postgres    false    215    216    216         �           2604    16558    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    218    217    218         �           2604    16568    contract contract_id    DEFAULT     |   ALTER TABLE ONLY public.contract ALTER COLUMN contract_id SET DEFAULT nextval('public.contract_contract_id_seq'::regclass);
 C   ALTER TABLE public.contract ALTER COLUMN contract_id DROP DEFAULT;
       public          postgres    false    219    221    221         �           2604    16569    contract client_id    DEFAULT     x   ALTER TABLE ONLY public.contract ALTER COLUMN client_id SET DEFAULT nextval('public.contract_client_id_seq'::regclass);
 A   ALTER TABLE public.contract ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    221    220    221         �           2604    16515 $   external_service external_service_id    DEFAULT     �   ALTER TABLE ONLY public.external_service ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_external_service_id_seq'::regclass);
 S   ALTER TABLE public.external_service ALTER COLUMN external_service_id DROP DEFAULT;
       public          postgres    false    213    214    214         �           2604    16646 .   external_service_inclusion external_service_id    DEFAULT     �   ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_inclusion_external_service_id_seq'::regclass);
 ]   ALTER TABLE public.external_service_inclusion ALTER COLUMN external_service_id DROP DEFAULT;
       public          postgres    false    230    231    231         �           2604    16685 8   external_service_inclusion external_service_inclusion_id    DEFAULT     �   ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_inclusion_id SET DEFAULT nextval('public.external_service_inclusion_external_service_inclusion_id_seq'::regclass);
 g   ALTER TABLE public.external_service_inclusion ALTER COLUMN external_service_inclusion_id DROP DEFAULT;
       public          postgres    false    233    231         �           2604    16495 $   internal_service internal_service_id    DEFAULT     �   ALTER TABLE ONLY public.internal_service ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_internal_service_id_seq'::regclass);
 S   ALTER TABLE public.internal_service ALTER COLUMN internal_service_id DROP DEFAULT;
       public          postgres    false    212    211    212         �           2604    16625 .   internal_service_inclusion internal_service_id    DEFAULT     �   ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_id_seq'::regclass);
 ]   ALTER TABLE public.internal_service_inclusion ALTER COLUMN internal_service_id DROP DEFAULT;
       public          postgres    false    229    228    229         �           2604    16693 8   internal_service_inclusion internal_service_inclusion_id    DEFAULT     �   ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_inclusion_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_inclusion_id_seq'::regclass);
 g   ALTER TABLE public.internal_service_inclusion ALTER COLUMN internal_service_inclusion_id DROP DEFAULT;
       public          postgres    false    234    229         �           2604    16611 (   international_call international_call_id    DEFAULT     �   ALTER TABLE ONLY public.international_call ALTER COLUMN international_call_id SET DEFAULT nextval('public.international_call_international_call_id_seq'::regclass);
 W   ALTER TABLE public.international_call ALTER COLUMN international_call_id DROP DEFAULT;
       public          postgres    false    225    227    227         �           2604    16978    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    238    237    238         �           2604    16709 4   tariff_service_inclusion tariff_service_inclusion_id    DEFAULT     �   ALTER TABLE ONLY public.tariff_service_inclusion ALTER COLUMN tariff_service_inclusion_id SET DEFAULT nextval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq'::regclass);
 c   ALTER TABLE public.tariff_service_inclusion ALTER COLUMN tariff_service_inclusion_id DROP DEFAULT;
       public          postgres    false    236    232         i          0    16436    basic_tariff 
   TABLE DATA           �   COPY public.basic_tariff (tariff_id, gb_amount, international_call_cost_per_minute, domestic_call_cost_per_minute, basic_tariff_price, tariff_name, minutes_amount, sms_amount) FROM stdin;
    public          postgres    false    210       3433.dat o          0    16527 	   call_zone 
   TABLE DATA           c   COPY public.call_zone (call_zone_id, country, cost_per_minute_call_zone, region, city) FROM stdin;
    public          postgres    false    216       3439.dat q          0    16555    client 
   TABLE DATA           �   COPY public.client (client_id, full_name, passport_issuing_authority, passport_series_and_number, passport_issuing_date, address) FROM stdin;
    public          postgres    false    218       3441.dat t          0    16565    contract 
   TABLE DATA           d   COPY public.contract (contract_id, client_id, date_of_conclusion, date_of_cancellation) FROM stdin;
    public          postgres    false    221       3444.dat w          0    16595    domestic_call 
   TABLE DATA              COPY public.domestic_call (domestic_callee_number, phone_number, call_start_time, call_end_time, domestic_call_id) FROM stdin;
    public          postgres    false    224       3447.dat m          0    16512    external_service 
   TABLE DATA           �   COPY public.external_service (external_service_id, external_service_price, external_service_description, external_service_periodicity) FROM stdin;
    public          postgres    false    214       3437.dat ~          0    16642    external_service_inclusion 
   TABLE DATA           �   COPY public.external_service_inclusion (external_service_id, phone_number, external_service_date_of_connection, external_service_date_of_disconnection, external_service_inclusion_id) FROM stdin;
    public          postgres    false    231       3454.dat k          0    16492    internal_service 
   TABLE DATA           �   COPY public.internal_service (internal_service_id, internal_service_price, internal_service_description, internal_service_periodicity) FROM stdin;
    public          postgres    false    212       3435.dat |          0    16622    internal_service_inclusion 
   TABLE DATA           �   COPY public.internal_service_inclusion (internal_service_id, phone_number, date_of_connection, date_of_disconnection, internal_service_inclusion_id) FROM stdin;
    public          postgres    false    229       3452.dat z          0    16608    international_call 
   TABLE DATA           �   COPY public.international_call (international_call_id, phone_number, international_call_start_time, international_call_end_time, call_zone_id, international_callee_number) FROM stdin;
    public          postgres    false    227       3450.dat �          0    16975    payment 
   TABLE DATA           i   COPY public.payment (payment_id, payment_status, phone_number, payment_date, payment_amount) FROM stdin;
    public          postgres    false    238       3461.dat v          0    16578    phone_on_tariff 
   TABLE DATA           �   COPY public.phone_on_tariff (phone_on_tariff_number, tariff_id, activation_date, deletion_date, current_balance, contract_id) FROM stdin;
    public          postgres    false    223       3446.dat           0    16660    tariff_service_inclusion 
   TABLE DATA           �   COPY public.tariff_service_inclusion (tariff_id, tariff_service_date_of_connection, tariff_service_date_of_disconnection, tariff_service_inclusion_id, internal_service_id) FROM stdin;
    public          postgres    false    232       3455.dat �           0    0    basic_tariff_tariff_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.basic_tariff_tariff_id_seq', 1, false);
          public          postgres    false    209         �           0    0    call_zone_call_zone_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.call_zone_call_zone_id_seq', 1, false);
          public          postgres    false    215         �           0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    217         �           0    0    contract_client_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.contract_client_id_seq', 1, false);
          public          postgres    false    220         �           0    0    contract_contract_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.contract_contract_id_seq', 1, false);
          public          postgres    false    219         �           0    0 "   domestic_call_domestic_call_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.domestic_call_domestic_call_id_seq', 1, false);
          public          postgres    false    235         �           0    0 (   external_service_external_service_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.external_service_external_service_id_seq', 1, false);
          public          postgres    false    213         �           0    0 2   external_service_inclusion_external_service_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.external_service_inclusion_external_service_id_seq', 1, false);
          public          postgres    false    230         �           0    0 <   external_service_inclusion_external_service_inclusion_id_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.external_service_inclusion_external_service_inclusion_id_seq', 1, false);
          public          postgres    false    233         �           0    0 2   internal_service_inclusion_internal_service_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_id_seq', 1, false);
          public          postgres    false    228         �           0    0 <   internal_service_inclusion_internal_service_inclusion_id_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_inclusion_id_seq', 1, false);
          public          postgres    false    234         �           0    0 (   internal_service_internal_service_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.internal_service_internal_service_id_seq', 1, false);
          public          postgres    false    211         �           0    0 #   international_call_call_zone_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.international_call_call_zone_id_seq', 1, false);
          public          postgres    false    226         �           0    0 ,   international_call_international_call_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.international_call_international_call_id_seq', 1, false);
          public          postgres    false    225         �           0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);
          public          postgres    false    237         �           0    0    phone_on_tariff_contract_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.phone_on_tariff_contract_id_seq', 1, false);
          public          postgres    false    222         �           0    0 8   tariff_service_inclusion_tariff_service_inclusion_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq', 1, false);
          public          postgres    false    236         �           2606    16534    call_zone call_zone_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.call_zone
    ADD CONSTRAINT call_zone_pkey PRIMARY KEY (call_zone_id);
 B   ALTER TABLE ONLY public.call_zone DROP CONSTRAINT call_zone_pkey;
       public            postgres    false    216         �           2606    16560    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    218         �           2606    16571    contract contract_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (contract_id);
 @   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_pkey;
       public            postgres    false    221         �           2606    16872 %   domestic_call domestic_call_id_unique 
   CONSTRAINT     l   ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_id_unique UNIQUE (domestic_call_id);
 O   ALTER TABLE ONLY public.domestic_call DROP CONSTRAINT domestic_call_id_unique;
       public            postgres    false    224         �           2606    16707     domestic_call domestic_call_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_pkey PRIMARY KEY (domestic_call_id);
 J   ALTER TABLE ONLY public.domestic_call DROP CONSTRAINT domestic_call_pkey;
       public            postgres    false    224         �           2606    16691 :   external_service_inclusion external_service_inclusion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_inclusion_pkey PRIMARY KEY (external_service_inclusion_id);
 d   ALTER TABLE ONLY public.external_service_inclusion DROP CONSTRAINT external_service_inclusion_pkey;
       public            postgres    false    231         �           2606    16520 &   external_service external_service_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.external_service
    ADD CONSTRAINT external_service_pkey PRIMARY KEY (external_service_id);
 P   ALTER TABLE ONLY public.external_service DROP CONSTRAINT external_service_pkey;
       public            postgres    false    214         �           2606    16699 :   internal_service_inclusion internal_service_inclusion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_inclusion_pkey PRIMARY KEY (internal_service_inclusion_id);
 d   ALTER TABLE ONLY public.internal_service_inclusion DROP CONSTRAINT internal_service_inclusion_pkey;
       public            postgres    false    229         �           2606    16500 &   internal_service internal_service_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.internal_service
    ADD CONSTRAINT internal_service_pkey PRIMARY KEY (internal_service_id);
 P   ALTER TABLE ONLY public.internal_service DROP CONSTRAINT internal_service_pkey;
       public            postgres    false    212         �           2606    16614 *   international_call international_call_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_pkey PRIMARY KEY (international_call_id);
 T   ALTER TABLE ONLY public.international_call DROP CONSTRAINT international_call_pkey;
       public            postgres    false    227         �           2606    16750 (   client passport_series_and_number_unique 
   CONSTRAINT     y   ALTER TABLE ONLY public.client
    ADD CONSTRAINT passport_series_and_number_unique UNIQUE (passport_series_and_number);
 R   ALTER TABLE ONLY public.client DROP CONSTRAINT passport_series_and_number_unique;
       public            postgres    false    218         �           2606    16980    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    238         �           2606    16784 $   phone_on_tariff phone_on_tariff_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_pkey PRIMARY KEY (phone_on_tariff_number);
 N   ALTER TABLE ONLY public.phone_on_tariff DROP CONSTRAINT phone_on_tariff_pkey;
       public            postgres    false    223         �           2606    16444    basic_tariff tariff_id_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.basic_tariff
    ADD CONSTRAINT tariff_id_pkey PRIMARY KEY (tariff_id);
 E   ALTER TABLE ONLY public.basic_tariff DROP CONSTRAINT tariff_id_pkey;
       public            postgres    false    210         �           2606    16715 6   tariff_service_inclusion tariff_service_inclusion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_service_inclusion_pkey PRIMARY KEY (tariff_service_inclusion_id);
 `   ALTER TABLE ONLY public.tariff_service_inclusion DROP CONSTRAINT tariff_service_inclusion_pkey;
       public            postgres    false    232         �           2606    16615 $   international_call call_zone_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT call_zone_id_fkey FOREIGN KEY (call_zone_id) REFERENCES public.call_zone(call_zone_id);
 N   ALTER TABLE ONLY public.international_call DROP CONSTRAINT call_zone_id_fkey;
       public          postgres    false    227    216    3257         �           2606    16572    contract client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 A   ALTER TABLE ONLY public.contract DROP CONSTRAINT client_id_fkey;
       public          postgres    false    221    3259    218         �           2606    16649 3   external_service_inclusion external_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_id_fkey FOREIGN KEY (external_service_id) REFERENCES public.external_service(external_service_id);
 ]   ALTER TABLE ONLY public.external_service_inclusion DROP CONSTRAINT external_service_id_fkey;
       public          postgres    false    214    3255    231         �           2606    16634 3   internal_service_inclusion internal_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_id_fkey FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id);
 ]   ALTER TABLE ONLY public.internal_service_inclusion DROP CONSTRAINT internal_service_id_fkey;
       public          postgres    false    3253    229    212         �           2606    17018 7   international_call international_call_phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number) NOT VALID;
 a   ALTER TABLE ONLY public.international_call DROP CONSTRAINT international_call_phone_number_fkey;
       public          postgres    false    3265    227    223         �           2606    16981 !   payment payment_phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 K   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_phone_number_fkey;
       public          postgres    false    223    3265    238         �           2606    16795    domestic_call phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 I   ALTER TABLE ONLY public.domestic_call DROP CONSTRAINT phone_number_fkey;
       public          postgres    false    224    3265    223         �           2606    16986 ,   internal_service_inclusion phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 V   ALTER TABLE ONLY public.internal_service_inclusion DROP CONSTRAINT phone_number_fkey;
       public          postgres    false    223    3265    229         �           2606    16996 ,   external_service_inclusion phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 V   ALTER TABLE ONLY public.external_service_inclusion DROP CONSTRAINT phone_number_fkey;
       public          postgres    false    3265    231    223         �           2606    17013 0   phone_on_tariff phone_on_tariff_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(contract_id) NOT VALID;
 Z   ALTER TABLE ONLY public.phone_on_tariff DROP CONSTRAINT phone_on_tariff_contract_id_fkey;
       public          postgres    false    3263    223    221         �           2606    17006 #   tariff_service_inclusion service_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT service_id FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id) NOT VALID;
 M   ALTER TABLE ONLY public.tariff_service_inclusion DROP CONSTRAINT service_id;
       public          postgres    false    232    3253    212         �           2606    16584    phone_on_tariff tariff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id);
 H   ALTER TABLE ONLY public.phone_on_tariff DROP CONSTRAINT tariff_id_fkey;
       public          postgres    false    210    223    3251         �           2606    16716 '   tariff_service_inclusion tariff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;
 Q   ALTER TABLE ONLY public.tariff_service_inclusion DROP CONSTRAINT tariff_id_fkey;
       public          postgres    false    232    210    3251                                                                                       3433.dat                                                                                            0000600 0004000 0002000 00000002366 14516725067 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	154	23	9	4603	Aaron Castro	74894	59793
2	189	23	2	3510	Amy Raymond	10541	13790
3	54	13	5	1535	William Stevens	34786	99522
4	119	30	1	3841	Brandy Rivers MD	1997	82197
5	93	28	2	1986	Christopher Bell	2703	71234
6	142	45	8	2857	Anthony Browning	82659	99375
7	31	48	4	4862	John Flores	7141	9816
8	189	40	7	3297	Joshua Ford	13786	4798
9	86	32	1	2330	Kendra Carter	17221	33989
10	136	16	10	1316	Kristen Martin	38766	5687
11	80	14	6	3541	Connie Greene	20368	81950
12	195	38	2	4405	Sara Morgan	24506	85864
13	181	9	1	5722	Linda Sanchez	4842	85003
14	68	15	2	3887	Darryl Alexander	15602	70094
15	90	11	10	5739	Shirley Walker	71283	43512
16	155	38	7	3363	Mary Shepard	64833	91944
17	179	28	4	889	Maria Mooney	60822	87390
18	75	25	2	2201	Crystal Frank	90962	27321
19	129	12	8	5603	Michele Hodges	41439	82735
20	28	16	8	4351	Melinda Franco	59501	41546
21	130	30	6	3836	Lynn Guerra	94450	53414
22	167	14	1	3458	Rebekah Clarke	75220	95554
23	14	15	9	1418	Justin Gordon	41669	82887
24	177	35	3	4369	Shannon Henderson	94193	5993
25	93	23	6	2938	Victoria Jordan	55335	38773
26	81	18	10	2485	Kevin Powers	8084	14051
27	7	50	3	5801	Brianna Glover	72005	15175
28	120	46	1	3948	Jennifer Hayes	41325	98302
29	68	12	5	2673	Mason Gray	64719	68202
30	76	44	6	1832	James Brown	40022	48235
\.


                                                                                                                                                                                                                                                                          3439.dat                                                                                            0000600 0004000 0002000 00000001243 14516725067 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Svalbard & Jan Mayen Islands	48	Liberia	Johnport
2	Iceland	83	Jersey	Lake Tashafort
3	Northern Mariana Islands	8	Peru	East Ryan
4	Cyprus	47	Norfolk Island	Christopherchester
5	Albania	21	Svalbard & Jan Mayen Islands	New Curtiston
6	Liechtenstein	6	Germany	Jamesville
7	Svalbard & Jan Mayen Islands	41	Guinea-Bissau	New Alisha
8	Zimbabwe	12	Jordan	North Sheilamouth
9	Norway	49	Nigeria	Holmesburgh
10	Poland	9	Ghana	Stacyport
11	Trinidad and Tobago	66	Bolivia	South Allisonview
12	Togo	7	Chile	Franklinhaven
13	Azerbaijan	90	Bangladesh	Waltersshire
14	United States Minor Outlying Islands	52	Northern Mariana Islands	New Jonathan
15	Faroe Islands	56	Jersey	Lake Monica
\.


                                                                                                                                                                                                                                                                                                                                                             3441.dat                                                                                            0000600 0004000 0002000 00000036200 14516725067 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Lauren Mason	Too name far career radio Congress. Until family any bill situation factor.	6459142395	2003-05-09	96963 Lopez Landing\nWest Vanessa, NM 17345
2	William Walters	Join test yourself fish our matter system wrong.	9421315406	1908-12-01	1779 Moreno Crescent\nPort Dean, OK 46662
3	Lawrence Huerta	Condition development dinner happen nice law writer standard.	9482792550	1950-06-21	857 Wilson Pines\nDavidfurt, RI 03958
4	Mr. Adam Patel	Smile investment common partner floor travel sing.	7809160994	1990-10-03	075 Sean Stream Apt. 518\nKempburgh, MO 10200
5	Megan Davis	Color character perform reach official. Break tax international many.	8610926406	2020-10-16	10744 Julie Bridge Apt. 710\nIsabelhaven, PW 35070
6	Tiffany Garcia	Interview machine throughout. Institution someone probably imagine property first term.	5813994964	2017-02-22	59955 Molly Brooks\nNorth Carolyn, GA 96576
7	Melissa Wood	Example too stop long bar parent sea. Happy indicate hotel policy nature.	5996825609	2002-12-27	689 Charles Mount Suite 842\nAustinland, OR 90964
8	Brenda Meyer	Another song whether interview.	8954412764	1945-06-08	PSC 6076, Box 1978\nAPO AE 70918
9	Julie Rodriguez	Message rate candidate place. Course ability movie he. Process answer happy thousand.	6719906947	1949-10-29	1933 Walton Rapid Apt. 252\nLynchborough, ND 81803
10	Christina Ward	Close left question area defense read voice. Investment ever power claim sense top.	2933486658	2006-08-20	19205 James Mountain\nJoyceborough, MO 58933
11	Emily Martinez	Information well good picture. Nice water light reflect born agent structure.	7324587079	1910-12-18	USCGC Dennis\nFPO AP 19969
12	Haley Hendrix	Radio such affect effort move agency. Skill picture part particularly medical agreement.	7973340031	1931-02-09	0982 Brewer Forge Suite 128\nWest Bradley, KY 49248
13	Karen Carter	Rock organization course pattern bar TV now. Down say of want beat.	1799391860	1982-03-02	90018 Jeanette Brook\nJuliechester, LA 18916
14	Robert Forbes II	Speech base network organization war democratic test.	4509699889	1967-12-02	2132 Fisher Station\nNew Jose, LA 55500
15	Dustin Chen	Through last sound energy more other hospital product. Most challenge bad time bank.	1542684211	1948-07-13	8277 Kathleen Valley Suite 144\nPort Sherry, KY 46010
16	Michelle Green	Fund area member analysis certainly behind meeting. Relate respond today our give.	4440290395	1971-06-13	9939 Lynn Springs\nLake Tony, NC 80643
17	Michael Lynch	Specific part power history out let general. Evidence high not company.	3419351277	1997-05-03	109 Allen Radial\nJonesbury, FL 07645
18	Robert Flores	Charge these operation. Deal list their store century road star. Eye church poor.	9899642972	2002-03-03	72937 Ryan View Suite 984\nNorth Patrickfort, NH 33137
19	Anthony Dixon	Within brother him however. Avoid choose red imagine. Require yeah pull cut film.	6398279875	1998-06-24	17337 Brown Points\nNew Jill, WY 18687
20	Carl Chan	Body over audience yeah someone yeah manager. Set when cold around sport such several.	6614092352	1938-01-15	USNV Mccarty\nFPO AA 24861
21	Shawn Cooley	Church professor cultural accept support. Machine police report world.	2795011660	1937-07-28	9615 Bradley Isle\nNew Frederick, AL 70394
22	Jeffery Luna	Mother threat or term develop. Leg thought listen simple.	1569377736	1912-08-25	06872 Amy Groves\nMichellemouth, VT 89552
23	Chelsea Mitchell	Cover onto about couple. Short worker science east. Each player current share best.	9565644586	1960-06-26	752 John Lake Suite 869\nKendrashire, OK 41946
24	Noah Nelson	Individual woman set scientist study use role. Arrive within thus air development.	2210868481	1918-08-30	748 Dustin Drives Apt. 927\nNorth Amandafurt, HI 60438
25	Laurie Carter	Bag that data environmental pull. Maybe wish between glass production middle.	2307175150	1915-06-08	5534 Rivera Grove Apt. 750\nWest Kathleenshire, TX 04359
26	Thomas Stanley	Here executive certainly herself close worker. Stay magazine camera.	2673917660	1982-03-07	51774 Charles Ways Suite 631\nElizabethtown, NM 46069
27	Christopher Olson	Discussion out remember region record soon. Computer both high describe lose.	2986628960	1948-01-09	52231 Kathryn Cliff\nMichealfort, AS 34698
28	Roger Brooks	Court visit face player second. Very suffer worry suffer market field thing.	8352750445	1970-05-01	97871 Lee Flats Suite 245\nBaileyborough, NE 37229
29	Matthew Rodriguez	Improve art end body point sea. Anything better card evidence above.	4548277731	1959-08-07	PSC 3380, Box 8103\nAPO AE 82125
30	Jeffrey Smith	Read nearly father soldier. Win industry wind few none rather particularly.	5398501700	1942-09-05	USNV Glover\nFPO AP 72305
31	Jason Barry	Everything improve show member whole hope every its. Cell produce any these.	3523905158	1983-09-06	PSC 9924, Box 1707\nAPO AE 59169
32	Eric Nunez	Receive again day change. Single nor second or general back turn.	9580164724	1970-06-17	9837 Graham Islands Apt. 881\nPort Frank, MP 87964
33	David Campbell	American professional wait let. Than both money magazine hope.	6066133144	2020-10-13	22942 Olson Spring\nJoyceport, NV 32389
34	David Mejia	Heavy resource poor yes before. Certainly individual whom section receive.	8484467240	1930-01-25	638 Thompson Glen Apt. 229\nTorreston, VT 81417
35	Ashley Serrano	Page full maybe poor time. Energy building newspaper bit memory consider stock her.	6246773762	1925-03-18	091 Kristy Stream Apt. 642\nNew David, DE 76887
36	Lisa Rhodes	Soon yourself area generation which. Certainly reduce suggest morning need radio.	3680259407	1946-03-26	4788 Miller Ville\nShahmouth, MD 45104
37	Colton Montoya	Man nothing free financial claim board level. Southern off toward.	5437827000	1989-10-31	985 Garcia Manors\nWest Michaelview, MD 95776
38	Carlos Mcdaniel	Continue animal near sport. Create concern series wait federal.	1555695991	2009-08-24	19497 Gray Road\nTaylorland, AR 67596
39	Aaron Myers	Since indicate enter after cup. Kind movie he process personal. Now question my decide.	9910821550	1954-09-04	60242 Camacho Shore\nEast Cindychester, ND 57831
40	Tanya Rubio	Improve assume although decide. Focus small reduce enter stage.	8777638787	2005-03-25	USS Schwartz\nFPO AP 21701
41	Jessica Combs	Ten food sport mother police easy. Perform opportunity you knowledge big still price.	4404484893	1969-11-05	4590 Ortega Summit Suite 016\nNew Richard, CO 97281
42	Elizabeth Baker	Action American itself room throw. On son else.	6930842715	1969-10-31	57792 Perkins Forge Apt. 372\nEast Joshua, MO 03353
43	Melissa Gonzales	Forget success shake tell. Million speech respond remain week say deal.	3070361362	1983-10-02	799 Clarke Plaza Apt. 769\nEast Tanyafort, DE 33584
44	Andrea Allen	Son music already list. Money research never yet public cup education.	6995639753	1949-03-05	5721 Hunter Field Suite 459\nNorth Brianfort, NM 76410
45	Cody Lopez	Year business me article. Reality sound painting especially adult. Sit item charge join.	4224824845	1917-07-17	8180 Moore Freeway\nSouth Adam, IL 14964
46	Christopher Robinson	North main hand. Visit establish if beautiful pay. President red assume partner.	6260510775	1977-04-23	9323 Marks Springs Apt. 086\nRodneyland, AL 65582
47	James Davis	Partner man choice. Whether get when skill major few ago.	2886991776	1960-07-31	52022 Melissa Square Suite 057\nPort Samuelburgh, AR 55293
48	Sarah Nelson	Series fear look son teacher role. Message ahead western within but clearly.	5097449574	1942-08-15	7881 Myers Ranch Apt. 955\nLake Anthony, MA 64603
49	Jennifer Harris	Organization only size same. Attention word mind generation enough air.	4073891088	1978-08-31	22273 Guerrero Lights Apt. 634\nSilvahaven, DE 56784
50	Gregory Gomez	Page team care policy increase lawyer. Among catch structure say walk ok well.	9967413175	2006-01-07	PSC 7845, Box 7146\nAPO AA 15949
51	Emily Camacho	Kitchen by similar more large. Such TV road parent if everything ask.	6692571675	2001-08-28	00039 Daryl Glens\nKaylaland, GU 38757
52	Kenneth Salinas	Center not per debate born owner fill. Discover trip move we first ground as.	7134715996	1924-06-15	600 Tyler Prairie\nLake Raymond, NE 35649
53	Kayla Jones	Same also teach television right serious.	5629535229	1929-09-08	210 Johnny Point\nDianahaven, AL 85749
54	Todd Long	Staff pick look dog music. Hair site factor campaign concern. Draw last media quite.	4064905660	2000-03-24	99089 John Expressway\nJeffreyside, GA 13470
55	Shannon Adams	Cause little agreement entire. Character right about computer.	4060777516	1945-02-01	604 Freeman Fork\nAlejandrafort, NJ 60852
56	Melissa Schmidt	War change be road. Seem knowledge per sense.	2584498770	2006-01-06	055 Robert Gateway\nWilliamsstad, UT 82899
57	Stephanie Marquez	Television smile beat play phone future society. Man staff produce picture.	1265288468	2015-07-08	22938 Hawkins Plain Suite 215\nSimonside, NE 11370
58	Jonathan Chambers	Fear hotel know against skin among. Indeed college exist table drop force we.	3849627778	2014-07-22	9936 Wallace Light\nSouth Michael, AZ 29023
59	Mark Fowler	End visit different eat. Civil give skin interest body growth close.	4795738901	1990-12-29	920 Garza Views\nJacksonhaven, TN 58382
60	Brianna Noble	Letter eye year pick enter compare. Present stay information.	9597316153	1973-08-07	9974 Sullivan Spring\nSmithchester, CA 78833
61	Damon Little	Father them important only he my determine. Drive focus director to religious.	6881078323	2005-03-05	8410 Robinson Ports\nLake Jessicaberg, NH 52416
62	Janet Lewis	Friend send American her radio perform social likely. Note but he top drug open.	5213970630	1942-01-23	19316 Timothy Loaf Apt. 678\nCarterhaven, HI 76468
63	Ian Baldwin	Make difficult in organization police throw respond Democrat. Career nature race prevent.	3681529340	1970-02-07	0467 Duncan Ways Suite 317\nLeeborough, OH 49484
64	Jeffery Rice	From parent speech. During move per professional sport.	1401856464	1917-10-29	22973 Kevin Cliffs\nNorth Joy, SD 31040
65	Ashley Powell	Option other rest. Ever suddenly thought television.	8592434789	1907-12-31	8706 Claudia Landing\nDyermouth, PA 45119
66	Ms. Karen Clarke	Eight like scientist give. Half relate beyond game nor order.	3129266573	1962-07-17	76868 King Views Apt. 261\nLake Tinaland, AL 94049
67	Belinda Perez	Bar result body professor budget from free. Race black factor admit.	2210994101	1935-03-28	Unit 3231 Box 8025\nDPO AE 99891
68	Andrea Luna	Available least moment identify sport course include.	3229298947	1983-03-25	8734 Bryant Corner Apt. 687\nWest Amber, UT 70657
69	Tonya Hunter	Carry discover clearly thought truth phone drop happy.	2125802170	1909-09-09	06257 Curtis Hill Apt. 862\nNataliefort, WA 20544
70	Arthur Combs	Out within hair theory. Support contain mission against. Field pattern paper.	7916719343	1932-09-23	45181 Bailey Forge\nSouth Veronica, KS 93352
71	Beth Clark	Two into weight already condition everything kid.	6170078931	2005-07-12	62804 Rebecca Common\nChristopherfurt, VA 68926
72	Katrina Austin	Present many design class. Policy analysis can mind analysis event.	4614941980	1986-09-05	2482 Pearson Summit Apt. 417\nNorth Samantha, TX 29300
73	Eddie Hall	Free particular everybody key. Art Mr indeed economic. Audience turn lay computer.	7271741070	1954-10-19	Unit 5225 Box 1859\nDPO AE 59162
74	Johnny Brown	Until address personal to. Structure shake white stuff plan. Seek itself travel bad.	5336443969	1971-11-27	6176 Hurley Walks\nWest Charles, MP 48192
75	Jennifer Macias	Service able month past story agency. Follow service stage reduce create beyond.	8584558016	1997-08-24	76363 Fowler Flat Apt. 556\nEast Sarah, PA 14656
76	Natalie Bradley	Catch miss now thank outside. Face election brother statement bill.	7002155487	1991-07-14	320 Fowler Street\nDebraburgh, CA 01229
77	Robert Obrien	Glass style establish office general out college.	3209852101	1977-01-20	970 Zachary Route\nAllenland, MP 26980
78	Renee Peters	Nearly security show daughter we way. Tend leader strong so out thus something.	5007587627	1944-10-05	6148 Clark Mills\nDaltonville, GA 13738
79	Sarah Pena	Although value market citizen very score natural.	1603220056	1977-03-09	9232 Janet Lodge Suite 240\nEast Kevin, AZ 20613
80	Crystal Kim	Job piece peace whatever. Drop bar protect two current throughout boy pressure.	7236575105	1908-05-29	97328 Walker Throughway Suite 151\nNew Erin, RI 48223
81	Jordan Bush	Piece far show radio. High speak each everyone old. Conference else read system some.	5633887242	1979-10-06	917 Young Falls\nMariamouth, VT 75843
82	Rebecca Anderson	Manager produce pull within. Artist beat pass woman. Use dog focus involve.	5469394455	1978-04-11	77603 Emily Cliffs\nJoseberg, LA 87562
83	Linda Gardner	Require beyond Mr might up dog piece. Magazine newspaper executive war debate why.	5860655884	1926-10-27	12636 Moses Alley Suite 471\nSouth Scottbury, DC 24405
84	Stanley Maddox	Bag myself candidate television establish. Tree six TV now environment site bed.	9720280013	1973-11-04	7567 Campos Rue\nEast Jerry, MH 49257
85	Brian Powell	Test election old direction require. Its several floor report.	2494760860	1995-02-26	633 Donna Harbors\nNorth Michaelville, NE 79021
86	Mark Mcbride	Government win sort result middle rest. Music hit bed large create article.	1627291514	2000-02-02	69663 Brian Knolls Suite 969\nNew Josephview, MP 14284
87	David Sanford	Edge stock down thousand head. Full age fine. Front owner region four.	1489759264	2009-01-30	230 Mcconnell Brook Suite 280\nVictoriaport, AZ 00759
88	John Bright	Smile could if television. Until value eye ground offer trade great.	2754602187	1997-09-26	Unit 5490 Box 2477\nDPO AA 75985
89	Mr. Donald Middleton DVM	Why own series southern game. Play father country win indeed.	3837481519	1919-09-08	349 Rachel Junctions\nPort Alexander, RI 28314
90	Collin Schmidt	Politics low wish star. Role recognize interest agree front.	2401510594	1995-12-01	93736 Ronald Center Apt. 923\nWest Thomasside, OR 05884
91	Natalie Bryant	Over but as hot. Know themselves near movement source once image. Race data service.	4484701173	2001-03-19	07720 Berry Divide Suite 123\nSouth Angel, WV 37072
92	Emily Leonard	Garden force citizen modern edge few.	6017659550	2013-02-08	Unit 9232 Box 2099\nDPO AE 22073
93	Angela Noble	Party good ability Mr movement. Everybody policy guy today. Somebody source if.	4750984708	1929-05-03	3888 Hebert Squares\nNew Johnborough, VT 08446
94	Christopher Freeman	Including beat wind. Plan enter rock college where size out series.	5382199164	2011-02-06	5674 Moss Lakes Suite 559\nCartermouth, DC 15736
95	Matthew Oliver	Whose set involve administration begin agent.	3953732322	1978-12-14	0499 Young River\nFosterfort, ME 90113
96	Pam Harris	Role man share site allow determine customer. Way successful determine career final.	9183053751	2004-06-19	9972 Daniel Crossing\nIsabelport, WI 73121
97	Ryan Maynard	Account system tonight issue daughter. Attack eat war sure fast behavior.	3376652224	1971-06-07	3267 Herrera Spurs Apt. 981\nCoxhaven, SD 72624
98	Tammy Dixon	Visit and their somebody. Wall court building population worker month act.	5984731418	2000-04-17	59565 Murphy Overpass\nStephanieview, GU 75506
99	Anna Gutierrez	Soldier wind why a but home total. Case trade born us.	8127613676	1915-02-27	161 Nixon Track\nEast Amandafurt, ME 08671
100	Molly Brown	Body piece base ten interest large anyone. Still win agent center focus find.	3391993538	1971-10-08	63794 Lamb Drive\nSouth Emilytown, SD 55828
\.


                                                                                                                                                                                                                                                                                                                                                                                                3444.dat                                                                                            0000600 0004000 0002000 00000013057 14516725067 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	98	2009-03-13	2014-06-29
2	19	2014-10-03	2015-05-22
3	65	2019-08-20	2021-12-05
4	62	2014-03-18	2018-04-10
5	7	2009-07-31	2015-11-24
6	79	2002-01-11	2018-08-10
7	66	2006-09-29	2017-02-21
8	7	2010-10-11	2017-02-16
9	98	2017-01-04	2022-03-28
10	52	2003-04-29	2023-12-08
11	92	2003-05-22	2008-02-15
12	86	2003-07-22	2014-05-07
13	80	2009-04-23	2020-04-02
14	91	2005-11-28	2006-04-10
15	92	2014-08-18	2018-05-31
16	26	2008-09-02	2023-04-15
17	23	2016-12-31	2017-07-28
18	44	2018-12-24	2021-06-30
19	52	2017-05-23	2020-11-14
20	34	2005-06-20	2020-02-20
21	41	2014-10-02	2019-08-23
22	4	2011-11-30	2018-09-22
23	31	2012-11-07	2012-12-03
24	85	2005-04-18	2015-10-09
25	32	2009-02-28	2017-10-20
26	75	2018-10-28	2023-08-10
27	94	2018-09-13	2021-05-25
28	4	2005-10-19	2023-12-09
29	24	2009-01-15	2010-06-05
30	2	2000-09-06	2006-02-21
31	10	2005-01-10	2020-06-30
32	25	2004-12-24	2008-12-11
33	44	2007-04-21	2011-03-15
34	97	2009-04-07	2023-08-13
35	65	2006-05-06	2022-02-18
36	76	2005-08-02	2011-05-13
37	65	2000-04-06	2021-08-06
38	58	2004-09-30	2015-08-16
39	86	2001-07-05	2002-01-26
40	2	2009-10-31	2018-03-20
41	19	2005-04-03	2014-06-08
42	29	2009-06-23	2015-06-03
43	88	2019-11-14	2020-11-12
44	33	2000-09-13	2020-12-21
45	24	2007-08-13	2007-09-01
46	26	2004-02-03	2023-09-09
47	74	2002-02-23	2014-01-09
48	94	2006-02-07	2019-01-02
49	62	2003-06-29	2007-11-04
50	39	2017-12-28	2019-08-12
51	87	2006-09-20	2010-10-02
52	49	2006-11-08	2013-08-13
53	89	2015-05-07	2017-08-29
54	38	2001-08-07	2022-04-09
55	41	2001-03-24	2021-02-12
56	3	2022-02-07	2022-04-08
57	88	2020-07-25	2021-10-14
58	55	2002-04-26	2015-02-18
59	35	2005-12-03	2016-09-19
60	23	2019-03-13	2022-02-03
61	66	2006-05-11	2018-11-07
62	61	2011-12-31	2018-05-23
63	98	2004-06-06	2014-02-13
64	64	2007-05-10	2019-06-09
65	41	2022-07-16	2023-08-05
66	56	2007-03-15	2008-02-01
67	37	2017-03-23	2019-08-29
68	98	2007-02-07	2020-08-15
69	35	2000-04-15	2001-09-02
70	61	2012-11-23	2019-05-13
71	92	2001-06-10	2005-02-22
72	4	2004-06-16	2016-11-29
73	90	2014-12-29	2017-05-30
74	50	2008-03-24	2018-12-10
75	55	2008-03-06	2008-03-07
76	28	2007-04-02	2020-11-14
77	49	2001-01-16	2015-02-03
78	3	2004-01-20	2004-11-22
79	26	2005-07-07	2006-06-07
80	94	2013-01-02	2022-12-12
81	23	2008-12-13	2015-02-05
82	31	2001-11-19	2005-08-23
83	74	2008-09-05	2014-08-19
84	48	2003-10-14	2008-02-12
85	58	2014-05-22	2017-03-02
86	74	2022-07-26	2023-09-17
87	59	2002-03-06	2015-08-16
88	63	2003-02-06	2015-09-29
89	47	2019-02-12	2021-01-18
90	85	2000-06-17	2016-03-07
91	94	2009-03-01	2022-11-30
92	52	2002-06-10	2006-02-18
93	65	2015-07-03	2016-03-24
94	15	2009-12-18	2020-12-10
95	51	2005-05-31	2007-09-21
96	10	2009-07-12	2020-04-17
97	44	2004-05-24	2012-12-13
98	96	2001-07-31	2013-07-30
99	76	2005-08-06	2023-08-17
100	75	2013-04-06	2015-07-24
101	82	2011-08-27	2017-05-05
102	33	2003-02-04	2007-02-07
103	56	2017-11-03	2022-03-19
104	42	2012-05-16	2015-05-08
105	88	2003-09-17	2008-05-17
106	56	2005-11-05	2021-10-20
107	76	2012-04-08	2019-11-04
108	6	2012-03-17	2016-08-08
109	26	2002-04-29	2016-09-02
110	11	2007-10-27	2017-12-02
111	52	2009-03-19	2011-11-29
112	63	2008-09-24	2018-06-17
113	44	2011-10-16	2016-11-20
114	85	2010-04-18	2012-09-06
115	9	2004-06-11	2023-01-19
116	76	2012-04-25	2017-03-16
117	85	2000-03-29	2004-08-03
118	87	2010-03-14	2016-10-19
119	79	2009-10-16	2023-11-14
120	59	2001-10-10	2011-12-09
121	21	2011-03-27	2015-05-20
122	94	2000-01-25	2023-05-24
123	84	2018-09-18	2021-09-01
124	42	2011-05-04	2011-05-15
125	78	2001-02-04	2020-09-01
126	13	2005-08-27	2016-11-16
127	58	2002-07-21	2007-02-08
128	96	2015-05-08	2023-12-27
129	39	2004-04-22	2021-11-08
130	20	2007-04-04	2014-03-07
131	48	2014-07-06	2022-07-26
132	25	2019-04-06	2020-10-23
133	85	2006-07-03	2014-10-22
134	58	2009-01-26	2010-07-13
135	48	2007-05-16	2010-08-06
136	49	2002-06-02	2003-07-13
137	62	2005-08-05	2015-12-02
138	18	2009-07-25	2015-10-06
139	85	2008-10-07	2017-09-29
140	6	2015-08-28	2018-11-15
141	5	2013-05-27	2022-09-22
142	16	2018-02-24	2022-11-12
143	40	2007-01-26	2007-05-25
144	40	2012-11-14	2017-08-11
145	23	2002-11-05	2007-03-24
146	8	2012-05-12	2016-02-26
147	12	2002-09-29	2019-02-11
148	28	2000-08-27	2003-11-07
149	42	2021-08-18	2023-05-02
150	55	2012-12-22	2020-10-23
151	85	2000-06-13	2016-03-02
152	54	2010-09-25	2016-01-01
153	53	2015-11-20	2022-01-11
154	98	2015-02-21	2018-09-29
155	4	2014-10-08	2018-06-01
156	8	2007-04-17	2022-09-12
157	45	2009-04-25	2011-04-11
158	23	2016-11-14	2018-06-30
159	12	2016-09-20	2019-02-26
160	22	2003-06-09	2012-01-03
161	23	2006-11-19	2017-05-03
162	77	2015-11-10	2021-04-25
163	12	2011-07-12	2021-10-05
164	79	2000-02-20	2001-03-16
165	56	2010-04-28	2022-10-14
166	28	2004-01-31	2016-03-29
167	41	2001-08-24	2018-12-14
168	96	2001-02-24	2019-03-30
169	85	2008-02-26	2008-09-28
170	58	2014-03-20	2016-03-13
171	28	2017-03-15	2021-11-19
172	98	2004-02-28	2015-05-07
173	44	2005-04-09	2014-06-06
174	49	2001-12-13	2023-03-07
175	18	2005-03-22	2010-09-09
176	68	2002-08-09	2002-10-16
177	9	2008-01-31	2014-01-21
178	42	2007-01-16	2009-02-04
179	80	2000-02-26	2013-10-15
180	22	2008-01-08	2009-08-26
181	95	2000-07-17	2009-06-19
182	44	2001-02-24	2008-11-28
183	49	2001-01-25	2018-07-16
184	4	2015-05-04	2023-12-12
185	86	2003-12-15	2012-07-03
186	20	2018-10-02	2020-01-26
187	54	2004-01-02	2015-07-22
188	64	2006-05-14	2008-05-30
189	40	2000-12-14	2018-03-27
190	5	2019-04-11	2022-03-09
191	92	2002-11-09	2010-09-01
192	77	2001-08-02	2011-10-04
193	94	2012-08-16	2023-11-28
194	33	2009-11-13	2021-09-09
195	100	2004-05-31	2021-09-16
196	73	2005-06-01	2006-01-09
197	74	2007-10-19	2016-07-02
198	45	2006-05-06	2019-01-04
199	83	2005-02-04	2018-05-20
200	84	2011-03-26	2021-08-06
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 3447.dat                                                                                            0000600 0004000 0002000 00000032271 14516725067 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        87524724305	83630038004	2015-03-01 03:01:31	2017-12-27 02:32:03	1
85393070976	83434716995	2012-05-02 22:44:20	2012-05-19 23:00:31	2
84641521075	88063132062	2000-07-10 23:30:10	2007-09-03 21:30:12	3
85318764803	87308609495	2000-04-20 10:25:40	2002-06-13 23:07:43	4
81974404285	88686637097	2004-10-13 19:51:35	2022-11-20 13:56:09	5
89152297934	81193274375	2006-07-29 00:03:43	2008-03-01 16:08:48	6
89627994826	81272583628	2001-06-20 06:36:27	2021-01-12 14:11:47	7
85565214442	81834251955	2009-08-07 06:35:50	2011-01-27 11:58:39	8
81636172720	87395751914	2004-05-29 14:54:01	2008-09-07 09:49:22	9
84647907788	87716726601	2005-06-24 22:47:58	2015-07-03 13:13:02	10
83633779974	83774318368	2008-06-22 21:19:02	2021-05-07 03:44:51	11
82175988839	86973322478	2002-05-25 04:48:59	2021-01-13 13:12:10	12
89808284555	87312837291	2001-10-28 12:58:14	2017-12-21 19:10:55	13
88471149100	81839725897	2006-09-26 02:35:27	2013-09-11 10:25:46	14
89256909812	81351445183	2006-06-25 16:38:16	2009-10-31 16:45:30	15
89369956732	89844900220	2017-03-22 17:47:58	2020-02-27 01:44:37	16
88864470392	86128319451	2005-07-03 07:27:16	2009-04-25 04:47:02	17
86251707383	82453780011	2003-12-17 10:03:10	2018-05-17 21:11:09	18
88136644056	82453780011	2004-01-19 03:33:11	2011-09-08 12:53:37	19
87310152610	86973322478	2009-07-11 22:25:16	2017-11-03 12:59:01	20
89648494338	83589371211	2002-03-26 08:13:48	2005-10-18 17:17:24	21
87902278454	88686637097	2007-02-05 12:15:55	2011-03-20 06:02:23	22
84919495776	87308609495	2008-10-17 02:00:36	2023-07-08 06:56:41	23
85731287762	82540578006	2011-04-29 01:14:06	2015-03-22 20:25:19	24
85453225640	83038342901	2001-02-09 15:22:23	2003-10-15 03:05:38	25
84915202752	83495694331	2007-08-17 13:10:41	2007-11-12 21:11:32	26
85382993846	86973322478	2012-03-24 18:23:23	2015-06-03 07:03:22	27
81508098666	86128319451	2001-06-27 18:20:20	2009-12-28 07:04:46	28
86958511469	85121541173	2008-06-09 03:45:33	2017-11-26 09:47:15	29
88555125558	83231037288	2007-04-04 18:54:10	2008-07-31 08:25:17	30
89877785845	81272583628	2004-11-12 00:38:27	2007-02-03 14:16:15	31
82935475783	87207296042	2012-05-20 11:38:23	2017-01-17 07:41:48	32
84852575241	83589371211	2011-05-20 07:21:07	2013-12-02 19:38:02	33
88601921396	81525714909	2014-03-28 19:35:53	2023-11-22 00:39:56	34
86047679258	85201742231	2009-12-19 12:23:19	2017-10-15 18:37:55	35
84027470047	85162225551	2010-04-26 06:21:48	2021-12-01 15:24:15	36
89715965980	89167792152	2009-10-13 00:33:56	2013-05-24 15:30:06	37
85466080498	82440436528	2006-06-07 09:35:05	2007-01-30 15:49:53	38
87870133986	83774318368	2006-05-17 14:32:11	2010-02-05 20:08:40	39
89711086891	88063132062	2001-03-07 07:12:29	2013-09-28 00:20:30	40
84794348515	82700964651	2008-12-20 21:01:48	2018-03-18 04:23:41	41
81423510185	86973322478	2013-07-20 12:03:50	2021-07-04 07:52:22	42
84628217618	87207296042	2007-10-21 13:59:16	2019-01-09 12:48:22	43
89881036244	82651331557	2013-12-04 04:22:01	2022-02-07 11:18:48	44
85853765349	86128319451	2000-07-31 03:32:51	2011-06-08 13:53:54	45
87853673181	88874893105	2001-11-20 12:43:34	2020-04-04 17:42:20	46
83485442947	86329113206	2008-02-06 05:45:10	2009-12-22 13:07:04	47
84325298566	89931173404	2012-11-22 22:16:16	2016-11-21 07:52:22	48
85309812799	83164665019	2008-06-28 15:50:13	2012-08-07 03:48:55	49
83755372180	87312837291	2000-07-09 08:24:42	2002-05-25 23:37:12	50
89262235484	86128319451	2002-04-30 21:16:41	2017-02-27 22:13:26	51
84082663373	83231037288	2004-09-06 22:19:48	2006-11-02 14:32:49	52
85255567127	89605694853	2000-09-04 00:29:12	2003-12-05 21:04:34	53
87532197785	82700964651	2000-01-01 22:32:34	2003-07-15 04:33:26	54
87286457410	82884816243	2008-10-14 19:09:15	2009-08-28 13:06:54	55
87709984415	88029686047	2011-09-25 00:37:24	2017-02-20 03:53:28	56
81363141530	81525714909	2008-10-17 21:09:56	2015-11-25 11:35:06	57
89043614915	83434716995	2013-04-05 17:53:05	2023-04-30 15:59:03	58
84539878740	83589371211	2017-07-01 11:46:20	2022-08-10 18:33:30	59
81809249766	85162225551	2016-04-28 20:19:28	2018-12-08 18:49:09	60
85051109379	83495694331	2006-06-06 14:23:57	2015-02-18 12:47:35	61
87405070315	89670073963	2015-05-16 07:49:04	2020-03-24 22:57:21	62
89080639858	83039121686	2001-08-18 08:09:49	2011-08-22 17:51:10	63
85938287630	89670073963	2016-01-19 11:47:13	2016-03-07 03:00:29	64
89143037364	84157873461	2015-07-30 06:39:17	2022-02-25 22:13:27	65
81333200739	82717184948	2016-09-20 08:08:13	2018-01-23 09:01:22	66
86689941483	87141610652	2010-08-17 07:35:25	2017-11-28 22:17:40	67
84302675092	81690604571	2004-05-13 16:08:17	2006-06-22 21:10:24	68
86669194442	82651331557	2004-07-12 05:42:10	2023-12-11 23:32:05	69
84134924654	83231037288	2005-04-22 10:36:13	2018-01-27 11:58:31	70
82255780322	84157873461	2008-09-20 04:59:04	2018-06-17 07:29:41	71
81368960533	85411706214	2013-07-17 14:02:28	2014-07-03 08:38:18	72
83695143713	83231037288	2001-10-22 19:17:50	2016-06-15 06:27:26	73
85555738829	82540578006	2003-04-25 21:42:55	2010-02-26 17:16:07	74
89596971090	88686637097	2006-07-23 14:29:43	2018-09-08 10:11:01	75
85210575538	83630038004	2014-02-08 12:00:43	2017-05-10 12:02:37	76
86742337624	83253580355	2000-02-02 10:46:11	2019-09-18 06:07:45	77
87556431759	81690604571	2014-11-17 23:11:07	2017-11-09 23:08:38	78
84087519125	82010648116	2001-06-28 00:26:07	2002-11-30 04:35:00	79
83449100304	86128319451	2001-09-05 13:40:38	2003-09-16 17:46:30	80
81964137373	89167792152	2006-08-25 03:35:33	2016-06-16 03:32:27	81
87843627284	87850980321	2008-01-30 01:15:11	2009-01-31 23:19:07	82
86370906416	89742497510	2021-03-23 06:54:05	2021-05-21 21:48:54	83
87286448413	88354875145	2008-08-28 08:33:34	2015-07-21 03:48:52	84
89200361969	81341681439	2011-03-19 16:23:10	2018-03-06 16:39:26	85
84830379254	82010648116	2010-05-22 12:50:24	2013-08-20 23:51:58	86
88803773276	89844900220	2009-06-12 02:48:29	2011-12-15 03:46:32	87
84437181526	81015822213	2011-02-15 21:22:40	2020-04-21 05:55:43	88
81917197601	89670073963	2001-06-08 07:49:40	2001-07-05 05:56:39	89
82261714086	85922675734	2018-10-29 19:05:13	2021-09-01 18:05:10	90
85240023658	81539108668	2010-11-24 18:41:56	2013-08-02 22:56:07	91
89286429263	82010648116	2008-06-14 22:46:22	2013-01-13 03:10:15	92
84553146189	85937533879	2016-10-16 11:13:26	2017-10-07 12:32:27	93
84037458312	83231037288	2003-10-09 09:31:53	2016-11-06 00:20:55	94
87095253072	81393324182	2009-04-03 18:41:48	2014-12-22 20:33:58	95
83256210949	81015822213	2012-01-30 16:41:18	2022-04-14 13:27:30	96
83938528274	88686637097	2001-07-05 14:43:54	2019-05-19 10:25:36	97
89917716369	89175874533	2005-06-24 13:13:21	2019-02-03 10:16:35	98
83023010937	86948251411	2008-01-28 12:21:05	2017-04-21 21:10:43	99
89436186955	86128319451	2004-05-10 16:11:43	2017-07-11 00:04:08	100
83928026883	82010648116	2012-06-24 02:51:12	2015-02-21 00:33:37	101
84594377566	88063132062	2017-02-25 18:04:12	2022-02-08 05:56:56	102
86284111266	85922675734	2000-01-26 02:55:05	2003-05-04 08:24:27	103
83901295311	82514913257	2011-01-20 01:55:36	2022-08-01 21:26:49	104
87181970706	83162443692	2003-04-21 11:19:19	2005-12-01 12:37:30	105
83153901433	86256652966	2019-12-24 23:06:52	2019-12-26 16:40:17	106
89810220634	81525714909	2015-12-03 03:13:51	2021-07-07 09:39:57	107
84619330429	85937533879	2010-09-30 03:19:02	2023-01-18 08:21:31	108
89598667315	85121541173	2009-04-08 15:38:07	2016-10-07 07:22:50	109
82737667163	87850980321	2002-10-29 11:57:45	2018-11-30 14:07:25	110
85877465649	87312837291	2017-01-20 17:57:40	2020-01-07 11:12:35	111
85921346405	83774318368	2015-04-22 14:38:57	2017-09-12 19:19:39	112
82652975798	83939283170	2006-01-09 08:33:32	2010-02-18 01:07:31	113
88497823087	82700964651	2013-07-20 04:33:22	2022-06-06 06:24:15	114
89655035592	82440436528	2001-11-23 05:16:15	2023-01-22 18:07:17	115
88357196642	85201742231	2010-02-27 01:56:40	2013-08-16 03:41:23	116
83976992137	81651408391	2003-07-27 04:13:07	2013-02-28 13:28:05	117
88843534254	84548540986	2006-02-20 06:27:54	2007-02-03 14:01:44	118
88213027745	82651331557	2004-01-06 23:04:48	2007-08-14 01:44:58	119
82171882108	87293111316	2006-09-13 11:30:25	2022-06-24 20:10:22	120
87892070695	86017927001	2002-06-10 07:13:26	2022-10-09 15:01:07	121
89489526020	89931173404	2000-10-27 10:20:02	2006-07-04 03:48:43	122
86187260985	85201742231	2018-12-04 01:07:25	2021-05-04 00:04:24	123
88861097079	82651331557	2002-03-02 16:04:30	2014-09-26 07:03:11	124
84605177109	83630038004	2017-09-27 21:02:22	2018-04-21 04:55:14	125
87067822134	87651296848	2007-09-24 07:53:00	2016-11-06 12:50:57	126
88314653008	86256652966	2010-09-13 12:22:26	2013-04-23 15:51:17	127
83780396869	87816542499	2010-08-23 08:58:37	2016-02-25 20:57:41	128
82385252827	83164665019	2004-07-23 13:19:07	2017-01-06 05:08:51	129
85599210614	89909942854	2003-05-25 16:37:25	2011-11-23 07:00:44	130
84151617217	83253580355	2006-08-03 19:40:53	2016-03-10 07:25:36	131
89112767377	81690604571	2000-08-01 02:39:03	2008-11-26 13:36:25	132
86499279480	88063132062	2020-08-05 09:11:46	2021-05-14 03:50:33	133
85175441351	89730642391	2005-09-16 06:16:12	2008-04-05 08:18:19	134
83358045551	86973322478	2005-07-03 13:20:44	2022-08-18 03:51:22	135
83277049845	83367260233	2002-06-24 21:41:28	2023-07-23 10:45:27	136
85074600884	83774318368	2017-02-08 02:02:58	2019-09-06 14:49:27	137
85110779676	81760439158	2011-03-19 16:58:43	2015-05-24 05:14:24	138
85651860461	82700964651	2011-05-16 16:07:57	2016-06-04 18:23:09	139
87519548963	87395751914	2010-09-17 23:13:49	2021-01-09 16:27:57	140
86454372876	88874893105	2005-09-02 01:10:38	2010-10-20 04:37:47	141
85776345759	88874893105	2008-08-10 00:18:18	2014-03-23 21:33:54	142
81302953924	81525714909	2012-06-27 15:33:33	2019-04-29 16:41:38	143
88100424189	89605694853	2004-09-13 05:21:27	2017-11-14 15:27:58	144
82775162263	83164665019	2016-09-14 09:13:57	2020-06-03 15:41:00	145
85740343388	82717184948	2011-06-19 19:00:14	2019-08-28 15:33:13	146
84225678530	83774318368	2016-08-14 02:48:38	2022-04-28 06:01:44	147
83466180292	89730642391	2007-06-01 21:20:01	2007-09-02 16:32:49	148
83059972930	87127921928	2012-11-24 18:22:32	2015-01-16 20:08:11	149
83696611934	84548540986	2000-02-24 06:47:14	2004-10-10 01:00:34	150
83122692480	82540578006	2002-08-28 01:58:25	2022-04-18 17:04:04	151
86516126911	84182198979	2018-11-19 17:15:34	2021-06-10 10:14:57	152
85954191509	88874893105	2000-03-29 05:18:55	2007-06-16 12:02:40	153
88488272568	81341681439	2010-04-23 18:56:26	2014-06-07 19:27:20	154
87787452739	81690604571	2001-11-30 12:04:34	2014-11-19 03:01:45	155
85781378133	86128319451	2008-05-30 14:20:16	2018-10-10 00:35:59	156
88760767898	89844900220	2010-02-23 13:56:36	2018-12-17 15:22:30	157
89415994601	83939283170	2005-05-28 05:40:37	2014-12-27 02:33:13	158
85629863837	81918740958	2007-03-14 01:24:48	2011-08-31 08:37:08	159
83283317638	89567417811	2006-10-13 00:06:59	2009-10-20 01:53:34	160
81952868284	81351445183	2016-11-08 10:39:16	2018-01-18 22:45:38	161
82248373078	88063132062	2006-06-19 23:39:15	2023-06-24 15:29:39	162
85820411012	85162225551	2012-04-20 08:39:22	2016-09-14 07:31:51	163
83323281695	83231037288	2001-01-17 03:30:57	2009-12-06 22:31:05	164
87499510751	82010648116	2004-02-14 09:11:51	2017-10-01 18:36:48	165
87475424808	85390205129	2008-01-11 21:06:40	2013-11-10 15:43:26	166
84299854086	86813650741	2000-05-20 13:44:24	2012-03-29 00:06:27	167
89049671254	82514913257	2012-05-11 19:20:15	2014-05-06 12:17:38	168
81551578401	85896878969	2004-07-28 06:01:49	2023-02-25 14:31:33	169
89043848596	85794497850	2006-07-06 07:49:55	2021-09-30 20:50:21	170
84957962227	88354875145	2008-03-23 01:30:53	2023-04-23 00:18:23	171
82103411090	83162443692	2004-11-23 15:42:08	2022-03-10 15:46:49	172
82387391239	83495694331	2019-04-09 05:44:11	2019-08-12 23:25:04	173
88850883235	86329113206	2004-03-01 17:12:08	2010-06-16 10:32:20	174
89478475851	83939283170	2019-02-04 10:20:59	2019-03-04 12:31:02	175
83574699724	83367260233	2001-09-21 12:47:27	2008-11-13 17:42:15	176
83795791449	87850980321	2013-08-14 10:10:11	2018-12-01 17:37:29	177
88740063945	81272583628	2008-12-12 18:58:00	2023-08-26 13:18:53	178
84684208959	87207296042	2018-10-04 12:35:03	2020-03-31 15:08:15	179
88260355133	88686637097	2010-03-23 07:48:21	2012-05-05 09:54:01	180
83804451257	85181997756	2001-08-21 05:39:32	2019-11-24 09:30:40	181
83104407686	85922675734	2010-08-10 21:30:00	2020-06-11 21:42:38	182
83478228294	82514913257	2016-02-01 01:59:07	2017-11-21 06:48:47	183
87452712644	87850980321	2012-06-24 19:09:40	2016-07-12 06:20:20	184
89883169542	86451732519	2010-02-05 11:00:31	2017-08-14 17:05:03	185
88662951373	82651331557	2006-10-12 17:06:37	2012-01-06 21:54:38	186
85977002595	82717184948	2010-08-13 03:32:32	2011-03-11 18:30:42	187
82623529297	87972625997	2005-12-27 17:08:39	2006-10-06 22:57:59	188
86143248723	81341681439	2004-08-16 20:35:41	2011-05-15 21:17:41	189
88125794548	87127921928	2005-02-13 23:52:31	2017-06-10 23:46:53	190
89415423323	81290751976	2003-10-29 03:51:21	2012-08-02 07:37:39	191
89246871095	86948251411	2014-05-24 11:14:04	2016-05-13 03:32:46	192
84557664220	82884816243	2007-08-31 10:16:29	2017-05-01 02:32:27	193
83833845987	86948251411	2015-02-12 10:21:40	2018-01-19 00:01:31	194
87939907162	83253580355	2001-11-19 05:58:30	2012-03-19 21:28:33	195
82453154633	85411706214	2005-01-12 02:15:38	2006-09-04 05:52:27	196
89768773631	82651331557	2005-06-12 17:14:15	2011-01-08 23:35:24	197
82393663629	81351445183	2001-03-15 09:01:07	2007-01-23 02:23:58	198
81755367593	84445401791	2001-05-12 00:08:53	2020-09-03 11:48:18	199
88491436033	81834251955	2020-01-03 05:19:21	2021-08-16 08:12:31	200
\.


                                                                                                                                                                                                                                                                                                                                       3437.dat                                                                                            0000600 0004000 0002000 00000047254 14516725067 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	59,00 ?	Onto animal less open cut audience list. Walk raise why where summer agreement during record. Ability time tend win realize.	yearly
2	71,00 ?	Research finally small green yeah sing. Approach stay daughter together suggest support speech. Toward develop generation.	weekly
3	76,00 ?	Top determine artist blue tonight to state. Manage series successful long. Ability science research road kitchen class result.	weekly
4	50,00 ?	Story history protect money my. Rise strong professor school civil choose. Follow agent sport.	weekly
5	73,00 ?	To force go car.\nInclude civil develop lose recognize control news. Wide both way about different different.	yearly
6	33,00 ?	Out design away notice authority through.\nGood gun break here teacher apply. Process raise federal cut.	hourly
7	33,00 ?	Brother offer same hot. Suggest growth series.\nJoin soldier career leader watch look all least. Event very begin account think. Court company indeed plant public.	yearly
8	96,00 ?	Make stop of area clearly. Which spend try.\nHappy lot left letter standard. Movement value after out bring.\nStand federal this. Past knowledge third spring.	monthly
9	5,00 ?	Seven interview rather cold great. Reflect simple cut particularly special memory senior note.\nChurch democratic throughout. Court through benefit Mrs lot think main.	hourly
10	100,00 ?	Stuff hour near center environment house. Fear whether anything. Environment hospital degree gas.\nChurch until against early. Those total seek crime. High ability head town level matter yeah bill.	hourly
11	106,00 ?	Rest improve must capital politics number own use. Stop group leg sea per perhaps star. History machine body shake hot.\nChoose poor thought song.	yearly
12	18,00 ?	Husband accept light become station unit. Outside stand behind even bit blood system. Measure each experience set suddenly worker pressure institution.	hourly
13	24,00 ?	Drop cause old huge gun. Service every law.\nPart above human hold. Smile health measure majority reality score available decision.	yearly
14	99,00 ?	Fast suddenly ball or form box. Act poor history charge I. Far wind even work age reveal ok.\nIdea of third newspaper policy leave pass. Really popular pull various particular notice follow.	daily
15	71,00 ?	Particular kind church attack back. Pass relationship decision bank clearly page stay move.	daily
16	106,00 ?	Shake mean inside pattern. Answer think space staff try cost present.\nUpon character degree child wind scientist than arrive.	yearly
17	78,00 ?	Cut public become. Small type speech member cut play.\nName detail evidence. Bit care can.\nSomeone friend travel itself fall wish institution. Election fine though conference show. Law media work.	yearly
18	49,00 ?	Hold yeah second strong medical world. Score series here information pay fly computer baby.	hourly
19	88,00 ?	Plan network ball research. Prevent prepare technology time boy plant. Born on and star. Final exactly option right.\nSource usually head game new special. Miss smile approach agency bad authority.	yearly
20	31,00 ?	Yourself cause author stock. Team child attack attorney enjoy more throughout. There us change police involve section recent shoulder.	weekly
21	6,00 ?	Star term billion forget way year. Become across front best yard it back.\nCoach everyone ten.\nHigh address will artist forward nice. Full successful service water team bill even eight.	daily
22	47,00 ?	Bring entire similar list build.\nCharge she democratic art product.\nArm want be. Development gas citizen public owner us protect. Start top Mrs. Bit exactly themselves officer.	yearly
23	33,00 ?	Myself hospital board. Work without quickly pressure language visit.\nAdd admit meeting million actually. Claim open drive involve deal.	weekly
24	29,00 ?	That must open ability understand behind. Contain cost edge stay. Center gun story message tax.\nBegin even during our feeling few down. Behind with forget best.	hourly
25	109,00 ?	Respond sing reveal dark mother involve. Whether tree really respond similar. Seem reach who rich admit realize.\nDrug local child beat participant. Pattern model eat service door. Cover too these.	hourly
26	52,00 ?	Argue reality identify reality civil. Than follow bar particularly trial last.\nGun majority thought. Imagine represent paper go wife some ready.	hourly
27	84,00 ?	Those game billion set. Score treat food lot. Unit bed mission down not expect. Range management become rather current animal final away.	monthly
28	19,00 ?	Since kid the style yourself brother. Impact whether challenge. Shoulder writer speak sport including town doctor resource. Mean hit watch win fear environment.\nFact answer go budget.	monthly
29	105,00 ?	Serious tend event blood require serious. Voice pass color reflect defense pretty.\nCall recent throughout ground.\nHit style identify population the. Environment stuff return foot suffer serve.	daily
30	84,00 ?	Discuss performance include whose form. Beyond common see election get pressure eye.\nLeft someone such federal fast. Court democratic nearly rich business. Throw science specific their project.	yearly
31	99,00 ?	Ability enough officer space rate. Great education concern.\nFull forget red of enter PM fund. Three candidate chance reduce executive see.	weekly
32	88,00 ?	Bag including well grow million drive name. Discuss training week very rest structure media measure.\nList player hair good finally next south. Tax mean many college prove step rich.	yearly
33	47,00 ?	Scientist into test with. Answer service enough make also conference. Line without important apply.\nEnvironment professor thank program couple safe term.	hourly
34	9,00 ?	Door none education agreement source relate mission. Task heavy local senior property.\nPlace discussion point respond. Must if keep relate.	monthly
35	85,00 ?	Interesting nature whatever born against where. Citizen final discuss try. First side cut debate than. Listen recognize reveal eight.	monthly
36	28,00 ?	Age team box model. Factor face grow to argue decide.\nSite pull discuss explain. Allow approach baby bit work cost.	weekly
37	104,00 ?	Happen above friend recognize left subject. Support least opportunity rise we how.\nGirl coach attention what six.	monthly
38	59,00 ?	Whatever class son through get. Amount day city before behavior live role simply.\nCenter contain particular beautiful. Number red may sing explain you finally. Physical moment draw lot occur.	daily
39	22,00 ?	Who bar together management house. Result if she customer yeah. Suggest whose bank such happen hotel charge college. Quickly else agent democratic structure.	daily
40	38,00 ?	Bring commercial wall paper carry very. Join dream rich population report. Could president seek improve. Interview range well my.	yearly
41	25,00 ?	Growth partner significant relate. Exactly loss until whole many window. Character listen throughout sing recognize.\nLaugh across fear will however. Painting call whose.	daily
42	57,00 ?	Item care write. Nothing growth purpose century. Provide story involve study.\nTraditional spring particular chance approach. Half the lead.	weekly
43	88,00 ?	Often dinner small near sister stuff main. Recently then exactly turn least it range agent. Blood point practice seat develop.	hourly
44	103,00 ?	Discuss if majority education television foreign analysis game.\nDrive feel ten black impact next like. Agent today reality whom old. Leg glass bring must affect consumer its.	weekly
45	76,00 ?	Community small song local. Black throughout indicate moment spend end. Big mind card close.\nAnimal hard American local clearly. Much wonder thus alone partner. Push life experience others window.	yearly
46	82,00 ?	Democrat while phone wrong.\nSmile will see friend government.\nCall civil age authority cold wrong leader. Whose happen enter for. Every crime nearly voice.	yearly
47	85,00 ?	Prevent machine interesting on production put. Former purpose pull probably.\nAll paper leave machine town fly style commercial. Check positive maintain concern small listen south.	yearly
48	27,00 ?	Agency course group perform nearly TV team. Recognize kind provide hospital work film just plan.	daily
49	74,00 ?	Property amount question raise something. State where tree sea board east. Glass pattern your one.\nArgue development television skill family certain cultural. Hotel region past Mrs.	weekly
50	95,00 ?	Group before both clear. Figure treat outside church cover least consider. Both room watch fast down explain.\nWater policy resource operation kid determine. Drive we fly should actually government.	weekly
51	47,00 ?	Together talk real sound west of safe avoid. Its include other color six perform difference be.	daily
52	65,00 ?	Could think fine. Thousand challenge program first key fight.\nTree operation poor red. Exist wrong according buy.	hourly
53	82,00 ?	Thousand weight new audience prove class subject. Claim society product husband hand which.\nSeason beyond natural certain teacher happen card. Keep form personal but.	hourly
54	95,00 ?	Rise their money live. Senior almost cost week order difficult picture. Common much drop continue large whom.	daily
55	52,00 ?	Indicate represent factor shake. Report article understand board.\nPerhaps specific until what address dog mind. Administration operation fear entire radio old carry.	daily
56	39,00 ?	Single interest want fast affect name. Produce age simple early eye interest base bank.	monthly
57	9,00 ?	Perform political improve. Pass quality true space feel.\nFinish main while in. Suggest such billion. Popular indeed of.\nEveryone ready theory little. Despite sell central tree property wonder tax.	monthly
58	11,00 ?	Black parent get year home economy. Authority pressure argue about. Official read write paper series.\nRead that card receive them. Stage economy charge buy push structure half happy.	hourly
59	63,00 ?	Fly couple what spend expect structure try group. Life sign edge condition.\nInside body machine walk be. Difference key reality deal worker.	monthly
60	18,00 ?	Daughter relationship north because gas call. Help move world rate seven because point let. Positive look poor audience age watch.\nProcess country address well its leader process.	monthly
61	40,00 ?	Year wife scientist lawyer reach. Big Republican few money perform range. Scene dark should friend face chance.	hourly
62	76,00 ?	Feeling white respond spring. Tv probably blood else or heart. Benefit because company task station.\nStill quality speak. Such painting make scene to model.	daily
63	26,00 ?	Traditional travel trial end already. Light join low. Cover choice pay phone national them structure week.	monthly
64	24,00 ?	School hear certain store imagine before physical. Their significant have best create visit science prepare.	daily
65	91,00 ?	Cost deal worry her senior. Firm hour have executive behind travel.\nFinancial ahead listen after improve effect offer present. Low fly drop risk success us wish entire.	weekly
66	4,00 ?	Simple others serious begin same possible. Reality paper consumer.\nPopulation however environment program need per morning.	daily
67	33,00 ?	Many relationship others late not low none. Training woman need work process sign necessary.\nInside reflect eight science may family indeed. A this our among. Though art per manage sea single senior.	yearly
68	28,00 ?	Design between miss history. Law food prove. North bad dark myself.\nCoach story back specific exactly point ask themselves. Nature husband decide anything. Land everyone travel player.	yearly
69	70,00 ?	Color apply eat nature happen. Paper mouth claim leg expert carry. Owner oil offer toward compare never sometimes.	daily
70	82,00 ?	Dinner myself article TV time about manage.\nStill stand though company focus identify people movement. Admit onto former middle. Yeah ahead my painting exist.	monthly
71	89,00 ?	Another loss nothing significant interesting spend partner. Court many face road nearly. Baby green need window memory.	yearly
72	37,00 ?	Girl to east of off. Own threat work ten. Cover return key card how number.\nMission use people so customer race no. Plan officer avoid ground might support day.	hourly
73	110,00 ?	Set whatever education matter about. War admit board garden return song energy. My stay modern price of movie garden.	yearly
74	80,00 ?	Economic leave adult arm main no expect go. Already rule learn think south too. Probably current consider final hand perhaps business enter. Class suggest action happen enter trade.	weekly
75	56,00 ?	Help like field only TV. Item pressure well into. Though enjoy west coach financial.\nTen last blue provide. Popular name up black itself else. Seat or born.	hourly
76	23,00 ?	Three style view individual rest suggest step suggest. Think girl someone reach whole. Catch crime common finish name able happen.\nRight large produce officer. Even parent really our ask continue.	daily
77	12,00 ?	Lot ok threat. Happy represent nothing heart social. Purpose necessary foot from probably us themselves.\nAmerican everyone world exist allow. Key land various box change bring.	yearly
78	62,00 ?	Thousand forward hand pressure heavy. New foot certain body peace happy. Option crime environment ready serve some. Meet movie fill build political fine.	yearly
79	55,00 ?	Behavior positive story region. Seek degree citizen result foreign leader.\nExpert writer likely window three list woman available. Contain cultural doctor.	monthly
80	78,00 ?	Catch feel nothing direction among she real.\nMilitary town kitchen democratic standard soon add. Fish record yeah may clearly. Scene maintain more price magazine.	weekly
81	60,00 ?	Eat read reach support true together.\nFamily again later music. Carry memory career become those radio. Test bed nature much.\nLoss keep whole partner tell. Since information watch into less task.	hourly
82	6,00 ?	Budget likely three player. Bad security note Congress forward radio report not. Stand international program chair expert career enough.	daily
83	49,00 ?	Region in single official. Drive thousand know anyone lay drug bring. Model thank like town.	hourly
84	16,00 ?	Million manage interview staff particular open ever. Commercial mission blue. Person space star image laugh soldier grow.\nOutside almost travel station field there discover.	daily
85	6,00 ?	Life many movie attack everybody each.\nKitchen deal stand time fine also degree. Similar past issue accept. Grow well political each improve big.	daily
86	27,00 ?	Describe officer major inside plan conference. Single common impact continue.\nJob painting talk late stop yourself rule citizen. Central anything network show.	hourly
87	50,00 ?	History many beautiful several page weight amount. Else ability staff quite. Beyond individual amount contain.	monthly
88	22,00 ?	Line because down strong charge send. Both prepare bag think. During people turn statement people vote continue.	monthly
89	93,00 ?	First modern management fish relate capital sound teach. Pick miss second job week black.	daily
90	104,00 ?	Shake see large difficult. Color threat whole above local. Yeah why reality country data year blue.	monthly
91	100,00 ?	Not line actually his consider staff school. Attention defense hour force. Yard south adult science. Occur mention expect take the.	hourly
92	57,00 ?	Through same hour floor. Source store our crime matter. Cost history reality former.\nSomebody young writer bit fish able. Challenge lead great.	hourly
93	80,00 ?	Behavior himself indeed recent. Read follow international hour act. Movement course development third.\nTend wish nearly management. Bag official majority side central also.	monthly
94	84,00 ?	Official discuss move far option task. Religious direction animal contain now.\nReady above actually sure. Hear traditional either member new. Record no price now experience.	daily
95	87,00 ?	Form exactly meet cold enjoy.\nScore floor theory. Use watch expert kid. Service list vote establish.	daily
96	99,00 ?	Trade rise I reveal I. All speech senior far.\nProject west effort.\nCondition its bit put deal here. Firm nation ok receive nothing know.	hourly
97	24,00 ?	Blue art article material newspaper. Eye blue peace front during us entire. It ahead control hold.\nOther inside loss. Send wrong production. Mrs address matter behavior.	weekly
98	29,00 ?	Step last organization decide. Hour public night defense whose recent fight.\nModern language personal seem. Account team pretty strategy collection media.	hourly
99	93,00 ?	Against single trouble human agree. Agreement specific benefit peace market him discuss interview.\nSpeech finish blue once move moment.	hourly
100	85,00 ?	Imagine turn understand lay born top with. College consumer fast response direction. Light light water look order gun stop maintain.	yearly
101	95,00 ?	Fund performance region ten once north just. Speak garden fact field information within.\nCustomer up sport. Upon above every debate. Song television style offer per learn and.	hourly
102	106,00 ?	Part own country color. Design one information fall. No data represent six describe property serve.\nOwner opportunity eye laugh blue. May scene personal end over audience. Hair speech value.	yearly
103	46,00 ?	Employee indicate allow have. Allow interesting many career bed second thought both. Image pretty image ball very. Hard message hour speech stop believe.	daily
104	110,00 ?	Ask knowledge statement we attention.\nThought as cultural soon. National card institution generation very. Budget wish bad really use.	weekly
105	6,00 ?	Head tell north instead Republican. Support child floor. Concern central miss oil deal woman.\nReceive what population everyone case. Address man unit his health.	weekly
106	23,00 ?	Will price near others which. Mind determine authority relate happen. Call knowledge gun skin hundred. Concern memory write structure interview memory.	daily
107	97,00 ?	Find more stuff. Girl difference wife large theory certain. Property cold difference voice source. By leg pass it.\nDraw upon through with among agent woman everything.	weekly
108	28,00 ?	Into want institution important election determine much. Human must several event shake source lot.	weekly
109	70,00 ?	Network this can wind week.\nSenior manager reduce still way. Whole building try weight movement bed seek during. Should base collection line young leave market.	yearly
110	56,00 ?	Room surface partner upon. Consumer have allow do write thing. Personal choose hundred seat section catch administration.	hourly
111	75,00 ?	Data be prove property. Girl seven treatment local chair. Along turn voice continue major fine. Travel seat rock possible.\nStudent ok to which. A environment drive guy.	daily
112	69,00 ?	Yourself president air involve. Easy history on hospital southern.\nReality be doctor tonight game form it method. Provide pull those worry strong section. Right its girl million strategy.	yearly
113	35,00 ?	For dinner chance friend debate apply. Wish both your adult quite player.\nLeg five enter back along change generation authority.	yearly
114	55,00 ?	Later including responsibility language public material. Ability meeting you how weight wide look.	weekly
115	27,00 ?	Behavior couple agree size social energy. Eat per those century view laugh produce above. Director be still Mr house page ever.	hourly
116	97,00 ?	Buy spend dinner than structure upon yard. However whole can cause movement learn art line. Someone meet administration recently evidence view central.	daily
117	86,00 ?	Someone their thought once modern. Four wait than professor this knowledge simple. Letter when argue after sometimes.\nFloor fact support always explain.	monthly
118	76,00 ?	Deep soon past end turn kind.\nQuite chance become take there. Magazine fact table myself somebody dog.	yearly
119	78,00 ?	Issue serious challenge tell win pass property. Benefit keep one. Four little great avoid visit him.\nAround contain sea Mrs. Third second say item these course. Bed human sing yeah as be.	yearly
120	72,00 ?	Discover ten fight voice plan nearly ten. Than set beat admit. Player which most suddenly. Edge section assume yeah can.\nJob when every wife explain per. Western seek shoulder these south free.	weekly
\.


                                                                                                                                                                                                                                                                                                                                                    3454.dat                                                                                            0000600 0004000 0002000 00000007625 14516725067 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8	88063132062	2017-12-26	2019-07-03	1
10	85126663834	2010-09-07	2012-07-24	2
56	88686637097	2015-11-08	2017-10-04	3
47	87972625997	2008-07-22	2023-10-10	4
16	83367260233	2005-07-13	2022-08-30	5
24	87207296042	2013-05-16	2015-10-30	6
2	81651408391	2012-07-18	2022-06-19	7
11	86982112923	2012-12-29	2017-04-07	8
46	87312837291	2015-02-20	2016-11-30	9
7	82884816243	2012-02-21	2019-11-03	10
31	81290751976	2004-09-30	2008-05-28	11
5	85162225551	2000-01-29	2007-09-25	12
58	83939283170	2009-01-01	2022-11-13	13
40	86982112923	2017-07-02	2018-03-10	14
23	85896878969	2002-07-01	2020-05-02	15
33	89909942854	2011-02-02	2022-06-03	16
1	89478225634	2014-07-18	2018-01-31	17
21	82540578006	2000-07-26	2016-04-21	18
28	89567417811	2000-12-16	2009-06-29	19
50	83039121686	2002-10-14	2020-12-24	20
47	84608960717	2000-02-16	2013-04-05	21
46	87816542499	2010-04-17	2010-07-15	22
17	86948251411	2005-07-15	2023-08-24	23
43	86128319451	2009-07-18	2015-04-16	24
51	87141610652	2007-02-06	2009-05-06	25
24	83630038004	2000-07-01	2021-11-13	26
51	89844900220	2007-06-05	2022-09-19	27
44	85937533879	2005-02-26	2006-01-11	28
54	83495694331	2011-11-26	2020-11-27	29
54	88874893105	2001-03-05	2016-04-14	30
11	86128319451	2012-10-01	2022-03-06	31
30	87395751914	2004-09-13	2019-02-11	32
53	81193274375	2002-09-01	2014-06-09	33
24	87816542499	2003-11-16	2004-06-03	34
36	87127921928	2006-02-27	2023-11-02	35
24	85922675734	2003-04-18	2020-01-13	36
54	87207296042	2016-10-04	2019-01-24	37
42	81690604571	2007-12-07	2011-05-10	38
21	87141610652	2016-07-06	2023-08-05	39
27	86256652966	2008-11-16	2013-04-27	40
50	88686637097	2012-07-12	2020-01-19	41
27	85162225551	2004-11-08	2009-12-24	42
53	82651331557	2013-09-28	2018-07-21	43
60	88354875145	2000-06-19	2011-09-25	44
29	85014001547	2014-09-13	2023-11-13	45
28	82453780011	2004-07-18	2010-06-09	46
47	81918740958	2005-02-02	2023-08-17	47
55	83744171916	2002-07-29	2010-07-04	48
60	87716726601	2005-07-01	2016-12-07	49
59	86128319451	2013-05-28	2019-11-10	50
57	84157873461	2007-02-06	2022-12-12	51
9	86451732519	2010-10-13	2023-04-13	52
31	88874893105	2005-12-27	2011-06-24	53
23	84445401791	2009-11-21	2023-07-02	54
29	82514913257	2005-02-07	2012-01-25	55
46	89167792152	2001-01-06	2009-04-23	56
58	88063132062	2002-03-07	2014-10-04	57
55	89931173404	2004-05-03	2015-12-04	58
47	82884816243	2003-07-20	2022-12-13	59
30	84548540986	2004-01-21	2008-05-09	60
43	86813650741	2009-04-21	2023-04-21	61
31	86813650741	2018-12-16	2021-09-20	62
10	83630038004	2018-11-10	2020-08-07	63
29	87972625997	2003-06-29	2018-12-13	64
36	83774318368	2012-10-09	2012-10-24	65
8	87816542499	2014-10-09	2020-03-18	66
49	83367260233	2006-05-13	2016-02-22	67
55	82884816243	2002-02-19	2005-06-01	68
11	88686637097	2009-12-26	2014-12-24	69
27	89730642391	2007-11-06	2007-12-27	70
35	85014001547	2013-12-29	2021-11-09	71
53	81351445183	2003-08-11	2018-12-20	72
56	83164665019	2003-11-22	2007-03-07	73
55	85126663834	2003-09-28	2014-09-23	74
38	87716726601	2005-08-24	2012-05-06	75
21	86017927001	2001-06-11	2015-09-15	76
9	84182198979	2011-01-11	2019-11-05	77
37	85181997756	2004-02-17	2008-09-02	78
42	81918740958	2015-10-28	2015-12-20	79
41	83630038004	2000-08-12	2010-09-06	80
38	83495694331	2010-03-01	2014-08-16	81
46	89931173404	2003-09-10	2016-02-05	82
31	83744171916	2008-05-30	2014-03-30	83
29	88063132062	2009-04-23	2009-05-15	84
18	86970918258	2011-08-16	2017-03-10	85
56	89605694853	2004-03-26	2004-06-16	86
28	81393324182	2001-04-04	2022-03-19	87
45	82884816243	2020-06-17	2023-03-12	88
48	87141610652	2007-05-11	2023-01-06	89
51	87207296042	2012-04-15	2021-08-23	90
42	82010648116	2013-01-21	2017-08-12	91
58	81281718689	2015-07-10	2018-06-26	92
20	84608960717	2013-08-02	2017-03-17	93
23	87308609495	2005-01-12	2011-08-30	94
28	87395751914	2005-04-28	2012-06-27	95
23	87816542499	2002-08-25	2022-08-02	96
13	87293111316	2007-07-15	2019-12-01	97
15	86813650741	2003-09-04	2004-06-29	98
21	83367260233	2001-04-26	2004-06-06	99
34	86813650741	2023-06-26	2023-12-04	100
\.


                                                                                                           3435.dat                                                                                            0000600 0004000 0002000 00000023444 14516725067 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	38,00 ?	Upon rest authority carry any up all. Down moment artist staff.\nAgree program reduce skin. Media campaign detail federal nice. Argue act million treat decision short surface.	hourly
2	49,00 ?	Outside account go property article. Happen final born affect. Learn like fire quickly.\nTime key thus defense according. Away weight present bed establish race stock.	hourly
3	99,00 ?	Itself recent make in whether spend. Travel hard owner model cause will. Mean shoulder rise international as trip operation. Key if experience.	hourly
4	84,00 ?	Carry help line just stay one. Especially rise well idea.\nWonder its policy but. Threat role practice over. Catch let forward chance parent attack.	hourly
5	22,00 ?	With democratic ok detail suffer new item break. Store must record. Fight catch run century environment.\nThen month beat. Receive movie after bed participant network range.	daily
6	108,00 ?	Physical cause fill notice huge tonight dinner the. Detail capital war organization. Shake gun leader court authority.\nSomething thank dog difficult machine side. Character drug senior most.	weekly
7	94,00 ?	Police meeting include back pay out.\nStrong relationship reach response we place. Usually upon who ago.\nEnough foreign truth computer son. Personal maybe fill many.	monthly
8	42,00 ?	South positive mean oil adult generation significant.\nNews either air easy. Before our trouble raise. Analysis group environment although scene.	weekly
9	77,00 ?	So want choose forget. When TV for simple benefit camera. Employee follow tough half upon. Agree foot partner brother reason sing pull.	daily
10	94,00 ?	Edge because serious forward born happen everything. Box event per budget argue station.	daily
11	107,00 ?	Street design order memory. Dream collection person western author college.\nCultural information town. Personal dream history article. Seem price every than minute.	daily
12	4,00 ?	Training term serious each. Crime six skin second campaign serious. Activity the generation though especially.\nRed focus change animal. Card possible read when. Dog walk truth worker tough new grow.	weekly
13	42,00 ?	West national direction street wonder. Including plan above industry them clear suddenly.	monthly
14	27,00 ?	Role clear cover. Hand democratic house arm citizen notice.\nOfficial nearly eye part least mention. Success plant author tend most health. Person option method.	yearly
15	85,00 ?	Apply yourself discussion last development activity idea. Strong husband much determine. Point relationship bank role shoulder.	hourly
16	8,00 ?	Perform argue produce these. Attack world commercial point long. Staff worry indeed Democrat join mention successful.\nAttention real will war. Nor place term today sister.	monthly
17	66,00 ?	Key ten beyond degree every. Prepare night between statement. Education oil often loss suggest top discover. Value professional smile onto few data.	weekly
18	6,00 ?	See none adult deep poor. Health represent floor resource with member.\nTraining subject market mean reveal. Pull follow require red than story feeling including.	hourly
19	12,00 ?	Hair personal smile develop recognize score. Politics most least product firm. Ability after deal. Bag task sure dog west enough.	monthly
20	54,00 ?	Pretty fill former college region PM mother between. Risk short technology thought.	yearly
21	75,00 ?	Reflect relate mission.\nAccount coach example hear share yourself soon. Exactly life reflect six year window.\nEast woman main smile. Business let investment.	weekly
22	108,00 ?	Offer skill story yeah such speech. Law Congress consumer cost wrong drop world.	monthly
23	28,00 ?	Story people factor deep. Treat view consider new laugh.	hourly
24	45,00 ?	As prevent impact more picture form happy rate. Decade around piece former. Drive building teacher anyone task series condition.	daily
25	20,00 ?	What technology more artist entire finish. Catch yourself change reach guess.\nWould trial girl inside hospital. Trial certainly my front mind technology future.	monthly
26	50,00 ?	Car should away sense. Receive perhaps whether stay leader respond.\nAdmit so rich perform offer economic top project. Operation personal parent hear name box. Claim such power expect ability.	monthly
27	57,00 ?	Player far bag take join.\nArgue where rock would mother soldier full give. Back car wall seven upon share safe then. Quickly shake book will well hundred word.	daily
28	96,00 ?	Together somebody everybody ability meet trade. Indicate institution list station senior anyone hot.	weekly
29	90,00 ?	Yet safe different outside race institution. Effect determine more pattern state.\nStrong result form keep make prepare. Debate bed job billion.	yearly
30	24,00 ?	Central radio already show. Various need perform drive loss actually turn mean. Here successful audience attention member remember.	hourly
31	42,00 ?	Go kid manage section. Bad say later. School different race leader president general.\nAccount focus agency. Difference writer question point region improve life. Defense east a maybe.	monthly
32	10,00 ?	Either during fish up put. Under hot make both institution tax either. Leave military his near coach.\nPower unit someone lay. Who environment free newspaper worry.	hourly
33	27,00 ?	Big each not give rule. Voice write on size real tell. What authority clearly support across onto.	daily
34	108,00 ?	Fast film mother player article husband. Discuss improve think interest rock cell sure.	yearly
35	73,00 ?	Seek Mr there safe draw drop father. Sometimes never still new without.\nWeek across article such. Training big myself interesting onto least resource. Range organization on measure old glass.	hourly
36	56,00 ?	No movie almost example. Save most field professional individual its fight act. Continue expect student test listen.\nMost as read fear speak. Pretty case interesting.	hourly
37	109,00 ?	Off administration rich. Concern action boy statement. Decade large serve during standard read.\nOfficer heavy man Mr. Attorney control indeed give. Other instead several example one find.	yearly
38	35,00 ?	More level claim produce teach.\nShould boy service loss. Security education world page accept. Across or cost.	weekly
39	21,00 ?	Bill similar decision future east talk then rather. Identify read security point.\nRaise early from according pass century institution stock. Glass audience where figure move decade. Me peace travel.	daily
40	5,00 ?	Short party former skin. Best ball charge director mouth avoid meeting. Through section way sport.\nPolice note management. Military call food car. Sea keep idea describe east light body.	daily
41	56,00 ?	Clear full last who.\nSingle stand would any sound professional. Lead bank player hear account less. One long sort full court.\nA society business score town. Who oil research quite nature force.	yearly
42	108,00 ?	Growth produce authority rock top. Local account energy start.\nArea state and article board. Political husband order. Yes improve surface father. Day development eat base billion.	weekly
43	10,00 ?	Network player country career. Course run choice true.\nNumber work well treatment. Class risk beat property analysis like blue.\nBecause TV deal impact. Professional woman yeah practice deep line lay.	monthly
44	107,00 ?	Hour similar list interview.\nGrowth wife explain right do. Too impact sure game market according. But church station price pressure service.\nArea participant mouth many else movie police.	weekly
45	15,00 ?	Watch start team commercial name range prepare. Follow ask so.\nFoot writer data shake treat professional world. Produce drug deal expert end century.	monthly
46	38,00 ?	Dog century onto choice have pick others. Stop laugh suggest.\nSouthern billion computer suggest meet capital. Day reach new owner. Event beautiful party because challenge heavy quite.	monthly
47	33,00 ?	Sure huge him life safe into. So development truth let involve claim author. Break and role idea suddenly off consider.	daily
48	62,00 ?	Price else five work carry. Action from appear cell make. Operation TV trip right.\nFirst wish require save then shake. Race my concern.	weekly
49	62,00 ?	Share or word green leg product sign. Their degree where specific evidence.\nName suddenly economic low successful stock.	weekly
50	73,00 ?	Blood well ready. Major maintain candidate shake. Player any contain experience.\nLevel room take class. Act still foreign picture. See citizen source land personal history many.	monthly
51	33,00 ?	Should when present support reduce whatever claim push. With plan anything. Together best half including he center main. Role over operation claim about cost.	hourly
52	89,00 ?	Could half leg take pick where former. Open clear president task.\nConcern air court guy. Edge guess fund. Floor around case.	weekly
53	56,00 ?	Two loss camera. City manage out.\nPoint old film paper shoulder really sound second. Card above bag think challenge goal result.	hourly
54	92,00 ?	Design husband especially win fine car yet. Various sea end.	daily
55	74,00 ?	Most us positive pay. Seven heart respond two bank ask option.\nMoment something force up meet loss news traditional. Able least edge choose. Certainly drive act join.	yearly
56	7,00 ?	Where beautiful movement. Amount bar process professional international.\nBreak produce rise imagine. Probably teacher truth film get ten.	monthly
57	23,00 ?	Wife suddenly onto fund rate kid compare. Smile religious night radio determine usually say. Without life southern medical too new however.	monthly
58	102,00 ?	Individual yourself hold Mrs. Paper occur television cut. Identify once least simple sit long.\nSeries art figure without thank deal few. Range determine professional care process wait board.	monthly
59	90,00 ?	Or respond figure management. Open financial dream after option.\nBank north enough term trip owner.\nBetter huge too second. Way week join staff.	daily
60	99,00 ?	Try year doctor draw treatment man none. Agency to least wish letter vote. Realize seek miss way risk stock early out.	yearly
\.


                                                                                                                                                                                                                            3452.dat                                                                                            0000600 0004000 0002000 00000007615 14516725067 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8	85181997756	2000-06-08	2022-09-21	1
38	81281718689	2015-06-14	2019-10-31	2
56	87127921928	2006-03-30	2007-12-22	3
47	86017927001	2012-11-16	2016-12-06	4
18	88354875145	2009-09-04	2013-08-13	5
56	87651296848	2009-08-20	2022-04-29	6
13	81525714909	2002-04-29	2014-10-26	7
11	85390205129	2000-06-03	2008-09-02	8
46	86654382873	2008-10-31	2015-11-24	9
37	84445401791	2007-01-21	2011-05-23	10
34	84548540986	2008-11-13	2018-09-14	11
50	86970918258	2002-02-23	2012-04-14	12
44	81393324182	2008-09-26	2009-09-05	13
12	84548540986	2014-12-22	2015-11-13	14
41	89605694853	2010-05-11	2013-06-21	15
45	82884816243	2018-08-31	2021-02-13	16
50	82453780011	2018-11-01	2021-07-17	17
42	82010648116	2014-08-16	2019-12-28	18
60	81839725897	2018-11-04	2021-11-05	19
12	84608960717	2004-02-02	2011-03-28	20
34	87127921928	2002-02-05	2009-07-11	21
34	83162443692	2002-07-15	2004-11-02	22
6	88686637097	2011-04-05	2020-04-10	23
15	83231037288	2002-03-02	2005-04-02	24
51	81281718689	2000-06-01	2014-04-02	25
48	89931173404	2006-01-17	2007-03-19	26
15	89567417811	2012-07-21	2020-06-21	27
45	83367260233	2005-04-09	2018-09-26	28
18	81281718689	2010-06-29	2017-03-22	29
38	81525714909	2009-03-28	2020-05-15	30
44	86654382873	2004-08-18	2010-10-28	31
16	87651296848	2015-11-22	2018-05-16	32
36	88354875145	2014-11-17	2020-03-25	33
4	89175874533	2002-11-23	2018-02-20	34
58	81760439158	2005-12-24	2011-06-24	35
43	83434716995	2002-05-12	2017-09-10	36
56	87293111316	2002-09-14	2013-04-27	37
48	82440436528	2001-06-20	2023-08-26	38
51	88874893105	2014-10-25	2023-08-25	39
30	81290751976	2000-12-27	2015-06-17	40
44	87127921928	2004-05-29	2006-09-13	41
17	82440436528	2000-02-06	2011-08-13	42
53	89844900220	2001-11-12	2022-04-14	43
54	82453780011	2017-05-22	2019-07-16	44
44	87207296042	2002-11-21	2016-02-22	45
20	84157873461	2001-12-23	2004-05-17	46
14	84445401791	2002-07-19	2011-09-29	47
3	82717184948	2009-02-16	2016-08-22	48
6	82717184948	2005-02-09	2007-03-16	49
43	82651331557	2017-11-08	2019-10-14	50
52	85922675734	2009-10-09	2011-09-28	51
47	83367260233	2015-03-14	2015-08-25	52
21	82453780011	2005-08-03	2013-10-24	53
7	82651331557	2013-04-07	2020-09-12	54
56	87816542499	2012-06-15	2015-01-15	55
10	86654382873	2009-06-07	2017-02-19	56
2	83367260233	2016-05-29	2021-05-15	57
39	83253580355	2000-02-20	2013-11-16	58
13	88063132062	2003-11-11	2019-10-27	59
24	87141610652	2008-11-14	2021-03-19	60
50	87716726601	2008-07-12	2018-06-05	61
42	84925489447	2002-06-13	2013-01-24	62
14	81290751976	2011-04-30	2015-07-27	63
59	81193274375	2006-10-31	2015-10-21	64
5	89175874533	2011-03-02	2013-09-03	65
26	87141610652	2001-04-25	2017-07-17	66
6	82540578006	2015-05-15	2018-07-07	67
5	83039121686	2008-12-07	2014-06-11	68
56	83630038004	2013-02-11	2023-10-01	69
13	87127921928	2019-09-13	2020-04-16	70
41	85390205129	2002-02-25	2011-03-26	71
13	86329113206	2007-09-25	2014-09-14	72
58	81281718689	2004-08-22	2023-11-29	73
10	87850980321	2000-06-09	2022-09-06	74
9	84925489447	2006-07-21	2010-05-13	75
15	85922675734	2003-03-15	2013-03-13	76
56	88686637097	2003-02-28	2014-04-17	77
37	86970918258	2004-01-17	2015-01-28	78
11	84608960717	2005-01-01	2023-08-17	79
23	82884816243	2000-12-03	2021-05-19	80
8	89931173404	2004-11-23	2023-07-26	81
48	88029686047	2005-09-22	2022-06-03	82
56	87308609495	2008-10-19	2011-08-28	83
42	89931173404	2008-09-13	2009-08-24	84
2	89478225634	2001-01-30	2004-03-08	85
31	85162225551	2010-10-17	2012-02-24	86
47	81281718689	2001-08-24	2002-08-28	87
2	83253580355	2010-05-10	2021-10-26	88
16	83367260233	2015-07-05	2019-11-02	89
16	87651296848	2018-03-23	2023-03-23	90
56	85121541173	2016-01-06	2019-11-22	91
28	84548540986	2002-09-25	2010-05-05	92
36	88354875145	2013-08-03	2016-10-09	93
37	81351445183	2003-10-28	2006-07-27	94
56	89931173404	2006-03-21	2013-06-12	95
2	85937533879	2000-10-16	2015-10-11	96
20	89670073963	2005-04-13	2017-06-05	97
36	83774318368	2010-11-07	2019-01-05	98
46	82884816243	2016-05-04	2018-09-03	99
6	84445401791	2010-06-03	2016-02-23	100
\.


                                                                                                                   3450.dat                                                                                            0000600 0004000 0002000 00000004036 14516725067 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	81669897524	2015-09-22 23:00:01	2022-04-18 13:29:34	2	87677577107
2	88909297487	2009-08-07 20:31:55	2014-01-11 11:24:59	1	85986402492
3	87986293619	2006-03-08 20:40:45	2006-07-12 23:04:56	3	88571318209
4	83215219487	2011-08-25 00:55:47	2013-08-24 17:16:12	14	85613156853
5	85648971932	2002-06-25 19:30:53	2022-03-12 23:29:04	13	89204509317
6	84453388077	2007-01-31 13:22:54	2017-11-23 19:29:43	9	83976111170
7	85561972707	2002-03-12 00:19:01	2023-07-18 18:20:03	11	83733607512
8	84429557631	2007-03-26 17:20:46	2020-08-09 20:52:41	13	85648763843
9	88428674891	2006-06-07 00:07:03	2022-06-18 22:33:52	3	84339926671
10	88997586821	2012-04-12 07:32:49	2014-07-27 22:37:53	2	81985898322
11	89103432579	2018-03-08 04:35:30	2018-11-18 08:30:11	10	83965642921
12	83978352521	2006-09-16 06:10:00	2018-01-27 00:02:04	5	84776342383
13	81506508842	2017-05-19 01:42:47	2021-04-17 06:44:46	15	86668012909
14	83627329913	2004-09-30 08:12:17	2009-07-27 23:51:04	12	81849212028
15	89823670379	2011-01-02 05:12:56	2013-09-07 21:57:11	13	86826020649
16	84453388077	2015-09-08 13:14:14	2017-03-31 07:31:08	14	87844473414
17	81181394332	2017-08-05 13:29:20	2023-04-06 16:20:18	6	89113021705
18	89965502347	2005-12-19 03:37:42	2006-09-23 11:49:32	2	87119455559
19	82065107318	2011-01-18 02:29:04	2020-05-11 11:05:21	1	86478564142
20	88397505360	2018-10-13 02:41:32	2018-11-15 12:30:46	11	85859965891
21	82398924816	2015-01-10 18:32:53	2017-03-08 11:42:22	8	88062218118
22	81382849505	2014-02-01 16:43:19	2021-10-12 16:41:08	4	85492432392
23	89213981309	2008-07-18 08:33:46	2011-10-05 14:11:47	2	87176070353
24	86162878467	2008-08-08 21:50:47	2011-06-14 19:48:10	3	84852944385
25	89500192019	2004-08-08 08:02:47	2014-03-28 08:06:50	3	81408618607
26	86965901371	2011-12-24 13:15:32	2020-06-26 05:38:05	2	81705160967
27	84211136217	2008-07-19 05:29:01	2023-02-15 18:02:54	8	82400974131
28	88435170270	2001-06-26 15:13:54	2011-05-15 12:28:16	12	86792030011
29	88510122624	2022-09-19 06:14:01	2023-07-22 21:25:27	14	85587909681
30	81432063477	2003-03-24 06:09:08	2009-03-08 04:52:42	2	81935584195
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  3461.dat                                                                                            0000600 0004000 0002000 00000006312 14516725067 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	f	81839725897	2023-08-13	1157
2	t	85126663834	2019-04-01	4835
3	t	88686637097	2018-02-18	346
4	t	86256652966	2011-06-19	2813
5	f	88874893105	2001-04-07	4315
6	t	81539108668	2017-10-29	4191
7	t	81015822213	2019-03-03	419
8	f	89844900220	2013-05-20	4920
9	t	89622760197	2010-04-13	698
10	f	88063132062	2005-02-06	1005
11	f	86256652966	2005-04-11	1639
12	t	87972625997	2016-06-22	478
13	f	87850980321	2003-04-26	1190
14	t	89730642391	2011-07-26	2354
15	f	86654382873	2018-12-10	4200
16	f	81272583628	2005-02-13	2607
17	f	85922675734	2022-07-15	3174
18	f	89567417811	2012-08-20	2869
19	t	85121541173	2008-02-27	4301
20	t	86017927001	2003-05-08	3449
21	t	89622760197	2020-12-13	2032
22	f	86451732519	2012-01-12	266
23	f	86982112923	2019-12-29	3999
24	t	89931173404	2011-06-07	2667
25	f	85922675734	2023-04-21	1310
26	f	83939283170	2003-09-18	464
27	f	84182198979	2023-07-20	3160
28	t	88874893105	2015-01-20	4884
29	f	83038342901	2000-03-11	3018
30	t	83744171916	2008-01-03	1033
31	t	81281718689	2013-10-11	3540
32	f	89670073963	2015-05-28	4204
33	f	82010648116	2013-10-10	518
34	t	86948251411	2006-04-04	4145
35	t	83253580355	2020-07-20	747
36	t	81015822213	2003-06-30	4743
37	t	87716726601	2002-02-09	3716
38	t	86654382873	2003-08-02	4732
39	f	83774318368	2022-08-31	2646
40	f	89844900220	2000-11-20	4803
41	f	89175874533	2017-04-08	1375
42	f	88029686047	2012-11-02	1808
43	t	86982112923	2009-02-11	1530
44	t	83939283170	2023-02-07	4711
45	f	89567417811	2009-04-05	218
46	t	83162443692	2011-02-07	3795
47	t	82540578006	2021-06-18	1957
48	f	83231037288	2011-01-09	2603
49	t	89742497510	2018-10-05	699
50	t	82453780011	2008-03-16	423
51	f	85937533879	2002-09-17	2692
52	f	81272583628	2014-12-01	128
53	f	82440436528	2010-01-15	4092
54	t	85922675734	2007-04-15	2828
55	f	83164665019	2021-11-19	269
56	t	82010648116	2006-03-10	222
57	t	82514913257	2006-09-23	854
58	t	81760439158	2013-05-24	4546
59	t	85390205129	2016-12-06	764
60	t	89567417811	2008-07-19	1117
61	t	88063132062	2019-12-22	861
62	t	87127921928	2016-07-09	2094
63	t	81281718689	2006-01-13	2210
64	t	86813650741	2007-10-20	1200
65	f	82884816243	2016-02-22	3400
66	f	85121541173	2009-03-19	3741
67	f	82540578006	2005-02-06	3290
68	t	86813650741	2002-08-14	1288
69	f	83231037288	2003-05-12	2916
70	t	85181997756	2008-11-01	643
71	t	83774318368	2015-11-04	1452
72	t	85390205129	2000-05-14	3389
73	t	86256652966	2009-08-10	1012
74	f	81290751976	2008-12-17	665
75	t	86982112923	2010-07-19	4065
76	t	86451732519	2007-12-06	2176
77	f	84608960717	2007-06-03	1638
78	f	83038342901	2023-05-24	3878
79	t	86128319451	2003-02-21	3165
80	t	86329113206	2003-04-02	960
81	t	85390205129	2012-02-07	4411
82	f	85201742231	2000-02-24	4085
83	t	85126663834	2005-11-04	1523
84	t	86451732519	2000-03-25	3445
85	t	86813650741	2023-07-25	816
86	t	85390205129	2022-09-26	3386
87	t	86948251411	2020-12-28	4182
88	t	88354875145	2004-12-17	3067
89	t	88063132062	2010-05-25	1995
90	t	87312837291	2006-05-14	3307
91	f	86256652966	2005-05-11	4399
92	f	85121541173	2008-08-24	902
93	t	81351445183	2008-05-03	3226
94	t	85960847413	2001-01-03	2902
95	f	85937533879	2006-11-04	2543
96	f	89567417811	2005-04-29	1675
97	t	85126663834	2018-09-01	1178
98	t	83495694331	2003-10-14	2721
99	t	82453780011	2002-08-01	1222
100	t	84371531905	2010-11-05	298
\.


                                                                                                                                                                                                                                                                                                                      3446.dat                                                                                            0000600 0004000 0002000 00000022312 14516725067 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        85989838445	18	2013-12-04	2023-10-01	99158	173
89378119644	13	2016-04-25	2023-07-30	467510	144
84554042253	5	2015-12-06	2018-10-02	173716	172
86101596130	23	2008-10-26	2012-08-31	280402	31
85921650402	13	2019-07-02	2020-09-12	595166	28
81923735269	2	2021-10-17	2023-07-25	960880	144
86486261130	5	2015-04-02	2022-03-27	146104	76
88995907007	19	2000-12-31	2008-05-11	34927	129
81259763155	12	2001-11-22	2003-02-16	108119	11
81963989597	22	2014-02-17	2018-09-03	334140	37
87897875385	24	2015-01-07	2020-02-05	889397	156
87408044742	12	2003-04-01	2022-04-02	921292	8
87838385564	29	2004-04-09	2014-11-24	197308	178
85934185958	26	2020-01-08	2020-02-24	437258	91
82473714720	27	2010-11-05	2016-05-09	256126	72
88181892121	9	2018-12-22	2020-06-24	526489	169
86160385763	26	2023-09-05	2023-12-26	981263	38
85608141468	29	2019-10-25	2022-03-16	157733	4
86955286123	30	2012-03-02	2015-07-20	224463	35
89929579011	7	2000-05-22	2006-05-06	181240	156
82845265793	1	2008-08-08	2009-05-25	503095	32
81325275805	22	2006-05-23	2018-01-15	1913	193
83673016928	13	2006-05-12	2007-09-11	718026	44
88638367383	27	2002-06-28	2004-11-25	316813	7
83447384777	10	2001-04-10	2016-11-21	674809	185
86713079263	18	2010-04-06	2018-04-22	483658	135
87650208776	6	2011-02-15	2019-12-03	383550	124
82406791741	1	2010-04-26	2014-10-09	834250	74
86531377294	15	2005-02-01	2011-01-20	253651	125
86384735995	19	2001-03-22	2008-03-17	901084	33
83860321107	26	2001-10-27	2005-07-27	669077	82
87889363347	20	2019-10-15	2019-10-21	380864	160
89477659373	8	2004-12-13	2018-08-10	941091	200
89126566261	1	2005-03-03	2008-11-17	805858	104
84116686185	30	2007-06-08	2020-07-05	356153	115
81619801178	23	2007-01-07	2021-03-14	204565	171
88147954676	12	2008-03-28	2016-09-25	468696	157
82396578689	5	2012-12-25	2022-01-16	322144	146
81697616767	2	2005-02-10	2015-07-25	972629	137
88665541008	15	2010-10-13	2018-11-03	148518	179
81955219968	5	2017-11-23	2018-09-28	782207	129
85726355058	2	2000-05-24	2020-11-19	966471	199
88110444405	25	2000-05-21	2016-01-04	74062	148
89596297054	20	2001-12-05	2009-07-26	29972	87
83729117799	22	2011-06-02	2023-01-28	62669	114
86207056068	20	2013-07-15	2018-03-15	580408	185
85335538070	13	2016-07-09	2016-11-02	493911	131
81418506174	23	2007-10-08	2023-07-21	959532	5
87977930369	13	2020-08-21	2023-01-21	202325	124
83522722707	15	2012-07-17	2021-08-29	656641	157
88532905010	24	2016-03-07	2018-11-12	38853	174
82248039572	29	2016-10-01	2019-05-18	691135	15
88379340935	7	2005-12-03	2017-09-01	797116	110
88939461323	4	2014-07-19	2015-05-07	538891	25
84513739982	4	2013-12-04	2017-05-25	207080	10
85927253425	4	2000-09-15	2007-09-25	485259	93
83331208545	4	2015-11-07	2016-03-21	623381	121
88953045558	10	2009-04-10	2010-08-12	893072	42
81903695633	12	2002-06-14	2021-08-27	370434	160
83001662053	17	2003-12-22	2010-10-18	67119	5
81731031747	25	2006-09-06	2020-10-17	314960	68
89566911332	25	2015-05-04	2022-05-07	840285	199
83959491888	7	2009-10-04	2017-05-08	253362	157
89396588497	13	2006-12-24	2018-04-25	596880	42
83441681703	4	2012-01-05	2019-03-17	220395	189
83171562976	14	2009-04-08	2015-06-11	10528	82
82629632649	10	2010-01-21	2022-10-12	777177	38
85261801644	21	2014-02-11	2022-01-05	700908	47
81352472748	8	2010-01-26	2010-02-15	61105	37
85090832037	14	2016-11-22	2019-05-31	291535	53
85429150532	1	2008-01-30	2022-02-11	482871	153
85650760585	9	2017-02-03	2018-11-11	580224	50
82238919970	7	2004-10-25	2006-01-19	678252	181
85422084501	29	2000-11-22	2010-05-10	219032	172
86533912118	12	2007-11-03	2020-12-25	411676	185
81016543917	1	2011-10-04	2022-09-27	666931	133
86002117274	30	2016-02-25	2019-11-10	879882	20
81808476118	10	2006-08-05	2015-12-30	626993	141
86197733944	4	2012-07-28	2019-10-11	75644	180
89536127883	28	2000-01-11	2000-04-13	433620	58
87102175677	1	2009-02-08	2013-09-02	567618	86
89039495655	9	2005-04-10	2015-07-25	242832	107
85607668883	22	2002-04-26	2017-01-30	861524	154
83176917327	28	2001-10-14	2018-07-28	332236	113
83885249222	3	2000-05-03	2021-02-27	641768	91
89553320104	25	2000-05-22	2015-04-17	504644	11
87500858311	2	2009-02-14	2009-08-07	791907	160
84770044580	8	2002-12-12	2009-01-22	827090	194
86959890340	25	2014-11-04	2018-03-28	486743	124
86624337217	27	2012-03-23	2016-08-12	519292	190
87921681923	24	2009-07-10	2015-06-08	33699	97
86017395937	16	2013-10-09	2023-12-27	718798	1
86593285179	2	2002-11-02	2008-01-11	985503	194
81275221878	17	2011-04-04	2012-02-28	405121	132
82230071416	23	2017-03-14	2019-08-22	445161	10
88439105151	22	2015-01-03	2017-01-23	389936	177
87637003450	24	2016-09-01	2021-09-23	996448	176
85338431879	23	2004-09-28	2017-01-01	907095	18
85494893296	9	2016-01-17	2023-10-03	499154	140
88633481698	6	2002-09-20	2023-04-02	850075	174
85181997756	22	2005-06-24	2017-07-26	544414	135
89478225634	30	2003-04-10	2021-11-19	721354	104
83164665019	15	2017-12-19	2018-04-16	527129	41
81393324182	4	2012-02-13	2013-08-12	350910	42
85896878969	21	2001-02-12	2014-12-08	350748	53
84548540986	21	2010-06-29	2020-12-19	563510	179
81876597241	16	2001-10-27	2022-11-02	920855	131
86451732519	9	2003-03-21	2003-06-16	396985	200
89742497510	29	2000-06-11	2023-02-20	331266	7
87308609495	18	2019-02-06	2021-07-06	117133	133
87972625997	13	2002-07-28	2019-12-02	37910	138
85014001547	1	2001-04-03	2021-02-16	245321	192
86970918258	5	2009-07-22	2017-03-22	763014	171
86982112923	26	2006-08-31	2009-07-16	943360	134
89931173404	2	2019-09-21	2022-12-04	97399	84
85794497850	6	2001-10-08	2002-03-26	667079	193
82440436528	24	2001-04-16	2021-10-19	629681	96
81539108668	10	2006-03-26	2012-06-15	499780	23
88063132062	23	2005-06-23	2014-11-15	726463	164
87293111316	25	2011-11-25	2020-11-29	651764	177
81272583628	12	2003-05-17	2023-01-06	698781	64
82884816243	13	2006-01-20	2010-02-20	789342	66
82700964651	27	2011-09-23	2014-02-23	374961	159
86948251411	27	2013-12-22	2023-07-04	214791	82
85126663834	8	2008-12-30	2009-03-22	534676	180
83038342901	22	2004-03-04	2008-08-28	100209	107
81525714909	17	2002-12-10	2009-02-01	141481	44
84608960717	8	2000-11-25	2013-07-09	2400	93
85937533879	30	2007-07-20	2018-05-25	53248	26
85922675734	11	2005-10-17	2010-09-09	896267	38
87716726601	10	2018-06-22	2019-12-31	73378	12
81281718689	6	2014-06-11	2017-02-21	407462	158
83744171916	19	2003-10-18	2022-06-30	100912	60
86256652966	24	2018-02-02	2023-04-17	316079	182
86813650741	20	2017-02-02	2018-12-24	107569	17
84925489447	6	2014-02-06	2023-04-08	158798	99
83039121686	20	2013-07-18	2016-01-20	109820	177
85960847413	19	2000-02-04	2014-07-05	221225	71
85411706214	20	2013-12-10	2015-06-01	30417	76
89167792152	17	2010-09-11	2017-01-26	727823	83
87395751914	1	2003-07-27	2008-03-31	876429	18
87141610652	18	2015-09-29	2020-10-04	466098	119
83589371211	12	2011-10-06	2021-02-08	938360	107
82651331557	20	2012-09-13	2022-02-01	359128	36
82010648116	3	2000-05-05	2020-10-17	93283	94
86973322478	6	2014-01-25	2015-04-07	262557	32
87816542499	22	2017-01-27	2017-10-23	112260	114
89622760197	20	2000-08-17	2008-03-28	375346	200
86128319451	8	2008-06-26	2023-02-14	465747	189
84371531905	28	2005-08-02	2007-04-02	91966	32
89605694853	27	2005-01-22	2005-02-04	866608	150
89670073963	28	2000-01-20	2015-01-29	925788	16
81651408391	24	2013-11-17	2015-01-31	104508	125
85121541173	11	2007-02-09	2014-06-19	443081	115
87207296042	8	2014-04-15	2020-11-20	900037	178
82717184948	9	2002-02-18	2007-01-08	524799	130
83939283170	14	2016-01-14	2018-12-20	483949	39
83495694331	22	2020-01-08	2022-12-26	749545	68
83774318368	11	2012-08-29	2020-04-16	906384	49
89175874533	15	2003-08-08	2018-07-12	581336	92
86017927001	8	2005-06-16	2011-10-17	382082	69
88874893105	14	2007-02-03	2009-08-30	858179	140
81834251955	22	2019-03-12	2023-04-10	920318	155
84182198979	8	2007-05-01	2020-03-06	434362	83
83231037288	6	2014-05-05	2021-05-05	554905	67
81341681439	18	2008-05-29	2011-05-14	286607	154
89730642391	4	2017-01-22	2017-09-24	971810	80
83630038004	11	2013-03-24	2016-06-24	130137	67
85162225551	26	2000-02-10	2009-01-26	225901	174
83367260233	20	2004-04-01	2017-11-17	687763	182
87127921928	26	2008-06-21	2017-10-24	71199	139
81918740958	12	2004-10-28	2012-10-18	257111	162
82514913257	28	2003-11-14	2009-12-26	778871	76
89567417811	4	2005-06-15	2021-07-12	49384	94
88686637097	29	2006-04-17	2014-06-02	776111	140
86654382873	28	2000-07-23	2007-05-09	350978	79
83162443692	18	2000-11-26	2006-03-20	378083	161
87850980321	22	2013-10-01	2015-04-25	289966	76
81193274375	16	2012-07-02	2016-06-05	164825	183
84157873461	26	2015-05-29	2017-06-09	794132	66
84445401791	5	2013-06-18	2020-05-08	271276	125
83253580355	20	2010-09-23	2017-04-26	699670	145
81690604571	13	2000-03-21	2011-08-14	315114	158
81290751976	7	2000-03-05	2022-04-21	765002	199
85390205129	26	2009-01-07	2016-06-16	228504	189
86329113206	23	2001-11-16	2007-05-08	963389	105
88354875145	5	2014-01-29	2020-08-05	806946	195
89909942854	16	2004-05-27	2018-06-26	249469	35
83434716995	2	2004-08-28	2020-12-18	619766	157
85201742231	28	2002-06-18	2007-10-02	95119	77
87651296848	2	2015-11-25	2020-11-10	793561	140
82540578006	21	2005-03-27	2008-12-06	321174	15
88029686047	17	2010-04-02	2012-05-05	958424	1
87312837291	16	2001-03-17	2023-01-08	360734	51
81839725897	25	2010-05-26	2012-08-23	987901	1
82453780011	6	2011-03-16	2023-05-27	287897	190
89844900220	2	2016-05-25	2019-07-30	664665	126
81015822213	17	2008-08-05	2013-02-12	894556	134
81760439158	13	2010-06-05	2014-08-14	944413	83
81351445183	14	2015-08-19	2015-12-19	908605	150
\.


                                                                                                                                                                                                                                                                                                                      3455.dat                                                                                            0000600 0004000 0002000 00000005757 14516725067 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	2010-04-12	2015-11-29	1	51
28	2009-06-03	2013-12-18	2	45
23	2010-09-04	2019-12-22	3	14
21	2019-03-08	2022-03-29	4	54
9	2013-07-31	2023-04-24	5	22
23	2005-08-10	2016-07-06	6	48
13	2006-07-04	2011-04-02	7	7
9	2010-07-16	2016-02-11	8	8
15	2002-08-13	2003-01-10	9	47
18	2015-02-26	2022-09-21	10	58
11	2006-05-08	2009-11-26	11	37
23	2010-07-03	2011-09-28	12	23
22	2008-06-12	2022-02-08	13	50
19	2019-11-17	2020-12-11	14	2
15	2000-02-27	2013-04-26	15	17
7	2011-07-21	2023-08-15	16	58
22	2012-02-22	2015-04-27	17	4
18	2008-03-13	2012-12-11	18	44
15	2016-10-14	2019-02-02	19	51
24	2002-05-05	2003-04-15	20	40
5	2007-08-24	2007-11-11	21	16
12	2003-01-30	2012-01-02	22	24
21	2006-08-09	2021-03-15	23	5
10	2001-01-10	2006-05-10	24	38
17	2008-08-14	2020-05-21	25	49
9	2007-05-28	2008-08-22	26	11
12	2006-04-18	2015-08-20	27	54
27	2001-10-26	2019-10-04	28	53
7	2018-02-15	2020-01-16	29	11
15	2000-06-25	2021-10-13	30	41
3	2006-03-01	2007-01-14	31	18
5	2003-02-04	2012-11-26	32	32
30	2001-08-08	2018-10-14	33	2
10	2000-08-03	2017-07-30	34	33
8	2002-03-12	2013-10-04	35	50
30	2003-07-02	2014-12-07	36	54
15	2004-10-13	2019-09-15	37	48
25	2013-09-29	2014-05-06	38	42
8	2009-10-05	2018-08-04	39	22
3	2007-07-07	2011-10-16	40	9
3	2003-09-27	2021-04-17	41	30
22	2004-08-08	2016-11-25	42	41
13	2015-04-21	2015-06-28	43	49
12	2015-07-24	2019-09-12	44	16
21	2002-08-03	2018-07-18	45	50
16	2011-07-21	2016-02-15	46	50
18	2003-07-06	2023-08-28	47	1
8	2005-10-11	2023-11-03	48	9
13	2001-05-21	2012-09-03	49	50
14	2004-02-18	2016-01-24	50	60
27	2001-11-14	2010-11-13	51	23
28	2003-12-18	2010-01-31	52	27
20	2017-01-30	2020-06-08	53	36
30	2006-10-17	2019-04-25	54	31
1	2014-08-21	2023-03-05	55	30
2	2011-12-17	2017-08-31	56	27
22	2004-05-31	2017-04-19	57	11
28	2014-11-12	2017-02-02	58	55
23	2009-10-18	2018-07-11	59	31
18	2015-05-31	2022-09-02	60	37
17	2012-07-29	2015-04-01	61	51
6	2011-01-10	2015-08-20	62	43
9	2013-03-03	2022-05-20	63	18
27	2006-01-19	2019-10-28	64	36
30	2006-01-03	2019-08-29	65	17
6	2007-08-15	2019-05-27	66	28
1	2013-01-04	2015-04-18	67	35
15	2002-04-13	2009-08-25	68	46
2	2006-12-10	2012-01-29	69	8
15	2001-09-09	2012-01-18	70	1
30	2004-05-26	2013-01-26	71	42
12	2003-11-24	2004-02-06	72	57
11	2003-09-19	2016-08-05	73	1
17	2020-01-04	2020-07-07	74	27
28	2017-04-09	2017-05-29	75	44
13	2015-07-18	2019-01-28	76	20
8	2013-06-15	2021-05-28	77	34
23	2000-11-15	2013-01-12	78	21
15	2016-09-04	2022-12-22	79	56
23	2002-02-13	2015-12-30	80	13
27	2009-06-20	2017-08-22	81	19
23	2015-06-18	2021-01-29	82	12
10	2006-09-12	2016-11-06	83	49
10	2006-09-12	2014-02-18	84	57
5	2002-03-23	2014-03-01	85	55
22	2002-09-03	2017-02-17	86	17
18	2002-12-27	2018-06-21	87	4
27	2010-01-25	2020-04-16	88	29
18	2005-02-03	2016-06-09	89	46
28	2010-09-25	2016-03-21	90	26
19	2011-03-06	2023-02-08	91	37
28	2003-06-10	2011-06-01	92	10
4	2016-06-18	2020-11-10	93	12
9	2009-04-01	2013-01-02	94	29
14	2006-12-07	2015-03-03	95	1
1	2010-09-06	2023-10-22	96	53
4	2002-06-02	2017-08-27	97	48
17	2000-05-20	2012-01-23	98	27
22	2004-08-08	2006-01-05	99	40
3	2009-11-06	2022-03-22	100	11
\.


                 restore.sql                                                                                         0000600 0004000 0002000 00000106044 14516725067 0015406 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

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

DROP DATABASE phone_provider;
--
-- Name: phone_provider; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE phone_provider WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE phone_provider OWNER TO postgres;

\connect phone_provider

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
-- Name: periodicity_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.periodicity_enum AS ENUM (
    'daily',
    'weekly',
    'monthly',
    'yearly',
    'hourly'
);


ALTER TYPE public.periodicity_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: basic_tariff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basic_tariff (
    tariff_id integer NOT NULL,
    gb_amount integer,
    international_call_cost_per_minute numeric NOT NULL,
    domestic_call_cost_per_minute numeric NOT NULL,
    basic_tariff_price numeric NOT NULL,
    tariff_name character varying(60) NOT NULL,
    minutes_amount bigint NOT NULL,
    sms_amount bigint NOT NULL,
    CONSTRAINT gb_amount_chk CHECK ((gb_amount >= 0)),
    CONSTRAINT minutes_amount_chk CHECK ((minutes_amount >= 0)),
    CONSTRAINT sms_amount_chk CHECK ((sms_amount >= 0))
);


ALTER TABLE public.basic_tariff OWNER TO postgres;

--
-- Name: basic_tariff_tariff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basic_tariff_tariff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_tariff_tariff_id_seq OWNER TO postgres;

--
-- Name: basic_tariff_tariff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basic_tariff_tariff_id_seq OWNED BY public.basic_tariff.tariff_id;


--
-- Name: call_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.call_zone (
    call_zone_id integer NOT NULL,
    country character varying(60) NOT NULL,
    cost_per_minute_call_zone numeric NOT NULL,
    region character varying(60),
    city character varying(60)
);


ALTER TABLE public.call_zone OWNER TO postgres;

--
-- Name: call_zone_call_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.call_zone_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.call_zone_call_zone_id_seq OWNER TO postgres;

--
-- Name: call_zone_call_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.call_zone_call_zone_id_seq OWNED BY public.call_zone.call_zone_id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    passport_issuing_authority character varying(100) NOT NULL,
    passport_series_and_number bigint NOT NULL,
    passport_issuing_date date NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_client_id_seq OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- Name: contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract (
    contract_id integer NOT NULL,
    client_id integer NOT NULL,
    date_of_conclusion date NOT NULL,
    date_of_cancellation date
);


ALTER TABLE public.contract OWNER TO postgres;

--
-- Name: contract_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_client_id_seq OWNER TO postgres;

--
-- Name: contract_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_client_id_seq OWNED BY public.contract.client_id;


--
-- Name: contract_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_contract_id_seq OWNER TO postgres;

--
-- Name: contract_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_contract_id_seq OWNED BY public.contract.contract_id;


--
-- Name: domestic_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domestic_call (
    domestic_callee_number bigint NOT NULL,
    phone_number bigint NOT NULL,
    call_start_time timestamp(0) without time zone NOT NULL,
    call_end_time timestamp(0) without time zone,
    domestic_call_id integer NOT NULL
);


ALTER TABLE public.domestic_call OWNER TO postgres;

--
-- Name: domestic_call_domestic_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domestic_call_domestic_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domestic_call_domestic_call_id_seq OWNER TO postgres;

--
-- Name: domestic_call_domestic_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domestic_call_domestic_call_id_seq OWNED BY public.domestic_call.domestic_call_id;


--
-- Name: external_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.external_service (
    external_service_id integer NOT NULL,
    external_service_price money NOT NULL,
    external_service_description text NOT NULL,
    external_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT external_service_description_chk CHECK ((length(external_service_description) < 1000))
);


ALTER TABLE public.external_service OWNER TO postgres;

--
-- Name: external_service_external_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.external_service_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_external_service_id_seq OWNER TO postgres;

--
-- Name: external_service_external_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.external_service_external_service_id_seq OWNED BY public.external_service.external_service_id;


--
-- Name: external_service_inclusion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.external_service_inclusion (
    external_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    external_service_date_of_connection date NOT NULL,
    external_service_date_of_disconnection date,
    external_service_inclusion_id integer NOT NULL
);


ALTER TABLE public.external_service_inclusion OWNER TO postgres;

--
-- Name: external_service_inclusion_external_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.external_service_inclusion_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_inclusion_external_service_id_seq OWNER TO postgres;

--
-- Name: external_service_inclusion_external_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.external_service_inclusion_external_service_id_seq OWNED BY public.external_service_inclusion.external_service_id;


--
-- Name: external_service_inclusion_external_service_inclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_inclusion_external_service_inclusion_id_seq OWNER TO postgres;

--
-- Name: external_service_inclusion_external_service_inclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq OWNED BY public.external_service_inclusion.external_service_inclusion_id;


--
-- Name: internal_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.internal_service (
    internal_service_id integer NOT NULL,
    internal_service_price money NOT NULL,
    internal_service_description text NOT NULL,
    internal_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT internal_service_description_chk CHECK ((length(internal_service_description) < 1000))
);


ALTER TABLE public.internal_service OWNER TO postgres;

--
-- Name: internal_service_inclusion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.internal_service_inclusion (
    internal_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    date_of_connection date NOT NULL,
    date_of_disconnection date,
    internal_service_inclusion_id integer NOT NULL
);


ALTER TABLE public.internal_service_inclusion OWNER TO postgres;

--
-- Name: internal_service_inclusion_internal_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internal_service_inclusion_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_service_inclusion_internal_service_id_seq OWNER TO postgres;

--
-- Name: internal_service_inclusion_internal_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internal_service_inclusion_internal_service_id_seq OWNED BY public.internal_service_inclusion.internal_service_id;


--
-- Name: internal_service_inclusion_internal_service_inclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_service_inclusion_internal_service_inclusion_id_seq OWNER TO postgres;

--
-- Name: internal_service_inclusion_internal_service_inclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq OWNED BY public.internal_service_inclusion.internal_service_inclusion_id;


--
-- Name: internal_service_internal_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.internal_service_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internal_service_internal_service_id_seq OWNER TO postgres;

--
-- Name: internal_service_internal_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.internal_service_internal_service_id_seq OWNED BY public.internal_service.internal_service_id;


--
-- Name: international_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.international_call (
    international_call_id integer NOT NULL,
    phone_number bigint NOT NULL,
    international_call_start_time timestamp(0) without time zone,
    international_call_end_time timestamp without time zone,
    call_zone_id integer NOT NULL,
    international_callee_number bigint
);


ALTER TABLE public.international_call OWNER TO postgres;

--
-- Name: international_call_call_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.international_call_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.international_call_call_zone_id_seq OWNER TO postgres;

--
-- Name: international_call_call_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.international_call_call_zone_id_seq OWNED BY public.international_call.call_zone_id;


--
-- Name: international_call_international_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.international_call_international_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.international_call_international_call_id_seq OWNER TO postgres;

--
-- Name: international_call_international_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.international_call_international_call_id_seq OWNED BY public.international_call.international_call_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    payment_status boolean NOT NULL,
    phone_number bigint NOT NULL,
    payment_date date NOT NULL,
    payment_amount numeric
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: phone_on_tariff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phone_on_tariff (
    phone_on_tariff_number bigint NOT NULL,
    tariff_id integer NOT NULL,
    activation_date date NOT NULL,
    deletion_date date,
    current_balance numeric NOT NULL,
    contract_id integer NOT NULL
);


ALTER TABLE public.phone_on_tariff OWNER TO postgres;

--
-- Name: phone_on_tariff_contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phone_on_tariff_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phone_on_tariff_contract_id_seq OWNER TO postgres;

--
-- Name: phone_on_tariff_contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phone_on_tariff_contract_id_seq OWNED BY public.phone_on_tariff.contract_id;


--
-- Name: tariff_service_inclusion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tariff_service_inclusion (
    tariff_id integer NOT NULL,
    tariff_service_date_of_connection date NOT NULL,
    tariff_service_date_of_disconnection date,
    tariff_service_inclusion_id integer NOT NULL,
    internal_service_id integer
);


ALTER TABLE public.tariff_service_inclusion OWNER TO postgres;

--
-- Name: tariff_service_inclusion_tariff_service_inclusion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tariff_service_inclusion_tariff_service_inclusion_id_seq OWNER TO postgres;

--
-- Name: tariff_service_inclusion_tariff_service_inclusion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq OWNED BY public.tariff_service_inclusion.tariff_service_inclusion_id;


--
-- Name: basic_tariff tariff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_tariff ALTER COLUMN tariff_id SET DEFAULT nextval('public.basic_tariff_tariff_id_seq'::regclass);


--
-- Name: call_zone call_zone_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_zone ALTER COLUMN call_zone_id SET DEFAULT nextval('public.call_zone_call_zone_id_seq'::regclass);


--
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- Name: contract contract_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract ALTER COLUMN contract_id SET DEFAULT nextval('public.contract_contract_id_seq'::regclass);


--
-- Name: contract client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract ALTER COLUMN client_id SET DEFAULT nextval('public.contract_client_id_seq'::regclass);


--
-- Name: external_service external_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_external_service_id_seq'::regclass);


--
-- Name: external_service_inclusion external_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_inclusion_external_service_id_seq'::regclass);


--
-- Name: external_service_inclusion external_service_inclusion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_inclusion_id SET DEFAULT nextval('public.external_service_inclusion_external_service_inclusion_id_seq'::regclass);


--
-- Name: internal_service internal_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_internal_service_id_seq'::regclass);


--
-- Name: internal_service_inclusion internal_service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_id_seq'::regclass);


--
-- Name: internal_service_inclusion internal_service_inclusion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_inclusion_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_inclusion_id_seq'::regclass);


--
-- Name: international_call international_call_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call ALTER COLUMN international_call_id SET DEFAULT nextval('public.international_call_international_call_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: tariff_service_inclusion tariff_service_inclusion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion ALTER COLUMN tariff_service_inclusion_id SET DEFAULT nextval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq'::regclass);


--
-- Data for Name: basic_tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basic_tariff (tariff_id, gb_amount, international_call_cost_per_minute, domestic_call_cost_per_minute, basic_tariff_price, tariff_name, minutes_amount, sms_amount) FROM stdin;
\.
COPY public.basic_tariff (tariff_id, gb_amount, international_call_cost_per_minute, domestic_call_cost_per_minute, basic_tariff_price, tariff_name, minutes_amount, sms_amount) FROM '$$PATH$$/3433.dat';

--
-- Data for Name: call_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.call_zone (call_zone_id, country, cost_per_minute_call_zone, region, city) FROM stdin;
\.
COPY public.call_zone (call_zone_id, country, cost_per_minute_call_zone, region, city) FROM '$$PATH$$/3439.dat';

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (client_id, full_name, passport_issuing_authority, passport_series_and_number, passport_issuing_date, address) FROM stdin;
\.
COPY public.client (client_id, full_name, passport_issuing_authority, passport_series_and_number, passport_issuing_date, address) FROM '$$PATH$$/3441.dat';

--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contract (contract_id, client_id, date_of_conclusion, date_of_cancellation) FROM stdin;
\.
COPY public.contract (contract_id, client_id, date_of_conclusion, date_of_cancellation) FROM '$$PATH$$/3444.dat';

--
-- Data for Name: domestic_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.domestic_call (domestic_callee_number, phone_number, call_start_time, call_end_time, domestic_call_id) FROM stdin;
\.
COPY public.domestic_call (domestic_callee_number, phone_number, call_start_time, call_end_time, domestic_call_id) FROM '$$PATH$$/3447.dat';

--
-- Data for Name: external_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.external_service (external_service_id, external_service_price, external_service_description, external_service_periodicity) FROM stdin;
\.
COPY public.external_service (external_service_id, external_service_price, external_service_description, external_service_periodicity) FROM '$$PATH$$/3437.dat';

--
-- Data for Name: external_service_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.external_service_inclusion (external_service_id, phone_number, external_service_date_of_connection, external_service_date_of_disconnection, external_service_inclusion_id) FROM stdin;
\.
COPY public.external_service_inclusion (external_service_id, phone_number, external_service_date_of_connection, external_service_date_of_disconnection, external_service_inclusion_id) FROM '$$PATH$$/3454.dat';

--
-- Data for Name: internal_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.internal_service (internal_service_id, internal_service_price, internal_service_description, internal_service_periodicity) FROM stdin;
\.
COPY public.internal_service (internal_service_id, internal_service_price, internal_service_description, internal_service_periodicity) FROM '$$PATH$$/3435.dat';

--
-- Data for Name: internal_service_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.internal_service_inclusion (internal_service_id, phone_number, date_of_connection, date_of_disconnection, internal_service_inclusion_id) FROM stdin;
\.
COPY public.internal_service_inclusion (internal_service_id, phone_number, date_of_connection, date_of_disconnection, internal_service_inclusion_id) FROM '$$PATH$$/3452.dat';

--
-- Data for Name: international_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.international_call (international_call_id, phone_number, international_call_start_time, international_call_end_time, call_zone_id, international_callee_number) FROM stdin;
\.
COPY public.international_call (international_call_id, phone_number, international_call_start_time, international_call_end_time, call_zone_id, international_callee_number) FROM '$$PATH$$/3450.dat';

--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, payment_status, phone_number, payment_date, payment_amount) FROM stdin;
\.
COPY public.payment (payment_id, payment_status, phone_number, payment_date, payment_amount) FROM '$$PATH$$/3461.dat';

--
-- Data for Name: phone_on_tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phone_on_tariff (phone_on_tariff_number, tariff_id, activation_date, deletion_date, current_balance, contract_id) FROM stdin;
\.
COPY public.phone_on_tariff (phone_on_tariff_number, tariff_id, activation_date, deletion_date, current_balance, contract_id) FROM '$$PATH$$/3446.dat';

--
-- Data for Name: tariff_service_inclusion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tariff_service_inclusion (tariff_id, tariff_service_date_of_connection, tariff_service_date_of_disconnection, tariff_service_inclusion_id, internal_service_id) FROM stdin;
\.
COPY public.tariff_service_inclusion (tariff_id, tariff_service_date_of_connection, tariff_service_date_of_disconnection, tariff_service_inclusion_id, internal_service_id) FROM '$$PATH$$/3455.dat';

--
-- Name: basic_tariff_tariff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basic_tariff_tariff_id_seq', 1, false);


--
-- Name: call_zone_call_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.call_zone_call_zone_id_seq', 1, false);


--
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);


--
-- Name: contract_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_client_id_seq', 1, false);


--
-- Name: contract_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_contract_id_seq', 1, false);


--
-- Name: domestic_call_domestic_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domestic_call_domestic_call_id_seq', 1, false);


--
-- Name: external_service_external_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.external_service_external_service_id_seq', 1, false);


--
-- Name: external_service_inclusion_external_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.external_service_inclusion_external_service_id_seq', 1, false);


--
-- Name: external_service_inclusion_external_service_inclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.external_service_inclusion_external_service_inclusion_id_seq', 1, false);


--
-- Name: internal_service_inclusion_internal_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_id_seq', 1, false);


--
-- Name: internal_service_inclusion_internal_service_inclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_inclusion_id_seq', 1, false);


--
-- Name: internal_service_internal_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.internal_service_internal_service_id_seq', 1, false);


--
-- Name: international_call_call_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.international_call_call_zone_id_seq', 1, false);


--
-- Name: international_call_international_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.international_call_international_call_id_seq', 1, false);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: phone_on_tariff_contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phone_on_tariff_contract_id_seq', 1, false);


--
-- Name: tariff_service_inclusion_tariff_service_inclusion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq', 1, false);


--
-- Name: call_zone call_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.call_zone
    ADD CONSTRAINT call_zone_pkey PRIMARY KEY (call_zone_id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- Name: contract contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (contract_id);


--
-- Name: domestic_call domestic_call_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_id_unique UNIQUE (domestic_call_id);


--
-- Name: domestic_call domestic_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_pkey PRIMARY KEY (domestic_call_id);


--
-- Name: external_service_inclusion external_service_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_inclusion_pkey PRIMARY KEY (external_service_inclusion_id);


--
-- Name: external_service external_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service
    ADD CONSTRAINT external_service_pkey PRIMARY KEY (external_service_id);


--
-- Name: internal_service_inclusion internal_service_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_inclusion_pkey PRIMARY KEY (internal_service_inclusion_id);


--
-- Name: internal_service internal_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service
    ADD CONSTRAINT internal_service_pkey PRIMARY KEY (internal_service_id);


--
-- Name: international_call international_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_pkey PRIMARY KEY (international_call_id);


--
-- Name: client passport_series_and_number_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT passport_series_and_number_unique UNIQUE (passport_series_and_number);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: phone_on_tariff phone_on_tariff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_pkey PRIMARY KEY (phone_on_tariff_number);


--
-- Name: basic_tariff tariff_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basic_tariff
    ADD CONSTRAINT tariff_id_pkey PRIMARY KEY (tariff_id);


--
-- Name: tariff_service_inclusion tariff_service_inclusion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_service_inclusion_pkey PRIMARY KEY (tariff_service_inclusion_id);


--
-- Name: international_call call_zone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT call_zone_id_fkey FOREIGN KEY (call_zone_id) REFERENCES public.call_zone(call_zone_id);


--
-- Name: contract client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract
    ADD CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- Name: external_service_inclusion external_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_id_fkey FOREIGN KEY (external_service_id) REFERENCES public.external_service(external_service_id);


--
-- Name: internal_service_inclusion internal_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_id_fkey FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id);


--
-- Name: international_call international_call_phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number) NOT VALID;


--
-- Name: payment payment_phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- Name: domestic_call phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- Name: internal_service_inclusion phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- Name: external_service_inclusion phone_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);


--
-- Name: phone_on_tariff phone_on_tariff_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(contract_id) NOT VALID;


--
-- Name: tariff_service_inclusion service_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT service_id FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id) NOT VALID;


--
-- Name: phone_on_tariff tariff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id);


--
-- Name: tariff_service_inclusion tariff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            