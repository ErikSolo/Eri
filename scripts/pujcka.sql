prompt Importing table created...

CREATE TABLE VYUCOVACI_PREDMET (xxx varchar(100));                              
CREATE TABLE PUJCKA (xxx varchar(100));                                         
CREATE TABLE RIDIC_OPRAVNENI (xxx varchar(100));                                
ALTER TABLE VYUCOVACI_PREDMET ADD DATUM_ZAPISU DATE;                            
ALTER TABLE VYUCOVACI_PREDMET ADD GARANT_PREDMETU VARCHAR2(60);                 
ALTER TABLE VYUCOVACI_PREDMET ADD POCET_HODIN_TYDNE NUMBER(22);                 
ALTER TABLE VYUCOVACI_PREDMET ADD NAZEV_PREDMETU VARCHAR2(60);                  
ALTER TABLE VYUCOVACI_PREDMET ADD ID NUMBER(22);                                
ALTER TABLE PUJCKA ADD SPLACENO NUMBER(22);                                     
ALTER TABLE PUJCKA ADD SKUTECNE_DATUM_SPLACENI DATE;                            
ALTER TABLE PUJCKA ADD PREDPOKL_DATUM_SPLACENI DATE;                            
ALTER TABLE PUJCKA ADD TYP_PUJCKY VARCHAR2(30);                                 
ALTER TABLE PUJCKA ADD VYSE_UVERU NUMBER(22);                                   
ALTER TABLE PUJCKA ADD DATUM_UVERU DATE;                                        
ALTER TABLE PUJCKA ADD PRIJMENI VARCHAR2(60);                                   
ALTER TABLE PUJCKA ADD JMENO VARCHAR2(30);                                      
ALTER TABLE PUJCKA ADD RODNE_CISLO VARCHAR2(10);                                
ALTER TABLE PUJCKA ADD KLIENT_ID VARCHAR2(10);                                  
ALTER TABLE RIDIC_OPRAVNENI ADD PLATNOST_OD DATE;                               
ALTER TABLE RIDIC_OPRAVNENI ADD OPRAVNENI_ID VARCHAR2(10);                      
ALTER TABLE RIDIC_OPRAVNENI ADD RIDIC_ID VARCHAR2(10);                          
ALTER TABLE RIDIC_OPRAVNENI ADD ID VARCHAR2(10);                                
ALTER TABLE VYUCOVACI_PREDMET DROP COLUMN XXX;                                  
ALTER TABLE PUJCKA DROP COLUMN XXX;                                             
ALTER TABLE RIDIC_OPRAVNENI DROP COLUMN XXX;                                    

/


commit;