CREATE TABLE personel2 (
    id NUMBER(10) ,
    isim VARCHAR2(10),
    soyisim VARCHAR2(20),
    e_mail VARCHAR2(20),
    ise_baslama_tar DATE,
    is_unvani VARCHAR2(20),
    maas NUMBER
    );
    
    INSERT INTO personel2 VALUES(123456789, 'Ali', 'Can', 'alican@gmail.com', '10-APR-10', 'Isci', 5000);
    INSERT INTO personel2 VALUES(123456788, 'Veli', 'Cem', 'velicem@gmail.com', '10-JAN-12', 'Isci', 5500);
    INSERT INTO personel2 VALUES(123456787, 'Ayse', 'Gul', 'aysegul@gmail.com', '1-MAY-14', 'Muhasebeci', 4500);
    INSERT INTO personel2 VALUES(123456789, 'Fatma', 'Yasa', 'fatmayasa@gmail.com', '10-APR-09', 'Muhendis', 7500);
    
    SELECT * FROM personel2;
    
    /*--------------------------------------------------------------------------
    Tablodan maasi 5000’den az veya ünvani isçi olanlarin isimlerini listeleyin
    --------------------------------------------------------------------------*/
    SELECT isim FROM personel2
    WHERE maas<5000 OR is_unvani='Isci';
    
    /*--------------------------------------------------------------------------
    Soyadi Can, Cem veya Gül olanlar?n unvanlarini ve maaslarini listeleyin.
    --------------------------------------------------------------------------*/
    SELECT is_unvani, maas FROM personel2
    WHERE soyisim IN('Can','Cem','Gul');
    
    /*--------------------------------------------------------------------------
     Maasi 5000’den çok olanlarin email ve ise baslama tarihlerini listeleyin
    --------------------------------------------------------------------------*/
    SELECT e_mail, ise_baslama_tar FROM personel2
    WHERE maas>5000;
    
    /*--------------------------------------------------------------------------
    Maasi 5000’den çok veya 7000’den az olanlarin tüm bilgilerini listeleyiniz.  
    --------------------------------------------------------------------------*/
    SELECT * FROM personel2
    WHERE maas>5000 AND maas<7000;