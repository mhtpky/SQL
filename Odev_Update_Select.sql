/*1-) Asagidaki tablolari olusturarak verileri giriniz. 
CREATE TABLE calisanlar(
id CHAR(4),
isim VARCHAR2(50),
maas NUMBER(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
INSERT INTO calisanlar VALUES( '1002', 'Mehmet Y?lmaz' ,12000);
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);

CREATE TABLE aileler(
id CHAR(4),
cocuk_sayisi VARCHAR2(50),
ek_gelir NUMBER(5),
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);

INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500);
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);*/

CREATE TABLE calisanlar(
    id CHAR(4),
    isim VARCHAR2(50),
    maas NUMBER(5),
    CONSTRAINT id_pk PRIMARY KEY (id)
);

    INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
    INSERT INTO calisanlar VALUES('1002', 'Mehmet Yilmaz' ,12000);
    INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
    INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);

CREATE TABLE aileler(
    id CHAR(4),
    cocuk_sayisi VARCHAR2(50),
    ek_gelir NUMBER(5),
    CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);

    INSERT INTO aileler VALUES('1001', 4, 2000);
    INSERT INTO aileler VALUES('1002', 2, 1500);
    INSERT INTO aileler VALUES('1003', 1, 2200);
    INSERT INTO aileler VALUES('1004', 3, 2400);


/*---------------------------------------------------------------------
2-)  Veli  Han'in  maasina  %20  zam  yapacak  update  komutunu  yaziniz. 
---------------------------------------------------------------------*/
    UPDATE calisanlar 
    SET maas=maas*1.2 
    WHERE isim='Veli Han';


/*-----------------------------------------------------------------------
3-)Maasi  ortalamanin  altinda  olan çalisanlarin  maasina %20  zam  yapiniz.
------------------------------------------------------------------------*/
    UPDATE calisanlar 
    SET maas=maas*1.2 
    WHERE maas <(SELECT AVG(maas) 
                 FROM calisanlar);
    
    
/*-----------------------------------------------------------------------
4-)Çalisanlarin isim  ve  cocuk_sayisi'ni  listeleyen bir  sorgu yazinz.?
-----------------------------------------------------------------------*/
    SELECT isim,(SELECT cocuk_sayisi FROM aileler 
                WHERE aileler.id=calisanlar.id) AS cocuk_sayisi 
    FROM calisanlar;


/*-----------------------------------------------------------------------
5-) calisanlar'in  id, isim ve toplam_gelir'lerini gösteren bir sorgu yaziniz. 
toplam_gelir = calisanlar.maas + aileler.ek_gelir 
-----------------------------------------------------------------------*/
    SELECT id,isim,(SELECT maas + ek_gelir FROM aileler 
                            WHERE calisanlar.id = aileler.id) AS TOPLAM_GELIR
    FROM calisanlar;


/*-----------------------------------------------------------------------
6-) Eger bir ailenin kisi basi geliri 2000 TL den daha az ise o çalisanlarn
--maasina ek %10 aile yardim zammi yapiniz. 
--kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
-----------------------------------------------------------------------*/
    UPDATE calisanlar 
    SET maas = maas*1.1 WHERE 2000>(SELECT (calisanlar.maas+ek_gelir)/(cocuk_sayisi+2) 
                                            FROM aileler WHERE aileler.id=calisanlar.id)
                                            
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    DROP TABLE aileler;