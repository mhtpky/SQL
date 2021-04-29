CREATE TABLE hastaneler (
    id VARCHAR2(4),
    isim VARCHAR2(20),
    sehir VARCHAR2(15),
    ozel_mi VARCHAR2(5),
    CONSTRAINT pk_hastane PRIMARY KEY (id)
    );
    
    INSERT INTO hastaneler VALUES ('H101', 'ACI MADEM HASTANESI', 'ISTANBUL','Y');
    INSERT INTO hastaneler VALUES ('H102', 'HAS ZEKI HASTANESI', 'ISTANBUL','N');
    INSERT INTO hastaneler VALUES ('H103', 'MEDIKOL HASTANESI', 'IZMIR','Y');
    INSERT INTO hastaneler VALUES ('H104', 'MEMORYIL HASTANESI', 'ANKARA','Y');
    
     SELECT * FROM hastaneler;
    
CREATE TABLE hastalar (
    kimlik_no NUMBER(11),
    isim VARCHAR2(20),
    teshis VARCHAR2(20),
    CONSTRAINT ph_hasta PRIMARY KEY(kimlik_no)
    );
    
    INSERT INTO hastalar VALUES (12345678901,'Ali Can', 'Gizli Seker');
    INSERT INTO hastalar VALUES (45678901121,'Ayse Yilmaz', 'Hipertansiyon');
    INSERT INTO hastalar VALUES (78901123451,'Steve Job', 'Pankreatit');
    INSERT INTO hastalar VALUES (12344321251,'Tom Hanks', 'COVID19');
    
    SELECT * FROM hastalar;
    
CREATE TABLE bolumler (
    bolum_id VARCHAR2(10),
    bolum_adi VARCHAR2(20),
    CONSTRAINT pk_bolum PRIMARY KEY(bolum_id)
    );
    
    INSERT INTO bolumler VALUES ('DHL', 'Dahiliye');
    INSERT INTO bolumler VALUES ('KBB', 'Kulak-Burun-Bogaz');
    INSERT INTO bolumler VALUES ('NRJ', 'Noroloji');
    INSERT INTO bolumler VALUES ('GAST', 'Gastroloji');
    INSERT INTO bolumler VALUES ('KARD', 'Kardiyoloji');
    INSERT INTO bolumler VALUES ('PSK', 'Psikiyatri');
    INSERT INTO bolumler VALUES ('GOZ', 'Goz Hastaliklari');
    
    SELECT * FROM bolumler;
    
CREATE TABLE hasta_kayitlar (
    kimlik_no NUMBER(11),
    hasta_isim VARCHAR2(20),
    hastane_adi VARCHAR2(20),
    bolum_adi VARCHAR2(20),
    teshis VARCHAR2(20),
    CONSTRAINT pk_kimlk PRIMARY KEY (kimlik_no)
    );
    
    INSERT INTO hasta_kayitlar VALUES(1111,'NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES(2222,'NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES(3333,'NONAME','','','');
    
/*===============================================================================
    hasta_kayitlar tablosundaki ‘3333’ kimlik nolu kaydi asagidaki gibi güncelleyiniz. 
    hasta_isim :  ‘Salvadore Dali’ ismi ile
    hastane_adi:‘John Hopins’
    bolum_adi:‘Noroloji’
    teshis:‘Parkinson’
    kimlik_no:‘99991111222’
=================================================================================*/

    UPDATE hasta_kayitlar
    SET hasta_isim = 'Salvadore Dali' , 
        hastane_adi='John Hopins',
        bolum_adi='Noroloji',
        teshis = 'Parkinson',
        kimlik_no = 99991111222
    WHERE kimlik_no = 3333 ;


/*===============================================================================
    hasta_kayitlar tablosundaki ‘1111’ kimlik nolu kaydi asagidaki gibi güncelleyiniz. 
    hasta_isim :  hastalar tablosundaki‘Ali Can’ ismi ile
    hastane_adi:hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
    bolum_adi:bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
    teshis:hastalar tablosundaki 'Ali Can'isimli hastan?n teshis bilgisi ile
    kimlik_no:hastalar tablosundaki 'Ali Can'isimli hastan?n kimlik_no kodu ile 
================================================================================*/
    UPDATE hasta_kayitlar
    SET hasta_isim = (SELECT isim FROM hastalar WHERE isim='Ali Can'),
        hastane_adi =( SELECT isim FROM hastaneler WHERE id='H104'),
        bolum_adi = (SELECT bolum_adi FROM bolumler WHERE bolum_id='DHL'),
        teshis = (SELECT teshis FROM hastalar WHERE isim='Ali Can'),
        kimlik_no = (SELECT kimlik_no FROM hastalar WHERE isim= 'Ali Can')
    WHERE kimlik_no = 1111;
    
    
/*==============================================================================
    hasta_kayitlar tablosundaki ‘2222’kimlik nolu kayd? asagidaki gibi güncelleyiniz. 
    hasta_isim : hastalar tablosundaki‘Ayse Yilmaz’ ismi ile
    hastane_adi: hastaneler tablosundaki 'H103' bolum_id kodlu hastanenin ismi ile
    bolum_adi: bolumler tablosundaki ‘KBB’ bolum_id kodlu bolum_adi ile 
    teshis: hastalar tablosundaki ‘Tom Hanks'isimli hastan?n teshis bilgisi ile 
    kimlik_no: hastalar tablosundaki 'Stevev Job'isimli hastan?n kimlik_no kodu ile
===============================================================================*/
    UPDATE hasta_kayitlar
    SET hasta_isim = (SELECT isim FROM hastalar WHERE isim='Ayse Yilmaz'),
        hastane_adi = (SELECT isim FROM hastaneler WHERE id = 'H103'),
        bolum_adi = (SELECT bolum_adi FROM bolumler WHERE bolum_id ='KBB'),
        teshis =(SELECT teshis FROM hastalar WHERE isim='Tom Hanks'),
        kimlik_no = (SELECT kimlik_no FROM hastalar WHERE isim='Steve Job')
    WHERE kimlik_no = 2222;
    
    SELECT * FROM hasta_kayitlar;