PGDMP                      |            db_master_energo    14.9    16.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16386    db_master_energo    DATABASE     |   CREATE DATABASE db_master_energo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
     DROP DATABASE db_master_energo;
                os_admin    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                        2615    64845    Документ    SCHEMA     "   CREATE SCHEMA "Документ";
     DROP SCHEMA "Документ";
                dbmaster    false                        2615    64846    Журналы    SCHEMA         CREATE SCHEMA "Журналы";
    DROP SCHEMA "Журналы";
                dbmaster    false                        2615    64847    Константа    SCHEMA     $   CREATE SCHEMA "Константа";
 "   DROP SCHEMA "Константа";
                dbmaster    false            	            2615    64848    Настройки    SCHEMA     $   CREATE SCHEMA "Настройки";
 "   DROP SCHEMA "Настройки";
                dbmaster    false            
            2615    64849    Перечисление    SCHEMA     *   CREATE SCHEMA "Перечисление";
 (   DROP SCHEMA "Перечисление";
                dbmaster    false                        2615    64850    ПланОбмена    SCHEMA     &   CREATE SCHEMA "ПланОбмена";
 $   DROP SCHEMA "ПланОбмена";
                dbmaster    false                        2615    64851    Приложение    SCHEMA     &   CREATE SCHEMA "Приложение";
 $   DROP SCHEMA "Приложение";
                dbmaster    false                        2615    64852    Справочник    SCHEMA     &   CREATE SCHEMA "Справочник";
 $   DROP SCHEMA "Справочник";
                dbmaster    false                        3079    16396    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false    14            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �           1255    83923 =   История_ДифференцированнаяЦена()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ДифференцированнаяЦена"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ДифференцированнаяЦенаПоЧасам',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ДифференцированнаяЦенаПоЧасам',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ДифференцированнаяЦенаПоЧасам',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 b   DROP FUNCTION "Документ"."История_ДифференцированнаяЦена"();
       Документ          dbmaster    false    6            �           1255    83925 A   История_КоэффициентОМиИнфрПлатеж()    FUNCTION     �  CREATE FUNCTION "Документ"."История_КоэффициентОМиИнфрПлатеж"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','КоэффициентОМиИнфрПлатеж',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','КоэффициентОМиИнфрПлатеж',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','КоэффициентОМиИнфрПлатеж',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 f   DROP FUNCTION "Документ"."История_КоэффициентОМиИнфрПлатеж"();
       Документ          dbmaster    false    6            �           1255    83927 7   История_НерегЦенаНаМощность()    FUNCTION     �  CREATE FUNCTION "Документ"."История_НерегЦенаНаМощность"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','НерегулируемаяЦенаНаМощность',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаМощность',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаМощность',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 \   DROP FUNCTION "Документ"."История_НерегЦенаНаМощность"();
       Документ          dbmaster    false    6            �           1255    83929 5   История_НерегЦенаНаЭнергию()    FUNCTION     �  CREATE FUNCTION "Документ"."История_НерегЦенаНаЭнергию"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','НерегулируемаяЦенаНаЭнергию',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаЭнергию',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаЭнергию',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 Z   DROP FUNCTION "Документ"."История_НерегЦенаНаЭнергию"();
       Документ          dbmaster    false    6            �           1255    83931 -   История_ПачкаПоказаний()    FUNCTION     \  CREATE FUNCTION "Документ"."История_ПачкаПоказаний"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПачкаПоказаний',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПоказаний',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПоказаний',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 R   DROP FUNCTION "Документ"."История_ПачкаПоказаний"();
       Документ          dbmaster    false    6            �           1255    83933 9   История_ПачкаПрофиляМощности()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ПачкаПрофиляМощности"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПачкаПрофиляМощности',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПрофиляМощности',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПрофиляМощности',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 ^   DROP FUNCTION "Документ"."История_ПачкаПрофиляМощности"();
       Документ          dbmaster    false    6            �           1255    84205 3   История_ПерерасчетПродажи()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ПерерасчетПродажи"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПерерасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПерерасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПерерасчетДоговораПродажи',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 X   DROP FUNCTION "Документ"."История_ПерерасчетПродажи"();
       Документ          dbmaster    false    6            �           1255    83935 )   История_ПлановыеЧасы()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ПлановыеЧасы"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПлановыеЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПлановыеЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПлановыеЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 N   DROP FUNCTION "Документ"."История_ПлановыеЧасы"();
       Документ          dbmaster    false    6            �           1255    83937 #   История_Показания()    FUNCTION     4  CREATE FUNCTION "Документ"."История_Показания"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','Показания',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','Показания',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','Показания',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 H   DROP FUNCTION "Документ"."История_Показания"();
       Документ          dbmaster    false    6            �           1255    83943 /   История_ПрофильМощности()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ПрофильМощности"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПрофильМощностиРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиРегистр',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 T   DROP FUNCTION "Документ"."История_ПрофильМощности"();
       Документ          dbmaster    false    6            �           1255    83939 A   История_ПрофильМощностиГенерации()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ПрофильМощностиГенерации"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПрофильМощностиГенерацииРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиГенерацииРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиГенерацииРегистр',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 f   DROP FUNCTION "Документ"."История_ПрофильМощностиГенерации"();
       Документ          dbmaster    false    6            �           1255    83941 ;   История_ПрофильМощностиПотерь()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ПрофильМощностиПотерь"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПрофильМощностиПотерьРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиПотерьРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиПотерьРегистр',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 `   DROP FUNCTION "Документ"."История_ПрофильМощностиПотерь"();
       Документ          dbmaster    false    6            �           1255    83945 ;   История_РасчетДоговораПродажи()    FUNCTION     �  CREATE FUNCTION "Документ"."История_РасчетДоговораПродажи"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','РасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РасчетДоговораПродажи',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 `   DROP FUNCTION "Документ"."История_РасчетДоговораПродажи"();
       Документ          dbmaster    false    6            �           1255    83947 =   История_РеализацияТоваровУслуг()    FUNCTION     �  CREATE FUNCTION "Документ"."История_РеализацияТоваровУслуг"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','РеализацияТоваровУслуг',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РеализацияТоваровУслуг',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РеализацияТоваровУслуг',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 b   DROP FUNCTION "Документ"."История_РеализацияТоваровУслуг"();
       Документ          dbmaster    false    6            �           1255    83949 1   История_СбытоваяНадбавка()    FUNCTION     l  CREATE FUNCTION "Документ"."История_СбытоваяНадбавка"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','СбытоваяНадбавка',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СбытоваяНадбавка',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СбытоваяНадбавка',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 V   DROP FUNCTION "Документ"."История_СбытоваяНадбавка"();
       Документ          dbmaster    false    6            �           1255    83951 7   История_СкидкаТочкиПоставки()    FUNCTION     �  CREATE FUNCTION "Документ"."История_СкидкаТочкиПоставки"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','СкидкаТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СкидкаТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СкидкаТочкиПоставки',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 \   DROP FUNCTION "Документ"."История_СкидкаТочкиПоставки"();
       Документ          dbmaster    false    6            �           1255    83953 =   История_СчетНаОплатуПокупателю()    FUNCTION     �  CREATE FUNCTION "Документ"."История_СчетНаОплатуПокупателю"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','СчетНаОплатуПокупателю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СчетНаОплатуПокупателю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СчетНаОплатуПокупателю',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 b   DROP FUNCTION "Документ"."История_СчетНаОплатуПокупателю"();
       Документ          dbmaster    false    6            �           1255    83955 7   История_ЧасыПиковойНагрузки()    FUNCTION     �  CREATE FUNCTION "Документ"."История_ЧасыПиковойНагрузки"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 \   DROP FUNCTION "Документ"."История_ЧасыПиковойНагрузки"();
       Документ          dbmaster    false    6            j           1255    64853 )   Организации_Обновить()    FUNCTION     �  CREATE FUNCTION "Журналы"."Организации_Обновить"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO "Журналы"."ЖурналОбновления" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
(current_user,current_timestamp,NEW."id",'Настройки','Организации','UPDATE',NEW."ПометкаУдаления");
return NEW;

END;
$$;
 L   DROP FUNCTION "Журналы"."Организации_Обновить"();
       Журналы          dbmaster    false    7            k           1255    64854 2   ПользовательБлокировки(uuid)    FUNCTION     �  CREATE FUNCTION "Журналы"."ПользовательБлокировки"(doclink uuid) RETURNS TABLE(var1 timestamp without time zone, var2 text)
    LANGUAGE plpgsql
    AS $$

BEGIN
    RETURN QUERY 
    select "Дата","Пользователь" from "Журналы"."ЖурналОбновления" 

where "Дата" = (select max("Дата")  from "Журналы"."ЖурналОбновления" where "Ссылка" = doclink)

and "Ссылка" = doclink

         ;
END;
$$;
 ]   DROP FUNCTION "Журналы"."ПользовательБлокировки"(doclink uuid);
       Журналы          dbmaster    false    7            l           1255    64855 )   Организации_Добавить() 	   PROCEDURE     3  CREATE PROCEDURE "Настройки"."Организации_Добавить"()
    LANGUAGE plpgsql
    AS $$

begin



INSERT INTO "Настройки"."Организации" ( "НаименованиеКраткое" ) 

		    values ('Новая организация'); 



   -- commit;

end;$$;
 Q   DROP PROCEDURE "Настройки"."Организации_Добавить"();
       Настройки          dbmaster    false    9            m           1255    64856 /   Организации_Заполнить(uuid)    FUNCTION     U  CREATE FUNCTION "Настройки"."Организации_Заполнить"(prof uuid) RETURNS TABLE(var1 boolean, var2 text, var3 text, var4 text, var5 text, var6 text, var7 text, var8 date, var9 text, var10 text, var11 text, var12 text, var13 text, var14 text, var15 text, var16 text, var17 text, var18 text, var19 text, var20 text, var21 text, var22 text, var23 text, var24 text, var25 text)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select

    "ОрганизацияПоУмолчанию" ,

    "НаименованиеКраткое" ,

    "НаименованиеПолное" ,

    "НаименованиеДляПечати" ,	

	

    "ИНН" ,

    "КПП" ,

    "ОГРН" ,

    



    

    "ДатаРегистрации"  ,

    "Банк" ,

    

    "НомерСчета",

    "ЮридическийАдрес" ,

    "ПочтовыйАдрес" ,

    "ФактическийАдрес" ,

    "Телефон" ,    

	    "ЭлектроннаяПочта",

	

	    "РуководительФио" ,

	    "РуководительДолжность" ,

	    "РуководительДоверенность" ,



		    "БухгалтерФио",

	    "БухгалтерДолжность" ,

	    "БухгалтерДоверенность" ,

	    "КассирФио" ,

	    "КассирДолжность" ,

	    "КассирДоверенность" ,

	

	

   "Префикс" 	

           

    FROM "Настройки"."Организации"  where "ПометкаУдаления" = false

    and id = prof

         ;

END;

$$;
 [   DROP FUNCTION "Настройки"."Организации_Заполнить"(prof uuid);
       Настройки          dbmaster    false    9            n           1255    64857 �   Организации_Обновить(boolean, text, text, text, text, text, text, date, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, uuid) 	   PROCEDURE     �  CREATE PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid)
    LANGUAGE plpgsql
    AS $$

begin

		   

	UPDATE  "Настройки"."Организации"  set 

    "ОрганизацияПоУмолчанию"    = var1,

    "НаименованиеКраткое"       = var2,

    "НаименованиеПолное"        = var3,

    "НаименованиеДляПечати"     = var4,	

    "ИНН"                       = var5,

    "КПП"                       = var6,

    "ОГРН"                      = var7,

    "ДатаРегистрации"           = var8,

    "Банк"                      = var9,

    "НомерСчета"                = var10,

    "ЮридическийАдрес"          = var11,

    "ПочтовыйАдрес"             = var12,

    "ФактическийАдрес"          = var13,

    "Телефон"                   = var14,    

    "ЭлектроннаяПочта"          = var15,

    "РуководительФио"           = var16,

    "РуководительДолжность"     = var17,

    "РуководительДоверенность"  = var18,

    "БухгалтерФио"              = var19,

    "БухгалтерДолжность"        = var20,

    "БухгалтерДоверенность"     = var21,

    "КассирФио"                 = var22,

    "КассирДолжность"           = var23,

    "КассирДоверенность"        = var24,

    "Префикс" 	                = var25

    WHERE "id" = var26	 

   ;

		   



end;$$;
 �  DROP PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid);
       Настройки          dbmaster    false    9            o           1255    64858 �   Организации_Обновить(boolean, text, text, text, text, text, text, date, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, uuid, text, text) 	   PROCEDURE     U  CREATE PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid, IN var27 text, IN var28 text)
    LANGUAGE plpgsql
    AS $$

begin

		   

	UPDATE  "Настройки"."Организации"  set 

    "ОрганизацияПоУмолчанию"    = var1,

    "НаименованиеКраткое"       = var2,

    "НаименованиеПолное"        = var3,

    "НаименованиеДляПечати"     = var4,	

    "ИНН"                       = var5,

    "КПП"                       = var6,

    "ОГРН"                      = var7,

    "ДатаРегистрации"           = var8,

    "Банк"                      = var9,

    "НомерСчета"                = var10,

    "ЮридическийАдрес"          = var11,

    "ПочтовыйАдрес"             = var12,

    "ФактическийАдрес"          = var13,

    "Телефон"                   = var14,    

    "ЭлектроннаяПочта"          = var15,

    "РуководительФио"           = var16,

    "РуководительДолжность"     = var17,

    "РуководительДоверенность"  = var18,

    "БухгалтерФио"              = var19,

    "БухгалтерДолжность"        = var20,

    "БухгалтерДоверенность"     = var21,

    "КассирФио"                 = var22,

    "КассирДолжность"           = var23,

    "КассирДоверенность"        = var24,

    "Префикс" 	                = var25,
    "Бик" 	                = var27,
    "КорСчет" 	                = var28
    

    WHERE "id" = var26	 

   ;

		   



end;$$;
 �  DROP PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid, IN var27 text, IN var28 text);
       Настройки          dbmaster    false    9            p           1255    64859 )   Организации_Получить()    FUNCTION     �  CREATE FUNCTION "Настройки"."Организации_Получить"() RETURNS TABLE(var1 uuid, var2 text, var3 boolean)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select id,

 

    "НаименованиеКраткое" ,

     "ОрганизацияПоУмолчанию" 

           

    FROM "Настройки"."Организации"  where "ПометкаУдаления" = false



         ;

END;

$$;
 P   DROP FUNCTION "Настройки"."Организации_Получить"();
       Настройки          dbmaster    false    9            q           1255    64860 +   Организации_Удалить(uuid) 	   PROCEDURE       CREATE PROCEDURE "Настройки"."Организации_Удалить"(IN prof uuid)
    LANGUAGE plpgsql
    AS $$

begin



	UPDATE "Настройки"."Организации" set "ПометкаУдаления"=true WHERE "id" = prof;

	



end;$$;
 [   DROP PROCEDURE "Настройки"."Организации_Удалить"(IN prof uuid);
       Настройки          dbmaster    false    9            r           1255    64861 '   Организации_Файлы(uuid)    FUNCTION     f  CREATE FUNCTION "Настройки"."Организации_Файлы"(prof uuid) RETURNS TABLE(var1 bytea, var2 text, var3 bytea, var4 text, var5 bytea, var6 text, var7 bytea, var8 text, var9 bytea, var10 text)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select

  	 "ЛоготипФайл" ,

     "ЛоготипНаименование" ,



	 "ЯрлыкФайл",

     "ЯрлыкНаименование" ,

	

     "ПечатьФайл" ,

     "ПечатьНаименование" ,

	

	 "ПодписьРукФайл" ,

     "ПодписьРукНаименование" ,



	 "ПодписьБухФайл" ,

     "ПодписьБухНаименование"

    	

           

    FROM "Настройки"."Организации"  where "ПометкаУдаления" = false

    and id = prof

         ;

END;

$$;
 S   DROP FUNCTION "Настройки"."Организации_Файлы"(prof uuid);
       Настройки          dbmaster    false    9            s           1255    64862 %   Профиль_Получить(uuid)    FUNCTION     �  CREATE FUNCTION "Настройки"."Профиль_Получить"(defprof uuid) RETURNS TABLE(var1 boolean, var2 text, var3 text, var4 text, var5 boolean, var6 text, var7 boolean, var8 text, var9 text, var10 text, var11 boolean, var12 boolean, var13 numeric, var14 text, var15 text, var16 text, var17 text, var18 text)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select

       "ПрофильПоУмолчанию",

       "Наименование",

       "Тема",

       "КаталогОтчетов",

       "КаталогОтчетовИспользовать",

       "КаталогАктовИСчетов",

       "КаталогАктовИСчетовИспользовать",

       "ПрограммаXLSX",

       "ПрограммаDOCX",

       "ПрограммаPDF",

       "ПротоколPOP3",

       "ПротоколIMAP",

       "Порт",

       "МетодАутентификации",

       "ЗащитаСоединения",

       "ИмяДоступа",

       "ПарольДоступа" ,

       "Сервер" 

           

    FROM "Настройки"."ПрофильПользователя"  where "id" = defprof 



         ;

END;

$$;
 T   DROP FUNCTION "Настройки"."Профиль_Получить"(defprof uuid);
       Настройки          dbmaster    false    9            t           1255    64863 L   ПрофильПользователя_Добавить(text, boolean, uuid) 	   PROCEDURE     �  CREATE PROCEDURE "Настройки"."ПрофильПользователя_Добавить"(IN nameprof text, IN bydefault boolean, IN username uuid)
    LANGUAGE plpgsql
    AS $$
begin

INSERT INTO "Настройки"."ПрофильПользователя" (
            "Наименование" ,
            "ПрофильПоУмолчанию",
	        "Пользователь"
                       ) 
		    values (nameprof, bydefault,username); 

   -- commit;
end;$$;
 �   DROP PROCEDURE "Настройки"."ПрофильПользователя_Добавить"(IN nameprof text, IN bydefault boolean, IN username uuid);
       Настройки          dbmaster    false    9            u           1255    64864 ?   ПрофильПользователя_Заполнить(uuid)    FUNCTION     #  CREATE FUNCTION "Настройки"."ПрофильПользователя_Заполнить"(defuser uuid) RETURNS TABLE(var1 uuid, var2 text, var3 boolean)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      SELECT

         id,

         "Наименование",

         "ПрофильПоУмолчанию"  

         FROM "Настройки"."ПрофильПользователя"  

         where  "ПометкаУдаления" = false

         and "Пользователь" = defuser 

         ;

END;

$$;
 n   DROP FUNCTION "Настройки"."ПрофильПользователя_Заполнить"(defuser uuid);
       Настройки          dbmaster    false    9            v           1255    64865 �   ПрофильПользователя_Обновить(text, boolean, text, text, boolean, text, boolean, text, text, text, boolean, boolean, integer, text, text, text, text, text, uuid) 	   PROCEDURE     I	  CREATE PROCEDURE "Настройки"."ПрофильПользователя_Обновить"(IN var1 text, IN var2 boolean, IN var3 text, IN var4 text, IN var5 boolean, IN var6 text, IN var7 boolean, IN var8 text, IN var9 text, IN var10 text, IN var11 boolean, IN var12 boolean, IN var13 integer, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 uuid)
    LANGUAGE plpgsql
    AS $$

begin

		   

	UPDATE "Настройки"."ПрофильПользователя" 

                               set "Наименование"                     = var1,

                                   "ПрофильПоУмолчанию"               = var2,

                                   "Тема"                             = var3,

                                   "КаталогОтчетов"                   = var4,

                                   "КаталогОтчетовИспользовать"       = var5,

                                   "КаталогАктовИСчетов"              = var6,

                                   "КаталогАктовИСчетовИспользовать"  = var7,

                                   "ПрограммаXLSX"                    = var8,

                                   "ПрограммаDOCX"                    = var9,

                                   "ПрограммаPDF"                     = var10,

                                   "ПротоколPOP3"                     = var11,

                                   "ПротоколIMAP"                     = var12,

                                   "Порт"                             = var13,

                                   "МетодАутентификации"              = var14,

                                   "ЗащитаСоединения"                 = var15,

                                   "ИмяДоступа"                       = var16,

                                   "ПарольДоступа"                    = var17,

                                   "Сервер"                           = var18

                                    WHERE "id"                        = var19	 

                                    

                                    ;

		   

		   

		   

		   -- commit;

end;$$;
 �  DROP PROCEDURE "Настройки"."ПрофильПользователя_Обновить"(IN var1 text, IN var2 boolean, IN var3 text, IN var4 text, IN var5 boolean, IN var6 text, IN var7 boolean, IN var8 text, IN var9 text, IN var10 text, IN var11 boolean, IN var12 boolean, IN var13 integer, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 uuid);
       Настройки          dbmaster    false    9            w           1255    64866 ;   ПрофильПользователя_Удалить(uuid) 	   PROCEDURE     &  CREATE PROCEDURE "Настройки"."ПрофильПользователя_Удалить"(IN prof uuid)
    LANGUAGE plpgsql
    AS $$

begin



	UPDATE "Настройки"."ПрофильПользователя" set "ПометкаУдаления"=true WHERE "id" = prof;

	



end;$$;
 k   DROP PROCEDURE "Настройки"."ПрофильПользователя_Удалить"(IN prof uuid);
       Настройки          dbmaster    false    9            x           1255    64867    addnewprofile(text) 	   PROCEDURE     
  CREATE PROCEDURE "Справочник".addnewprofile(IN prname text)
    LANGUAGE plpgsql
    AS $$  

BEGIN         

   INSERT INTO "Настройки"."ПрофильПользователя" ("Наименование") VALUES   

    (prName) ;  

END  

$$;
 E   DROP PROCEDURE "Справочник".addnewprofile(IN prname text);
       Справочник          dbmaster    false    13            z           1255    83584    История_ГП()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_ГП"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	
    opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ГарантирующиеПоставщики',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	
    opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ГарантирующиеПоставщики',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ГарантирующиеПоставщики',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 >   DROP FUNCTION "Справочник"."История_ГП"();
       Справочник          dbmaster    false    13            {           1255    83586 8   История_ДоговорКонтрагента1С()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_ДоговорКонтрагента1С"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ДоговорКонтрагента1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорКонтрагента1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорКонтрагента1С',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 a   DROP FUNCTION "Справочник"."История_ДоговорКонтрагента1С"();
       Справочник          dbmaster    false    13            |           1255    83588 -   История_ДоговорПродажи()    FUNCTION     l  CREATE FUNCTION "Справочник"."История_ДоговорПродажи"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ДоговорПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорПродажи',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 V   DROP FUNCTION "Справочник"."История_ДоговорПродажи"();
       Справочник          dbmaster    false    13            �           1255    84025 3   История_ЗакрытыйПериодДПР()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_ЗакрытыйПериодДПР"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ЗакрытыйПериодДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ЗакрытыйПериодДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ЗакрытыйПериодДоговораПродажи',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;
 \   DROP FUNCTION "Справочник"."История_ЗакрытыйПериодДПР"();
       Справочник          dbmaster    false    13            y           1255    83582 %   История_Контрагент()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_Контрагент"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (TG_OP = 'DELETE') THEN
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','Контрагенты','DELETE',false);
ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты','UPDATE',NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты','INSERT',NEW."DeletionMark");
END IF;

return NEW;

END;
$$;
 N   DROP FUNCTION "Справочник"."История_Контрагент"();
       Справочник          dbmaster    false    13            }           1255    83590 *   История_Контрагенты1С()    FUNCTION     `  CREATE FUNCTION "Справочник"."История_Контрагенты1С"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','Контрагенты1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты1С',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 S   DROP FUNCTION "Справочник"."История_Контрагенты1С"();
       Справочник          dbmaster    false    13            ~           1255    83592 5   История_МодельПрибораУчета()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_МодельПрибораУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','МодельПрибораУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','МодельПрибораУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','МодельПрибораУчета',opt_var,NEW."DeletionMark");

END IF;




return NEW;

END;
$$;
 ^   DROP FUNCTION "Справочник"."История_МодельПрибораУчета"();
       Справочник          dbmaster    false    13                       1255    83594 )   История_ОбъектыУчета()    FUNCTION     \  CREATE FUNCTION "Справочник"."История_ОбъектыУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ОбъектыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ОбъектыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ОбъектыУчета',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 R   DROP FUNCTION "Справочник"."История_ОбъектыУчета"();
       Справочник          dbmaster    false    13            �           1255    83596 3   История_ПремияПотребителю()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_ПремияПотребителю"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ПремияПотребителю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителю',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 \   DROP FUNCTION "Справочник"."История_ПремияПотребителю"();
       Справочник          dbmaster    false    13            �           1255    83598 ?   История_ПремияПотребителюАгента()    FUNCTION     �  CREATE FUNCTION "Справочник"."История_ПремияПотребителюАгента"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ПремияПотребителюАгента',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителюАгента',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителюАгента',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 h   DROP FUNCTION "Справочник"."История_ПремияПотребителюАгента"();
       Справочник          dbmaster    false    13            �           1255    83600 )   История_ПриборыУчета()    FUNCTION     \  CREATE FUNCTION "Справочник"."История_ПриборыУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ПриборыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПриборыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПриборыУчета',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 R   DROP FUNCTION "Справочник"."История_ПриборыУчета"();
       Справочник          dbmaster    false    13            �           1255    83602    История_Регион()    FUNCTION     ,  CREATE FUNCTION "Справочник"."История_Регион"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','Регион',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Регион',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Регион',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 F   DROP FUNCTION "Справочник"."История_Регион"();
       Справочник          dbmaster    false    13            �           1255    83604 +   История_ТочкиПоставки()    FUNCTION     d  CREATE FUNCTION "Справочник"."История_ТочкиПоставки"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиПоставки',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 T   DROP FUNCTION "Справочник"."История_ТочкиПоставки"();
       Справочник          dbmaster    false    13            �           1255    83606 %   История_ТочкиУчета()    FUNCTION     L  CREATE FUNCTION "Справочник"."История_ТочкиУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ТочкиУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиУчета',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;
 N   DROP FUNCTION "Справочник"."История_ТочкиУчета"();
       Справочник          dbmaster    false    13            !           1259    83397 
   Агент    TABLE     '  CREATE TABLE "Документ"."Агент" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "Code" bigint NOT NULL,
    "Договор" uuid,
    "ОбъектУчета" uuid,
    "ТочкаПоставки" uuid,
    "РасчетДоговора" uuid,
    "ДопСоглашение" uuid,
    "ЦК1" numeric(14,9) DEFAULT 0,
    "ЦК2" numeric(14,9) DEFAULT 0,
    "ЦК3" numeric(14,9) DEFAULT 0,
    "ЦК4" numeric(14,9) DEFAULT 0,
    "пСБН" numeric(14,9) DEFAULT 0,
    "СуммарныйОбъем" numeric DEFAULT 0,
    "Объем" numeric DEFAULT 0,
    "ЦенаГП" numeric DEFAULT 0,
    "ПремияСумма" numeric DEFAULT 0,
    "Цена" numeric DEFAULT 0,
    "ЦенаСоСкидкой" numeric DEFAULT 0,
    "Коэффициент" numeric DEFAULT 0,
    "Скидка" numeric DEFAULT 0,
    "ПоДоговору" boolean,
    "Формула" text
);
 ,   DROP TABLE "Документ"."Агент";
       Документ         heap    dbmaster    false    6                        1259    83396    Агент_Code_seq    SEQUENCE     �   ALTER TABLE "Документ"."Агент" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."Агент_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    289    6            �            1259    64868 :   ДифференцированнаяЦенаПоЧасам    TABLE     W  CREATE TABLE "Документ"."ДифференцированнаяЦенаПоЧасам" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Number" text,
    "ПериодРасчета" timestamp without time zone,
    "ГарантирующийПоставщик" uuid,
    "Параметры" jsonb
);
 \   DROP TABLE "Документ"."ДифференцированнаяЦенаПоЧасам";
       Документ         heap    dbmaster    false    6            �            1259    64874    ЖурналЗаписи    TABLE     p  CREATE TABLE "Документ"."ЖурналЗаписи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "НомерОбъекта" uuid,
    "КодОбъекта" text,
    "СхемаОбъекта" text,
    "НазваниеОбъекта" text,
    "Данные" jsonb,
    "Пользователь" text
);
 :   DROP TABLE "Документ"."ЖурналЗаписи";
       Документ         heap    dbmaster    false    6            �            1259    64880 0   КоэффициентОМиИнфрПлатеж    TABLE     -  CREATE TABLE "Документ"."КоэффициентОМиИнфрПлатеж" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ДатаПериода" timestamp without time zone,
    "КоэффициентОплатыМощности" numeric(21,17),
    "ИнфраструктурныйПлатеж" numeric(14,4),
    "ГарантирующийПоставщик" uuid,
    "ВеличинаИзмененияЦК1" numeric DEFAULT 0
);
 R   DROP TABLE "Документ"."КоэффициентОМиИнфрПлатеж";
       Документ         heap    dbmaster    false    6            �            1259    64886 8   НерегулируемаяЦенаНаМощность    TABLE     �  CREATE TABLE "Документ"."НерегулируемаяЦенаНаМощность" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ГарантирующийПоставщик" uuid,
    "ДатаПериода" timestamp without time zone,
    "Цена" numeric(15,4)
);
 Z   DROP TABLE "Документ"."НерегулируемаяЦенаНаМощность";
       Документ         heap    dbmaster    false    6            �            1259    64892 6   НерегулируемаяЦенаНаЭнергию    TABLE     �  CREATE TABLE "Документ"."НерегулируемаяЦенаНаЭнергию" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ГарантирующийПоставщик" uuid,
    "ДатаПериода" timestamp without time zone,
    "Цена" numeric(15,4)
);
 X   DROP TABLE "Документ"."НерегулируемаяЦенаНаЭнергию";
       Документ         heap    dbmaster    false    6            �            1259    64898    ОбъемПоставщика    TABLE     �  CREATE TABLE "Документ"."ОбъемПоставщика" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "Объем" numeric(14,5),
    "ПриборУчета" uuid,
    "Комментарий" text
);
 @   DROP TABLE "Документ"."ОбъемПоставщика";
       Документ         heap    dbmaster    false    6                       1259    81921    ПачкаПоказаний    TABLE       CREATE TABLE "Документ"."ПачкаПоказаний" (
    id uuid NOT NULL,
    "DeletionMark" boolean,
    "Номер" bigint NOT NULL,
    "Дата" timestamp without time zone,
    "ПериодРасчета" timestamp without time zone
);
 >   DROP TABLE "Документ"."ПачкаПоказаний";
       Документ         heap    dbmaster    false    6                       1259    81920 +   ПачкаПоказаний_Номер_seq    SEQUENCE     !  ALTER TABLE "Документ"."ПачкаПоказаний" ALTER COLUMN "Номер" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."ПачкаПоказаний_Номер_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    6    285                       1259    74607 (   ПачкаПрофиляМощности    TABLE     .  CREATE TABLE "Документ"."ПачкаПрофиляМощности" (
    id uuid NOT NULL,
    "DeletionMark" boolean,
    "Номер" bigint NOT NULL,
    "Дата" timestamp without time zone,
    "ПериодРасчета" timestamp without time zone,
    "ТипПрофиля" text
);
 J   DROP TABLE "Документ"."ПачкаПрофиляМощности";
       Документ         heap    dbmaster    false    6                       1259    74606 7   ПачкаПрофиляМощности_Номер_seq    SEQUENCE     9  ALTER TABLE "Документ"."ПачкаПрофиляМощности" ALTER COLUMN "Номер" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."ПачкаПрофиляМощности_Номер_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    283    6            (           1259    84190 2   ПерерасчетДоговораПродажи    TABLE     j  CREATE TABLE "Документ"."ПерерасчетДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "НаименованиеДоговораПродажи" text,
    "ДоговорПродажи" uuid,
    "ОбъектыУчета" jsonb,
    "ТочкиПоставки" jsonb,
    "ТочкиУчета" jsonb,
    "ПриборыУчета" jsonb,
    "РезультатРасчета" jsonb,
    "Ошибки" jsonb,
    "СуммаРасчета" numeric,
    "СуммаПерерасчета" numeric,
    "Статус" boolean,
    "НаличиеОшибок" text,
    "Number" bigint NOT NULL,
    "ТипДоговора" text DEFAULT ''::text,
    "НовыйТипДоговора" text DEFAULT ''::text,
    "ФормаВедомости" text DEFAULT ''::text,
    "СтавкаНДС" numeric DEFAULT 0,
    "НоваяСтавкаНДС" numeric DEFAULT 0,
    "ИтогоОбъем" numeric,
    "ИтогоНовыйОбъем" numeric,
    "ПремияПоДоговору" boolean,
    "ПремияДоп" uuid,
    "ПремияКоэффициент" numeric DEFAULT 0,
    "ПремияФормула" text,
    "ПремияПримечание" text,
    "АгентПоДоговору" boolean,
    "АгентДоп" uuid,
    "АгентКоэффициент" numeric DEFAULT 0,
    "АгентФормула" text,
    "АгентПримечание" text
);
 T   DROP TABLE "Документ"."ПерерасчетДоговораПродажи";
       Документ         heap    dbmaster    false    6            '           1259    84189 =   ПерерасчетДоговораПродажи_Number_seq    SEQUENCE     E  ALTER TABLE "Документ"."ПерерасчетДоговораПродажи" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."ПерерасчетДоговораПродажи_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    6    296            �            1259    64904 6   ПлановыеЧасыПиковойНагрузки    TABLE     �  CREATE TABLE "Документ"."ПлановыеЧасыПиковойНагрузки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Number" text,
    "ДатаПериода" timestamp without time zone,
    "ЦеноваяЗона" text,
    "Интервал1_ЧасОт" numeric(15,4),
    "Интервал1_ЧасДо" numeric(15,4),
    "Интервал2_ЧасОт" numeric(15,4),
    "Интервал2_ЧасДо" numeric(15,4)
);
 X   DROP TABLE "Документ"."ПлановыеЧасыПиковойНагрузки";
       Документ         heap    dbmaster    false    6            �            1259    64910    Показания    TABLE     �  CREATE TABLE "Документ"."Показания" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "ПоказанияНачала" numeric(14,5) DEFAULT 0,
    "ПоказанияОкончание" numeric(14,5) DEFAULT 0,
    "УсловноПостоянныеПотери" numeric(14,5) DEFAULT 0,
    "НагрузочныеПотери" numeric(14,5) DEFAULT 0,
    "ПриборУчета" uuid,
    "Коэффициент" integer DEFAULT 0,
    "ДеньНачало" numeric(14,5) DEFAULT 0,
    "ДеньКонец" numeric(14,5) DEFAULT 0,
    "НочьНачало" numeric(14,5) DEFAULT 0,
    "НочьКонец" numeric(14,5) DEFAULT 0,
    "ПикНачало" numeric(14,5) DEFAULT 0,
    "ПикКонец" numeric(14,5) DEFAULT 0,
    "ПолуПикНачало" numeric(14,5) DEFAULT 0,
    "ПолуПикКонец" numeric(14,5) DEFAULT 0,
    "Пачка" uuid,
    "НагрузочныеПокупка" numeric(14,5) DEFAULT 0,
    "УсловноПостоянныеПокупка" numeric(14,5) DEFAULT 0,
    "НагрузочныеПокупкаДОУП" numeric(14,5) DEFAULT 0,
    "ПостоянныеПокупкаДОУП" numeric(14,5) DEFAULT 0,
    "ДопНачисление" numeric(14,5) DEFAULT 0
);
 4   DROP TABLE "Документ"."Показания";
       Документ         heap    dbmaster    false    6                       1259    83377    Премия    TABLE     )  CREATE TABLE "Документ"."Премия" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "Code" bigint NOT NULL,
    "Договор" uuid,
    "ОбъектУчета" uuid,
    "ТочкаПоставки" uuid,
    "РасчетДоговора" uuid,
    "ДопСоглашение" uuid,
    "ЦК1" numeric(14,9) DEFAULT 0,
    "ЦК2" numeric(14,9) DEFAULT 0,
    "ЦК3" numeric(14,9) DEFAULT 0,
    "ЦК4" numeric(14,9) DEFAULT 0,
    "пСБН" numeric(14,9) DEFAULT 0,
    "СуммарныйОбъем" numeric DEFAULT 0,
    "Объем" numeric DEFAULT 0,
    "ЦенаГП" numeric DEFAULT 0,
    "ПремияСумма" numeric DEFAULT 0,
    "Цена" numeric DEFAULT 0,
    "ЦенаСоСкидкой" numeric DEFAULT 0,
    "Коэффициент" numeric DEFAULT 0,
    "Скидка" numeric DEFAULT 0,
    "ПоДоговору" boolean,
    "Формула" text
);
 .   DROP TABLE "Документ"."Премия";
       Документ         heap    dbmaster    false    6                       1259    83376    Премия_Code_seq    SEQUENCE     �   ALTER TABLE "Документ"."Премия" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."Премия_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    287    6            2           1259    95580    ПрофильДКП    TABLE     �  CREATE TABLE "Документ"."ПрофильДКП" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 6   DROP TABLE "Документ"."ПрофильДКП";
       Документ         heap    dbmaster    false    6            4           1259    95596    ПрофильДКПРГ    TABLE     �  CREATE TABLE "Документ"."ПрофильДКПРГ" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 :   DROP TABLE "Документ"."ПрофильДКПРГ";
       Документ         heap    dbmaster    false    6            3           1259    95588    ПрофильДОУП    TABLE     �  CREATE TABLE "Документ"."ПрофильДОУП" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 8   DROP TABLE "Документ"."ПрофильДОУП";
       Документ         heap    dbmaster    false    6            1           1259    95572    ПрофильДЭС    TABLE     �  CREATE TABLE "Документ"."ПрофильДЭС" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 6   DROP TABLE "Документ"."ПрофильДЭС";
       Документ         heap    dbmaster    false    6            :           1259    183910 (   ПрофильДопНачисление    TABLE     �  CREATE TABLE "Документ"."ПрофильДопНачисление" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean DEFAULT false,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 J   DROP TABLE "Документ"."ПрофильДопНачисление";
       Документ         heap    dbmaster    false    6            �            1259    64927 >   ПрофильМощностиГенерацииРегистр    TABLE     �  CREATE TABLE "Документ"."ПрофильМощностиГенерацииРегистр" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 `   DROP TABLE "Документ"."ПрофильМощностиГенерацииРегистр";
       Документ         heap    dbmaster    false    6            �            1259    64935 8   ПрофильМощностиПотерьРегистр    TABLE     �  CREATE TABLE "Документ"."ПрофильМощностиПотерьРегистр" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 Z   DROP TABLE "Документ"."ПрофильМощностиПотерьРегистр";
       Документ         heap    dbmaster    false    6            �            1259    64943 ,   ПрофильМощностиРегистр    TABLE     �  CREATE TABLE "Документ"."ПрофильМощностиРегистр" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 N   DROP TABLE "Документ"."ПрофильМощностиРегистр";
       Документ         heap    dbmaster    false    6            5           1259    95604    ПрофильОРЭМ    TABLE     �  CREATE TABLE "Документ"."ПрофильОРЭМ" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);
 8   DROP TABLE "Документ"."ПрофильОРЭМ";
       Документ         heap    dbmaster    false    6            /           1259    91729 *   РасчетДоговораПокупки    TABLE     b  CREATE TABLE "Документ"."РасчетДоговораПокупки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "НаименованиеДоговораПокупки" text,
    "ДоговорПокупки" uuid,
    "ТочкиПоставки" jsonb,
    "ТочкиУчета" jsonb,
    "ПриборыУчета" jsonb,
    "РезультатРасчета" jsonb,
    "Ошибки" jsonb,
    "СуммаРасчета" numeric,
    "Статус" boolean,
    "НаличиеОшибок" text,
    "Number" bigint NOT NULL,
    "ТипДоговора" text DEFAULT ''::text,
    "СтавкаНДС" numeric DEFAULT 0,
    "ИтогоОбъем" numeric,
    "ПрименитьСкидкуКДоговору" boolean DEFAULT false,
    "СуммироватьПрофиль" boolean DEFAULT false,
    "СуммироватьПрофильПоДоговору" boolean DEFAULT false
);
 L   DROP TABLE "Документ"."РасчетДоговораПокупки";
       Документ         heap    dbmaster    false    6            0           1259    91737 5   РасчетДоговораПокупки_number_seq    SEQUENCE     5  ALTER TABLE "Документ"."РасчетДоговораПокупки" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."РасчетДоговораПокупки_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    6    303            �            1259    64951 *   РасчетДоговораПродажи    TABLE     �  CREATE TABLE "Документ"."РасчетДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "НаименованиеДоговораПродажи" text,
    "ДоговорПродажи" uuid,
    "ОбъектыУчета" jsonb,
    "ТочкиПоставки" jsonb,
    "ТочкиУчета" jsonb,
    "ПриборыУчета" jsonb,
    "РезультатРасчета" jsonb,
    "Ошибки" jsonb,
    "СуммаРасчета" numeric,
    "Статус" boolean,
    "НаличиеОшибок" text,
    "Number" bigint NOT NULL,
    "ТипДоговора" text DEFAULT ''::text,
    "ФормаВедомости" text DEFAULT ''::text,
    "СтавкаНДС" numeric DEFAULT 0,
    "ИтогоОбъем" numeric,
    "ПремияПоДоговору" boolean,
    "ПремияДоп" uuid,
    "ПремияКоэффициент" numeric DEFAULT 0,
    "ПремияФормула" text,
    "ПремияПримечание" text,
    "АгентПоДоговору" boolean,
    "АгентДоп" uuid,
    "АгентКоэффициент" numeric DEFAULT 0,
    "АгентФормула" text,
    "АгентПримечание" text
);
 L   DROP TABLE "Документ"."РасчетДоговораПродажи";
       Документ         heap    dbmaster    false    6            �            1259    64960 5   РасчетДоговораПродажи_number_seq    SEQUENCE     5  ALTER TABLE "Документ"."РасчетДоговораПродажи" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."РасчетДоговораПродажи_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    6    229            �            1259    64961 ,   РеализацияТоваровУслуг    TABLE     �  CREATE TABLE "Документ"."РеализацияТоваровУслуг" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Контрагент" uuid,
    "ДоговорКонтрагента" uuid,
    "СуммаВключаетНДС" boolean,
    "СчетНаОплатуПокупателю" uuid,
    "СуммаДокумента" numeric(22,5),
    "Комментарий" text,
    "РучнаяКорректировка" boolean,
    "Руководитель" text,
    "ГлавныйБухгалтер" text,
    "ДокументБезНДС" boolean,
    "ЗаРуководителяНаОсновании" text,
    "ЗаГлавногоБухгалтераНаОсновании" text,
    "Товары" jsonb,
    "ДоговорПродажи" uuid,
    "ДокументРасчета" uuid,
    "Number" bigint NOT NULL,
    "РуководительДолжность" text,
    "БухгалтерДолжность" text,
    "Date" timestamp without time zone,
    "СтавкаНДС" numeric,
    "ПодписьРуководителя" text,
    "ПодписьБухгалтера" text,
    "ПечатьПредприятия" text
);
 N   DROP TABLE "Документ"."РеализацияТоваровУслуг";
       Документ         heap    dbmaster    false    6            �            1259    64967 7   РеализацияТоваровУслуг_Number_seq    SEQUENCE     9  ALTER TABLE "Документ"."РеализацияТоваровУслуг" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."РеализацияТоваровУслуг_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    231    6            �            1259    64968     СбытоваяНадбавка    TABLE       CREATE TABLE "Документ"."СбытоваяНадбавка" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ГарантирующийПоставщик" uuid,
    "ДатаНачалоПериода" timestamp without time zone,
    "ДатаОкончанияПериода" timestamp without time zone,
    "До670кВт" numeric(15,4),
    "От670кВтДо10МВт" numeric(15,4),
    "От10МВт" numeric(15,4)
);
 B   DROP TABLE "Документ"."СбытоваяНадбавка";
       Документ         heap    dbmaster    false    6            �            1259    64974 &   СкидкаТочкиПоставки    TABLE     �  CREATE TABLE "Документ"."СкидкаТочкиПоставки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "СсылкаНаТочкуПоставки" uuid,
    "ДатаНачала" timestamp without time zone,
    "ДатаОкончания" timestamp without time zone,
    "ВеличинаСкидкиНадбавки" numeric(15,5),
    "Примечание" text,
    "Формула" text
);
 H   DROP TABLE "Документ"."СкидкаТочкиПоставки";
       Документ         heap    dbmaster    false    6            �            1259    64980 ,   СчетНаОплатуПокупателю    TABLE     �  CREATE TABLE "Документ"."СчетНаОплатуПокупателю" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Ответственный" uuid,
    "Комментарий" text,
    "СуммаВключаетНДС" boolean,
    "СуммаДокумента" numeric(22,5),
    "Руководитель" text,
    "ГлавныйБухгалтер" text,
    "РуководительДолжность" text,
    "БухгалтерДолжность" text,
    "ДокументБезНДС" boolean,
    "ЗаГлавногоБухгалтераНаОсновании" text,
    "ЗаРуководителяНаОсновании" text,
    "Товары" jsonb,
    "ДоговорПродажи" uuid,
    "РасчетДоговораПродажи" uuid,
    "ТипДоговораПродажи" text,
    "СуммаКОплате" numeric,
    "СтавкаНДС" numeric,
    "ПодписьРуководителя" text,
    "ПодписьБухгалтера" text,
    "ПечатьПредприятия" text,
    "ТипСчета" text,
    "Number" bigint NOT NULL,
    "СрокОплаты" timestamp without time zone
);
 N   DROP TABLE "Документ"."СчетНаОплатуПокупателю";
       Документ         heap    dbmaster    false    6            �            1259    64986 7   СчетНаОплатуПокупателю_number_seq    SEQUENCE     9  ALTER TABLE "Документ"."СчетНаОплатуПокупателю" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."СчетНаОплатуПокупателю_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Документ          dbmaster    false    235    6            �            1259    64987 &   СчетФактураВыданный    TABLE     �  CREATE TABLE "Документ"."СчетФактураВыданный" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "Posted" boolean,
    "ВидСчетаФактуры" text,
    "Организация" uuid,
    "Контрагент" uuid,
    "ДоговорКонтрагента" uuid,
    "Исправление" boolean,
    "НомерИсправления" numeric(15,0),
    "ИсправляемыйСчетФактура" uuid,
    "НомерИсправляемогоКорректировоч" text,
    "ДатаИсправляемогоКорректировочн" timestamp without time zone,
    "НомерИсходногоДокумента" text,
    "ДатаИсходногоДокумента" timestamp without time zone,
    "УдалитьУчитыватьИсправлениеИсхо" boolean,
    "УдалитьНомерИсправленияИсходног" text,
    "УдалитьДатаИсправленияИсходного" timestamp without time zone,
    "Комитент" uuid,
    "Продавец" uuid,
    "ДокументОснование" text,
    "ДатаПлатежноРасчетногоДокумента" timestamp without time zone,
    "НомерПлатежноРасчетногоДокумент" text,
    "ДатаДокументаАвансаКомитента" timestamp without time zone,
    "НомерДокументаАвансаКомитента" text,
    "СчетНаОплату" uuid,
    "КодВидаОперации" text,
    "СчетФактураНеВыставляется" boolean,
    "Выставлен" boolean,
    "ДатаВыставления" timestamp without time zone,
    "КодСпособаВыставления" text,
    "СчетФактураБезНДС" boolean,
    "Под0" boolean,
    "СтавкаНДС" text,
    "Сумма" numeric(15,4),
    "СуммаНДС" numeric(15,4),
    "СуммаДокумента" numeric(15,4),
    "СуммаУвеличение" numeric(15,4),
    "СуммаУменьшение" numeric(15,4),
    "СуммаНДСДокумента" numeric(15,4),
    "СуммаНДСУвеличение" numeric(15,4),
    "СуммаНДСУменьшение" numeric(15,4),
    "ВалютаДокумента" uuid,
    "Ответственный" uuid,
    "Комментарий" text,
    "РучнаяКорректировка" boolean,
    "СформированПриВводеНачальныхОст" boolean,
    "Руководитель" uuid,
    "ГлавныйБухгалтер" uuid,
    "КППКонтрагента" text,
    "СводныйКорректировочный" boolean,
    "ПредставлениеНомера" text,
    "НомерСчетаФактурыПродавца" text,
    "СуммаДокументаКомиссия" numeric(15,4),
    "СуммаНДСДокументаКомиссия" numeric(15,4),
    "СуммаУвеличениеКомиссия" numeric(15,4),
    "СуммаУменьшениеКомиссия" numeric(15,4),
    "СуммаНДСУвеличениеКомиссия" numeric(15,4),
    "СуммаНДСУменьшениеКомиссия" numeric(15,4),
    "СводныйКомиссионный" boolean,
    "КодВидаОперацииНаУменьшение" text,
    "КПППродавца" text,
    "ИдентификаторГосКонтракта" text,
    "ДоговорКомитента" uuid,
    "СчетРасчетов" uuid,
    "ДатаСчетаФактурыПродавца" timestamp without time zone,
    "ЕстьПрослеживаемыеТовары" boolean,
    "ОтредактированыДокументыОтгрузк" boolean,
    "ОтредактированыНомераКорректиру" boolean,
    "ДокументыОснования" jsonb,
    "КорректируемыеНомераСтрок" jsonb
);
 H   DROP TABLE "Документ"."СчетФактураВыданный";
       Документ         heap    dbmaster    false    6            �            1259    64993 .   ТарифНаУслугиПоПередаче    TABLE     X  CREATE TABLE "Документ"."ТарифНаУслугиПоПередаче" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Регион" uuid,
    "СтавкаНаПотери" numeric(15,5),
    "ТарифнаяГруппа" text,
    "ДатаНачалаПериода" timestamp without time zone,
    "СтавкаНаТранспорт" numeric(15,5),
    "УровеньНапряжения" text,
    "СтавкаЗаСодержание" numeric(15,5),
    "ДатаОкончанияПериода" timestamp without time zone
);
 P   DROP TABLE "Документ"."ТарифНаУслугиПоПередаче";
       Документ         heap    dbmaster    false    6            �            1259    64999 
   Файлы    TABLE     l   CREATE TABLE "Документ"."Файлы" (
    "Файл" bytea,
    "Наименование" text
);
 ,   DROP TABLE "Документ"."Файлы";
       Документ         heap    dbmaster    false    6            �            1259    65004 &   ЧасыПиковойНагрузки    TABLE     C  CREATE TABLE "Документ"."ЧасыПиковойНагрузки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Number" text,
    "ПериодРасчета" timestamp without time zone,
    "ГарантирующийПоставщик" uuid,
    "Параметры" jsonb
);
 H   DROP TABLE "Документ"."ЧасыПиковойНагрузки";
       Документ         heap    dbmaster    false    6            �            1259    65010     ЖурналОбновления    TABLE     \  CREATE TABLE "Журналы"."ЖурналОбновления" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" text,
    "Схема" text,
    "Таблица" text,
    "Ссылка" uuid,
    "Операция" text,
    "ПометкаУдаления" boolean
);
 @   DROP TABLE "Журналы"."ЖурналОбновления";
       Журналы         heap    dbmaster    false    7            "           1259    83576     ИсторияИзменений    TABLE     \  CREATE TABLE "Журналы"."ИсторияИзменений" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" text,
    "Схема" text,
    "Таблица" text,
    "Ссылка" uuid,
    "Операция" text,
    "ПометкаУдаления" boolean
);
 @   DROP TABLE "Журналы"."ИсторияИзменений";
       Журналы         heap    dbmaster    false    7            �            1259    65016    ВерсияБД    TABLE     �   CREATE TABLE "Константа"."ВерсияБД" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text
);
 4   DROP TABLE "Константа"."ВерсияБД";
       Константа         heap    dbmaster    false    8            �            1259    65022    ВерсияПО    TABLE     �   CREATE TABLE "Константа"."ВерсияПО" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "ДатаПубликации" timestamp without time zone,
    "Наименование" text,
    "СсылкаНаСкачивание" text
);
 4   DROP TABLE "Константа"."ВерсияПО";
       Константа         heap    dbmaster    false    8            �            1259    65028    Организации    TABLE     �  CREATE TABLE "Настройки"."Организации" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "ОрганизацияПоУмолчанию" boolean DEFAULT false,
    "НаименованиеКраткое" text DEFAULT '-'::text,
    "НаименованиеПолное" text DEFAULT '-'::text,
    "НаименованиеДляПечати" text DEFAULT '-'::text,
    "ИНН" text DEFAULT '-'::text,
    "КПП" text DEFAULT '-'::text,
    "ОГРН" text DEFAULT '-'::text,
    "ДатаРегистрации" date DEFAULT '2000-01-01'::date,
    "Банк" text DEFAULT '-'::text,
    "Префикс" text DEFAULT '00'::text,
    "НомерСчета" text DEFAULT '-'::text,
    "ЮридическийАдрес" text DEFAULT '-'::text,
    "ПочтовыйАдрес" text DEFAULT '-'::text,
    "ФактическийАдрес" text DEFAULT '-'::text,
    "Телефон" text DEFAULT '-'::text,
    "ЭлектроннаяПочта" text DEFAULT '-'::text,
    "РуководительФио" text DEFAULT '-'::text,
    "РуководительДолжность" text DEFAULT '-'::text,
    "РуководительДоверенность" text DEFAULT '-'::text,
    "БухгалтерФио" text DEFAULT '-'::text,
    "БухгалтерДолжность" text DEFAULT '-'::text,
    "БухгалтерДоверенность" text DEFAULT '-'::text,
    "КассирФио" text DEFAULT '-'::text,
    "КассирДолжность" text DEFAULT '-'::text,
    "КассирДоверенность" text DEFAULT '-'::text,
    "ЛоготипФайл" bytea,
    "ЛоготипНаименование" text,
    "ЯрлыкФайл" bytea,
    "ЯрлыкНаименование" text,
    "ПечатьФайл" bytea,
    "ПечатьНаименование" text,
    "ПодписьРукФайл" bytea,
    "ПодписьРукНаименование" text,
    "ПодписьБухФайл" bytea,
    "ПодписьБухНаименование" text,
    "ПометкаУдаления" boolean DEFAULT false,
    "Бик" text,
    "КорСчет" text
);
 :   DROP TABLE "Настройки"."Организации";
       Настройки         heap    dbmaster    false    9            �            1259    65060    Пользователи    TABLE     G  CREATE TABLE "Настройки"."Пользователи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" text,
    "Наименование" text,
    "СуперПользователь" boolean,
    "Удаление" boolean DEFAULT false
);
 <   DROP TABLE "Настройки"."Пользователи";
       Настройки         heap    dbmaster    false    9            �            1259    65066 &   ПрофильПользователя    TABLE       CREATE TABLE "Настройки"."ПрофильПользователя" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" uuid,
    "ПрофильПоУмолчанию" boolean DEFAULT false,
    "Наименование" text DEFAULT '-'::text,
    "Тема" text DEFAULT '-'::text,
    "КаталогОтчетов" text DEFAULT '-'::text,
    "КаталогОтчетовИспользовать" boolean DEFAULT false,
    "КаталогАктовИСчетов" text DEFAULT '-'::text,
    "КаталогАктовИСчетовИспользовать" boolean DEFAULT false,
    "ПрограммаXLSX" text DEFAULT '-'::text,
    "ПрограммаDOCX" text DEFAULT '-'::text,
    "ПрограммаPDF" text DEFAULT '-'::text,
    "ПротоколPOP3" boolean DEFAULT false,
    "ПротоколIMAP" boolean DEFAULT false,
    "Порт" numeric(10,0) DEFAULT 0,
    "МетодАутентификации" text DEFAULT '-'::text,
    "ЗащитаСоединения" text DEFAULT '-'::text,
    "ИмяДоступа" text DEFAULT '-'::text,
    "ПарольДоступа" text,
    "Сервер" text DEFAULT '-'::text,
    "ПометкаУдаления" boolean DEFAULT false
);
 J   DROP TABLE "Настройки"."ПрофильПользователя";
       Настройки         heap    dbmaster    false    9            �            1259    65090    ВидДоговора    TABLE     �   CREATE TABLE "Перечисление"."ВидДоговора" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);
 @   DROP TABLE "Перечисление"."ВидДоговора";
       Перечисление         heap    dbmaster    false    10            �            1259    65096    ВидКонтрагента    TABLE     �   CREATE TABLE "Перечисление"."ВидКонтрагента" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);
 F   DROP TABLE "Перечисление"."ВидКонтрагента";
       Перечисление         heap    dbmaster    false    10            �            1259    65102 $   ДокументПодписанта    TABLE     �   CREATE TABLE "Перечисление"."ДокументПодписанта" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Псевдоним" text
);
 N   DROP TABLE "Перечисление"."ДокументПодписанта";
       Перечисление         heap    dbmaster    false    10            �            1259    65108    ОтчетыДоговора    TABLE     �   CREATE TABLE "Перечисление"."ОтчетыДоговора" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);
 F   DROP TABLE "Перечисление"."ОтчетыДоговора";
       Перечисление         heap    dbmaster    false    10            �            1259    65114    ТипАванса    TABLE     �   CREATE TABLE "Перечисление"."ТипАванса" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);
 <   DROP TABLE "Перечисление"."ТипАванса";
       Перечисление         heap    dbmaster    false    10            �            1259    65120    ТипДоговора    TABLE     �   CREATE TABLE "Перечисление"."ТипДоговора" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);
 @   DROP TABLE "Перечисление"."ТипДоговора";
       Перечисление         heap    dbmaster    false    10            �            1259    65126    ФормаВедомости    TABLE     �   CREATE TABLE "Перечисление"."ФормаВедомости" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);
 F   DROP TABLE "Перечисление"."ФормаВедомости";
       Перечисление         heap    dbmaster    false    10            �            1259    65132    ДанныеИсточника    TABLE     �  CREATE TABLE "ПланОбмена"."ДанныеИсточника" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ИдентификаторБазы" text,
    "НаименованиеБазы" text,
    "ИдентификаторОбъекта" uuid,
    "НаименованиеОбъекта" text,
    "ДатаЗагрузки" timestamp without time zone,
    "Данные" jsonb
);
 D   DROP TABLE "ПланОбмена"."ДанныеИсточника";
       ПланОбмена         heap    dbmaster    false    11            �            1259    65138    ФайлыИнтерфейс    TABLE     �   CREATE TABLE "Приложение"."ФайлыИнтерфейс" (
    "Файл" bytea,
    "Наименование" text
);
 B   DROP TABLE "Приложение"."ФайлыИнтерфейс";
       Приложение         heap    dbmaster    false    12                        1259    65143    ФайлыИсходники    TABLE     �   CREATE TABLE "Приложение"."ФайлыИсходники" (
    "Файл" bytea,
    "Наименование" text,
    "Система" text
);
 B   DROP TABLE "Приложение"."ФайлыИсходники";
       Приложение         heap    dbmaster    false    12                       1259    65148    ФайлыКартинки    TABLE     �   CREATE TABLE "Приложение"."ФайлыКартинки" (
    "Файл" bytea,
    "Наименование" text
);
 @   DROP TABLE "Приложение"."ФайлыКартинки";
       Приложение         heap    dbmaster    false    12                       1259    65153    ФайлыОтчетов    TABLE     ~   CREATE TABLE "Приложение"."ФайлыОтчетов" (
    "Файл" bytea,
    "Наименование" text
);
 >   DROP TABLE "Приложение"."ФайлыОтчетов";
       Приложение         heap    dbmaster    false    12                       1259    65158    ФайлыПриложения    TABLE     �   CREATE TABLE "Приложение"."ФайлыПриложения" (
    "Файл" bytea,
    "Наименование" text,
    "Система" text
);
 D   DROP TABLE "Приложение"."ФайлыПриложения";
       Приложение         heap    dbmaster    false    12                       1259    65163    ФайлыСтиля    TABLE     z   CREATE TABLE "Приложение"."ФайлыСтиля" (
    "Файл" bytea,
    "Наименование" text
);
 :   DROP TABLE "Приложение"."ФайлыСтиля";
       Приложение         heap    dbmaster    false    12                       1259    65168 .   ГарантирующиеПоставщики    TABLE     ^  CREATE TABLE "Справочник"."ГарантирующиеПоставщики" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Регион" uuid,
    "ОРЭМ" boolean,
    "ИдентификаторСубъекта" text
);
 T   DROP TABLE "Справочник"."ГарантирующиеПоставщики";
       Справочник         heap    dbmaster    false    13            7           1259    126647 $   ДинамическиеОтчеты    TABLE     #  CREATE TABLE "Справочник"."ДинамическиеОтчеты" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Code" bigint NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "ДатаСоздания" timestamp without time zone,
    "Отчет" jsonb
);
 J   DROP TABLE "Справочник"."ДинамическиеОтчеты";
       Справочник         heap    dbmaster    false    13            6           1259    126646 -   ДинамическиеОтчеты_Code_seq    SEQUENCE     -  ALTER TABLE "Справочник"."ДинамическиеОтчеты" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ДинамическиеОтчеты_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    311    13                       1259    65174 '   ДоговорКонтрагента1С    TABLE     �  CREATE TABLE "Справочник"."ДоговорКонтрагента1С" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Owner" uuid,
    "ВалютаВзаиморасчетов" uuid,
    "Комментарий" text,
    "Организация" uuid,
    "ПроцентКомиссионногоВознагражде" numeric(14,5),
    "СпособРасчетаКомиссионногоВозна" text,
    "ТипЦен" uuid,
    "ВидДоговора" text,
    "УчетАгентскогоНДС" boolean,
    "ВидАгентскогоДоговора" text,
    "РасчетыВУсловныхЕдиницах" boolean,
    "УдалитьРеализацияНаЭкспорт" boolean,
    "ВидВзаиморасчетов" uuid,
    "Дата" timestamp without time zone,
    "Номер" text,
    "СрокДействия" timestamp without time zone,
    "УстановленСрокОплаты" boolean,
    "СрокОплаты" numeric(10,0),
    "НаименованиеДляСчетаФактурыНаАв" uuid,
    "ПорядокРегистрацииСчетовФактурН" text,
    "Валютный" boolean,
    "ОплатаВВалюте" boolean,
    "ИспользуетсяПриОбменеДанными" boolean,
    "УдалитьПредъявляетНДС" boolean,
    "НДСПоСтавкам4и2" boolean,
    "Руководитель" uuid,
    "ЗаРуководителяПоПриказу" text,
    "ДолжностьРуководителя" uuid,
    "РуководительКонтрагента" text,
    "ЗаРуководителяКонтрагентаПоПрик" text,
    "ДолжностьРуководителяКонтрагент" text,
    "ФайлДоговора" uuid,
    "ДоговорПодписан" boolean,
    "ПолРуководителяКонтрагента" text,
    "ПлатежныйАгент" boolean,
    "ТелефонПоставщика" text,
    "НаименованиеОператораПеревода" text,
    "ИННОператораПеревода" text,
    "АдресОператораПеревода" text,
    "ТелефонОператораПеревода" text,
    "ТелефонПлатежногоАгента" text,
    "ТелефонОператораПоПриемуПлатеже" text,
    "ОперацияПлатежногоАгента" text,
    "ГосударственныйКонтракт" uuid,
    "КодРаздел7ДекларацииНДС" uuid,
    "ПризнакАгента" text,
    "УчетАгентскогоНДСПокупателем" boolean,
    "СчетаФактурыОтИмениОрганизации" boolean,
    "СпособЗаполненияСтавкиНДС" text,
    "ЭлектронныеУслуги" boolean,
    "ВидОбеспеченияОбязательствИПлат" text,
    "ОбеспечениеПредоставил" boolean,
    "ОбеспечениеПолучил" boolean,
    "ОбеспечениеВыданоЗа" boolean,
    "СпособВыставленияДокументов" text,
    "ДатаОплаты" timestamp without time zone,
    "ВидАктива" text,
    "Сумма" numeric(14,5),
    "СуммаВключаетНДС" boolean,
    "СтавкаНДС" text,
    "СуммаНДС" numeric(14,5)
);
 M   DROP TABLE "Справочник"."ДоговорКонтрагента1С";
       Справочник         heap    dbmaster    false    13            .           1259    89980    ДоговорПокупки    TABLE     }  CREATE TABLE "Справочник"."ДоговорПокупки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "НомерДоговора1С" uuid,
    "ПаспортНомер" text,
    "ДатаВыдачиПаспорта" date,
    "КемВыданПаспорт" text,
    "КодПодразделения" text,
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "Примечание" text,
    "ДатаПервогоПромежуточного" integer DEFAULT 0,
    "РазмерПервогоПромежуточного" integer DEFAULT 0,
    "ДатаВторогоПромежуточного" integer DEFAULT 0,
    "РазмерВторогоПромежуточного" integer DEFAULT 0,
    "ДатаВыставленияАвансовых" integer DEFAULT 0,
    "ДатаВыставленияОкончательных" integer DEFAULT 0,
    "ДатаОкончательногоПлатежа" integer DEFAULT 0,
    "ДатаДоговора" date,
    "ДатаНачалаДействияДоговора" date,
    "ДатаОкончанияДействияДоговора" date,
    "ФИОПодписанта" text,
    "ОснованиеПодписанта" text,
    "ПролонгацияДоговора" boolean,
    "Контрагент" uuid,
    "ТипДоговора" text,
    "ЮридическийАдрес" text,
    "ПочтовыйАдрес" text,
    "НаличиеЭДО" boolean,
    "ПервыйАванс" boolean,
    "ВторойАванс" boolean,
    "ФормаВедомости" text,
    "Пеня" integer DEFAULT 0,
    "ДоговорРасторгнут" boolean,
    "АвансПоПрошломуМесяцу" boolean,
    "ПроцентАвансаПоПрошломуМесяцу" integer DEFAULT 0,
    "РучноеВыставлениеАвансов" boolean,
    "ДатаОплатыПоПрошломуМесяцу" integer DEFAULT 0,
    "ДатаОплатыПоПрошломуМВторой" integer DEFAULT 0,
    "ПроцентАвансаПоПрошломуМВторой" integer DEFAULT 0,
    "АвансПоПрошломуМесяцуВторой" boolean,
    "ОбъемПервогоРучногоАванса" numeric DEFAULT 0,
    "ОбъемВторогоРучногоАванса" numeric DEFAULT 0,
    "ФСКПервогоРучногоАванса" numeric DEFAULT 0,
    "ФСКВторогоРучногоАванса" numeric DEFAULT 0,
    "ПроцентПервогоРучногоАванса" integer DEFAULT 0,
    "ПроцентВторогоРучногоАванса" integer DEFAULT 0,
    "ТипАванса" text,
    "КомментарийПервогоАванса" text,
    "КомментарийВторогоАванса" text,
    "ДопСоглашение" uuid,
    "ПрименитьКДоговору" boolean,
    "НаРасторжение" boolean,
    "НаРасторжениеПримечание" text,
    "ДопСоглашениеАгента" uuid,
    "ПрименитьКДоговоруАгента" boolean,
    "НачислятьПеню" boolean,
    "СоздаватьСчетНаПеню" boolean,
    "СоздаватьДокументНаПеню" boolean,
    "ДоговорПерезаключен" boolean,
    "ДокументПодписанта" text,
    "ДатаДоверенности" date,
    "НомерДоверенности" text,
    "СтавкаНДС" numeric DEFAULT 0,
    "Code" bigint NOT NULL,
    "ДолжностьПодписанта1С" text,
    "Премия" jsonb,
    "Агент" jsonb,
    "Подтвержден" boolean DEFAULT false NOT NULL,
    "Подтверждающий" text DEFAULT 'Нет'::text NOT NULL,
    "СрочныйДоговор" boolean DEFAULT false NOT NULL,
    "Регион" uuid,
    "СкидкаПокупки" jsonb,
    "ПрименитьСкидкуКДоговору" boolean,
    "СуммироватьПрофиль" boolean,
    "ПараметрыПродажи" jsonb,
    "СуммироватьПрофильПоДоговору" boolean DEFAULT false
);
 B   DROP TABLE "Справочник"."ДоговорПокупки";
       Справочник         heap    dbmaster    false    13            -           1259    89979 %   ДоговорПокупки_Code_seq    SEQUENCE       ALTER TABLE "Справочник"."ДоговорПокупки" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ДоговорПокупки_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    302    13                       1259    65180    ДоговорПродажи    TABLE     D  CREATE TABLE "Справочник"."ДоговорПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "НомерДоговора1С" uuid,
    "ПаспортНомер" text,
    "ДатаВыдачиПаспорта" date,
    "КемВыданПаспорт" text,
    "КодПодразделения" text,
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "Примечание" text,
    "ДатаПервогоПромежуточного" integer DEFAULT 0,
    "РазмерПервогоПромежуточного" integer DEFAULT 0,
    "ДатаВторогоПромежуточного" integer DEFAULT 0,
    "РазмерВторогоПромежуточного" integer DEFAULT 0,
    "ДатаВыставленияАвансовых" integer DEFAULT 0,
    "ДатаВыставленияОкончательных" integer DEFAULT 0,
    "ДатаОкончательногоПлатежа" integer DEFAULT 0,
    "ДатаДоговора" date,
    "ДатаНачалаДействияДоговора" date,
    "ДатаОкончанияДействияДоговора" date,
    "ФИОПодписанта" text,
    "ОснованиеПодписанта" text,
    "ПролонгацияДоговора" boolean,
    "Контрагент" uuid,
    "ТипДоговора" text,
    "ЮридическийАдрес" text,
    "ПочтовыйАдрес" text,
    "НаличиеЭДО" boolean,
    "ПервыйАванс" boolean,
    "ВторойАванс" boolean,
    "ФормаВедомости" text,
    "Пеня" integer DEFAULT 0,
    "ДоговорРасторгнут" boolean,
    "АвансПоПрошломуМесяцу" boolean,
    "ПроцентАвансаПоПрошломуМесяцу" integer DEFAULT 0,
    "РучноеВыставлениеАвансов" boolean,
    "ДатаОплатыПоПрошломуМесяцу" integer DEFAULT 0,
    "ДатаОплатыПоПрошломуМВторой" integer DEFAULT 0,
    "ПроцентАвансаПоПрошломуМВторой" integer DEFAULT 0,
    "АвансПоПрошломуМесяцуВторой" boolean,
    "ОбъемПервогоРучногоАванса" numeric DEFAULT 0,
    "ОбъемВторогоРучногоАванса" numeric DEFAULT 0,
    "ФСКПервогоРучногоАванса" numeric DEFAULT 0,
    "ФСКВторогоРучногоАванса" numeric DEFAULT 0,
    "ПроцентПервогоРучногоАванса" integer DEFAULT 0,
    "ПроцентВторогоРучногоАванса" integer DEFAULT 0,
    "ТипАванса" text,
    "КомментарийПервогоАванса" text,
    "КомментарийВторогоАванса" text,
    "ДопСоглашение" uuid,
    "ПрименитьКДоговору" boolean,
    "НаРасторжение" boolean,
    "НаРасторжениеПримечание" text,
    "ДопСоглашениеАгента" uuid,
    "ПрименитьКДоговоруАгента" boolean,
    "НачислятьПеню" boolean,
    "СоздаватьСчетНаПеню" boolean,
    "СоздаватьДокументНаПеню" boolean,
    "ДоговорПерезаключен" boolean,
    "ДокументПодписанта" text,
    "ДатаДоверенности" date,
    "НомерДоверенности" text,
    "СтавкаНДС" numeric DEFAULT 0,
    "Code" bigint NOT NULL,
    "ДолжностьПодписанта1С" text,
    "Премия" jsonb,
    "Агент" jsonb,
    "Подтвержден" boolean DEFAULT false NOT NULL,
    "Подтверждающий" text DEFAULT 'Нет'::text NOT NULL,
    "СрочныйДоговор" boolean DEFAULT false NOT NULL
);
 B   DROP TABLE "Справочник"."ДоговорПродажи";
       Справочник         heap    dbmaster    false    13                       1259    65205 %   ДоговорПродажи_code_seq    SEQUENCE       ALTER TABLE "Справочник"."ДоговорПродажи" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ДоговорПродажи_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    263            &           1259    84019 :   ЗакрытыйПериодДоговораПродажи    TABLE     Y  CREATE TABLE "Справочник"."ЗакрытыйПериодДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Code" bigint NOT NULL,
    "ДатаПериода" date,
    "ДоговорПродажи" uuid,
    "Использовать" boolean
);
 `   DROP TABLE "Справочник"."ЗакрытыйПериодДоговораПродажи";
       Справочник         heap    dbmaster    false    13            %           1259    84018 ?   ЗакрытыйПериодДоговораПрода_Code_seq    SEQUENCE     U  ALTER TABLE "Справочник"."ЗакрытыйПериодДоговораПродажи" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ЗакрытыйПериодДоговораПрода_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    294    13            	           1259    65207    Контрагенты    TABLE     �  CREATE TABLE "Справочник"."Контрагенты" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Description" text,
    "Контрагент1С" uuid,
    "ФИОКонтрагента" text,
    "АдресПочтовый" text,
    "АдресФактический" text,
    "ОГРН" character varying(50),
    "ИНН" character varying(50),
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "РасчетныйСчет" text,
    "ОКВЭД" character varying(50),
    "БанкНаименование" text,
    "КоррСчетБанка" text,
    "БИКБанка" character varying(50),
    "Примечание" text,
    "ОрганизационнаяФорма" text,
    "НаименованиеПолное" text,
    "КПП" character varying(50),
    "ОКПО" character varying(50),
    "АдресЮридический" text,
    "ВидКонтрагента" character varying(50),
    "ГоловнойКонтрагент" uuid,
    "ОбособленноеПодразделение" boolean,
    "НеИП" boolean,
    "Code" bigint NOT NULL
);
 <   DROP TABLE "Справочник"."Контрагенты";
       Справочник         heap    dbmaster    false    13            
           1259    65213    Контрагенты1С    TABLE     T  CREATE TABLE "Справочник"."Контрагенты1С" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "НаименованиеПолное" text,
    "ОбособленноеПодразделение" boolean,
    "ЮридическоеФизическоеЛицо" text,
    "СтранаРегистрации" uuid,
    "ГоловнойКонтрагент" uuid,
    "ИНН" text,
    "КПП" text,
    "КодПоОКПО" text,
    "ДокументУдостоверяющийЛичность" text,
    "ОсновнойБанковскийСчет" uuid,
    "ОсновноеКонтактноеЛицо" uuid,
    "Комментарий" text,
    "ДополнительнаяИнформация" text,
    "РасширенноеПредставлениеИНН" text,
    "РасширенноеПредставлениеКПП" text,
    "НалоговыйНомер" text,
    "РегистрационныйНомер" text,
    "ГосударственныйОрган" boolean,
    "ВидГосударственногоОргана" text,
    "КодГосударственногоОргана" text,
    "СвидетельствоСерияНомер" text,
    "СвидетельствоДатаВыдачи" timestamp without time zone,
    "ДатаРегистрации" timestamp without time zone,
    "ДатаСоздания" timestamp without time zone,
    "Самозанятый" boolean,
    "КонтактнаяИнформация" jsonb
);
 ?   DROP TABLE "Справочник"."Контрагенты1С";
       Справочник         heap    dbmaster    false    13                       1259    65219    Контрагенты_code_seq    SEQUENCE       ALTER TABLE "Справочник"."Контрагенты" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."Контрагенты_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    265    13            ,           1259    89973 $   КонтрагентыПокупки    TABLE     �  CREATE TABLE "Справочник"."КонтрагентыПокупки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Контрагент1С" uuid,
    "ФИОКонтрагента" text,
    "АдресПочтовый" text,
    "АдресФактический" text,
    "ОГРН" character varying(50),
    "ИНН" character varying(50),
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "РасчетныйСчет" text,
    "ОКВЭД" character varying(50),
    "БанкНаименование" text,
    "КоррСчетБанка" text,
    "БИКБанка" character varying(50),
    "Примечание" text,
    "ОрганизационнаяФорма" text,
    "НаименованиеПолное" text,
    "КПП" character varying(50),
    "ОКПО" character varying(50),
    "АдресЮридический" text,
    "ВидКонтрагента" character varying(50),
    "ГоловнойКонтрагент" uuid,
    "ОбособленноеПодразделение" boolean,
    "НеИП" boolean,
    "Code" bigint NOT NULL
);
 J   DROP TABLE "Справочник"."КонтрагентыПокупки";
       Справочник         heap    dbmaster    false    13            +           1259    89972 -   КонтрагентыПокупки_Code_seq    SEQUENCE     -  ALTER TABLE "Справочник"."КонтрагентыПокупки" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."КонтрагентыПокупки_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    300    13            *           1259    85962    ЛичныйКабинет    TABLE       CREATE TABLE "Справочник"."ЛичныйКабинет" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Контрагент" uuid,
    "Логин" text,
    "Пароль" text,
    "Блокировать" boolean,
    "БлокироватьДокументы" boolean,
    "БлокироватьПриборы" boolean,
    "БлокироватьФинансы" boolean,
    "БлокироватьОтчеты" boolean,
    "Code" bigint NOT NULL
);
 @   DROP TABLE "Справочник"."ЛичныйКабинет";
       Справочник         heap    dbmaster    false    13            )           1259    85961 #   ЛичныйКабинет_Code_seq    SEQUENCE       ALTER TABLE "Справочник"."ЛичныйКабинет" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ЛичныйКабинет_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    298                       1259    65220 $   МодельПрибораУчета    TABLE     �   CREATE TABLE "Справочник"."МодельПрибораУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text
);
 J   DROP TABLE "Справочник"."МодельПрибораУчета";
       Справочник         heap    dbmaster    false    13                       1259    65226    ОбъектыУчета    TABLE     *  CREATE TABLE "Справочник"."ОбъектыУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Наименование" character varying(100),
    "АдресОбъекта" text,
    "НомерДоговора" uuid,
    "МаксимальнаяМощность" numeric(15,2),
    "Контрагент" uuid,
    "Примечание" text,
    "Регион" uuid,
    "ОбщаяМощность" boolean,
    "ДатаНачала" timestamp without time zone,
    "ДатаОкончания" timestamp without time zone,
    "МаксимальнаяМощностьПокупки" numeric(15,2),
    "ОбщаяМощностьПокупки" boolean,
    "Идентификатор" text,
    "Code" bigint NOT NULL
);
 >   DROP TABLE "Справочник"."ОбъектыУчета";
       Справочник         heap    dbmaster    false    13                       1259    65232 !   ОбъектыУчета_code_seq    SEQUENCE       ALTER TABLE "Справочник"."ОбъектыУчета" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ОбъектыУчета_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    269    13                       1259    65233 "   ОтветственныеЛица    TABLE     �  CREATE TABLE "Справочник"."ОтветственныеЛица" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Пользователь" uuid,
    "Руководитель" uuid,
    "Должность" uuid,
    "Подразделение" uuid,
    "ФИОДляДокументов" text DEFAULT '-'::text,
    "Почта" text DEFAULT '-'::text,
    "Телефон" text DEFAULT '-'::text
);
 H   DROP TABLE "Справочник"."ОтветственныеЛица";
       Справочник         heap    dbmaster    false    13                       1259    65242 "   ПремияПотребителю    TABLE       CREATE TABLE "Справочник"."ПремияПотребителю" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Description" text,
    "ИнформацияДляОтображения" jsonb,
    "Code" bigint NOT NULL
);
 H   DROP TABLE "Справочник"."ПремияПотребителю";
       Справочник         heap    dbmaster    false    13            #           1259    83876 +   ПремияПотребителю_Code_seq    SEQUENCE     )  ALTER TABLE "Справочник"."ПремияПотребителю" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ПремияПотребителю_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    272                       1259    65248 .   ПремияПотребителюАгента    TABLE     �  CREATE TABLE "Справочник"."ПремияПотребителюАгента" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Description" text,
    "КонтрагентАгента" uuid,
    "ДоговорАгента" uuid,
    "АдресПочтыАгента" text,
    "ИнформацияДляОтображения" jsonb,
    "Code" bigint NOT NULL
);
 T   DROP TABLE "Справочник"."ПремияПотребителюАгента";
       Справочник         heap    dbmaster    false    13            $           1259    83882 7   ПремияПотребителюАгента_Code_seq    SEQUENCE     A  ALTER TABLE "Справочник"."ПремияПотребителюАгента" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ПремияПотребителюАгента_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    273                       1259    65254    ПриборыУчета    TABLE     �  CREATE TABLE "Справочник"."ПриборыУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "МодельПрибора" uuid,
    "КлассТочности" text,
    "ДатаПоверки" timestamp without time zone,
    "ВсоставеАСКУЭ" boolean,
    "ДатаСледующейПоверки" timestamp without time zone,
    "МежповерочныйИнтервал" numeric(10,0),
    "РасчетныйКоэффициент" numeric(14,2),
    "ЗначностьСчетчика" numeric(10,0),
    "Учитывать" boolean,
    "НомерПоставщика" text,
    "Автоматизация" boolean,
    "Статусы" uuid,
    "Примечание" text,
    "ДЭСНомерПрибораПоставщика" text,
    "ДКПНомерПрибораПоставщика" text,
    "ДКПОРЭМНомерПрибораПоставщика" text,
    "ДКПРГНомерПрибораПоставщика" text,
    "ДОУПНомерПрибораПоставщика" text,
    "ДЭСАЛНомерПрибораПоставщика" text,
    "ДатаСоздания" timestamp without time zone,
    "Code" bigint NOT NULL
);
 >   DROP TABLE "Справочник"."ПриборыУчета";
       Справочник         heap    dbmaster    false    13                       1259    65260 !   ПриборыУчета_code_seq    SEQUENCE       ALTER TABLE "Справочник"."ПриборыУчета" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ПриборыУчета_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    274                       1259    65261    Регион    TABLE       CREATE TABLE "Справочник"."Регион" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "ТарифНаУслугиПоПередаче" jsonb,
    "ВременнаяЗона" uuid
);
 2   DROP TABLE "Справочник"."Регион";
       Справочник         heap    dbmaster    false    13                       1259    65267 "   СпособСбораДанных    TABLE     �   CREATE TABLE "Справочник"."СпособСбораДанных" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "СтатусПрибораУчета" text
);
 H   DROP TABLE "Справочник"."СпособСбораДанных";
       Справочник         heap    dbmaster    false    13                       1259    65273    ТочкиПоставки    TABLE       CREATE TABLE "Справочник"."ТочкиПоставки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Наименование" text,
    "АдресТочкиПоставки" text,
    "ГраницаБалансовойПринадлежности" text,
    "ОбъектУчета" uuid,
    "Договор" uuid,
    "ТочкиИзмерения" jsonb,
    "ПериодПродажи" jsonb,
    "Code" bigint NOT NULL,
    "Премия" jsonb,
    "Агент" jsonb,
    "ПитающийЦентр" text DEFAULT '-'::text NOT NULL,
    "ВНФСК" jsonb,
    "ПокупкаДЭС" jsonb,
    "СкидкаПокупки" jsonb,
    "ПокупкаДКП" jsonb,
    "ПокупкаДОУП" jsonb
);
 @   DROP TABLE "Справочник"."ТочкиПоставки";
       Справочник         heap    dbmaster    false    13                       1259    65279 #   ТочкиПоставки_code_seq    SEQUENCE       ALTER TABLE "Справочник"."ТочкиПоставки" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ТочкиПоставки_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    278    13                       1259    65280    ТочкиУчета    TABLE     �  CREATE TABLE "Справочник"."ТочкиУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Наименование" text,
    "МестоРасположения" text,
    "Примечание" text,
    "ДЭСУникальныйКодПокупки" text,
    "ДКПУникальныйКодПокупки" text,
    "ДКПОРЭМУникальныйКодПокупки" text,
    "ДКПРГУникальныйКодПокупки" text,
    "ДОУПУникальныйКодПокупки" text,
    "ДЭСАЛУникальныйКодПокупки" text,
    "ДЭСНаименование" text,
    "ДКПНаименование" text,
    "ДКПОРЭМНаименование" text,
    "ДКПРГНаименование" text,
    "ДОУПНаименование" text,
    "ДЭСАЛНаименование" text,
    "ОписаниеПотерь" text,
    "ОтветственныйЗаПоказания" uuid,
    "ДатаСоздания" timestamp without time zone,
    "ДопКиловатты" jsonb,
    "ДопКиловаттыПокупка" jsonb,
    "ДатаНачала" timestamp without time zone,
    "ДатаОкончания" timestamp without time zone,
    "ПриборыУчета" jsonb,
    "Code" bigint NOT NULL,
    "ПотериПроцент" numeric DEFAULT 0,
    "ПотериКвт" numeric DEFAULT 0,
    "ПотериНачисляются" boolean DEFAULT false NOT NULL,
    "ПрофильПокупки" text,
    "ПрофильДЭС" text,
    "ПрофильДКП" text,
    "ПрофильДКПРГ" text,
    "ПрофильДОУП" text,
    "ПрофильОРЭМ" text
);
 :   DROP TABLE "Справочник"."ТочкиУчета";
       Справочник         heap    dbmaster    false    13                       1259    65286    ТочкиУчета_code_seq    SEQUENCE       ALTER TABLE "Справочник"."ТочкиУчета" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ТочкиУчета_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    280            9           1259    145485 .   УдалениеДоговораПродажи    TABLE     ?  CREATE TABLE "Справочник"."УдалениеДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "ДоговорПродажи" uuid,
    "Code" bigint NOT NULL,
    "Примечание" text,
    "Удален" boolean
);
 T   DROP TABLE "Справочник"."УдалениеДоговораПродажи";
       Справочник         heap    dbmaster    false    13            8           1259    145484 7   УдалениеДоговораПродажи_Code_seq    SEQUENCE     A  ALTER TABLE "Справочник"."УдалениеДоговораПродажи" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."УдалениеДоговораПродажи_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Справочник          dbmaster    false    13    313            �           2606    73928 6   ЖурналЗаписи ЖурналЗаписи_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."ЖурналЗаписи"
    ADD CONSTRAINT "ЖурналЗаписи_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY "Документ"."ЖурналЗаписи" DROP CONSTRAINT "ЖурналЗаписи_pkey";
       Документ            dbmaster    false    219            �           2606    73930 f   КоэффициентОМиИнфрПлатеж КоэффициентОМиИнфрПлатеж_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."КоэффициентОМиИнфрПлатеж"
    ADD CONSTRAINT "КоэффициентОМиИнфрПлатеж_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."КоэффициентОМиИнфрПлатеж" DROP CONSTRAINT "КоэффициентОМиИнфрПлатеж_pkey";
       Документ            dbmaster    false    220            �           2606    73932 v   НерегулируемаяЦенаНаМощность НерегулируемаяЦенаНаМощность_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."НерегулируемаяЦенаНаМощность"
    ADD CONSTRAINT "НерегулируемаяЦенаНаМощность_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."НерегулируемаяЦенаНаМощность" DROP CONSTRAINT "НерегулируемаяЦенаНаМощность_pkey";
       Документ            dbmaster    false    221            �           2606    73934 r   НерегулируемаяЦенаНаЭнергию НерегулируемаяЦенаНаЭнергию_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."НерегулируемаяЦенаНаЭнергию"
    ADD CONSTRAINT "НерегулируемаяЦенаНаЭнергию_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."НерегулируемаяЦенаНаЭнергию" DROP CONSTRAINT "НерегулируемаяЦенаНаЭнергию_pkey";
       Документ            dbmaster    false    222            �           2606    73936 B   ОбъемПоставщика ОбъемПоставщика_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."ОбъемПоставщика"
    ADD CONSTRAINT "ОбъемПоставщика_pkey" PRIMARY KEY (id);
 |   ALTER TABLE ONLY "Документ"."ОбъемПоставщика" DROP CONSTRAINT "ОбъемПоставщика_pkey";
       Документ            dbmaster    false    223                       2606    84204 j   ПерерасчетДоговораПродажи ПерерасчетДоговораПродажи_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."ПерерасчетДоговораПродажи"
    ADD CONSTRAINT "ПерерасчетДоговораПродажи_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."ПерерасчетДоговораПродажи" DROP CONSTRAINT "ПерерасчетДоговораПродажи_pkey";
       Документ            dbmaster    false    296            �           2606    73938 *   Показания Показания_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "Документ"."Показания"
    ADD CONSTRAINT "Показания_pkey" PRIMARY KEY (id);
 d   ALTER TABLE ONLY "Документ"."Показания" DROP CONSTRAINT "Показания_pkey";
       Документ            dbmaster    false    225            �           2606    73940 Z   РасчетДоговораПродажи РасчетДоговораПродажи_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."РасчетДоговораПродажи"
    ADD CONSTRAINT "РасчетДоговораПродажи_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."РасчетДоговораПродажи" DROP CONSTRAINT "РасчетДоговораПродажи_pkey";
       Документ            dbmaster    false    229            �           2606    73942 ^   РеализацияТоваровУслуг РеализацияТоваровУслуг_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."РеализацияТоваровУслуг"
    ADD CONSTRAINT "РеализацияТоваровУслуг_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."РеализацияТоваровУслуг" DROP CONSTRAINT "РеализацияТоваровУслуг_pkey";
       Документ            dbmaster    false    231            �           2606    73944 F   СбытоваяНадбавка СбытоваяНадбавка_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."СбытоваяНадбавка"
    ADD CONSTRAINT "СбытоваяНадбавка_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."СбытоваяНадбавка" DROP CONSTRAINT "СбытоваяНадбавка_pkey";
       Документ            dbmaster    false    233            �           2606    73946 R   СкидкаТочкиПоставки СкидкаТочкиПоставки_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."СкидкаТочкиПоставки"
    ADD CONSTRAINT "СкидкаТочкиПоставки_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."СкидкаТочкиПоставки" DROP CONSTRAINT "СкидкаТочкиПоставки_pkey";
       Документ            dbmaster    false    234            �           2606    73948 ^   СчетНаОплатуПокупателю СчетНаОплатуПокупателю_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."СчетНаОплатуПокупателю"
    ADD CONSTRAINT "СчетНаОплатуПокупателю_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."СчетНаОплатуПокупателю" DROP CONSTRAINT "СчетНаОплатуПокупателю_pkey";
       Документ            dbmaster    false    235            �           2606    73950 R   СчетФактураВыданный СчетФактураВыданный_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."СчетФактураВыданный"
    ADD CONSTRAINT "СчетФактураВыданный_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."СчетФактураВыданный" DROP CONSTRAINT "СчетФактураВыданный_pkey";
       Документ            dbmaster    false    237            �           2606    73952 b   ТарифНаУслугиПоПередаче ТарифНаУслугиПоПередаче_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Документ"."ТарифНаУслугиПоПередаче"
    ADD CONSTRAINT "ТарифНаУслугиПоПередаче_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Документ"."ТарифНаУслугиПоПередаче" DROP CONSTRAINT "ТарифНаУслугиПоПередаче_pkey";
       Документ            dbmaster    false    238            �           2606    73954 2   ВидДоговора ВидДоговора_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ВидДоговора"
    ADD CONSTRAINT "ВидДоговора_pkey" PRIMARY KEY (id);
 t   ALTER TABLE ONLY "Перечисление"."ВидДоговора" DROP CONSTRAINT "ВидДоговора_pkey";
       Перечисление            dbmaster    false    247            �           2606    73956 >   ВидКонтрагента ВидКонтрагента_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ВидКонтрагента"
    ADD CONSTRAINT "ВидКонтрагента_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Перечисление"."ВидКонтрагента" DROP CONSTRAINT "ВидКонтрагента_pkey";
       Перечисление            dbmaster    false    248            �           2606    73958 N   ДокументПодписанта ДокументПодписанта_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ДокументПодписанта"
    ADD CONSTRAINT "ДокументПодписанта_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Перечисление"."ДокументПодписанта" DROP CONSTRAINT "ДокументПодписанта_pkey";
       Перечисление            dbmaster    false    249            �           2606    73960 >   ОтчетыДоговора ОтчетыДоговора_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ОтчетыДоговора"
    ADD CONSTRAINT "ОтчетыДоговора_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Перечисление"."ОтчетыДоговора" DROP CONSTRAINT "ОтчетыДоговора_pkey";
       Перечисление            dbmaster    false    250                        2606    73962 *   ТипАванса ТипАванса_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ТипАванса"
    ADD CONSTRAINT "ТипАванса_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY "Перечисление"."ТипАванса" DROP CONSTRAINT "ТипАванса_pkey";
       Перечисление            dbmaster    false    251                       2606    73964 2   ТипДоговора ТипДоговора_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ТипДоговора"
    ADD CONSTRAINT "ТипДоговора_pkey" PRIMARY KEY (id);
 t   ALTER TABLE ONLY "Перечисление"."ТипДоговора" DROP CONSTRAINT "ТипДоговора_pkey";
       Перечисление            dbmaster    false    252                       2606    73966 >   ФормаВедомости ФормаВедомости_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Перечисление"."ФормаВедомости"
    ADD CONSTRAINT "ФормаВедомости_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Перечисление"."ФормаВедомости" DROP CONSTRAINT "ФормаВедомости_pkey";
       Перечисление            dbmaster    false    253                       2606    73968 B   ДанныеИсточника ДанныеИсточника_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "ПланОбмена"."ДанныеИсточника"
    ADD CONSTRAINT "ДанныеИсточника_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "ПланОбмена"."ДанныеИсточника" DROP CONSTRAINT "ДанныеИсточника_pkey";
       ПланОбмена            dbmaster    false    254                       2606    73970 b   ГарантирующиеПоставщики ГарантирующиеПоставщики_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ГарантирующиеПоставщики"
    ADD CONSTRAINT "ГарантирующиеПоставщики_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Справочник"."ГарантирующиеПоставщики" DROP CONSTRAINT "ГарантирующиеПоставщики_pkey";
       Справочник            dbmaster    false    261            
           2606    73972 T   ДоговорКонтрагента1С ДоговорКонтрагента1С_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ДоговорКонтрагента1С"
    ADD CONSTRAINT "ДоговорКонтрагента1С_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Справочник"."ДоговорКонтрагента1С" DROP CONSTRAINT "ДоговорКонтрагента1С_pkey";
       Справочник            dbmaster    false    262                       2606    73974 >   ДоговорПродажи ДоговорПродажи_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ДоговорПродажи"
    ADD CONSTRAINT "ДоговорПродажи_pkey" PRIMARY KEY (id);
 |   ALTER TABLE ONLY "Справочник"."ДоговорПродажи" DROP CONSTRAINT "ДоговорПродажи_pkey";
       Справочник            dbmaster    false    263                       2606    73976 8   Контрагенты1С Контрагенты1С_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."Контрагенты1С"
    ADD CONSTRAINT "Контрагенты1С_pkey" PRIMARY KEY (id);
 v   ALTER TABLE ONLY "Справочник"."Контрагенты1С" DROP CONSTRAINT "Контрагенты1С_pkey";
       Справочник            dbmaster    false    266                       2606    73978 2   Контрагенты Контрагенты_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."Контрагенты"
    ADD CONSTRAINT "Контрагенты_pkey" PRIMARY KEY (id);
 p   ALTER TABLE ONLY "Справочник"."Контрагенты" DROP CONSTRAINT "Контрагенты_pkey";
       Справочник            dbmaster    false    265                       2606    73980 N   МодельПрибораУчета МодельПрибораУчета_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."МодельПрибораУчета"
    ADD CONSTRAINT "МодельПрибораУчета_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY "Справочник"."МодельПрибораУчета" DROP CONSTRAINT "МодельПрибораУчета_pkey";
       Справочник            dbmaster    false    268                       2606    73982 6   ОбъектыУчета ОбъектыУчета_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ОбъектыУчета"
    ADD CONSTRAINT "ОбъектыУчета_pkey" PRIMARY KEY (id);
 t   ALTER TABLE ONLY "Справочник"."ОбъектыУчета" DROP CONSTRAINT "ОбъектыУчета_pkey";
       Справочник            dbmaster    false    269                       2606    73984 6   ПриборыУчета ПриборыУчета_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ПриборыУчета"
    ADD CONSTRAINT "ПриборыУчета_pkey" PRIMARY KEY (id);
 t   ALTER TABLE ONLY "Справочник"."ПриборыУчета" DROP CONSTRAINT "ПриборыУчета_pkey";
       Справочник            dbmaster    false    274                       2606    73986    Регион Регион_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY "Справочник"."Регион"
    ADD CONSTRAINT "Регион_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY "Справочник"."Регион" DROP CONSTRAINT "Регион_pkey";
       Справочник            dbmaster    false    276                       2606    73988 :   ТочкиПоставки ТочкиПоставки_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ТочкиПоставки"
    ADD CONSTRAINT "ТочкиПоставки_pkey" PRIMARY KEY (id);
 x   ALTER TABLE ONLY "Справочник"."ТочкиПоставки" DROP CONSTRAINT "ТочкиПоставки_pkey";
       Справочник            dbmaster    false    278                       2606    73990 .   ТочкиУчета ТочкиУчета_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Справочник"."ТочкиУчета"
    ADD CONSTRAINT "ТочкиУчета_pkey" PRIMARY KEY (id);
 l   ALTER TABLE ONLY "Справочник"."ТочкиУчета" DROP CONSTRAINT "ТочкиУчета_pkey";
       Справочник            dbmaster    false    280                       2620    83924 g   ДифференцированнаяЦенаПоЧасам ДифференцированнаяЦена    TRIGGER     $  CREATE TRIGGER "ДифференцированнаяЦена" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ДифференцированнаяЦенаПоЧасам" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ДифференцированнаяЦена"();
 �   DROP TRIGGER "ДифференцированнаяЦена" ON "Документ"."ДифференцированнаяЦенаПоЧасам";
       Документ          dbmaster    false    390    218                        2620    83926 a   КоэффициентОМиИнфрПлатеж КоэффициентОМиИнфрПлатеж    TRIGGER     "  CREATE TRIGGER "КоэффициентОМиИнфрПлатеж" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."КоэффициентОМиИнфрПлатеж" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_КоэффициентОМиИнфрПлатеж"();
 �   DROP TRIGGER "КоэффициентОМиИнфрПлатеж" ON "Документ"."КоэффициентОМиИнфрПлатеж";
       Документ          dbmaster    false    220    391            !           2620    83928 _   НерегулируемаяЦенаНаМощность НерегЦенаНаМощность    TRIGGER       CREATE TRIGGER "НерегЦенаНаМощность" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."НерегулируемаяЦенаНаМощность" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_НерегЦенаНаМощность"();
 �   DROP TRIGGER "НерегЦенаНаМощность" ON "Документ"."НерегулируемаяЦенаНаМощность";
       Документ          dbmaster    false    392    221            "           2620    83930 [   НерегулируемаяЦенаНаЭнергию НерегЦенаНаЭнергию    TRIGGER       CREATE TRIGGER "НерегЦенаНаЭнергию" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."НерегулируемаяЦенаНаЭнергию" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_НерегЦенаНаЭнергию"();
 �   DROP TRIGGER "НерегЦенаНаЭнергию" ON "Документ"."НерегулируемаяЦенаНаЭнергию";
       Документ          dbmaster    false    222    393            =           2620    83932 9   ПачкаПоказаний ПачкаПоказаний    TRIGGER     �   CREATE TRIGGER "ПачкаПоказаний" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПачкаПоказаний" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПачкаПоказаний"();
 b   DROP TRIGGER "ПачкаПоказаний" ON "Документ"."ПачкаПоказаний";
       Документ          dbmaster    false    285    394            <           2620    83934 Q   ПачкаПрофиляМощности ПачкаПрофиляМощности    TRIGGER     
  CREATE TRIGGER "ПачкаПрофиляМощности" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПачкаПрофиляМощности" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПачкаПрофиляМощности"();
 z   DROP TRIGGER "ПачкаПрофиляМощности" ON "Документ"."ПачкаПрофиляМощности";
       Документ          dbmaster    false    283    395            ?           2620    84206 U   ПерерасчетДоговораПродажи ПерерасчетПродажи    TRIGGER       CREATE TRIGGER "ПерерасчетПродажи" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПерерасчетДоговораПродажи" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПерерасчетПродажи"();
 ~   DROP TRIGGER "ПерерасчетПродажи" ON "Документ"."ПерерасчетДоговораПродажи";
       Документ          dbmaster    false    408    296            #           2620    83936 O   ПлановыеЧасыПиковойНагрузки ПлановыеЧасы    TRIGGER     �   CREATE TRIGGER "ПлановыеЧасы" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПлановыеЧасыПиковойНагрузки" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПлановыеЧасы"();
 x   DROP TRIGGER "ПлановыеЧасы" ON "Документ"."ПлановыеЧасыПиковойНагрузки";
       Документ          dbmaster    false    396    224            $           2620    83938 %   Показания Показания    TRIGGER     �   CREATE TRIGGER "Показания" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."Показания" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_Показания"();
 N   DROP TRIGGER "Показания" ON "Документ"."Показания";
       Документ          dbmaster    false    225    397            '           2620    83944 K   ПрофильМощностиРегистр ПрофильМощности    TRIGGER     �   CREATE TRIGGER "ПрофильМощности" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПрофильМощностиРегистр" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПрофильМощности"();
 t   DROP TRIGGER "ПрофильМощности" ON "Документ"."ПрофильМощностиРегистр";
       Документ          dbmaster    false    400    228            %           2620    83940 o   ПрофильМощностиГенерацииРегистр ПрофильМощностиГенерации    TRIGGER     0  CREATE TRIGGER "ПрофильМощностиГенерации" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПрофильМощностиГенерацииРегистр" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПрофильМощностиГенерации"();
 �   DROP TRIGGER "ПрофильМощностиГенерации" ON "Документ"."ПрофильМощностиГенерацииРегистр";
       Документ          dbmaster    false    226    398            &           2620    83942 c   ПрофильМощностиПотерьРегистр ПрофильМощностиПотерь    TRIGGER       CREATE TRIGGER "ПрофильМощностиПотерь" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПрофильМощностиПотерьРегистр" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПрофильМощностиПотерь"();
 �   DROP TRIGGER "ПрофильМощностиПотерь" ON "Документ"."ПрофильМощностиПотерьРегистр";
       Документ          dbmaster    false    399    227            (           2620    83946 U   РасчетДоговораПродажи РасчетДоговораПродажи    TRIGGER       CREATE TRIGGER "РасчетДоговораПродажи" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."РасчетДоговораПродажи" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_РасчетДоговораПродажи"();
 ~   DROP TRIGGER "РасчетДоговораПродажи" ON "Документ"."РасчетДоговораПродажи";
       Документ          dbmaster    false    229    401            )           2620    83948 Y   РеализацияТоваровУслуг РеализацияТоваровУслуг    TRIGGER       CREATE TRIGGER "РеализацияТоваровУслуг" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."РеализацияТоваровУслуг" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_РеализацияТоваровУслуг"();
 �   DROP TRIGGER "РеализацияТоваровУслуг" ON "Документ"."РеализацияТоваровУслуг";
       Документ          dbmaster    false    231    402            *           2620    83950 A   СбытоваяНадбавка СбытоваяНадбавка    TRIGGER     �   CREATE TRIGGER "СбытоваяНадбавка" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."СбытоваяНадбавка" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_СбытоваяНадбавка"();
 j   DROP TRIGGER "СбытоваяНадбавка" ON "Документ"."СбытоваяНадбавка";
       Документ          dbmaster    false    403    233            +           2620    83952 M   СкидкаТочкиПоставки СкидкаТочкиПоставки    TRIGGER       CREATE TRIGGER "СкидкаТочкиПоставки" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."СкидкаТочкиПоставки" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_СкидкаТочкиПоставки"();
 v   DROP TRIGGER "СкидкаТочкиПоставки" ON "Документ"."СкидкаТочкиПоставки";
       Документ          dbmaster    false    404    234            ,           2620    83954 Y   СчетНаОплатуПокупателю СчетНаОплатуПокупателю    TRIGGER       CREATE TRIGGER "СчетНаОплатуПокупателю" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."СчетНаОплатуПокупателю" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_СчетНаОплатуПокупателю"();
 �   DROP TRIGGER "СчетНаОплатуПокупателю" ON "Документ"."СчетНаОплатуПокупателю";
       Документ          dbmaster    false    235    405            -           2620    83956 M   ЧасыПиковойНагрузки ЧасыПиковойНагрузки    TRIGGER       CREATE TRIGGER "ЧасыПиковойНагрузки" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ЧасыПиковойНагрузки" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ЧасыПиковойНагрузки"();
 v   DROP TRIGGER "ЧасыПиковойНагрузки" ON "Документ"."ЧасыПиковойНагрузки";
       Документ          dbmaster    false    406    240            .           2620    73991 =   Организации ОрганизацииОбновить    TRIGGER     �   CREATE TRIGGER "ОрганизацииОбновить" AFTER UPDATE ON "Настройки"."Организации" FOR EACH ROW EXECUTE FUNCTION "Журналы"."Организации_Обновить"();
 h   DROP TRIGGER "ОрганизацииОбновить" ON "Настройки"."Организации";
       Настройки          dbmaster    false    362    244            /           2620    83585 ]   ГарантирующиеПоставщики ГарантирующиеПоставщики    TRIGGER     �   CREATE TRIGGER "ГарантирующиеПоставщики" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ГарантирующиеПоставщики" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ГП"();
 �   DROP TRIGGER "ГарантирующиеПоставщики" ON "Справочник"."ГарантирующиеПоставщики";
       Справочник          dbmaster    false    261    378            0           2620    83587 O   ДоговорКонтрагента1С ДоговорКонтрагента1С    TRIGGER       CREATE TRIGGER "ДоговорКонтрагента1С" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ДоговорКонтрагента1С" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ДоговорКонтрагента1С"();
 |   DROP TRIGGER "ДоговорКонтрагента1С" ON "Справочник"."ДоговорКонтрагента1С";
       Справочник          dbmaster    false    262    379            1           2620    83589 9   ДоговорПродажи ДоговорПродажи    TRIGGER     �   CREATE TRIGGER "ДоговорПродажи" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ДоговорПродажи" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ДоговорПродажи"();
 f   DROP TRIGGER "ДоговорПродажи" ON "Справочник"."ДоговорПродажи";
       Справочник          dbmaster    false    380    263            >           2620    84026 ]   ЗакрытыйПериодДоговораПродажи ЗакрытыйПериодДПР    TRIGGER       CREATE TRIGGER "ЗакрытыйПериодДПР" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ЗакрытыйПериодДоговораПродажи" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ЗакрытыйПериодДПР"();
 �   DROP TRIGGER "ЗакрытыйПериодДПР" ON "Справочник"."ЗакрытыйПериодДоговораПродажи";
       Справочник          dbmaster    false    407    294            2           2620    83583 -   Контрагенты Контрагенты    TRIGGER     �   CREATE TRIGGER "Контрагенты" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."Контрагенты" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_Контрагент"();
 Z   DROP TRIGGER "Контрагенты" ON "Справочник"."Контрагенты";
       Справочник          dbmaster    false    377    265            3           2620    83591 3   Контрагенты1С Контрагенты1С    TRIGGER     �   CREATE TRIGGER "Контрагенты1С" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."Контрагенты1С" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_Контрагенты1С"();
 `   DROP TRIGGER "Контрагенты1С" ON "Справочник"."Контрагенты1С";
       Справочник          dbmaster    false    381    266            4           2620    83593 I   МодельПрибораУчета МодельПрибораУчета    TRIGGER       CREATE TRIGGER "МодельПрибораУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."МодельПрибораУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_МодельПрибораУчета"();
 v   DROP TRIGGER "МодельПрибораУчета" ON "Справочник"."МодельПрибораУчета";
       Справочник          dbmaster    false    382    268            5           2620    83595 1   ОбъектыУчета ОбъектыУчета    TRIGGER     �   CREATE TRIGGER "ОбъектыУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ОбъектыУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ОбъектыУчета"();
 ^   DROP TRIGGER "ОбъектыУчета" ON "Справочник"."ОбъектыУчета";
       Справочник          dbmaster    false    269    383            6           2620    83597 E   ПремияПотребителю ПремияПотребителю    TRIGGER        CREATE TRIGGER "ПремияПотребителю" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ПремияПотребителю" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ПремияПотребителю"();
 r   DROP TRIGGER "ПремияПотребителю" ON "Справочник"."ПремияПотребителю";
       Справочник          dbmaster    false    384    272            7           2620    83599 ]   ПремияПотребителюАгента ПремияПотребителюАгента    TRIGGER     $  CREATE TRIGGER "ПремияПотребителюАгента" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ПремияПотребителюАгента" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ПремияПотребителюАгента"();
 �   DROP TRIGGER "ПремияПотребителюАгента" ON "Справочник"."ПремияПотребителюАгента";
       Справочник          dbmaster    false    385    273            8           2620    83601 1   ПриборыУчета ПриборыУчета    TRIGGER     �   CREATE TRIGGER "ПриборыУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ПриборыУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ПриборыУчета"();
 ^   DROP TRIGGER "ПриборыУчета" ON "Справочник"."ПриборыУчета";
       Справочник          dbmaster    false    386    274            9           2620    83603    Регион Регион    TRIGGER     �   CREATE TRIGGER "Регион" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."Регион" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_Регион"();
 F   DROP TRIGGER "Регион" ON "Справочник"."Регион";
       Справочник          dbmaster    false    276    387            :           2620    83605 5   ТочкиПоставки ТочкиПоставки    TRIGGER     �   CREATE TRIGGER "ТочкиПоставки" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ТочкиПоставки" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ТочкиПоставки"();
 b   DROP TRIGGER "ТочкиПоставки" ON "Справочник"."ТочкиПоставки";
       Справочник          dbmaster    false    388    278            ;           2620    83607 )   ТочкиУчета ТочкиУчета    TRIGGER     �   CREATE TRIGGER "ТочкиУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ТочкиУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ТочкиУчета"();
 V   DROP TRIGGER "ТочкиУчета" ON "Справочник"."ТочкиУчета";
       Справочник          dbmaster    false    389    280           