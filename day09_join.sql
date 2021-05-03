/*============================== JOIN ISLEMLERI ===============================
    
    Set Operatorleri (Union,Intersect,Minus) farkli tablolardaki sutunlari 
    birlestirmek icin kullanilir.Farkli tablolardan sutunlari alip tek 1 sutun 
    haline getirir.
    
    Join islemleri ise farkl? Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.Her tablodan gelen sutun farkli bir sutun 
    olarak birlesip yeni tabloyu olusturmus olur
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
    ORACLE SQL'de 4 Cesit Join isemi kullanilabilmektedir.
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir
   
==============================================================================*/   
    CREATE TABLE sirketler 
    (
        sirket_id NUMBER(9), 
        sirket_isim VARCHAR2(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Toyota');
    INSERT INTO sirketler VALUES(101, 'Honda');
    INSERT INTO sirketler VALUES(102, 'Ford');
    INSERT INTO sirketler VALUES(103, 'Hyundai');
    
    CREATE TABLE siparisler
    (
        siparis_id NUMBER(9),
        sirket_id NUMBER(9), 
        siparis_tarihi DATE
    );
    
    INSERT INTO siparisler VALUES(11, 101, '17-Apr-2020');
    INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
    INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
    INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
    INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

    SELECT * FROM siparisler;
    SELECT * FROM sirketler;
    
/*=============================== FULL JOIN  ==================================
    
    FULL JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari 
    getirmek icin kullanilir. 
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    FULL JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/   
   
/* -----------------------------------------------------------------------------
  ORNEK1: sirketler ve siparisler ad?ndaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
    SELECT s.sirket_isim, sp.siparis_id, sp.siparis_tarihi, sp.siparis_id
    FROM sirketler s
    FULL JOIN siparisler sp
    ON s.sirket_id= sp.sirket_id;
    
    -- FULL Join’de iki tabloda var olan tum satirlar gosterilir.
    -- Bir olupda digerlerine olmayan alanlar bo birakildi.
    -- Join isleminde genelde iki tablodaki ortak olarak bulunan sutun, ON
    -- cumleciginde kosul yapisi kullanilir.
    
/*=============================== INNER JOIN  ==================================
   
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
   
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
================================================================================ 
   
/* -----------------------------------------------------------------------------
  ORNEK2: Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
    SELECT s.sirket_isim, sp.siparis_id, sp.siparis_tarihi,sp.sirket_id
    FROM sirketler s
    INNER JOIN siparisler sp
    ON  s.sirket_id = sp.sirket_id;
    
    -- INNER JOIN ile sadece iki tablodaki ortak olan satirlar secilir
    -- Diger ifadeyle iki tablodaki ortak olan sirket_id degerleri icin ilgili
    -- sutunlar listelenir
    
/*=============================== LEFT JOIN  ==================================
   
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir.
       
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/

/* -----------------------------------------------------------------------------
  ORNEK3: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
    SELECT sirket.sirket_isim, siparis.siparis_id, siparis.siparis_tarihi
    FROM sirketler sirket
    LEFT JOIN siparisler siparis
    ON sirket.sirket_id = siparis.sirket_id;
    
/*=============================== RIGHT JOIN  ==================================
   
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir.
       
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK4: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
  bunlara kar??l?k gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
    SELECT s.sirket_isim, sp.siparis_id, sp.siparis_tarihi,sp.sirket_id
    FROM sirketler s
    RIGHT JOIN siparisler sp
    ON  s.sirket_id = sp.sirket_id;
    
    -- RIGHT JOIN'de 2. tabloda ki tum satirlar gosterilir.
    -- 2 tablodaki satirlara 1.tablodan kosula uyan ortak satirlar gosterilir
    -- ancak ortak olmayan kisimlar bos kalirir.
    