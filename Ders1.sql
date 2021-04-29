CREATE TABLE ders_1 (
    isim VARCHAR2(25)NOT NULL,
    soyisim VARCHAR2(25),
    yas NUMBER(2)NOT NULL,
    mail VARCHAR2(50)PRIMARY KEY
    );
    
    
CREATE TABLE uygulama(
    isim VARCHAR2(15),
    soyisim VARCHAR2(30),
    dogum DATE,
    mail VARCHAR2(65) UNIQUE,
    tc CHAR(11) PRIMARY KEY,
    boy NUMBER(3)
    );
    
INSERT INTO uygulama VALUES('mehtap', 'kaya','26-SEP-90','mhtpkaya90@gmail.com',12345678910,161);
INSERT INTO uygulama VALUES('omer', 'kaya','26-SEP-90','omerkaya90@gmail.com',12345678911,161);


-- DUAL sistemin bize yorumlar icin verdigi bos tablodur
SELECT SYSDATE "BUGUN TARIH" FROM DUAL; -- Sistemin tarihini verir
SELECT SYSDATE AS BUGUN_TARIH FROM DUAL;
-- Sutuna isim vermek isterseniz " " icinde veya basina AS yazarak yapabiliriz

/*============================DISTINCT===================================*/
-- ONLY DISPLAY UNIQUE VALUES
-- Tkrar tekrar eklenen verilerin yalnizca 1 defa alinmasini saglar
-- Ornegin veritabaninda girilen adreslerin sehirlerine bakarsak
-- toplamda kac farkli sehir oldugunu istedigimizde kullanabiliriz
/*=======================================================================*/
CREATE TABLE dist (
    isim VARCHAR2(20),
    numara NUMBER(11)
);
INSERT INTO dist VALUES('enis','12345678910');
INSERT INTO dist VALUES('erdem','12345678920');

SELECT * FROM dist;
SELECT DISTINCT * FROM dist; 
SELECT DISTINCT numara FROM dist;

/*============================ORDER BY===================================*/
-- Verileri istenen kritere gore siralar
-- SELECT yas FROM devam ORDER BY yas; seklindedir syntax'i
--SELECT yas FROM devam ORDER BY yas ASC >> Artana gore siralar 
-- SELECT yas FROM devam ORDER BY yas DESC; >> Azalan siraya gore siralar
/*=======================================================================*/
CREATE TABLE devam(
isim VARCHAR2(20),
soyisim VARCHAR2(20),
numara NUMBER(3),
yas NUMBER(2)
);

INSERT INTO devam VALUES('omer', 'kaya', 100,31);
INSERT INTO devam VALUES('enis', 'kaya', 101,5);
INSERT INTO devam VALUES('erdem', 'kaya', 101,5);

SELECT yas FROM devam;
SELECT yas FROM devam ORDER BY yas ; -- yas'a gore siralar
SELECT isim FROM devam ORDER BY isim;
SELECT numara,yas FROM devam ORDER BY 2 ASC; -- 2. sutuna gore sirala yani yas'a gore
SELECT numara,isim FROM devam ORDER BY numara ASC, isim ASC; -- numaralari ayni olani da sirala demis olduk


/*========================ARITMETIK OPERATORLER===============================*/
-- Dual isminda oracle gelistiriciler tarafinda hazirlanmis yorum satiri gibi bir tablo vardir
-- Tek satirlik ve Tek kolonludur. Varchar tanimli bir X degeri olan ozel tablodur
-- Sutununun adi DUMMY'DIR
/*=======================================================================*/
SELECT * FROM DUAL;
SELECT 5*5 FROM DUAL;
SELECT 25-5 FROM DUAL;
SELECT dummy FROM DUAL;

CREATE TABLE isci (
isim VARCHAR2(25),
soyisim VARCHAR2(25),
maas NUMBER(4)
);

INSERT INTO isci VALUES('omer','kaya',5000);
INSERT INTO isci VALUES('mehtap','kaya',4000);

SELECT maas+250 as "yeni maas" FROM isci;
SELECT maas+maas*5/100 yeni_maas FROM isci;


/*========================ILISKISEL OPERATORLER===============================*/
-- = < > <> <= >=
--WHERE keywords ile kullanilir
-- WHERE KEYWORDS CONDITION USAGE RETRIEVE DATA
/*===========================================================================*/
CREATE TABLE iliskisel (
isim VARCHAR2(15),
maas NUMBER(4)
);

INSERT INTO iliskisel VALUES('OMER',5698);
INSERT INTO iliskisel VALUES('ERDEM',2000);
INSERT INTO iliskisel VALUES('ENIS',800);

SELECT * FROM iliskisel WHERE maas>1000;
SELECT * FROM iliskisel WHERE maas<1000;
SELECT * FROM iliskisel WHERE maas=800;
SELECT isim FROM iliskisel WHERE isim='ERDEM';
SELECT * FROM iliskisel WHERE maas=800 AND isim='ENIS';
SELECT * FROM iliskisel WHERE maas>1000 OR isim='ENIS';
SELECT isim,maas FROM iliskisel WHERE NOT isim='OMER';

/*========================SPECIAL OPERATORLER===============================*/
-- WHERE keyword ile kullanilir
-- BETWEEN, IN, LIKE, IS NULL, 
/*===========================================================================*/
CREATE TABLE pers (
isim VARCHAR2(15),
maas NUMBER(4),
tarih DATE
);


INSERT INTO pers VALUES('OMER',5698,'01-APR-90');
INSERT INTO pers VALUES('ERDEM',2000,'22-JULY-16');
INSERT INTO pers VALUES('ENIS',800,'22-JULY-16');
INSERT INTO pers VALUES('MEHTAP',4000,'');
INSERT INTO pers VALUES('',900,'22-JULY-20');
INSERT INTO pers (maas,tarih) VALUES(800,'22-JULY-16');

SELECT * FROM pers WHERE isim='OMER';
SELECT * FROM pers WHERE maas BETWEEN 2000 AND 8000;
SELECT * FROM pers WHERE tarih BETWEEN '22-JULY-80' AND SYSDATE;
SELECT * FROM pers WHERE tarih BETWEEN '01-APR-89' AND '22-JULY-20';

-- IN >> 
SELECT * FROM pers WHERE maas IN(2000,800);

-- IS NULL >> null olanlari listeler
SELECT * FROM pers WHERE isim IS NULL;
SELECT * FROM pers WHERE isim IS NULL AND(tarih ='22-JULY-20');
SELECT * FROM pers WHERE isim IS NULL AND(maas BETWEEN 900 AND 850);