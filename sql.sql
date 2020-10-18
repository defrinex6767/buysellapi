PGDMP     4                	    x            db    13.0    13.0 !    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    db    DATABASE     _   CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE db;
                postgres    false            �            1259    16397    hisses    TABLE     �   CREATE TABLE public.hisses (
    id integer NOT NULL,
    symbol character(3) NOT NULL,
    hisseadi text NOT NULL,
    fiyat real NOT NULL
);
    DROP TABLE public.hisses;
       public         heap    postgres    false            �            1259    16395    hisse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hisse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.hisse_id_seq;
       public          postgres    false    201            �           0    0    hisse_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.hisse_id_seq OWNED BY public.hisses.id;
          public          postgres    false    200            �            1259    16420    hisse_payload_join_tables    TABLE     �   CREATE TABLE public.hisse_payload_join_tables (
    hisse_payload_id integer NOT NULL,
    payload_id integer NOT NULL,
    id integer NOT NULL
);
 -   DROP TABLE public.hisse_payload_join_tables;
       public         heap    postgres    false            �            1259    16505     hisse_payload_join_tables_id_seq    SEQUENCE     �   ALTER TABLE public.hisse_payload_join_tables ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hisse_payload_join_tables_id_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2141231231
    CACHE 1
);
            public          postgres    false    204            �            1259    16438    hisse_payloads    TABLE     �   CREATE TABLE public.hisse_payloads (
    id integer NOT NULL,
    ratio real NOT NULL,
    active boolean NOT NULL,
    "hisseId" integer
);
 "   DROP TABLE public.hisse_payloads;
       public         heap    postgres    false            �            1259    16502    hisse_payloads_id_seq    SEQUENCE     �   ALTER TABLE public.hisse_payloads ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hisse_payloads_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2141231231
    CACHE 1
);
            public          postgres    false    205            �            1259    16409    payloads    TABLE     �   CREATE TABLE public.payloads (
    id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    password text NOT NULL,
    "totalPrice" real
);
    DROP TABLE public.payloads;
       public         heap    postgres    false            �            1259    16407    payload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.payload_id_seq;
       public          postgres    false    203            �           0    0    payload_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.payload_id_seq OWNED BY public.payloads.id;
          public          postgres    false    202            6           2604    16400 	   hisses id    DEFAULT     e   ALTER TABLE ONLY public.hisses ALTER COLUMN id SET DEFAULT nextval('public.hisse_id_seq'::regclass);
 8   ALTER TABLE public.hisses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            7           2604    16412    payloads id    DEFAULT     i   ALTER TABLE ONLY public.payloads ALTER COLUMN id SET DEFAULT nextval('public.payload_id_seq'::regclass);
 :   ALTER TABLE public.payloads ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �          0    16420    hisse_payload_join_tables 
   TABLE DATA           U   COPY public.hisse_payload_join_tables (hisse_payload_id, payload_id, id) FROM stdin;
    public          postgres    false    204   �%       �          0    16438    hisse_payloads 
   TABLE DATA           F   COPY public.hisse_payloads (id, ratio, active, "hisseId") FROM stdin;
    public          postgres    false    205   �%       �          0    16397    hisses 
   TABLE DATA           =   COPY public.hisses (id, symbol, hisseadi, fiyat) FROM stdin;
    public          postgres    false    201   (&       �          0    16409    payloads 
   TABLE DATA           M   COPY public.payloads (id, name, surname, password, "totalPrice") FROM stdin;
    public          postgres    false    203   �&       �           0    0    hisse_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hisse_id_seq', 10, true);
          public          postgres    false    200            �           0    0     hisse_payload_join_tables_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.hisse_payload_join_tables_id_seq', 17, true);
          public          postgres    false    207            �           0    0    hisse_payloads_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.hisse_payloads_id_seq', 39, true);
          public          postgres    false    206            �           0    0    payload_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.payload_id_seq', 1, true);
          public          postgres    false    202            9           2606    16498    hisses hisse_hisseadi_key 
   CONSTRAINT     X   ALTER TABLE ONLY public.hisses
    ADD CONSTRAINT hisse_hisseadi_key UNIQUE (hisseadi);
 C   ALTER TABLE ONLY public.hisses DROP CONSTRAINT hisse_hisseadi_key;
       public            postgres    false    201            A           2606    16511 8   hisse_payload_join_tables hisse_payload_join_tables_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.hisse_payload_join_tables
    ADD CONSTRAINT hisse_payload_join_tables_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.hisse_payload_join_tables DROP CONSTRAINT hisse_payload_join_tables_pkey;
       public            postgres    false    204            C           2606    16442 !   hisse_payloads hisse_payload_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.hisse_payloads
    ADD CONSTRAINT hisse_payload_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.hisse_payloads DROP CONSTRAINT hisse_payload_pkey;
       public            postgres    false    205            ;           2606    16402    hisses hisse_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.hisses
    ADD CONSTRAINT hisse_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.hisses DROP CONSTRAINT hisse_pkey;
       public            postgres    false    201            =           2606    16490    hisses hisse_symbol_key 
   CONSTRAINT     T   ALTER TABLE ONLY public.hisses
    ADD CONSTRAINT hisse_symbol_key UNIQUE (symbol);
 A   ALTER TABLE ONLY public.hisses DROP CONSTRAINT hisse_symbol_key;
       public            postgres    false    201            ?           2606    16417    payloads payload_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.payloads
    ADD CONSTRAINT payload_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.payloads DROP CONSTRAINT payload_pkey;
       public            postgres    false    203            F           2606    16448 %   hisse_payloads FK_hisse_payload_hisse    FK CONSTRAINT     �   ALTER TABLE ONLY public.hisse_payloads
    ADD CONSTRAINT "FK_hisse_payload_hisse" FOREIGN KEY ("hisseId") REFERENCES public.hisses(id) NOT VALID;
 Q   ALTER TABLE ONLY public.hisse_payloads DROP CONSTRAINT "FK_hisse_payload_hisse";
       public          postgres    false    2875    205    201            D           2606    16458 =   hisse_payload_join_tables FK_hisse_payload_join_table_payload    FK CONSTRAINT     �   ALTER TABLE ONLY public.hisse_payload_join_tables
    ADD CONSTRAINT "FK_hisse_payload_join_table_payload" FOREIGN KEY (hisse_payload_id) REFERENCES public.hisse_payloads(id) NOT VALID;
 i   ALTER TABLE ONLY public.hisse_payload_join_tables DROP CONSTRAINT "FK_hisse_payload_join_table_payload";
       public          postgres    false    205    204    2883            E           2606    16463 >   hisse_payload_join_tables FK_hisse_payload_join_table_payload2    FK CONSTRAINT     �   ALTER TABLE ONLY public.hisse_payload_join_tables
    ADD CONSTRAINT "FK_hisse_payload_join_table_payload2" FOREIGN KEY (payload_id) REFERENCES public.payloads(id) NOT VALID;
 j   ALTER TABLE ONLY public.hisse_payload_join_tables DROP CONSTRAINT "FK_hisse_payload_join_table_payload2";
       public          postgres    false    2879    204    203            �   "   x�36�4�44�2� �f\Ɩ�F���\1z\\\ >�      �   $   x�36�4�,�4�2�䴰 ����-8M��=... [      �   �   x�]ν
� �����������B��.m!�`�л��R���~|�50�v��=�=�T�ݝ7�	H*�uMU�C����.t��V�k���=G�V&���%2��5H2��0�����g��ڬ�B͏��'�Y��?E��&��KD�      �   J   x�3��M��M-���Iɬ�L,N142�4�30�051L�60�2�L+����M*IJ)1�3�1�������� Cn�     