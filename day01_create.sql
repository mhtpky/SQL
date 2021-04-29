/* ========================================================= 
               TABLO OLU?TURMA  (CRUD - Create)                  
============================================================*/
CREATE TABLE student
( 
    std_id CHAR(3),
    std_name VARCHAR2(20),
    std_age NUMBER
);
/* ========================================================= 
                     VER? G?R??? 
===========================================================*/
INSERT INTO student VALUES('101','AHMET CAN',30);--tabloya icerik ekle--
INSERT INTO student VALUES('102', 'MUSTAFA ALI',20);
INSERT INTO student VALUES('103','AYSE YILMAZ',30);
INSERT INTO student VALUES('104','MELIH GOR',40);
INSERT INTO student VALUES('106','VELI BAK','');

/* ========================================================= 
                    PARÇALI VER? G?R??? 
===========================================================*/
-- NOT: Veri giri?i yap?lmayan de?i?kenlere NULL atan?r.
INSERT INTO student(std_id,std_name) VALUES('105', 'JOHN TRAVOLTA'); 

/* ========================================================= 
                    TABLODAN VER? SORGULAMA  (CRUD - Read)  
===========================================================*/

SELECT * FROM student; -- tablodan herseyi(*) sec goster(SELECT)--

/* ========================================================= 
                    TABLO S?LME  (CRUD - Drop )
===========================================================*/
DROP TABLE student;

/*========================================================= 
                         CRUD ÖRNEK  
 ===========================================================
--1. Veritabanimizda ÜRÜNLER adinda bir Tablo olusturalim.
--• ürün_id => NUMBER
--• ürün_adi => VARCHAR2(50)
--• fiyat => NUMBER(5,2)
--• TETT => DATE,
--• stok_adedi => NUMBER(10)
--2. Bu tabloya, belirledigimiz veri tiplerine uygun olacak sekilde Ürün
--girisi yapalim.
--• Örne?in C?PS, KOLA, AYRAN, B?SKÜV?,
--• (100, ‘CIPS’, 5.50, ‘01-05-2022’, 500)
--3. Veri girisinden sonra SELECT komutu ile verilerimizi çekelim.
 ===========================================================*/
CREATE TABLE urunler
(
    urun_id NUMBER,
    urun_adi VARCHAR2(50),
    urun_fiyat NUMBER(5,2), -- 5 haneli bir sayi 2 si virgulden sonra demektir
    urun_TETT DATE,
    stok_adedi NUMBER(10)
);
    
INSERT INTO urunler VALUES(100, 'CIPS', 5.50, '01-MAY-22', 500);
INSERT INTO urunler VALUES(101, 'COLA', 7.50, '01-JUNE-25', 100);
INSERT INTO urunler VALUES(102, 'AYRAN', 2.50, '01-JAN-21', 1000);
INSERT INTO urunler VALUES(103, 'BISKUVI', 3.50, '01-MAY-22', 2000);

SELECT * FROM urunler;

DROP TABLE urunler;