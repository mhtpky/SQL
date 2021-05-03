/*============================= DISTINCT =====================================
   
    DISTINCT cümlecigi bir SORGU ifadesinde benzer olan satirlari flitrelemek
    için kullanilir. Dolayisiyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satirlar olusturmaya yarar.
  
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, column_3
    FROM  tablo_adi;
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
/* ----------------------------------------------------------------------------
  ORNEK1: satilan farkli meyve türlerinin sayisini  listeyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/
    SELECT COUNT(DISTINCT urun_adi) AS urun_sayisi
    FROM manav;

/* ----------------------------------------------------------------------------
  ORNEK2: satilan meyve ve isimlerin farkli olanlarini listeyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/
    SELECT DISTINCT isim,urun_adi 
    FROM manav;
    
/* ----------------------------------------------------------------------------
  ORNEK3: satilan meyvelerin urun_mikarlarinin benzersiz toplamlarini
  listeyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/
    SELECT SUM(DISTINCT urun_miktari) AS urun_sayisi
    FROM manav;
    
    