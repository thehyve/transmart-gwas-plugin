--------------------------------------------------------
--  File created - Thursday-October-25-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LZ_SRC_ANALYSIS_METADATA
--------------------------------------------------------

  CREATE TABLE "TM_LZ"."LZ_SRC_ANALYSIS_METADATA" 
   (	"STUDY_ID" VARCHAR2(50 BYTE), 
	"DATA_TYPE" VARCHAR2(50 BYTE), 
	"ANALYSIS_NAME" VARCHAR2(500 BYTE), 
	"DESCRIPTION" VARCHAR2(1000 BYTE), 
	"PHENOTYPE_IDS" VARCHAR2(250 BYTE), 
	"POPULATION" VARCHAR2(500 BYTE), 
	"TISSUE" VARCHAR2(500 BYTE), 
	"GENOME_VERSION" VARCHAR2(50 BYTE), 
	"GENOTYPE_PLATFORM_IDS" VARCHAR2(500 BYTE), 
	"EXPRESSION_PLATFORM_IDS" VARCHAR2(500 BYTE), 
	"STATISTICAL_TEST" VARCHAR2(500 BYTE), 
	"RESEARCH_UNIT" VARCHAR2(500 BYTE), 
	"SAMPLE_SIZE" VARCHAR2(500 BYTE), 
	"CELL_TYPE" VARCHAR2(500 BYTE), 
	"PVALUE_CUTOFF" VARCHAR2(50 BYTE), 
	"ETL_DATE" TIMESTAMP (6), 
	"FILENAME" VARCHAR2(500 BYTE), 
	"STATUS" VARCHAR2(50 BYTE), 
	"PROCESS_DATE" TIMESTAMP (6), 
	"ETL_ID" NUMBER(38,0), 
	"ANALYSIS_NAME_ARCHIVED" VARCHAR2(500 BYTE), 
	"MODEL_NAME" VARCHAR2(500 BYTE), 
	"MODEL_DESC" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TRANSMART" ;


--------------------------------------------------------
--  DDL for Trigger TRG_ETL_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TM_LZ"."TRG_ETL_ID" 
  before INSERT ON LZ_SRC_ANALYSIS_METADATA FOR EACH row 
  BEGIN IF inserting THEN IF :NEW.ETL_ID IS NULL THEN
  SELECT SEQ_ETL_ID.nextval INTO :NEW.ETL_ID FROM dual;
END IF;
END IF;
END;
/
ALTER TRIGGER "TM_LZ"."TRG_ETL_ID" ENABLE;