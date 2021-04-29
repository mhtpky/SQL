/*=====================CONSTRAINTS(KISITLAMALAR)===========================
• NOT NULL - Bir Sütunun NULL içermemesini garanti eder.

• UNIQUE - Bir sütundaki tüm degerlerin BENZERSIZ olmasini garanti eder.

• PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin
                BENZERSIZ olmasini garanti eder (NOT NULL ve UNIQUE birle?imi gibi)

• FOREIGN KEY - Baska bir tablodaki Primary Key’i referans göstermek için kullanilir. 
                Böylelikle, tablolar arasinda iliski kurulmus olur.

• CHECK - Bir sutundaki tüm verilerin belirlenen özel bir sarti saglamasni
        garanti eder.(yas verisi  dan byk olmali > buyukse veriyor degilse vemiyor)

• DEFAULT - Herhangi bir deger atanamadignda Baslangiç degerinin atanmasini saglar.
            Parcali veri girisinde veri girilmeyene default deger atar
==========================================================================*/
    
----------------------------------------------------------------
-- KISITLAMALAR (ORNEK1 - PRIMARY KEY)
----------------------------------------------------------------
    CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR(50)NOT NULL UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );

    INSERT INTO calisanlar VALUES('10001','Ahmet Aslan',7000,'13-APR-18');
    INSERT INTO calisanlar VALUES('10002', 'Mehmet Y?lmaz' ,12000, '14-APR-18');
    INSERT INTO calisanlar VALUES('10003', '', 5000, '14-APR-18');
    --ERROR >> NOT NULL UNIQUE dedigimz icin bos olmamali ve benzersiz olmali--
    --cannot insert NULL into ("HR"."CALISANLAR"."ISIM")--
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', NULL , '14-APR-18');
    -- ERROR>> cannot insert NULL into ("HR"."CALISANLAR"."MAAS")
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-APR-18');  
    INSERT INTO calisanlar VALUES('10005', 'Canan Yas', 4000, '12-APR-19');  
    --ERROR >> Primary key oldugu icin oncekilerle ayni olamaz unique olmali--
    --ORA-00001: unique constraint (HR.SYS_C006998) violated--
    INSERT INTO calisanlar VALUES('', 'Canan Yas', 4000, '12-APR-19');  
    --ERROR >> Primary key oldugu icin null olamaz
    --ORA-01400: cannot insert NULL into ("HR"."CALISANLAR"."ID")--
    INSERT INTO calisanlar VALUES('10006', 'Canan Yas', 4000, '12-APR-19');  


    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    -- Sadece bir satir silmek istersek-- 
    DELETE calisanlar
    WHERE id='10001';
    
    
 
   ----------------------------------------------------------------
    -- KISITLAMALAR (ORNEK2 - PRIMARY KEY ALTERNAT?F YÖNTEM)
    ----------------------------------------------------------------
    -- Bu yöntemde Kisitlamaya istedigimiz ismi atayabiliriz 
    -- ve DISABLE komutuyla istedigimizde pasif hale getirebiliriz. 
     CREATE TABLE calisanlar
    (
        id CHAR(5),
        isim VARCHAR(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id) 
    -- CONSTRAINT id_pk PRIMARY KEY(id) DISABLE >> yaptigimizda bu constraint'i iptal eder
    --                                          >> primary key ozelligini iptal etmis olur
      );  
    INSERT INTO calisanlar VALUES('10001','Ahmet Aslan',7000,'13-APR-18');
    INSERT INTO calisanlar VALUES('10002', 'Mehmet Yilmaz' ,12000, '14-APR-18');
    INSERT INTO calisanlar VALUES('10003', 'Can', 5000, '14-APR-18');
   
    ----------------------------------------------------------------
    -- KISITLAMALAR (ORNEK3 - FOREIGN KEY)
    ----------------------------------------------------------------
    CREATE TABLE adresler
   (
        adres_id CHAR(5), -- REFERENCES calisanlar(id), // 1.YOL
        sokak VARCHAR2(50),
        cadde VARCHAR2(30),
        sehir VARCHAR2(15),
        CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) --  2.YOL
        -- REFERENCES komutu ile calisanlar tablosunda ki id'yi refere etms olduk
        -- calisanlar parent adresler child olmus oldu
   );
   
    INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','Aga Sok', '30.Cad.','Antep');
    -- FK'ye null degeri atanabilir. 
    INSERT INTO adresler VALUES('','Aga Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Aga Sok', '30.Cad.','Antep');
    
   -- Parent'da olmayan bir id ye child'da ekleme yapilamaz
   -- INSERT INTO adresler VALUES('10004','Gel Sokak','60.Cad',Van');
   
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
   
    SELECT * FROM calisanlar,adresler
    WHERE id = '10001';
   
    -- Child tablo silinmeden parent tablo silinemez.
    DROP TABLE calisanlar;
    DROP TABLE adresler;

    -- FK ile birlestirilen tablolardaki tüm verileri çekmek için 
    -- JOIN islemi yapmak gerekir. Bu konuyu sonra görecegiz.
    SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;
    
    CREATE TABLE sehirler (
        alan_kodu NUMBER(3) DEFAULT 34,
        isim VARCHAR2(20) DEFAULT 'ISTANBUL',
        nufus NUMBER(8) CHECK(nufus>0)
        );
        
        INSERT INTO sehirler VALUES(54,'Sakarya',1250000);
        INSERT INTO sehirler VALUES('','',18000000);
        
        -- DEFAULT deger atanmasi icin Parcali veri girisi gerekmektedir 
        INSERT INTO sehirler (nufus) VALUES(500000);
        SELECT * FROM sehirler;
    