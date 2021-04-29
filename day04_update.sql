/* ============================== UPDATE SET ===================================    
    
 ilk olarak asagidaki gibi tedarikciler adinda bir tablo olusturun ve 
   vergi_no sutununu primary key yap?n?z.Ay?ra a???daki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonras?nda a?a??daki gibi urunler ad?nda bir ba?ka tablo olu?turunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutular?
    yard?m?yla ili?ki kurunuz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay?e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y?lmaz');
    
==============================================================================*/  
    CREATE TABLE tedarikciler
    (
        vergi_no NUMBER(3),
        firma_ismi VARCHAR2(50),
        irtibat_ismi VARCHAR2(50),
        CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
    );  
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    
    CREATE TABLE urun
    (
        ted_vergino NUMBER(3), 
        urun_id NUMBER(11), 
        urun_isim VARCHAR2(50), 
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urun FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    
    INSERT INTO urun VALUES(101, 1001,'Laptop', 'Ay?e Can');
    INSERT INTO urun VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urun VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urun VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urun VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urun VALUES(104, 1007,'Phone', 'Aslan Y?lmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urun;
    
    -- SYNTAX
    --------------
    -- UPDATE tablo_adi
    -- SET sutun_Adi = yeni_deger
    -- WHERE sutun_Adi;
    
    /*-------------------------------------------------------------------------
     ORNEK1: vergi_no’su 101 olan tedarikcinin ismini ‘LG’olarak güncelleyeniz.
    -------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergi_no = 101;
    

    /*-------------------------------------------------------------------------
     ORNEK2: tedarikciler tablosunda ki tum firma isimlerini ‘SAMSUNG’olarak güncelleyeniz.
    -------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET firma_ismi = 'SAMSUNG';
    
    -- Tablonun icerigini siler
    DELETE FROM urun;  -- DROP TABLE tabloyu siler
    
    /*-------------------------------------------------------------------------
     ORNEK3: vergi_no 102 olan tedarikcinin ismini ‘SAMSUNG’ ve irtibat_ismi'ni
     'Ali Veli' olarak güncelleyeniz.
    -------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET firma_ismi='SAMSUNG', irtibat_ismi='Ali Veli'
    WHERE vergi_no=102;
    
    
    /* -------------------------------------------------------------------------
      ORNEK4: ismi Samsung olan tedarikcinin irtibat_ismini ‘Ay?e Y?lmaz’ olarak
      güncelleyiniz.
     -------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET irtibat_ismi = 'Ayse Yilmaz'
    WHERE firma_ismi = 'SAMSUNG';
    
    /*-------------------------------------------------------------------------
    ORNEK5: urunler tablosundaki ‘Phone’ de?erlerini Telefon olarak güncelleyiniz.
    --------------------------------------------------------------------------*/
    UPDATE urun
    SET urun_isim = 'Telefon'
    WHERE urun_isim = 'Phone';
    
    /*--------------------------------------------------------------------------
    ORNEK6: urunler tablosundaki urun_id de?eri 1004'ten büyük olanlar?n urun_id
    de?erlerini bir artt?r?n?z
    --------------------------------------------------------------------------*/
    UPDATE urun
    SET urun_id = urun_id+1
    WHERE urun_id > 1004;

    
    /* -------------------------------------------------------------------------
    ORNEK5: urunler tablosundaki tüm ürünlerin urun_id de?erini ted_vergino
    sutun de?erleri ile toplayarak güncelleyiniz.
    --------------------------------------------------------------------------*/
    UPDATE urun
    SET urun_id = urun_id + ted_vergino;
   
    SELECT * FROM tedarikciler;
    SELECT * FROM urun;
    
    /*=========================================================================
   ORNEK6: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci
   tablosunda irtibat_ismi ‘Adam Eve’ olan firman?n ismi (firma_ismi) ile
   degistiriniz.
    ==========================================================================*/
    UPDATE urun
    SET urun_isim = (SELECT firma_ismi FROM tedarikciler 
                    WHERE irtibat_ismi = 'Adam Eve')
    WHERE musteri_isim = 'Ali Bak';
    
    /*==========================================================================
    ORNEK7: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim’i ile
     degistirin
     =========================================================================*/
     UPDATE urun
     SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler
                        WHERE firma_ismi = 'Apple')
     WHERE urun_isim='Laptop';