/*================================ ORDER BY  ===================================
   ORDER BY cümleci?i bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullan?l?r.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/
CREATE TABLE kisiler 
    (
        ssn CHAR(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );
    
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');

    SELECT * FROM kisiler;
/* ----------------------------------------------------------------------------
  ORNEK1: insanlar tablosunu adres’e göre siralayarak sorgulayiniz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler 
    ORDER BY adres; -- ASC gibi siraladi
  
/* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas’a göre siralayarak sorgulayiniz
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler 
    ORDER BY maas; 
    
/* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas’a göre AZALAN sirada sorgulayiniz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler 
    ORDER BY maas DESC; -- Azalana siraya gore siraladi

/*----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlari, SSN’e göre AZALAN sirada sorgulayiniz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler 
    WHERE isim='Mine' 
    ORDER BY ssn DESC; 
    
/*----------------------------------------------------------------------------
  ORNEK5: soyismi Bulut olanlari, isim sirali olarak sorgulayiniz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    WHERE soyisim='Bulut'
    ORDER BY 2; -- isim sutunu 2. sutun oldugu icin bu sekilde de yazilabilir

