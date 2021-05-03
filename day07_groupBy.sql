/*============================= GROUP BY =====================================
    
    GROUP BY cümlecigi bir SELECT ifadesinde satirlari, sutunlarin degerlerine 
    göre özet olarak gruplamak için kullanilir. 
   
    GROUP BY cümlecegi her grup basina bir satir döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlari ile birlikte kullanilir.
    
    Tekrarli olan satirlari birlestirmeye olanak saglar.Ayni isimde ki kisilerin 
    maas top. 
==============================================================================*/
CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(9) 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satilan toplam meyve miktarlarini gösteren sorguyu
  yaziniz.
------------------------------------------------------------------------------*/
    
    SELECT isim,SUM(urun_miktari)TOP_URUN FROM manav
    GROUP BY isim;
    
/* ----------------------------------------------------------------------------
  ORNEK2: satilan meyve türüne (urun_adi) göre urun alan kisi sayisini gösteren
  sorguyu kisi sayisina gore yaziniz. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
    SELECT urun_adi,COUNT(isim)KISI_SAYISI 
    FROM manav
    WHERE urun_adi IS NOT NULL 
    GROUP BY urun_adi
    ORDER BY KISI_SAYISI;
    
/* ----------------------------------------------------------------------------
  ORNEK3: satilan meyve türüne (urun_adi) göre satilan MIN ve MAX urun
  miktarlarini MAX urun miktarina göre siralayarak listeyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/
    SELECT urun_adi,MAX(urun_miktari),MIN(urun_miktari)
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY MAX(urun_miktari);


/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adina göre satilan ürünlerin toplamini
  gruplandiran ve isime göre ters sirasida listeyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/
    SELECT isim,urun_adi,SUM(urun_miktari)
    FROM manav
    GROUP BY isim,urun_adi
    ORDER BY isim DESC;

/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adina göre satilan ürünlerin toplamini bulan ve
   bu toplam degeri 3'den fazlasi olan kayitlari toplam urun miktarina gore 
   ters siralayarak listeyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/
    SELECT isim, urun_adi, SUM(urun_miktari) AS toplam_miktar
    FROM manav
    GROUP BY isim,urun_adi
    HAVING SUM(urun_miktari) >= 3
    ORDER BY SUM(urun_miktari) DESC;
 
    DROP TABLE manav;
    -- AGGREGATE fonksiyonlari ile ilgili bir kosul koymak için GROUP BY’dan
    -- sonra HAVING cümlecigi kullanilir.
    
/* ----------------------------------------------------------------------------
  ORNEK6: satilan urun_adi’na göre MAX urun sayilarini siralayarak listeyen
  sorguyu yaziniz. NOT: Sorgu, sadece MAx urun_miktari MIN urun_miktarina
  esit olmayan kayitlari listelemelidir.
-----------------------------------------------------------------------------*/
    SELECT urun_adi,MAX(urun_miktari),MIN(urun_miktari)
    FROM manav
    GROUP BY urun_adi
    HAVING MAX(urun_miktari)<> MIN(urun_miktari)
    ORDER BY MAX(urun_miktari);