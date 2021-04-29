/*============================= GROUP BY =====================================
    
    GROUP BY c�mlecigi bir SELECT ifadesinde satirlari, sutunlarin degerlerine 
    g�re �zet olarak gruplamak i�in kullanilir. 
   
    GROUP BY c�mlecegi her grup basina bir satir d�nd�r�r. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlar? ile birlikte kullan?l?r.
    
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
  ORNEK1: kisi ismine g�re satilan toplam meyve miktarlarini g�steren sorguyu
  yaziniz.
------------------------------------------------------------------------------*/
    SELECT isim,SUM(urun_miktari)TOP_URUN FROM manav
    GROUP BY isim;
    
/* ----------------------------------------------------------------------------
  ORNEK2: satilan meyve t�r�ne (urun_adi) g�re urun alan kisi sayisini g�steren
  sorguyu kisi sayisina gore yaziniz. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
    SELECT urun_adi,COUNT(isim)KISI_SAYISI 
    FROM manav
    WHERE urun_adi IS NOT NULL 
    GROUP BY urun_adi
    ORDER BY KISI_SAYISI;
    
