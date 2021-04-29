/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümlecigi ile listelenecek kayitlari sinirlandirabiliriz. 
   Istersek satir sayisina göre istersek de toplam satir sayisinin 
   belli bir yüzdesine göre sinirlandirma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleci?i ile de listenecek olan satirlardan sirasiyla istedigimiz 
   kadarini atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET satir_sayisi ROWS;

   >>>> 11g versiyonda calismamaktadir. <<<< 
==============================================================================*/     
/* ----------------------------------------------------------------------------
  ORNEK1: MAAS'I en yüksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.
-----------------------------------------------------------------------------*/    
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 3 ROWS ONLY;


/* ----------------------------------------------------------------------------    
    ORNEK2: Maasi en DUSUK 2 kisinin bilgilerini listeleyen sorguyu yaziniz
----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas ASC
    FETCH NEXT 2 ROWS ONLY;
  
/* ----------------------------------------------------------------------------    
    ORNEK3: Maasi gore siralamada 4. ile 6. kisilerin bilgilerini listeleyen
    sorguyu yaziniz
----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas DESC
    OFFSET 3 ROWS           -- ilk 3 kaydi atladik
    FETCH NEXT 3 ROWS ONLY; -- sonra ki 3 kaydi sectik
    