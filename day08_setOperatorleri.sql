/*==================== SET OPERATORLERI: UNION, UNION ALL======================
    
    UNION, UNION ALL, INTERSECT, ve MINUS gibi SET operatorleri yardimiyla  
    ?oklu Sorgular birlestirilebilirler.
    
    Set operatorleri ile iki farkli tablodan sutunlar birlestirilebilir.
    Sutun birlestirme >>> SET
    Tablo birlestirme >>> JOIN
    
    UNION :  Bir SET operatorudur. 2 veya daha fazla Sorgu ifadesinin sonuc 
    kumelerini birlestirerek tek bir sonuc kumesi olusturur.  
    A birlesim B > tekrarli sorgulari almak istemedigimzde kullanlr
    
    UNION ALL >> A birlesim B > tekrarli sorgulari da almak istedigimizde kullanlr
    
    INTERSECT >> A kesisim B
    
    MINUS >> A fark B
   
    NOT:  Birlesik olan Sorgu ifadesinin veri t?r? diger sorgulardaki 
    ifadelerin veri t?r? ile uyumlu olmalidir.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersiz degerleri alir. Benzerli verileri almak
    i?in UNION ALL kullanilir.
==============================================================================*/
CREATE TABLE personel1
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel1_pk PRIMARY KEY(id)
    );
    
    INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel1 VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
    SELECT * FROM personel1;

/* -----------------------------------------------------------------------------
  ORNEK1: Maasi 4000?den cok olan isci isimlerini ve 5000 liradan fazla maas
  alinan sehirleri gosteren sorguyu yaziniz
------------------------------------------------------------------------------*/
    SELECT isim AS isim_veya_sehir,maas
    FROM personel1 
    WHERE maas>4000
    UNION 
    SELECT sehir,maas FROM personel1 
    WHERE maas>5000; 

/* -----------------------------------------------------------------------------
  ORNEK2: Maasi 4000?den cok olan isci isimlerini ve 5000 liradan fazla maas
  alinan sehirleri gosteren sorguyu Tekrarli verileri de g?sterecek sekilde
  yaziniz.
------------------------------------------------------------------------------*/
    SELECT isim AS isim_veya_sehir,maas 
    FROM personel1 
    WHERE maas>4000
    UNION ALL            -- UNION ALL kullanilirsa tekrarli veriler elenmez
    SELECT sehir,maas 
    FROM personel1 
    WHERE maas>5000; 
    
/* -----------------------------------------------------------------------------
  ORNEK3: Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul?daki
  personelin maaslarini y?ksekten asaga dogru siralayarak bir tabloda gosteren
  sorguyu yaziniz.   
------------------------------------------------------------------------------*/
    SELECT isim,maas
    FROM personel1 
    WHERE isim='Mehmet Ozturk'
    UNION
    SELECT sehir,maas 
    FROM personel1 
    WHERE sehir='Istanbul' 
    ORDER BY maas desc;
    
/*======================== FARKLI TABLOLARDAN BIRLESTIRME ====================*/   
    
    CREATE TABLE personel_bilgi 
    (
        id NUMBER(9), 
        tel char(10) UNIQUE , 
        cocuk_sayisi NUMBER(2), 
        CONSTRAINT fk_personel FOREIGN KEY (id) REFERENCES personel1(id) 
    ); 
    
    INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);
    INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
    INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3); 
    INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
    INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
    INSERT INTO personel_bilgi VALUES(453445611, '5524578574', 2);
    INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

    SELECT * FROM personel_bilgi;
?
/* -----------------------------------------------------------------------------
  ORNEK4: id?si 123456789 olan personelin Personel tablosundan sehir ve 
  maasini, personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin  
------------------------------------------------------------------------------*/
    SELECT sehir AS sehir_tel,maas AS maas_cocukSayisi 
    FROM personel1 
    WHERE id=123456789
    UNION
    SELECT tel,cocuk_sayisi 
    FROM personel_bilgi 
    WHERE id=123456789;
    
    -- sehir ile tel, maas ile cocuk ayni sutunda birlestigi icin 
    -- veri tipleri uygun olmalidir.
    
/*========================= SET OPERATORLERI: INTERSECT ========================
    
    INTERSECT operarotu 2 veya daha fazla Sorgu ifadesinin sonuclarini 
    dondurmek icin kullanilir. Ancak, intersect SADECE tum sorgularin ortak 
    verilerini (kesimlerini) dondurur. 
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    INTERSECT
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
==============================================================================*/

/* -----------------------------------------------------------------------------
  ORNEK5: Personel tablosundan Istanbul veya Ankara?da calisanlarin id?lerini
  sorgulayiniz. 
 
  Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini sorgulayiniz.
  Bu iki sorguyu INTERSECT ile birlesitiriniz.
------------------------------------------------------------------------------*/  
    SELECT id FROM personel1 WHERE sehir IN('Istanbul', 'Ankara')
    INTERSECT
    SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3);
    
 /* -----------------------------------------------------------------------------
  ORNEK6: Honda,Ford ve Tofas?ta calisan ortak isimde personel varsa listeleyin
------------------------------------------------------------------------------*/  
    SELECT isim FROM personel1 WHERE sirket ='Honda'
    INTERSECT
    SELECT isim FROM personel1 WHERE sirket ='Ford'
    INTERSECT
    SELECT isim FROM personel1 WHERE sirket ='Tofas';
    
/* -----------------------------------------------------------------------------
  ORNEK7: Toyota ve Ford sirketlerinde ayni maasi alan personel isimlerini
  listeleyin
------------------------------------------------------------------------------*/  
    SELECT isim,maas FROM personel1 WHERE sirket='Toyota'
    INTERSECT 
    SELECT isim,maas FROM personel1 WHERE sirket='Ford';
    
/*========================= SET OPERATORLERI: MINUS ============================
    
    MINUS operatoru ilk Sorgu ifadesinde olup da diger sorgu ifadesinde olmayan 
    verileri dondurur. Yani 1. sorgu ile 2. sorgu arasindaki farkli olanlari
    dondurur
    
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    MINUS
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
==============================================================================*/


/* -----------------------------------------------------------------------------
  ORNEK8: 5000?den az maas alan ve Honda calisani olmayanlarin bilgilerini
  listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/ 
    -- 1.YONTEM (maasi 5000 den az olanlar ile 
    -- sirketi Honda olmayanlari (!=) sec)
    SELECT isim,maas, sirket FROM personel1 WHERE maas < 5000 
    INTERSECT
    SELECT isim, maas ,sirket FROM personel1 WHERE sirket != 'Honda';
    
    -- 2.YONTEM (maasi 5000 den az olanlar ile 
    -- sirketi Honda'dan farkli olanlari se?.
    SELECT isim,maas,sirket FROM personel1 WHERE maas < 5000 
    MINUS
    SELECT isim, maas ,sirket FROM personel1 WHERE sirket = 'Honda';
   
    --3.yol /// set operatorlerini kullanmadan cozum
    SELECT *  FROM personel1
    WHERE maas<5000 AND sirket!='Honda';
    
    
/* -----------------------------------------------------------------------------
  ORNEK8: Ismi Mehmet Ozturk olup Istanbul?da calismayanlarin isimlerini ve 
  sehirlerini listeleyen sorguyu yaziniz.
------------------------------------------------------------------------------*/
    SELECT isim, sehir  FROM personel1 WHERE isim='Mehmet Ozturk'
    MINUS
    SELECT isim, sehir FROM personel1 WHERE sehir='Istanbul';
    
-- MINUS'da UNION gibi tekrarli satirlardan sadece bir tanesini listeler.