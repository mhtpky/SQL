/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operator? bir Boolean operat?rd?r ve true - false de?er d?nd?r?r. 
    EXISTS operator? s?kl?kla Subquery'lerde sat?rlar?n do?rulu?unu test etmek 
    i?in kullan?l?r.
    
    E?er bir subquery (altsorgu) bir sat?r? d?nd?r?rse EXIST operat?r? de TRUE 
    de?er d?nd?r?r. Aksi takdirde, FALSE de?er d?nd?recektir.
    
    ?zellikle altsorgularda h?zl? kontrol i?lemi ger?ekle?tirmek i?in kullan?l?r
==============================================================================*/
    CREATE TABLE mart_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    CREATE TABLE nisan_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
    
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
    
    DELETE FROM nisan_satislar;
    
/* -----------------------------------------------------------------------------
  ORNEK1: MART VE N?SAN aylar?nda ayn? URUN_ID ile sat?lan ?r?nlerin
  URUN_ID?lerini listeleyen ve ayn? zamanda bu ?r?nleri MART ay?nda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yaz?n?z. 
 -----------------------------------------------------------------------------*/       
    -- tablolara k?sa isim vermek m?mk?nd?r. B?ylece sorgular?m?z?n daha k?sa 
    -- g?z?kmesini sa?labiliriz.
    
    -- AS --> bir sutuna kisa isim verir 
    -- Bir tabloya da kisa isim verilebilir 
    -- tablo_adi yeni_isim >>  seklinde yazarsak tablomuzun adi yeni_isim olms olur
    SELECT urun_id,musteri_isim FROM mart_satislar m
    WHERE EXISTS (SELECT urun_id FROM nisan_satislar n
                    WHERE m.urun_id=n.urun_id);
                    
    SELECT urun_id,musteri_isim FROM mart_satislar 
    WHERE urun_id IN(SELECT urun_id FROM nisan_satislar 
                    WHERE mart_satislar.urun_id=urun_id);
                    
                         /*========INTERVIEW =========*/ 
    -- EXISTS boolean sonuc dondurur ve IN' e gore cok daha hizli sonuc verir. 
    -- IN tum dgerlere tek tek bakarken EXISTS sonuca ulastigi anda yazdirir ve tum verilere bakmaz
    
/* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da sat?lan ?r?nlerin URUN_ISIM'lerini ve bu ?r?nleri
  N?SAN ay?nda sat?n alan MUSTERI_ISIM'lerini listeleyen bir sorgu yaz?n?z. 
 -----------------------------------------------------------------------------*/
    SELECT urun_isim,musteri_isim FROM nisan_satislar
    WHERE EXISTS (SELECT urun_isim FROM mart_satislar 
                    WHERE nisan_satislar.urun_isim=mart_satislar.urun_isim);
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak sat?lmayan ?r?nlerin URUN_ISIM'lerini 
  ve bu ?r?nleri N?SAN ay?nda sat?n alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
    SELECT urun_isim,musteri_isim FROM nisan_satislar nisan
    WHERE NOT EXISTS (SELECT urun_isim FROM mart_satislar mart
                        WHERE nisan.urun_isim=mart.urun_isim);
          
          
