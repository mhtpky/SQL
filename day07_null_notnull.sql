/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadigini kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parametrelerden NULL olmayan
    ilk ifadeyi döndürür. Eger aldigi tüm ifadeler NULL ise NULL döndürürür.
    
    COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/              
    CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
    
/* ----------------------------------------------------------------------------
  ORNEK1: isim ’i NULL olanlari sorgulayiniz.
-----------------------------------------------------------------------------*/
    SELECT * FROM insanlar WHERE isim IS NULL;

/* ----------------------------------------------------------------------------
  ORNEK2: isim ’i NULL olmayanlari sorgulayiniz.
-----------------------------------------------------------------------------*/    
    SELECT * FROM insanlar WHERE isim IS NOT NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK3: isim 'i NULL olan ki?ilerin isim'ine NO NAME atay?n?z. 
-----------------------------------------------------------------------------*/  
    UPDATE insanlar SET isim='NO NAME' WHERE isim IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK4:   isim ’i NULL olanlara ‘Henuz isim girilmedi’
            adres ’i NULL olanlara ‘Henuz adres girilmedi’
            ssn ’i NULL olanlara ‘Henuz ssn girilmedi’ atayal?m.
-----------------------------------------------------------------------------*/
    UPDATE insanlar SET isim=COALESCE(isim,'Henuz isim girilmedi'),
                        adres=COALESCE(adres,'Henuz adres girilmedi'),
                        ssn=COALESCE(ssn, 'no ssn');
    
    
    SELECT * FROM insanlar;
    DELETE FROM insanlar;
    


    
