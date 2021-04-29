/* ======================= SELECT - WHERE ==================================*/
CREATE TABLE ogrenciler
(
    id NUMBER(9),
    isim VARCHAR2(50),
    adres VARCHAR2(100),
    sinav_notu NUMBER(3)
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);

SELECT * FROM ogrenciler;

/* ============================================================================
   Verileri SELECT komutu ile veritabanindan çekerken filtreleme yapmak için 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanilabilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adiWHERE kosul;
==============================================================================*/
  
/* -----------------------------------------------------------------------------
  ORNEK1: Sinav notu 80'den büyük olan ögrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/  
SELECT * FROM ogrenciler
WHERE sinav_notu>80;

-- Notu 80 den buyuk olan ogrencilerin sadece ismi ve notu
SELECT isim,sinav_notu
FROM ogrenciler
WHERE sinav_notu>80;

/* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan ö?rencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
SELECT isim, adres
FROM ogrenciler
WHERE adres='Ankara';

/* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan ö?rencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
SELECT * FROM ogrenciler
WHERE id=124;


/* ======================= SELECT - BETWEEN ==================================*/ 
CREATE TABLE personel
(
    id CHAR(5),
    isim VARCHAR2(50),
    maas NUMBER(5)
);
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Yilmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ay?e Can', 4000);

    SELECT * FROM personel;
    
    DROP TABLE personel;
    
 /*=====================BETWEEN=================*/
    -- NOT:BETWEEN iki mantiksal ifade ile tanmlayabilecegimiz durumlar? 
    -- tek komutla yazabilme imkâni verir. Yazdigimiz 2 sinir da araliga dahildir.
/*===============================================*/
    
/* -------------------------------------------------------------------------
     ORNEK4: id'si 10002 ile 10005 aras?nda olan personelin bilgilerini listele
--------------------------------------------------------------------------*/
    --1.Yöntem (AND) 
    SELECT * FROM personel
    WHERE id BETWEEN'10002' AND '10005';
    
    --2.Yöntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ÜST LIMITLER DAHILDIR.
    
/* ------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yilmaz ile Veli Han arasindaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
--------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE isim BETWEEN 'Mehmet Yilmaz' AND 'Veli Han';
    
/* -------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 arasinda olmayan personelin bilgilerini listele
 ---------------------------------------------------------------------------*/ 
     SELECT * FROM personel
     WHERE id NOT BETWEEN '10002' AND '10004';
     
     
/* ======================= SELECT - IN ======================================
    IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari
    tek komutla yazabilme imkâni verir
    
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_ad?
    WHERE sutun_ad? IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
     --1. YOL > OR yontemi ile
     SELECT * FROM personel
     WHERE id='10001' OR id='10002' OR id='10004';
     
     --2. YOL > IN yontemi ile
     SELECT * FROM personel
     WHERE id IN('10001','10002','10004');
     
 /* ------------------------------------------------------------------------
ORNEK8: Maasi sadece 7000  ve 12000 olan personelin bilgilerini listele
 --------------------------------------------------------------------------*/  
     SELECT * FROM personel
     WHERE maas IN('7000','12000');
     
     
 /* ======================= SELECT - LIKE =================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak saglar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adi 
    WHERE sütun LIKE pattern
    
    PATTERN ?Ç?N
    -------------
        %  ---> 0 veya daha fazla karakteri belirtir. 
        _  ---> Tek bir karakteri temsil eder.
/* ====================================================================== */
    
/* ------------------------------------------------------------------------
ORNEK9:  ismi A harfi ile baslayanlari listeleyiniz
-------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
    
/* ------------------------------------------------------------------------
 ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
--------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 
/* -------------------------------------------------------------------------
ORNEK11:  isminin 2. harfi e olanlar? listeleyiniz
 --------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
    
/* ----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diger harflerinde y olanlari listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';
    
    --isminde an kelimesi gecen personel
    SELECT * FROM personel
    WHERE isim LIKE '%an%';
    

/* ----------------------------------------------------------------------------
  ORNEK13:  ismi A ile baslamayanlari listeleyiniz
  ----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';

/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';

 /* -----------------------------------------------------------------------------
  ORNEK16:  maasinin son 2 hanesi 00 olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';
    

/* -----------------------------------------------------------------------------
  ORNEK17:  maasinin 4000 olmayanlari listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
/* -----------------------------------------------------------------------------
  ORNEK18: maasi 5 haneli olanlari listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
/* -----------------------------------------------------------------------------
  ORNEK19: maasinin  5 haneli olmayanlar? listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
 /*======================= SELECT - REGEXP_LIKE =============================
    Daha karmasik pattern ile sorgulama islemi için REGEXP_LIKE kullanilabilir.
    Cogunlukla validasyonlarda tercih edilir.
    Syntax:
    --------
    REGEXP_LIKE(sutun_ad?, ‘pattern[] ’, ‘c’ ] )
           
    ======================================================================= */
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
     
/* -----------------------------------------------------------------------------
  ORNEK21: Içerisinde 'hi' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
  
/* -----------------------------------------------------------------------------
  ORNEK22: içerisinde 'ot' veya 'at' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- VEYA islemi | karakteri ile yapilir
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
/* -----------------------------------------------------------------------------
  ORNEK23: ?çerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
     -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
/* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile ba?layan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Ba?lang?c? göstermek için ^ karakteri kullan?l?r.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^hi|^ho', 'i');
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Biti?i göstermek için $ karakteri kullan?l?r.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile ba?lay?p t ile biten 3 harfli kelimeleri büyük-küçük harfe 
  dikkat etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- '-' karakteri bir aralik verir
    -- [] koseli parantez tek bir karakter gosterir
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^h[a-z0-9]t$', 'i');
    -- '^h[a-z0-9]t$' yerine '^h|t$' yapsaydik 3 harfliden fazla olan kelimleri de yazdiracakti
    
 /* -----------------------------------------------------------------------------
  ORNEK27: ?lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayal?m.
 -----------------------------------------------------------------------------*/ 
    -- [] icinde ki karakterler veya seklinde okunur
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^h[ai]t$', 'i');
    
/* -----------------------------------------------------------------------------
  ORNEK28: ?çinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/   
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'm|i|e' , 'i');
 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mie](*)', 'i');
    -- Burada ki * devaminda ne olursa olsun demektir, LIKE'daki % gibi..
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[mie]', 'i'); 
    
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile ba?layan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');

    
 /* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo bar?d?ran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'[o]{2}','i');
   
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[a]{2}', 'i');
    
/* -----------------------------------------------------------------------------
  ÖRNEK31: Ilk harfi h, son harfi t olup 2.harfi a ile k aras?nda olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayal?m
-----------------------------------------------------------------------------*/
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-k]t');