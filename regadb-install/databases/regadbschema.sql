/*
 Navicat Premium Data Transfer

 Source Server         : Postgres-Local
 Source Server Type    : PostgreSQL
 Source Server Version : 90615
 Source Host           : localhost:5432
 Source Catalog        : regadb-leishmaniasis
 Source Schema         : regadbschema

 Target Server Type    : PostgreSQL
 Target Server Version : 90615
 File Encoding         : 65001

 Date: 19/09/2019 15:56:56
*/


-- ----------------------------
-- Sequence structure for aa_sequence_aa_sequence_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."aa_sequence_aa_sequence_ii_seq";
CREATE SEQUENCE "regadbschema"."aa_sequence_aa_sequence_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for analysis_analysis_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."analysis_analysis_ii_seq";
CREATE SEQUENCE "regadbschema"."analysis_analysis_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for analysis_data_analysis_data_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."analysis_data_analysis_data_ii_seq";
CREATE SEQUENCE "regadbschema"."analysis_data_analysis_data_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for analysis_type_analysis_type_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."analysis_type_analysis_type_ii_seq";
CREATE SEQUENCE "regadbschema"."analysis_type_analysis_type_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for attribute_attribute_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."attribute_attribute_ii_seq";
CREATE SEQUENCE "regadbschema"."attribute_attribute_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for attribute_group_attribute_group_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."attribute_group_attribute_group_ii_seq";
CREATE SEQUENCE "regadbschema"."attribute_group_attribute_group_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for attribute_nominal_value_attribute_nominal_value_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."attribute_nominal_value_attribute_nominal_value_ii_seq";
CREATE SEQUENCE "regadbschema"."attribute_nominal_value_attribute_nominal_value_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for combined_query_combined_query_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."combined_query_combined_query_ii_seq";
CREATE SEQUENCE "regadbschema"."combined_query_combined_query_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dataset_dataset_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."dataset_dataset_ii_seq";
CREATE SEQUENCE "regadbschema"."dataset_dataset_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for drug_class_drug_class_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."drug_class_drug_class_ii_seq";
CREATE SEQUENCE "regadbschema"."drug_class_drug_class_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for drug_commercial_drug_commercial_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."drug_commercial_drug_commercial_ii_seq";
CREATE SEQUENCE "regadbschema"."drug_commercial_drug_commercial_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for drug_generic_drug_generic_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."drug_generic_drug_generic_ii_seq";
CREATE SEQUENCE "regadbschema"."drug_generic_drug_generic_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for event_event_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."event_event_ii_seq";
CREATE SEQUENCE "regadbschema"."event_event_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for event_nominal_value_event_nominal_value_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."event_nominal_value_event_nominal_value_ii_seq";
CREATE SEQUENCE "regadbschema"."event_nominal_value_event_nominal_value_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for genome_genome_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."genome_genome_ii_seq";
CREATE SEQUENCE "regadbschema"."genome_genome_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for nt_sequence_nt_sequence_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."nt_sequence_nt_sequence_ii_seq";
CREATE SEQUENCE "regadbschema"."nt_sequence_nt_sequence_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for open_reading_frame_open_reading_frame_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."open_reading_frame_open_reading_frame_ii_seq";
CREATE SEQUENCE "regadbschema"."open_reading_frame_open_reading_frame_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for patient_attribute_value_patient_attribute_value_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."patient_attribute_value_patient_attribute_value_ii_seq";
CREATE SEQUENCE "regadbschema"."patient_attribute_value_patient_attribute_value_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for patient_event_value_patient_event_value_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."patient_event_value_patient_event_value_ii_seq";
CREATE SEQUENCE "regadbschema"."patient_event_value_patient_event_value_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for patient_patient_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."patient_patient_ii_seq";
CREATE SEQUENCE "regadbschema"."patient_patient_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for protein_protein_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."protein_protein_ii_seq";
CREATE SEQUENCE "regadbschema"."protein_protein_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for query_definition_parameter_query_definition_parameter_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."query_definition_parameter_query_definition_parameter_ii_seq";
CREATE SEQUENCE "regadbschema"."query_definition_parameter_query_definition_parameter_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for query_definition_parameter_type_query_definition_parameter_type
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."query_definition_parameter_type_query_definition_parameter_type";
CREATE SEQUENCE "regadbschema"."query_definition_parameter_type_query_definition_parameter_type" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for query_definition_query_definition_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."query_definition_query_definition_ii_seq";
CREATE SEQUENCE "regadbschema"."query_definition_query_definition_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for query_definition_run_parameter_query_definition_run_parameter_i
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."query_definition_run_parameter_query_definition_run_parameter_i";
CREATE SEQUENCE "regadbschema"."query_definition_run_parameter_query_definition_run_parameter_i" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for query_definition_run_query_definition_run_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."query_definition_run_query_definition_run_ii_seq";
CREATE SEQUENCE "regadbschema"."query_definition_run_query_definition_run_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for resistance_interpretation_template_resistance_interpretation_te
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."resistance_interpretation_template_resistance_interpretation_te";
CREATE SEQUENCE "regadbschema"."resistance_interpretation_template_resistance_interpretation_te" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for splicing_position_splicing_position_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."splicing_position_splicing_position_ii_seq";
CREATE SEQUENCE "regadbschema"."splicing_position_splicing_position_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for test_nominal_value_test_nominal_value_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."test_nominal_value_test_nominal_value_ii_seq";
CREATE SEQUENCE "regadbschema"."test_nominal_value_test_nominal_value_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for test_object_test_object_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."test_object_test_object_ii_seq";
CREATE SEQUENCE "regadbschema"."test_object_test_object_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for test_result_test_result_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."test_result_test_result_ii_seq";
CREATE SEQUENCE "regadbschema"."test_result_test_result_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for test_test_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."test_test_ii_seq";
CREATE SEQUENCE "regadbschema"."test_test_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for test_type_test_type_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."test_type_test_type_ii_seq";
CREATE SEQUENCE "regadbschema"."test_type_test_type_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for therapy_motivation_therapy_motivation_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."therapy_motivation_therapy_motivation_ii_seq";
CREATE SEQUENCE "regadbschema"."therapy_motivation_therapy_motivation_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for therapy_therapy_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."therapy_therapy_ii_seq";
CREATE SEQUENCE "regadbschema"."therapy_therapy_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_attribute_user_attribute_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."user_attribute_user_attribute_ii_seq";
CREATE SEQUENCE "regadbschema"."user_attribute_user_attribute_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for value_type_value_type_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."value_type_value_type_ii_seq";
CREATE SEQUENCE "regadbschema"."value_type_value_type_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for viral_isolate_viral_isolate_ii_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "regadbschema"."viral_isolate_viral_isolate_ii_seq";
CREATE SEQUENCE "regadbschema"."viral_isolate_viral_isolate_ii_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for aa_insertion
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."aa_insertion";
CREATE TABLE "regadbschema"."aa_insertion" (
  "insertion_position" int2 NOT NULL,
  "aa_sequence_ii" int4 NOT NULL,
  "insertion_order" int2 NOT NULL,
  "version" int4 NOT NULL,
  "aa_insertion" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "nt_insertion_codon" varchar(3) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for aa_mutation
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."aa_mutation";
CREATE TABLE "regadbschema"."aa_mutation" (
  "mutation_position" int2 NOT NULL,
  "aa_sequence_ii" int4 NOT NULL,
  "version" int4 NOT NULL,
  "aa_reference" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "aa_mutation" varchar(30) COLLATE "pg_catalog"."default",
  "nt_reference_codon" varchar(3) COLLATE "pg_catalog"."default" NOT NULL,
  "nt_mutation_codon" varchar(3) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for aa_sequence
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."aa_sequence";
CREATE TABLE "regadbschema"."aa_sequence" (
  "aa_sequence_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".aa_sequence_aa_sequence_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "nt_sequence_ii" int4 NOT NULL,
  "protein_ii" int4 NOT NULL,
  "first_aa_pos" int2 NOT NULL,
  "last_aa_pos" int2 NOT NULL
)
;

-- ----------------------------
-- Table structure for analysis
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."analysis";
CREATE TABLE "regadbschema"."analysis" (
  "analysis_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".analysis_analysis_ii_seq'::regclass),
  "analysis_type_ii" int4 NOT NULL,
  "url" varchar(100) COLLATE "pg_catalog"."default",
  "account" varchar(50) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "baseinputfile" varchar(50) COLLATE "pg_catalog"."default",
  "baseoutputfile" varchar(50) COLLATE "pg_catalog"."default",
  "service_name" varchar(100) COLLATE "pg_catalog"."default",
  "dataoutputfile" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for analysis_data
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."analysis_data";
CREATE TABLE "regadbschema"."analysis_data" (
  "analysis_data_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".analysis_data_analysis_data_ii_seq'::regclass),
  "analysis_ii" int4 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "data" bytea,
  "mimetype" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for analysis_type
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."analysis_type";
CREATE TABLE "regadbschema"."analysis_type" (
  "analysis_type_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".analysis_type_analysis_type_ii_seq'::regclass),
  "type" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of analysis_type
-- ----------------------------
INSERT INTO "regadbschema"."analysis_type" VALUES (1, 'wts');

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."attribute";
CREATE TABLE "regadbschema"."attribute" (
  "attribute_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".attribute_attribute_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "value_type_ii" int4,
  "attribute_group_ii" int4,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "validation_string" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of attribute
-- ----------------------------
INSERT INTO "regadbschema"."attribute" VALUES (24, 2, 1, 3, '14) Altura (m)', '');
INSERT INTO "regadbschema"."attribute" VALUES (17, 4, 5, 1, '04) Apelido', '');
INSERT INTO "regadbschema"."attribute" VALUES (21, 3, 4, 1, '11) Cartão SUS', '');
INSERT INTO "regadbschema"."attribute" VALUES (11, 3, 1, 1, '07) CPF', '');
INSERT INTO "regadbschema"."attribute" VALUES (3, 4, 6, 1, '06) Data de nascimento', '');
INSERT INTO "regadbschema"."attribute" VALUES (5, 4, 3, 1, '05) Gênero', '');
INSERT INTO "regadbschema"."attribute" VALUES (18, 5, 3, 2, '02) Local de atendimento (cidade)', '');
INSERT INTO "regadbschema"."attribute" VALUES (16, 6, 5, 1, '10) Nome da mãe (completo e sem abreviações)', '');
INSERT INTO "regadbschema"."attribute" VALUES (14, 7, 5, 1, '03) Nome do paciente (completo e sem abreviações)', '');
INSERT INTO "regadbschema"."attribute" VALUES (15, 6, 5, 1, '09) Nome do pai (completo e sem abreviações)', '');
INSERT INTO "regadbschema"."attribute" VALUES (19, 4, 4, 3, '01) SampleID (registro antigo)', '');
INSERT INTO "regadbschema"."attribute" VALUES (23, 3, 1, 3, '13) Peso (kg)', '');
INSERT INTO "regadbschema"."attribute" VALUES (12, 3, 1, 1, '08) RG', '');
INSERT INTO "regadbschema"."attribute" VALUES (22, 2, 4, 1, '12) Telefone', '');

-- ----------------------------
-- Table structure for attribute_group
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."attribute_group";
CREATE TABLE "regadbschema"."attribute_group" (
  "attribute_group_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".attribute_group_attribute_group_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "group_name" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of attribute_group
-- ----------------------------
INSERT INTO "regadbschema"."attribute_group" VALUES (1, 2, 'Identificação');
INSERT INTO "regadbschema"."attribute_group" VALUES (2, 1, 'Atendimento');
INSERT INTO "regadbschema"."attribute_group" VALUES (3, 2, 'Antropométricas');

-- ----------------------------
-- Table structure for attribute_nominal_value
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."attribute_nominal_value";
CREATE TABLE "regadbschema"."attribute_nominal_value" (
  "nominal_value_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".attribute_nominal_value_attribute_nominal_value_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "attribute_ii" int4 NOT NULL,
  "value" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of attribute_nominal_value
-- ----------------------------
INSERT INTO "regadbschema"."attribute_nominal_value" VALUES (1, 0, 5, 'male');
INSERT INTO "regadbschema"."attribute_nominal_value" VALUES (2, 0, 5, 'female');
INSERT INTO "regadbschema"."attribute_nominal_value" VALUES (241, 0, 18, 'Mutuípe');
INSERT INTO "regadbschema"."attribute_nominal_value" VALUES (242, 0, 18, 'Jequiriça');
INSERT INTO "regadbschema"."attribute_nominal_value" VALUES (243, 0, 18, 'Salvador');

-- ----------------------------
-- Table structure for combined_query
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."combined_query";
CREATE TABLE "regadbschema"."combined_query" (
  "combined_query_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".combined_query_combined_query_ii_seq'::regclass),
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for combined_query_definition
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."combined_query_definition";
CREATE TABLE "regadbschema"."combined_query_definition" (
  "combined_query_ii" int4 NOT NULL,
  "query_definition_ii" int4 NOT NULL,
  "number" int4 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for commercial_generic
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."commercial_generic";
CREATE TABLE "regadbschema"."commercial_generic" (
  "generic_ii" int4 NOT NULL,
  "commercial_ii" int4 NOT NULL
)
;

-- ----------------------------
-- Records of commercial_generic
-- ----------------------------
INSERT INTO "regadbschema"."commercial_generic" VALUES (19, 1);
INSERT INTO "regadbschema"."commercial_generic" VALUES (19, 2);
INSERT INTO "regadbschema"."commercial_generic" VALUES (1, 3);
INSERT INTO "regadbschema"."commercial_generic" VALUES (19, 4);
INSERT INTO "regadbschema"."commercial_generic" VALUES (1, 5);
INSERT INTO "regadbschema"."commercial_generic" VALUES (2, 6);
INSERT INTO "regadbschema"."commercial_generic" VALUES (2, 7);
INSERT INTO "regadbschema"."commercial_generic" VALUES (2, 8);
INSERT INTO "regadbschema"."commercial_generic" VALUES (30, 9);
INSERT INTO "regadbschema"."commercial_generic" VALUES (3, 10);
INSERT INTO "regadbschema"."commercial_generic" VALUES (3, 11);
INSERT INTO "regadbschema"."commercial_generic" VALUES (4, 12);
INSERT INTO "regadbschema"."commercial_generic" VALUES (5, 13);
INSERT INTO "regadbschema"."commercial_generic" VALUES (5, 14);
INSERT INTO "regadbschema"."commercial_generic" VALUES (5, 15);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 16);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 17);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 17);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 17);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 18);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 19);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 20);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 21);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 22);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 23);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 24);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 25);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 26);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 27);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 28);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 29);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 30);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 30);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 31);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 31);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 32);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 33);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 34);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 35);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 36);
INSERT INTO "regadbschema"."commercial_generic" VALUES (12, 37);
INSERT INTO "regadbschema"."commercial_generic" VALUES (12, 38);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 39);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 40);
INSERT INTO "regadbschema"."commercial_generic" VALUES (14, 41);
INSERT INTO "regadbschema"."commercial_generic" VALUES (14, 42);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 43);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 44);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 45);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 46);
INSERT INTO "regadbschema"."commercial_generic" VALUES (16, 47);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 48);
INSERT INTO "regadbschema"."commercial_generic" VALUES (4, 49);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 50);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 51);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 52);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 53);
INSERT INTO "regadbschema"."commercial_generic" VALUES (17, 54);
INSERT INTO "regadbschema"."commercial_generic" VALUES (20, 55);
INSERT INTO "regadbschema"."commercial_generic" VALUES (2, 56);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 57);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 57);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 58);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 59);
INSERT INTO "regadbschema"."commercial_generic" VALUES (4, 60);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 61);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 62);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 63);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 64);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 65);
INSERT INTO "regadbschema"."commercial_generic" VALUES (30, 66);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 67);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 67);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 68);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 68);
INSERT INTO "regadbschema"."commercial_generic" VALUES (38, 69);
INSERT INTO "regadbschema"."commercial_generic" VALUES (39, 70);
INSERT INTO "regadbschema"."commercial_generic" VALUES (19, 71);
INSERT INTO "regadbschema"."commercial_generic" VALUES (1, 72);
INSERT INTO "regadbschema"."commercial_generic" VALUES (1, 73);
INSERT INTO "regadbschema"."commercial_generic" VALUES (2, 74);
INSERT INTO "regadbschema"."commercial_generic" VALUES (30, 75);
INSERT INTO "regadbschema"."commercial_generic" VALUES (3, 76);
INSERT INTO "regadbschema"."commercial_generic" VALUES (4, 77);
INSERT INTO "regadbschema"."commercial_generic" VALUES (5, 78);
INSERT INTO "regadbschema"."commercial_generic" VALUES (5, 79);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 80);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 81);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 81);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 81);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 82);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 83);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 84);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 85);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 86);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 86);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 87);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 87);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 88);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 89);
INSERT INTO "regadbschema"."commercial_generic" VALUES (12, 90);
INSERT INTO "regadbschema"."commercial_generic" VALUES (13, 91);
INSERT INTO "regadbschema"."commercial_generic" VALUES (14, 92);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 93);
INSERT INTO "regadbschema"."commercial_generic" VALUES (16, 94);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 95);
INSERT INTO "regadbschema"."commercial_generic" VALUES (17, 96);
INSERT INTO "regadbschema"."commercial_generic" VALUES (20, 97);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 98);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 98);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 99);
INSERT INTO "regadbschema"."commercial_generic" VALUES (7, 100);
INSERT INTO "regadbschema"."commercial_generic" VALUES (6, 101);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 101);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 102);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 102);
INSERT INTO "regadbschema"."commercial_generic" VALUES (34, 103);
INSERT INTO "regadbschema"."commercial_generic" VALUES (18, 104);
INSERT INTO "regadbschema"."commercial_generic" VALUES (16, 105);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 105);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 105);
INSERT INTO "regadbschema"."commercial_generic" VALUES (16, 106);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 106);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 106);
INSERT INTO "regadbschema"."commercial_generic" VALUES (34, 107);
INSERT INTO "regadbschema"."commercial_generic" VALUES (18, 108);
INSERT INTO "regadbschema"."commercial_generic" VALUES (16, 109);
INSERT INTO "regadbschema"."commercial_generic" VALUES (10, 109);
INSERT INTO "regadbschema"."commercial_generic" VALUES (9, 109);
INSERT INTO "regadbschema"."commercial_generic" VALUES (19, 110);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 111);
INSERT INTO "regadbschema"."commercial_generic" VALUES (15, 111);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 111);
INSERT INTO "regadbschema"."commercial_generic" VALUES (37, 112);
INSERT INTO "regadbschema"."commercial_generic" VALUES (37, 113);
INSERT INTO "regadbschema"."commercial_generic" VALUES (38, 114);
INSERT INTO "regadbschema"."commercial_generic" VALUES (34, 115);
INSERT INTO "regadbschema"."commercial_generic" VALUES (34, 116);
INSERT INTO "regadbschema"."commercial_generic" VALUES (30, 117);
INSERT INTO "regadbschema"."commercial_generic" VALUES (39, 118);
INSERT INTO "regadbschema"."commercial_generic" VALUES (39, 119);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 120);
INSERT INTO "regadbschema"."commercial_generic" VALUES (43, 120);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 120);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 121);
INSERT INTO "regadbschema"."commercial_generic" VALUES (43, 121);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 121);
INSERT INTO "regadbschema"."commercial_generic" VALUES (43, 122);
INSERT INTO "regadbschema"."commercial_generic" VALUES (16, 123);
INSERT INTO "regadbschema"."commercial_generic" VALUES (34, 124);
INSERT INTO "regadbschema"."commercial_generic" VALUES (11, 125);
INSERT INTO "regadbschema"."commercial_generic" VALUES (41, 125);
INSERT INTO "regadbschema"."commercial_generic" VALUES (8, 125);
INSERT INTO "regadbschema"."commercial_generic" VALUES (41, 126);
INSERT INTO "regadbschema"."commercial_generic" VALUES (41, 127);
INSERT INTO "regadbschema"."commercial_generic" VALUES (41, 128);
INSERT INTO "regadbschema"."commercial_generic" VALUES (45, 129);
INSERT INTO "regadbschema"."commercial_generic" VALUES (45, 130);
INSERT INTO "regadbschema"."commercial_generic" VALUES (46, 131);
INSERT INTO "regadbschema"."commercial_generic" VALUES (46, 132);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 133);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 134);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 135);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 136);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 137);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 138);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 139);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 140);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 141);
INSERT INTO "regadbschema"."commercial_generic" VALUES (65, 142);
INSERT INTO "regadbschema"."commercial_generic" VALUES (65, 143);
INSERT INTO "regadbschema"."commercial_generic" VALUES (65, 144);
INSERT INTO "regadbschema"."commercial_generic" VALUES (67, 145);
INSERT INTO "regadbschema"."commercial_generic" VALUES (67, 146);
INSERT INTO "regadbschema"."commercial_generic" VALUES (67, 147);
INSERT INTO "regadbschema"."commercial_generic" VALUES (68, 148);
INSERT INTO "regadbschema"."commercial_generic" VALUES (68, 149);
INSERT INTO "regadbschema"."commercial_generic" VALUES (68, 150);
INSERT INTO "regadbschema"."commercial_generic" VALUES (68, 151);
INSERT INTO "regadbschema"."commercial_generic" VALUES (68, 152);
INSERT INTO "regadbschema"."commercial_generic" VALUES (68, 153);
INSERT INTO "regadbschema"."commercial_generic" VALUES (70, 154);
INSERT INTO "regadbschema"."commercial_generic" VALUES (70, 155);
INSERT INTO "regadbschema"."commercial_generic" VALUES (70, 156);
INSERT INTO "regadbschema"."commercial_generic" VALUES (70, 157);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 158);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 159);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 160);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 161);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 162);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 163);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 164);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 165);
INSERT INTO "regadbschema"."commercial_generic" VALUES (64, 166);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 167);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 168);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 169);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 170);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 171);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 172);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 173);
INSERT INTO "regadbschema"."commercial_generic" VALUES (71, 174);
INSERT INTO "regadbschema"."commercial_generic" VALUES (72, 175);
INSERT INTO "regadbschema"."commercial_generic" VALUES (73, 176);
INSERT INTO "regadbschema"."commercial_generic" VALUES (73, 177);
INSERT INTO "regadbschema"."commercial_generic" VALUES (76, 178);
INSERT INTO "regadbschema"."commercial_generic" VALUES (76, 179);
INSERT INTO "regadbschema"."commercial_generic" VALUES (80, 180);
INSERT INTO "regadbschema"."commercial_generic" VALUES (87, 181);
INSERT INTO "regadbschema"."commercial_generic" VALUES (89, 182);
INSERT INTO "regadbschema"."commercial_generic" VALUES (91, 183);
INSERT INTO "regadbschema"."commercial_generic" VALUES (92, 184);
INSERT INTO "regadbschema"."commercial_generic" VALUES (93, 185);

-- ----------------------------
-- Table structure for dataset
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."dataset";
CREATE TABLE "regadbschema"."dataset" (
  "dataset_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".dataset_dataset_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "uid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "creation_date" date NOT NULL,
  "closed_date" date,
  "revision" int4
)
;

-- ----------------------------
-- Records of dataset
-- ----------------------------
INSERT INTO "regadbschema"."dataset" VALUES (2, 1, 'fgtorres', 'Maranguape', '2017-08-31', NULL, 1);
INSERT INTO "regadbschema"."dataset" VALUES (1, 4, 'fgtorres', 'Vale do Jequirica', '2017-08-31', NULL, 1);

-- ----------------------------
-- Table structure for dataset_access
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."dataset_access";
CREATE TABLE "regadbschema"."dataset_access" (
  "uid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dataset_ii" int4 NOT NULL,
  "version" int4 NOT NULL,
  "permissions" int4 NOT NULL,
  "provider" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of dataset_access
-- ----------------------------
INSERT INTO "regadbschema"."dataset_access" VALUES ('admin', 1, 0, 3, 'admin');

-- ----------------------------
-- Table structure for drug_class
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."drug_class";
CREATE TABLE "regadbschema"."drug_class" (
  "drug_class_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".drug_class_drug_class_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "class_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "class_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "resistance_table_order" int4
)
;

-- ----------------------------
-- Records of drug_class
-- ----------------------------
INSERT INTO "regadbschema"."drug_class" VALUES (1, 0, 'NNRTI', 'Non Nucleoside analog Reverse Transcriptase Inhibitor', 1);
INSERT INTO "regadbschema"."drug_class" VALUES (2, 0, 'NRTI', 'Nucleoside analog Reverse Transcriptase Inhibitor', 0);
INSERT INTO "regadbschema"."drug_class" VALUES (3, 0, 'PI', 'Protease Inhibitor', 2);
INSERT INTO "regadbschema"."drug_class" VALUES (4, 0, 'EI', 'Entry Inhibitor', 3);
INSERT INTO "regadbschema"."drug_class" VALUES (5, 0, 'Unknown', 'Unknown', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (6, 0, 'INI', 'Integrase Inhibitor', 4);
INSERT INTO "regadbschema"."drug_class" VALUES (7, 0, 'CPI', 'Cyclophilin inhibitor', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (8, 0, 'AA', 'Antiviral agent', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (9, 0, 'NS5Ai', 'NS5A inhibitor', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (10, 0, 'IS', 'Immunostimulant', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (11, 0, 'NS5Bi', 'Non-nucleoside NS5B polymerase inhibitor', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (12, 0, 'IM', 'Immune modulator', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (13, 0, 'PA', 'Pentavalent Antimonial', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (14, 0, 'AM', 'Antimicrobial Medication', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (15, 0, 'PO', 'Polyenes', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (16, 0, 'OM', 'Other Macrolides', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (17, 0, 'HA', 'Hemorrheologic Agents', NULL);
INSERT INTO "regadbschema"."drug_class" VALUES (18, 0, 'ONAAA', 'Other Nonsteroidal Anti-inflammatory Agents', NULL);

-- ----------------------------
-- Table structure for drug_commercial
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."drug_commercial";
CREATE TABLE "regadbschema"."drug_commercial" (
  "commercial_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".drug_commercial_drug_commercial_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "atc_code" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of drug_commercial
-- ----------------------------
INSERT INTO "regadbschema"."drug_commercial" VALUES (1, 1, 'Reyataz 150 mg (ATV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (2, 1, 'Reyataz 100 mg (ATV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (3, 1, 'Agenerase 50 mg (APV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (4, 1, 'Reyataz 200 mg (ATV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (5, 1, 'Lexiva 700 mg (f-APV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (6, 1, 'Crixivan 200 mg (IDV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (7, 1, 'Crixivan 333 mg (IDV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (8, 1, 'Crixivan 400 mg (IDV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (9, 1, 'Kaletra 133.3+33.3 mg (LPV+RTV)', 'J05AR10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (10, 1, 'Viracept 250 mg (NFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (11, 1, 'Viracept 625 mg (NFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (12, 1, 'Norvir 100 mg (RTV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (13, 1, 'Invirase 200 mg (SQV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (14, 1, 'Invirase 500 mg (SQV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (15, 1, 'Fortovase 200 mg (SQV-sgc)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (16, 1, 'Ziagen 300 mg (ABC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (17, 1, 'Trizivir 300+300+150 mg (ABC+AZT+3TC)', 'J05AR04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (18, 1, 'Videx 25 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (19, 1, 'Videx 50 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (20, 1, 'Videx 100 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (21, 1, 'Videx 150 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (22, 1, 'Videx 200 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (23, 1, 'Videx EC 125 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (24, 1, 'Videx EC 200 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (25, 1, 'Videx EC 250 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (26, 1, 'Videx EC 400 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (27, 1, 'Emtriva 200 mg (FTC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (28, 1, 'Epivir 150 mg (3TC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (29, 1, 'Epivir 300 mg (3TC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (30, 1, 'Combivir 150+300 mg (3TC+AZT)', 'J05AR01');
INSERT INTO "regadbschema"."drug_commercial" VALUES (31, 1, 'Epizicom 600+300 mg (ABC+3TC)', 'J05AR02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (32, 1, 'Zerit 15 mg (D4T)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (33, 1, 'Zerit 20 mg (D4T)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (34, 1, 'Zerit 30 mg (D4T)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (35, 1, 'Zerit 40 mg (D4T)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (36, 1, 'Viread 300 mg (TDF)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (37, 1, 'Hivid 0.375 mg (DDC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (38, 1, 'Hivid 0.75 mg (DDC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (39, 1, 'Retrovir 100 mg (AZT)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (40, 1, 'Retrovir 300 mg (AZT)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (41, 1, 'Rescriptor 100 mg (DLV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (42, 1, 'Rescriptor 200 mg (DLV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (43, 1, 'Sustiva 50 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (44, 1, 'Sustiva 100 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (45, 1, 'Sustiva 200 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (46, 1, 'Sustiva 600 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (47, 1, 'Viramune 200 mg (NVP)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (48, 1, 'Retrovir 250 mg (AZT)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (49, 1, 'Norvir 80 mg (RTV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (50, 1, 'Viread 245 mg (TDF)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (51, 1, 'Retrovir 200 mg (AZT)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (52, 1, 'Stocrin 600 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (53, 1, 'Stocrin 200 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (54, 1, 'Fuzeon 90 ml (T20)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (55, 1, 'Telzir 700 mg (FPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (56, 1, 'Crixivan 600 mg (IDV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (57, 1, 'Epzicom 600+300 mg (ABC+3TC)', 'J05AR02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (58, 1, 'Epivir 100 mg (3TC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (59, 1, 'Stocrin 800 mg (EPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (60, 1, 'Norvir 200 mg (RTV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (61, 1, 'Stocrin 300 mg (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (62, 1, 'Videx RM 200 mg (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (63, 1, 'Retrovir 500 mg (AZT)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (64, 1, 'Zerit 10 mg (D4T)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (65, 1, 'Ziagen 600 mg (ABC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (66, 1, 'Kaletra 200 mg (LPV+RTV)', 'J05AR10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (67, 1, 'Kivexa 600+300 mg (ABC+3TC)', 'J05AR02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (68, 1, 'Truvada 200+300 mg (FTC+TDF)', 'J05AR03');
INSERT INTO "regadbschema"."drug_commercial" VALUES (69, 1, 'Isentress (RTG)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (70, 1, 'Celsentri (MVC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (71, 1, 'Reyataz (ATV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (72, 1, 'Agenerase (APV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (73, 1, 'Lexiva (f-APV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (74, 1, 'Crixivan (IDV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (75, 1, 'Kaletra (LPV+RTV)', 'J05AR10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (76, 1, 'Viracept (NFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (77, 1, 'Norvir (RTV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (78, 1, 'Invirase (SQV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (79, 1, 'Fortovase (SQV-sgc)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (80, 1, 'Ziagen (ABC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (81, 1, 'Trizivir (ABC+AZT+3TC)', 'J05AR04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (82, 1, 'Videx (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (83, 1, 'Videx EC (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (84, 1, 'Emtriva (FTC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (85, 1, 'Epivir (3TC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (86, 1, 'Combivir (3TC+AZT)', 'J05AR01');
INSERT INTO "regadbschema"."drug_commercial" VALUES (87, 1, 'Epizicom (ABC+3TC)', 'J05AR02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (88, 1, 'Zerit (D4T)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (89, 1, 'Viread (TDF)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (90, 1, 'Hivid (DDC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (91, 1, 'Retrovir (AZT)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (92, 1, 'Rescriptor (DLV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (93, 1, 'Sustiva (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (94, 1, 'Viramune (NVP)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (95, 1, 'Stocrin (EFV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (96, 1, 'Fuzeon (T20)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (97, 1, 'Telzir (FPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (98, 1, 'Epzicom (ABC+3TC)', 'J05AR02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (99, 1, 'Stocrin (EPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (100, 1, 'Videx RM (DDI)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (101, 1, 'Kivexa (ABC+3TC)', 'J05AR02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (102, 1, 'Truvada (FTC+TDF)', 'J05AR03');
INSERT INTO "regadbschema"."drug_commercial" VALUES (103, 1, 'Prezista 300 mg (DRV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (104, 1, 'Aptivus 250 mg (TPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (105, 1, 'Triomune 30+150+200 mg (D4T+3TC+NVP)', 'J05AR07');
INSERT INTO "regadbschema"."drug_commercial" VALUES (106, 1, 'Triomune 40+150+200 mg (D4T+3TC+NVP)', 'J05AR07');
INSERT INTO "regadbschema"."drug_commercial" VALUES (107, 1, 'Prezista (DRV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (108, 1, 'Aptivus (TPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (109, 1, 'Triomune (D4T+3TC+NVP)', 'J05AR07');
INSERT INTO "regadbschema"."drug_commercial" VALUES (110, 1, 'Reyataz 300 mg (ATV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (111, 1, 'Atripla 600+200+300 mg (EFV+FTC+TDF)', 'J05AR06');
INSERT INTO "regadbschema"."drug_commercial" VALUES (112, 1, 'Intelence (ETV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (113, 1, 'Intelence 100 mg (ETV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (114, 1, 'Isentress 400 mg (RTG)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (115, 1, 'Prezista 400 mg (DRV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (116, 1, 'Prezista 600 mg (DRV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (117, 1, 'Kaletra Syrup 80+20mg 10ml (LPV+RTV)', 'J05AR10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (118, 1, 'Celsentri 150 mg (MVC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (119, 1, 'Celsentri 300 mg (MVC)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (120, 1, 'Eviplera (FTC+RPV+TDF)', 'J05AR08');
INSERT INTO "regadbschema"."drug_commercial" VALUES (121, 1, 'Complera (FTC+RPV+TDF)', 'J05AR08');
INSERT INTO "regadbschema"."drug_commercial" VALUES (122, 1, 'Edurant (RPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (123, 1, 'Viramune 400 mg (NVP)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (124, 1, 'Prezista 800 mg (DRV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (125, 1, 'Stribild 150+150+200+245 mg (EVG+cobicistat+FTC+TDF)', 'J05AR09');
INSERT INTO "regadbschema"."drug_commercial" VALUES (126, 1, 'Vitekta 85 mg (EVG)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (127, 1, 'Vitekta 150 mg (EVG)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (128, 1, 'Vitekta (EVG)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (129, 1, 'Victrelis (BOC)', 'J05AE12');
INSERT INTO "regadbschema"."drug_commercial" VALUES (130, 1, 'Victrelis 200mg (BOC)', 'J05AE12');
INSERT INTO "regadbschema"."drug_commercial" VALUES (131, 1, 'Incivo 375mg (TVR)', 'J05AE11');
INSERT INTO "regadbschema"."drug_commercial" VALUES (132, 1, 'Incivo (TVR)', 'J05AE11');
INSERT INTO "regadbschema"."drug_commercial" VALUES (133, 1, 'Viraferon inj. 1M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (134, 1, 'Viraferon inj. 3M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (135, 1, 'Viraferon inj. 5M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (136, 1, 'Viraferon inj. 10M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (137, 1, 'Viraferon inj. 18M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (138, 1, 'Viraferon inj. 25M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (139, 1, 'Viraferon subcut.pen 30M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (140, 1, 'Viraferon subcut.pen 60M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (141, 1, 'Viraferon (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (142, 1, 'Infergen inj. 9 mcg (IFNaCON1)', 'L03AB09');
INSERT INTO "regadbschema"."drug_commercial" VALUES (143, 1, 'Infergen inj. 15 mcg (IFNaCON1)', 'L03AB09');
INSERT INTO "regadbschema"."drug_commercial" VALUES (144, 1, 'Infergen (IFNaCON1)', 'L03AB09');
INSERT INTO "regadbschema"."drug_commercial" VALUES (145, 1, 'Pegasys 135mcg (PEG-IFNa2a)', 'L03AB11');
INSERT INTO "regadbschema"."drug_commercial" VALUES (146, 1, 'Pegasys 180mcg (PEG-IFNa2a)', 'L03AB11');
INSERT INTO "regadbschema"."drug_commercial" VALUES (147, 1, 'Pegasys (PEG-IFNa2a)', 'L03AB11');
INSERT INTO "regadbschema"."drug_commercial" VALUES (148, 1, 'PEG-Intron 50 mcg (PEG-IFNa2b)', 'L03AB10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (149, 1, 'PEG-Intron 80 mcg (PEG-IFNa2b)', 'L03AB10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (150, 1, 'PEG-Intron 100 mcg (PEG-IFNa2b)', 'L03AB10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (151, 1, 'PEG-Intron 120 mcg (PEG-IFNa2b)', 'L03AB10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (152, 1, 'PEG-Intron 150 mcg (PEG-IFNa2b)', 'L03AB10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (153, 1, 'PEG-Intron (PEG-IFNa2b)', 'L03AB10');
INSERT INTO "regadbschema"."drug_commercial" VALUES (154, 1, 'Roferon-A 3M IU (11.1 mcg) (IFNa2a)', 'L03AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (155, 1, 'Roferon-A 6M IU (22.2 mcg) (IFNa2a)', 'L03AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (156, 1, 'Roferon-A 9M IU (33.3 mcg) (IFNa2a)', 'L03AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (157, 1, 'Roferon-A (IFNa2a)', 'L03AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (158, 1, 'IntronA inj. 3M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (159, 1, 'IntronA inj. 5M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (160, 1, 'IntronA inj. 10M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (161, 1, 'IntronA inj. 18M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (162, 1, 'IntronA inj. 25M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (163, 1, 'IntronA subcut.pen 18M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (164, 1, 'IntronA subcut.pen 30M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (165, 1, 'IntronA subcut.pen 60M IU (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (166, 1, 'Intron A (IFNa2b)', 'L03AB05');
INSERT INTO "regadbschema"."drug_commercial" VALUES (167, 1, 'Rebetol 200mg (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (168, 1, 'Rebetol Sol. 40mg/ml (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (169, 1, 'Rebetol (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (170, 1, 'Copegus 200mg (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (171, 1, 'Copegus (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (172, 1, 'Ribavirin Teva 200mg (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (173, 1, 'Ribavirin Teva 400mg (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (174, 1, 'Ribavirin Teva (RBV)', 'J05AB04');
INSERT INTO "regadbschema"."drug_commercial" VALUES (175, 1, 'Zadaxin inj. 1.6mg (Talpha1)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (176, 1, 'Sovaldi (SOF)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (177, 1, 'Sovaldi 400mg (SOF)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (178, 1, 'Olysio (SPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (179, 1, 'Olysio 150mg (SPV)', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (180, 0, 'Glucantime', 'P01CB01');
INSERT INTO "regadbschema"."drug_commercial" VALUES (181, 0, 'Dipirona', 'N02BB02');
INSERT INTO "regadbschema"."drug_commercial" VALUES (182, 1, 'Fenergan', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (183, 1, 'Nebacetin', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (184, 1, 'Talsutin', '');
INSERT INTO "regadbschema"."drug_commercial" VALUES (185, 1, 'Trok G', '');

-- ----------------------------
-- Table structure for drug_generic
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."drug_generic";
CREATE TABLE "regadbschema"."drug_generic" (
  "generic_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".drug_generic_drug_generic_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "drug_class_ii" int4 NOT NULL,
  "generic_id" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "generic_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "resistance_table_order" int4,
  "atc_code" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of drug_generic
-- ----------------------------
INSERT INTO "regadbschema"."drug_generic" VALUES (1, 2, 3, 'APV', 'amprenavir', NULL, 'J05AE05');
INSERT INTO "regadbschema"."drug_generic" VALUES (2, 2, 3, 'IDV', 'indinavir', 3, 'J05AE02');
INSERT INTO "regadbschema"."drug_generic" VALUES (3, 2, 3, 'NFV', 'nelfinavir', 5, 'J05AE04');
INSERT INTO "regadbschema"."drug_generic" VALUES (4, 2, 3, 'RTV', 'ritonavir', 2, 'J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (5, 2, 3, 'SQV', 'saquinavir', 0, 'J05AE01');
INSERT INTO "regadbschema"."drug_generic" VALUES (6, 2, 2, 'ABC', 'abacavir', 5, 'J05AF06');
INSERT INTO "regadbschema"."drug_generic" VALUES (7, 2, 2, 'DDI', 'didanosine', 2, 'J05AF02');
INSERT INTO "regadbschema"."drug_generic" VALUES (8, 2, 2, 'FTC', 'emtricitabine', 6, 'J05AF09');
INSERT INTO "regadbschema"."drug_generic" VALUES (9, 2, 2, '3TC', 'lamivudine', 3, 'J05AF05');
INSERT INTO "regadbschema"."drug_generic" VALUES (10, 2, 2, 'D4T', 'stavudine', 4, 'J05AF04');
INSERT INTO "regadbschema"."drug_generic" VALUES (11, 2, 2, 'TDF', 'tenofovir', 7, 'J05AF07');
INSERT INTO "regadbschema"."drug_generic" VALUES (12, 2, 2, 'DDC', 'zalcitabine', 1, 'J05AF03');
INSERT INTO "regadbschema"."drug_generic" VALUES (13, 2, 2, 'AZT', 'zidovudine', 0, 'J05AF01');
INSERT INTO "regadbschema"."drug_generic" VALUES (14, 2, 1, 'DLV', 'delavirdine', 1, 'J05AG02');
INSERT INTO "regadbschema"."drug_generic" VALUES (15, 2, 1, 'EFV', 'efavirenz', 2, 'J05AG03');
INSERT INTO "regadbschema"."drug_generic" VALUES (16, 2, 1, 'NVP', 'nevirapine', 0, 'J05AG01');
INSERT INTO "regadbschema"."drug_generic" VALUES (17, 2, 4, 'T20', 'enfuvirtide', 0, 'J05AX07');
INSERT INTO "regadbschema"."drug_generic" VALUES (18, 2, 3, 'TPV', 'tipranavir', NULL, 'J05AE09');
INSERT INTO "regadbschema"."drug_generic" VALUES (19, 2, 3, 'ATV', 'atazanavir', 9, 'J05AE08');
INSERT INTO "regadbschema"."drug_generic" VALUES (20, 2, 3, 'FPV', 'fosamprenavir', 6, 'J05AE07');
INSERT INTO "regadbschema"."drug_generic" VALUES (21, 2, 3, 'ATV/r', 'atazanavir/r', 10, 'J05AE08+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (22, 2, 3, 'TPV/r', 'tipranavir/r', 11, 'J05AE09+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (24, 2, 1, 'NNRTI', 'unknown NNRTI', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (25, 2, 2, 'NRTI', 'unknown NRTI', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (26, 2, 5, 'Unknown', 'Unknown', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (27, 2, 2, 'ADV', 'Adefovir', NULL, 'J05AF08');
INSERT INTO "regadbschema"."drug_generic" VALUES (28, 2, 1, 'R82913', 'TIBO R82913', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (29, 2, 1, 'aAPA', 'alpha-APA R 95845', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (30, 2, 3, 'LPV/r', 'lopinavir/r', 8, 'J05AR10');
INSERT INTO "regadbschema"."drug_generic" VALUES (31, 2, 3, 'SQV/r', 'saquinavir/r', 1, 'J05AE01+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (32, 2, 3, 'IDV/r', 'indinavir/r', 4, 'J05AE02+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (33, 2, 3, 'APV/r', 'amprenavir/r', NULL, 'J05AE05+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (34, 2, 3, 'DRV', 'darunavir', NULL, 'J05AE10');
INSERT INTO "regadbschema"."drug_generic" VALUES (35, 2, 3, 'DRV/r', 'darunavir/r', 12, 'J05AE10+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (36, 2, 3, 'FPV/r', 'fosamprenavir/r', 7, 'J05AE07+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (37, 2, 1, 'ETV', 'etravirine', 3, 'J05AG04');
INSERT INTO "regadbschema"."drug_generic" VALUES (38, 2, 6, 'RTG', 'raltegravir', 0, 'J05AX08');
INSERT INTO "regadbschema"."drug_generic" VALUES (39, 2, 4, 'MVC', 'maraviroc', NULL, 'J05AX09');
INSERT INTO "regadbschema"."drug_generic" VALUES (41, 2, 6, 'EVG', 'elvitegravir', 1, 'J05AX11');
INSERT INTO "regadbschema"."drug_generic" VALUES (42, 2, 6, 'EVG/r', 'elvitegravir/r', 2, 'J05AX11+J05AE03');
INSERT INTO "regadbschema"."drug_generic" VALUES (43, 2, 1, 'RPV', 'rilpivirine', 4, 'J05AG05');
INSERT INTO "regadbschema"."drug_generic" VALUES (44, 2, 6, 'DTG', 'dolutegravir', 3, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (45, 0, 3, 'BOC', 'Boceprevir', NULL, 'J05AE12');
INSERT INTO "regadbschema"."drug_generic" VALUES (46, 0, 3, 'TVR', 'Telaprevir', NULL, 'J05AE11');
INSERT INTO "regadbschema"."drug_generic" VALUES (47, 0, 7, 'ALV', 'Alisporivir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (48, 0, 7, 'CYC.INH', 'Unknown Cyclophilin inhibitor', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (49, 0, 8, 'AMA', 'Amantadine', NULL, 'N04BB01');
INSERT INTO "regadbschema"."drug_generic" VALUES (50, 0, 8, 'ANTIVIRAL', 'Unknown Antiviral agent', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (51, 0, 3, 'TMC435', 'TMC-435350', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (52, 0, 3, 'FDV', 'Faldepravir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (53, 0, 3, 'ABT450', 'ABT-450', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (54, 0, 9, 'DCV', 'Daclatasvir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (55, 0, 9, 'NS5A', 'Unknown NS5A inhibitor', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (56, 0, 8, 'VRD', 'Taribavirin', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (57, 0, 10, 'MAX', 'Maxamine', NULL, 'L03AX14');
INSERT INTO "regadbschema"."drug_generic" VALUES (58, 0, 11, 'FBV', 'Filibuvir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (59, 0, 11, 'DBV', 'Deleobuvir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (60, 0, 11, 'ABT333', 'ABT-333', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (61, 0, 11, 'ABT072', 'ABT-072', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (62, 0, 11, 'TGV', 'Tegobuvir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (63, 0, 11, 'NN.NS5B', 'Unknown Non-nucleoside NS5B polymerase inhibitor', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (65, 0, 12, 'IFNaCON1', 'Interferon alfacon-1', NULL, 'L03AB09');
INSERT INTO "regadbschema"."drug_generic" VALUES (66, 0, 12, 'IFN', 'Unknown Interferon', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (67, 0, 12, 'PEG-IFNa2a', 'Peginterferon alfa-2a', NULL, 'L03AB11');
INSERT INTO "regadbschema"."drug_generic" VALUES (68, 0, 12, 'PEG-IFNa2b', 'Peginterferon alfa-2b', NULL, 'L03AB10');
INSERT INTO "regadbschema"."drug_generic" VALUES (69, 0, 12, 'PEG.IFN', 'Unknown Peg. Interferon', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (70, 0, 12, 'IFNa2a', 'Interferon alfa-2a', NULL, 'L03AB04');
INSERT INTO "regadbschema"."drug_generic" VALUES (71, 0, 8, 'RBV', 'Ribavirin', NULL, 'J05AB04');
INSERT INTO "regadbschema"."drug_generic" VALUES (72, 0, 12, 'Talpha1', 'Thymalfasin', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (73, 0, 11, 'SOF', 'Sofosbuvir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (74, 0, 9, 'ABT267', 'ABT-267', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (75, 0, 9, 'LDV', 'Ledipasvir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (76, 0, 3, 'SPV', 'Simeprevir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (77, 0, 3, 'DPV', 'Danoprevir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (78, 0, 3, 'VAN', 'Vaniprevir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (23, 14, 3, 'PI', 'Unknown NS3/4A protease inhibitor', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (64, 3, 12, 'IFNa2b', 'Recombinant Interferon alfa-2b', NULL, 'L03AB05');
INSERT INTO "regadbschema"."drug_generic" VALUES (40, 14, 3, 'CPV', 'Ciluprevir', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (80, 0, 13, 'MA', 'Meglumine antimoniate', NULL, 'P01CB01');
INSERT INTO "regadbschema"."drug_generic" VALUES (81, 0, 14, 'PENT', 'Pentamidine', NULL, 'P01CX01');
INSERT INTO "regadbschema"."drug_generic" VALUES (82, 0, 15, 'AMPHB', 'Amphotericin B', NULL, 'A01AB04');
INSERT INTO "regadbschema"."drug_generic" VALUES (83, 0, 15, 'AMPHBL', 'Amphotericin B Liposomal', NULL, 'J02AA01');
INSERT INTO "regadbschema"."drug_generic" VALUES (84, 0, 16, 'AZI', 'Azithromycin', NULL, 'J01FA10');
INSERT INTO "regadbschema"."drug_generic" VALUES (85, 0, 17, 'PENTO', 'Pentoxifylline', NULL, 'C04AD03');
INSERT INTO "regadbschema"."drug_generic" VALUES (86, 0, 18, 'DIC', 'Diclofenac', NULL, 'D11AX18');
INSERT INTO "regadbschema"."drug_generic" VALUES (87, 0, 18, 'META', 'Metamizole', NULL, 'N02BB02');
INSERT INTO "regadbschema"."drug_generic" VALUES (88, 1, 15, 'CEFA', 'Cefalexine', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (89, 1, 15, 'PRMA', 'Prometazina', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (90, 1, 15, 'LORA', 'Loratadina', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (91, 1, 15, 'SUNB', 'Sulfato de neomicina + bacitracina', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (92, 1, 15, 'TEA', 'Tetraciclina + Anfotericina B', NULL, '');
INSERT INTO "regadbschema"."drug_generic" VALUES (93, 1, 15, 'DIBS', 'Dipropionato de betametasona + sulf de gentamicina', NULL, '');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."event";
CREATE TABLE "regadbschema"."event" (
  "event_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".event_event_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "value_type_ii" int4,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO "regadbschema"."event" VALUES (1, 0, 3, 'Aids defining illness');
INSERT INTO "regadbschema"."event" VALUES (2, 1, 3, 'Gravidez');

-- ----------------------------
-- Table structure for event_nominal_value
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."event_nominal_value";
CREATE TABLE "regadbschema"."event_nominal_value" (
  "nominal_value_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".event_nominal_value_event_nominal_value_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "event_ii" int4 NOT NULL,
  "value" varchar(500) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of event_nominal_value
-- ----------------------------
INSERT INTO "regadbschema"."event_nominal_value" VALUES (1, 0, 1, 'Mycobacterium tuberculosis, any site (pulmonary or extrapulmonary)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (2, 0, 1, 'Herpes simplex: chronic ulcer(s) (greater than 1 month''s duration); or bronchitis, pneumonitis, or esophagitis');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (3, 0, 1, 'Cervical cancer, invasive');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (4, 0, 1, 'Hairy leukoplakia, oral');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (5, 0, 1, 'Visceral leishmaniasis');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (6, 0, 1, 'Listeriosis');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (7, 0, 1, 'Cytomegalovirus disease (other than liver, spleen, or nodes)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (8, 0, 1, 'Lymphoma, primary, of brain');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (9, 0, 1, 'Mycobacterium avium complex or M. kansasii, disseminated or extrapulmonary');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (10, 0, 1, 'Herpes zoster (shingles), involving at least two distinct episodes or more than one dermatome');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (11, 0, 1, 'Pneumocystis carinii pneumonia');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (12, 0, 1, 'Cervical dysplasia (moderate or severe)/cervical carcinoma in situ');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (13, 0, 1, 'Salmonella septicemia, recurrent');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (14, 0, 1, 'Histoplasmosis, disseminated or extrapulmonary');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (15, 0, 1, 'Coccidioidomycosis, disseminated or extrapulmonary');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (16, 0, 1, 'Mycobacterium, other species or unidentified species, disseminated or extrapulmonary');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (17, 0, 1, 'Candidiasis, vulvovaginal; persistent, frequent, or poorly responsive to therapy');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (18, 0, 1, 'Candidiasis, oropharyngeal (thrush)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (19, 0, 1, 'Idiopathic thrombocytopenic purpura');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (20, 0, 1, 'Kaposi''s sarcoma');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (21, 0, 1, 'Pneumonia, recurrent');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (22, 0, 1, 'Progressive multifocal leukoencephalopathy');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (23, 0, 1, 'Isosporiasis, chronic intestinal (greater than 1 month''s duration)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (24, 0, 1, 'Cryptosporidiosis, chronic intestinal (greater than 1 month''s duration)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (25, 0, 1, 'Cytomegalovirus retinitis (with loss of vision)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (26, 0, 1, 'Peripheral neuropathy');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (27, 0, 1, 'Toxoplasmosis of brain');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (28, 0, 1, 'Wasting syndrome due to HIV');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (29, 0, 1, 'Cryptococcosis, extrapulmonary');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (30, 0, 1, 'Candidiasis of bronchi, trachea, or lungs');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (31, 0, 1, 'Strongyloidiasis, disseminated');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (32, 0, 1, 'Encephalopathy, HIV-related');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (33, 0, 1, 'Lymphoma, immunoblastic (or equivalent term)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (34, 0, 1, 'Lymphoma, Burkitt''s (or equivalent term)');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (35, 0, 1, 'Constitutional symptoms, such as fever (38.5 C) or diarrhea lasting greater than 1 month');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (36, 0, 1, 'Pelvic inflammatory disease, particularly if complicated by tubo-ovarian abscess');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (37, 0, 1, 'Bacillary angiomatosis');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (38, 0, 1, 'Candidiasis, esophageal');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (39, 0, 1, 'Hodgkin''s lymphoma');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (40, 1, 2, 'Sim');
INSERT INTO "regadbschema"."event_nominal_value" VALUES (41, 1, 2, 'Não');

-- ----------------------------
-- Table structure for genome
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."genome";
CREATE TABLE "regadbschema"."genome" (
  "genome_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".genome_genome_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "organism_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "organism_description" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "genbank_number" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of genome
-- ----------------------------
INSERT INTO "regadbschema"."genome" VALUES (7, 0, 'Leishmaniasis', 'Leishmaniasis', 'U31221.1');
INSERT INTO "regadbschema"."genome" VALUES (5, 0, 'HTLV-1', 'Human T-lymphotropic virus Type 1', 'J02029');
INSERT INTO "regadbschema"."genome" VALUES (6, 0, 'HIV-1 O', 'Human immunodeficiency virus type 1 (group O)', 'L20587');
INSERT INTO "regadbschema"."genome" VALUES (4, 42, 'HCV', 'Hepatitis C virus', 'AF009606');
INSERT INTO "regadbschema"."genome" VALUES (1, 52, 'HIV-1', 'K03455.1|HIVHXB2CG Human immunodeficiency virus type 1 (HXB2)', 'K03455');
INSERT INTO "regadbschema"."genome" VALUES (3, 52, 'HIV-2B', 'EHO Human immunodeficiency virus type 2B', 'U27200');
INSERT INTO "regadbschema"."genome" VALUES (2, 52, 'HIV-2A', 'ROD Human immunodeficiency virus type 2A', 'M15390');

-- ----------------------------
-- Table structure for genome_drug_generic
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."genome_drug_generic";
CREATE TABLE "regadbschema"."genome_drug_generic" (
  "genome_ii" int4 NOT NULL,
  "generic_ii" int4 NOT NULL
)
;

-- ----------------------------
-- Records of genome_drug_generic
-- ----------------------------
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 1);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 1);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 1);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 2);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 2);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 2);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 3);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 3);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 3);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 4);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 4);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 4);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 5);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 5);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 5);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 6);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 6);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 6);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 7);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 7);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 7);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 8);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 8);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 8);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 9);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 9);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 9);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 10);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 10);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 10);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 11);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 11);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 11);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 12);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 12);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 12);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 13);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 13);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 13);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 14);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 14);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 14);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 15);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 15);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 15);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 16);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 16);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 16);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 17);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 17);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 17);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 18);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 18);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 18);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 19);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 19);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 19);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 20);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 20);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 20);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 21);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 21);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 21);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 22);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 22);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 22);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 24);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 24);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 24);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 25);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 25);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 25);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 26);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 26);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 26);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 27);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 27);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 27);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 28);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 28);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 28);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 29);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 29);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 29);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 30);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 30);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 30);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 31);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 31);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 31);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 32);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 32);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 32);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 33);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 33);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 33);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 34);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 34);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 34);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 35);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 35);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 35);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 36);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 36);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 36);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 37);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 37);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 37);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 38);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 38);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 38);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 39);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 39);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 39);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 41);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 41);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 41);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 42);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 42);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 42);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 43);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 43);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 43);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (1, 44);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (2, 44);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (3, 44);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 45);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 46);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 47);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 48);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 49);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 50);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 51);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 52);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 53);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 54);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 55);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 56);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 57);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 58);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 59);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 60);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 61);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 62);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 63);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 64);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 65);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 66);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 67);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 68);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 69);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 70);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 71);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 72);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 73);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 74);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 75);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 76);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 77);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 78);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 23);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (4, 40);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 80);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 81);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 82);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 83);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 84);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 85);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 86);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 87);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 88);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 89);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 90);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 91);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 92);
INSERT INTO "regadbschema"."genome_drug_generic" VALUES (7, 93);

-- ----------------------------
-- Table structure for nt_sequence
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."nt_sequence";
CREATE TABLE "regadbschema"."nt_sequence" (
  "nt_sequence_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".nt_sequence_nt_sequence_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "viral_isolate_ii" int4 NOT NULL,
  "label" varchar(50) COLLATE "pg_catalog"."default",
  "sequence_date" date,
  "nucleotides" text COLLATE "pg_catalog"."default",
  "aligned" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Table structure for open_reading_frame
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."open_reading_frame";
CREATE TABLE "regadbschema"."open_reading_frame" (
  "open_reading_frame_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".open_reading_frame_open_reading_frame_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "genome_ii" int4 NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "reference_sequence" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of open_reading_frame
-- ----------------------------
INSERT INTO "regadbschema"."open_reading_frame" VALUES (2, 0, 1, 'vpu', 'viral protein U', 'acgcaacctataccaatagtagcaatagtagcattagtagtagcaataataatagcaatagttgtgtggtccatagtaatcatagaatataggaaaatattaagacaaagaaaaatagacaggttaattgatagactaatagaaagagcagaagacagtggcaatgagagtgaaggagaaatatcagcacttgtggagatgggggtggagatggggcaccatgctccttgggatgttgatgatctgtag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (3, 0, 1, 'nef', 'nef', 'atgggtggcaagtggtcaaaaagtagtgtgattggatggcctactgtaagggaaagaatgagacgagctgagccagcagcagatagggtgggagcagcatctcgagacctggaaaaacatggagcaatcacaagtagcaatacagcagctaccaatgctgcttgtgcctggctagaagcacaagaggaggaggaggtgggttttccagtcacacctcaggtacctttaagaccaatgacttacaaggcagctgtagatcttagccactttttaaaagaaaaggggggactggaagggctaattcactcccaaagaagacaagatatccttgatctgtggatctaccacacacaaggctacttccctgattagcagaactacacaccagggccaggggtcagatatccactgacctttggatggtgctacaagctagtaccagttgagccagataagatagaagaggccaataaaggagagaacaccagcttgttacaccctgtgagcctgcatgggatggatgacccggagagagaagtgttagagtggaggtttgacagccgcctagcatttcatcacgtggcccgagagctgcatccggagtacttcaagaactgctga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (6, 0, 1, 'tat', 'tat', 'atggagccagtagatcctagactagagccctggaagcatccaggaagtcagcctaaaactgcttgtaccaattgctattgtaaaaagtgttgctttcattgccaagtttgtttcataacaaaagccttaggcatctcctatggcaggaagaagcggagacagcgacgaagagctcatcagaacagtcagactcatcaagcttctctatcaaagcaacccacctcccaaccccgaggggacccgacaggcccgaaggaatagaagaagaaggtggagagagagacagagacagatccattcgattag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (1, 0, 1, 'gag', 'group-specific antigen', 'atgggtgcgagagcgtcagtattaagcgggggagaattagatcgatgggaaaaaattcggttaaggccagggggaaagaaaaaatataaattaaaacatatagtatgggcaagcagggagctagaacgattcgcagttaatcctggcctgttagaaacatcagaaggctgtagacaaatactgggacagctacaaccatcccttcagacaggatcagaagaacttagatcattatataatacagtagcaaccctctattgtgtgcatcaaaggatagagataaaagacaccaaggaagctttagacaagatagaggaagagcaaaacaaaagtaagaaaaaagcacagcaagcagcagctgacacaggacacagcaatcaggtcagccaaaattaccctatagtgcagaacatccaggggcaaatggtacatcaggccatatcacctagaactttaaatgcatgggtaaaagtagtagaagagaaggctttcagcccagaagtgatacccatgttttcagcattatcagaaggagccaccccacaagatttaaacaccatgctaaacacagtggggggacatcaagcagccatgcaaatgttaaaagagaccatcaatgaggaagctgcagaatgggatagagtgcatccagtgcatgcagggcctattgcaccaggccagatgagagaaccaaggggaagtgacatagcaggaactactagtacccttcaggaacaaataggatggatgacaaataatccacctatcccagtaggagaaatttataaaagatggataatcctgggattaaataaaatagtaagaatgtatagccctaccagcattctggacataagacaaggaccaaaggaaccctttagagactatgtagaccggttctataaaactctaagagccgagcaagcttcacaggaggtaaaaaattggatgacagaaaccttgttggtccaaaatgcgaacccagattgtaagactattttaaaagcattgggaccagcggctacactagaagaaatgatgacagcatgtcagggagtaggaggacccggccataaggcaagagttttggctgaagcaatgagccaagtaacaaattcagctaccataatgatgcagagaggcaattttaggaaccaaagaaagattgttaagtgtttcaattgtggcaaagaagggcacacagccagaaattgcagggcccctaggaaaaagggctgttggaaatgtggaaaggaaggacaccaaatgaaagattgtactgagagacaggctaattttttagggaagatctggccttcctacaagggaaggccagggaattttcttcagagcagaccagagccaacagccccaccagaagagagcttcaggtctggggtagagacaacaactccccctcagaagcaggagccgatagacaaggaactgtatcctttaacttccctcaggtcactctttggcaacgacccctcgtcacaataa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (4, 0, 1, 'env', 'envelope', 'atgagagtgaaggagaaatatcagcacttgtggagatgggggtggagatggggcaccatgctccttgggatgttgatgatctgtagtgctacagaaaaattgtgggtcacagtctattatggggtacctgtgtggaaggaagcaaccaccactctattttgtgcatcagatgctaaagcatatgatacagaggtacataatgtttgggccacacatgcctgtgtacccacagaccccaacccacaagaagtagtattggtaaatgtgacagaaaattttaacatgtggaaaaatgacatggtagaacagatgcatgaggatataatcagtttatgggatcaaagcctaaagccatgtgtaaaattaaccccactctgtgttagtttaaagtgcactgatttgaagaatgatactaataccaatagtagtagcgggagaatgataatggagaaaggagagataaaaaactgctctttcaatatcagcacaagcataagaggtaaggtgcagaaagaatatgcatttttttataaacttgatataataccaatagataatgatactaccagctataagttgacaagttgtaacacctcagtcattacacaggcctgtccaaaggtatcctttgagccaattcccatacattattgtgccccggctggttttgcgattctaaaatgtaataataagacgttcaatggaacaggaccatgtacaaatgtcagcacagtacaatgtacacatggaattaggccagtagtatcaactcaactgctgttaaatggcagtctagcagaagaagaggtagtaattagatctgtcaatttcacggacaatgctaaaaccataatagtacagctgaacacatctgtagaaattaattgtacaagacccaacaacaatacaagaaaaagaatccgtatccagagaggaccagggagagcatttgttacaataggaaaaataggaaatatgagacaagcacattgtaacattagtagagcaaaatggaataacactttaaaacagatagctagcaaattaagagaacaatttggaaataataaaacaataatctttaagcaatcctcaggaggggacccagaaattgtaacgcacagttttaattgtggaggggaatttttctactgtaattcaacacaactgtttaatagtacttggtttaatagtacttggagtactgaagggtcaaataacactgaaggaagtgacacaatcaccctcccatgcagaataaaacaaattataaacatgtggcagaaagtaggaaaagcaatgtatgcccctcccatcagtggacaaattagatgttcatcaaatattacagggctgctattaacaagagatggtggtaatagcaacaatgagtccgagatcttcagacctggaggaggagatatgagggacaattggagaagtgaattatataaatataaagtagtaaaaattgaaccattaggagtagcacccaccaaggcaaagagaagagtggtgcagagagaaaaaagagcagtgggaataggagctttgttccttgggttcttgggagcagcaggaagcactatgggcgcagcctcaatgacgctgacggtacaggccagacaattattgtctggtatagtgcagcagcagaacaatttgctgagggctattgaggcgcaacagcatctgttgcaactcacagtctggggcatcaagcagctccaggcaagaatcctggctgtggaaagatacctaaaggatcaacagctcctggggatttggggttgctctggaaaactcatttgcaccactgctgtgccttggaatgctagttggagtaataaatctctggaacagatttggaatcacacgacctggatggagtgggacagagaaattaacaattacacaagcttaatacactccttaattgaagaatcgcaaaaccagcaagaaaagaatgaacaagaattattggaattagataaatgggcaagtttgtggaattggtttaacataacaaattggctgtggtatataaaattattcataatgatagtaggaggcttggtaggtttaagaatagtttttgctgtactttctatagtgaatagagttaggcagggatattcaccattatcgtttcagacccacctcccaaccccgaggggacccgacaggcccgaaggaatagaagaagaaggtggagagagagacagagacagatccattcgattagtgaacggatccttggcacttatctgggacgatctgcggagcctgtgcctcttcagctaccaccgcttgagagacttactcttgattgtaacgaggattgtggaacttctgggacgcagggggtgggaagccctcaaatattggtggaatctcctacagtattggagtcaggaactaaagaatagtgctgttagcttgctcaatgccacagccatagcagtagctgaggggacagatagggttatagaagtagtacaaggagcttgtagagctattcgccacatacctagaagaataagacagggcttggaaaggattttgctataa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (5, 0, 1, 'vif', 'viral infectivity factor', 'atggaaaacagatggcaggtgatgattgtgtggcaagtagacaggatgaggattagaacatggaaaagtttagtaaaacaccatatgtatgtttcagggaaagctaggggatggttttatagacatcactatgaaagccctcatccaagaataagttcagaagtacacatcccactaggggatgctagattggtaataacaacatattggggtctgcatacaggagaaagagactggcatttgggtcagggagtctccatagaatggaggaaaaagagatatagcacacaagtagaccctgaactagcagaccaactaattcatctgtattactttgactgtttttcagactctgctataagaaaggccttattaggacacatagttagccctaggtgtgaatatcaagcaggacataacaaggtaggatctctacaatacttggcactagcagcattaataacaccaaaaaagataaagccacctttgcctagtgttacgaaactgacagaggatagatggaacaagccccagaagaccaagggccacagagggagccacacaatgaatggacactag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (7, 0, 1, 'vpr', 'viral protein R', 'atggaacaagccccagaagaccaagggccacagagggagccacacaatgaatggacactagagcttttagaggagcttaagaatgaagctgttagacattttcctaggatttggctccatggcttagggcaacatatctatgaaacttatggggatacttgggcaggagtggaagccataataagaattctgcaacaactgctgtttatccattttcagaattgggtgtcgacatagcagaataggcgttactcgacagaggagagcaagaaatggagccagtagatccta');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (8, 0, 1, 'rev', 'rev', 'atggcaggaagaagcggagacagcgacgaagagctcatcagaacagtcagactcatcaagcttctctatcaaagcaacccacctcccaaccccgaggggacccgacaggcccgaaggaatagaagaagaaggtggagagagagacagagacagatccattcgattagtgaacggatccttggcacttatctgggacgatctgcggagcctgtgcctcttcagctaccaccgcttgagagacttactcttgattgtaacgaggattgtggaacttctgggacgcagggggtgggaagccctcaaatattggtggaatctcctacagtattggagtcaggaactaaagaatag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (9, 0, 1, 'pol', 'polymerase', 'ttttttagggaagatctggccttcctacaagggaaggccagggaattttcttcagagcagaccagagccaacagccccaccagaagagagcttcaggtctggggtagagacaacaactccccctcagaagcaggagccgatagacaaggaactgtatcctttaacttccctcaggtcactctttggcaacgacccctcgtcacaataaagataggggggcaactaaaggaagctctattagatacaggagcagatgatacagtattagaagaaatgagtttgccaggaagatggaaaccaaaaatgatagggggaattggaggttttatcaaagtaagacagtatgatcagatactcatagaaatctgtggacataaagctataggtacagtattagtaggacctacacctgtcaacataattggaagaaatctgttgactcagattggttgcactttaaattttcccattagccctattgagactgtaccagtaaaattaaagccaggaatggatggcccaaaagttaaacaatggccattgacagaagaaaaaataaaagcattagtagaaatttgtacagagatggaaaaggaagggaaaatttcaaaaattgggcctgaaaatccatacaatactccagtatttgccataaagaaaaaagacagtactaaatggagaaaattagtagatttcagagaacttaataagagaactcaagacttctgggaagttcaattaggaataccacatcccgcagggttaaaaaagaaaaaatcagtaacagtactggatgtgggtgatgcatatttttcagttcccttagatgaagacttcaggaagtatactgcatttaccatacctagtataaacaatgagacaccagggattagatatcagtacaatgtgcttccacagggatggaaaggatcaccagcaatattccaaagtagcatgacaaaaatcttagagccttttagaaaacaaaatccagacatagttatctatcaatacatggatgatttgtatgtaggatctgacttagaaatagggcagcatagaacaaaaatagaggagctgagacaacatctgttgaggtggggacttaccacaccagacaaaaaacatcagaaagaacctccattcctttggatgggttatgaactccatcctgataaatggacagtacagcctatagtgctgccagaaaaagacagctggactgtcaatgacatacagaagttagtggggaaattgaattgggcaagtcagatttacccagggattaaagtaaggcaattatgtaaactccttagaggaaccaaagcactaacagaagtaataccactaacagaagaagcagagctagaactggcagaaaacagagagattctaaaagaaccagtacatggagtgtattatgacccatcaaaagacttaatagcagaaatacagaagcaggggcaaggccaatggacatatcaaatttatcaagagccatttaaaaatctgaaaacaggaaaatatgcaagaatgaggggtgcccacactaatgatgtaaaacaattaacagaggcagtgcaaaaaataaccacagaaagcatagtaatatggggaaagactcctaaatttaaactgcccatacaaaaggaaacatgggaaacatggtggacagagtattggcaagccacctggattcctgagtgggagtttgttaatacccctcccttagtgaaattatggtaccagttagagaaagaacccatagtaggagcagaaaccttctatgtagatggggcagctaacagggagactaaattaggaaaagcaggatatgttactaatagaggaagacaaaaagttgtcaccctaactgacacaacaaatcagaagactgagttacaagcaatttatctagctttgcaggattcgggattagaagtaaacatagtaacagactcacaatatgcattaggaatcattcaagcacaaccagatcaaagtgaatcagagttagtcaatcaaataatagagcagttaataaaaaaggaaaaggtctatctggcatgggtaccagcacacaaaggaattggaggaaatgaacaagtagataaattagtcagtgctggaatcaggaaagtactatttttagatggaatagataaggcccaagatgaacatgagaaatatcacagtaattggagagcaatggctagtgattttaacctgccacctgtagtagcaaaagaaatagtagccagctgtgataaatgtcagctaaaaggagaagccatgcatggacaagtagactgtagtccaggaatatggcaactagattgtacacatttagaaggaaaagttatcctggtagcagttcatgtagccagtggatatatagaagcagaagttattccagcagaaacagggcaggaaacagcatattttcttttaaaattagcaggaagatggccagtaaaaacaatacatactgacaatggcagcaatttcaccggtgctacggttagggccgcctgttggtgggcgggaatcaagcaggaatttggaattccctacaatccccaaagtcaaggagtagtagaatctatgaataaagaattaaagaaaattataggacaggtaagagatcaggctgaacatcttaagacagcagtacaaatggcagtattcatccacaattttaaaagaaaaggggggattggggggtacagtgcaggggaaagaatagtagacataatagcaacagacatacaaactaaagaattacaaaaacaaattacaaaaattcaaaattttcgggtttattacagggacagcagaaatccactttggaaaggaccagcaaagctcctctggaaaggtgaaggggcagtagtaatacaagataatagtgacataaaagtagtgccaagaagaaaagcaaagatcattagggattatggaaaacagatggcaggtgatgattgtgtggcaagtagacaggatgaggattag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (11, 0, 2, 'vpr', 'viral protein R', 'atggctgaagcaccaacagagctccccccggtggatgggaccccactgagggagccaggggatgagtggataatagaaatcttgagagaaataaaagaagaagctttaaagcattttgaccctcgcttgctaattgctcttggcaaatatatctatactagacatggagacacccttgaaggcgccagagagctcattaaagtcctgcaacgagcccttttcacgcacttcagagcaggatgtggccactcaagaattggccag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (10, 0, 2, 'gag', 'group-specific antigen', 'atgggcgcgagaaactccgtcttgagagggaaaaaagcagatgaattagaaagaatcaggttacggcccggcggaaagaaaaagtacaggctaaaacatattgtgtgggcagcgaataaattggacagattcggattagcagagagcctgttggagtcaaaagagggttgtcaaaaaattcttacagttttagatccaatggtaccgacaggttcagaaaatttaaaaagtctttttaatactgtctgcgtcatttggtgcatacacgcagaagagaaagtgaaagatactgaaggagcaaaacaaatagtgcggagacatctagtggcagaaacaggaactgcagagaaaatgccaagcacaagtagaccaacagcaccatctagcgagaagggaggaaattacccagtgcaacatgtaggcggcaactacacccatataccgctgagtccccgaaccctaaatgcctgggtaaaattagtagaggaaaaaaagttcggggcagaagtagtgccaggatttcaggcactctcagaaggctgcacgccctatgatatcaaccaaatgcttaattgtgtgggcgaccatcaagcagccatgcagataatcagggagattatcaatgaggaagcagcagaatgggatgtgcaacatccaataccaggccccttaccagcggggcagcttagagagccaaggggatctgacatagcagggacaacaagcacagtagaagaacagatccagtggatgtttaggccacaaaatcctgtaccagtaggaaacatctatagaagatggatccagataggattgcagaagtgtgtcaggatgtacaacccgaccaacatcctagacataaaacagggaccaaaggagccgttccaaagctatgtagatagattctacaaaagcttgagggcagaacaaacagatccagcagtgaagaattggatgacccaaacactgctagtacaaaatgccaacccagactgtaaattagtgctaaaaggactagggatgaaccctaccttagaagagatgctgaccgcctgtcagggggtaggtgggccaggccagaaagctagattaatggcagaggccctgaaagaggtcataggacctgcccctatcccattcgcagcagcccagcagagaaaggcatttaaatgctggaactgtggaaaggaagggcactcggcaagacaatgccgagcacctagaaggcagggctgctggaagtgtggtaagccaggacacatcatgacaaactgcccagatagacaggcaggttttttaggactgggcccttggggaaagaagccccgcaacttccccgtggcccaagttccgcaggggctgacaccaacagcacccccagtggatccagcagtggatctactggagaaatatatgcagcaagggaaaagacagagagagcagagagagagaccatacaaggaagtgacagaggacttactgcacctcgagcagggggagacaccatacagggagccaccaacagaggacttgctgcacctcaattctctctttggaaaagaccagtag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (13, 0, 2, 'tat', 'tat', 'atggagacacccttgaaggcgccagagagctcattaaagtcctgcaacgagcccttttcacgcacttcagagcaggatgtggccactcaagaattggccagacaaggggaggaaatcctctctcagctataccgacccctagaaacatgcaataactcatgctattgtaagcgatgctgctaccattgtcagatgtgttttctaaacaaggggctcgggatatgttatgaacgaaagggcagacgaagaaggactccaaagaaaactaagactcatccgtctcctacaccagacaaatccatatccacaaggaccggggacagccagccaacgaagaaacagaagaagacggtggaagcaacggtggagacagatactggccctggccgatag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (14, 0, 2, 'vpx', 'vpx', 'atgacagaccccagagagacagtaccaccaggaaacagcggcgaagagactatcggagaggccttcgcctggctaaacaggacagtagaagccataaacagagaagcagtgaatcacctaccccgagaacttattttccaggtgtggcagaggtcctggagatactggcatgatgaacaagggatgtcagaaagttacacaaagtatagatatttgtgcataatacagaaagcagtgtacatgcatgttaggaaagggtgtacttgcctggggaggggacatgggccaggagggtggagaccagggcctcctcctcctccccctccaggtctggtctaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (12, 0, 2, 'pol', 'polymerase', 'ttttttaggactgggcccttggggaaagaagccccgcaacttccccgtggcccaagttccgcaggggctgacaccaacagcacccccagtggatccagcagtggatctactggagaaatatatgcagcaagggaaaagacagagagagcagagagagagaccatacaaggaagtgacagaggacttactgcacctcgagcagggggagacaccatacagggagccaccaacagaggacttgctgcacctcaattctctctttggaaaagaccagtagtcacagcatacattgagggtcagccagtagaagtcttgttagacacaggggctgacgactcaatagtagcaggaatagagttagggaacaattatagcccaaaaatagtagggggaatagggggattcataaataccaaggaatataaaaatgtagaaatagaagttctaaataaaaaggtacgggccaccataatgacaggcgacaccccaatcaacatttttggcagaaatattctgacagccttaggcatgtcattaaatctaccagtcgccaaagtagagccaataaaaataatgctaaagccagggaaagatggaccaaaactgagacaatggcccttaacaaaagaaaaaatagaagcactaaaagaaatctgtgaaaaaatggaaaaagaaggccagctagaggaagcacctccaactaatccttataatacccccacatttgcaatcaagaaaaaggacaaaaacaaatggaggatgctaatagatttcagagaactaaacaaggtaactcaagatttcacagaaattcagttaggaattccacacccagcagggttggccaagaagagaagaattactgtactagatgtaggggatgcttacttttccataccactacatgaggactttagaccatatactgcatttactctaccatcagtgaacaatgcagaaccaggaaaaagatacatatataaagtcttgccacagggatggaagggatcaccagcaatttttcaacacacaatgagacaggtattagaaccattcagaaaagcaaacaaggatgtcattatcattcagtacatggatgatatcttaatagctagtgacaggacagatttagaacatgatagggtagtcctgcagctcaaggaacttctaaatggcctaggattttctaccccagatgagaagttccaaaaagaccctccataccactggatgggctatgaactatggccaactaaatggaagttgcagaaaatacagttgccccaaaaagaaatatggacagtcaatgacatccagaagctagtgggtgtcctaaattgggcagcacaactctacccagggataaagaccaaacacttatgtaggttaatcagaggaaaaatgacactcacagaagaagtacagtggacagaattagcagaagcagagctagaagaaaacagaattatcctaagccaggaacaagagggacactattaccaagaagaaaaagagctagaagcaacagtccaaaaggatcaagagaatcagtggacatataaaatacaccaggaagaaaaaattctaaaagtaggaaaatatgcaaaggtgaaaaacacccataccaatggaatcagattgttagcacaggtagttcagaaaataggaaaagaagcactagtcatttggggacgaataccaaaatttcacctaccagtagagagagaaatctgggagcagtggtgggataactactggcaagtgacatggatcccagactgggacttcgtgtctaccccaccactggtcaggttagcgtttaacctggtaggggatcctataccaggtgcagagaccttctacacagatggatcctgcaataggcaatcaaaagaaggaaaagcaggatatgtaacagatagagggaaagacaaggtaaagaaactagagcaaactaccaatcagcaagcagaactagaagcctttgcgatggcactaacagactcgggtccaaaagttaatattatagtagactcacagtatgtaatggggatcagtgcaagccaaccaacagagtcagaaagtaaaatagtgaaccagatcatagaagaaatgataaaaaaggaagcaatctatgttgcatgggtcccagcccacaaaggcatagggggaaaccaggaagtagatcatttagtgagtcagggtatcagacaagtgttgttcctggaaaaaatagagcccgctcaggaagaacatgaaaaatatcatagcaatgtaaaagaactgtctcataaatttggaatacccaatttagtggcaaggcaaatagtaaactcatgtgcccaatgtcaacagaaaggggaagctatacatgggcaagtaaatgcagaactaggcacttggcaaatggactgcacacatttagaaggaaagatcattatagtagcagtacatgttgcaagtggatttatagaagcagaagtcatcccacaggaatcaggaagacaaacagcactcttcctattgaaactggcaagtaggtggccaataacacacttgcatacagataatggtgccaacttcacttcacaggaggtgaagatggtagcatggtggataggtatagaacaatcctttggagtaccttacaatccacagagccaaggagtagtagaagcaatgaatcaccatctaaaaaaccaaataagtagaatcagagaacaggcaaatacaatagaaacaatagtactaatggcaattcattgcatgaattttaaaagaagggggggaataggggatatgactccatcagaaagattaatcaatatgatcaccacagaacaagagatacaattcctccaagccaaaaattcaaaattaaaagattttcgggtctatttcagagaaggcagagatcagttgtggaaaggacctggggaactactgtggaaaggagaaggagcagtcctagtcaaggtaggaacagacataaaaataataccaagaaggaaagccaagatcatcagagactatggaggaagacaagagatggatagtggttcccacctggagggtgccagggaggatggagaaatggcatagccttgtcaagtatctaaaatacaaaacaaaggatctagaaaaggtgtgctatgttccccaccataaggtgggatgggcatggtggacttgcagcagggtaatattcccattaaaaggaaacagtcatctagagatacaggcatattggaacttaacaccagaaaaaggatggctctcctcttattcagtaagaataacttggtacacagaaaagttctggacagatgttaccccagactgtgcagatgtcctaatacatag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (15, 0, 2, 'vif', 'viral infectivity factor', 'atggaggaagacaagagatggatagtggttcccacctggagggtgccagggaggatggagaaatggcatagccttgtcaagtatctaaaatacaaaacaaaggatctagaaaaggtgtgctatgttccccaccataaggtgggatgggcatggtggacttgcagcagggtaatattcccattaaaaggaaacagtcatctagagatacaggcatattggaacttaacaccagaaaaaggatggctctcctcttattcagtaagaataacttggtacacagaaaagttctggacagatgttaccccagactgtgcagatgtcctaatacatagcacttatttcccttgctttacagcaggtgaagtaagaagagccatcagaggggaaaagttattgtcctgctgcaattatccccgagctcatagagcccaggtaccgtcacttcaatttctggccttagtggtagtgcaacaaaatgacagaccccagagagacagtaccaccaggaaacagcggcgaagagactatcggagaggccttcgcctggctaaacaggacagtagaagccataaacagagaagcagtgaatcacctaccccgagaacttattttccaggtgtggcagaggtcctggagatactggcatga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (16, 0, 2, 'nef', 'nef', 'atgggtgcgagtggatccaagaagcattccaggccgccgcgagggctacaagagagactcttgcgggcgcgtgcaggggcttgtggagggtattggaacgaatcgggaggggaatactcgcggttccaagaaggatcagacagggagcagaaatcgccctcctgtgagggacggcagtatcagcagggagactttatgaatactccatggaaggacccagcagcagaaagggagaaaaatttgtacaggcaacaaaatatggatgatgtagattcagatgatgatgaccaagtaagagtttctgtcacaccaaaagtaccactaagaccaatgacacatagattggcaatagatatgtcacatttaataaaaacaagggggggactggaagggatgttttacagtgaaagaagacataaaatcttaaatatatacttagaaaaggaagaagggataattgcagattggcagaactacactcatgggccaggagtaagatacccaatgttctttgggtggctatggaagctagtaccagtagatgtcccacaagaaggggaggacactgagactcactgcttagtacatccagcacaaacaagcaagtttgatgacccgcatggggagacactagtctgggagtttgatcccttgctggcttatagttacgaggcttttattcggtacccagaggaatttgggcacaagtcaggcctgccagaggaagagtggaaggcgagactgaaagcaagaggaataccatttagttaaaga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (17, 0, 2, 'env', 'envelope', 'atgatgaatcagctgcttattgccattttattagctagtgcttgcttagtatattgcacccaatatgtaactgttttctatggcgtacccacgtggaaaaatgcaaccattcccctcttttgtgcaaccagaaatagggatacttggggaaccatacagtgcttgcctgacaatgatgattatcaggaaataactttgaatgtaacagaggcttttgatgcatggaataatacagtaacagaacaagcaatagaagatgtctggcatctattcgagacatcaataaaaccatgtgtcaaactaacacctttatgtgtagcaatgaaatgcagcagcacagagagcagcacagggaacaacacaacctcaaagagcacaagcacaaccacaaccacacccacagaccaggagcaagagataagtgaggatactccatgcgcacgcgcagacaactgctcaggattgggagaggaagaaacgatcaattgccagttcaatatgacaggattagaaagagataagaaaaaacagtataatgaaacatggtactcaaaagatgtggtttgtgagacaaataatagcacaaatcagacccagtgttacatgaaccattgcaacacatcagtcatcacagaatcatgtgacaagcactattgggatgctataaggtttagatactgtgcaccaccgggttatgccctattaagatgtaatgataccaattattcaggctttgcacccaactgttctaaagtagtagcttctacatgcaccaggatgatggaaacgcaaacttccacatggtttggctttaatggcactagagcagagaatagaacatatatctattggcatggcagagataatagaactatcatcagcttaaacaaatattataatctcagtttgcattgtaagaggccagggaataagatagtgaaacaaataatgcttatgtcaggacatgtgtttcactcccactaccagccgatcaataaaagacccagacaagcatggtgctggttcaaaggcaaatggaaagacgccatgcaggaggtgaaggaaacccttgcaaaacatcccaggtatagaggaaccaatgacacaaggaatattagctttgcagcgccaggaaaaggctcagacccagaagtagcatacatgtggactaactgcagaggagagtttctctactgcaacatgacttggttcctcaattggatagagaataagacacaccgcaattatgcaccgtgccatataaagcaaataattaacacatggcataaggtagggagaaatgtatatttgcctcccagggaaggggagctgtcctgcaactcaacagtaaccagcataattgctaacattgactggcaaaacaataatcagacaaacattacctttagtgcagaggtggcagaactatacagattggagttgggagattataaattggtagaaataacaccaattggcttcgcacctacaaaagaaaaaagatactcctctgctcacgggagacatacaagaggtgtgttcgtgctagggttcttgggttttctcgcaacagcaggttctgcaatgggcgcggcgtccctgaccgtgtcggctcagtcccggactttactggccgggatagtgcagcaacagcaacagctgttggacgtggtcaagagacaacaagaactgttgcgactgaccgtctggggaacgaaaaacctccaggcaagagtcactgctatagagaagtacctacaggaccaggcgcggctaaattcatggggatgtgcgtttagacaagtctgccacactactgtaccatgggttaatgattccttagcacctgactgggacaatatgacgtggcaggaatgggaaaaacaagtccgctacctggaggcaaatatcagtaaaagtttagaacaggcacaaattcagcaagagaaaaatatgtatgaactacaaaaattaaatagctgggatatttttggcaattggtttgacttaacctcctgggtcaagtatattcaatatggagtgcttataatagtagcagtaatagctttaagaatagtgatatatgtagtacaaatgttaagtaggcttagaaagggctataggcctgttttctcttccccccccggttatatccaacagatccatatccacaaggaccggggacagccagccaacgaagaaacagaagaagacggtggaagcaacggtggagacagatactggccctggccgatagcatatatacatttcctgatccgccagctgattcgcctcttgaccagactatacagcatctgcagggacttactatccaggagcttcctgaccctccaactcatctaccagaatctcagagactggctgagacttagaacagccttcttgcaatatgggtgcgagtggatccaagaagcattccaggccgccgcgagggctacaagagagactcttgcgggcgcgtgcaggggcttgtggagggtattggaacgaatcgggaggggaatactcgcggttccaagaaggatcagacagggagcagaaatcgccctcctgtga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (18, 0, 2, 'rev', 'rev', 'atgaacgaaagggcagacgaagaaggactccaaagaaaactaagactcatccgtctcctacaccagacaaatccatatccacaaggaccggggacagccagccaacgaagaaacagaagaagacggtggaagcaacggtggagacagatactggccctggccgatagcatatatacatttcctgatccgccagctgattcgcctcttgaccagactatacagcatctgcagggacttactatccaggagcttcctgaccctccaactcatctaccagaatctcagagactggctgagacttag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (19, 0, 3, 'pol', 'polymerase', 'ttttttagggttcggcccctggggaaagaagcctcgcaatttccccgtccaggcaccccaggggatagtgccatctgcgcccccgatgaacccagcattcggcatgacacctcagggtgcgattccatctgcaccccctgcagatccagcagaggagatgctaaagaactacatgcaactagggaagaagcagaaggagaacagagagagaccctacaaggaggtgacagaggatttgctgcacctcaattctctctttggagaagaccagtagtcaaagcaactattgagggtcaatcagtagaagtattactagacacaggagctgatgactcaatagtagcagggatagaattaggcagcaattacaccccaaaaatagtaggtgggataggaggatttataaataccaatgaatacaaaaatgtagaaatagaagtagtaggaaaaagagtaagagcaacagtaatgacaggggacaccccaataaacatttttggcagaaatattttaaatagcttaggcatgactctaaatttcccagtagcaaggatagaaccagtaaaagtccagttaaagcctgaaaaagatgggccaaaaatcagacaatggcccctatccaaagagaaaatactagccctcaaagaaatctgtgaaaaaatggaaaaagagggacagttagaagaggcgcctcctactaatccatacaattcgcccaccttcgccataaaaaagaaagacaaaaacaaatggaggatgctaatagatttcagagaactaaacaaggtaacccaagaatttacagaggtccagctgggtattcctcacccagcaggactggcatcaaagaaaagaataacagtactagatgtaggagatgcctacttcagtgtcccactagatccagacttcagacaatatacagcatttactttgccagcagtaaataatgcagaaccaggaaagagatatctttacaaagtcctaccacagggatggaagggatccccagcaattttccagtacaccatggcaaaggtactagaccctttcagaaaagccaacaatgatgtcactataatccagtacatggatgacattctcgtggcaagtgacaggagcgatctggagcatgacagggtagtgtctcaactaaaagagctattaaataacatgggattctctactccagaagaaaagttccaaaaagaccctccattcaaatggatggggtatgagctctggccaaagaaatggaaactgcaaaaaatacagctaccagaaaaagaggtttggacagtaaatgacattcagaagttagtgggagtattaaattgggcagctcaacttttcccggggattaagaccaggcatatatgtaaactaataaggggaaagatgaccctaacagaagaggtacaatggactgaattggcagaggcagaattccaggaaaacaaaatcatcctagaacaagagcaggaaggatcctattacaaagaaggggtacctttagaagcaacagtgcagaaaaatctagcaaatcagtggacatacaagattcatcagggagataaaatcctaaaagtaggaaaatatgcaaaggttaaaaacactcacaccaatggagtaagactattggctcatgtagtccaaaaaataggaaaggaagcattggtcatctggggagagataccaatgttccatctaccagtagaaagagagacatgggatcagtggtggacagattactggcaagtaacctggatcccagaatgggattttgtctcaaccccaccattaataaggttagcctataacctggtcaaagaccccctagaaggagtagaaacttactacacagatggatcctgtaacaaagcctcaaaagaagggaaagcaggatatgtcacagacaggggaaaggataaagttaaaccattagaacaaacaacaaatcagcaagcagagcttgaagcatttgcactagcactacaggactcaggaccacaggtcaatatcatagtagattcacaatatgtcatgggaatagtagctgcacaaccaacagaaacagaatcaccgatagtaagagaaataattgaagaaatgatcaaaaaggaaaaaatatatgtaggatgggtaccagctcacaagggactgggtggtaatcaggaagtagaccacctagtgagccaaggaattagacaaatcctatttctagaaaaaatagaaccagctcaagaagaacatgaaaaatatcataataatgtaaaagaactagtccataaatttgggattccacaattagtggcaagacaaatagtaaattcctgtgataaatgccaacaaaaaggggaagctattcatggacaggtaaattcagaactagggacatggcaaatggactgtacacatttagagggaaaggttataatagtggcagttcatgtagccagtggattcatagaagcagaagtaataccccaagaaacaggaagacagacagctctcttcctgttaaagctggccagcagatggcctatcacacacctgcacacagacaacggtgccaacttcacttcacaagatgtgaaaatggcagcctggtggatagggatagaacaaacattcggagtgccctataatccagaaagtcagggagtagtagaagcaatgaaccatcatctgaaaaatcagatagacagaattagagatcaggcagtatcaatagagacagttgtgttaatggcaactcactgcatgaattttaaaagaaggggaggaataggggatatgacccctgcagaaagaatagtcaacatgataactacagaacaagaaatacaattcctccaaacaaaaaatttaaaattccaaaatttccgggtctattacagagaaggcagagatcaactctggaagggacctggtgatctattgtggaaaggggaaggagcagtcatcataaaggtagggacagaaatcaaagtaatacccagaagaaaagcaaagatcataaggaactatggaggaggaaaagaattggattgcagtgccgacgtggaggataccatgcaggctagagaggtggcacagtctaattaaatacctgaaatataggacaaaagacttgcaacaggtctcttatgttcctcaccataaggtaggatgggcttggtggacttgcagtagagtaatatttcccctgaaagaaggagcacatctagaagtccaaggatactggaacctgaccccagaaaggggattcttgagttcctatgctgtaagactaacatggtatgagaggagcttttatacagatgtaactcctgatgtagcagaccgattactgcatgg');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (20, 0, 3, 'gag', 'group-specific antigen', 'atgggcgcgagaggctccgtcttgtcagggaagaagacagatgaattagaaaaggttaggttacggcccggcggaaagaaaagatacatgctaaaacatatagtatgggcagtgaatgaattagagagatttggattggcagagagccggttgggatcaaaagaaggatgccggaaaattcggaaagtcttaggaccattagtaccaacaggttcagaaaatttaaaaagtctttataataccgtctgcgtcatcttttgcctgcacgcagaagagaaagtgaaagatactgaggaagcaaaaaagatagcacagcgacatctagcagcggacacagaaaaaatgccagctatgagtaaaccaagtaaaccaactagccgcctagcttatccagtgcagcaaatagctggcaattattcccacctgccgctaagcccccgaaccttaaatgcctgggtaaaattagtagaagagaagaagttcggggcagaagtagtaccaggatttcaggcactatcagaagggtgcaccccttatgatattaatcagatgttaaattgtgtaggagaacatcaggcagccatgcaaattattagggagataattaatgaggaagcagcagactgggaccaacagcatccatcgccaggcccaatgccagcagggcaactcagggaaccaagagggtcagacatagcgggaaccaccagcacagtagaagaacagatacagtggatgtacagaccccaaaatcctgtcccagtgggaaacatctatagaaggtggattcagttagggctacagaaatgtgtccggatgtacaatcctactaatatactggacataaagcaagggccaaaagaacccttccaaagctatgtagatagattctacaaaagcttacgggcagagcaaacagacccagcagtaaaaaattggatgacacaaacactgctgattcagaatgctaacccagattgcaaattagtgcttaagggcttgggaatgaaccccacattagaagaaatgctaacagcctgccaggggataggaggcccagggcagaaggcaaggctaatggctgaggctttaaaagaagccttgacaccttccaccaatccgtttgccgccgctcaaccaagagcagggaagaggacagtgacatgctggaactgcggcaaggcgggacatacagccaggcagtgcaaggcccctagaaggcagggatgctggaaatgtggacagcaaggacacatcatgtcaaaatgcccagaaagacaggcgggttttttagggttcggcccctggggaaagaagcctcgcaatttccccgtccaggcaccccaggggatagtgccatctgcgcccccgatgaacccagcattcggcatgacacctcagggtgcgattccatctgcaccccctgcagatccagcagaggagatgctaaagaactacatgcaactagggaagaagcagaaggagaacagagagagaccctacaaggaggtgacagaggatttgctgcacctcaattctctctttggagaagaccagtag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (21, 0, 3, 'rev', 'rev', 'atgaacgctcgagaaagagatcttcaaaaagggctaagactactacatcttctgcaccaaacgaatccctatccgcaaggaccggggacagccagccaacgaagaaacagaagaaggaggtggaaacaacgagggctacagatcttggccctggcagatcgaatacatccacttcccgattcgccaactgagggacctcttgatttggctatacagcggctgcagaaccttattatcaaagaccttccaaaccctccaaccagtactccaaccgctcaggcttcc');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (22, 0, 3, 'tat', 'tat', 'atggaaatacccttgaaggagcaggagagctcattaaactcctccagcgggcactcttcctccacttcagagggggttgccaacactcaaggattggacaaccggggggaggaaatcctctctcagctataccgccctcttaaggcatgcagtaatacatgctactgtaaaaaatgttcctaccattgccagctttgctttcttaaaaagggcctggggatatgttatgaacgctcgagaaagagatcttcaaaaagggctaagactactacatcttctgcaccaaacgaatccctatccgcaaggaccggggacagccagccaacgaagaaacagaagaaggaggtggaaacaacgagggctacagatcttggccctggcagatcg');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (23, 0, 3, 'vpr', 'viral protein R', 'atggcagaagcagtcccagagattcctccagaggataaaaacccacaaagagaaccgtgggaacagtgggtagtggacgtcctggaggaaataaaacaagaagccttaaagcattttgacccccgcttattaactgcacttggcaattttatctacaataggcatggaaatacccttgaaggagcaggagagctcattaaactcctccagcgggcactcttcctccacttcagagggggttgccaacactcaaggattggacaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (24, 0, 3, 'nef', 'nef', 'atgggatcagctggttccaagaagcaatccaagcagcagccagggctgcgggagagactcttgcgagcgcggcgaggacctcgtggggagtcctcaggagagcggcaggagagatcattgcaatacccaggaggatcagacaaggggctgaactcgccctcttgtgatggacaaaagactttgggagcagaagggggaggaaaacaagattcagatgaggatgatgaggacaatgaagtaggggtccgtgtaagacccggggtcccactgaggccaatgacattcaaactagcagtagacatgtctcattttttaaaagaaaagggggaactggaagggattttctatagtgagagaaggcataaaatactagacacatacttagaaaatgaagaaggcattgtgtctggatggcagaactacacacatgggccaggagtaagatatcccaagttctttggctggctatggaagctagtgccaataaatatgatagcagaaccagaggacgaggaaacccattgtctggtgcatccagcacagacctccgcatgggatgacccccacgaagagacccttgtctggcagtttgactccctcctagcatatgactatgtggccttcagcaggttcccagaggagtttgggtatcagtcaggaatgccagagaaagagtggaaggctaaactgagagcaagaggaatacctacagagtagaca');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (25, 0, 3, 'vif', 'viral infectivity factor', 'atggaggaggaaaagaattggattgcagtgccgacgtggaggataccatgcaggctagagaggtggcacagtctaattaaatacctgaaatataggacaaaagacttgcaacaggtctcttatgttcctcaccataaggtaggatgggcttggtggacttgcagtagagtaatatttcccctgaaagaaggagcacatctagaagtccaaggatactggaacctgaccccagaaaggggattcttgagttcctatgctgtaagactaacatggtatgagaggagcttttatacagatgtaactcctgatgtagcagaccgattactgcatgggtcttatttctcttcgtttacagctaatgaagtaaggagagccatcaggggagaaaagatattgtcccactgcaactacccatcagctcatacaggccaggtaccaagtttacagtttctagccctaagagttgtacaagaaggaaaagatggatcccagggagagagtaccaccaggaaacagcggcgaagaaacagtaggagaggcattcgaatggctagagacaacattagaacatctcaacagagtagcagtcaatcacttgcccagggaacttattttccaggtctggcagaagtcttgggcatattggcgtga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (26, 0, 3, 'vpx', 'vpx', 'aagatggatcccagggagagagtaccaccaggaaacagcggcgaagaaacagtaggagaggcattcgaatggctagagacaacattagaacatctcaacagagtagcagtcaatcacttgcccagggaacttattttccaggtctggcagaagtcttgggcatattggcgtgaggaacagggcatgtcaattagttataccaaatataggtatttgtgtctaatgcaaaaagcaatgtttatacactttgcaaagggttgtggatgtctgcgggaaggccatgggccagggggatggagatcaggacctcctcctcctcctcccccaggtctagcctaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (27, 0, 3, 'env', 'envelope', 'atggcacatgttaataattacctacttgttacactcctgcttataagtatctatgggtatatgggcaagaactttgtcactgtcttctatggtatacccgcatggaaaaatgcatcaattcccctcttttgtgctaccagaaacagagatacctggggaactgtacaatgcctcccagataatgatgactataccgaaatccaattaaatataacagaggcttttgatgcatgggataatacagtgacagatcaggcaacaaaggatgtgtggagtctctttgagacctcaataaaaccatgtgttaaattaaccccactgtgtgtgacaatgaagtgtaataagacgtggagctcagctagcaaagagaccactacgtcctccgcgtccctcagatcttctactcagaccctactcaacgaagatagcaaatgtattcaaaatgacagctgtgcagggataggactagaagaaatgatagactgtcaattcaaaatgacaggattaaaaagagatgagtcaaaacaatataaggacacctggtataaacaagatttagtgtgtgaaaaggggacaaggagtaatgaaagcaaatgttatataaaaacctgtaatacatcaattatccaagaatcatgtgacaaacattattgggatagtttaagatttaggtattgtgctcccccaggatttgctttgctaagatgcaatgatactaaatattcaggcttcatgcccaactgtagtaaggtagtagtatctctgtacagaatgatggaaacacagacctctacatggtttggcttcaatggtacaagggcagaaaacaggacatatatctattggcatggtaaagacaataggactatcataagcttaaattcatattataatctgacaatgcactgtaaaaggccaggaaacaaaatggttgtgccaataagaaccgtgtcaggtattctcttccattcacagcctatcaataaaagacctaaacaagcttggtgctggtttaaaggaaactggacagaagccatacaggaggtgaaagagaccattaaaaatcatcccagatattcaggaacaacaaatatctcacagataaggttagcagagcacgcgagaagctcagatccagaagtaagatatatgtggactaactgtaggggagagtttctctactgtaatatgacttttttcttaaactgggtagaaaatagaactgggctcaagagaaattatgcgtcatgccacatcagacagatagtcaacacgtggcacaagattggaagaaatgtgtatttgcctccaagagagggtgaactctcctgtaattccactgttaccagcctcatagccaacattgactggatagataagaaccttactaatattactgtgagtgcagaagtgtcagaactgtataaattggaactgggggactacaaattagtagagataacaccaattggctttgcacctacaagtataaaaagatattcctcagtgacaccgaggaataaaagaggtgtacttgtgctagggtttttgggattccttgcgacggcaggttctgcaatgggcgcggcgtccttgacgttgtcggctcagtcccggactttactggctgggatagtgcagcagcagcaacagctcgtggacgtggtcaaaagacaacaagaactgttgcggctgaccgtctgggggacgaaaaacctccaggcaagagtcactgccatcgagaaatatctcaaagaccaggcacaactaaattcatggggatgtgctttcagacaggtctgtcacacgactgtaccatgggtaaatgaatcccttaagccagactggaataacatgacatggcaacaatgggagaggcaagtccgcttcttggatgcaaatataacaaaattactagaagaggcacagatacaacaagaaaagaacatgtatgagttacagaaattaaatcaatgggatattttcagtaattggtttgacttcacctcctggatggcatacatcaggttaggattatatatagtaataggaatagtagtattaagaatagcaatatacattatacagatgctagcaaggcttaggaagggctataggccagtattctcctcccctccctcttatactcaacagatccctatccgcaaggaccggggacagccagccaacgaagaaacagaagaaggaggtggaaacaacgagggctacagatcttggccctggcagatcgaatacatccacttcccgattcgccaactgagggacctcttgatttggctatacagcggctgcagaaccttattatcaaagaccttccaaaccctccaaccagtactccaaccgctcaggcttccacctgcatacctccgatatgggatcagctggttccaagaagcaatccaagcagcagccagggctgcgggagagactcttgcgagcgcggcgaggacctcgtggggagtcctcaggagagcggcaggagagatcattgcaatacccaggaggatcagacaaggggctgaactcgccctcttgtga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (28, 0, 4, 'HCV orf', 'HCV orf', 'atgagcacgaatcctaaacctcaaagaaaaaccaaacgtaacaccaaccgtcgcccacaggacgtcaagttcccgggtggcggtcagatcgttggtggagtttacttgttgccgcgcaggggccctagattgggtgtgcgcgcgacgaggaagacttccgagcggtcgcaacctcgaggtagacgtcagcctatccccaaggcacgtcggcccgagggcaggacctgggctcagcccgggtacccttggcccctctatggcaatgagggttgcgggtgggcgggatggctcctgtctccccgtggctctcggcctagctggggccccacagacccccggcgtaggtcgcgcaatttgggtaaggtcatcgatacccttacgtgcggcttcgccgacctcatggggtacataccgctcgtcggcgcccctcttggaggcgctgccagggccctggcgcatggcgtccgggttctggaagacggcgtgaactatgcaacagggaaccttcctggttgctctttctctatcttccttctggccctgctctcttgcctgactgtgcccgcttcagcctaccaagtgcgcaattcctcggggctttaccatgtcaccaatgattgccctaactcgagtattgtgtacgaggcggccgatgccatcctgcacactccggggtgtgtcccttgcgttcgcgagggtaacgcctcgaggtgttgggtggcggtgacccccacggtggccaccagggacggcaaactccccacaacgcagcttcgacgtcatatcgatctgcttgtcgggagcgccaccctctgctcggccctctacgtgggggacctgtgcgggtctgtctttcttgttggtcaactgtttaccttctctcccaggcgccactggacgacgcaagactgcaattgttctatctatcccggccatataacgggtcatcgcatggcatgggatatgatgatgaactggtcccctacggcagcgttggtggtagctcagctgctccggatcccacaagccatcatggacatgatcgctggtgctcactggggagtcctggcgggcatagcgtatttctccatggtggggaactgggcgaaggtcctggtagtgctgctgctatttgccggcgtcgacgcggaaacccacgtcaccgggggaagtgccggccgcaccacggctgggcttgttggtctccttacaccaggcgccaagcagaacatccaactgatcaacaccaacggcagttggcacatcaatagcacggccttgaactgcaatgaaagccttaacaccggctggttagcagggctcttctatcagcacaaattcaactcttcaggctgtcctgagaggttggccagctgccgacgccttaccgattttgcccagggctggggtcctatcagttatgccaacggaagcggcctcgacgaacgcccctactgctggcactaccctccaagaccttgtggcattgtgcccgcaaagagcgtgtgtggcccggtatattgcttcactcccagccccgtggtggtgggaacgaccgacaggtcgggcgcgcctacctacagctggggtgcaaatgatacggatgtcttcgtccttaacaacaccaggccaccgctgggcaattggttcggttgtacctggatgaactcaactggattcaccaaagtgtgcggagcgcccccttgtgtcatcggaggggtgggcaacaacaccttgctctgccccactgattgtttccgcaagcatccggaagccacatactctcggtgcggctccggtccctggattacacccaggtgcatggtcgactacccgtataggctttggcactatccttgtaccatcaattacaccatattcaaagtcaggatgtacgtgggaggggtcgagcacaggctggaagcggcctgcaactggacgcggggcgaacgctgtgatctggaagacagggacaggtccgagctcagcccattgctgctgtccaccacacagtggcaggtccttccgtgttctttcacgaccctgccagccttgtccaccggcctcatccacctccaccagaacattgtggacgtgcagtacttgtacggggtagggtcaagcatcgcgtcctgggccattaagtgggagtacgtcgttctcctgttcctcctgcttgcagacgcgcgcgtctgctcctgcttgtggatgatgttactcatatcccaagcggaggcggctttggagaacctcgtaatactcaatgcagcatccctggccgggacgcacggtcttgtgtccttcctcgtgttcttctgctttgcgtggtatctgaagggtaggtgggtgcccggagcggtctacgccttctacgggatgtggcctctcctcctgctcctgctggcgttgcctcagcgggcatacgcactggacacggaggtggccgcgtcgtgtggcggcgttgttcttgtcgggttaatggcgctgactctgtcgccatattacaagcgctacatcagctggtgcatgtggtggcttcagtattttctgaccagagtagaagcgcaactgcacgtgtgggttccccccctcaacgtccggggggggcgcgatgccgtcatcttactcatgtgtgttgtacacccgactctggtatttgacatcaccaaactactcctggccatcttcggacccctttggattcttcaagccagtttgcttaaagtcccctacttcgtgcgcgttcaaggccttctccggatctgcgcgctagcgcggaagatagccggaggtcattacgtgcaaatggccatcatcaagttaggggcgcttactggcacctatgtgtataaccatctcacccctcttcgagactgggcgcacaacggcctgcgagatctggccgtggctgtggaaccagtcgtcttctcccgaatggagaccaagctcatcacgtggggggcagataccgccgcgtgcggtgacatcatcaacggcttgcccgtctctgcccgtaggggccaggagatactgcttgggccagccgacggaatggtctccaaggggtggaggttgctggcgcccatcacggcgtacgcccagcagacgagaggcctcctagggtgtataatcaccagcctgactggccgggacaaaaaccaagtggagggtgaggtccagatcgtgtcaactgctacccaaaccttcctggcaacgtgcatcaatggggtatgctggactgtctaccacggggccggaacgaggaccatcgcatcacccaagggtcctgtcatccagatgtataccaatgtggaccaagaccttgtgggctggcccgctcctcaaggttcccgctcattgacaccctgcacctgcggctcctcggacctttacctggtcacgaggcacgccgatgtcattcccgtgcgccggcgaggtgatagcaggggtagcctgctttcgccccggcccatttcctacttgaaaggctcctcggggggtccgctgttgtgccccgcgggacacgccgtgggcctattcagggccgcggtgtgcacccgtggagtggctaaggcggtggactttatccctgtggagaacctagagacaaccatgagatccccggtgttcacggacaactcctctccaccagcagtgccccagagcttccaggtggcccacctgcatgctcccaccggcagcggtaagagcaccaaggtcccggctgcgtacgcagcccagggctacaaggtgttggtgctcaacccctctgttgctgcaacgctgggctttggtgcttacatgtccaaggcccatggggttgatcctaatatcaggaccggggtgagaacaattaccactggcagccccatcacgtactccacctacggcaagttccttgccgacggcgggtgctcaggaggtgcttatgacataataatttgtgacgagtgccactccacggatgccacatccatcttgggcatcggcactgtccttgaccaagcagagactgcgggggcgagactggttgtgctcgccactgctacccctccgggctccgtcactgtgtcccatcctaacatcgaggaggttgctctgtccaccaccggagagatccctttttacggcaaggctatccccctcgaggtgatcaaggggggaagacatctcatcttctgccactcaaagaagaagtgcgacgagctcgccgcgaagctggtcgcattgggcatcaatgccgtggcctactaccgcggtcttgacgtgtctgtcatcccgaccagcggcgatgttgtcgtcgtgtcgaccgatgctctcatgactggctttaccggcgacttcgactctgtgatagactgcaacacgtgtgtcactcagacagtcgatttcagccttgaccctacctttaccattgagacaaccacgctcccccaggatgctgtctccaggactcaacgccggggcaggactggcagggggaagccaggcatctacagatttgtggcaccgggggagcgcccctccggcatgttcgactcgtccgtcctctgtgagtgctatgacgcgggctgtgcttggtatgagctcacgcccgccgagactacagttaggctacgagcgtacatgaacaccccggggcttcccgtgtgccaggaccatcttgaattttgggagggcgtctttacgggcctcactcatatagatgcccactttctatcccagacaaagcagagtggggagaactttccttacctggtagcgtaccaagccaccgtgtgcgctagggctcaagcccctcccccatcgtgggaccagatgtggaagtgtttgatccgccttaaacccaccctccatgggccaacacccctgctatacagactgggcgctgttcagaatgaagtcaccctgacgcacccaatcaccaaatacatcatgacatgcatgtcggccgacctggaggtcgtcacgagcacctgggtgctcgttggcggcgtcctggctgctctggccgcgtattgcctgtcaacaggctgcgtggtcatagtgggcaggattgtcttgtccgggaagccggcaattatacctgacagggaggttctctaccaggagttcgatgagatggaagagtgctctcagcacttaccgtacatcgagcaagggatgatgctcgctgagcagttcaagcagaaggccctcggcctcctgcagaccgcgtcccgccaagcagaggttatcacccctgctgtccagaccaactggcagaaactcgaggtcttctgggcgaagcacatgtggaatttcatcagtgggatacaatacttggcgggcctgtcaacgctgcctggtaaccccgccattgcttcattgatggcttttacagctgccgtcaccagcccactaaccactggccaaaccctcctcttcaacatattgggggggtgggtggctgcccagctcgccgcccccggtgccgctaccgcctttgtgggcgctggcttagctggcgccgccatcggcagcgttggactggggaaggtcctcgtggacattcttgcagggtatggcgcgggcgtggcgggagctcttgtagcattcaagatcatgagcggtgaggtcccctccacggaggacctggtcaatctgctgcccgccatcctctcgcctggagcccttgtagtcggtgtggtctgcgcagcaatactgcgccggcacgttggcccgggcgagggggcagtgcaatggatgaaccggctaatagccttcgcctcccgggggaaccatgtttcccccacgcactacgtgccggagagcgatgcagccgcccgcgtcactgccatactcagcagcctcactgtaacccagctcctgaggcgactgcatcagtggataagctcggagtgtaccactccatgctccggttcctggctaagggacatctgggactggatatgcgaggtgctgagcgactttaagacctggctgaaagccaagctcatgccacaactgcctgggattccctttgtgtcctgccagcgcgggtataggggggtctggcgaggagacggcattatgcacactcgctgccactgtggagctgagatcactggacatgtcaaaaacgggacgatgaggatcgtcggtcctaggacctgcaggaacatgtggagtgggacgttccccattaacgcctacaccacgggcccctgtactccccttcctgcgccgaactataagttcgcgctgtggagggtgtctgcagaggaatacgtggagataaggcgggtgggggacttccactacgtatcgggtatgactactgacaatcttaaatgcccgtgccagatcccatcgcccgaatttttcacagaattggacggggtgcgcctacataggtttgcgcccccttgcaagcccttgctgcgggaggaggtatcattcagagtaggactccacgagtacccggtggggtcgcaattaccttgcgagcccgaaccggacgtagccgtgttgacgtccatgctcactgatccctcccatataacagcagaggcggccgggagaaggttggcgagagggtcacccccttctatggccagctcctcggccagccagctgtccgctccatctctcaaggcaacttgcaccgccaaccatgactcccctgacgccgagctcatagaggctaacctcctgtggaggcaggagatgggcggcaacatcaccagggttgagtcagagaacaaagtggtgattctggactccttcgatccgcttgtggcagaggaggatgagcgggaggtctccgtacccgcagaaattctgcggaagtctcggagattcgcccgggccctgcccgtttgggcgcggccggactacaaccccccgctagtagagacgtggaaaaagcctgactacgaaccacctgtggtccatggctgcccgctaccacctccacggtcccctcctgtgcctccgcctcggaaaaagcgtacggtggtcctcaccgaatcaaccctatctactgccttggccgagcttgccaccaaaagttttggcagctcctcaacttccggcattacgggcgacaatacgacaacatcctctgagcccgccccttctggctgcccccccgactccgacgttgagtcctattcttccatgccccccctggagggggagcctggggatccggatctcagcgacgggtcatggtcgacggtcagtagtggggccgacacggaagatgtcgtgtgctgctcaatgtcttattcctggacaggcgcactcgtcaccccgtgcgctgcggaagaacaaaaactgcccatcaacgcactgagcaactcgttgctacgccatcacaatctggtgtattccaccacttcacgcagtgcttgccaaaggcagaagaaagtcacatttgacagactgcaagttctggacagccattaccaggacgtgctcaaggaggtcaaagcagcggcgtcaaaagtgaaggctaacttgctatccgtagaggaagcttgcagcctgacgcccccacattcagccaaatccaagtttggctatggggcaaaagacgtccgttgccatgccagaaaggccgtagcccacatcaactccgtgtggaaagaccttctggaagacagtgtaacaccaatagacactaccatcatggccaagaacgaggttttctgcgttcagcctgagaaggggggtcgtaagccagctcgtctcatcgtgttccccgacctgggcgtgcgcgtgtgcgagaagatggccctgtacgacgtggttagcaagctccccctggccgtgatgggaagctcctacggattccaatactcaccaggacagcgggttgaattcctcgtgcaagcgtggaagtccaagaagaccccgatggggttctcgtatgatacccgctgttttgactccacagtcactgagagcgacatccgtacggaggaggcaatttaccaatgttgtgacctggacccccaagcccgcgtggccatcaagtccctcactgagaggctttatgttgggggccctcttaccaattcaaggggggaaaactgcggctaccgcaggtgccgcgcgagcggcgtactgacaactagctgtggtaacaccctcacttgctacatcaaggcccgggcagcctgtcgagccgcagggctccaggactgcaccatgctcgtgtgtggcgacgacttagtcgttatctgtgaaagtgcgggggtccaggaggacgcggcgagcctgagagccttcacggaggctatgaccaggtactccgccccccccggggaccccccacaaccagaatacgacttggagcttataacatcatgctcctccaacgtgtcagtcgcccacgacggcgctggaaagagggtctactaccttacccgtgaccctacaacccccctcgcgagagccgcgtgggagacagcaagacacactccagtcaattcctggctaggcaacataatcatgtttgcccccacactgtgggcgaggatgatactgatgacccatttctttagcgtcctcatagccagggatcagcttgaacaggctcttaactgtgagatctacggagcctgctactccatagaaccactggatctacctccaatcattcaaagactccatggcctcagcgcattttcactccacagttactctccaggtgaaatcaatagggtggccgcatgcctcagaaaacttggggtcccgcccttgcgagcttggagacaccgggcccggagcgtccgcgctaggcttctgtccagaggaggcagggctgccatatgtggcaagtacctcttcaactgggcagtaagaacaaagctcaaactcactccaatagcggccgctggccggctggacttgtccggttggttcacggctggctacagcgggggagacatttatcacagcgtgtctcatgcccggccccgctggttctggttttgcctactcctgctcgctgcaggggtaggcatctacctcctccccaaccgatga');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (29, 0, 5, 'px-I', 'p12', 'atgctgtttcgccttctcagccccttgtctccacttgcgctcacggcgctcctgctcttcctgcttcctcctagcgacgtcagcggccttcttctccgcccgcctcctgcgccgtgccttctcctcttccttccttttcaaatactcagcggtctgcttttcctcctctttctcccgctctttttttcgcttcctcttctcctcagcccgtcgctgccgatcacgatgcgtttccccgcgaggtggcgctttctcccctggagggccccgtcgcagccggccgcggctttcctcttctaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (30, 0, 5, 'pol', 'pol', 'ccagaacgcctccaggccttgcaacacttggtccggaaggccctggaggcaggccatatcgaaccctacaccgggccagggaataacccagtattcccagttaaaaaggccaatggaacctggcgattcatccacgacctgcgggccactaactctctaaccatagatctctcatcatcttcccccgggccccctgacttgtccagcctgccaaccacactagcccacttgcaaactatagaccttagagacgcctttttccaaatccccttacctaaacagttccagccctactttgctttcactgtcccacagcagtgtaactacggccccggcactagatacgcctggaaagtactaccccaagggtttaaaaatagtcccaccctgttcgaaatgcagctggcccatatcctgcagcccattcggcaagctttcccccaatgcactattcttcagtacatggatgacattctcctagcaagcccctcccatgaggacctactactactctcagaggccacaatggcttccctaatctcccatgggttgcctgtgtccgaaaacaaaacccagcaaacccctggaacaattaagttcctagggcagataatttcacccaatcacctcacttatgatgcagtccccacggtacctatacggtcccgctgggcgctacctgaacttcaagccctacttggcgagattcagtgggtctccaaaggaactcctaccttacgccagccccttcacagtctctactgtgccttacaaaggcatactgatccccgagaccaaatatatttaaatccttctcaagttcaatcattagtgcagctgcggcaggccctgtcacagaactgccgcagtagactagtccaaaccctgcccctcctaggggctattatgctgaccctcactggcaccactactgtagtgttccagtccaaggagcagtggccacttgtctggctacatgcccccctaccccacactagccagtgcccctgggggcagctacttgcctcagctgtgttattactcgacaaatacaccttgcaatcctatgggctgctctgccaaaccatacatcataacatctccacccaaaccttcaaccaattcattcaaacatctgaccaccccagtgttcctatcttactccaccacagtcaccgattcaaaaatttaggtgcccaaactggagaactttggaacacttttcttaaaacagctgccccattggctcctgtgaaagccctcatgccagtgtttactctttccccggtgattataaacaccgccccctgcctgttttcagacggatctacctcccgggcagcctatattctctgggacaagcaaatattgtcacaaagatcattcccccttccgccaccgcacaagtcggcccaacgggccgaacttctcggacttttgcatggcctctccagcgcccgttcgtggcgctgtctcaacatatttctagactccaagtatctttatcattaccttcggacccttgccctgggcaccttccaaggcaggtcctctcaggccccctttcaggcccttctgccccgcttactatcgcgtaaggtcgtctatttgcaccacgttcgcagccataccaatctacctgatcccatctccaggctcaacgctctcacagatgccctactaatcacccctgtcctgcagctctctcctgcagaactacacagtttcacccattgcggacagacggccctcacattgcaaggggcaaccacaactgaggcttccaatatcctgcgctcttgccacgcctgccgcggaggcaacccacaacatcagatgcctcggggacacatccgccgtggcctacttcctaaccacatctggcaaggcgacattacccatttcaaatataaaaatacgctgtatcgccttcatgtatgggtagacaccttttcaggagccatctcagctacccaaaagagaaaagaaacaagctcagaagctatttcctctttgcttcaggccattgcccatctaggcaagcctagctacataaacacagacaacggccctgcctatatttcccaagacttcctcaatatgtgtacctcccttgctattcgccataccacccatgtcccctacaatccaaccagctcaggacttgtagaacgctctaatggcattcttaaaaccctattatataagtactttactgacaaacccgacctacccatggataatgctctatccatagccctatggacaatcaaccacctgaatgtgttaaccaactgccacaaaacccgatggcagcttcaccactccccccgactccagccgatcccagagacacgttccctcagcaataaacaaacccattggtattatttcaagcttcctggtcttaatagccgccagtggaaaggaccacaggaggctctccaagaagctgccggcgctgctctcatcccggtaagcgctagttctgcccagtggatcccgtggagactcctcaagcgagctgcatgcccaagacccgtcggaggccccgccgatcccaaagaaaaagacctccaacaccatgggtaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (31, 0, 5, 'env', 'envelope', 'atgggtaagtttctcgccactttgattttattcttccagttctgccccctcatcttcggtgattacagccccagctgctgtactctcacaattggagtctcctcataccactctaaaccctgcaatcctgcccagccagtttgttcgtggaccctcgacctgctggccctttcagcagatcaggccctacagcccccctgccctaacctagtaagttactccagctaccatgccacctattccctatatctattccctcattggactaagaagccaaaccgaaatggcggaggctattattcagcctcttattcagacccttgttccttaaagtgcccatacctggggtgccaatcatggacctgcccctatacaggagccgtctccagcccctactggaagtttcaacacgatgtcaattttactcaagaagtttcacgcctcaatattaatctccatttttcaaaatgcggttttcccttctcccttctagtcgacgctccaggatatgaccccatctggttccttaataccgaacccagccaactgcctcccaccgcccctcctctactcccccactctaacctagaccacatcctcgagccctctataccatggaaatcaaaactcctgacccttgtccagttaaccctacaaagcactaattatacttgcattgtctgtatcgatcgtgccagcctctccacttggcacgtcctatactctcccaacgtctctgttccatcctcttcttctacccccctcctttacccatcgttagcgcttccagccccccacctgacgttaccatttaactggacccactgctttgacccccagattcaagctatagtctcctccccctgtcataactccctcatcctgccccccttttccttgtcacctgttcccaccctaggatcccgctcccgccgagcggtaccggtggcggtctggcttgtctccgccctggccatgggagccggagtggctggcgggattaccggctccatgtccctcgcctcaggaaagagcctcctacatgaggtggacaaagatatttcccagttaactcaagcaatagtcaaaaaccacaaaaatctactcaaaattgcgcagtatgctgcccagaacagacgaggccttgatctcctgttctgggagcaaggaggattatgcaaagcattacaagaacagtgccgttttccgaatattaccaattcccatgtcccaatactacaagaaagacccccccttgagaatcgagtcctgactggctggggccttaactgggaccttggcctctcacagtgggctcgagaggccttacaaactggaatcacccttgttgcgctactccttcttgttatccttgcaggaccatgcatcctccgtcagctacgacacctcccctcgcgcgtcagatacccccattactctcttataaaacctgagtcatccctgtaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (32, 0, 5, 'gag', 'gag', 'atgggccaaatcttttcccgtagcgctagccctattccgcgaccgccccgggggctggccgctcatcactggcttaacttcctccaggcggcatatcgcctagaacccggtccctccagttacgatttccaccagttaaaaaaatttcttaaaatagctttagaaacaccggctcggatctgtcccattaactactccctcctagccagcctactcccaaaaggataccccggccgggtgaatgaaattttacacatactcatccaaacccaagcccagatcccgtcccgtcccgcgccaccgccgccgtcatcccccacccacgaccccccggattctgatccacaaatcccccctccctatgttgagcctacggccccccaagtccttccagtcatgcatccacatggtgctcctcctaaccatcgcccatggcaaatgaaagacctacaggccattaagcaagaagtctcccaagcagcccctgggagcccccagtttatgcagaccatccggcttgcggtgcagcagtttgaccccactgccaaagacctccaagacctcctgcagtacctttgctcctccctcgtggcttccctccatcaccagcagctagatagccttatatcagaggccgaaacccgaggtattacaggttataacccattagccggtcccctccgtgtccaagccaacaatccacaacaacaaggattaaggcgagaataccagcaactctggctcgccgccttcgccgccctgccggggagtgccaaagacccttcctgggcctctatcctccaaggcctggaggagccttaccacgccttcgtagaacgcctcaacatagctcttgacaatgggctgccagaaggcacgcccaaagaccccatcttacgttccttagcctactccaatgcaaacaaagaatgccaaaaattactacaggcccgaggacacactaatagccctctaggagatatgttgcgggcttgtcagacctggacccccaaagacaaaaccaaagtgttagttgtccagcctaaaaaaccccccccaaatcagccgtgcttccggtgcgggaaagcaggccactggagtcgggactgcactcagcctcgtcccccccccgggccatgccccctatgtcaagacccaactcactggaagcgagactgcccccgcctaaagcccactatcccagaaccagagccagaggaagatgccctcctattagacctccccgctgacatcccacacccaaaaaacttcatagggggggaggtttaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (33, 0, 5, 'pro', 'pro', 'cttcatagggggggaggtttaacctccccccccacattacagcaagtccttcctaaccaagacccagcatctattctgccagttataccgttagatcccgcccgtcggcccgtaattaaagcccaggttgacacccagaccagccacccaaagactatcgaagctttactagatacaggagcagacatgacagtccttccgatagccttgttctcaagtaatactcccctcaaaaatacatccgtattaggggcagggggccaaacccaagatcactttaagctcacctcccttcctgtgctaatacgcctccctttccggacaacgcctattgttttaacatcttgcctagttgataccaaaaacaactaggccatcataggtcgtgatgccttacaacaatgccaaggcgtcctgtacctccctgaggcaaaaaggccgcctgtaatcttgccaatacaggcgccagccgtccttgggctagaacacctcccaaggccccccgaaatcagccagttccctttaaaccagaacgcctccaggccttgcaacacttggtccggaaggccctggaggcaggccatatcgaaccctacaccgggccagggaataacccagtattcccagttaaaaaggccaatggaacctggcgattcatccacgacctgcgggccactaactctctaa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (34, 0, 5, 'pxIII', 'pxIII', 'atgcccaagacccgtcggaggccccgccgatcccaaagaaaaagacctccaacaccatgggtaagtttctcgccactttgattttattcttccagttctgccccctcatcttcggtgattacagccccagctgctgtactctcacaattggagtctcctcataccactctaaaccctgcaatcctgcccagccagtttgttcgtggaccctcgacctgctggccctttcagcagatcaggccctacagcccccctgccctaacctagtaagttactccagctaccatgccacctattccctatatctattccctcattggactaagaagccaaaccgaaatggcggaggctattattcagcctcttattcagacccttgttccttaaagtgcccatacctggggtgccaatcatggacctgcccctatacaggagccgtctccagcccctactggaagtttcaacacgatgtcaattttactcaagaagtttcacgcctcaatattaatctccatttttcaaaatgcggttttcccttctcccttctagtcgacgctccaggatatgaccccatctggttccttaataccgaacccagccaactgcctcccaccgcccctcctctactcccccactctaacctagaccacatcctcgagccctctataccatggaaatcaaaactcctgacccttgtccagttaaccctacaaagcactaattatacttgcattgtctgtatcgatcgtgccagcctctccacttggcacgtcctatactctcccaacgtctctgttccatcctcttcttctacccccctcctttacccatcgttagcgcttccagccccccacctgacgttaccatttaactggacccactgctttgacccccagattcaagctatagtctcctccccctgtcataactccctcatcctgccccccttttccttgtcacctgttcccaccctaggatcccgctcccgccgagcggtaccggtggcggtctggcttgtctccgccctggccatgggagccggagtggctggcgggattaccggctccatgtccctcgcctcaggaaagagcctcctacatgaggtggacaaagatatttcccagttaactcaagcaatagtcaaaaaccacaaaaatctactcaaaattgcgcagtatgctgcccagaacagacgaggccttgatctcctgttctgggagcaaggaggattatgcaaagcattacaagaacagtgccgttttccgaatattaccaattcccatgtcccaatactacaagaaagacccccccttgagaatcgagtcctgactggctggggccttaactgggaccttggcctctcacagtgggctcgagaggccttacaaactggaatcacccttgttgcgctactccttcttgttatccttgcaggaccatgcatcctccgtcagctacgacacctcccctcgcgcgtcagatacccccattactctcttataaaacctgagtcatccctgtaaaccaagcacgcaattattgcaaccacatcgcctccagcctcccctgccaataattaacctctcccatcaaatcctccttctcctgcagcaacttcctccgttcagcctccaaggactccacctcgccttccaactgtctagtatagccatcaatccccaactcctgcattttttctttcctagcactatgctgtttcgccttctcagccccttgtctccacttgcgctcacggcgctcctgctcttcctgcttcctcctagcgacgtcagcggccttcttctccgcccgcctcctgcgccgtgccttctcctcttccttccttttcaaatactcagcggtctgcttttcctcctctttctcccgctctttttttcgcttcctcttctcctcagcccgtcgctgccgatcacgatgcgtttccccgcgaggtggcgctttctcccctggagggccccgtcgcagccggccgcggctttcctcttctaaggatagcaaaccgtcaagcacagcttcctcctcctccttgtcctttaactcttcctccaaggataatagcccgtccaccaattcctccaccagcaggtcctccgggcatgacacaggcaagcatcgaaacagccctgcagatacaaagttaaccatgcttattatcagcccacttcccagggtttggacagagtcttcttttcggatacccagtctacgtgtttggagactgtgtacaaggcgactggtgccccatctctgggggactatgttcggcccgcctacatcgtcacgccctactggccacctgtccagagcatcagatcacctgggaccccatcgatggacgcgttatcggctcagctctacagttccttatccctcgactcccctccttccccacccagagaacctctaagaccctcaaggtccttaccccgccaatcactcatacaacccccaacattccaccctccttcctccaggccatgcgcaaatactcccccttccgaaatggatacatggaacccacccttgggcagcacctcccaaccctgtcttttccagaccccggactccggccccaaaacctgtacaccctctggggaggctccgttgtctgcatgtacctctaccagctttccccccccatcacctggcccctcctgccccacgtgattt');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (35, 0, 6, 'gag', 'group-specific antigen', 'atgggtgcgagtgcgtctgtgttgacaggaagcaaattggatgcatgggaacaaattaggttaaagccaggatctaaaaagaaatatagactaaaacacttagtatgggcaagcagagagctggaaagattcgcatgtaatcctgagctactagaaactgcagagggtaatgagaagctgctacagcagttagagccagctctcaagacagggtcagacagcctgcagtcactctggaacgcaatagtagtgctctggtgtgttcacaacagatataaaattggagatacgcagcaggcaatacaaaagttaaaggaagtaatggggagcaggaagtctgcggacgccgctaaggaagacacaagcgcaaggcaggcgggtcaaaattaccctatagtatcaaatgcgcagggacaaatggtacatcaggccatctcccccaggactttaaatgcatgggtaaaggcagtagaagaaaaagcctttaaccctgaaatcattcctatgttcatggcattgtcagagggagcaatttcctatgatattaatactatgctaaatgccataggaggacatcaaggagctttacaagtgctaaaggaagtaatcaatgaggaagcagtagagtgggatagaactcacccaccaccggtagggccgttgccaccagggcagataagggaaccaacaggaagtgacattgctgggacaactagcacccagcaagagcaaattcactggactaccaggcccaaccaacctatcccagtaggagacatctatagaaaatggatagtgttaggactaaacaaaatggtaaaaatgtacagcccagtgagcatcttagatattaagcagggaccaaaggaaccatttagagactatgtagatcggttctacaaaacattaagagctgagcaagctactcaagaagtaaaaaattggatgacagaaactctgcttgttcaaaatgccaatccagattgcaaacagattttgaaatcattagggccaggagctaccttagaagagatgatggtagcctgtcagggagtaggaggaccaactcataaggccagagtgctagcagaagcaatggctacagcccagcaagatttgaaaggaggatacacagcagtattcatgcaaagagggcaaaatccaattaggaaaggaactataaaatgtttcaactgtggaaaagagggacatatagcaagaaattgtcgagcacctaggaaaaagggttgctggaaatgtggacaggaaggtcaccaaatgaaagattgcagaaatggaaaacaggcaaattttttaggcaaatactggcctccggggggcacgaggccaggcaattatgtgcagagaccagcacacccatcagccccaccgatggaggaggaagtgaagggacaggagaatcaggaacagaaagggggcccgaacgagctctatccgtttgcctccctcaaatccctctttgggacagaccaatag');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (36, 0, 6, 'pol', 'polymerase', 'atgtggacaggaaggtcaccaaatgaaagattgcagaaatggaaaacaggcaaattttttaggcaaatactggcctccggggggcacgaggccaggcaattatgtgcagagaccagcacacccatcagccccaccgatggaggaggaagtgaagggacaggagaatcaggaacagaaagggggcccgaacgagctctatccgtttgcctccctcaaatccctctttgggacagaccaatagttacagcaagagttgggggccacctatgtgaagttttgctggatacaggagcagatgacacagtactaaacaacatacaattggaaggaaaatggaaaccaaaaatgatagggggtataggaggttttataaaagtaaaagaatatgataatgtgacagtagaaatagaaggaagggaggtacagggaacagtattggtgggacctactcctgttaatattattggaagaaatatattgacaggattaggttgtacactaaacttccctataagccccatagccccagtgccagtaaaactaaaaccaggaatggatggaccaaaagtaaaacaatggcccctatctaaagaaaaaatagaagccttgacagcaatatgtcaggaaatggaacaagaaggaaaaatttcaagaataggacctgaaaatccttataatacacctatctttgctataaaaaagaaagatggtactaaatggagaaaattggtagattttagggaattaaataagagaacacaagagttctgggaggtacagctaggtatcccacatccggggggtttgaagcaaaagcaatctgttacagtcttagatgtaggagatgcttatttctcatgtcccttagacccagattttagaaaatatactgctttcactattcctagtgtgaataatgagaccccaggaataagataccagtacaatgtcctcccgcaaggatggaaaggttcaccagctatattccaaagttcaatgacaaaaattctagatccattcaggagagacaacccagaattagaaatttgtcagtacatggatgacctatatgtaggatcagatttacccctgacagaacatagaaaaaggattgaattgcttagagaacacctatatcagtggggattcactacccctgacaaaaagcatcaaaaggaacctccctttctatggatggggtatgagctccatccagacaaatggacagtacagtccatccaattgcctaacaaggatgtgtggacagtaaatgatatacaaaaactaataggaaagctaaattgggcaagtcaaatctatcaaggaattagagtgagagaattgtgtaagttaattagaggcaccaagtcattaacagaagtagtacctttaagtagagaggcagagctggaattagaggaaaacagagaaaggttaaaacaaccagtgcatggggtatactatcaacctgataaggatctatgggttaatattcagaagcaaggaggggagcaatggacttaccagatatatcaggaagaacataagaacctcaaaacagggaaatatactaggcaaaaggcctcccacacaaatgatataagacaattagcagaagtaatccagaaggtgtctcaagaatctataattatctggggaaaattgcctaaatttaagctgccagtcactagagaaacttgggaaacatggtgggcggactattggcaagccacctggattccagaatgggaatttgtcagcacacccccattgatcaaattatggtacaggctagaaagtgaacctattatgggggcagaaacctattatgtagatggagcagctaatagagagacaaaactaggaaaggcaggatatgttacagaacaagggaaacagaagataataaaattagatgagaccaccaatcaaaaagctgaattaatggcgatattactagccttacaggattccaaagaaacagtaaatatagtaacagattcacaatatgcattgggcgtcatctcctcccaacctacacagagtgaatcccctatagttcagcaaataatagaggaactaacaaaaaaggaacaggtgtatcttacatgggttcctgcccataaaggcataggaggaaatgaaaaaatagataaattagtaagcaaggatattagaagagtcctgttcctagaaggaatagaccaggcacaagaagatcatgaaaaatatcatagtaattggaaagcactagctagtgaatttggactaccaccagtggtggccaaggaaatcattgctagctgtcctaaatgtcatataaaaggggaagcaattcatggtcaggtagactgcagtccagaagtatggcaaatagattgcacacatatggaaggcaaaatcataatagttgctgtccatgtggcaagtgggttcatagaagcagaagtgataccagcagaaacaggacaagaaactgcctacttcctgttaaaactggctgcaagatggcctgttaaagtaatacatacagacaacgggcctaattttacaagtacaactatgaaggctgcatgttggtgggccaacatacaacatgagtttggaataccatataatccacaaagtcaaggagtagtagaagccatgaataaggaattaaaatcaattatacagcaggtgagggaccaagcagaacacttaagaacagcagtacaaatggcagtatttgttcacaattttaaaagaaaaggggggattggggggtacactgcaggagaaaggataatagacatattagcatcacaaatacaaacaacagaattacaaaaacaaattttaaaanttcacaaatttcgggtctattacagagacagcagagaccctatctggaaaggaccggcacagctcctgtggaaaggtgagggagcagtagtcatacaagataagggagacattaaggtagtaccaagaaggaaggcaaaaataatcagagagtatggaaaacagatggcaggtactgatagtatggcaagtggacagacagaaagtgaaagcgtggaacagcctagtgaaataccataa');
INSERT INTO "regadbschema"."open_reading_frame" VALUES (37, 0, 6, 'env', 'envelope', 'atgatagtgactatgaaagcaatggagaagaggaacaagaagttatggaccttgtacttagccatggctttgataaccccatgtttgagccttagacagctatatgcaacagtctatgctggggtgcctgtatgggaagatgcaacaccagtactattctgtgcttcagatgctaacctaacaagcactgaaaagcataatatttgggcatcacaagcctgtgttcctacagaccccactccatatgaatatccattgcacaatgtgacagatgactttaatatatggaaaaattacatggtagaacaaatgcaggaagacattattagtttatgggaccagagtcttaaaccttgtgttcaaatgactttcctgtgtgtacaaatggagtgtacaaacatagctggaacaacaaatgaaaaccttatgaagaagtgtgagtttaatgtaaccactgttatcaaagacaaaaaggagaaaaaacaggctctattctatgtatcagatttgatggaactgaatgagacaagcagcacaaataagacaaacagcaaaatgtatacattaactaattgtaactccacaaccatcacgcaagcctgtccaaaggtatcttttgaaccaattccaatacactattgtgctccagcaggatatgctatctttaagtgtaacagcacagaatttaatggaacaggcacatgcagaaacataacggtagttacttgtacacatggcattaggccaacagtaagtactcagctaatattaaatgggacactctctaaaggaaaaataagaatgatggcaaaagatattttggaaggtggaaaaaatatcatagtgaccctaaactctaccctaaacatgacctgtgaaagaccacaaatagacatacaagagatgagaataggtccaatggcctggtacagcatgggaatagggggaacagcaggaaacagctcaagggcagcttattgcaagtataatgccactgattggggaaaaatattaaaacaaacagctgaaaggtatttagaactagtaaacaatacaggtagtattaacatgacattcaatcacagcagcggtggagatctagaggtaacccatttacactttaactgtcatggagaattcttttattgtaacacagctaagatgtttaattataccttttcatgtaacggaaccacctgtagtgttagtaatgttagtcaaggtaacaatggcactctaccttgcaaactgagacaggtggtaaggtcatggataaggggacagtcgggactctatgcacctcccatcaaaggtaatctaacatgtatgtcaaacataactggaatgatcctacaaatggataacacatggaacagcagcaacaacaatgtaacatttagaccaatagggggagacatgaaagatatatggagaactgaattgttcaactacaaagtagtaagggtaaaaccttttagtgtggcacccacacgtattgcaaggccagtcataagcactagaactcatagagaaaaaagagcagtaggattgggaatgctattcttgggggttctaagtgcagcaggtagcactatgggcgcagcggcaacaacgctggcggtacagacccacactttgctgaagggtatagtgcaacagcaggacaacctgctaagagcaatacaggcccagcagcaattgctgaggctatctrtatggggtatcagacaactccgagctcgcctgctagccttagaaaccttactacagaatcagcaactcctaagcctatggggctgtaaaggaaagctagtctgctacacatcagtaaaatggaatagaacatggataggaaacgaaagcatttgggacaccttaacatggcaggaatgggatcggcagataagcaacataagctccaccatatatgaggaaatacaaaaggcacaagtacagcaggaacaaaatgagaaaaagttgctggagttagatgaatgggcctctatttggaattggcttgacataactaaatggttgtggtatataaaaatagcaataatcatagtaggagcactagtaggggtgagagttatcatgatagtacttaatatagtgaaaaacattaggcagggatatcaacccctctcgttacagatccccaaccatcaccaagaggaagcaggaacgccaggaagaacaggaggaggaggtggagaagaaggcaggcccaggtggataccctcgccgcaagggttcttgccactgttgtacacggacctcagaacaataatattgtggacttaccacctcttgagcaacttagcatcagggatccagaaggtgatcagctatctgaggcttggactgtggatcctagggcagaagataattaatgtttgcagaatttgtgcagctgtaacacaatactggctacaagaattgcagaatagtgctacaagcttgctagacacacttgcagtggcagtagccaattggactgacggcataatcgcagggatacaaagaataggaacaggaattcgtaacatcccaaggagaattagacagggcttagaaagaagtttattgtaa');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."patient";
CREATE TABLE "regadbschema"."patient" (
  "patient_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".patient_patient_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "patient_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for patient_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."patient_attribute_value";
CREATE TABLE "regadbschema"."patient_attribute_value" (
  "patient_attribute_value_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".patient_attribute_value_patient_attribute_value_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "attribute_ii" int4 NOT NULL,
  "patient_ii" int4 NOT NULL,
  "nominal_value_ii" int4,
  "value" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for patient_dataset
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."patient_dataset";
CREATE TABLE "regadbschema"."patient_dataset" (
  "dataset_ii" int4 NOT NULL,
  "patient_ii" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for patient_event_value
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."patient_event_value";
CREATE TABLE "regadbschema"."patient_event_value" (
  "patient_event_value_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".patient_event_value_patient_event_value_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "patient_ii" int4 NOT NULL,
  "nominal_value_ii" int4,
  "event_ii" int4 NOT NULL,
  "value" text COLLATE "pg_catalog"."default",
  "start_date" date,
  "end_date" date
)
;

-- ----------------------------
-- Table structure for protein
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."protein";
CREATE TABLE "regadbschema"."protein" (
  "protein_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".protein_protein_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "open_reading_frame_ii" int4 NOT NULL,
  "abbreviation" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "full_name" varchar(50) COLLATE "pg_catalog"."default",
  "start_position" int4 NOT NULL,
  "stop_position" int4 NOT NULL
)
;

-- ----------------------------
-- Records of protein
-- ----------------------------
INSERT INTO "regadbschema"."protein" VALUES (1, 0, 1, 'p24', 'capsid', 397, 1090);
INSERT INTO "regadbschema"."protein" VALUES (2, 0, 1, 'p2', 'p2', 1090, 1132);
INSERT INTO "regadbschema"."protein" VALUES (3, 0, 1, 'p7', 'nucleocapsid', 1132, 1297);
INSERT INTO "regadbschema"."protein" VALUES (4, 0, 1, 'p17', 'matrix', 1, 397);
INSERT INTO "regadbschema"."protein" VALUES (5, 0, 1, 'p1', 'p1', 1297, 1345);
INSERT INTO "regadbschema"."protein" VALUES (6, 0, 1, 'p6', 'p6', 1345, 1504);
INSERT INTO "regadbschema"."protein" VALUES (7, 0, 2, 'vpu', 'viral protein U', 1, 250);
INSERT INTO "regadbschema"."protein" VALUES (8, 0, 3, 'nef', 'nef', 1, 622);
INSERT INTO "regadbschema"."protein" VALUES (9, 0, 4, 'gp120', 'surface', 85, 1534);
INSERT INTO "regadbschema"."protein" VALUES (10, 0, 4, 'gp41', 'transmembrane', 1534, 2572);
INSERT INTO "regadbschema"."protein" VALUES (11, 0, 4, 'sig', 'signal peptide', 1, 85);
INSERT INTO "regadbschema"."protein" VALUES (12, 0, 5, 'vif', 'viral infectivity factor', 1, 580);
INSERT INTO "regadbschema"."protein" VALUES (13, 0, 6, 'tat', 'tat', 1, 307);
INSERT INTO "regadbschema"."protein" VALUES (14, 0, 7, 'vpr', 'viral protein R', 1, 292);
INSERT INTO "regadbschema"."protein" VALUES (15, 0, 8, 'rev', 'rev', 1, 352);
INSERT INTO "regadbschema"."protein" VALUES (16, 0, 9, 'p15', 'p15', 1786, 2146);
INSERT INTO "regadbschema"."protein" VALUES (17, 0, 9, 'IN', 'integrase', 2146, 3013);
INSERT INTO "regadbschema"."protein" VALUES (18, 0, 9, 'PR', 'protease', 169, 466);
INSERT INTO "regadbschema"."protein" VALUES (19, 0, 9, 'RT', 'reverse transcriptase', 466, 1786);
INSERT INTO "regadbschema"."protein" VALUES (20, 0, 10, 'p1', 'p1', 1294, 1336);
INSERT INTO "regadbschema"."protein" VALUES (21, 0, 10, 'p6', 'p6', 1336, 1570);
INSERT INTO "regadbschema"."protein" VALUES (22, 0, 10, 'p2', 'p2', 1096, 1147);
INSERT INTO "regadbschema"."protein" VALUES (23, 0, 10, 'p7', 'nucleocapsid', 1147, 1294);
INSERT INTO "regadbschema"."protein" VALUES (24, 0, 10, 'p24', 'capsid', 406, 1096);
INSERT INTO "regadbschema"."protein" VALUES (25, 0, 10, 'p17', 'matrix', 1, 406);
INSERT INTO "regadbschema"."protein" VALUES (26, 0, 11, 'vpr', 'viral protein R', 1, 265);
INSERT INTO "regadbschema"."protein" VALUES (27, 0, 12, 'RT', 'reverse transcriptase', 544, 1861);
INSERT INTO "regadbschema"."protein" VALUES (28, 0, 12, 'IN', 'integrase', 2221, 3364);
INSERT INTO "regadbschema"."protein" VALUES (29, 0, 12, 'PR', 'protease', 247, 544);
INSERT INTO "regadbschema"."protein" VALUES (30, 0, 12, 'p15', 'p15', 1861, 2221);
INSERT INTO "regadbschema"."protein" VALUES (31, 0, 13, 'tat', 'tat', 1, 394);
INSERT INTO "regadbschema"."protein" VALUES (32, 0, 14, 'vpx', 'vpx', 1, 340);
INSERT INTO "regadbschema"."protein" VALUES (33, 0, 15, 'vif', 'viral infectivity factor', 1, 649);
INSERT INTO "regadbschema"."protein" VALUES (34, 0, 16, 'nef', 'nef', 1, 775);
INSERT INTO "regadbschema"."protein" VALUES (35, 0, 17, 'gp41', 'transmembrane', 1528, 2578);
INSERT INTO "regadbschema"."protein" VALUES (36, 0, 17, 'gp120', 'surface', 1, 1528);
INSERT INTO "regadbschema"."protein" VALUES (37, 0, 18, 'rev', 'rev', 1, 304);
INSERT INTO "regadbschema"."protein" VALUES (38, 0, 19, 'p15', 'p15', 1858, 2218);
INSERT INTO "regadbschema"."protein" VALUES (39, 0, 19, 'PR', 'protease', 244, 541);
INSERT INTO "regadbschema"."protein" VALUES (40, 0, 19, 'IN', 'integrase', 2218, 3361);
INSERT INTO "regadbschema"."protein" VALUES (41, 0, 19, 'RT', 'reverse transcriptase', 541, 1858);
INSERT INTO "regadbschema"."protein" VALUES (42, 0, 20, 'p2', 'p2', 1081, 1132);
INSERT INTO "regadbschema"."protein" VALUES (43, 0, 20, 'p7', 'nucleocapsid', 1132, 1288);
INSERT INTO "regadbschema"."protein" VALUES (44, 0, 20, 'p6', 'p6', 1330, 1561);
INSERT INTO "regadbschema"."protein" VALUES (45, 0, 20, 'p17', 'matrix', 1, 391);
INSERT INTO "regadbschema"."protein" VALUES (46, 0, 20, 'p24', 'capsid', 391, 1081);
INSERT INTO "regadbschema"."protein" VALUES (47, 0, 20, 'p1', 'p1', 1288, 1330);
INSERT INTO "regadbschema"."protein" VALUES (48, 0, 21, 'rev', 'rev', 1, 286);
INSERT INTO "regadbschema"."protein" VALUES (49, 0, 22, 'tat', 'tat', 1, 388);
INSERT INTO "regadbschema"."protein" VALUES (50, 0, 23, 'vpr', 'viral protein R', 1, 265);
INSERT INTO "regadbschema"."protein" VALUES (51, 0, 24, 'nef', 'nef', 1, 721);
INSERT INTO "regadbschema"."protein" VALUES (52, 0, 25, 'vif', 'viral infectivity factor', 1, 652);
INSERT INTO "regadbschema"."protein" VALUES (53, 0, 26, 'vpx', 'vpx', 1, 340);
INSERT INTO "regadbschema"."protein" VALUES (54, 0, 27, 'gp41', 'transmembrane', 1522, 2560);
INSERT INTO "regadbschema"."protein" VALUES (55, 0, 27, 'gp120', 'surface', 1, 1522);
INSERT INTO "regadbschema"."protein" VALUES (56, 0, 28, 'NS4B', 'NS4B protein', 5134, 5917);
INSERT INTO "regadbschema"."protein" VALUES (57, 0, 28, 'NS5A', 'NS5A phosphoprotein', 5917, 7261);
INSERT INTO "regadbschema"."protein" VALUES (58, 0, 28, 'NS2', 'Autoprotease', 2428, 3079);
INSERT INTO "regadbschema"."protein" VALUES (59, 0, 28, 'p7', 'Putative ion channel', 2239, 2428);
INSERT INTO "regadbschema"."protein" VALUES (60, 0, 28, 'NS4A', 'NS3 co-factor', 4972, 5134);
INSERT INTO "regadbschema"."protein" VALUES (61, 0, 28, 'E1', 'Envelope glycoprotein 1', 574, 1150);
INSERT INTO "regadbschema"."protein" VALUES (62, 0, 28, 'Core', 'Core protein', 1, 574);
INSERT INTO "regadbschema"."protein" VALUES (63, 0, 28, 'NS5B', 'RNA-dependent RNA polymerase', 7261, 9034);
INSERT INTO "regadbschema"."protein" VALUES (64, 0, 28, 'E2', 'Envelope glycoprotein 2', 1150, 2239);
INSERT INTO "regadbschema"."protein" VALUES (65, 0, 28, 'NS3', 'Serine protease and RNA dependent RNA helicase', 3079, 4972);
INSERT INTO "regadbschema"."protein" VALUES (66, 0, 29, 'p12', 'p12 protein', 1, 301);
INSERT INTO "regadbschema"."protein" VALUES (67, 0, 30, 'polymerase', 'pol', 1, 2593);
INSERT INTO "regadbschema"."protein" VALUES (68, 0, 30, 'reverse transcriptase/integrase', 'p95RT/IN', 1, 2590);
INSERT INTO "regadbschema"."protein" VALUES (69, 0, 31, 'gp21', 'transmembrane', 937, 1468);
INSERT INTO "regadbschema"."protein" VALUES (70, 0, 31, 'gp46', 'surface', 1, 1465);
INSERT INTO "regadbschema"."protein" VALUES (71, 0, 32, 'p15', 'nucleocapsid', 1563, 1797);
INSERT INTO "regadbschema"."protein" VALUES (72, 0, 32, 'pr55', 'pr55', 1, 292);
INSERT INTO "regadbschema"."protein" VALUES (73, 0, 32, 'p19', 'matrix', 4, 394);
INSERT INTO "regadbschema"."protein" VALUES (74, 0, 32, 'p24', 'capsid', 391, 1036);
INSERT INTO "regadbschema"."protein" VALUES (75, 0, 33, 'pro', 'protease', 1, 688);
INSERT INTO "regadbschema"."protein" VALUES (76, 0, 34, 'p27', 'rex', 1, 571);
INSERT INTO "regadbschema"."protein" VALUES (77, 0, 35, 'p7', 'nucleocapsid', 1144, 1312);
INSERT INTO "regadbschema"."protein" VALUES (78, 0, 35, 'p2', 'p2', 1087, 1144);
INSERT INTO "regadbschema"."protein" VALUES (79, 0, 35, 'p17', 'matrix', 1, 391);
INSERT INTO "regadbschema"."protein" VALUES (80, 0, 35, 'p24', 'capsid', 391, 1087);
INSERT INTO "regadbschema"."protein" VALUES (81, 0, 35, 'p6', 'p6', 1360, 1495);
INSERT INTO "regadbschema"."protein" VALUES (82, 0, 35, 'p1', 'p1', 1312, 1360);
INSERT INTO "regadbschema"."protein" VALUES (83, 0, 36, 'IN', 'integrase', 2188, 3055);
INSERT INTO "regadbschema"."protein" VALUES (84, 0, 36, 'PR', 'protease', 211, 508);
INSERT INTO "regadbschema"."protein" VALUES (85, 0, 36, 'p15', 'Rnase H', 1828, 2188);
INSERT INTO "regadbschema"."protein" VALUES (86, 0, 36, 'RT', 'reverse transcriptase', 508, 1828);
INSERT INTO "regadbschema"."protein" VALUES (87, 0, 37, 'gp120', 'surface', 1, 1540);
INSERT INTO "regadbschema"."protein" VALUES (88, 0, 37, 'gp41', 'transmembrane', 1540, 2590);

-- ----------------------------
-- Table structure for query_definition
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."query_definition";
CREATE TABLE "regadbschema"."query_definition" (
  "query_definition_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".query_definition_query_definition_ii_seq'::regclass),
  "uid" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "query" text COLLATE "pg_catalog"."default",
  "query_type_ii" int4 NOT NULL,
  "post_processing_script" bytea
)
;

-- ----------------------------
-- Table structure for query_definition_parameter
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."query_definition_parameter";
CREATE TABLE "regadbschema"."query_definition_parameter" (
  "query_definition_parameter_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".query_definition_parameter_query_definition_parameter_ii_seq'::regclass),
  "query_definition_parameter_type_ii" int4,
  "query_definition_ii" int4,
  "name" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for query_definition_parameter_type
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."query_definition_parameter_type";
CREATE TABLE "regadbschema"."query_definition_parameter_type" (
  "query_definition_parameter_type_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".query_definition_parameter_type_query_definition_parameter_type'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of query_definition_parameter_type
-- ----------------------------
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (1, 'String', 0);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (2, 'Integer', 1);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (3, 'Double', 2);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (4, 'Date', 3);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (5, 'GenericDrug', 4);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (6, 'CommercialDrug', 5);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (7, 'Test', 6);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (8, 'TestType', 7);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (9, 'Protein', 8);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (10, 'Attribute', 9);
INSERT INTO "regadbschema"."query_definition_parameter_type" VALUES (11, 'Attribute Group', 10);

-- ----------------------------
-- Table structure for query_definition_run
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."query_definition_run";
CREATE TABLE "regadbschema"."query_definition_run" (
  "query_definition_run_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".query_definition_run_query_definition_run_ii_seq'::regclass),
  "query_definition_ii" int4,
  "uid" varchar(50) COLLATE "pg_catalog"."default",
  "startdate" date,
  "enddate" date,
  "status" int4,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "result" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for query_definition_run_parameter
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."query_definition_run_parameter";
CREATE TABLE "regadbschema"."query_definition_run_parameter" (
  "query_definition_run_parameter_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".query_definition_run_parameter_query_definition_run_parameter_i'::regclass),
  "query_definition_parameter_ii" int4,
  "query_definition_run_ii" int4,
  "value" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for resistance_interpretation_template
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."resistance_interpretation_template";
CREATE TABLE "regadbschema"."resistance_interpretation_template" (
  "template_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".resistance_interpretation_template_resistance_interpretation_te'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "document" bytea,
  "filename" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for settings_user
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."settings_user";
CREATE TABLE "regadbschema"."settings_user" (
  "uid" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "version" int4 NOT NULL,
  "test_ii" int4,
  "dataset_ii" int4,
  "chart_width" int4 NOT NULL,
  "chart_height" int4 NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "first_name" varchar(50) COLLATE "pg_catalog"."default",
  "last_name" varchar(50) COLLATE "pg_catalog"."default",
  "role" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of settings_user
-- ----------------------------
INSERT INTO "regadbschema"."settings_user" VALUES ('admin', 6, NULL, NULL, 0, 0, 'w85j87mQSeDhimDpqJoYcw==', 'regadb-admin@uz.kuleuven.ac.be', 'install-admin', 'install-admin', 'administrador');
INSERT INTO "regadbschema"."settings_user" VALUES ('fgtorres', 1, NULL, 1, 0, 0, 'XDMK855wwXmg3iyi5tybZg==', 'fgtorres18@gmail.com', 'Felipe', 'Torres', 'admin');
INSERT INTO "regadbschema"."settings_user" VALUES ('ricardo.khouri', 2, NULL, 1, 0, 0, 'x1r8kB5cyriwCHZTyAPi7Q==', 'ricardo_khouri@hotmail.com', 'Ricardo', 'Khori', 'admin');
INSERT INTO "regadbschema"."settings_user" VALUES ('laisemoraes102@sou.bahiana.br', 0, NULL, NULL, 0, 0, 'qrBdHhMfWBPsCyF32lo4gw==', 'laisemoraes102@sou.bahiana.br', 'Laise ', 'de Moraes', NULL);
INSERT INTO "regadbschema"."settings_user" VALUES ('juqueline.cristal', 0, NULL, 1, 0, 0, 'Rd8diqsAMN3SRME+mep22g==', 'kellcristal@gmail.com', 'Juqueline', 'Cristal', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('laise.paixao', 1, NULL, 1, 0, 0, 'JfnnlDI7RTiF9RgfG2JNCw==', 'laisepaixao@gmail.com', 'Laise', 'de Moraes', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('tommiles', 0, NULL, 1, 0, 0, 'BR+eZkVawt5Fg5+S4/irGw==', 'tommilesamaral@gmail.com', 'Tommiles', 'Amaral', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('jose.andrade', 3, NULL, 1, 0, 0, 'Robq4SMCqF6PHCncm/MNsw==', 'jvbandrade@hotmail.com', 'José', 'Andrade', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('amanda.canario', 1, NULL, 1, 0, 0, 'D9/v8JKU6QylgQ0RYIgEmA==', 'amandacanario@gmail.com', 'Amanda', 'Canário', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('thaizza', 1, NULL, 1, 0, 0, 'Robq4SMCqF6PHCncm/MNsw==', 'thaizza.correia@gmail.com', 'thaizza', 'correia', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('ligia.lima', 0, NULL, 1, 0, 0, 'UjkPo+8VingMM2cyANzTHQ==', 'ligiacorreialima@gmail.com', 'Ligia ', 'Correia Lima de Souza', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('luisa.pedrosa', 5, NULL, 2, 0, 0, 'vZBBxI+Ip8AfHs1O/Yb8DQ==', 'luisapedrosa81@gmail.com', 'Luisa', 'Pedrosa', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('voliver', 8, NULL, 1, 0, 0, 'Robq4SMCqF6PHCncm/MNsw==', 'vsboaventura@gmail.com', 'Viviane', 'Boaventura', 'usuario');
INSERT INTO "regadbschema"."settings_user" VALUES ('victoriaribeiro16.1@bahiana.edu.br', 0, NULL, NULL, 0, 0, '08Jsr7xLAMZMHwE7xqfS6A==', 'victoriaribeiro16.1@bahiana.edu.br', 'Victoria', 'Ribeiro', NULL);

-- ----------------------------
-- Table structure for splicing_position
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."splicing_position";
CREATE TABLE "regadbschema"."splicing_position" (
  "splicing_position_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".splicing_position_splicing_position_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "protein_ii" int4 NOT NULL,
  "nt_position" int4 NOT NULL
)
;

-- ----------------------------
-- Records of splicing_position
-- ----------------------------
INSERT INTO "regadbschema"."splicing_position" VALUES (1, 0, 13, 216);
INSERT INTO "regadbschema"."splicing_position" VALUES (2, 0, 15, 77);
INSERT INTO "regadbschema"."splicing_position" VALUES (3, 0, 31, 297);
INSERT INTO "regadbschema"."splicing_position" VALUES (4, 0, 37, 71);
INSERT INTO "regadbschema"."splicing_position" VALUES (5, 0, 48, 65);
INSERT INTO "regadbschema"."splicing_position" VALUES (6, 0, 49, 291);
INSERT INTO "regadbschema"."splicing_position" VALUES (7, 0, 76, 61);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."test";
CREATE TABLE "regadbschema"."test" (
  "test_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".test_test_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "analysis_ii" int4,
  "test_type_ii" int4 NOT NULL,
  "description" varchar(200) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO "regadbschema"."test" VALUES (56, 0, NULL, 48, 'Residência Atual');
INSERT INTO "regadbschema"."test" VALUES (57, 0, NULL, 49, 'Tempo de Moradia (meses)');
INSERT INTO "regadbschema"."test" VALUES (58, 1, NULL, 50, 'Tipo de Moradia');
INSERT INTO "regadbschema"."test" VALUES (59, 0, NULL, 53, 'Caso residência atual há menos de um ano, registrar endereço da moradia anterior e há quanto tempo (meses)');
INSERT INTO "regadbschema"."test" VALUES (61, 0, NULL, 55, 'Número de familiares em casa (Excluir paciente)');
INSERT INTO "regadbschema"."test" VALUES (62, 0, NULL, 56, ' Número de familiares que tiveram LTA');
INSERT INTO "regadbschema"."test" VALUES (63, 0, NULL, 57, 'Está em uso de medicação?');
INSERT INTO "regadbschema"."test" VALUES (64, 0, NULL, 58, 'Qual medicaçao estã usando?');
INSERT INTO "regadbschema"."test" VALUES (65, 0, NULL, 59, 'Hipertensão arterial');
INSERT INTO "regadbschema"."test" VALUES (66, 0, NULL, 60, 'Diabetes mellitus');
INSERT INTO "regadbschema"."test" VALUES (67, 0, NULL, 61, 'Doença coronariana');
INSERT INTO "regadbschema"."test" VALUES (68, 0, NULL, 62, 'Chagas');
INSERT INTO "regadbschema"."test" VALUES (71, 0, NULL, 65, 'Parasitose intestinal');
INSERT INTO "regadbschema"."test" VALUES (72, 0, NULL, 66, 'Qual parasitose intestinal');
INSERT INTO "regadbschema"."test" VALUES (73, 0, NULL, 67, ' Rinite ou sinusite crônica');
INSERT INTO "regadbschema"."test" VALUES (74, 0, NULL, 68, 'Já teve LTA');
INSERT INTO "regadbschema"."test" VALUES (75, 0, NULL, 69, 'Foi tratado (LTA positivo)');
INSERT INTO "regadbschema"."test" VALUES (76, 0, NULL, 70, 'Natureza do tratamento (LTA positivo)');
INSERT INTO "regadbschema"."test" VALUES (78, 0, NULL, 72, 'Dose(LTA positvo)');
INSERT INTO "regadbschema"."test" VALUES (79, 0, NULL, 73, 'Ano de tratamento (LTA positivo)');
INSERT INTO "regadbschema"."test" VALUES (80, 0, NULL, 74, 'Onde foi tratado (LTA positivo)');
INSERT INTO "regadbschema"."test" VALUES (82, 0, NULL, 77, 'Galinhas');
INSERT INTO "regadbschema"."test" VALUES (83, 0, NULL, 78, 'Cães');
INSERT INTO "regadbschema"."test" VALUES (84, 0, NULL, 79, 'Outros (animais)');
INSERT INTO "regadbschema"."test" VALUES (85, 0, NULL, 80, 'Qual animal (outro)');
INSERT INTO "regadbschema"."test" VALUES (86, 0, NULL, 81, 'Renda familiar mensal (sal. Mínimos) ');
INSERT INTO "regadbschema"."test" VALUES (87, 0, NULL, 82, 'Bolsa-família');
INSERT INTO "regadbschema"."test" VALUES (89, 0, NULL, 84, 'Número Total de Lesão(ões)');
INSERT INTO "regadbschema"."test" VALUES (90, 0, NULL, 85, 'Lesão maior (cm)');
INSERT INTO "regadbschema"."test" VALUES (91, 0, NULL, 86, 'Lesão maior (área)');
INSERT INTO "regadbschema"."test" VALUES (92, 0, NULL, 87, 'Duração (meses)');
INSERT INTO "regadbschema"."test" VALUES (93, 0, NULL, 88, 'Localização(ões)');
INSERT INTO "regadbschema"."test" VALUES (94, 0, NULL, 89, 'Tamanho(s) em cm');
INSERT INTO "regadbschema"."test" VALUES (95, 0, NULL, 90, 'Característica(s) da ferida(s)');
INSERT INTO "regadbschema"."test" VALUES (96, 0, NULL, 91, 'Se lesão ulcerada');
INSERT INTO "regadbschema"."test" VALUES (97, 0, NULL, 92, 'Lesão Mucosa ativa ');
INSERT INTO "regadbschema"."test" VALUES (98, 0, NULL, 93, 'Formas(Lesão Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (101, 0, NULL, 91, 'Se nasal(Lesão Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (102, 0, NULL, 96, 'Exame Físico: Mucosa Nasal');
INSERT INTO "regadbschema"."test" VALUES (107, 0, NULL, 101, 'Outras mucosas (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test" VALUES (109, 0, NULL, 103, 'Presença de Linfonodos');
INSERT INTO "regadbschema"."test" VALUES (111, 0, NULL, 105, 'Tamanho do gânglio (cm)');
INSERT INTO "regadbschema"."test" VALUES (112, 0, NULL, 106, 'Biópsia');
INSERT INTO "regadbschema"."test" VALUES (113, 0, NULL, 107, 'Se sim (Biópsia)');
INSERT INTO "regadbschema"."test" VALUES (114, 0, NULL, 108, 'Foto');
INSERT INTO "regadbschema"."test" VALUES (115, 0, NULL, 109, 'Sangue');
INSERT INTO "regadbschema"."test" VALUES (116, 0, NULL, 110, 'Se sim (Sangue)');
INSERT INTO "regadbschema"."test" VALUES (117, 0, NULL, 111, 'Aspirado de linfonodo');
INSERT INTO "regadbschema"."test" VALUES (118, 0, NULL, 112, 'Swab da lesão');
INSERT INTO "regadbschema"."test" VALUES (119, 0, NULL, 113, 'Exames Imunologicos');
INSERT INTO "regadbschema"."test" VALUES (121, 0, NULL, 115, 'ANATOMIA PATOLOGICA');
INSERT INTO "regadbschema"."test" VALUES (69, 1, NULL, 63, 'Outras doenças');
INSERT INTO "regadbschema"."test" VALUES (70, 1, NULL, 64, 'Qual doença?');
INSERT INTO "regadbschema"."test" VALUES (77, 1, NULL, 71, 'Droga usada e dose (LTA positivo)');
INSERT INTO "regadbschema"."test" VALUES (81, 1, NULL, 75, 'Existem animais no quintal');
INSERT INTO "regadbschema"."test" VALUES (108, 2, NULL, 102, 'Qual(ais) (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test" VALUES (104, 1, NULL, 98, ' Mucosa oral, faringe e laringe');
INSERT INTO "regadbschema"."test" VALUES (105, 2, NULL, 99, 'Queixas associadas (Mucosa oral e  faringe)');
INSERT INTO "regadbschema"."test" VALUES (100, 1, NULL, 94, 'Localização 1 (Lesão Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (106, 1, NULL, 100, 'Localização 1 (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test" VALUES (103, 1, NULL, 97, 'Localização 1 (Mucosa nasal)');
INSERT INTO "regadbschema"."test" VALUES (88, 2, NULL, 83, 'Suspeita Diagnóstica (SD)');
INSERT INTO "regadbschema"."test" VALUES (133, 0, NULL, 127, 'Tgo/Tgp');
INSERT INTO "regadbschema"."test" VALUES (134, 0, NULL, 128, 'Ureia');
INSERT INTO "regadbschema"."test" VALUES (135, 0, NULL, 129, 'Creatinina');
INSERT INTO "regadbschema"."test" VALUES (136, 0, NULL, 130, 'Glicemia /Jejum');
INSERT INTO "regadbschema"."test" VALUES (122, 3, NULL, 116, 'Hemácias(milhões/mm3)');
INSERT INTO "regadbschema"."test" VALUES (137, 0, NULL, 131, 'Ecg');
INSERT INTO "regadbschema"."test" VALUES (138, 0, NULL, 132, 'Vel. Hemossed. ');
INSERT INTO "regadbschema"."test" VALUES (139, 0, NULL, 133, 'E. Paras. Fezes');
INSERT INTO "regadbschema"."test" VALUES (146, 0, NULL, 92, 'Lesão Mucosa cicatricial');
INSERT INTO "regadbschema"."test" VALUES (147, 0, NULL, 141, 'Lesão Mucosa cicatricial(Tipo)');
INSERT INTO "regadbschema"."test" VALUES (148, 0, NULL, 142, 'Lesão Mucosa cicatricial (Localização)');
INSERT INTO "regadbschema"."test" VALUES (149, 0, NULL, 143, 'OBSERVAÇÕES');
INSERT INTO "regadbschema"."test" VALUES (99, 1, NULL, 92, 'Lesão Mucose ativa (Lesão Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (150, 0, NULL, 156, 'Foto Cutânea');
INSERT INTO "regadbschema"."test" VALUES (151, 1, NULL, 157, 'Presença de Linfonodos (Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (152, 0, NULL, 158, 'Caso sim localização (presença de linfonodos) (Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (153, 0, NULL, 159, 'Tamanho do gânglio (cm) (Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (154, 0, NULL, 162, 'Tamanho do gânglio (cm) (Cutânea)');
INSERT INTO "regadbschema"."test" VALUES (158, 0, NULL, 165, 'Status da Lesão');
INSERT INTO "regadbschema"."test" VALUES (159, 0, NULL, 166, 'Status do tratamento');
INSERT INTO "regadbschema"."test" VALUES (161, 0, NULL, 167, 'Frequência do tratamento');
INSERT INTO "regadbschema"."test" VALUES (162, 0, NULL, 168, 'Tempo de acompanhamento');
INSERT INTO "regadbschema"."test" VALUES (163, 0, NULL, 169, 'Nível Quantitativo das Lesões');
INSERT INTO "regadbschema"."test" VALUES (164, 0, NULL, 143, 'Observações');
INSERT INTO "regadbschema"."test" VALUES (165, 0, NULL, 171, 'Observações (Cutânea)');
INSERT INTO "regadbschema"."test" VALUES (166, 0, NULL, 172, 'Observações (Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (167, 0, NULL, 173, 'IDRM (mm)');
INSERT INTO "regadbschema"."test" VALUES (168, 0, NULL, 174, 'ELISA (Anti Leishmania)');
INSERT INTO "regadbschema"."test" VALUES (169, 0, NULL, 175, 'PCR (Qualitativo)');
INSERT INTO "regadbschema"."test" VALUES (171, 0, NULL, 177, 'Amilase');
INSERT INTO "regadbschema"."test" VALUES (172, 0, NULL, 178, 'Lipase');
INSERT INTO "regadbschema"."test" VALUES (60, 3, NULL, 54, 'Existe alguém que já teve LTA na mesma casa ou região que você mora?');
INSERT INTO "regadbschema"."test" VALUES (156, 1, NULL, 164, 'Caso sim, descreva onde (presença de linfonodos)');
INSERT INTO "regadbschema"."test" VALUES (176, 0, NULL, 182, 'Se sim, descreva (Sangue e biópsia)');
INSERT INTO "regadbschema"."test" VALUES (178, 0, NULL, 185, 'HIV');
INSERT INTO "regadbschema"."test" VALUES (179, 0, NULL, 183, 'HBV');
INSERT INTO "regadbschema"."test" VALUES (180, 0, NULL, 184, 'HTLV');
INSERT INTO "regadbschema"."test" VALUES (181, 0, NULL, 186, 'HCV');
INSERT INTO "regadbschema"."test" VALUES (175, 1, NULL, 181, 'Presença de parasito no Linfonodo');
INSERT INTO "regadbschema"."test" VALUES (170, 3, NULL, 176, 'Presença de parasito na Biópsia');
INSERT INTO "regadbschema"."test" VALUES (155, 1, NULL, 163, 'Caso sim, descreva onde (presença de linfonodos)(Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (182, 0, NULL, 187, 'Se sim, descreva (Swab da lesão)');
INSERT INTO "regadbschema"."test" VALUES (183, 0, NULL, 188, 'Se sim, descreva (Aspirado de linfonodo)');
INSERT INTO "regadbschema"."test" VALUES (185, 0, NULL, 190, 'Se sim, descreva (Biópsia)');
INSERT INTO "regadbschema"."test" VALUES (186, 0, NULL, 191, 'Localização 2 (Lesão Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (187, 0, NULL, 192, 'Localização 3 (Lesão Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (188, 0, NULL, 195, 'Localização 2 (Mucosa nasal)');
INSERT INTO "regadbschema"."test" VALUES (189, 0, NULL, 196, 'Localização 3 (Mucosa nasal)');
INSERT INTO "regadbschema"."test" VALUES (190, 0, NULL, 193, 'Localização 2 (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test" VALUES (191, 0, NULL, 194, 'Localização 3 (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test" VALUES (192, 0, NULL, 197, 'Exame Físico: Mucosa oral e faringe');
INSERT INTO "regadbschema"."test" VALUES (193, 0, NULL, 198, 'Presença de parasita no Linfonodo');
INSERT INTO "regadbschema"."test" VALUES (194, 0, NULL, 199, 'Presença de parasita na Biópsia');
INSERT INTO "regadbschema"."test" VALUES (184, 1, NULL, 189, 'Se sim, descreva (Sangue)');
INSERT INTO "regadbschema"."test" VALUES (124, 1, NULL, 118, 'Hematócrito(%)');
INSERT INTO "regadbschema"."test" VALUES (125, 1, NULL, 119, 'Leucocitos(%)');
INSERT INTO "regadbschema"."test" VALUES (126, 1, NULL, 120, 'Meta(%)');
INSERT INTO "regadbschema"."test" VALUES (127, 1, NULL, 121, 'Bastões(%)');
INSERT INTO "regadbschema"."test" VALUES (128, 1, NULL, 122, 'Segmentados(%)');
INSERT INTO "regadbschema"."test" VALUES (129, 1, NULL, 123, 'Eosinófilos(%)');
INSERT INTO "regadbschema"."test" VALUES (130, 1, NULL, 124, 'Linfócitos(%)');
INSERT INTO "regadbschema"."test" VALUES (131, 1, NULL, 125, 'Monócitos(%)');
INSERT INTO "regadbschema"."test" VALUES (132, 1, NULL, 126, 'Plaquetas(/mm3)');
INSERT INTO "regadbschema"."test" VALUES (173, 1, NULL, 179, 'Tgo(U/L)');
INSERT INTO "regadbschema"."test" VALUES (174, 1, NULL, 180, 'Tgp(U/L)');
INSERT INTO "regadbschema"."test" VALUES (195, 0, NULL, 200, 'Município que reside');
INSERT INTO "regadbschema"."test" VALUES (196, 0, NULL, 202, 'Swab nasal');
INSERT INTO "regadbschema"."test" VALUES (197, 0, NULL, 201, 'Se sim, descreva (Swab nasal)');
INSERT INTO "regadbschema"."test" VALUES (198, 0, NULL, 203, 'Suspeita Diagnostica (SD) (Mucosa)');
INSERT INTO "regadbschema"."test" VALUES (123, 2, NULL, 117, 'Hemoglobina(g/dL)');

-- ----------------------------
-- Table structure for test_nominal_value
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."test_nominal_value";
CREATE TABLE "regadbschema"."test_nominal_value" (
  "nominal_value_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".test_nominal_value_test_nominal_value_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "test_type_ii" int4 NOT NULL,
  "value" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of test_nominal_value
-- ----------------------------
INSERT INTO "regadbschema"."test_nominal_value" VALUES (23, 0, 50, 'urbana');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (24, 0, 50, 'rural');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (25, 0, 50, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (26, 0, 54, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (27, 0, 54, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (28, 0, 54, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (29, 0, 57, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (30, 0, 57, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (31, 0, 59, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (32, 0, 59, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (33, 0, 59, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (34, 0, 60, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (35, 0, 60, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (36, 0, 60, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (37, 0, 61, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (38, 0, 61, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (39, 0, 61, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (40, 0, 62, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (41, 0, 62, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (42, 0, 62, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (43, 0, 63, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (44, 0, 63, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (45, 0, 63, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (46, 0, 65, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (47, 0, 65, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (48, 0, 65, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (49, 0, 67, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (50, 0, 67, 'SIm');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (51, 0, 67, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (52, 0, 68, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (53, 0, 68, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (54, 0, 68, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (55, 0, 69, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (56, 0, 69, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (57, 0, 69, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (58, 0, 70, 'Sistêmico');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (59, 0, 70, 'Tópico');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (60, 0, 70, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (61, 0, 75, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (62, 0, 75, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (63, 0, 75, 'SIm');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (67, 0, 77, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (68, 0, 77, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (69, 0, 77, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (70, 0, 78, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (71, 0, 78, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (72, 0, 78, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (73, 0, 79, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (74, 0, 79, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (75, 0, 79, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (76, 0, 81, '1 a 2');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (77, 0, 81, '<1');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (78, 0, 81, '>4');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (79, 0, 81, '3 a 4');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (80, 0, 82, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (81, 0, 82, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (82, 0, 82, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (83, 0, 83, 'LDisseminada');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (84, 0, 83, 'LC Difusa');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (85, 0, 83, 'Leishmaniose Recidiva cútis');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (86, 0, 83, 'LC localizada');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (87, 0, 90, 'Pápula na  borda da lesão');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (88, 0, 90, 'nodular');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (89, 0, 90, 'ulcerada');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (90, 0, 90, 'Verrucóide (seca)');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (91, 0, 90, 'vegetante (úmida)');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (92, 0, 88, 'tronco');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (93, 0, 88, 'ante-braço ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (94, 0, 88, 'braço');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (95, 0, 88, 'pé');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (96, 0, 88, 'pescoço');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (98, 0, 88, 'mão');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (99, 0, 88, 'canela');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (100, 0, 88, 'cabeça');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (101, 0, 91, 'úmida');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (102, 0, 91, 'seca');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (103, 0, 92, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (104, 0, 92, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (105, 0, 92, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (106, 0, 93, 'Outras');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (107, 0, 93, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (108, 0, 93, 'mucosa primária  ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (109, 0, 93, 'mucosa concomitante ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (110, 0, 93, 'mucosa tardia  ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (111, 0, 93, 'mucosa contígua ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (112, 0, 93, 'mucosa indeterminada ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (113, 0, 94, 'faringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (114, 0, 94, 'laringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (115, 0, 94, 'nasal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (116, 0, 94, 'cavidade oral');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (117, 0, 95, 'Obstrução nasal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (118, 0, 95, 'Sangramento nasal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (119, 0, 95, 'Dor');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (120, 0, 95, 'Crostas');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (121, 0, 95, 'Assintomático');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (122, 0, 95, 'Queixas');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (123, 0, 95, 'Prurido');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (124, 0, 95, 'Secreção nasal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (125, 0, 95, 'Demormidade');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (126, 0, 96, 'Erosão');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (127, 0, 96, 'Aspecto granuloso ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (128, 0, 96, 'Edema');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (129, 0, 96, 'Infiltração');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (130, 0, 96, 'Hiperemia');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (131, 0, 96, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (132, 0, 97, 'Cabeça de concha inferior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (133, 0, 97, 'Septo anterior ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (134, 0, 97, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (135, 0, 97, 'Outras');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (136, 0, 98, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (137, 0, 98, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (138, 0, 98, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (139, 0, 99, 'Dor a deglutição');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (140, 0, 99, 'Outros');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (141, 0, 99, 'Roquidão prolongada');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (142, 0, 100, 'Palato');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (143, 0, 100, 'Faringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (144, 0, 100, 'Cordas Vocais ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (145, 0, 100, 'Laringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (146, 0, 100, 'Gengiva');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (147, 0, 100, 'Lábios');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (148, 0, 100, 'Úvula');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (149, 0, 101, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (150, 0, 101, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (151, 0, 101, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (152, 0, 103, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (153, 0, 103, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (154, 0, 103, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (155, 0, 104, 'Outros');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (156, 0, 104, 'Inguinal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (157, 0, 104, 'Crural');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (158, 0, 104, 'Submandibular');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (159, 0, 104, 'Cervical');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (160, 0, 104, 'Subocciptal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (161, 0, 104, 'Epitroclear');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (162, 0, 104, 'Axilar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (163, 0, 106, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (164, 0, 106, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (165, 0, 107, 'TRIZOL');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (166, 0, 107, 'CONGELAMENTO');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (167, 0, 107, 'FORMOL');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (168, 0, 107, 'RPMI');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (169, 0, 108, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (170, 0, 108, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (171, 0, 109, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (172, 0, 109, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (173, 0, 110, 'PLASMA');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (174, 0, 110, 'SORO');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (175, 0, 110, 'PBMC CONGELADO');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (176, 0, 110, 'PBMC/SANGUE TOTAL TRIZOL');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (177, 0, 110, 'PBMC/SANGUE TOTAL EX VIVO');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (178, 0, 111, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (179, 0, 111, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (180, 0, 112, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (181, 0, 112, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (182, 0, 113, 'IDRM');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (183, 0, 113, 'I.F.I');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (184, 0, 113, 'ELISA/SRA');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (198, 0, 140, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (199, 0, 140, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (200, 0, 140, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (201, 0, 141, 'Destruição total');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (202, 0, 141, 'Retração cicatricial ');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (203, 0, 141, 'Cicatriz atrófica');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (204, 0, 141, 'Perfuração');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (205, 0, 141, 'Destruição parcial');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (206, 0, 142, 'Septo anterior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (207, 0, 142, 'Cabeça da concha inferior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (208, 0, 142, 'Outras');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (214, 0, 145, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (215, 0, 145, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (216, 0, 145, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (217, 0, 146, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (218, 0, 146, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (219, 0, 146, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (220, 0, 147, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (221, 0, 147, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (222, 0, 147, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (223, 0, 148, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (224, 0, 148, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (225, 0, 148, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (226, 0, 157, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (227, 0, 157, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (228, 0, 160, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (229, 0, 160, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (230, 0, 158, 'Submandibular');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (231, 0, 158, 'Crural');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (232, 0, 158, 'Inguinal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (233, 0, 158, 'Subocciptal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (234, 0, 158, 'Cervical');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (235, 0, 158, 'Axilar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (236, 0, 158, 'Outros');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (237, 0, 158, 'Epitroclear');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (238, 0, 165, 'Cura Clínica');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (239, 0, 165, 'Melhora com cicatrização total');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (240, 0, 165, 'Estável');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (241, 0, 165, 'Piora Clínica');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (242, 0, 165, 'Melhora com cicatrização parcial');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (243, 0, 166, 'Tratamento incompleto');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (244, 0, 166, 'Tratamento completo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (246, 0, 167, 'Regular');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (247, 0, 168, '10° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (248, 0, 168, '2° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (249, 0, 168, '9° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (250, 0, 168, '8° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (251, 0, 168, '7° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (252, 0, 168, '1° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (253, 0, 168, '3° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (254, 0, 168, '4° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (255, 0, 168, '5° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (256, 0, 168, '6° Retorno');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (257, 0, 169, 'Aumento');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (258, 0, 169, 'Estabilização');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (259, 0, 169, 'Diminuição');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (260, 0, 88, 'cotovelo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (261, 0, 88, 'joelho');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (97, 1, 88, 'coxa');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (262, 0, 174, 'positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (263, 0, 174, 'não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (264, 0, 174, 'negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (265, 0, 175, 'não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (266, 0, 175, 'positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (267, 0, 175, 'negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (268, 0, 176, 'negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (269, 0, 176, 'positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (270, 0, 176, 'não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (271, 0, 181, 'não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (272, 0, 181, 'negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (273, 0, 181, 'positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (274, 0, 183, 'Positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (275, 0, 183, 'Negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (276, 0, 183, 'Não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (277, 0, 184, 'Não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (278, 0, 184, 'Positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (279, 0, 184, 'Negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (280, 0, 185, 'Não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (281, 0, 185, 'Positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (282, 0, 185, 'Negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (283, 0, 186, 'Positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (284, 0, 186, 'Negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (285, 0, 186, 'Não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (286, 0, 191, 'faringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (287, 0, 191, 'cavidade oral');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (288, 0, 191, 'laringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (289, 0, 191, 'nasal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (290, 0, 192, 'nasal');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (291, 0, 192, 'laringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (292, 0, 192, 'cavidade oral');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (293, 0, 192, 'faringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (294, 0, 193, 'Cordas Vocais');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (295, 0, 193, 'Palato');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (296, 0, 193, 'Gengiva');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (297, 0, 193, 'Laringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (298, 0, 193, 'Lábios');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (299, 0, 193, 'Úvula');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (300, 0, 193, 'Faringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (301, 0, 194, 'Cordas Vocais');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (302, 0, 194, 'Úvula');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (303, 0, 194, 'Lábios');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (304, 0, 194, 'Gengiva');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (305, 0, 194, 'Palato');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (306, 0, 194, 'Laringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (307, 0, 194, 'Faringe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (308, 0, 195, 'Outras');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (309, 0, 195, 'Septo anterior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (310, 0, 195, 'Cabeça de concha inferior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (311, 0, 195, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (312, 0, 196, 'Cabeça de concha inferior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (313, 0, 196, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (314, 0, 196, 'Outras');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (315, 0, 196, 'Septo anterior');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (316, 0, 197, 'Não sabe informar');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (317, 0, 197, 'Erosão');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (318, 0, 197, 'Hiperemia');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (319, 0, 197, 'Infiltração');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (320, 0, 197, 'Aspecto granuloso');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (321, 0, 197, 'Edema');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (322, 0, 198, 'Positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (323, 0, 198, 'Negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (324, 0, 198, 'Não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (325, 0, 199, 'Não realizado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (326, 0, 199, 'Negativo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (327, 0, 199, 'Positivo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (328, 0, 83, 'Outros');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (245, 1, 167, 'Irregular');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (329, 0, 88, 'genitália');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (330, 0, 88, 'gluteo');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (331, 0, 165, 'Não tratado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (332, 0, 167, 'Não informado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (333, 0, 166, 'Não Informado');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (334, 0, 200, 'Ubaíra');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (335, 0, 200, 'Jequiriçá');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (336, 0, 200, 'Laje');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (337, 0, 200, 'Mutuípe');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (338, 0, 202, 'Não');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (339, 0, 202, 'Sim');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (340, 0, 203, 'Outros');
INSERT INTO "regadbschema"."test_nominal_value" VALUES (341, 0, 203, 'Leishmaniose Mucosa');

-- ----------------------------
-- Table structure for test_object
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."test_object";
CREATE TABLE "regadbschema"."test_object" (
  "test_object_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".test_object_test_object_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "description" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "test_object_id" int4
)
;

-- ----------------------------
-- Records of test_object
-- ----------------------------
INSERT INTO "regadbschema"."test_object" VALUES (1, 0, 'Patient test', 0);
INSERT INTO "regadbschema"."test_object" VALUES (2, 0, 'Sequence analysis', 1);
INSERT INTO "regadbschema"."test_object" VALUES (3, 0, 'Generic drug test', 2);
INSERT INTO "regadbschema"."test_object" VALUES (4, 0, 'Resistance test', 3);
INSERT INTO "regadbschema"."test_object" VALUES (5, 0, 'Viral Isolate analysis', 4);
INSERT INTO "regadbschema"."test_object" VALUES (6, 0, 'Therapy test', 5);

-- ----------------------------
-- Table structure for test_result
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."test_result";
CREATE TABLE "regadbschema"."test_result" (
  "test_result_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".test_result_test_result_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "test_ii" int4 NOT NULL,
  "generic_ii" int4,
  "viral_isolate_ii" int4,
  "therapy_ii" int4,
  "nominal_value_ii" int4,
  "patient_ii" int4,
  "nt_sequence_ii" int4,
  "value" text COLLATE "pg_catalog"."default",
  "test_date" date,
  "sample_id" varchar(50) COLLATE "pg_catalog"."default",
  "data" bytea
)
;

-- ----------------------------
-- Table structure for test_type
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."test_type";
CREATE TABLE "regadbschema"."test_type" (
  "test_type_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".test_type_test_type_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "value_type_ii" int4,
  "genome_ii" int4,
  "test_object_ii" int4 NOT NULL,
  "description" varchar(200) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of test_type
-- ----------------------------
INSERT INTO "regadbschema"."test_type" VALUES (48, 0, 5, 7, 1, 'Residêcia Atual');
INSERT INTO "regadbschema"."test_type" VALUES (49, 1, 1, 7, 1, 'Tempo de moradia (meses)');
INSERT INTO "regadbschema"."test_type" VALUES (50, 0, 3, 7, 1, 'Tipo de Moradia');
INSERT INTO "regadbschema"."test_type" VALUES (53, 0, 1, 7, 1, 'Caso residência atual há menos de um ano, registrar endereço da moradia anterior e há quanto tempo (meses)');
INSERT INTO "regadbschema"."test_type" VALUES (54, 0, 3, 7, 1, 'Local onde reside (ou contágio) tem alguém com LTA');
INSERT INTO "regadbschema"."test_type" VALUES (55, 0, 1, 7, 1, 'Número de familiares em casa (Excluir paciente)');
INSERT INTO "regadbschema"."test_type" VALUES (56, 0, 1, 7, 1, ' Número de familiares que tiveram LTA');
INSERT INTO "regadbschema"."test_type" VALUES (57, 0, 3, 7, 1, 'Está em uso de medicação?');
INSERT INTO "regadbschema"."test_type" VALUES (58, 0, 5, 7, 1, 'Qual medicação está usando?');
INSERT INTO "regadbschema"."test_type" VALUES (59, 0, 3, 7, 1, 'Hipertensão arterial');
INSERT INTO "regadbschema"."test_type" VALUES (60, 0, 3, 7, 1, 'Diabetes mellitus');
INSERT INTO "regadbschema"."test_type" VALUES (61, 1, 3, 7, 1, 'Doença coronariana');
INSERT INTO "regadbschema"."test_type" VALUES (62, 0, 3, 7, 1, 'Chagas');
INSERT INTO "regadbschema"."test_type" VALUES (63, 0, 3, 7, 1, 'Outras doenças infecciosas');
INSERT INTO "regadbschema"."test_type" VALUES (64, 0, 5, 7, 1, 'Qual doença infecciosa?');
INSERT INTO "regadbschema"."test_type" VALUES (65, 0, 3, 7, 1, 'Parasitose intestinal');
INSERT INTO "regadbschema"."test_type" VALUES (66, 0, 5, 7, 1, 'Qual parasitose intestinal');
INSERT INTO "regadbschema"."test_type" VALUES (67, 0, 3, 7, 1, ' Rinite ou sinusite crônica');
INSERT INTO "regadbschema"."test_type" VALUES (68, 0, 3, 7, 1, 'Já teve LTA');
INSERT INTO "regadbschema"."test_type" VALUES (69, 0, 3, 7, 1, 'Foi tratado (LTA positivo)');
INSERT INTO "regadbschema"."test_type" VALUES (70, 0, 3, 7, 1, 'Natureza do tratamento (LTA positivo)');
INSERT INTO "regadbschema"."test_type" VALUES (71, 0, 5, 7, 1, 'Droga usada (LTA positivo)');
INSERT INTO "regadbschema"."test_type" VALUES (72, 0, 5, 7, 1, 'Dose(LTA positvo)');
INSERT INTO "regadbschema"."test_type" VALUES (73, 0, 1, 7, 1, 'Ano de tratamento (LTA positivo)');
INSERT INTO "regadbschema"."test_type" VALUES (74, 0, 5, 7, 1, 'Onde foi tratado (LTA positivo)');
INSERT INTO "regadbschema"."test_type" VALUES (75, 0, 3, 7, 1, 'Cria animais no quintal');
INSERT INTO "regadbschema"."test_type" VALUES (77, 0, 3, 7, 1, 'Galinhas');
INSERT INTO "regadbschema"."test_type" VALUES (78, 0, 3, 7, 1, 'Cães');
INSERT INTO "regadbschema"."test_type" VALUES (79, 1, 3, 7, 1, 'Outros (animais)');
INSERT INTO "regadbschema"."test_type" VALUES (80, 0, 5, 7, 1, 'Qual animal (outro)');
INSERT INTO "regadbschema"."test_type" VALUES (81, 0, 3, 7, 1, 'Renda familiar mensal (sal. Mínimos) ');
INSERT INTO "regadbschema"."test_type" VALUES (82, 0, 3, 7, 1, 'Bolsa-família');
INSERT INTO "regadbschema"."test_type" VALUES (84, 0, 1, 7, 1, 'Número Total de Lesão(ões)');
INSERT INTO "regadbschema"."test_type" VALUES (85, 0, 1, 7, 1, 'Lesão maior (cm)');
INSERT INTO "regadbschema"."test_type" VALUES (86, 0, 1, 7, 1, 'Lesão maior (área)');
INSERT INTO "regadbschema"."test_type" VALUES (87, 0, 1, 7, 1, 'Duração (meses)');
INSERT INTO "regadbschema"."test_type" VALUES (89, 0, 1, 7, 1, 'Tamanho(s) em cm');
INSERT INTO "regadbschema"."test_type" VALUES (90, 0, 3, 7, 1, 'Característica(s) da ferida(s)');
INSERT INTO "regadbschema"."test_type" VALUES (91, 0, 3, 7, 1, 'Se lesão ulcerada');
INSERT INTO "regadbschema"."test_type" VALUES (92, 0, 3, 7, 1, 'Lesão Mucosa ativa');
INSERT INTO "regadbschema"."test_type" VALUES (93, 0, 3, 7, 1, 'Formas(Lesão Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (94, 0, 3, 7, 1, 'Localização (Lesão Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (95, 0, 3, 7, 1, 'Se nasal(Lesão Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (96, 1, 3, 7, 1, 'Exame Físico: Mucosa Nasal');
INSERT INTO "regadbschema"."test_type" VALUES (97, 0, 3, 7, 1, 'Localização (Mucosa nasal)');
INSERT INTO "regadbschema"."test_type" VALUES (98, 0, 3, 7, 1, ' Mucosa oral e faringe');
INSERT INTO "regadbschema"."test_type" VALUES (99, 0, 3, NULL, 1, 'Queixas associadas (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test_type" VALUES (100, 0, 3, 7, 1, 'Localização (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test_type" VALUES (101, 0, 3, 7, 1, 'Outras mucosas (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test_type" VALUES (102, 0, 5, 7, 1, 'Qual(ais) (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test_type" VALUES (103, 0, 3, 7, 1, 'Presença de Linfonodos');
INSERT INTO "regadbschema"."test_type" VALUES (104, 0, 3, NULL, 1, 'Caso sim, localização (presença de linfonodos)');
INSERT INTO "regadbschema"."test_type" VALUES (105, 0, 1, 7, 1, 'Tamanho do gânglio (cm)');
INSERT INTO "regadbschema"."test_type" VALUES (106, 0, 3, 7, 1, 'Biópsia');
INSERT INTO "regadbschema"."test_type" VALUES (107, 0, 3, 7, 1, 'Se sim (Biópsia)');
INSERT INTO "regadbschema"."test_type" VALUES (109, 0, 3, 7, 1, 'Sangue');
INSERT INTO "regadbschema"."test_type" VALUES (110, 0, 3, 7, 1, 'Se sim (Sangue)');
INSERT INTO "regadbschema"."test_type" VALUES (111, 0, 3, 7, 1, 'Aspirado de linfonodo');
INSERT INTO "regadbschema"."test_type" VALUES (112, 0, 3, 7, 1, 'Swab da lesão');
INSERT INTO "regadbschema"."test_type" VALUES (113, 0, 3, 7, 1, 'Exames imunologicos');
INSERT INTO "regadbschema"."test_type" VALUES (115, 0, 5, 7, 1, 'ANATOMIA PATOLOGICA');
INSERT INTO "regadbschema"."test_type" VALUES (116, 0, 1, 7, 1, 'Hemácias');
INSERT INTO "regadbschema"."test_type" VALUES (117, 0, 1, 7, 1, 'Hemoglobina');
INSERT INTO "regadbschema"."test_type" VALUES (118, 0, 1, 7, 1, 'Hematócrito');
INSERT INTO "regadbschema"."test_type" VALUES (83, 1, 3, 7, 1, 'Status da Doença (SD)');
INSERT INTO "regadbschema"."test_type" VALUES (88, 4, 3, 7, 1, 'Localização(ões)');
INSERT INTO "regadbschema"."test_type" VALUES (119, 0, 1, 7, 1, 'Leucocitos');
INSERT INTO "regadbschema"."test_type" VALUES (120, 0, 1, 7, 1, 'Meta');
INSERT INTO "regadbschema"."test_type" VALUES (121, 0, 1, 7, 1, 'Bastões');
INSERT INTO "regadbschema"."test_type" VALUES (122, 0, 1, 7, 1, 'Segmentados');
INSERT INTO "regadbschema"."test_type" VALUES (123, 0, 1, 7, 1, 'Eosinófilos');
INSERT INTO "regadbschema"."test_type" VALUES (124, 0, 1, 7, 1, 'Linfócitos');
INSERT INTO "regadbschema"."test_type" VALUES (125, 0, 1, 7, 1, 'Monócitos');
INSERT INTO "regadbschema"."test_type" VALUES (126, 0, 1, 7, 1, 'Plaquetas');
INSERT INTO "regadbschema"."test_type" VALUES (127, 0, 1, 7, 1, 'Tgo/Tgp');
INSERT INTO "regadbschema"."test_type" VALUES (128, 0, 1, 7, 1, 'Ureia');
INSERT INTO "regadbschema"."test_type" VALUES (129, 0, 1, 7, 1, 'Creatinina');
INSERT INTO "regadbschema"."test_type" VALUES (130, 0, 1, 7, 1, 'Glicemia /Jejum');
INSERT INTO "regadbschema"."test_type" VALUES (132, 0, 1, 7, 1, 'Vel. Hemossed. ');
INSERT INTO "regadbschema"."test_type" VALUES (133, 0, 5, 7, 1, 'E. Paras. Fezes');
INSERT INTO "regadbschema"."test_type" VALUES (140, 0, 3, 7, 1, 'Lesão Mucosa cicatricial');
INSERT INTO "regadbschema"."test_type" VALUES (141, 0, 3, 7, 1, 'Lesão Mucosa cicatricial(Tipo)');
INSERT INTO "regadbschema"."test_type" VALUES (142, 0, 3, 7, 1, 'Lesão Mucosa cicatricial (Localização)');
INSERT INTO "regadbschema"."test_type" VALUES (143, 0, 5, 7, 1, 'OBSERVAÇÕES');
INSERT INTO "regadbschema"."test_type" VALUES (145, 0, 3, 7, 1, 'IFI');
INSERT INTO "regadbschema"."test_type" VALUES (146, 0, 3, 7, 1, 'ELISA');
INSERT INTO "regadbschema"."test_type" VALUES (147, 0, 3, 7, 1, 'PCR');
INSERT INTO "regadbschema"."test_type" VALUES (148, 0, 3, 7, 1, 'RT-PCR');
INSERT INTO "regadbschema"."test_type" VALUES (108, 0, 8, 7, 1, 'Foto');
INSERT INTO "regadbschema"."test_type" VALUES (156, 0, 8, 7, 1, 'Foto Cutânea');
INSERT INTO "regadbschema"."test_type" VALUES (157, 0, 3, 7, 1, 'Presença de Linfonodos (Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (159, 0, 1, 7, 1, 'Tamanho do gânglio (cm) (Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (160, 0, 3, 7, 1, 'Presença de Linfonodos (Cutânea)');
INSERT INTO "regadbschema"."test_type" VALUES (161, 0, 3, 7, 1, 'Caso sim localização (presença de linfonodos) (Cutânea)');
INSERT INTO "regadbschema"."test_type" VALUES (162, 0, 1, 7, 1, 'Tamanho do gânglio (cm) (Cutânea)');
INSERT INTO "regadbschema"."test_type" VALUES (158, 1, 3, 7, 1, 'Caso sim localização (presença de linfonodos) (Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (163, 0, 5, 7, 1, 'Caso sim, descreva (presença de linfonodos)(Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (164, 0, 5, 7, 1, 'Caso sim, descreva (presença de linfonodos)');
INSERT INTO "regadbschema"."test_type" VALUES (168, 0, 3, 7, 1, 'Tempo de acompanhamento');
INSERT INTO "regadbschema"."test_type" VALUES (169, 0, 3, 7, 1, 'Nível Quantitativo das Lesões');
INSERT INTO "regadbschema"."test_type" VALUES (170, 0, 5, 7, 1, 'Observações');
INSERT INTO "regadbschema"."test_type" VALUES (171, 0, 5, 7, 1, 'Observações (Cutânea)');
INSERT INTO "regadbschema"."test_type" VALUES (172, 0, 5, 7, 1, 'Observações (Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (173, 0, 1, 7, 1, 'IDRM (mm)');
INSERT INTO "regadbschema"."test_type" VALUES (174, 0, 3, 7, 1, 'ELISA (Anti Leishmania)');
INSERT INTO "regadbschema"."test_type" VALUES (175, 0, 3, 7, 1, 'PCR (Qualitativo)');
INSERT INTO "regadbschema"."test_type" VALUES (176, 0, 3, 7, 1, 'Histologia da Biópsia');
INSERT INTO "regadbschema"."test_type" VALUES (177, 0, 1, 7, 1, 'Amilase');
INSERT INTO "regadbschema"."test_type" VALUES (178, 0, 1, 7, 1, 'Lipase');
INSERT INTO "regadbschema"."test_type" VALUES (179, 0, 1, 7, 1, 'Tgo');
INSERT INTO "regadbschema"."test_type" VALUES (180, 0, 1, 7, 1, 'Tgp');
INSERT INTO "regadbschema"."test_type" VALUES (181, 0, 3, 7, 1, 'Citologia do Linfonodo');
INSERT INTO "regadbschema"."test_type" VALUES (182, 0, 5, 7, 1, 'Se sim, descreva (Sangue e biópsia)');
INSERT INTO "regadbschema"."test_type" VALUES (183, 0, 3, 7, 1, 'HBV');
INSERT INTO "regadbschema"."test_type" VALUES (184, 0, 3, 7, 1, 'HTLV');
INSERT INTO "regadbschema"."test_type" VALUES (185, 0, 3, 7, 1, 'HIV');
INSERT INTO "regadbschema"."test_type" VALUES (186, 0, 3, 7, 1, 'HCV');
INSERT INTO "regadbschema"."test_type" VALUES (187, 0, 5, 7, 1, 'Se sim, descreva (Swab da lesão)');
INSERT INTO "regadbschema"."test_type" VALUES (188, 0, 5, 7, 1, 'Se sim, descreva (Aspirado de linfonodo)');
INSERT INTO "regadbschema"."test_type" VALUES (189, 0, 5, 7, 1, 'Se sim, descreva (Sangue)');
INSERT INTO "regadbschema"."test_type" VALUES (190, 0, 5, 7, 1, 'Se sim, descreva (Biópsia)');
INSERT INTO "regadbschema"."test_type" VALUES (191, 0, 3, 7, 1, 'Localização 2 (Lesão Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (192, 0, 3, 7, 1, 'Localização 3 (Lesão Mucosa)');
INSERT INTO "regadbschema"."test_type" VALUES (193, 0, 3, 7, 1, 'Localização 2 (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test_type" VALUES (194, 0, 3, 7, 1, 'Localização 3 (Mucosa oral e faringe)');
INSERT INTO "regadbschema"."test_type" VALUES (195, 0, 3, 7, 1, 'Localização 2 (Mucosa nasal)');
INSERT INTO "regadbschema"."test_type" VALUES (196, 0, 3, 7, 1, 'Localização 3 (Mucosa nasal)');
INSERT INTO "regadbschema"."test_type" VALUES (197, 0, 3, 7, 1, 'Exame Físico: Mucosa oral e faringe');
INSERT INTO "regadbschema"."test_type" VALUES (198, 0, 3, 7, 1, 'Presença de parasita no Linfonodo');
INSERT INTO "regadbschema"."test_type" VALUES (199, 0, 3, 7, 1, 'Presença de parasita na Biópsia');
INSERT INTO "regadbschema"."test_type" VALUES (131, 1, 4, 7, 1, 'Ecg');
INSERT INTO "regadbschema"."test_type" VALUES (165, 1, 3, 7, 1, 'Status da Lesão');
INSERT INTO "regadbschema"."test_type" VALUES (167, 1, 3, 7, 1, 'Frequência do tratamento');
INSERT INTO "regadbschema"."test_type" VALUES (166, 1, 3, 7, 1, 'Status do tratamento');
INSERT INTO "regadbschema"."test_type" VALUES (200, 0, 3, 7, 1, 'Município que reside');
INSERT INTO "regadbschema"."test_type" VALUES (201, 0, 5, 7, 1, 'Se sim, descreva (Swab nasal)');
INSERT INTO "regadbschema"."test_type" VALUES (202, 0, 3, 7, 1, 'Swab nasal');
INSERT INTO "regadbschema"."test_type" VALUES (203, 0, 3, NULL, 1, 'Suspeita Diagnostica (SD) (Mucosa)');

-- ----------------------------
-- Table structure for therapy
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."therapy";
CREATE TABLE "regadbschema"."therapy" (
  "therapy_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".therapy_therapy_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "therapy_motivation_ii" int4,
  "patient_ii" int4 NOT NULL,
  "start_date" date NOT NULL,
  "stop_date" date,
  "comment" varchar(200) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for therapy_commercial
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."therapy_commercial";
CREATE TABLE "regadbschema"."therapy_commercial" (
  "therapy_ii" int4 NOT NULL,
  "commercial_ii" int4 NOT NULL,
  "version" int4 NOT NULL,
  "day_dosage_units" float8,
  "placebo" bool NOT NULL,
  "blind" bool NOT NULL,
  "frequency" int8
)
;

-- ----------------------------
-- Table structure for therapy_generic
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."therapy_generic";
CREATE TABLE "regadbschema"."therapy_generic" (
  "therapy_ii" int4 NOT NULL,
  "generic_ii" int4 NOT NULL,
  "version" int4 NOT NULL,
  "day_dosage_mg" float8,
  "placebo" bool NOT NULL,
  "blind" bool NOT NULL,
  "frequency" int8
)
;

-- ----------------------------
-- Table structure for therapy_motivation
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."therapy_motivation";
CREATE TABLE "regadbschema"."therapy_motivation" (
  "therapy_motivation_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".therapy_motivation_therapy_motivation_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "value" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of therapy_motivation
-- ----------------------------
INSERT INTO "regadbschema"."therapy_motivation" VALUES (1, 0, 'Toxicity');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (2, 0, 'Treatment failure, resistance');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (3, 0, 'Treatment failure, other');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (4, 0, 'Patient''s choice');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (5, 0, 'Therapy change');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (6, 0, 'Adherence');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (7, 0, 'Pregnancy');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (8, 0, 'Interaction with other drugs');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (9, 0, 'Other');
INSERT INTO "regadbschema"."therapy_motivation" VALUES (10, 0, 'Unknown');

-- ----------------------------
-- Table structure for user_attribute
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."user_attribute";
CREATE TABLE "regadbschema"."user_attribute" (
  "user_attribute_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".user_attribute_user_attribute_ii_seq'::regclass),
  "value_type_ii" int4,
  "uid" varchar(50) COLLATE "pg_catalog"."default",
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "value" varchar(100) COLLATE "pg_catalog"."default",
  "data" bytea
)
;

-- ----------------------------
-- Records of user_attribute
-- ----------------------------
INSERT INTO "regadbschema"."user_attribute" VALUES (17, 4, 'admin', 'chart.mutation', NULL, NULL);

-- ----------------------------
-- Table structure for value_type
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."value_type";
CREATE TABLE "regadbschema"."value_type" (
  "value_type_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".value_type_value_type_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "description" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "minimum" float8,
  "maximum" float8,
  "multiple" bool
)
;

-- ----------------------------
-- Records of value_type
-- ----------------------------
INSERT INTO "regadbschema"."value_type" VALUES (1, 0, 'number', NULL, NULL, NULL);
INSERT INTO "regadbschema"."value_type" VALUES (2, 0, 'limited number (<,=,>)', NULL, NULL, NULL);
INSERT INTO "regadbschema"."value_type" VALUES (3, 0, 'nominal value', NULL, NULL, NULL);
INSERT INTO "regadbschema"."value_type" VALUES (4, 0, 'string', NULL, NULL, NULL);
INSERT INTO "regadbschema"."value_type" VALUES (5, 0, 'text', NULL, NULL, NULL);
INSERT INTO "regadbschema"."value_type" VALUES (6, 0, 'date', NULL, NULL, NULL);
INSERT INTO "regadbschema"."value_type" VALUES (8, 0, 'image', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for viral_isolate
-- ----------------------------
DROP TABLE IF EXISTS "regadbschema"."viral_isolate";
CREATE TABLE "regadbschema"."viral_isolate" (
  "viral_isolate_ii" int4 NOT NULL DEFAULT nextval('"regadbschema".viral_isolate_viral_isolate_ii_seq'::regclass),
  "version" int4 NOT NULL,
  "patient_ii" int4 NOT NULL,
  "sample_id" varchar(50) COLLATE "pg_catalog"."default",
  "sample_date" date,
  "genome_ii" int4
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"regadbschema"."aa_sequence_aa_sequence_ii_seq"', 2, false);
SELECT setval('"regadbschema"."analysis_analysis_ii_seq"', 13, true);
SELECT setval('"regadbschema"."analysis_data_analysis_data_ii_seq"', 12, true);
SELECT setval('"regadbschema"."analysis_type_analysis_type_ii_seq"', 2, true);
SELECT setval('"regadbschema"."attribute_attribute_ii_seq"', 25, true);
SELECT setval('"regadbschema"."attribute_group_attribute_group_ii_seq"', 4, true);
SELECT setval('"regadbschema"."attribute_nominal_value_attribute_nominal_value_ii_seq"', 244, true);
SELECT setval('"regadbschema"."combined_query_combined_query_ii_seq"', 2, false);
SELECT setval('"regadbschema"."dataset_dataset_ii_seq"', 3, true);
SELECT setval('"regadbschema"."drug_class_drug_class_ii_seq"', 19, true);
SELECT setval('"regadbschema"."drug_commercial_drug_commercial_ii_seq"', 186, true);
SELECT setval('"regadbschema"."drug_generic_drug_generic_ii_seq"', 94, true);
SELECT setval('"regadbschema"."event_event_ii_seq"', 3, true);
SELECT setval('"regadbschema"."event_nominal_value_event_nominal_value_ii_seq"', 42, true);
SELECT setval('"regadbschema"."genome_genome_ii_seq"', 8, true);
SELECT setval('"regadbschema"."nt_sequence_nt_sequence_ii_seq"', 2, false);
SELECT setval('"regadbschema"."open_reading_frame_open_reading_frame_ii_seq"', 38, true);
SELECT setval('"regadbschema"."patient_attribute_value_patient_attribute_value_ii_seq"', 12645, true);
SELECT setval('"regadbschema"."patient_event_value_patient_event_value_ii_seq"', 7, true);
SELECT setval('"regadbschema"."patient_patient_ii_seq"', 1628, true);
SELECT setval('"regadbschema"."protein_protein_ii_seq"', 89, true);
SELECT setval('"regadbschema"."query_definition_parameter_query_definition_parameter_ii_seq"', 2, false);
SELECT setval('"regadbschema"."query_definition_parameter_type_query_definition_parameter_type"', 12, true);
SELECT setval('"regadbschema"."query_definition_query_definition_ii_seq"', 8, true);
SELECT setval('"regadbschema"."query_definition_run_parameter_query_definition_run_parameter_i"', 2, false);
SELECT setval('"regadbschema"."query_definition_run_query_definition_run_ii_seq"', 2, false);
SELECT setval('"regadbschema"."resistance_interpretation_template_resistance_interpretation_te"', 2, false);
SELECT setval('"regadbschema"."splicing_position_splicing_position_ii_seq"', 8, true);
SELECT setval('"regadbschema"."test_nominal_value_test_nominal_value_ii_seq"', 342, true);
SELECT setval('"regadbschema"."test_object_test_object_ii_seq"', 7, true);
SELECT setval('"regadbschema"."test_result_test_result_ii_seq"', 57001, true);
SELECT setval('"regadbschema"."test_test_ii_seq"', 199, true);
SELECT setval('"regadbschema"."test_type_test_type_ii_seq"', 204, true);
SELECT setval('"regadbschema"."therapy_motivation_therapy_motivation_ii_seq"', 71, true);
SELECT setval('"regadbschema"."therapy_therapy_ii_seq"', 1296, true);
SELECT setval('"regadbschema"."user_attribute_user_attribute_ii_seq"', 28, true);
SELECT setval('"regadbschema"."value_type_value_type_ii_seq"', 9, true);
SELECT setval('"regadbschema"."viral_isolate_viral_isolate_ii_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table aa_insertion
-- ----------------------------
ALTER TABLE "regadbschema"."aa_insertion" ADD CONSTRAINT "aa_insertion_pkey" PRIMARY KEY ("insertion_position", "aa_sequence_ii", "insertion_order");

-- ----------------------------
-- Primary Key structure for table aa_mutation
-- ----------------------------
ALTER TABLE "regadbschema"."aa_mutation" ADD CONSTRAINT "aa_mutation_pkey" PRIMARY KEY ("mutation_position", "aa_sequence_ii");

-- ----------------------------
-- Indexes structure for table aa_sequence
-- ----------------------------
CREATE INDEX "aa_sequence_nt_sequence_ii_idx" ON "regadbschema"."aa_sequence" USING btree (
  "nt_sequence_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "aa_sequence_protein_ii_idx" ON "regadbschema"."aa_sequence" USING btree (
  "protein_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table aa_sequence
-- ----------------------------
ALTER TABLE "regadbschema"."aa_sequence" ADD CONSTRAINT "aa_sequence_pkey" PRIMARY KEY ("aa_sequence_ii");

-- ----------------------------
-- Indexes structure for table analysis
-- ----------------------------
CREATE INDEX "analysis_analysis_type_ii_idx" ON "regadbschema"."analysis" USING btree (
  "analysis_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table analysis
-- ----------------------------
ALTER TABLE "regadbschema"."analysis" ADD CONSTRAINT "analysis_pkey" PRIMARY KEY ("analysis_ii");

-- ----------------------------
-- Indexes structure for table analysis_data
-- ----------------------------
CREATE INDEX "analysis_data_analysis_ii_idx" ON "regadbschema"."analysis_data" USING btree (
  "analysis_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table analysis_data
-- ----------------------------
ALTER TABLE "regadbschema"."analysis_data" ADD CONSTRAINT "analysis_data_pkey" PRIMARY KEY ("analysis_data_ii");

-- ----------------------------
-- Primary Key structure for table analysis_type
-- ----------------------------
ALTER TABLE "regadbschema"."analysis_type" ADD CONSTRAINT "analysis_type_pkey" PRIMARY KEY ("analysis_type_ii");

-- ----------------------------
-- Indexes structure for table attribute
-- ----------------------------
CREATE INDEX "attribute_attribute_group_ii_idx" ON "regadbschema"."attribute" USING btree (
  "attribute_group_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "attribute_value_type_ii_idx" ON "regadbschema"."attribute" USING btree (
  "value_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table attribute
-- ----------------------------
ALTER TABLE "regadbschema"."attribute" ADD CONSTRAINT "attribute_pkey" PRIMARY KEY ("attribute_ii");

-- ----------------------------
-- Primary Key structure for table attribute_group
-- ----------------------------
ALTER TABLE "regadbschema"."attribute_group" ADD CONSTRAINT "attribute_group_pkey" PRIMARY KEY ("attribute_group_ii");

-- ----------------------------
-- Indexes structure for table attribute_nominal_value
-- ----------------------------
CREATE INDEX "attribute_nominal_value_attribute_ii_idx" ON "regadbschema"."attribute_nominal_value" USING btree (
  "attribute_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table attribute_nominal_value
-- ----------------------------
ALTER TABLE "regadbschema"."attribute_nominal_value" ADD CONSTRAINT "attribute_nominal_value_pkey" PRIMARY KEY ("nominal_value_ii");

-- ----------------------------
-- Primary Key structure for table combined_query
-- ----------------------------
ALTER TABLE "regadbschema"."combined_query" ADD CONSTRAINT "combined_query_pkey" PRIMARY KEY ("combined_query_ii");

-- ----------------------------
-- Indexes structure for table combined_query_definition
-- ----------------------------
CREATE INDEX "combined_query_definition_combined_query_ii_idx" ON "regadbschema"."combined_query_definition" USING btree (
  "combined_query_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "combined_query_definition_query_definition_ii_idx" ON "regadbschema"."combined_query_definition" USING btree (
  "query_definition_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table combined_query_definition
-- ----------------------------
ALTER TABLE "regadbschema"."combined_query_definition" ADD CONSTRAINT "combined_query_definition_pkey" PRIMARY KEY ("combined_query_ii", "query_definition_ii");

-- ----------------------------
-- Primary Key structure for table commercial_generic
-- ----------------------------
ALTER TABLE "regadbschema"."commercial_generic" ADD CONSTRAINT "commercial_generic_pkey" PRIMARY KEY ("commercial_ii", "generic_ii");

-- ----------------------------
-- Indexes structure for table dataset
-- ----------------------------
CREATE INDEX "dataset_uid_idx" ON "regadbschema"."dataset" USING btree (
  "uid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dataset
-- ----------------------------
ALTER TABLE "regadbschema"."dataset" ADD CONSTRAINT "dataset_pkey" PRIMARY KEY ("dataset_ii");

-- ----------------------------
-- Primary Key structure for table dataset_access
-- ----------------------------
ALTER TABLE "regadbschema"."dataset_access" ADD CONSTRAINT "dataset_access_pkey" PRIMARY KEY ("uid", "dataset_ii");

-- ----------------------------
-- Primary Key structure for table drug_class
-- ----------------------------
ALTER TABLE "regadbschema"."drug_class" ADD CONSTRAINT "drug_class_pkey" PRIMARY KEY ("drug_class_ii");

-- ----------------------------
-- Primary Key structure for table drug_commercial
-- ----------------------------
ALTER TABLE "regadbschema"."drug_commercial" ADD CONSTRAINT "drug_commercial_pkey" PRIMARY KEY ("commercial_ii");

-- ----------------------------
-- Indexes structure for table drug_generic
-- ----------------------------
CREATE INDEX "drug_generic_drug_class_ii_idx" ON "regadbschema"."drug_generic" USING btree (
  "drug_class_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table drug_generic
-- ----------------------------
ALTER TABLE "regadbschema"."drug_generic" ADD CONSTRAINT "drug_generic_pkey" PRIMARY KEY ("generic_ii");

-- ----------------------------
-- Indexes structure for table event
-- ----------------------------
CREATE INDEX "event_value_type_ii_idx" ON "regadbschema"."event" USING btree (
  "value_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table event
-- ----------------------------
ALTER TABLE "regadbschema"."event" ADD CONSTRAINT "event_pkey" PRIMARY KEY ("event_ii");

-- ----------------------------
-- Indexes structure for table event_nominal_value
-- ----------------------------
CREATE INDEX "event_nominal_value_event_ii_idx" ON "regadbschema"."event_nominal_value" USING btree (
  "event_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table event_nominal_value
-- ----------------------------
ALTER TABLE "regadbschema"."event_nominal_value" ADD CONSTRAINT "event_nominal_value_pkey" PRIMARY KEY ("nominal_value_ii");

-- ----------------------------
-- Primary Key structure for table genome
-- ----------------------------
ALTER TABLE "regadbschema"."genome" ADD CONSTRAINT "genome_pkey" PRIMARY KEY ("genome_ii");

-- ----------------------------
-- Primary Key structure for table genome_drug_generic
-- ----------------------------
ALTER TABLE "regadbschema"."genome_drug_generic" ADD CONSTRAINT "genome_drug_generic_pkey" PRIMARY KEY ("generic_ii", "genome_ii");

-- ----------------------------
-- Indexes structure for table nt_sequence
-- ----------------------------
CREATE INDEX "nt_sequence_viral_isolate_ii_idx" ON "regadbschema"."nt_sequence" USING btree (
  "viral_isolate_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table nt_sequence
-- ----------------------------
ALTER TABLE "regadbschema"."nt_sequence" ADD CONSTRAINT "nt_sequence_pkey" PRIMARY KEY ("nt_sequence_ii");

-- ----------------------------
-- Indexes structure for table open_reading_frame
-- ----------------------------
CREATE INDEX "open_reading_frame_genome_ii_idx" ON "regadbschema"."open_reading_frame" USING btree (
  "genome_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table open_reading_frame
-- ----------------------------
ALTER TABLE "regadbschema"."open_reading_frame" ADD CONSTRAINT "open_reading_frame_pkey" PRIMARY KEY ("open_reading_frame_ii");

-- ----------------------------
-- Primary Key structure for table patient
-- ----------------------------
ALTER TABLE "regadbschema"."patient" ADD CONSTRAINT "patient_pkey" PRIMARY KEY ("patient_ii");

-- ----------------------------
-- Indexes structure for table patient_attribute_value
-- ----------------------------
CREATE INDEX "patient_attribute_value_attribute_ii_idx" ON "regadbschema"."patient_attribute_value" USING btree (
  "attribute_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "patient_attribute_value_nominal_value_ii_idx" ON "regadbschema"."patient_attribute_value" USING btree (
  "nominal_value_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "patient_attribute_value_patient_ii_idx" ON "regadbschema"."patient_attribute_value" USING btree (
  "patient_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table patient_attribute_value
-- ----------------------------
ALTER TABLE "regadbschema"."patient_attribute_value" ADD CONSTRAINT "patient_attribute_value_pkey" PRIMARY KEY ("patient_attribute_value_ii");

-- ----------------------------
-- Primary Key structure for table patient_dataset
-- ----------------------------
ALTER TABLE "regadbschema"."patient_dataset" ADD CONSTRAINT "patient_dataset_pkey" PRIMARY KEY ("dataset_ii", "patient_ii");

-- ----------------------------
-- Indexes structure for table patient_event_value
-- ----------------------------
CREATE INDEX "patient_event_value_event_ii_idx" ON "regadbschema"."patient_event_value" USING btree (
  "event_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "patient_event_value_nominal_value_ii_idx" ON "regadbschema"."patient_event_value" USING btree (
  "nominal_value_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "patient_event_value_patient_ii_idx" ON "regadbschema"."patient_event_value" USING btree (
  "patient_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table patient_event_value
-- ----------------------------
ALTER TABLE "regadbschema"."patient_event_value" ADD CONSTRAINT "patient_event_value_pkey" PRIMARY KEY ("patient_event_value_ii");

-- ----------------------------
-- Indexes structure for table protein
-- ----------------------------
CREATE INDEX "protein_open_reading_frame_ii_idx" ON "regadbschema"."protein" USING btree (
  "open_reading_frame_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table protein
-- ----------------------------
ALTER TABLE "regadbschema"."protein" ADD CONSTRAINT "protein_pkey" PRIMARY KEY ("protein_ii");

-- ----------------------------
-- Indexes structure for table query_definition
-- ----------------------------
CREATE INDEX "query_definition_uid_idx" ON "regadbschema"."query_definition" USING btree (
  "uid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table query_definition
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition" ADD CONSTRAINT "query_definition_pkey" PRIMARY KEY ("query_definition_ii");

-- ----------------------------
-- Indexes structure for table query_definition_parameter
-- ----------------------------
CREATE INDEX "query_definition_parameter_query_definition_ii_idx" ON "regadbschema"."query_definition_parameter" USING btree (
  "query_definition_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "query_definition_parameter_query_definition_parameter_type_ii_i" ON "regadbschema"."query_definition_parameter" USING btree (
  "query_definition_parameter_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table query_definition_parameter
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_parameter" ADD CONSTRAINT "query_definition_parameter_pkey" PRIMARY KEY ("query_definition_parameter_ii");

-- ----------------------------
-- Uniques structure for table query_definition_parameter_type
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_parameter_type" ADD CONSTRAINT "query_definition_parameter_type_id_key" UNIQUE ("id");
ALTER TABLE "regadbschema"."query_definition_parameter_type" ADD CONSTRAINT "query_definition_parameter_type_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table query_definition_parameter_type
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_parameter_type" ADD CONSTRAINT "query_definition_parameter_type_pkey" PRIMARY KEY ("query_definition_parameter_type_ii");

-- ----------------------------
-- Indexes structure for table query_definition_run
-- ----------------------------
CREATE INDEX "query_definition_run_query_definition_ii_idx" ON "regadbschema"."query_definition_run" USING btree (
  "query_definition_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "query_definition_run_uid_idx" ON "regadbschema"."query_definition_run" USING btree (
  "uid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table query_definition_run
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_run" ADD CONSTRAINT "query_definition_run_pkey" PRIMARY KEY ("query_definition_run_ii");

-- ----------------------------
-- Indexes structure for table query_definition_run_parameter
-- ----------------------------
CREATE INDEX "query_definition_run_parameter_query_definition_parameter_ii_id" ON "regadbschema"."query_definition_run_parameter" USING btree (
  "query_definition_parameter_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "query_definition_run_parameter_query_definition_run_ii_idx" ON "regadbschema"."query_definition_run_parameter" USING btree (
  "query_definition_run_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table query_definition_run_parameter
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_run_parameter" ADD CONSTRAINT "query_definition_run_parameter_pkey" PRIMARY KEY ("query_definition_run_parameter_ii");

-- ----------------------------
-- Primary Key structure for table resistance_interpretation_template
-- ----------------------------
ALTER TABLE "regadbschema"."resistance_interpretation_template" ADD CONSTRAINT "resistance_interpretation_template_pkey" PRIMARY KEY ("template_ii");

-- ----------------------------
-- Indexes structure for table settings_user
-- ----------------------------
CREATE INDEX "settings_user_dataset_ii_idx" ON "regadbschema"."settings_user" USING btree (
  "dataset_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "settings_user_test_ii_idx" ON "regadbschema"."settings_user" USING btree (
  "test_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table settings_user
-- ----------------------------
ALTER TABLE "regadbschema"."settings_user" ADD CONSTRAINT "settings_user_pkey" PRIMARY KEY ("uid");

-- ----------------------------
-- Indexes structure for table splicing_position
-- ----------------------------
CREATE INDEX "splicing_position_protein_ii_idx" ON "regadbschema"."splicing_position" USING btree (
  "protein_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table splicing_position
-- ----------------------------
ALTER TABLE "regadbschema"."splicing_position" ADD CONSTRAINT "splicing_position_pkey" PRIMARY KEY ("splicing_position_ii");

-- ----------------------------
-- Indexes structure for table test
-- ----------------------------
CREATE INDEX "test_analysis_ii_idx" ON "regadbschema"."test" USING btree (
  "analysis_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_test_type_ii_idx" ON "regadbschema"."test" USING btree (
  "test_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table test
-- ----------------------------
ALTER TABLE "regadbschema"."test" ADD CONSTRAINT "test_analysis_ii_key" UNIQUE ("analysis_ii");

-- ----------------------------
-- Primary Key structure for table test
-- ----------------------------
ALTER TABLE "regadbschema"."test" ADD CONSTRAINT "test_pkey" PRIMARY KEY ("test_ii");

-- ----------------------------
-- Indexes structure for table test_nominal_value
-- ----------------------------
CREATE INDEX "test_nominal_value_test_type_ii_idx" ON "regadbschema"."test_nominal_value" USING btree (
  "test_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table test_nominal_value
-- ----------------------------
ALTER TABLE "regadbschema"."test_nominal_value" ADD CONSTRAINT "test_nominal_value_pkey" PRIMARY KEY ("nominal_value_ii");

-- ----------------------------
-- Primary Key structure for table test_object
-- ----------------------------
ALTER TABLE "regadbschema"."test_object" ADD CONSTRAINT "test_object_pkey" PRIMARY KEY ("test_object_ii");

-- ----------------------------
-- Indexes structure for table test_result
-- ----------------------------
CREATE INDEX "test_result_generic_ii_idx" ON "regadbschema"."test_result" USING btree (
  "generic_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_result_nominal_value_ii_idx" ON "regadbschema"."test_result" USING btree (
  "nominal_value_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_result_nt_sequence_ii_idx" ON "regadbschema"."test_result" USING btree (
  "nt_sequence_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_result_patient_ii_idx" ON "regadbschema"."test_result" USING btree (
  "patient_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_result_test_ii_idx" ON "regadbschema"."test_result" USING btree (
  "test_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_result_therapy_ii_idx" ON "regadbschema"."test_result" USING btree (
  "therapy_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_result_viral_isolate_ii_idx" ON "regadbschema"."test_result" USING btree (
  "viral_isolate_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table test_result
-- ----------------------------
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "test_result_pkey" PRIMARY KEY ("test_result_ii");

-- ----------------------------
-- Indexes structure for table test_type
-- ----------------------------
CREATE INDEX "test_type_genome_ii_idx" ON "regadbschema"."test_type" USING btree (
  "genome_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_type_test_object_ii_idx" ON "regadbschema"."test_type" USING btree (
  "test_object_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "test_type_value_type_ii_idx" ON "regadbschema"."test_type" USING btree (
  "value_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table test_type
-- ----------------------------
ALTER TABLE "regadbschema"."test_type" ADD CONSTRAINT "test_type_pkey" PRIMARY KEY ("test_type_ii");

-- ----------------------------
-- Indexes structure for table therapy
-- ----------------------------
CREATE INDEX "therapy_patient_ii_idx" ON "regadbschema"."therapy" USING btree (
  "patient_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "therapy_therapy_motivation_ii_idx" ON "regadbschema"."therapy" USING btree (
  "therapy_motivation_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table therapy
-- ----------------------------
ALTER TABLE "regadbschema"."therapy" ADD CONSTRAINT "therapy_pkey" PRIMARY KEY ("therapy_ii");

-- ----------------------------
-- Primary Key structure for table therapy_commercial
-- ----------------------------
ALTER TABLE "regadbschema"."therapy_commercial" ADD CONSTRAINT "therapy_commercial_pkey" PRIMARY KEY ("therapy_ii", "commercial_ii");

-- ----------------------------
-- Primary Key structure for table therapy_generic
-- ----------------------------
ALTER TABLE "regadbschema"."therapy_generic" ADD CONSTRAINT "therapy_generic_pkey" PRIMARY KEY ("therapy_ii", "generic_ii");

-- ----------------------------
-- Primary Key structure for table therapy_motivation
-- ----------------------------
ALTER TABLE "regadbschema"."therapy_motivation" ADD CONSTRAINT "therapy_motivation_pkey" PRIMARY KEY ("therapy_motivation_ii");

-- ----------------------------
-- Indexes structure for table user_attribute
-- ----------------------------
CREATE INDEX "user_attribute_uid_idx" ON "regadbschema"."user_attribute" USING btree (
  "uid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "user_attribute_value_type_ii_idx" ON "regadbschema"."user_attribute" USING btree (
  "value_type_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table user_attribute
-- ----------------------------
ALTER TABLE "regadbschema"."user_attribute" ADD CONSTRAINT "user_attribute_pkey" PRIMARY KEY ("user_attribute_ii");

-- ----------------------------
-- Primary Key structure for table value_type
-- ----------------------------
ALTER TABLE "regadbschema"."value_type" ADD CONSTRAINT "value_type_pkey" PRIMARY KEY ("value_type_ii");

-- ----------------------------
-- Indexes structure for table viral_isolate
-- ----------------------------
CREATE INDEX "viral_isolate_genome_ii_idx" ON "regadbschema"."viral_isolate" USING btree (
  "genome_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "viral_isolate_patient_ii_idx" ON "regadbschema"."viral_isolate" USING btree (
  "patient_ii" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table viral_isolate
-- ----------------------------
ALTER TABLE "regadbschema"."viral_isolate" ADD CONSTRAINT "viral_isolate_pkey" PRIMARY KEY ("viral_isolate_ii");

-- ----------------------------
-- Foreign Keys structure for table aa_insertion
-- ----------------------------
ALTER TABLE "regadbschema"."aa_insertion" ADD CONSTRAINT "FK_aa_insertion_aa_sequence" FOREIGN KEY ("aa_sequence_ii") REFERENCES "regadbschema"."aa_sequence" ("aa_sequence_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table aa_mutation
-- ----------------------------
ALTER TABLE "regadbschema"."aa_mutation" ADD CONSTRAINT "FK_aa_mutation_aa_sequence" FOREIGN KEY ("aa_sequence_ii") REFERENCES "regadbschema"."aa_sequence" ("aa_sequence_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table aa_sequence
-- ----------------------------
ALTER TABLE "regadbschema"."aa_sequence" ADD CONSTRAINT "FK_aa_sequence_nt_sequence" FOREIGN KEY ("nt_sequence_ii") REFERENCES "regadbschema"."nt_sequence" ("nt_sequence_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."aa_sequence" ADD CONSTRAINT "FK_aa_sequence_protein" FOREIGN KEY ("protein_ii") REFERENCES "regadbschema"."protein" ("protein_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table analysis
-- ----------------------------
ALTER TABLE "regadbschema"."analysis" ADD CONSTRAINT "FK_analysis_analysis_type" FOREIGN KEY ("analysis_type_ii") REFERENCES "regadbschema"."analysis_type" ("analysis_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table analysis_data
-- ----------------------------
ALTER TABLE "regadbschema"."analysis_data" ADD CONSTRAINT "FK_analysis_data_analysis" FOREIGN KEY ("analysis_ii") REFERENCES "regadbschema"."analysis" ("analysis_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attribute
-- ----------------------------
ALTER TABLE "regadbschema"."attribute" ADD CONSTRAINT "FK_attribute_attribute_group" FOREIGN KEY ("attribute_group_ii") REFERENCES "regadbschema"."attribute_group" ("attribute_group_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."attribute" ADD CONSTRAINT "FK_attribute_value_type" FOREIGN KEY ("value_type_ii") REFERENCES "regadbschema"."value_type" ("value_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attribute_nominal_value
-- ----------------------------
ALTER TABLE "regadbschema"."attribute_nominal_value" ADD CONSTRAINT "FK_attribute_nominal_value_attribute" FOREIGN KEY ("attribute_ii") REFERENCES "regadbschema"."attribute" ("attribute_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table combined_query_definition
-- ----------------------------
ALTER TABLE "regadbschema"."combined_query_definition" ADD CONSTRAINT "FK_combined_query_definition_combined_query" FOREIGN KEY ("combined_query_ii") REFERENCES "regadbschema"."combined_query" ("combined_query_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."combined_query_definition" ADD CONSTRAINT "FK_combined_query_definition_query_definition" FOREIGN KEY ("query_definition_ii") REFERENCES "regadbschema"."query_definition" ("query_definition_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table commercial_generic
-- ----------------------------
ALTER TABLE "regadbschema"."commercial_generic" ADD CONSTRAINT "FK_commercial_generic_drug_commercial" FOREIGN KEY ("commercial_ii") REFERENCES "regadbschema"."drug_commercial" ("commercial_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."commercial_generic" ADD CONSTRAINT "FK_commercial_generic_drug_generic" FOREIGN KEY ("generic_ii") REFERENCES "regadbschema"."drug_generic" ("generic_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table dataset
-- ----------------------------
ALTER TABLE "regadbschema"."dataset" ADD CONSTRAINT "FK_dataset_settings_user" FOREIGN KEY ("uid") REFERENCES "regadbschema"."settings_user" ("uid") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table dataset_access
-- ----------------------------
ALTER TABLE "regadbschema"."dataset_access" ADD CONSTRAINT "FK_dataset_access_dataset" FOREIGN KEY ("dataset_ii") REFERENCES "regadbschema"."dataset" ("dataset_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."dataset_access" ADD CONSTRAINT "FK_dataset_access_settings_user" FOREIGN KEY ("uid") REFERENCES "regadbschema"."settings_user" ("uid") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table drug_generic
-- ----------------------------
ALTER TABLE "regadbschema"."drug_generic" ADD CONSTRAINT "FK_drug_generic_drug_class" FOREIGN KEY ("drug_class_ii") REFERENCES "regadbschema"."drug_class" ("drug_class_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table event
-- ----------------------------
ALTER TABLE "regadbschema"."event" ADD CONSTRAINT "FK_event_value_type" FOREIGN KEY ("value_type_ii") REFERENCES "regadbschema"."value_type" ("value_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table event_nominal_value
-- ----------------------------
ALTER TABLE "regadbschema"."event_nominal_value" ADD CONSTRAINT "FK_event_nominal_value_event" FOREIGN KEY ("event_ii") REFERENCES "regadbschema"."event" ("event_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table genome_drug_generic
-- ----------------------------
ALTER TABLE "regadbschema"."genome_drug_generic" ADD CONSTRAINT "FK_genome_drug_generic_drug_generic" FOREIGN KEY ("generic_ii") REFERENCES "regadbschema"."drug_generic" ("generic_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."genome_drug_generic" ADD CONSTRAINT "FK_genome_drug_generic_genome" FOREIGN KEY ("genome_ii") REFERENCES "regadbschema"."genome" ("genome_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table nt_sequence
-- ----------------------------
ALTER TABLE "regadbschema"."nt_sequence" ADD CONSTRAINT "FK_nt_sequence_viral_isolate" FOREIGN KEY ("viral_isolate_ii") REFERENCES "regadbschema"."viral_isolate" ("viral_isolate_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table open_reading_frame
-- ----------------------------
ALTER TABLE "regadbschema"."open_reading_frame" ADD CONSTRAINT "FK_open_reading_frame_genome" FOREIGN KEY ("genome_ii") REFERENCES "regadbschema"."genome" ("genome_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table patient_attribute_value
-- ----------------------------
ALTER TABLE "regadbschema"."patient_attribute_value" ADD CONSTRAINT "FK_patient_attribute_value_attribute" FOREIGN KEY ("attribute_ii") REFERENCES "regadbschema"."attribute" ("attribute_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."patient_attribute_value" ADD CONSTRAINT "FK_patient_attribute_value_attribute_nominal_value" FOREIGN KEY ("nominal_value_ii") REFERENCES "regadbschema"."attribute_nominal_value" ("nominal_value_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."patient_attribute_value" ADD CONSTRAINT "FK_patient_attribute_value_patient" FOREIGN KEY ("patient_ii") REFERENCES "regadbschema"."patient" ("patient_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table patient_dataset
-- ----------------------------
ALTER TABLE "regadbschema"."patient_dataset" ADD CONSTRAINT "FK_patient_dataset_dataset" FOREIGN KEY ("dataset_ii") REFERENCES "regadbschema"."dataset" ("dataset_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."patient_dataset" ADD CONSTRAINT "FK_patient_dataset_patient" FOREIGN KEY ("patient_ii") REFERENCES "regadbschema"."patient" ("patient_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table patient_event_value
-- ----------------------------
ALTER TABLE "regadbschema"."patient_event_value" ADD CONSTRAINT "FK_patient_event_value_event" FOREIGN KEY ("event_ii") REFERENCES "regadbschema"."event" ("event_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."patient_event_value" ADD CONSTRAINT "FK_patient_event_value_event_nominal_value" FOREIGN KEY ("nominal_value_ii") REFERENCES "regadbschema"."event_nominal_value" ("nominal_value_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."patient_event_value" ADD CONSTRAINT "FK_patient_event_value_patient" FOREIGN KEY ("patient_ii") REFERENCES "regadbschema"."patient" ("patient_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table protein
-- ----------------------------
ALTER TABLE "regadbschema"."protein" ADD CONSTRAINT "FK_protein_open_reading_frame" FOREIGN KEY ("open_reading_frame_ii") REFERENCES "regadbschema"."open_reading_frame" ("open_reading_frame_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table query_definition
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition" ADD CONSTRAINT "FK_query_definition_settings_user" FOREIGN KEY ("uid") REFERENCES "regadbschema"."settings_user" ("uid") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table query_definition_parameter
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_parameter" ADD CONSTRAINT "FK_query_definition_parameter_query_definition" FOREIGN KEY ("query_definition_ii") REFERENCES "regadbschema"."query_definition" ("query_definition_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."query_definition_parameter" ADD CONSTRAINT "FK_query_definition_parameter_query_definition_parameter_type" FOREIGN KEY ("query_definition_parameter_type_ii") REFERENCES "regadbschema"."query_definition_parameter_type" ("query_definition_parameter_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table query_definition_run
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_run" ADD CONSTRAINT "FK_query_definition_run_query_definition" FOREIGN KEY ("query_definition_ii") REFERENCES "regadbschema"."query_definition" ("query_definition_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."query_definition_run" ADD CONSTRAINT "FK_query_definition_run_settings_user" FOREIGN KEY ("uid") REFERENCES "regadbschema"."settings_user" ("uid") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table query_definition_run_parameter
-- ----------------------------
ALTER TABLE "regadbschema"."query_definition_run_parameter" ADD CONSTRAINT "FK_query_definition_run_parameter_query_definition_parameter" FOREIGN KEY ("query_definition_parameter_ii") REFERENCES "regadbschema"."query_definition_parameter" ("query_definition_parameter_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."query_definition_run_parameter" ADD CONSTRAINT "FK_query_definition_run_parameter_query_definition_run" FOREIGN KEY ("query_definition_run_ii") REFERENCES "regadbschema"."query_definition_run" ("query_definition_run_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table settings_user
-- ----------------------------
ALTER TABLE "regadbschema"."settings_user" ADD CONSTRAINT "FK_settings_user_dataset" FOREIGN KEY ("dataset_ii") REFERENCES "regadbschema"."dataset" ("dataset_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."settings_user" ADD CONSTRAINT "FK_settings_user_test" FOREIGN KEY ("test_ii") REFERENCES "regadbschema"."test" ("test_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table splicing_position
-- ----------------------------
ALTER TABLE "regadbschema"."splicing_position" ADD CONSTRAINT "FK_splicing_position_protein" FOREIGN KEY ("protein_ii") REFERENCES "regadbschema"."protein" ("protein_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table test
-- ----------------------------
ALTER TABLE "regadbschema"."test" ADD CONSTRAINT "FK_test_analysis" FOREIGN KEY ("analysis_ii") REFERENCES "regadbschema"."analysis" ("analysis_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test" ADD CONSTRAINT "FK_test_test_type" FOREIGN KEY ("test_type_ii") REFERENCES "regadbschema"."test_type" ("test_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table test_nominal_value
-- ----------------------------
ALTER TABLE "regadbschema"."test_nominal_value" ADD CONSTRAINT "FK_test_nominal_value_test_type" FOREIGN KEY ("test_type_ii") REFERENCES "regadbschema"."test_type" ("test_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table test_result
-- ----------------------------
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_drug_generic" FOREIGN KEY ("generic_ii") REFERENCES "regadbschema"."drug_generic" ("generic_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_nt_sequence" FOREIGN KEY ("nt_sequence_ii") REFERENCES "regadbschema"."nt_sequence" ("nt_sequence_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_patient" FOREIGN KEY ("patient_ii") REFERENCES "regadbschema"."patient" ("patient_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_test" FOREIGN KEY ("test_ii") REFERENCES "regadbschema"."test" ("test_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_test_nominal_value" FOREIGN KEY ("nominal_value_ii") REFERENCES "regadbschema"."test_nominal_value" ("nominal_value_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_therapy" FOREIGN KEY ("therapy_ii") REFERENCES "regadbschema"."therapy" ("therapy_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_result" ADD CONSTRAINT "FK_test_result_viral_isolate" FOREIGN KEY ("viral_isolate_ii") REFERENCES "regadbschema"."viral_isolate" ("viral_isolate_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table test_type
-- ----------------------------
ALTER TABLE "regadbschema"."test_type" ADD CONSTRAINT "FK_test_type_genome" FOREIGN KEY ("genome_ii") REFERENCES "regadbschema"."genome" ("genome_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_type" ADD CONSTRAINT "FK_test_type_test_object" FOREIGN KEY ("test_object_ii") REFERENCES "regadbschema"."test_object" ("test_object_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."test_type" ADD CONSTRAINT "FK_test_type_value_type" FOREIGN KEY ("value_type_ii") REFERENCES "regadbschema"."value_type" ("value_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table therapy
-- ----------------------------
ALTER TABLE "regadbschema"."therapy" ADD CONSTRAINT "FK_therapy_patient" FOREIGN KEY ("patient_ii") REFERENCES "regadbschema"."patient" ("patient_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."therapy" ADD CONSTRAINT "FK_therapy_therapy_motivation" FOREIGN KEY ("therapy_motivation_ii") REFERENCES "regadbschema"."therapy_motivation" ("therapy_motivation_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table therapy_commercial
-- ----------------------------
ALTER TABLE "regadbschema"."therapy_commercial" ADD CONSTRAINT "FK_therapy_commercial_drug_commercial" FOREIGN KEY ("commercial_ii") REFERENCES "regadbschema"."drug_commercial" ("commercial_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."therapy_commercial" ADD CONSTRAINT "FK_therapy_commercial_therapy" FOREIGN KEY ("therapy_ii") REFERENCES "regadbschema"."therapy" ("therapy_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table therapy_generic
-- ----------------------------
ALTER TABLE "regadbschema"."therapy_generic" ADD CONSTRAINT "FK_therapy_generic_drug_generic" FOREIGN KEY ("generic_ii") REFERENCES "regadbschema"."drug_generic" ("generic_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."therapy_generic" ADD CONSTRAINT "FK_therapy_generic_therapy" FOREIGN KEY ("therapy_ii") REFERENCES "regadbschema"."therapy" ("therapy_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table user_attribute
-- ----------------------------
ALTER TABLE "regadbschema"."user_attribute" ADD CONSTRAINT "FK_user_attribute_settings_user" FOREIGN KEY ("uid") REFERENCES "regadbschema"."settings_user" ("uid") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."user_attribute" ADD CONSTRAINT "FK_user_attribute_value_type" FOREIGN KEY ("value_type_ii") REFERENCES "regadbschema"."value_type" ("value_type_ii") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table viral_isolate
-- ----------------------------
ALTER TABLE "regadbschema"."viral_isolate" ADD CONSTRAINT "FK_viral_isolate_genome" FOREIGN KEY ("genome_ii") REFERENCES "regadbschema"."genome" ("genome_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "regadbschema"."viral_isolate" ADD CONSTRAINT "FK_viral_isolate_patient" FOREIGN KEY ("patient_ii") REFERENCES "regadbschema"."patient" ("patient_ii") ON DELETE NO ACTION ON UPDATE CASCADE;
