PGDMP     8    &                z            new_agreement    14.5    14.5 %               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    16657    new_agreement    DATABASE     j   CREATE DATABASE new_agreement WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE new_agreement;
                postgres    false            ?            1259    16666    elements    TABLE     ?   CREATE TABLE public.elements (
    e_id integer NOT NULL,
    e_type_element character varying,
    e_element_info character varying,
    e_predefined_data integer
);
    DROP TABLE public.elements;
       public         heap    postgres    false                       0    0    COLUMN elements.e_id    COMMENT     :   COMMENT ON COLUMN public.elements.e_id IS 'Индекс';
          public          postgres    false    210                       0    0    COLUMN elements.e_type_element    COMMENT     O   COMMENT ON COLUMN public.elements.e_type_element IS 'Тип элемента';
          public          postgres    false    210                       0    0    COLUMN elements.e_element_info    COMMENT     Y   COMMENT ON COLUMN public.elements.e_element_info IS 'Описание элемента';
          public          postgres    false    210                       0    0 !   COLUMN elements.e_predefined_data    COMMENT     h   COMMENT ON COLUMN public.elements.e_predefined_data IS 'Предопределенные данные';
          public          postgres    false    210            ?            1259    16712    elements_data    TABLE     |   CREATE TABLE public.elements_data (
    ed_id integer NOT NULL,
    ed_elements_data json,
    ed_info character varying
);
 !   DROP TABLE public.elements_data;
       public         heap    postgres    false                       0    0    COLUMN elements_data.ed_id    COMMENT     @   COMMENT ON COLUMN public.elements_data.ed_id IS 'Индекс';
          public          postgres    false    213                       0    0 %   COLUMN elements_data.ed_elements_data    COMMENT     ?   COMMENT ON COLUMN public.elements_data.ed_elements_data IS 'Предопределёные данные для элементов в формах';
          public          postgres    false    213                       0    0    COLUMN elements_data.ed_info    COMMENT     y   COMMENT ON COLUMN public.elements_data.ed_info IS 'Информация о предопределёных данных';
          public          postgres    false    213            ?            1259    16711    elements_data_ed_id_seq    SEQUENCE     ?   ALTER TABLE public.elements_data ALTER COLUMN ed_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.elements_data_ed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            ?            1259    16660    form    TABLE     y   CREATE TABLE public.form (
    f_id integer NOT NULL,
    f_type character varying,
    f_type_info character varying
);
    DROP TABLE public.form;
       public         heap    postgres    false                       0    0    COLUMN form.f_id    COMMENT     6   COMMENT ON COLUMN public.form.f_id IS 'Индекс';
          public          postgres    false    209                       0    0    COLUMN form.f_type    COMMENT     =   COMMENT ON COLUMN public.form.f_type IS 'Тип формы';
          public          postgres    false    209                       0    0    COLUMN form.f_type_info    COMMENT     g   COMMENT ON COLUMN public.form.f_type_info IS 'Описание для чего нужна форма';
          public          postgres    false    209            ?            1259    16692    form_builder    TABLE     ?   CREATE TABLE public.form_builder (
    fb_id integer NOT NULL,
    fb_type_form integer,
    fb_order_arrangement integer,
    fb_element_on_form integer
);
     DROP TABLE public.form_builder;
       public         heap    postgres    false                       0    0    COLUMN form_builder.fb_id    COMMENT     ?   COMMENT ON COLUMN public.form_builder.fb_id IS 'Индекс';
          public          postgres    false    211                       0    0     COLUMN form_builder.fb_type_form    COMMENT     \   COMMENT ON COLUMN public.form_builder.fb_type_form IS 'Типы форм [словарь]';
          public          postgres    false    211                       0    0 (   COLUMN form_builder.fb_order_arrangement    COMMENT     ?   COMMENT ON COLUMN public.form_builder.fb_order_arrangement IS 'Порядок расположение на форме элемента';
          public          postgres    false    211                       0    0 &   COLUMN form_builder.fb_element_on_form    COMMENT     o   COMMENT ON COLUMN public.form_builder.fb_element_on_form IS 'Элемент на форме [словарь]';
          public          postgres    false    211                      0    16666    elements 
   TABLE DATA           [   COPY public.elements (e_id, e_type_element, e_element_info, e_predefined_data) FROM stdin;
    public          postgres    false    210   ;'                 0    16712    elements_data 
   TABLE DATA           I   COPY public.elements_data (ed_id, ed_elements_data, ed_info) FROM stdin;
    public          postgres    false    213   ?'                  0    16660    form 
   TABLE DATA           9   COPY public.form (f_id, f_type, f_type_info) FROM stdin;
    public          postgres    false    209   ?(                 0    16692    form_builder 
   TABLE DATA           e   COPY public.form_builder (fb_id, fb_type_form, fb_order_arrangement, fb_element_on_form) FROM stdin;
    public          postgres    false    211   ?(                  0    0    elements_data_ed_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.elements_data_ed_id_seq', 1, true);
          public          postgres    false    212            q           2606    16718    elements_data elements_data_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.elements_data
    ADD CONSTRAINT elements_data_pk PRIMARY KEY (ed_id);
 H   ALTER TABLE ONLY public.elements_data DROP CONSTRAINT elements_data_pk;
       public            postgres    false    213            m           2606    16675    elements elements_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pk PRIMARY KEY (e_id);
 >   ALTER TABLE ONLY public.elements DROP CONSTRAINT elements_pk;
       public            postgres    false    210            o           2606    16696    form_builder form_builder_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.form_builder
    ADD CONSTRAINT form_builder_pk PRIMARY KEY (fb_id);
 F   ALTER TABLE ONLY public.form_builder DROP CONSTRAINT form_builder_pk;
       public            postgres    false    211            j           2606    16673    form form_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.form
    ADD CONSTRAINT form_pk PRIMARY KEY (f_id);
 6   ALTER TABLE ONLY public.form DROP CONSTRAINT form_pk;
       public            postgres    false    209            k           1259    16671    elements_e_id_idx    INDEX     M   CREATE UNIQUE INDEX elements_e_id_idx ON public.elements USING btree (e_id);
 %   DROP INDEX public.elements_e_id_idx;
       public            postgres    false    210            h           1259    16665    form_f_id_idx    INDEX     E   CREATE UNIQUE INDEX form_f_id_idx ON public.form USING btree (f_id);
 !   DROP INDEX public.form_f_id_idx;
       public            postgres    false    209            r           2606    16724 )   elements purchase_e_predefined_data_ed_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.elements
    ADD CONSTRAINT purchase_e_predefined_data_ed_id FOREIGN KEY (e_predefined_data) REFERENCES public.elements_data(ed_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.elements DROP CONSTRAINT purchase_e_predefined_data_ed_id;
       public          postgres    false    213    210    3185            s           2606    16697 -   form_builder purchase_fb_element_on_form_e_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.form_builder
    ADD CONSTRAINT purchase_fb_element_on_form_e_id FOREIGN KEY (fb_element_on_form) REFERENCES public.elements(e_id);
 W   ALTER TABLE ONLY public.form_builder DROP CONSTRAINT purchase_fb_element_on_form_e_id;
       public          postgres    false    211    210    3179            t           2606    16702 '   form_builder purchase_fb_type_form_f_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.form_builder
    ADD CONSTRAINT purchase_fb_type_form_f_id FOREIGN KEY (fb_type_form) REFERENCES public.form(f_id);
 Q   ALTER TABLE ONLY public.form_builder DROP CONSTRAINT purchase_fb_type_form_f_id;
       public          postgres    false    3176    211    209               ?   x?u???0Ek{?? )0m? ????9=U*&`a?bV?ވ3B?]q?????ۦud?z???lwV	?1 .|Wx???@HxQ.d?????v???q????Y???2j?H;UӦrկ?:??y????'~)`H'??KG??????DJ?/?u(         ?   x?m?A
?P?׾SȬe??Wɖ.?07A?	\?|?!3???B?????3+?eQJ?6Ob
	?x??-ް?`)?"????Oqv?pM???!????QQ@??t?֌?A#?V?6?p??,A?(,%Ջ??q?(?2??s??i㞺x???~??T??*b?????          F   x?3??0??.6_دpaх#?\l???¦.6?h ?????.6)\l??xa7P?f?=... ?<,?            x?3?4A.# i?i?e??9??b???? 3?m     