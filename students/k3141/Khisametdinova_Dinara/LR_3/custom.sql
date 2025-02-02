PGDMP                     	    {            phone_provider    14.9    14.9 |    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16403    phone_provider    DATABASE     k   CREATE DATABASE phone_provider WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE phone_provider;
                postgres    false            V           1247    16481    periodicity_enum    TYPE     v   CREATE TYPE public.periodicity_enum AS ENUM (
    'daily',
    'weekly',
    'monthly',
    'yearly',
    'hourly'
);
 #   DROP TYPE public.periodicity_enum;
       public          postgres    false            �            1259    16436    basic_tariff    TABLE       CREATE TABLE public.basic_tariff (
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
       public         heap    postgres    false            �            1259    16435    basic_tariff_tariff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basic_tariff_tariff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.basic_tariff_tariff_id_seq;
       public          postgres    false    210            �           0    0    basic_tariff_tariff_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.basic_tariff_tariff_id_seq OWNED BY public.basic_tariff.tariff_id;
          public          postgres    false    209            �            1259    16527 	   call_zone    TABLE     �   CREATE TABLE public.call_zone (
    call_zone_id integer NOT NULL,
    country character varying(60) NOT NULL,
    cost_per_minute_call_zone numeric NOT NULL,
    region character varying(60),
    city character varying(60)
);
    DROP TABLE public.call_zone;
       public         heap    postgres    false            �            1259    16526    call_zone_call_zone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.call_zone_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.call_zone_call_zone_id_seq;
       public          postgres    false    216            �           0    0    call_zone_call_zone_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.call_zone_call_zone_id_seq OWNED BY public.call_zone.call_zone_id;
          public          postgres    false    215            �            1259    16555    client    TABLE     3  CREATE TABLE public.client (
    client_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    passport_issuing_authority character varying(100) NOT NULL,
    passport_series_and_number bigint NOT NULL,
    passport_issuing_date date NOT NULL,
    address character varying(200) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16554    client_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    218            �           0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    217            �            1259    16565    contract    TABLE     �   CREATE TABLE public.contract (
    contract_id integer NOT NULL,
    client_id integer NOT NULL,
    date_of_conclusion date NOT NULL,
    date_of_cancellation date
);
    DROP TABLE public.contract;
       public         heap    postgres    false            �            1259    16564    contract_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contract_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.contract_client_id_seq;
       public          postgres    false    221            �           0    0    contract_client_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.contract_client_id_seq OWNED BY public.contract.client_id;
          public          postgres    false    220            �            1259    16563    contract_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contract_contract_id_seq;
       public          postgres    false    221            �           0    0    contract_contract_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contract_contract_id_seq OWNED BY public.contract.contract_id;
          public          postgres    false    219            �            1259    16595    domestic_call    TABLE     
  CREATE TABLE public.domestic_call (
    domestic_callee_number bigint NOT NULL,
    phone_number bigint NOT NULL,
    call_start_time timestamp(0) without time zone NOT NULL,
    call_end_time timestamp(0) without time zone,
    domestic_call_id integer NOT NULL
);
 !   DROP TABLE public.domestic_call;
       public         heap    postgres    false            �            1259    16700 "   domestic_call_domestic_call_id_seq    SEQUENCE     �   CREATE SEQUENCE public.domestic_call_domestic_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.domestic_call_domestic_call_id_seq;
       public          postgres    false    224            �           0    0 "   domestic_call_domestic_call_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.domestic_call_domestic_call_id_seq OWNED BY public.domestic_call.domestic_call_id;
          public          postgres    false    235            �            1259    16512    external_service    TABLE     X  CREATE TABLE public.external_service (
    external_service_id integer NOT NULL,
    external_service_price money NOT NULL,
    external_service_description text NOT NULL,
    external_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT external_service_description_chk CHECK ((length(external_service_description) < 1000))
);
 $   DROP TABLE public.external_service;
       public         heap    postgres    false    854            �            1259    16511 (   external_service_external_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_service_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.external_service_external_service_id_seq;
       public          postgres    false    214            �           0    0 (   external_service_external_service_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.external_service_external_service_id_seq OWNED BY public.external_service.external_service_id;
          public          postgres    false    213            �            1259    16642    external_service_inclusion    TABLE       CREATE TABLE public.external_service_inclusion (
    external_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    external_service_date_of_connection date NOT NULL,
    external_service_date_of_disconnection date,
    external_service_inclusion_id integer NOT NULL
);
 .   DROP TABLE public.external_service_inclusion;
       public         heap    postgres    false            �            1259    16641 2   external_service_inclusion_external_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_service_inclusion_external_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.external_service_inclusion_external_service_id_seq;
       public          postgres    false    231            �           0    0 2   external_service_inclusion_external_service_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.external_service_inclusion_external_service_id_seq OWNED BY public.external_service_inclusion.external_service_id;
          public          postgres    false    230            �            1259    16684 <   external_service_inclusion_external_service_inclusion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq;
       public          postgres    false    231            �           0    0 <   external_service_inclusion_external_service_inclusion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.external_service_inclusion_external_service_inclusion_id_seq OWNED BY public.external_service_inclusion.external_service_inclusion_id;
          public          postgres    false    233            �            1259    16492    internal_service    TABLE     X  CREATE TABLE public.internal_service (
    internal_service_id integer NOT NULL,
    internal_service_price money NOT NULL,
    internal_service_description text NOT NULL,
    internal_service_periodicity public.periodicity_enum NOT NULL,
    CONSTRAINT internal_service_description_chk CHECK ((length(internal_service_description) < 1000))
);
 $   DROP TABLE public.internal_service;
       public         heap    postgres    false    854            �            1259    16622    internal_service_inclusion    TABLE     �   CREATE TABLE public.internal_service_inclusion (
    internal_service_id integer NOT NULL,
    phone_number bigint NOT NULL,
    date_of_connection date NOT NULL,
    date_of_disconnection date,
    internal_service_inclusion_id integer NOT NULL
);
 .   DROP TABLE public.internal_service_inclusion;
       public         heap    postgres    false            �            1259    16620 2   internal_service_inclusion_internal_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_service_inclusion_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.internal_service_inclusion_internal_service_id_seq;
       public          postgres    false    229            �           0    0 2   internal_service_inclusion_internal_service_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.internal_service_inclusion_internal_service_id_seq OWNED BY public.internal_service_inclusion.internal_service_id;
          public          postgres    false    228            �            1259    16692 <   internal_service_inclusion_internal_service_inclusion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq;
       public          postgres    false    229            �           0    0 <   internal_service_inclusion_internal_service_inclusion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.internal_service_inclusion_internal_service_inclusion_id_seq OWNED BY public.internal_service_inclusion.internal_service_inclusion_id;
          public          postgres    false    234            �            1259    16491 (   internal_service_internal_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.internal_service_internal_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.internal_service_internal_service_id_seq;
       public          postgres    false    212            �           0    0 (   internal_service_internal_service_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.internal_service_internal_service_id_seq OWNED BY public.internal_service.internal_service_id;
          public          postgres    false    211            �            1259    16608    international_call    TABLE     C  CREATE TABLE public.international_call (
    international_call_id integer NOT NULL,
    phone_number bigint NOT NULL,
    international_call_start_time timestamp(0) without time zone,
    international_call_end_time timestamp without time zone,
    call_zone_id integer NOT NULL,
    international_callee_number bigint
);
 &   DROP TABLE public.international_call;
       public         heap    postgres    false            �            1259    16607 #   international_call_call_zone_id_seq    SEQUENCE     �   CREATE SEQUENCE public.international_call_call_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.international_call_call_zone_id_seq;
       public          postgres    false    227            �           0    0 #   international_call_call_zone_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.international_call_call_zone_id_seq OWNED BY public.international_call.call_zone_id;
          public          postgres    false    226            �            1259    16606 ,   international_call_international_call_id_seq    SEQUENCE     �   CREATE SEQUENCE public.international_call_international_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.international_call_international_call_id_seq;
       public          postgres    false    227            �           0    0 ,   international_call_international_call_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.international_call_international_call_id_seq OWNED BY public.international_call.international_call_id;
          public          postgres    false    225            �            1259    16975    payment    TABLE     �   CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    payment_status boolean NOT NULL,
    phone_number bigint NOT NULL,
    payment_date date NOT NULL,
    payment_amount numeric
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    16974    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    238            �           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    237            �            1259    16578    phone_on_tariff    TABLE     �   CREATE TABLE public.phone_on_tariff (
    phone_on_tariff_number bigint NOT NULL,
    tariff_id integer NOT NULL,
    activation_date date NOT NULL,
    deletion_date date,
    current_balance numeric NOT NULL,
    contract_id integer NOT NULL
);
 #   DROP TABLE public.phone_on_tariff;
       public         heap    postgres    false            �            1259    16577    phone_on_tariff_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.phone_on_tariff_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.phone_on_tariff_contract_id_seq;
       public          postgres    false    223            �           0    0    phone_on_tariff_contract_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.phone_on_tariff_contract_id_seq OWNED BY public.phone_on_tariff.contract_id;
          public          postgres    false    222            �            1259    16660    tariff_service_inclusion    TABLE       CREATE TABLE public.tariff_service_inclusion (
    tariff_id integer NOT NULL,
    tariff_service_date_of_connection date NOT NULL,
    tariff_service_date_of_disconnection date,
    tariff_service_inclusion_id integer NOT NULL,
    internal_service_id integer
);
 ,   DROP TABLE public.tariff_service_inclusion;
       public         heap    postgres    false            �            1259    16708 8   tariff_service_inclusion_tariff_service_inclusion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq;
       public          postgres    false    232            �           0    0 8   tariff_service_inclusion_tariff_service_inclusion_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.tariff_service_inclusion_tariff_service_inclusion_id_seq OWNED BY public.tariff_service_inclusion.tariff_service_inclusion_id;
          public          postgres    false    236            �           2604    16439    basic_tariff tariff_id    DEFAULT     �   ALTER TABLE ONLY public.basic_tariff ALTER COLUMN tariff_id SET DEFAULT nextval('public.basic_tariff_tariff_id_seq'::regclass);
 E   ALTER TABLE public.basic_tariff ALTER COLUMN tariff_id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16530    call_zone call_zone_id    DEFAULT     �   ALTER TABLE ONLY public.call_zone ALTER COLUMN call_zone_id SET DEFAULT nextval('public.call_zone_call_zone_id_seq'::regclass);
 E   ALTER TABLE public.call_zone ALTER COLUMN call_zone_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16558    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16568    contract contract_id    DEFAULT     |   ALTER TABLE ONLY public.contract ALTER COLUMN contract_id SET DEFAULT nextval('public.contract_contract_id_seq'::regclass);
 C   ALTER TABLE public.contract ALTER COLUMN contract_id DROP DEFAULT;
       public          postgres    false    219    221    221            �           2604    16569    contract client_id    DEFAULT     x   ALTER TABLE ONLY public.contract ALTER COLUMN client_id SET DEFAULT nextval('public.contract_client_id_seq'::regclass);
 A   ALTER TABLE public.contract ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16515 $   external_service external_service_id    DEFAULT     �   ALTER TABLE ONLY public.external_service ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_external_service_id_seq'::regclass);
 S   ALTER TABLE public.external_service ALTER COLUMN external_service_id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    16646 .   external_service_inclusion external_service_id    DEFAULT     �   ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_id SET DEFAULT nextval('public.external_service_inclusion_external_service_id_seq'::regclass);
 ]   ALTER TABLE public.external_service_inclusion ALTER COLUMN external_service_id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    16685 8   external_service_inclusion external_service_inclusion_id    DEFAULT     �   ALTER TABLE ONLY public.external_service_inclusion ALTER COLUMN external_service_inclusion_id SET DEFAULT nextval('public.external_service_inclusion_external_service_inclusion_id_seq'::regclass);
 g   ALTER TABLE public.external_service_inclusion ALTER COLUMN external_service_inclusion_id DROP DEFAULT;
       public          postgres    false    233    231            �           2604    16495 $   internal_service internal_service_id    DEFAULT     �   ALTER TABLE ONLY public.internal_service ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_internal_service_id_seq'::regclass);
 S   ALTER TABLE public.internal_service ALTER COLUMN internal_service_id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    16625 .   internal_service_inclusion internal_service_id    DEFAULT     �   ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_id_seq'::regclass);
 ]   ALTER TABLE public.internal_service_inclusion ALTER COLUMN internal_service_id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16693 8   internal_service_inclusion internal_service_inclusion_id    DEFAULT     �   ALTER TABLE ONLY public.internal_service_inclusion ALTER COLUMN internal_service_inclusion_id SET DEFAULT nextval('public.internal_service_inclusion_internal_service_inclusion_id_seq'::regclass);
 g   ALTER TABLE public.internal_service_inclusion ALTER COLUMN internal_service_inclusion_id DROP DEFAULT;
       public          postgres    false    234    229            �           2604    16611 (   international_call international_call_id    DEFAULT     �   ALTER TABLE ONLY public.international_call ALTER COLUMN international_call_id SET DEFAULT nextval('public.international_call_international_call_id_seq'::regclass);
 W   ALTER TABLE public.international_call ALTER COLUMN international_call_id DROP DEFAULT;
       public          postgres    false    225    227    227            �           2604    16978    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    16709 4   tariff_service_inclusion tariff_service_inclusion_id    DEFAULT     �   ALTER TABLE ONLY public.tariff_service_inclusion ALTER COLUMN tariff_service_inclusion_id SET DEFAULT nextval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq'::regclass);
 c   ALTER TABLE public.tariff_service_inclusion ALTER COLUMN tariff_service_inclusion_id DROP DEFAULT;
       public          postgres    false    236    232            i          0    16436    basic_tariff 
   TABLE DATA           �   COPY public.basic_tariff (tariff_id, gb_amount, international_call_cost_per_minute, domestic_call_cost_per_minute, basic_tariff_price, tariff_name, minutes_amount, sms_amount) FROM stdin;
    public          postgres    false    210   9�       o          0    16527 	   call_zone 
   TABLE DATA           c   COPY public.call_zone (call_zone_id, country, cost_per_minute_call_zone, region, city) FROM stdin;
    public          postgres    false    216   k�       q          0    16555    client 
   TABLE DATA           �   COPY public.client (client_id, full_name, passport_issuing_authority, passport_series_and_number, passport_issuing_date, address) FROM stdin;
    public          postgres    false    218   �       t          0    16565    contract 
   TABLE DATA           d   COPY public.contract (contract_id, client_id, date_of_conclusion, date_of_cancellation) FROM stdin;
    public          postgres    false    221   h�       w          0    16595    domestic_call 
   TABLE DATA              COPY public.domestic_call (domestic_callee_number, phone_number, call_start_time, call_end_time, domestic_call_id) FROM stdin;
    public          postgres    false    224   ��       m          0    16512    external_service 
   TABLE DATA           �   COPY public.external_service (external_service_id, external_service_price, external_service_description, external_service_periodicity) FROM stdin;
    public          postgres    false    214   �       ~          0    16642    external_service_inclusion 
   TABLE DATA           �   COPY public.external_service_inclusion (external_service_id, phone_number, external_service_date_of_connection, external_service_date_of_disconnection, external_service_inclusion_id) FROM stdin;
    public          postgres    false    231   0      k          0    16492    internal_service 
   TABLE DATA           �   COPY public.internal_service (internal_service_id, internal_service_price, internal_service_description, internal_service_periodicity) FROM stdin;
    public          postgres    false    212   c      |          0    16622    internal_service_inclusion 
   TABLE DATA           �   COPY public.internal_service_inclusion (internal_service_id, phone_number, date_of_connection, date_of_disconnection, internal_service_inclusion_id) FROM stdin;
    public          postgres    false    229   �*      z          0    16608    international_call 
   TABLE DATA           �   COPY public.international_call (international_call_id, phone_number, international_call_start_time, international_call_end_time, call_zone_id, international_callee_number) FROM stdin;
    public          postgres    false    227   �0      �          0    16975    payment 
   TABLE DATA           i   COPY public.payment (payment_id, payment_status, phone_number, payment_date, payment_amount) FROM stdin;
    public          postgres    false    238   �4      v          0    16578    phone_on_tariff 
   TABLE DATA           �   COPY public.phone_on_tariff (phone_on_tariff_number, tariff_id, activation_date, deletion_date, current_balance, contract_id) FROM stdin;
    public          postgres    false    223   :                0    16660    tariff_service_inclusion 
   TABLE DATA           �   COPY public.tariff_service_inclusion (tariff_id, tariff_service_date_of_connection, tariff_service_date_of_disconnection, tariff_service_inclusion_id, internal_service_id) FROM stdin;
    public          postgres    false    232   cJ      �           0    0    basic_tariff_tariff_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.basic_tariff_tariff_id_seq', 1, false);
          public          postgres    false    209            �           0    0    call_zone_call_zone_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.call_zone_call_zone_id_seq', 1, false);
          public          postgres    false    215            �           0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    217            �           0    0    contract_client_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.contract_client_id_seq', 1, false);
          public          postgres    false    220            �           0    0    contract_contract_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.contract_contract_id_seq', 1, false);
          public          postgres    false    219            �           0    0 "   domestic_call_domestic_call_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.domestic_call_domestic_call_id_seq', 1, false);
          public          postgres    false    235            �           0    0 (   external_service_external_service_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.external_service_external_service_id_seq', 1, false);
          public          postgres    false    213            �           0    0 2   external_service_inclusion_external_service_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.external_service_inclusion_external_service_id_seq', 1, false);
          public          postgres    false    230            �           0    0 <   external_service_inclusion_external_service_inclusion_id_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.external_service_inclusion_external_service_inclusion_id_seq', 1, false);
          public          postgres    false    233            �           0    0 2   internal_service_inclusion_internal_service_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_id_seq', 1, false);
          public          postgres    false    228            �           0    0 <   internal_service_inclusion_internal_service_inclusion_id_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.internal_service_inclusion_internal_service_inclusion_id_seq', 1, false);
          public          postgres    false    234            �           0    0 (   internal_service_internal_service_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.internal_service_internal_service_id_seq', 1, false);
          public          postgres    false    211            �           0    0 #   international_call_call_zone_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.international_call_call_zone_id_seq', 1, false);
          public          postgres    false    226            �           0    0 ,   international_call_international_call_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.international_call_international_call_id_seq', 1, false);
          public          postgres    false    225            �           0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);
          public          postgres    false    237            �           0    0    phone_on_tariff_contract_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.phone_on_tariff_contract_id_seq', 1, false);
          public          postgres    false    222            �           0    0 8   tariff_service_inclusion_tariff_service_inclusion_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.tariff_service_inclusion_tariff_service_inclusion_id_seq', 1, false);
          public          postgres    false    236            �           2606    16534    call_zone call_zone_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.call_zone
    ADD CONSTRAINT call_zone_pkey PRIMARY KEY (call_zone_id);
 B   ALTER TABLE ONLY public.call_zone DROP CONSTRAINT call_zone_pkey;
       public            postgres    false    216            �           2606    16560    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    218            �           2606    16571    contract contract_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (contract_id);
 @   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_pkey;
       public            postgres    false    221            �           2606    16872 %   domestic_call domestic_call_id_unique 
   CONSTRAINT     l   ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_id_unique UNIQUE (domestic_call_id);
 O   ALTER TABLE ONLY public.domestic_call DROP CONSTRAINT domestic_call_id_unique;
       public            postgres    false    224            �           2606    16707     domestic_call domestic_call_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT domestic_call_pkey PRIMARY KEY (domestic_call_id);
 J   ALTER TABLE ONLY public.domestic_call DROP CONSTRAINT domestic_call_pkey;
       public            postgres    false    224            �           2606    16691 :   external_service_inclusion external_service_inclusion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_inclusion_pkey PRIMARY KEY (external_service_inclusion_id);
 d   ALTER TABLE ONLY public.external_service_inclusion DROP CONSTRAINT external_service_inclusion_pkey;
       public            postgres    false    231            �           2606    16520 &   external_service external_service_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.external_service
    ADD CONSTRAINT external_service_pkey PRIMARY KEY (external_service_id);
 P   ALTER TABLE ONLY public.external_service DROP CONSTRAINT external_service_pkey;
       public            postgres    false    214            �           2606    16699 :   internal_service_inclusion internal_service_inclusion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_inclusion_pkey PRIMARY KEY (internal_service_inclusion_id);
 d   ALTER TABLE ONLY public.internal_service_inclusion DROP CONSTRAINT internal_service_inclusion_pkey;
       public            postgres    false    229            �           2606    16500 &   internal_service internal_service_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.internal_service
    ADD CONSTRAINT internal_service_pkey PRIMARY KEY (internal_service_id);
 P   ALTER TABLE ONLY public.internal_service DROP CONSTRAINT internal_service_pkey;
       public            postgres    false    212            �           2606    16614 *   international_call international_call_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_pkey PRIMARY KEY (international_call_id);
 T   ALTER TABLE ONLY public.international_call DROP CONSTRAINT international_call_pkey;
       public            postgres    false    227            �           2606    16750 (   client passport_series_and_number_unique 
   CONSTRAINT     y   ALTER TABLE ONLY public.client
    ADD CONSTRAINT passport_series_and_number_unique UNIQUE (passport_series_and_number);
 R   ALTER TABLE ONLY public.client DROP CONSTRAINT passport_series_and_number_unique;
       public            postgres    false    218            �           2606    16980    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    238            �           2606    16784 $   phone_on_tariff phone_on_tariff_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_pkey PRIMARY KEY (phone_on_tariff_number);
 N   ALTER TABLE ONLY public.phone_on_tariff DROP CONSTRAINT phone_on_tariff_pkey;
       public            postgres    false    223            �           2606    16444    basic_tariff tariff_id_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.basic_tariff
    ADD CONSTRAINT tariff_id_pkey PRIMARY KEY (tariff_id);
 E   ALTER TABLE ONLY public.basic_tariff DROP CONSTRAINT tariff_id_pkey;
       public            postgres    false    210            �           2606    16715 6   tariff_service_inclusion tariff_service_inclusion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_service_inclusion_pkey PRIMARY KEY (tariff_service_inclusion_id);
 `   ALTER TABLE ONLY public.tariff_service_inclusion DROP CONSTRAINT tariff_service_inclusion_pkey;
       public            postgres    false    232            �           2606    16615 $   international_call call_zone_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT call_zone_id_fkey FOREIGN KEY (call_zone_id) REFERENCES public.call_zone(call_zone_id);
 N   ALTER TABLE ONLY public.international_call DROP CONSTRAINT call_zone_id_fkey;
       public          postgres    false    227    216    3257            �           2606    16572    contract client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 A   ALTER TABLE ONLY public.contract DROP CONSTRAINT client_id_fkey;
       public          postgres    false    221    3259    218            �           2606    16649 3   external_service_inclusion external_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT external_service_id_fkey FOREIGN KEY (external_service_id) REFERENCES public.external_service(external_service_id);
 ]   ALTER TABLE ONLY public.external_service_inclusion DROP CONSTRAINT external_service_id_fkey;
       public          postgres    false    214    3255    231            �           2606    16634 3   internal_service_inclusion internal_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT internal_service_id_fkey FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id);
 ]   ALTER TABLE ONLY public.internal_service_inclusion DROP CONSTRAINT internal_service_id_fkey;
       public          postgres    false    3253    229    212            �           2606    17018 7   international_call international_call_phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.international_call
    ADD CONSTRAINT international_call_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number) NOT VALID;
 a   ALTER TABLE ONLY public.international_call DROP CONSTRAINT international_call_phone_number_fkey;
       public          postgres    false    3265    227    223            �           2606    16981 !   payment payment_phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 K   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_phone_number_fkey;
       public          postgres    false    223    3265    238            �           2606    16795    domestic_call phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.domestic_call
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 I   ALTER TABLE ONLY public.domestic_call DROP CONSTRAINT phone_number_fkey;
       public          postgres    false    224    3265    223            �           2606    16986 ,   internal_service_inclusion phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.internal_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 V   ALTER TABLE ONLY public.internal_service_inclusion DROP CONSTRAINT phone_number_fkey;
       public          postgres    false    223    3265    229            �           2606    16996 ,   external_service_inclusion phone_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.external_service_inclusion
    ADD CONSTRAINT phone_number_fkey FOREIGN KEY (phone_number) REFERENCES public.phone_on_tariff(phone_on_tariff_number);
 V   ALTER TABLE ONLY public.external_service_inclusion DROP CONSTRAINT phone_number_fkey;
       public          postgres    false    3265    231    223            �           2606    17013 0   phone_on_tariff phone_on_tariff_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT phone_on_tariff_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contract(contract_id) NOT VALID;
 Z   ALTER TABLE ONLY public.phone_on_tariff DROP CONSTRAINT phone_on_tariff_contract_id_fkey;
       public          postgres    false    3263    223    221            �           2606    17006 #   tariff_service_inclusion service_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT service_id FOREIGN KEY (internal_service_id) REFERENCES public.internal_service(internal_service_id) NOT VALID;
 M   ALTER TABLE ONLY public.tariff_service_inclusion DROP CONSTRAINT service_id;
       public          postgres    false    232    3253    212            �           2606    16584    phone_on_tariff tariff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phone_on_tariff
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id);
 H   ALTER TABLE ONLY public.phone_on_tariff DROP CONSTRAINT tariff_id_fkey;
       public          postgres    false    210    223    3251            �           2606    16716 '   tariff_service_inclusion tariff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tariff_service_inclusion
    ADD CONSTRAINT tariff_id_fkey FOREIGN KEY (tariff_id) REFERENCES public.basic_tariff(tariff_id) ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;
 Q   ALTER TABLE ONLY public.tariff_service_inclusion DROP CONSTRAINT tariff_id_fkey;
       public          postgres    false    232    210    3251            i   "  x�%T�n9=��_0����v`J10�̅�8V�m2`�Nz�~^)�6@���ʒ����B!O7u����v��r�(�\�rd�Ƞ#����]����'�&K��b�'�x�b����K}�O����F>dNTJtNa��,yƂ�Y�	[��67}�D��L�l�*R�i�u[���<��2~��Էm]�e�������(D�4�L7�r}׷s��K��0�U&o)0�$G�q��~�m�L�mR|�a��al�����<	k�	��*�O!X}n�4+���6�f���.
�Y�x�'�:��#��9rJge-1�a��|7z_�~���F���ĶD��h�[����Tq�8�K��B4�8r

�X5 �@E_�~�����s�:@=��x%W�=��̙>�9�U߬�7�R1G٘���@�p��z:/sm��^�W�����y�B��>y�]?���
IS`�@��5C�"�b���EH��vJ��q�@�s:�}��U�#T�@V���Y��Y'O$J���M?��|6 =c8*g�4��9�zK�>T#�T@��r� #q�S{����6g%P���c�d��X�<�����h�����:_h� �#f�u.�Y�����q8%A
o��X��PP��_{G��X�a���"m��'��������e،���e�Y�7c]��` ���kN�e��*�a'h���U?��C�w�ȟ�E�DSpI$(�ߡ!���̏u�Z�!{���:����%*���W���oƠ{F�'�Q�C}k۟Σ��vp����R���f      o   �  x���Mo�0��ԯ�i�u�sL�5��tŒ�����
$9���G�C���l��ˇ�T�����X�w�D��H�]�(u���epr
1������!�up��;L���!<��Q��Y�5q�[��)�/���;�VgM������a�"�N�w�2E3��Ҋ����?�Ůژ�1݃�.�hL`M��A�GJg�����[��KN	�눅g����+�.�@]��E��:b���fg���v0�7n�b?�Ug�x���v�����{Q�.�p���
�6&X�gM��3�H����.FYvA���=�mD9x�gSa�b��Ci�7�Di<֔<�W�)9�d�|�T[�ɔ�%D��;ci^��>�^V��e�1�b��s��U��=���1� F���      q      x�][�r�8�|&���x��؎��N\�79{*/�I\S���(�ן�({O��V�����������z۪{3tm��u�5{�6�W+�[۫ެ�N]v����p��jǺ��usR�=�e�4j��Ɍu��_Vc�_E�Wq��U$Q�����QTEU��;�?�δ���l�aT�M��7���{�4��$�����^�0�h�!��խ��S7��m6jS;�����5����ձǁ/�*K�4γ��**����(b�+u���`x��mǟ�C׏�ʚ����EeEQ$a��9�u+�>M�M��X��k��6�a�_Vx��3�.�����q�Z�4�IM��y�DWI�G8O����I��VxTD@=Ը����U�7S?�S��*�%�a��j��}<��6�B`U���)V�~��8�~�i6M��j�Ή �>tUqUU�ϯ��1�����\=����/����g���˩��ީ�o*��0��/��G�Y�L���C��t�^�V�fS�j�\�����o�k%YL������,�J
�)���\1B�,S������z���h:�~���Y�f��C�~�4�t�s��0-oL�On�i�j{�'�v�]5��n��	�t�#2W�9t{���}�4K$w�7��� O5��k=R﷿�2Nq�U��ı~%�$ȫ*ϑZ~�C�u/��W��N]��kN8��BUE��P��)�~t�:��m��sDcwP2X-Q��'�;Xs�>!�p2��
9�vA��^�P�#j���(�$G�Yy	�>�AQV�aj�Nxç	٩�,��.&�C� M������\a hH\uoO�m7��<�qg�/�|��a�gY�肹������.U�����Vq��U��ojq�4r�����[��v�p-�ĺ��k��И�� ���Ԉɾç����V�M`�p��xB��i�[ �43��2��UL����T�	�h��eX��R�N�j��$[ KW���(�(���5/�CY�M�5v3�'#�	13���m�O��Z��j����^ �n�ӮS�b���,+�"/D^�����D����A4u���ܝV�|Pj^��8���H�?(֦��lo�y�P�$q�W��Ѱ��z�q�McW��{㉶��c?��:M��ԑ�5�b�je�����%p�mk$�G��q��q|2�=�OH���<
���l6�$���U+�:]��2�?�����^M�)`Y^����h����vbF8fu���LD���]�s%'�'�`;���ʪ$+�8���X����[�(��i�?�"W.!�?�T��w�v�u��+�Ľ�����t����_0�%�vL�*��R}[���Ėű��p���*.��a��$K�d�l�����p�Ǳ���I�8���*�^	�^Y�b���d-���D}�⪞F�u P�3R]Α�Ģ0΃+�`���p�
��eHе���-��s ��C="` �5������C�ƶ���2�{��}�u�YR �b3+�G8d�H��b�]c������,�t����}8�(�y���u�����yH�ֽ��F��9��V$|�"$�s��;�Fգm�H���1��ֿPY�EIE�ƁuL$āsL�z���μX�ܵ8��KUFE���rB\ bXW5h�g���������3�-o�4{� re�F�(8ǦJ!@ +-�,�Vj�{W,F�M A@�8��;�C]�����}0ɖ\j�l�GI���A��ٚ҇q�����Cd���c�O��nꑰ��z�*�YR�ı�"4pP����w��pUf3�B
��ꅨ�K���4NuW�+`?t�U���G="�j����p� `H* ���:���L���S���1'��
���"���J� W�H90pG�vQ�P�����N���[�:�Or|�ֈ$��L�Z�'8�t��}B���ĝ��+E�<DlH>R!(�8��J����Q�=}���W�����B�8�}����PL��O�m��TyS�0iW+{�����_/�D���8 �ċKʣ8.�R��MJ4q>í����#��2����
!����3x�"����.��q@SE�E6��ug�B�$0f"�j�)��$N�u�v�@R̓I�b��#��{������ɓ0Iq)��S��(�� f�v�IX��~��_�E��������3'2��;y���	&Wy�ȕ�,\�P:O ��V	lx�VTT�S3쐪�wL!��k���j�Y���5�aB���	�2�c�,�a���+���},SGW7�n�����M"���9+	�q��L�@g��p�����=��b�~ȵ7�n!����s�i?���3��_5z:~0��ȴ;-yDt�K�y`�fb!������O�H�:���gu��i�kV��o0����`��>���a�*D8�w�Ɓ�زZ>Y����@^�+y W�S]�Jt�p�_)�����YA���,4��.�*�hX��x�aN��~��?�����ߍ i�AuP[��N�v��7ɂ�zXM���a��֓^o��YoW]8��`��bp��s��F��׸t>E*jRVr�L 2+O�4���O ��/)�8�^<�4+*��X��R@q?*���H#��E2�\��;A`���׿����l�LY4�%��D��#!�8@�c����q�I(ٟ��������U��7Y�Pw;��k�r�?H�Q�$�ρ��:�E{�s05y�@\�����r $VP^��o�LiZF�g*�(=�Le'y�*#"�T<{Th����"�7Ʒi��������u�c6x���һ��U�hAl lIP)�qs�7n��Y�k���	��
�䵿�T;�����=Xi�ˎR�͈�Z+��h�<I�U[�R9K!�SA�����~r��*L��$��N�z����O� ��t&���i�n�0���R�P�໖x\Fq�i�d��b���fg�d0`���������C��%{P�fK���X;���aI�X�Iw�cO��9�Z�݅z�Q]��7��+�G�yh�,{5NR 3�*ދM�$�L���$-qO�?ν��6�0��DU�*d��>:q�e����i�2��F�V$0H!�
\��~Dd �i��솢�u�	H����ZǷq�0̓Űao�.x�1������+�T]���ꆶ"��8́���D�Q0#�JP�)��&8�NuA��P���*`���[��]B�"�N]]+]��t�w�`��JO��W�R��X���^(dS��[��ںg��P�Q�WY$F�c��2]�#+=rC�����Jey!�4�:���*'�(�~��Z���Y�͈eG�jH�����n�A�s73�R��)J�T @o���QZ��R���,��U��E������t�V�RQA��� J�\s
��v��B@����`\�l�)|c��д��I�J�f���	 n�H8sB/�<�ţ*t^�8h��qM'� ��}��,�.e6����i��
97��/�W ����\��[�<p�P�}�Lp-C1'([@�a'�Ѽf+}��9�]��W*�e���g�%�nZ��+%Ä��4Nϟ�>v�~5�N�9���%۲h�D(Q$/N
!!�?���!���?����Ĭ��XX�3JzCO�5${��}[ �{�P� �w�Z�x���v����]�[�H<����i�8�J)��g1)˫H}�T���<�P�J���#�����1�r	|�B[�!���G�X葽X�����p�(����2Kt���H�#�����R��7�/� |?w�n2��Ei��a������c ��M��$��@�V�.�!����3��p�5����֖5 ��`�4'��$�U=F����x��B�(��$p�,�̲@{�� ��L�s�}͓4Y�pHO8��k��<�Y��g�(�3
p�hr�J穳ceB�kLb�i���(Z΅����}mZ�����Y�Px��_2W
�&^,qD��^$Z�j��7b;    g�{���p���ǁ�=.���D�{l ��@�!4��Oe,�,d ]a<=}t��h�W\ʬ杺�S1�aV�G�?vK�
4�{.��Έ���b7�947���!�
N�"�=SI��W�z�sZ�i�&4Ι�G�Z��i����g]��y0�SE��I���Y�n����JlP�f��s���Jb���?�e�L�u%%�Tܘ��Y-5Œ������ �������d?�L��P:e�d���������o�IH��A����v�*���Q�����%���zU:�@O��%��l�XA=�'w���so�y�	���H("�:�m����1���[;�#��о��Y�Oh�<`�'����0G�L�4�8��X��l�$:U7���;uG��H3de��2~b�����ݠ��8���(�X#'��p	D�jd�y�l�9ʙ��<:��E!�0��
��)zo?Ȉ���;	���~�bh�*��ᅧ���.���H��ܰ@Q�����;��O�P7��1�M1(<�4�hh�(J+dyjD�B�|�:0�n�R �\�y|A@�O �֠auJ��Jsm��	2/A7�!lM�f�->���7�8Z?O�:����Ă+�ͤπj�"�|��{�����{4'�`�ռ�qX�s+�pQ"��ΕyĲ��P���S7��"�r4[2K*�#e�đN������^{�L��|j<w�5з�O��B<��R��n�肳K�,o�#@��mg9�{���8�1�Nx9�O�E�H�I�̊��9b׿�N���1�Q����(�s��mK�,#r�f�`l��舂��^�<�vW5{{��#`u�1�L;e���2!B$��I���9OY�U�y�ř�!���z~��w��{Id�� �Wit/���U�l�k]A���;�7�D��E1�O�,��J�
a��=�(�����x~M�A�8�Fv�6���nU��D��|d�}�>��8)r Vp�I�MKR�K��Q�d��{0qN�ڻM�:�SƮ��fd+���G�R"ֻ�7��u�42���8k]��ZuP.[�s2� �Z���*��#��M'FΚ�I�pdSp:�ɳ�ә�}3�*�_�TQ��9M��aG���%�|�uM�Jr˰�A��Ƞ�U&���@��+�e,��Ί�k$�YWI��#`�g�z���|���2}�ZD,�}�9�sN�=�L�wU� L�D�u���yA�</�	R�4.bQl:�^U�D��a�̫� �Թ_�\ ��4�8�bhp�,���N>��޳���s������,F�dD�-�%*2v@M�u(�>����9�/Д%�Yl)��y��{��VfGy��E���3Xug��� \NX��s��;/F��.,}�Xh\8i ���y>�m�rN�{̓�7*��_���8�.�s͖�B�l<qsa�9�>��n�z�2,����vk�ǺE�ᑘl��@~����	����<\�i�Mwn{�<�{��O�2��3��W��GY�����>�x�`z\�}�G��IeDsXd�9:3D�G�5/�HS�(OL ǐ���b��,�K�,�@��M�
������ϫ7�;���+�,ʢ�8{JJ���Ԙ�"+�ST�촆�nN�a�+}�U��� ��G25� +V6X���v��������
��p��j��d�u�FV��\F&ʀK��n꼴'�nKr�s	�HBJ�J�xA����DeQҦ�:���[��g�����g�h:������Yp�#�¤r&�y �����:,&β�u�Iެ�nVTU(E��p�B����^d��(\9'�� pCp��>e���e���ߍ��	iK+ToN�v����D�%En$x;Y���,�F���䉐s	�����+�w�daL������Pi\!�׳���k��d
G�B7��������[U��rB�:�Ol���\�o4#��u��B%Q�e!~���zo�|��~fG������4>�k�}!4n ���w���x�\���2�f�M2 L!{��A��9fF����8�S_�T�BL�:F&q���<;�]�u�����F���Rse�C�X{<g���-���Ү���nʛ����+Q��j� hЭ�3�q��#-����\��bZ׈��11+��gH'�>?%�?��1�8�Δ�0f�y�	U����&U�(D�^�אa��&��|3�q�"��bO�̎ꞛw�m8����׋yy�3E���Vu�cta��~#���>����QJ�,W�s����l4n�׬��[��y���#�De�)�2�k~)ui�"�i�eiUTn[&�e]1��g�A���.����L%+Ѭ�h��m���~�2eR =X���$K3�^�G�Bp��_,&�싮��찖p�^U�@~wF,e]�E��L��l^x?M<
A}4�9R�|)ϫ�6�,I��q�ݾp4;8ǖpj?]��Wp��u+ܽFt��^rV�fO,u����l`X�ov��@�E1��Zϻ=ߖ�:���Ї-�JVy�y:�!��بBS����S�eEH���-w$"�!t׎o��@���܏xS���%�E���Y����R9?�"��L=�u�n{C�ɩdW��3~�C�RC�SoI�RQ��&1Ve��_�����;ԕw�,�g���f���y���y&� E :J�E�z�jRY�O�Dy�٭ϋ�I��㺋���0sٟ�>|����%Ի�H�L��!�LW$�F�p�r��;&���`r9�حr&).�����l�h�4)��p�~��?o�屳ٯ{�����*c�_S�N�.x�c�H7���!�Z�q$ʮYs󠕖I�ޟ����,�4-K�d������~���݄\�h$�������x��3{@[�q����&�#FG����b�fm�ͅ�G��ᚒ���5�}�YQ�ȴ<��r.�F&(�iy}�eJ�}�-T�s@n�w����[.��4/���{��� �-Y�6܏�_����(n�S���gYDtxK
��ٮ�۽Ǒ���8g:�9�iՍ�[��D�fQ�M�
�^w�eqgr;/���7��SPŤ����7f�n�8�hi��	�D �(��'�?@����ݠ�yR��-|޳造
��5���&���+t��t�k��u;����[i�v�#�nu��')$����h2�RF����3O���JW��,�Wp��mpC���R�g����|_r/s0+��9�3S�3 N��
řy�L�y�� U������v���g^�=��t����e���'���!S������q���]u��FF�ҳ��c?/F��0�@���++��~Dss,I#�&�"�"+A30� ��5�ڸ%@#��
�RD
u�� ��7o�6��%�4A����$ɚ?��D���rޕ�f���*��dZ{�� �� Ct����UJUBǙ������zYw��a�o���^�;+.��]���O�r'�e�~6hӬbǵ����F�I<��ɢ���M�9)�8��K 7o9R�"oE!$�tn;����[uۖ�G%>)�=Y�CN�p_&����*�f�7�+���_ L��s�s�����""QX�o�����*z(f��w��=�Yl�^�,�*px�V:���9�vݨ�z��Yr��(�u� )�p�1��C]q�����y��ni����R�$�?���xX�[��<Ƭ	�ݚQ�vï��m^q�� Ѥ>}#,�@R��Y�C=�4��@0{yƝ��7��ܿ^��0N~'MZ��tr��\��[�'e��Vc��)�@������dE�ݼό�;;<`ֈ�>!2���;���4�n�ĭ%�[o>���٤=�H)c1�W.�ʄ��}��}����)k����r62�3����s�eX��U�o�>Q�\��2�'pq,Z<���-\��/��*G~#N��v~�%�����eҟ�ǎ֧k��U�##�¶�g�Rc��+��BwF:���	ᆻ���9�[��y�3�i[\���K��&HM�D]�v���q]�K�o�94�q�t��*tܶ�7'I��J�hV_@3Q�W& 0  {V�2���#��c#�1"�v .���.
t�n�N�i�`�O2�4��0��0w�.����|�R:)�D<��~��w�r����O����	_W�t��G�T��94��_�C�&��gF-�.6��? ��H���yr���/0@!����(/>ԟ���a��K�/e�/���6Gn	]r���G&���K~�.N��Nh���X}�C9᾽�y�O�d�:�qGQp�"������!�şq�I	�R����E����Z�2u2w��E0�BU���M{D+R]e(�����3t
N��d��e��"���o�      t   4  x�]XY�D'����f�.��9"[6��j>���Ȳ���S-�|�}��Q�W�WO�I�K��~__���9�;v��|��I�j�iV?�ٲ��g䑖_��&<O�=ϴ���p�����V�S�懍�Z~X%o;������+�.�\��jO�YJj ��*;�6�k�N����qۑ#KM{������������LU-���,=������X@d�>=h�`D'.�n ���S���m��jxח��S�<k�37���C�����	��gd�uک�/��(�J��P_�[F$�:��p��ж�ke�G�D�a{�u�]v:�7R��ʐ�b��)��p�
�4,����� ��OG�/�;�O�q�u�^bJ�4�:�KŒ@4��5)��E�,�j�y�o��C��1AH��E<-\�D�tF̽k��F[�8s熨L�e{��sݷ|9=*���m��i'�d���P;xMκ�Yg����lQ�M�Xx����ձ�{��� �QC��2@>l֌x�v� �[KC���8�G�e�QCZ��E�y4�}��ݧ�t��m��&p��~Hp�����4�=Ԑ3�p�N�Ð��#�r�g�(��d�"�q9�{i��
����m�K��cm�f�a��@5[fj>��v�iP(�O�S{Q� TF� ȝn�!p�Լ��C-橜<���k2~u�S��K�Fq�^��6�+�捋ؚ���!��A���C�2=,j �4o���aȘ���H���\�E��wݱ4�����b�Ù�B���(��U�?��{�U�Vd�}��*�.R.]7ĀS�R���k�CI	p�}rD�Ih��Z[+�}\Y�%��މ�k���#�	�vmCY��2�k�<8^�ø%�b�u�d�Ɗc��q�-D��i{׍�+��)��r�5�ݼ��LG�=���S�,h��ͺ�7ȏ��5zg��W(��j �|Xi���p^^Ey��Rߚ���J��6j��h�!�;��t/�0KƉ�a�iC΀O}H�^�'�����d8�p=�}Ip9���S+�tA�gz_4�'M=�\��ϞB �(����ݴ��p���W�8SJqI�n��?pB��P�V��X��0��4�al d�`�����WZ��wS���vDQ��ɘ,�`�;�`~��q�~X� ������QP��Zү*P�C<EzϺ���Ar>)��(��l�n�2~Xt!#�?<O������*E�{��gS,�2C`�%'�q�h�|��A7�K�����{|�8�X�Fbr�b֓o�A�UhO�1z���&(��W�䆻2{����G�W�I�� �i�ߏ6k`T�������D���n��]#��Ttd��L�7�K,��BW��l�N��B=�Gc�z@O1���#dP��z�TI�.��<�i��,���v]���@&����T\n�*�9���+��V �{��d��f;�8r�ӟW�ĝ.|,�c�[k�Ǖb��I�h��(�IA:�8��V��H�z�9�_�]D�E�=t�꩝���;E0@���1A3�5
L��(�A�N5p�G�]���n��n��B�4Wk����X>Ͳ4�P&0H�5Da������6d;ѿ���xJ�Iu<\����X��@����R}|�Vb��<��!���KS�ܽ-^~��n�o0����A17�1��j�7V���c��g^i�MLkZ�@�1�l�b�;�5c#9m��D��SLJ$�#����]}��д{5u"�|'��Gg�Ο.�p�X����,,�󀂠��k�Ɂ��� �{u���f��F<ݬ�9�����Q,�+oCo*�I{�aՋQ��a3xx����鱋�o��Q$B�}�"��Q�AT ]|h*7@Bيt[�ƶ���D�-�$6i�������'�_�_��ņ',vVѸM�E+��3��W��'
�qb��남|��#�+:=v�tǉ1���8��d�K�e	��~�Hb
l�����d"'�K��l/(�,6�W*~
e��;�r�W�x�"F��!�\�ТLV��IM_�?Pȉ׋u߳�=���^���B���X�>T����b����V��?9�� =ω      w      x�m[mr,7������D�{β�?� �v�7��R?�D� @�kvo�[-�Zu�R�*�]^���]��O�O5~6�Ϳ}~�T��zٿ��e�=Vh�M{w��,�_��>^��l9V-Z��j�Yw+{XeT�^��K�.����c\���}��3�*�`k����5kY��=p���������i�a|[��ի�[�gk������H���m:�����i����S�����3����k���թ=����`����������u�0|�ݖ#���;n�ڸc|_�:>�}9>3\Ǘ��٧�k"} ��5�
�ﶻ����+�V蟮��
�M��>u_qu�ėFr���Eps8��7@"O������q��ns�2�ZX`�>F�t�)��0񕉲��D$�w���?�N�b"����ۭc�b	���>�g �6Q	�n��n��O5��Ձ󕷏s����O�?��]8qf��^e�jD(̱��H����"p
O��&�����`m[)���;TF·2�ǍZ�gf��2 s{�l KԎ��X)�< T��׌�U��u��eDfeF�Y��^�m!���g8m�7�Ș�qc8��DN�6K�Xb0����T] 2��&]�x�R��0�2+6���:A4�%*Cg���*�m�'�.ژap" �(}��h��MT,a	o�^�Tu�	�����p��5Ft"�:/ՄN,��LӶ�n���Y�y��N\�"�ۊ��>C��X:� ��jo���(���G��-d�.��'in#�M���Q$M��A��� a5얬)Tc\�w�����M���#��]�zB�!o�Ύ[p ĺ*j(g��ttǦu��YWI:���t����8eh-c���B�.�"�^���A�_�w��.��Fڗ-l!va��@,6�r��zYȲ1����SK��bL3'p��Lu�s�:�}�r: ћ�<d�|C�������#��:A������*(g��0���}��Й�od^��ą�Ձ�wi:�b�$ܪ���.*�s��&��j��7P��ͺgZ"�ԛ�E3����{���W����$vWvr'�_Tr'��v��Ր��H�ښ.u�Ǒ#5 �p��P��U�Nl{�	E8;���Z�@����nD�D��d�U���a!^�p��� �,S�-��M1��)�,����Fȑ�z��<7[��p�TY�K�f�U����Jۋ��RQ��]�#���w-\U�@�\�W@�]SGR-0 Qg�p�! ��\u� ��!�:MU�Ft�Ռ9¤a)j@'�$""	t:�
.=�S�0�K��$����1��ԀNk�2�����.�#:)MC㰲3u���L�&�����R��╄E`3�EX�`��i������������i�5�]��2��F�o���yo�)'�+o����f����u^j���x#k6$��(Tl�����!�T'�5�����	�Q!pt�I/T�_�j���">�.�}W:[��{ur'h����Cxf%AzQ8�>�_7����8�|@��ee*�E0w���4���[��tBl#�n����I�]�ʸ��,ګ�;	�[�}#�Q��N�O���:2�n�����I���Nq�X��:��I1��0Y�H�قRjs�G<1S��݁Ή�G3ן4+�T�Q�P�,7�tbۣ��(�p�g�Ǻ����c?�NJ�脨��4�:$���f�������K��n�૆jy�[���;��Z]婓;;йɖ���O��3z���M�m:�tB�l�TΣ�MA���m�8p���u����@'`���$�w�#�T��z�0�%�|�����/�o�E`F�s���t��l��ȃW��� ,�8�����S_��k���tE�ԏl_R|���fXb���̋^i0`���A�	��9x��]���2�����uP[]�5|���
x�njv�VyS�e�G��ktB�C���i�+�q��#%��Ъ��(O`�t��ݬI(�pC���s�(���?�oi�5u�;�����Y�! ����I�!�y_t��¼ԝc���?J��R|��/�0[&�s�~г ����f�.t:�Y�X�}�&�I@�?��n$�gSJ�\bd|�d��iJv�x��s%�B�R��\�������EF~�����Ҙcɋ">�TH|���_p�P�/WTj�Z�=Oony����ItB�A,�]��.ZA��<�	g��"��XtrV����5�e%6��E9����N�r���XtW��4�Bo�V0�V�A�Я9YG`�*[)/tZ��Iّ�ᖣ��K��RAT�Y�/�g����K	�*����5YٛZ(��)�a�;�N+2���M&c���*l�`|�,?5�Cɓ���#��0��:`�(PX�W ��شѳ[~�4c��@�p��n��ۑ�U�2�\���kA(�]|��Y�ТT�
-m��e��p��V%�&U�4^j�f ��a�*�rE�SU[ħlM���i���R�]i�k~�wI�Wu��¬��ţ)%�$�
��;#k�x�8���NY@��Â�<J�S���Xn��X��¼Ylwn?�2��Y����Q�qf�k����&���34���&ɑr��R��@�����������[T9����%�ɚ!�s};ĕm�����K.���,�6��C�-�~��m�p��lc����dxx͝��(�,��q˴4�9�+���֑���_�~���S-<{89DPӦ�,:��5��J�̂V3-�@���t��P8�{�3��g�q�$g�������� �ɇwj���:�M�	hM��	P(�W��}��y���h��ȵtB�"�G��P� 2~(':���/�! �M�N���Tsg;5ch~p�z��T����e0�}��Ɩy�������-�l������)�����W�ߩ5�/�L4��
��kf>ޙ�&���tA�H�Y��s��,����R876ҏ'�c���m�0�
)J�d�5�����̪����� ;@��㶳'�¬�|!F���/�� ^���v!�TE�'�d|&F�3���%��94qzt��;#�k4���M�`��BPQY�O��lV��{����	��$w�!S�������ygco�d�"2�AEm�F�zVW?,jt!�ud���F�ia!�&4�`�?: ѣd7dj�S��d8���f���F�<�w��n%�x���G�J�k ���6٭�lf�,)6,;̍cd�
e�b��=�͗���\��O�� RȪ�h��)��-�]��U�W�}���|�(a��#h�1h.-T�5'�H�ܥ)���+��NXnĕB
�@������h���)�g+�Y$�Ƥ\h�s�I��ٳb�>c�9����5��a�q���%U"�\��LLZ��PZ��#�QĿ�Z�lvY���-������^��E~�/� iR��=69!ݼ��fbz�����=+'rH���i�pN�蹁�/���{{DntA����
���]��ݮ�ô̯{�ڲ6@�gH���_��~�T�����TI�SO�^���!R��c�,��u�_MO����k�i�>�k*���Ž`�6���U���S~+�P��B���������ܭk�udX���}\c�	�b��D�S�>]ʹ%ל\���"^b<�S����x7C۱��Un�6-���.�W�|�����t������S�1�(	6�����@�4��@=�?}��n� �,i�'jÜ��F��JêN[4�T�q>�s��8E}��<��i���85a�S�`�z(��8@����0���/�!.��W���XǍ��4��^��_�\�ۀK�P�Ȫ�霜㐃j��0o�s�\a��u���K6�0�zA��&��yDh)�&���ξ3�58QBń�_�h��L`_�{�X/"�9R��3�t��k�e7Q-���Ѥ<�XN�9Sbo t�U��7ɜ�C�vb��(aP��q�4Ph4x��Dw*���X�r�'�=` @  ��9���:�5V�s���3�2� ��J�.�����1?3䮺_�^4c/���J�tcM&���o�A��џ��iX�z�a,bj13����&scK��!��9-4�q��'��8�wwT���Ֆ|�r��u>x-�h��e GT��qj�,~��a��ٜ-A��L!���۩}�6/�i�}��4O�&2d��d�C&���<���$֍؍�'k��K��Ϻ���A��f�:�J	f�����x	��a�c�΢�ލ:��vh�p�^�k ����U�_h�m#,��ļ�&ȉ�����l���qȲ^�`=:�[y���q�����'EҧPA���M�r��.�Z�rJ����4b�H��:���`G�{�������O��)���Է�����_�:��e� >8dqԨE��|w[�_=k�k%=l�+�}KY5���?�S^�=��Ӷ�w��/]|��T]���8���h��Z�S��h%^����9g��b|�`ߘo��!89$��W��<@Hϫ��5K!>�R����,u�Z�u�1O����'M(�8G-����#�����=F>z��Q5��V������y����w�ۦ:L�[ΚP���~�݊ޖ�f�ώmU[�8l����S��[S/>��rP�1u��a�A}�&�ࢶ���B�z�V���ʏ�"���|����$v�%GK�|��Zv]���u�4ts������/s���K܋�G:���e����k�zG��������;�6�;�1��ĉSY���8�F�ۏG�ҳj���=ԋ�N.�GN|��	��z��N�;/�����ӛN�E���<{9-5�ixVN���^�ġ��� ���Q�����A���J�L^��Q���g���ۚ�&9���
��	j0[��A�]l�	������:iR���V��֧1��(��95_�����S����~�r�?�}h���5u>�Ɣ~��9��gl���S�V�j�~�7�c�-GO��^؞z�cSȳ��1��z�źϳ�E ӣ��h[9�S؝C�G⍴q�;K
e��n@������c&���'M�>]Q���	�����)CI}����m������h���?�/J/f��hK�m�g �������`w/8���3`��ȷ���6�=%hw�����z[�#;@�&0391��p����6��}��szr�7 �ۢ�c�Ń>
��R�wk܈i�`�K�����WD���,�)0�&�f8��u����S��}�-��>��P0��a���ZJ��Ԣ�糣�V�mY�8�Z�צ2}i�A���b:��*�c����a82�>|���:������5�*�[��C!���鯑E��#���G��3_�� j������<1%�|��#Z�N
�'QPQ�C�������g�ڲ�ﺘFQ�PD����v�hW/��f�|3��R��,������MC���E/��y������,z@��N��zc�稔��e�������:�Q(N�5|�� p��eK9ς�����G�#�x6�Ұ@c����{>-.+�m���1���kl��npj}��J��'�cn���ԣ�w�������?<!��      m      x�e\ْ�H�|f>`��Xw=����v�n��٘�$�$D`�(��������}�TE��qxxxr��}������cW�m}(��	�Pt���i,ʩ�C�ES�E�l�E_�C(N�3�}(��p}Qn���j��v[�a���E񴪛z<c}�ڪ8�-~[6���bqeߜ�Z�/m5_�wŦn˦9�������wŀ����}W�u�X��������m�0�k�È?�Ǯǟ�ֻ��[w*����sh�c�m�˱�ڋ�)�=�r�����|����=�m(�~��U3a#][�����E�l�-��:x�zSn&���r���,��mbU�����FoJ����1��fq{i��:v���a���z,]���|Q|��c�'����%ֻ�k�u�\������뚦;��xd-��w�����/6]��n�b]�?���������#u���Z��kh�6�xM�ׯ�qW�pP媃cU�f�igK�p������W��޶E����Xc1�4�^>��;�;��{�U�vj�<k_�3� ��k����x$���P�����b�M|�}z�+��o���b(ẻ�՝j�w'l����>=t¥���hB�G`�8ZX���c�������8�U����z�M�Ѹ���E�+a�ñl�E�V!Tű)��j�u2���ѽ�S����<��5�p'�g��)G��؟���������72z��mU2l?u���%�����<���/MfĲqԟ��b�v�&T���6���t�a���[�fxO��ᓟ�p����k���^�L_¦������#�p=5�w����C80"���px�I�
_�&X�߭���/�F����ІM=��AF�1��n�w,/����fS�p�k�E���'�ᗊ3��R[�Y�޾x�p�ǒ��,Wl�!�>�@+�X	l���mǀ;�i@�����x����L����5���0�ft�J�xI�7����R�����	�X���c�O��C�N�}�~��! &䁰�z����]y�R=Wf9뀐d.]u�kG�e`q��Kx
���l���߸�/��[��iX��3��U&^!���1�9�V㐑A��5^�gW��nU3�3k�ax<"sB�`�(¯#c��z,"UZ8ܩ���R�^�S����G������V���m�%�TЫw�Y
F���ÃR@S�`���l�GX~7��i�_5\�� �|���@RՕ?.�˺)Wx}����h��ţ�w�0�Ҋi	VG�?�\~�V!�t�Ҭwe���;ӛ�i����(�=KD@��g8�r8����Q�ު����xFf�J�˾F���<���J�Ţ����>�����\ﱿ�^�����w���,� �=U��`� H��!�U^��`�wY8էv8�(y`�k}2�H#v�:���G��#MÖk���>�����B
B��*��~΀iy���px=Ţ�A@�ᡎ�cp��ɨUmJV�?XՀn�A�&�g�(^գ
��2��� /�����d*��!4�bÇ��a�"��L�4솑n�LL�:O��p����EUu)/��zXܸ��g��öhC6|�ކ�)>����T�떾ly����4g�҉�^��s��Ń[�3�+�u�O+&"D#t��8�c)d�޵]�m֮��gد���-�^��wıH(8g��;jY=s��;_MäHP���`7��!5�p�Ay�����m��2 �p�rq���<A�ei�^K����ʃ��G���'C��cp����MF|�u�m���ɟ���`G0(`�75@	[^-1�`���Z�H��!ɌB��li)�\�����3�# �D�L�m�D����&� G������8O��x�:�����cΙ���3`#����,���焫���}���x�����5j&�V�Mt؅9a��qVӚ��[�J��xc�Z � �{�nc���byL�����X��a,���{�ψ Z�ώr�0麟�$��U' ���p��c��T��̒����S�3r�6Q����~a�Y~�X��Ы)�u��Z�T�&�����3��]9ћ" ��yi'�k��ZK������4vD��{,aկ��u�޾�mBh��b����B4GtW:d�'W���	J���V������7Mpn�pd�$���r&�p�/��]��� ;�V�G����@�̍�+�h/��Q�鳕*��B篣�W(��߳��Nt�6v����}=��)$���1֛D�2O��Wl�i���=A{�N��$��~ŇC�e�@Ƶ�Y�@'z�78Vf<�����~�p�`R�4f��X+F6X�_î�_-s	��,_��&�dp}Q�;��WH:ڌ-�ԫ�uE̅Z���\=,��_kV�}]��p�3��9f�u�4 �ØZ�ۦ	X6�I�8�dlڎly��é؟����no�7���W֣���b6�Pf����\���Wi���^��8�kbv�J����f���wG7#�c��UYsW�Mh��{4�D&������ڣ����G7[�>��*=0���jP���z�dG�k}=\?A����=o�a=a��7�VΈ��<�?f683F�	9�|�>�)I�3��#����*�.5�Q֐ΪCk�T����F1�7�h$A��Z�P�/�~�acz�^&�	��
�y!p�ڋ��]qP�̒ ]k�Z8��'��xo	��b�Cᲂ@cUW�0��\�4X�W �B&ڮ�zUng�{
b���X<�N�%�m<�Ѻ���V#Ջ�{TuI�3�X�	��]Yӹᩑhl�/ �S�2� �EkKes�v�S�f�NP�kB�5iՑb�H�A̷~6e3t3�p���.�q�6��1Y?ڹwg��m���Duh�!C�	�Y)M^�t?�D��Q��3�k)�z�S#-3�_+��^j�t�s/�_@i;&��ƈ5I�����@C��sr��]<xn�@�y�m�=	���m�E�D#�#Y�����	�{z���X�7E���8�v�_z�v��v��ro}����/+�쌕j7ܺ\���J%͊���ښܸ6ԗ�S�dll�lRDQ�!��As��뉊$����[��{ô�i��yp��Q�I&�$b�B�^���b +��
���5��C�|�gb���l��F�t�Y�#	��0 [�L�i�}���T,���͸ @$ ���#����l�,7(�i�k���yP�x�lBѣ�$�׭Q�Sx\\]�u-i�0����}GO/&��a���ٵL[���������7�T��rQ�ӱuhئ�������ro��=����Ћ=��^B/����xQ��FC�UQ�M�,� X��Y�TZ�]t>�d��)Or�y�\\y��n9O��
I|֩Ry@_����awg<'�˹�@��NIcq:CC4���9J��W6o�l:(�/��%�Ǔ�y����a�	"�O�D�F��8�G,���h��hF�������/��Vf�>wh/�1�/��e�2� !��S��sC3�PʰbzDB�O�pG�5��k���� ����:J9 �����#�^�-�8�Ie��y��%`�7��g�F�1�5΁-�� �:� �[�@��"jC�*�M��9<)*Ǝ�$�8�C!��c�	)iFac	���$�&h=٦�i���c��J���m�����	OfQ�|bs�����f�KPH�a���b�v��V�8��Z�|b�8uli�, �ae� ��M�f؄97�^a�����n����g����q��<�Fc=��!x��e;Aq��[Σ7Mi�A>�bˠ�g	|Þ򭠙F�>���O%?2mqNP�  ���%�d����Z��Tm�kP>UF�R4�9~�z#���E���tp���Zp�a䄂�����"�i���Hέ���pĻ�h�o��P�z�y}�\�xA�M������6����M4�����j��D�1�k�ɾ�GO_9���(NlD�6��]1䤶:S�^n�p&3S�����M	��ƱY5r�i���y}�);h�    �GΗ��\8`��86V��m�Լw>�q�-��RC��C����;x��>�z���~�����l"�ɤ�L�6=I �{(Q,�{Ԉ'bk9ic��|�`b���s`C�O# �T/�#�!��]����%G���5�Tt�۫��m�i\�#6Z�7��RgR��@އ3�f��7�F6�B�Z��lo,�9��ճ�����^��y���d%�O9l�@����C#5�c�;����Yg3���9��>\-S�;_��{FZ���{�;T�W3	��MrD�)��6�q*�8�;es��l4A��1N;���X\+^=p`~�4�A&���,`��n��!�̀m���ؔyCx^HIlN���EG��$� �񪳂��Z�O���w>y'�Dn�t�e
X�u�-�3��mr�6F[��ؚ��:W�8ݷ�γ7�J�Ϲ񸽏��g��L�$Pմ���sp���t7�Sr��H��5)�ֻH�|8��n��;�D@�I���u��ͼ��	�I �h�=r��嬣�}X,}fc���&��a�<����Z��T��d��6ştD6\�Y��I��E
z��
7f7�T&��q�YA����ǲ#\e����qq���Fob"��4�$Zu�!���J�'�K�(���?�g���UYHpb2��$gCf�9R�}6��e���±���EQ���4A�D�Q�a>�7�=%(�vn��~�(B�%Д�h\U%Ʃ+�� �%�Ԋ��DG{�l�.�H��5;�]b���t���W�"gh~Dn���Z�'jȑ�U�
/pEmX�����*A�w>-A@)k� ��?ŷ�̜ V�K�V���8юQ�4�orU�dG�1�E}3r����N�ڠ]���3���WQ�7��|�mc	n�ll� od���ƹQ7*���9�}vDݖ�;3�fe��M�|5M���CV��="����ѹM^뗍�V�5A��7�������2"!�*
�X�ĔL٤��̭�g�V�D�
�X���cbS�E	Q��o:�(~(>v'(�þ�qˉ�Vn���[D�Y���Ǉ���N�}�WM0u��!�2�2�����V�D�4wd������u���/2�/L�)'H��H���]�$5���{X[�k�^J���.�I@��%��h�JJ�dx]�Pԙ�Bs�Dc	�V��ԓ��!q�oLx�
��[�Qd��ϼ��a�^`N���d�h�3�\��K�x�R��퍠�ԙ|�ci�&�[�������2�;���s�<�L6`H�`�<�� ���Mm��8��S���|y4��TϾ�^�.m�]��2w��טijcȾ�d�v>)��Kˇ�n�σ��1.�4����ac��*��(��X=�s���9I�/qd�Z�!��ul���ݹU�DW�4KL��dέs�Ho����@���8��_-��w)�w���H���@G�}x��a���͎Q(����S^Uk3�/����ܶ�[P�d��|	�*�Q��}��H�b�ȍg:�u�Ӿ� ��Z�-��a�6 �
�-�s�Ul�QX٩nx�u�7f��,|o��sF��ۓY^���"�v�C���Fd�F5��c�:Aw��q�;n��E���8�4BHݝ�=�ڥq9/8#Ds�3�=:"��_$� Xҵ�Q�,��&l�	��ҟI��f�`cK�\<�J��;��a?�����Q�&|#ta'H"�FQ��WQ=���QL"����'�r5�pp����i�-=>N���a�Z\��i>z�X?��J��_�j���[���=v�;Q���GM��~��D�����G�j
�s��`��x����Х�f��M�2.�� �m�JS�7ԭ�E5=�?ؙ��p�39��V=�������Qf>]H�MT�p�eF����s��)�49���DXIa�c��"��fwI�fͫ(����ŭ���,��VO�K�2h��>�$�nw����4�0��8iс�MG(IL<�U9��\5.�ո6r��*`9�t����pJ��?�A�l��b�eW`E���Q��v�����B�H��%�R0Z��.���=�<,w1I�vfk1��;�c@)c��4x��9f���^�2]D�+ �E��:��r0����B�\��j n3�88�N��u��hJc�;[l�Rz��*�W��ē�#v��*\Q�9�D��	�V�g�{l8ȗ�@���'I��ȸ)X놎������bT0a�A��	�H��1Fy��؏	��]/��,��Oұ��A��n��p�X��1.$q�o��@{6����ƅ��H5J�X%���f�w����c���8.���KN:Z������) ~I溍�(VDh�2��u������h���L���IRl�L,SХL�*.�#s�����*�9;)*bW��S3�p����W���,0�䉦�'
����/�ީZe�*�\M�.8%��p�g=Sy2;�F!�%9O^q�.��k)�9K���st��k��P���|��'��kҔ��`�*��1̲�C�|�^�8�&\���`cEN2��|Un�5�7&Vuk����c��ό�\�������r&u�X����5 Y�F)}���]��g&6\p)���e����	��$��H�d�^YД->�U��Ij�|YU��Q���|�l�ol��^\A�5l�r�����@�I���"Dt�jD<lX�[r��I����a��S���1+��N�o��t�~/�(!����4,�Ή�v�/m() L�7X���H'�%=��]:�KK�N�C�����s"���bY�(�}Y���#�t���/F��&d8�2����Y���>d��M c�#�͎�&�9EW�o7���O`��>�z+ 9C+6��2�V�����yfr&	����qF,���Cv��'���A砄�-O�S��.�G8�Nt	E�6{WS�Ö�Ynト��_��˱�9S�w�� E��yz�]ҋ���q$T�W�\�����Ϧ<�.+l6T��q�^46=�89�h�=���O��i�#Kv��D��ҝ����@(�CN�͐����:!v�?���i�#�G'E�e]�C�v�����fQ����49{�-A�Ǉt��+�=��]����]z��L�xϰ�kv�<&!���0:�i?Y�N1�X9���|~���/SX���Z��%�ͦ����5���`�I�n(��%��h4�{�B���P����uHQ�}���X�Y'�S�P;���k��Y �\�
�l J�(�(���o_��7	�4��)3R��H�ۥR����w��1�����2���Mƀ$���ȏkc6_��N%���>�:$|��k�*�T��o��Hh��n����5��i���T��%z]T���*�s�uT�Xf�@�x�=e׾lH6���Y5�| UD�i j�{�Ѫ35*��j��S-]�lF�h�8M#Q�1/����\�s����Mw!+�D"h�5�sN��߱��"ʉ���N��*���>h����*b̞���N�]3�����Ӱ�ݥϰ��0�u��e���*�D�*$
tvEs���JoU~W�7"dr���L��{͍�����<]�rc���测�b�t��E�Et���g���K�oO)��mo:�&=[t������NG휴$ŧ��	}fB7ǿqV A\>�=��!/uLܣ36x���xF�;���1V|�E����h�H��>��~v�3T"g-�f�䮈��^�5��m��{CM�t�i�u���S#+�S�1L�r} #q��@v�|�!ݐɶR�WA�f3�_&�o	pa�k���	���i F�PW�5~�LH@� e������M0BN�&�ͺ�8W��'�6�`��L�2���1wG�!K_NG��Dh�4�Q�H���EV�4��,Uu�M>��}�KtA��Ƌ�k���g�����mB m��&+��0�3���w�F�d��˼�B�lN�NF ���i.��Lci�Z��&��I+w1"�^�vh;�Y^-����,\g=H7,ߖC��M}���2Xֱ.j⭹�?�F(��n�"1TY�-ɩ|6K��}�p�x�_Q��   BS�`3Ǹ^\�&���.w	��[�o���tMj@"MkFEFD���ζ8 b��n��w���Y-���ȗ˛�Cʗ�;�N�d j�5"���G�B0�f��0�2|��s`/o���OW	qT�|���cdp�Oϴ�6x1<��J�q~s���nw�#
0G�]Jϯ��O;����9�+���6|��c3����Ii�1Xo�1�M|�罌Z�a��5�漘游_<�;��i�b��šu���xG�9�����62�HwA����IFכI�G�?�wjFe#�^6H���S�ӗˇ$ zC�[,�8I}߄���n}�S����u�VzEc�����`>m"!Ru�/�Y>����QM�ձ9'�@�YR�b%�RwȎ� 4.�'�&�A�#��ȳH'P������{��K.�wk4u�>��K�^4�(	��\.����du�=5�[.�6��i��^�Ǎ�|�uȼ%$�:~[�L�	��U�Vc_B�V�a���/,�R����a��\�4~?�o�H�M?�#����~�_w.ڛ      ~   #  x�mWm�ĸ
�ߥ�̇1�e��W�����4Y�*
��4!�i|��!���1>s�\4h^���L\4�����y�4c�:���9���z�>D���1^�K���wl6^Qf��E�gI3��A�&b�ï�f+�(�����y��Ⱦyn�Z)��d'�L3|9�"�.Aϵɏ3�P\{]n�L���fY���f�>W�B산ԁ&�f-sF�0ewE`��,�����Aq�E����kg�H]��a���J���Z�c���wK����"��[H�v��G�ݤNaQB�7�]�W6��H���0��W��t�o���
��<bF(�*�P�[��ę�d�iXsI$2,jG�29/�k��v�݇��P��|�6˶�v:eI��dnY!����L���vI5�4�<;�&r����{�%�p�u15�S�qzB?�
�U	v<�ʬȅ����v �q�gI)
mx�[�U�qx����->�gy�+���b2��~�ԯa�C���(H8���,�";��P�[!{��{OG*�>]^�ce\"�"�4�_�e�qD���ܷzU��t������[*�n:�+v	�z2VvQ��]Tr�R�̿�:��V$s��/���q�����7����YtH�xZ��+�R�l�K�̶�.��"S+Pu2�*Vuy���<(�"��-&�֦ƭD�t^J�%^}��Kw7_�(����)zFa��s�ۼ���ꣷȷ��7�����[���K��6eY��'X|�փ�}�2,��R���K�;ߒ?�\�I�i�>�48�*�`]��B�~O�����0
L������~�p�cA�e+d���$�Ґ��R�<���k6�z�����?��rF�==���W����z�5� ͢���h���)�NY��0z��*�nZY¶����B�iǑ��m:�j���#�/�b��|7s(a[��u��G-kTS�5����n��e���SV��	��`e��Z�e��kH���|�%/��m��p��!��lw[#�{yzꌣQ��e��c���X[�V�����ݲC.���{��3��rY˕lh���4�#�5�w��c�a%���YI���\��x��v!�I�˼���.G*�\�T�Z�b�4���uo���؍�j���<]OA�������h�i�5�N� ��W�29�;����-��kc�T�	tހ��Cz%���i�W��e��mW�H���Pl�.W�N�έ�t�z��R�]����f��%)�����C���F��������=η
7+��rP\z��gx/W����|h5�P�EoѭV��9�I������K�����\�@=԰�s�^�k'�U4�|�<|ɩ��e�����j��q�D���=�{y��ۡ���=���v@x�,��M�� �^_K�į�.���,|C�g�U�| R]�"���s���%4v�?�3������+zz�{A� ����η]h����&�G�2.����Z����%����H;Nb��ъ{�RP1��~U��������-�� ����,�h���4�9�?�c���*      k      x�UZ�r�8�}��0Q�Ւ�nx���2-w;&�_@E�	������	�ԛ-�H ��d�eq}����şC�����en��糩�8����f��`��So�ع�g��O�=�o��93��m�'�K��������jo�n���M�f�9�ڍ6��W�`ތ�⌭f��<3����p�'�w¡�e<Z|�h�2����A/�e�'_�U\p�&�0�q�
x˯v\o��ǋ�8��w�|0�;������љ�-�z
g\��yrg3�˄�]?�k����~�gsr�ig��MN�j�`�2��5�e,�X=��.���'��X�?�,N�{sj�ܺ�L8o}0�F��i�X� ��b�Tv�aN���䬄i	����n�� ��vBP�`������G�~�G������7z�wR���;�cѴ�M��8b�Qg}�Ʌ`�	��}�=����1��l����Jn�X1H:J��g7�;;W�	n6�8�xݪ�8��(U7�v����JO���-��Ŋw�L|ʅ6-��hzw�A\gJ���`�<w�b�d�G�a%G��0#���g?ƞeςh����J\�`�@��3��=*㈘KRw~�8w��S�P
}� �8������"����<����Q�G	L�4�̱�á�}��Q�W����KD�ı���'e��e55�Ip��@k���e��s�:�#m����8}�Vc�2��,��d�9��4��#q���9�˫��!U�W�1qn��}_��Y"{jga,gĵA�yjQ�H��&@�ԓ{��9-Rf���Fc��g|��Ҵ�Gx�G\7톅G���n��:{.St; ۡ�<����M*��ȿ��gI*�*"̶fDק�AP��#PV��;M�yiZ�G��t>�����e��1.%
~������O��χ}�j�^iB�5���]>"��Vm�,dݡ��0�����p݀��x�ѳ�;͊�Ƴ�߄O(+���  F�?�8K����1ʭ��I���'U��Ś�u�wjO���̍,x�*;4�Y�1�?��g��<��B> �H%�7]�ar����4��Y��D���J `;S5H�QJ�05�~ ��w��]HF��i;���ݕN-m�yq�Qʣ�#k].%}�Q}�ASzj����حb���F2��
m��s���a�wz&?#+�zLE�V<��� c�wF��CgqA�O^j�@��I��+<�>"ho�фP��i-���m�S;�TS�C5����$Lp0�	H	�ɖ�}D�K�L�H6-u���k�˛�*%�2�~�R���"V;�G,��r�>�%�h��|!�y*�=�ĝ�]f�$��T�\��M�4�&���@���\  U�.�4և�,�~uy[����^v��~BZD���F��8( �����%o�-���I�_#h�%���r�׬VƼ|]d�q#�=�ĒH6�@�Ix��5��!1�e!�q)��d)t���)�>�C�\J$�K�P���cT]�B�:��� �6�k�r���"�+^���S��Q��s��tI"(��b0ʚ%�׹^��	������=���~�a���<�A������������*���#����v�[c����8T�Q�Ȓ�B�h<��ćLUTu�- ����:2rLK��Q'[t��4���ꯀ������۵b��ѹ�2x����25�d�!#�^4��%�?�-�&����&mm"���Z�C1�>��U�rԷ h�'Jz'���$�l���(n��݌�y�p݊�8S�L~��3W��C�y�B��쪶�!6���ڦW��]j�?ܑ������n�m2U�<q?�l+Xղ��֞"���O�1:>�#�O%��Hn_H�^�S�H���`#<x��C)��g�F�6��զ���i 0�d��e׵����=�w�ڑ��L�Ə/t�a���w��.��3�򹃋�4,�+�LkB-�{���:i�`%�٨�7'�$!|��|�H��f��`e�2@�[Y;�$��ࡶS����h��C����P��g�����ܹ�{1q�p����/�CΓ�-���B�Mm�'k���d�N��@.�z��#U�X�6N��3���9E�Q#�Y���w'9.��.#��ۋՖ%t7�t�/���A�6#IÖl�j�E]wP�S�u���Q
��#v�R"!���/�<n�����B�	���
�wZ�C<�y0�H�U0��鮸M��5�3>yăJ��2	O*,��ҢP���}�( �%���	0�P�V���:�����Щ�Q��_<���Jt�-��z�C̥s_<$x��_�2�g% �W��x �����UXXP���dH�%K�U��۸����!%��x�܀^�I�c�Ȱa�t ��86ɐ�V�bX8qo�&����J&��)����io�Ҕ:�Y������c�����j��1�MU�����j�e�`��Z=T/G�d�V%AV�Ă#�$(�,q�Ě��r���D��k�?�ТT��п�Rm�G:���5u���;rP��G�}H�{�9�6���m�$ڄ� �#u0��!���U˺u�5�?�-u��2���4�I���)s���D������LfUF_���U�A��D+��n_�{�^��s�J�)�f|a[��_@�i�4r��\����o��P�K��q!��}����S�8;���w�ɠ�}Z���n���C9����f�ȏ&�C�cP�I>.�k�Lt����'�Q��T�I�9��mqw�
�'�IF4f��+{�s���1�ς�2�mR��l�;����I8�i�j�����D����hRbYM����"#-cE�?M#2m�$���l+��K�אʉZ�'��Ǡ2��z�?�	�����p�(a�駙&:"�'>�NjN�����%!X�<��ko'�C�Vm�ݑ���[�:9C%� ��e<��A��H�fj3|��i�y��&�k�3q���
\�)5}�
d?�j�&e��l0ȍ�D^��I;}"r*q4 �u�mN��Q�\�fGQ9��i�5w��V����"��+�\?W��{Y�pa�m:�:E!k��gQc��ߘ]<k*�|�@)83�ΐA�6\��(W�v`:M7��d7*Py�J�a:�o-��p<#�R&�"n`/RۊG���݅n/޲(Kj�=���6d��	�}�$�s�l[gwi�!Ҍ%H*3Q��K���)coe��D�}��*s�QW5�2E9����X�r�6�;����©��N+8�'.w&�ջ�N�u��pR�]ޭ�\�D@�01r�2�/��ʻ����c�,�������׎`8U���� T����/c<q6�j~#Ae�T<r��J~n���X�?�r�dP-���?�X�I�L�n����Z��=һ����U���^y�s����Q%� P�@�\��N�ǅ
��"�F�V���ȴ��I#�t�\J�v_y�,��2ȓަ���č'Fd�ᷚR���F���XE���6������l�i���M1�?��وh��'Vj�&Ҡc�q{�p���r�j�	,���a¾���&F�����6���f�7��e���������~&nGV:�B�����캏��'��Q���^��I��%��G�s��:c�.���.G�+E��i�Ұ�OF��$��Azw�*h��\��J���I�&-}5��-����x��'z�S�+�� 4�p)]J���rW\g�,����E�����|z�t:�N���]"G�7~��24��e��up�B�}��*O�d�d)�'K��f\'�$?�a��d����Nm&�W)t��	ʲNS��>���\��Lu�V�����FAH�����u���	��1OG� eC ��J##}򙥼e��,��JK�t�ۋU��d-A%1z 5����!��	����)�������wQ9cDleP�:e̓Z��48�U�:�O3��������y����ܪN�7!�*?����l�H���N�d���>����@�֑�:sE�K�:�ͺ�y[��.# G  �N�X^z_�I޾���Ùy	�tzRBiL��;7ݗl��1�y?�,g���-P;��G�N�)��V׫��v������@�m���u���15�����~�$�K�*]�XH,ن%M�!�-���M��0�����J�ɘ��jL@�n3����d�l.Ӷ �e�D�4��ɫ�"�zH\�@ִ��E�и�J�h�e`����pK���11��Ed��NOȜ20����uq������)�U;��D,�RQw^/���[$T�Y��M:��2j��-9�I�X�fI5���v[��W������R�%��LlHF¯����ΐD=�iq-��L*�S'�4׹Z���Ak㉍�;�=TM*��63�[�'��W)�XU��;�3uEG1��a����<*HWi _�R�~�}I�����#$T���M_��rM���9���N���:^�Γ|�_��E���[8k-���z�c��6is'_2=@��1c�K\{��|i�=�P�E��s�~9�.3�_QW����W�v/�Bz##7��=�\���9�2�A�V|)�:b�D1�%J������իW�)�      |   �  x�mWK��8\[w� �.s�sL�(W�zv�W<>I��}m�M�j�9�i���d�g�L��&��m~#M3Z�7�[��ۉ=���E��[f~�M|3_2�_�&���t�7�M�,ͦ]k�nѵ]ii��LhVPA�7ɥ'�)q�^���ͳKX7�e����i����7x[Y���HL�������|���L�l�޿5
���u�T��ҕ��AaRb
3���,�!v�����Q���
���N��A�uw�N
Dԓv<���/X>��}Qԋd��M$�K�2����J�T�V���u+�h�m h�O�����?�:x����%;p�/�_3x��/���R��a�G[J���:�
���k3kqJ; Vv?�.�V?�D.�燅^�S�IֺĂ�?�q�.�W`�L�:�X��Ym[��',4Łb����d/^C�g���;�!D.��(��T����VqC���H�^4���e�����M�&M�a�&�-�I}V�dXYy�d<=��0�d���vh����}	���E��4�#<�~���W�K�E
��,�T�ӎt�!6��ڑe��%Ag*����Ӗ��v@�d�r����iÒBz�E��IQ}rK��6��_��^PqMKO�R�H�Cv�e����S��;��v�qL��� �����N;�ӱJʢ9�����fM�5.%�k�t2Ph%?kd��ڒ��W5���Q�<�u��	�����~�%pKb�E���2긭�����~U�Lyt��/(�=I��YD����aw���L��%��b��"���B�ٹ�K�Ph�����6�����T[�5��RiVi�@y �7ʳ~��%qW���W̜�Ju�t2c����bG"3,���;�Q�֕'�q�����1�d(z)�*���>�+zeun讳`O�V\9?҃2�1�8�Ȱ����7̑R������8���]�eT�mC�b-oNYo|�#a]�Ž�L��Q'U�癟a6P/Q��3�$3�ohǏ���w��a �a4��
[��ݨmV\�\h��:%��V��yF�	ud���������.��	z w���.�R�j�K�(Zu�}�[n���>�ι��u;*&T,�9��[���G�_{w�X��(y�R\��������~��sU#����g���%�k����KN!)��7^gFu���s�i�u������g$�/��~_K��go�?̆�\}go�b�L��9��FֳNӝg76�Z�3w8��6e�k|�kC&�b�uZ7�#�;��R������[!>�%�of��r�ڏ�USw:$I�Ja�J�r�;��s���M�X��'=/A�S����w�%{�m�|��!S�����?7�.�P�Ϙ��HW�BJ���Ϧ��I��&���J)���T�]�)��G��w�����y.����ݮ��QOhj����ާpv����jׇ���=]��z�rx�!Er��/��*
!؝���S{��n!�H�|��}N�)��9��g�����      z   �  x�]U۱�6���88�7Eג��H�$w��?�Y�  ��l��]�b��K����~D1�D^����'�)���L�dʅ_����v�� ��R�}ʟ{��K�2�0b������a$V���%�����1_�g����xpk{���e�Va�Ã�y��`���L��~8?���a\� ��v]޿zp��C1|4cr��D/B�0���9�r�x����M9�dO�<
��4F�W��b��W㓴D��R����b\9��(g��H����A�,k7)��KD_�������Zj��x�ipi�.��&;`o����h&���#I4��
���T�$"y1uH��[�O�0N~���I����5�Y�w�YY=\1��x΅}S�8�ßs]��v�;�l��DR*2:ouq���^�B 0�E�crf�����"&�u�D�N�ͱ����!�LN؄g�l`�V���ccVgOCR��[F�T��<�ǿ�tT��<ikY6ֆ���h$鑅�<A[o�����F�Ȃ`F  a���О*�Y{6|��An��e��$.Z��-0�̛�`��.��oy��bP�0:���hcY�X�/ +�����������k�?�)�J��w|0b���~�W��ܭ=��[Kq@�²��&K:���c�n��em��x���6w���0�Z��=(Y1��7���R9Ҷ� �4x6����X��w��ۂ%�V�`Q��5=����I��(jV����hzv��m�S< m\�r+��RT$^;8�}�� {�٢[�<�`]o�0��v)3ݾ�C�D��<�oL�.P���:g�a#<~G�y���ȅx'_�2�A���GwV���
r�A AdMP��D��4�� 4����wİ�ixw,i�L�����T� �S�<i��4���HH�� ��Z$�Eb^�]�5T�w����W4^�`���x�b��5�����@:2Z�Pu*N��Vg����U�����Zk��)�      �   O  x�mWI��6<����/>���pT�LY�U4)L����ו�Z!��,�{��z1{�\�\�,{oM5�s���ŗ�:i��N,ǚ�9�%7祶�zy���R{�2�k�\�$+y����닧|\���{v-^8"���y�R�q1Ŭ/��|����)�|�Y�%�zk~㧕,����Hl|8ݯ>�v%���VVY[�=�ۭ}1~so��_o@�xk~t���	��,p�v�H_�K���v�	\�x�еM Ã`�Q7�盦d� c�#����uK�\���+��7x�����(�8���;�#yz�&I#����%��<=�a��660�����k�����������ES!���4Gy����؃[l�Cf)y��-`�V�$h�
�쇊�
������9IH--IಞKTsݶ���h�0�z
Dä�Q G,�����t�D��V+M������0&��a�����K�tpdh+���x��+�-���6�Z[� �l�� �B؆Y�����tYb6dh!Y����ӣ�:(�~Fy`���løo\��p�uo�fdT�Q⯤���ט�jQ�,zpT���m���n[Z/cX�љ�R�vq8���x��	2��ɱ���8|lF�Ź�LNTiفN��l���S�E�����_�[�{�)&a$�%f�KFO�B��`��)�	�}q����[dԐ̧7Ұ�p2L��y=沺�Q��Q�PpZ�!��`�|4�Ts$1s��EWB./sb�G�XL~�h��b�qhno���/ծ6Hv�A(��8 ��?�]>(~��ܔ��O�D�Bx<�uc�	��!#ö���;c�����d ��<!��=~�9�~�A{4��B��	ƴO� Ă����f��p��L���c�g�G�d@�6��S@��D��>GL0Slo�N�	bn��s���O�*��v�{�"�zҮYO�t�)�I�dm�c�C�k�W��y��
��^�	�B!�I��z� ����3}�V�Q��kA-����o(�e
��Y���Ư��ՁI@2�2{��Wp<|ߓ x�Q�+C��GH����u
=8J�d�'�1���I`m8��߄��qa��#jo�4�Ę�$V�}�*��$����a�!��*��-O�:�ߔ�գ�� �1Jl�W��G� "��5B31K���=��c,(�-�aZ �jpm�Cꓔ����=6x6�^Kު�yxم�Qa+�T�Y�&���w]�'k�y/�T�A�g�R�w��"�q�x����t;8>� �P�L��[?(�7���"��� X0�ڽ��Ξ���u��;�￈�_h�S�      v      x�]�[v-7C��sq/Qoͥ�?�l�T��N�\�FU��@ ��g��v����b���o��X���{α�[�g���ٙ�?ִ|����X^�o+O�kXy�������:ڣ56��S?n{�{�M��?{K�4�R��⋪����쩻tk��ǩ6�����oDû��3l����Զڨ�<���r[o�l�̲w�>��u�����j��X�o]�#������9�U
{z�V�vQظ=�=T��q�l6Ȼ^Y�~��H0�W))��c��g�x��5�}͊D��Ҟֺ�����>k��6�����b&���Cč�� ��Y��׌��^-���&���g��Ƙ�ڷ�}ɉ���qV+��1�D~�
�h��{[��~�k�BD_���YF�m�'�i�K���?
�&�j$R/�z9G�7��G����}�<}�`=:����ߛbF^玽1!r�(�9��Z{�3F�# � �m��ok�z���N=c�4V@��b���P8T?�J9�����ڑF߁���3�F^��Q�����J/+A��C�ء���HP�QJ�:������v!;��=�?�[�� E�w�A �� ������[	�kU��j{�ꛃ'�qQt�����,iC�S��狕��	Բך��1/���U�8v�<�.�����n��x{�LwR:!W�/��h�֪P�:���2?�A0��*x��� ���,j�XS�r�ew*��l�X�T�3���FR2�fYϮ�=�vR�Z����kQ*�.�p/@��O
p���� �>�[9(��1E{����Tl�@m%���n����]P�_e/�U�T�3rc��&mk'����<M&��c��e����@Pf�'�a&*8��9�!'���'�>��TзXM��j5�W�
6޾\�d��
ª��7��9�"^IL�M���6�&�ǋ��×/�����>֮��$>J M~l�#���A�f_�9�G��T��[o���-�*�iYe� ��Q���˦�w��U���cZ�ޘlM�4�J��I5�&
T)�,�"xc$)05I�w�hl���و�
��'u�	�1	�I?ʤd_ܨN�'ݐ?��{j�x+Mѵ���d��c�X����"a������*�B��SFRzF�Ł�ڴ
�n*�� ��2�W�a�e�%[m�C���,�_���@:*��,��X�qǅ4����_'aX0~��V��1����5VnO/Q+���W����W��T����8��%�5��G���zYۑ �|mm�'U��>�K�W���"�+��KΎt@}I�8�yH�SzK�k "+~
ai�/Ⱥ%�K�J�����i��%'��f%\b��;|����nu|���3��+�#J��?���;�ԉ�O�dJB�*|���]�,��j0A���pJ��*�]%�LWRBo �&=�
f� �߼{-i*?�z#���t��hnU�L}�u�"����?&
�z��ǅG>|\_�(�W��g/���k8\"���;YxZ��֑�6�
�3�������[�_W)E�Au,��ԗ�!֔���\�����r�E5�()�ĉ���^`5��Qe�<*��m��J����}h@�MJ�,�%��&���Oi���<���%`��	1O���I����=m�t~M��F���lގ����J�n<���� G���,��!>��r�h�[�����[��d_��v��d�;3j��8h��|�����
�5�N	 /ĺQxRJ�q�q�^��Q���V��r��04�%�kW��58�{-A�ɮ�׼٭T�5,Q����B���+�q��YuN�wF#�}�����n����~=�,_�b��������V$��v@�н��'�M<H����(��$��/w���h�Wo!�p/����g=��W��9-%1I��X�hōy}G�`H������e3)d%DvqK�
~HBƘ�'O5,�e2v�geߴUЈ#�����̭:uh�e��4uZ�/
�g�A%��y�ծ��2�Rl*��0�gi�»E�]�@���Ot�ď?v�dsn^��9�(��抏���,�4���� �.�Cs����y�㝊(���&@���;��圷�Z%�����IL]��MR�YQ#{��m���Z�V�~�|"�IM1�pTK���)^��cˋ�$�d��?��
m0�5Y;�n�>�q�m	ʆ�X(�ب��_'ԬDc��Hi��K�n�g�_����2X|Ǽ?P�㖯�O�W/D��<�\3�djZH�~����v� ���5>����GUuj�ls�G׸f�e��A�3Q�|�u����,�hs�I�7�+���2in�=i;J�c>%���jn$�(+�I#�?J}��)�"ԨOd�Zu�B5{��G"�h�/����s���L�;�#���S_������Jr�b��+�ÉIJ�%�m�@�Y��8��6|�Q:���qm��s�Qkk$J��� �uQ�QO�ed�s0�0QS�V��Lڶ��ܮ�{x�٘�Fm�7	ߐTm �
E��Wo�AU��F1IǏ-9����J��z����k9Է��2e�AM��]�����t�����!0k2�C�v��@���n&\��ZJ+�D���ٚ��!k,%w��h����I�}��4+$7>���@ֳ?�7��K��	d�m@�RV�q��ĥ	��eu������N�]}�E�?Ôc�'��
�q��9���5ɝ�J/a>Cɑ�e��ĔI��Yٚ@�ˎ��d�h��{N�$�f�(���y��ztZӫIG���yW o1Q��q8C�>G�������I�e�CԲޗw�S��glq�Kd�����c�z�K{g���=�]��Y��!*���z���4�i�=�@ �K&H=�w�o�/²oJd�5Q@
D�Y�+ǆn�8S�kv�wbezC��>i�f-�K��]��	Ȏ⪁+���DiTJ��6�%����fi�A�L� ��ԉ������n˱�k�y.yh��{����JF�Ӫ�n> U+����U�n�7(���*r��(�J�g'#/1{����h#T�^�q���1���07��&	�mw�8X������sݛS9(x�5�y��G:�w��AqcI�ԅ���ީ^�9�S4W���p)=��Aw��^/��A,��lY\qK���;-�:��b��jAof��w��1/J���Q�]�B�2�F�3�L����sağc?㉮O;ʽ�����l�kM����A�岵d���N5/z�����ؒin�aK�BB�O�p9V�.x���V���1������0��g ߑ�%jF��[Yb=�[�;�͛�?>����ʩ��"���ft7?�8��O��?c$���) �jts<�=��(.����k%�iUñ�Կ�w����A��G:>���	����|�r���U��񄦄��������M$�L��T�)��p���S0�\��c�o̗�_ŎY&Vʨn��B(IZK2��=hL�9��{��C��uk�6���ьQ��U�.B-���[�&C�;�XR�G�xw����qB��^
2h�M�1�i��7���7x��x�s��=��KC�M�4/�C5�����[Y�N���)#���t?ל7o>0�[>U����n������E��v5+b2�v�`�f^��7���Δy��՚$�_�	����;�SGM�{�TR9���~m��)w`�������Y���Z�kkWN��Y�K��I�Y���e'g>��S���c��i=�����^ku=�+P}B����8�z�H�yo�"9JY%�=4j6]���Ȟ"��-Mۯ+��7x,�9�'ȗ)}2H�r���r�s:�׳�u�������<~)�t��O�)�Q#�DCCJE^�����y�{��������,Ei���[�Q�醠�utc��L�SJv�qz]V|�E�����Mѻ9��Y��ʈդJ������d%t����9�����R���$ԛ��������h��s��С��W�x�&�����Db�v�<�\߄�x��� ?}�<6�j�re�3\�3�m� 3   ˢ���o�d�\�8���@�m�.���~}e��Z1H9W�A������?�L��         �  x�]VI�$7;+��������� He�8��%qAP^�Z}k��9^��O�2���y�|k�ií��k��񖶸��yx�^Z����O���n��	Ͻ����V��x�3p�p\�^��8y��2Kߏ�4~RX�m���
��g6�	[����.����i=����������-��(gj���b%R&�]�j{��".f:g"����I����qΈ�3��V��z[��p��%
��dފl
��`/X�E3��0jޥ��Q�e���$Lz�>G�_�^���M\\�9��|�C������i&}�7�#:nJ>��#Z�C�1�쥡Y+�ڑ7��1]�ҏH������Ȱ�f&6U����{��j��Oض*&�2Ztc�u##��x���r�>�*b�
 ��\f���XAcC��'�=�0q�����ζ�F����K�WK�gg#[�@˚� =õ���b��J�D$��YI����8�*��=�~Y�0���S���ЇR���:��}������ɚ3��L�8��Tc,?'	�9rՐc�E����AO�ṥ9�b!>��LB���t~3�ؘ�@d��hzBV5�r�������sϢ=�;I!
k-���k9�U�)�Le^v��^�o �\M��Ⱥ�\�{P!ij��N��X�~�t���c�[�]O[�#OE���/x�V��űR�d�%W��@n���c�͂���P~X�Ji�|\�<g0�S;�v:��S�	��oϵ��K,y�8����[�<��O@�%Ɏ|�2%������#߫L�[�j1R�&�v�va�]�G� �|Rٍ�63������9N�zU�7�V�B�>�qܯ��VW1�Z�f5ӁHl�Q {�r�EyMeX],�5"���S��6���G�!o橱c�3��rA, ֓C1.�+�,�ٷ)�[�=�B�i�-|��1�ڀ�%���fLiC�O>.�OJ�-۱�����ԧ+t�t��������D�o���Z?{ht<��oohD�$-�ݧ��8����E��v�]���av�X/��=%'(눃W�NX�#|4�ͤW���zR�x�]��Ia�sX���/^ ��RiD�d;z��#/�+��MG,���}FI��Gq�ő����྘fn�h�*G�2�-55�;x��`n���Q��{몜e�h*˭��y��?Z��     