/*======================= DELETE =============================== 

-- DELETE FROM tablo_adi; Tablonun tum icerigini siler
-- Bu komut bir DML komutudur. Dolayisiyla devaminda 
-- WHERE gibi cumlecikler kullanilablir

-- DELETE FROM tabli_adi
-- WHERE sutun_adi = veri; >> bu sart gerceklestiginde ilgili satir silinir
========================================================================*/
CREATE TABLE ogrenciler(
     id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);

/*=======================================================================
    Seçerek silmek için WHERE Anahtar kelimesi kullanilabilir.
========================================================================*/
    
    -- id si 124 olan ogrenciler
    DELETE FROM ogrenciler
    WHERE id=124;
    
    -- adi Kemal Yasa olan kaydi sileleim
    DELETE FROM ogrenciler
    WHERE isim = 'Kemal Yasa';
    
    -- adi Nesibe Yilmaz  ve Mustafa Bak olan kayitlari sileleim
    DELETE FROM ogrenciler
    WHERE isim IN('Nesibe Yilmaz','Mustafa Bak');
    -- WHERE isim = ' Nesibe Yilmaz' OR 'Mustafa Bak';
    
    ---- ismi Ali Can ve id 123 olan kaydi silin
    DELETE FROM ogrenciler
    WHERE isim='Ali Can' AND id=;
    
    -- id'si 126'dan buyuk olan kayitlari silelim
    DELETE FROM ogrenciler
    WHERE id>126;
    
    -- id' si 123,125 ve 126 olanlari silelim
    DELETE FROM ogrenciler
    WHERE id IN (123,125,126);

    -- tabloda ki tum kayitlari silelim
    DELETE FROM ogrenciler;
    
    ROLLBACK ; -- delete ile silinen verileri geri getirir
    
    SELECT * FROM ogrenciler;
    
    DROP TABLE ogrenciler; -- (DDL komutudur)
    -- Tum tabloyu siler ve veri tabani cop kutusuna gonderir.
    
    FLASHBACK TABLE ogrenciler TO BEFORE DROP; -- Cop kutusunda olan tabloyu geri getir
    
    DROP TABLE ogrenciler PURGE; -- Cop kutusuna atmadan tamamen siler
    
/* =============  TRUNCATE ======================== */
   
   -- DELETE GIBI TUM VERILERI SILER. 
   -- Secmeli silme yapmaz yani where alamaz. Cunku DDL komutudur
   -- Truncate ile silme yapildiginda ROOLLBACK ile geri alinamaz
   -- Hassas silme islemi yapar.
   
/* ======================== DELETE - TRUNCATE - DROP ============================  
   
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamini siler.
    Ancak, seçmeli silme yapamaz. Çünkü Truncate komutu DML degil DDL komutudur.
   
    2-) DELETE komutu beraberinde WHERE cümlecigi kullanilabilir. TRUNCATE ile
    WHRERE kullanilmaz.
   
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylikla geri
    al?nabilir.
   
    4-) Truncate ile silinen verilerin geri alinmasi daha zordur. Ancak
    Transaction yöntemi ile geri alinmasi mümkün olabilir.
   
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da
    siler. Silinen tablo Veritabaninin geri dönüsüm kutusuna gider. Silinen
    tablo asagidaki komut ile geri alinabilir. Veya SQL GUI’den geri alinabilir.
       
     FLASHBACK TABLE tablo_adi TO BEFORE DROP;  -> tabloyu geri alir.
    
     PURGE TABLE tablo_adi;        -> Geri dönüsümdeki tabloyu siler.
           
     DROP TABLE tablo_adi PURGE;  -> Tabloyu tamamen siler
==============================================================================*/

    TRUNCATE TABLE ogrenciler; -- Tum verileri hassas sekilde siler(DDL)
    SELECT * FROM ogrenciler;
    
    
/*============================== ON DELETE CASCADE =============================

  Her defasinda önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelligini aktif hale getirebiliriz.
  
  Bunun için FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
CREATE TABLE talebeler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
    
     CREATE TABLE notlar 
    ( 
        talebe_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE
        -- ON DELETE CASCADE >> Parent'da ki silinen bir kayit ile iliskili 
        -- olan tum child kayitlarini otomatikman siler.
        -- parent'dan silmek istedigimz veriyi once child'den silmek durumunda kalmams oluruz
    );

    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);

    SELECT * FROM talebeler;
    SELECT * FROM notlar;

-- Parent chil iliskisi olan tablolarda child silinmeden parent silinemez
    DELETE FROM notlar
    WHERE talebe_id =124;
    
    DELETE FROM talebeler
    WHERE id=124;

  


