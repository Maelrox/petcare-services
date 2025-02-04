PGDMP                  	    |            petcare_suite    16.4    16.4 �    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16384    petcare_suite    DATABASE     x   CREATE DATABASE petcare_suite WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE petcare_suite;
             	   killeroso    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            =           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16389    additional_services    TABLE     �   CREATE TABLE public.additional_services (
    service_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL
);
 '   DROP TABLE public.additional_services;
       public         heap 	   killeroso    false    4            �            1259    16394 !   additionalservices_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.additionalservices_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.additionalservices_service_id_seq;
       public       	   killeroso    false    215    4            >           0    0 !   additionalservices_service_id_seq    SEQUENCE OWNED BY     h   ALTER SEQUENCE public.additionalservices_service_id_seq OWNED BY public.additional_services.service_id;
          public       	   killeroso    false    216            �            1259    16395    appointments    TABLE     �   CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    patient_id integer,
    vet_id integer,
    appointment_date timestamp without time zone NOT NULL,
    reason text,
    status character varying(50),
    company_id integer
);
     DROP TABLE public.appointments;
       public         heap 	   killeroso    false    4            �            1259    16400    appointments_appointment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.appointments_appointment_id_seq;
       public       	   killeroso    false    217    4            ?           0    0    appointments_appointment_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;
          public       	   killeroso    false    218            �            1259    16401    authorization_tokens    TABLE     �   CREATE TABLE public.authorization_tokens (
    id integer NOT NULL,
    access_token character varying(255) NOT NULL,
    refresh_token character varying(255) NOT NULL,
    user_id integer NOT NULL,
    expired_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.authorization_tokens;
       public         heap 	   killeroso    false    4            �            1259    16406    authorization_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authorization_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.authorization_tokens_id_seq;
       public       	   killeroso    false    4    219            @           0    0    authorization_tokens_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.authorization_tokens_id_seq OWNED BY public.authorization_tokens.id;
          public       	   killeroso    false    220            �            1259    16407    billing    TABLE       CREATE TABLE public.billing (
    billing_id integer NOT NULL,
    total_amount numeric(16,2),
    payment_status character varying(50),
    transaction_type character varying(50) NOT NULL,
    transaction_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.billing;
       public         heap 	   killeroso    false    4            �            1259    16411    billing_billing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.billing_billing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.billing_billing_id_seq;
       public       	   killeroso    false    4    221            A           0    0    billing_billing_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.billing_billing_id_seq OWNED BY public.billing.billing_id;
          public       	   killeroso    false    222            �            1259    16412    billing_details    TABLE     �   CREATE TABLE public.billing_details (
    detail_id integer NOT NULL,
    billing_id integer,
    item_type character varying(50) NOT NULL,
    item_id integer,
    quantity integer,
    amount numeric(16,2)
);
 #   DROP TABLE public.billing_details;
       public         heap 	   killeroso    false    4            �            1259    16415    billingdetails_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.billingdetails_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.billingdetails_detail_id_seq;
       public       	   killeroso    false    223    4            B           0    0    billingdetails_detail_id_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.billingdetails_detail_id_seq OWNED BY public.billing_details.detail_id;
          public       	   killeroso    false    224            �            1259    16416 	   companies    TABLE     �   CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(100),
    company_identification character varying(255) NOT NULL
);
    DROP TABLE public.companies;
       public         heap 	   killeroso    false    4            �            1259    16421    companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public       	   killeroso    false    4    225            C           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public       	   killeroso    false    226            �            1259    16747    consultations    TABLE     8  CREATE TABLE public.consultations (
    consultation_id integer NOT NULL,
    patient_id integer NOT NULL,
    vet_id integer NOT NULL,
    appointment_id integer NOT NULL,
    consultation_date timestamp with time zone DEFAULT now() NOT NULL,
    reason text,
    diagnosis text,
    treatment text,
    notes text,
    follow_up_date timestamp with time zone,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    company_id integer NOT NULL
);
 !   DROP TABLE public.consultations;
       public         heap 	   killeroso    false    4            �            1259    16746 !   consultations_consultation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consultations_consultation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.consultations_consultation_id_seq;
       public       	   killeroso    false    4    255            D           0    0 !   consultations_consultation_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.consultations_consultation_id_seq OWNED BY public.consultations.consultation_id;
          public       	   killeroso    false    254            �            1259    16422    identification_types    TABLE     z   CREATE TABLE public.identification_types (
    type_id integer NOT NULL,
    type_name character varying(100) NOT NULL
);
 (   DROP TABLE public.identification_types;
       public         heap 	   killeroso    false    4            �            1259    16425    identificationtypes_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.identificationtypes_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.identificationtypes_type_id_seq;
       public       	   killeroso    false    227    4            E           0    0    identificationtypes_type_id_seq    SEQUENCE OWNED BY     d   ALTER SEQUENCE public.identificationtypes_type_id_seq OWNED BY public.identification_types.type_id;
          public       	   killeroso    false    228            �            1259    16426 	   medicines    TABLE     �   CREATE TABLE public.medicines (
    medicine_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    quantity integer DEFAULT 0
);
    DROP TABLE public.medicines;
       public         heap 	   killeroso    false    4            �            1259    16432    medicines_medicine_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicines_medicine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.medicines_medicine_id_seq;
       public       	   killeroso    false    4    229            F           0    0    medicines_medicine_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.medicines_medicine_id_seq OWNED BY public.medicines.medicine_id;
          public       	   killeroso    false    230            �            1259    16433    modules    TABLE     �   CREATE TABLE public.modules (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone
);
    DROP TABLE public.modules;
       public         heap 	   killeroso    false    4            �            1259    16436    modules_actions    TABLE     �   CREATE TABLE public.modules_actions (
    id integer NOT NULL,
    module_id integer NOT NULL,
    name character varying(64) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone
);
 #   DROP TABLE public.modules_actions;
       public         heap 	   killeroso    false    4            �            1259    16439    modules_actions_id_seq    SEQUENCE     �   ALTER TABLE public.modules_actions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.modules_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   killeroso    false    4    232            �            1259    16440    modules_id_seq    SEQUENCE     �   ALTER TABLE public.modules ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   killeroso    false    231    4            �            1259    16441    owners    TABLE       CREATE TABLE public.owners (
    owner_id integer NOT NULL,
    identification character varying(64),
    name character varying(100) NOT NULL,
    address text,
    phone character varying(15),
    identification_type_id integer,
    company_id integer
);
    DROP TABLE public.owners;
       public         heap 	   killeroso    false    4            �            1259    16446    owners_owner_id_seq    SEQUENCE     �   CREATE SEQUENCE public.owners_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.owners_owner_id_seq;
       public       	   killeroso    false    235    4            G           0    0    owners_owner_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.owners_owner_id_seq OWNED BY public.owners.owner_id;
          public       	   killeroso    false    236            �            1259    16447    patients    TABLE     �   CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    name character varying(100) NOT NULL,
    specie_id smallint NOT NULL,
    breed character varying(50),
    age integer,
    owner_id integer NOT NULL
);
    DROP TABLE public.patients;
       public         heap 	   killeroso    false    4            �            1259    16450    patients_patient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.patients_patient_id_seq;
       public       	   killeroso    false    237    4            H           0    0    patients_patient_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;
          public       	   killeroso    false    238            �            1259    16451    permission_modules_actions    TABLE     ~   CREATE TABLE public.permission_modules_actions (
    permission_id integer NOT NULL,
    module_action_id integer NOT NULL
);
 .   DROP TABLE public.permission_modules_actions;
       public         heap 	   killeroso    false    4            �            1259    16454    permissions    TABLE     ~   CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    company_id integer
);
    DROP TABLE public.permissions;
       public         heap 	   killeroso    false    4            �            1259    16457    permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public       	   killeroso    false    240    4            I           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public       	   killeroso    false    241            �            1259    16458    products    TABLE     �   CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    quantity integer DEFAULT 0
);
    DROP TABLE public.products;
       public         heap 	   killeroso    false    4            �            1259    16464    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public       	   killeroso    false    242    4            J           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public       	   killeroso    false    243            �            1259    16465    role_permissions    TABLE     k   CREATE TABLE public.role_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);
 $   DROP TABLE public.role_permissions;
       public         heap 	   killeroso    false    4            �            1259    16468    roles    TABLE     x   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    company_id integer
);
    DROP TABLE public.roles;
       public         heap 	   killeroso    false    4            �            1259    16471    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       	   killeroso    false    4    245            K           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public       	   killeroso    false    246            �            1259    16472    species    TABLE     c   CREATE TABLE public.species (
    id smallint NOT NULL,
    name character varying(48) NOT NULL
);
    DROP TABLE public.species;
       public         heap 	   killeroso    false    4            �            1259    16475    species_id_seq    SEQUENCE     �   ALTER TABLE public.species ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   killeroso    false    4    247            �            1259    16476 
   user_roles    TABLE     _   CREATE TABLE public.user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap 	   killeroso    false    4            �            1259    16479    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(20),
    country character varying(100),
    enabled boolean DEFAULT true,
    last_modified timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    company_id integer
);
    DROP TABLE public.users;
       public         heap 	   killeroso    false    4            �            1259    16487    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       	   killeroso    false    250    4            L           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public       	   killeroso    false    251            �            1259    16488    vets    TABLE       CREATE TABLE public.vets (
    vet_id integer NOT NULL,
    identification character varying(64) NOT NULL,
    identification_type_id integer,
    name character varying(100) NOT NULL,
    phone character varying(15),
    specialization character varying(100),
    company_id integer
);
    DROP TABLE public.vets;
       public         heap 	   killeroso    false    4            �            1259    16491    vets_vet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vets_vet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vets_vet_id_seq;
       public       	   killeroso    false    4    252            M           0    0    vets_vet_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.vets_vet_id_seq OWNED BY public.vets.vet_id;
          public       	   killeroso    false    253                       2604    16492    additional_services service_id    DEFAULT     �   ALTER TABLE ONLY public.additional_services ALTER COLUMN service_id SET DEFAULT nextval('public.additionalservices_service_id_seq'::regclass);
 M   ALTER TABLE public.additional_services ALTER COLUMN service_id DROP DEFAULT;
       public       	   killeroso    false    216    215                       2604    16493    appointments appointment_id    DEFAULT     �   ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);
 J   ALTER TABLE public.appointments ALTER COLUMN appointment_id DROP DEFAULT;
       public       	   killeroso    false    218    217                       2604    16494    authorization_tokens id    DEFAULT     �   ALTER TABLE ONLY public.authorization_tokens ALTER COLUMN id SET DEFAULT nextval('public.authorization_tokens_id_seq'::regclass);
 F   ALTER TABLE public.authorization_tokens ALTER COLUMN id DROP DEFAULT;
       public       	   killeroso    false    220    219                       2604    16495    billing billing_id    DEFAULT     x   ALTER TABLE ONLY public.billing ALTER COLUMN billing_id SET DEFAULT nextval('public.billing_billing_id_seq'::regclass);
 A   ALTER TABLE public.billing ALTER COLUMN billing_id DROP DEFAULT;
       public       	   killeroso    false    222    221                       2604    16496    billing_details detail_id    DEFAULT     �   ALTER TABLE ONLY public.billing_details ALTER COLUMN detail_id SET DEFAULT nextval('public.billingdetails_detail_id_seq'::regclass);
 H   ALTER TABLE public.billing_details ALTER COLUMN detail_id DROP DEFAULT;
       public       	   killeroso    false    224    223                       2604    16497    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public       	   killeroso    false    226    225            )           2604    16750    consultations consultation_id    DEFAULT     �   ALTER TABLE ONLY public.consultations ALTER COLUMN consultation_id SET DEFAULT nextval('public.consultations_consultation_id_seq'::regclass);
 L   ALTER TABLE public.consultations ALTER COLUMN consultation_id DROP DEFAULT;
       public       	   killeroso    false    254    255    255                       2604    16498    identification_types type_id    DEFAULT     �   ALTER TABLE ONLY public.identification_types ALTER COLUMN type_id SET DEFAULT nextval('public.identificationtypes_type_id_seq'::regclass);
 K   ALTER TABLE public.identification_types ALTER COLUMN type_id DROP DEFAULT;
       public       	   killeroso    false    228    227                       2604    16499    medicines medicine_id    DEFAULT     ~   ALTER TABLE ONLY public.medicines ALTER COLUMN medicine_id SET DEFAULT nextval('public.medicines_medicine_id_seq'::regclass);
 D   ALTER TABLE public.medicines ALTER COLUMN medicine_id DROP DEFAULT;
       public       	   killeroso    false    230    229                       2604    16500    owners owner_id    DEFAULT     r   ALTER TABLE ONLY public.owners ALTER COLUMN owner_id SET DEFAULT nextval('public.owners_owner_id_seq'::regclass);
 >   ALTER TABLE public.owners ALTER COLUMN owner_id DROP DEFAULT;
       public       	   killeroso    false    236    235                       2604    16501    patients patient_id    DEFAULT     z   ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);
 B   ALTER TABLE public.patients ALTER COLUMN patient_id DROP DEFAULT;
       public       	   killeroso    false    238    237                        2604    16502    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public       	   killeroso    false    241    240            !           2604    16503    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public       	   killeroso    false    243    242            #           2604    16504    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       	   killeroso    false    246    245            $           2604    16505    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       	   killeroso    false    251    250            (           2604    16506    vets vet_id    DEFAULT     j   ALTER TABLE ONLY public.vets ALTER COLUMN vet_id SET DEFAULT nextval('public.vets_vet_id_seq'::regclass);
 :   ALTER TABLE public.vets ALTER COLUMN vet_id DROP DEFAULT;
       public       	   killeroso    false    253    252                      0    16389    additional_services 
   TABLE DATA           S   COPY public.additional_services (service_id, name, description, price) FROM stdin;
    public       	   killeroso    false    215   ��                 0    16395    appointments 
   TABLE DATA           x   COPY public.appointments (appointment_id, patient_id, vet_id, appointment_date, reason, status, company_id) FROM stdin;
    public       	   killeroso    false    217   ��                 0    16401    authorization_tokens 
   TABLE DATA           d   COPY public.authorization_tokens (id, access_token, refresh_token, user_id, expired_at) FROM stdin;
    public       	   killeroso    false    219   J�                 0    16407    billing 
   TABLE DATA           o   COPY public.billing (billing_id, total_amount, payment_status, transaction_type, transaction_date) FROM stdin;
    public       	   killeroso    false    221   g�                 0    16412    billing_details 
   TABLE DATA           f   COPY public.billing_details (detail_id, billing_id, item_type, item_id, quantity, amount) FROM stdin;
    public       	   killeroso    false    223   ��                 0    16416 	   companies 
   TABLE DATA           N   COPY public.companies (id, name, country, company_identification) FROM stdin;
    public       	   killeroso    false    225   ��       6          0    16747    consultations 
   TABLE DATA           �   COPY public.consultations (consultation_id, patient_id, vet_id, appointment_id, consultation_date, reason, diagnosis, treatment, notes, follow_up_date, status, created_at, updated_at, company_id) FROM stdin;
    public       	   killeroso    false    255   ��                 0    16422    identification_types 
   TABLE DATA           B   COPY public.identification_types (type_id, type_name) FROM stdin;
    public       	   killeroso    false    227   ��                 0    16426 	   medicines 
   TABLE DATA           T   COPY public.medicines (medicine_id, name, description, price, quantity) FROM stdin;
    public       	   killeroso    false    229    �                 0    16433    modules 
   TABLE DATA           G   COPY public.modules (id, name, created_date, updated_date) FROM stdin;
    public       	   killeroso    false    231   =�                 0    16436    modules_actions 
   TABLE DATA           Z   COPY public.modules_actions (id, module_id, name, created_date, updated_date) FROM stdin;
    public       	   killeroso    false    232   $�       "          0    16441    owners 
   TABLE DATA           t   COPY public.owners (owner_id, identification, name, address, phone, identification_type_id, company_id) FROM stdin;
    public       	   killeroso    false    235   C�       $          0    16447    patients 
   TABLE DATA           U   COPY public.patients (patient_id, name, specie_id, breed, age, owner_id) FROM stdin;
    public       	   killeroso    false    237   ��       &          0    16451    permission_modules_actions 
   TABLE DATA           U   COPY public.permission_modules_actions (permission_id, module_action_id) FROM stdin;
    public       	   killeroso    false    239   �       '          0    16454    permissions 
   TABLE DATA           ;   COPY public.permissions (id, name, company_id) FROM stdin;
    public       	   killeroso    false    240   p�       )          0    16458    products 
   TABLE DATA           R   COPY public.products (product_id, name, description, price, quantity) FROM stdin;
    public       	   killeroso    false    242   �       +          0    16465    role_permissions 
   TABLE DATA           B   COPY public.role_permissions (role_id, permission_id) FROM stdin;
    public       	   killeroso    false    244   +�       ,          0    16468    roles 
   TABLE DATA           5   COPY public.roles (id, name, company_id) FROM stdin;
    public       	   killeroso    false    245   T�       .          0    16472    species 
   TABLE DATA           +   COPY public.species (id, name) FROM stdin;
    public       	   killeroso    false    247   ��       0          0    16476 
   user_roles 
   TABLE DATA           6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public       	   killeroso    false    249   i�       1          0    16479    users 
   TABLE DATA           �   COPY public.users (id, username, password, email, name, phone, country, enabled, last_modified, created_date, company_id) FROM stdin;
    public       	   killeroso    false    250   ��       3          0    16488    vets 
   TABLE DATA           w   COPY public.vets (vet_id, identification, identification_type_id, name, phone, specialization, company_id) FROM stdin;
    public       	   killeroso    false    252   ��       N           0    0 !   additionalservices_service_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.additionalservices_service_id_seq', 1, false);
          public       	   killeroso    false    216            O           0    0    appointments_appointment_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 53, true);
          public       	   killeroso    false    218            P           0    0    authorization_tokens_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.authorization_tokens_id_seq', 1, false);
          public       	   killeroso    false    220            Q           0    0    billing_billing_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.billing_billing_id_seq', 1, false);
          public       	   killeroso    false    222            R           0    0    billingdetails_detail_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.billingdetails_detail_id_seq', 1, false);
          public       	   killeroso    false    224            S           0    0    companies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companies_id_seq', 26, true);
          public       	   killeroso    false    226            T           0    0 !   consultations_consultation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.consultations_consultation_id_seq', 5, true);
          public       	   killeroso    false    254            U           0    0    identificationtypes_type_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.identificationtypes_type_id_seq', 1, true);
          public       	   killeroso    false    228            V           0    0    medicines_medicine_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.medicines_medicine_id_seq', 1, false);
          public       	   killeroso    false    230            W           0    0    modules_actions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.modules_actions_id_seq', 47, true);
          public       	   killeroso    false    233            X           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 10, true);
          public       	   killeroso    false    234            Y           0    0    owners_owner_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.owners_owner_id_seq', 8, true);
          public       	   killeroso    false    236            Z           0    0    patients_patient_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.patients_patient_id_seq', 20, true);
          public       	   killeroso    false    238            [           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 30, true);
          public       	   killeroso    false    241            \           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);
          public       	   killeroso    false    243            ]           0    0    roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.roles_id_seq', 131, true);
          public       	   killeroso    false    246            ^           0    0    species_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.species_id_seq', 21, true);
          public       	   killeroso    false    248            _           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 46, true);
          public       	   killeroso    false    251            `           0    0    vets_vet_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.vets_vet_id_seq', 17, true);
          public       	   killeroso    false    253            .           2606    16508 +   additional_services additionalservices_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.additional_services
    ADD CONSTRAINT additionalservices_pkey PRIMARY KEY (service_id);
 U   ALTER TABLE ONLY public.additional_services DROP CONSTRAINT additionalservices_pkey;
       public         	   killeroso    false    215            0           2606    16510    appointments appointments_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);
 H   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_pkey;
       public         	   killeroso    false    217            2           2606    16512 H   authorization_tokens authorization_tokens_access_token_refresh_token_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.authorization_tokens
    ADD CONSTRAINT authorization_tokens_access_token_refresh_token_key UNIQUE (access_token, refresh_token);
 r   ALTER TABLE ONLY public.authorization_tokens DROP CONSTRAINT authorization_tokens_access_token_refresh_token_key;
       public         	   killeroso    false    219    219            4           2606    16514 .   authorization_tokens authorization_tokens_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.authorization_tokens
    ADD CONSTRAINT authorization_tokens_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.authorization_tokens DROP CONSTRAINT authorization_tokens_pkey;
       public         	   killeroso    false    219            6           2606    16516    billing billing_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (billing_id);
 >   ALTER TABLE ONLY public.billing DROP CONSTRAINT billing_pkey;
       public         	   killeroso    false    221            8           2606    16518 #   billing_details billingdetails_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.billing_details
    ADD CONSTRAINT billingdetails_pkey PRIMARY KEY (detail_id);
 M   ALTER TABLE ONLY public.billing_details DROP CONSTRAINT billingdetails_pkey;
       public         	   killeroso    false    223            :           2606    16520 .   companies companies_company_identification_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_company_identification_key UNIQUE (company_identification);
 X   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_company_identification_key;
       public         	   killeroso    false    225            <           2606    16522    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public         	   killeroso    false    225            b           2606    16757     consultations consultations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT consultations_pkey PRIMARY KEY (consultation_id);
 J   ALTER TABLE ONLY public.consultations DROP CONSTRAINT consultations_pkey;
       public         	   killeroso    false    255            >           2606    16524 -   identification_types identificationtypes_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.identification_types
    ADD CONSTRAINT identificationtypes_pkey PRIMARY KEY (type_id);
 W   ALTER TABLE ONLY public.identification_types DROP CONSTRAINT identificationtypes_pkey;
       public         	   killeroso    false    227            @           2606    16526    medicines medicines_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_pkey PRIMARY KEY (medicine_id);
 B   ALTER TABLE ONLY public.medicines DROP CONSTRAINT medicines_pkey;
       public         	   killeroso    false    229            D           2606    16528 "   modules_actions modules_actions_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.modules_actions
    ADD CONSTRAINT modules_actions_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.modules_actions DROP CONSTRAINT modules_actions_pk;
       public         	   killeroso    false    232            B           2606    16530    modules modules_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pk;
       public         	   killeroso    false    231            F           2606    16532    owners owners_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);
 <   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_pkey;
       public         	   killeroso    false    235            H           2606    16534    patients patients_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);
 @   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_pkey;
       public         	   killeroso    false    237            J           2606    16536 7   permission_modules_actions permission_modules_action_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.permission_modules_actions
    ADD CONSTRAINT permission_modules_action_pk PRIMARY KEY (permission_id, module_action_id);
 a   ALTER TABLE ONLY public.permission_modules_actions DROP CONSTRAINT permission_modules_action_pk;
       public         	   killeroso    false    239    239            L           2606    16538    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public         	   killeroso    false    240            N           2606    16540    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         	   killeroso    false    242            P           2606    16542 #   role_permissions role_permission_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permission_pk PRIMARY KEY (role_id, permission_id);
 M   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permission_pk;
       public         	   killeroso    false    244    244            R           2606    16544    roles roles_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_key;
       public         	   killeroso    false    245            T           2606    16546    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         	   killeroso    false    245            X           2606    16548    species species_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.species DROP CONSTRAINT species_pk;
       public         	   killeroso    false    247            V           2606    16550    roles unique_name_company 
   CONSTRAINT     `   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT unique_name_company UNIQUE (name, company_id);
 C   ALTER TABLE ONLY public.roles DROP CONSTRAINT unique_name_company;
       public         	   killeroso    false    245    245            Z           2606    16552    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public         	   killeroso    false    249    249            \           2606    16554    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         	   killeroso    false    250            ^           2606    16556    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public         	   killeroso    false    250            `           2606    16558    vets vets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_pkey PRIMARY KEY (vet_id);
 8   ALTER TABLE ONLY public.vets DROP CONSTRAINT vets_pkey;
       public         	   killeroso    false    252            c           2606    16559 &   appointments appointments_companies_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(id);
 P   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_companies_fk;
       public       	   killeroso    false    217    225    3388            d           2606    16564 )   appointments appointments_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);
 S   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_patient_id_fkey;
       public       	   killeroso    false    3400    237    217            e           2606    16569 %   appointments appointments_vet_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES public.vets(vet_id);
 O   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_vet_id_fkey;
       public       	   killeroso    false    217    252    3424            f           2606    16574 6   authorization_tokens authorization_tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authorization_tokens
    ADD CONSTRAINT authorization_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 `   ALTER TABLE ONLY public.authorization_tokens DROP CONSTRAINT authorization_tokens_user_id_fkey;
       public       	   killeroso    false    219    3420    250            g           2606    16579 .   billing_details billingdetails_billing_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billing_details
    ADD CONSTRAINT billingdetails_billing_id_fkey FOREIGN KEY (billing_id) REFERENCES public.billing(billing_id);
 X   ALTER TABLE ONLY public.billing_details DROP CONSTRAINT billingdetails_billing_id_fkey;
       public       	   killeroso    false    221    3382    223            h           2606    16584 +   billing_details billingdetails_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billing_details
    ADD CONSTRAINT billingdetails_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.medicines(medicine_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.billing_details DROP CONSTRAINT billingdetails_item_id_fkey;
       public       	   killeroso    false    229    223    3392            i           2606    16589 ,   billing_details billingdetails_item_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.billing_details
    ADD CONSTRAINT billingdetails_item_id_fkey1 FOREIGN KEY (item_id) REFERENCES public.additional_services(service_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.billing_details DROP CONSTRAINT billingdetails_item_id_fkey1;
       public       	   killeroso    false    3374    223    215            j           2606    16594 ,   billing_details billingdetails_item_id_fkey2    FK CONSTRAINT     �   ALTER TABLE ONLY public.billing_details
    ADD CONSTRAINT billingdetails_item_id_fkey2 FOREIGN KEY (item_id) REFERENCES public.products(product_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.billing_details DROP CONSTRAINT billingdetails_item_id_fkey2;
       public       	   killeroso    false    3406    242    223            {           2606    16773 (   consultations consultations_companies_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT consultations_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(id);
 R   ALTER TABLE ONLY public.consultations DROP CONSTRAINT consultations_companies_fk;
       public       	   killeroso    false    3388    225    255            |           2606    16768    consultations fk_appointment    FK CONSTRAINT     �   ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT fk_appointment FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id);
 F   ALTER TABLE ONLY public.consultations DROP CONSTRAINT fk_appointment;
       public       	   killeroso    false    255    3376    217            x           2606    16599    users fk_company    FK CONSTRAINT     v   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES public.companies(id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_company;
       public       	   killeroso    false    225    250    3388            k           2606    16604    modules_actions fk_module    FK CONSTRAINT     |   ALTER TABLE ONLY public.modules_actions
    ADD CONSTRAINT fk_module FOREIGN KEY (module_id) REFERENCES public.modules(id);
 C   ALTER TABLE ONLY public.modules_actions DROP CONSTRAINT fk_module;
       public       	   killeroso    false    3394    232    231            p           2606    16609 .   permission_modules_actions fk_module_action_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.permission_modules_actions
    ADD CONSTRAINT fk_module_action_id FOREIGN KEY (module_action_id) REFERENCES public.modules_actions(id);
 X   ALTER TABLE ONLY public.permission_modules_actions DROP CONSTRAINT fk_module_action_id;
       public       	   killeroso    false    232    3396    239            }           2606    16758    consultations fk_patient    FK CONSTRAINT     �   ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);
 B   ALTER TABLE ONLY public.consultations DROP CONSTRAINT fk_patient;
       public       	   killeroso    false    255    3400    237            s           2606    16614 !   role_permissions fk_permission_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_permission_id FOREIGN KEY (permission_id) REFERENCES public.permissions(id);
 K   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT fk_permission_id;
       public       	   killeroso    false    244    3404    240            q           2606    16619 +   permission_modules_actions fk_permission_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.permission_modules_actions
    ADD CONSTRAINT fk_permission_id FOREIGN KEY (permission_id) REFERENCES public.permissions(id);
 U   ALTER TABLE ONLY public.permission_modules_actions DROP CONSTRAINT fk_permission_id;
       public       	   killeroso    false    240    239    3404            v           2606    16624    user_roles fk_role    FK CONSTRAINT     q   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES public.roles(id);
 <   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fk_role;
       public       	   killeroso    false    3412    245    249            t           2606    16629    role_permissions fk_role_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES public.roles(id);
 E   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT fk_role_id;
       public       	   killeroso    false    245    244    3412            u           2606    16634    roles fk_roles_company    FK CONSTRAINT     |   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_roles_company FOREIGN KEY (company_id) REFERENCES public.companies(id);
 @   ALTER TABLE ONLY public.roles DROP CONSTRAINT fk_roles_company;
       public       	   killeroso    false    3388    245    225            w           2606    16639    user_roles fk_user    FK CONSTRAINT     q   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id);
 <   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fk_user;
       public       	   killeroso    false    3420    250    249            ~           2606    16763    consultations fk_vet    FK CONSTRAINT     u   ALTER TABLE ONLY public.consultations
    ADD CONSTRAINT fk_vet FOREIGN KEY (vet_id) REFERENCES public.vets(vet_id);
 >   ALTER TABLE ONLY public.consultations DROP CONSTRAINT fk_vet;
       public       	   killeroso    false    252    3424    255            l           2606    16644    owners owners_companies_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(id);
 D   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_companies_fk;
       public       	   killeroso    false    235    225    3388            m           2606    16649 )   owners owners_identification_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_identification_type_id_fkey FOREIGN KEY (identification_type_id) REFERENCES public.identification_types(type_id);
 S   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_identification_type_id_fkey;
       public       	   killeroso    false    235    3390    227            n           2606    16654    patients patients_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(owner_id);
 I   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_owner_id_fkey;
       public       	   killeroso    false    3398    235    237            o           2606    16659    patients patients_species_fk    FK CONSTRAINT        ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_species_fk FOREIGN KEY (specie_id) REFERENCES public.species(id);
 F   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_species_fk;
       public       	   killeroso    false    3416    237    247            r           2606    16664 $   permissions permissions_companies_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(id);
 N   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_companies_fk;
       public       	   killeroso    false    225    3388    240            y           2606    16669    vets vets_companies_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_companies_fk FOREIGN KEY (company_id) REFERENCES public.companies(id);
 @   ALTER TABLE ONLY public.vets DROP CONSTRAINT vets_companies_fk;
       public       	   killeroso    false    225    3388    252            z           2606    16674 %   vets vets_identification_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vets
    ADD CONSTRAINT vets_identification_type_id_fkey FOREIGN KEY (identification_type_id) REFERENCES public.identification_types(type_id);
 O   ALTER TABLE ONLY public.vets DROP CONSTRAINT vets_identification_type_id_fkey;
       public       	   killeroso    false    252    3390    227                  x������ � �         �  x���IN�0���)|�"��v%� )j�@W�X�MZ2T�;�����;H�R6�����g`�D�EBLb����õl;�J��K���v���_�� R�+�C���3�d��|9]�˧܆�	��PC�b��@�.*Y��A�A��P�,�l��Wm3i7���و����E9�-�5pdk$�y�f����1d���d�,w�[/��RN� g�ȍ����������I�u��:GE�ņ*���n�81sÌ6�54�>S#�o�7ʇ;0��*�cj6���kD1��B�|d�Y���D� ˈ*&?#YYJ�!�lQ	�j���m�I��UY��n��$��8�*?t�Jv��S�cو��r:L#u bg�?XJ�����龚�/�����o���}            x������ � �            x������ � �            x������ � �         7   x�34�K-I-��K,�LTHIU(*MMJ�t����M�L�040350����� no�      6     x��нN�0��y
�(ѝ�b{Cj%��d��%�K"�I�D����p4-HȖ��ߺ���x�!�H���)� �+ R�%)jG����f���]��S����?5�.��f�^�9B
�"Z�U&�bZ����L8A_"��_C�X.?&��߻��^+����%7������>FǺ#�s���n�Զd�����*2�x��.��'&�Z�Y����r�θ��y�4�$A1mO������.N�&z�in��Lp)���0��Y�$�㕘]            x�3�tv����� 	.s            x������ � �         �   x�]ϻj�0�Y~
��Ź�超B�6t�%�D�J��Wr��?��c.��VE@f7��#��^3�àί������0� �l4���L�+�Ni��u�s�o�G ���n�:��s.��J��8B��Q���ҭS���M]�w��ǊDt�X����QҲ>3�h8���=u��Rsk~�2��о�6H��<���|]k��+�	d�wI#"�����7O�           x����n�0 г���Y��������\�X@(�Q+��wH�I9����H�Q����4����bb� ��{�l��o�8�aH��2�H�A�Ӿ�h!��h���%bT�s8�I@�1�xr�o�yz�/z��9�5��d�����-������h1˧��0���$ͳHR�0��_��۸�{���f�_���N��p�_��\��ڬ�/r��qzf7�*ӱ�Zb0�!]���J�$�Ց�4`�Ae5�eTYM�#����a������/KD�we���,Y�=Y���~�?L�1��~��5�������R>$#�1,.t�q���S�.�XXTִ���,R߁o�YK�P��Pe�N��r��@\6N�4ܸ\a~~b�w�/!E���+��Sy�� �<i�*�]9�����Rzp���0�l����_�H����r���ͨ����q�ʘ:�ͮӴ�)���A��R8s��Q�iȟ�8@�D�L�]A��l��k_Q!Yh���v���:�(�h���l6� �V      "   �   x�}���0g�+,1��$N�X�U�,VաR����'��ț��1���C��5㩌y~B��4`p�!+n�Qo��y  6�g���4^�^�����	�SDpԼ(v����͊b�����V^@�^4��敫�w�s�|�����.�      $     x�5P�N�0<�?��<zL���D�\VI�$68i�|���1&����ٙY�8��"�x� w+]�3U��`��5��G�Tie�nHP�#�C�v8�sx¾wFa�+�Aӷq��gkJk4�l䗣��	24�sZ�����B��	\^��U���^���},(��K"cx�E�na��Җ�/~$v|,W0�9��GkڸY~�����S���]�� ��R'E-kx�;<Sf��ʯ�̶�A3�lP��x�J�(�}PJ���dm      &   _   x�%���@��G ޣ��C��dn�\��2��&E���37��<�Ŧ��`Ho�$�P����m��/�4���f�5?�0�$-��]q_3�3"^C�!�      '   �   x�32��,.M�ɬJ,RpKL.)-J,�44�22D�q�,�
q:�EB�rE��AcNǒԼ�Td�&�.���y��%�ɉE`!3N��������̼��|��9�L�Xj^I*D�%�{*P���y
)�s�8A�=... �j9*      )      x������ � �      +      x�342�42�2�4������ o      ,   V   x�3��vt������2�K�KIM�/�44�242�t��+I���8�S�R�JR!\s�tnAQb1�k�]�Z���X������� ��      .   �   x����@���9O�	ĭ�ڪh$R�6��AG��H<��=������3C�"�h��b�9���G��Mv�k7.��;�SY��aP�����̰�4R�O�d8v�o���Pr�!)Puv}hOY�4��0Ybg_��ıw�4%8��f��1e�#�S�?��2!      0   (   x�36�4�2�& �D�a
"� �	W� ���      1   F  x����r�@�5>E٦�+���$�\T�be�(H�ED>}$���I�SI�T�U�����ӄ�z�ۮ�k�_#x�:F�-�J�N1�so5Ɇ6�t�aJ{���,���t�fwf����B��r�����+��8A���
�V3��!�7��@�
�6�m� �1��Kѣ�"ʇ������-�h��*Ӷd�M$[-��y`fK&�����Ƶԃ<7�)�?A���	��脤P��h��,Z�N����ֳ�[�h���C5�F�5�D�2�ѳCs�R��f$P��.E����X?<~����)
�s�N@�֬�|1^�L��Uy�=x�`������)m&Nd��KQc�oF�L�������C(=�dV�6`�!�Sԉ�Ą:�;y�d�w�F�"�M"��r�5��$._�"{#"��H��<���{ދ��Y
�j��"��BQ�&!ԃJ*�a��!Faf�F*�f0@,	_�$y���"�����蔼�ַ{]�w��¬[D@Ծ1U��pR9rc4_��>��Q+�"[ľ~ri:���`��U'>I1�A��I��:�����I@N�|z�4���AJ�4�{�X��Z�W�%q�      3   �   x���M��0���)r�I�H�@H�H�Y����Jm<J[��\��b�l��{�!�ܐ-a%ר~��j���Tǐ��@��L���5p��0��~H�@4%f��]���92XV�=��i����&؂�h�C�]����(�:�pR��rR�����_'q\�\E�R��ǁ���Ʃ#�D-b/��L��������(�7ҢI"     