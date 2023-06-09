-- Generated by Ora2Pg, the Oracle database Schema converter, version 23.2
-- Copyright 2000-2022 Gilles DAROLD. All rights reserved.
-- DATASOURCE: dbi:Oracle:host=raczora.eastus.azurecontainer.io;service_name=XEPDB1;port=1521

SET client_encoding TO 'UTF8';

\set ON_ERROR_STOP ON

SET check_function_bodies = false;



CREATE TABLE customer (
	customer_id bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 9223372036854775807 MINVALUE 1 NO CYCLE CACHE 20 ),
	name varchar(100) NOT NULL,
	email varchar(100) NOT NULL
) ;
ALTER TABLE customer ADD PRIMARY KEY (customer_id);
ALTER TABLE customer ALTER COLUMN CUSTOMER_ID SET NOT NULL;
ALTER TABLE customer ALTER COLUMN NAME SET NOT NULL;
ALTER TABLE customer ALTER COLUMN EMAIL SET NOT NULL;


CREATE TABLE product (
	product_id bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 9223372036854775807 MINVALUE 1 NO CYCLE CACHE 20 ),
	name varchar(100) NOT NULL,
	price decimal(10,2) NOT NULL
) ;
ALTER TABLE product ADD PRIMARY KEY (product_id);
ALTER TABLE product ALTER COLUMN PRODUCT_ID SET NOT NULL;
ALTER TABLE product ALTER COLUMN NAME SET NOT NULL;
ALTER TABLE product ALTER COLUMN PRICE SET NOT NULL;


CREATE TABLE sales (
	sales_id bigint GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 9223372036854775807 MINVALUE 1 NO CYCLE CACHE 20 ),
	customer_id bigint NOT NULL,
	sales_date timestamp NOT NULL
) ;
ALTER TABLE sales ADD PRIMARY KEY (sales_id);
ALTER TABLE sales ALTER COLUMN SALES_ID SET NOT NULL;
ALTER TABLE sales ALTER COLUMN CUSTOMER_ID SET NOT NULL;
ALTER TABLE sales ALTER COLUMN SALES_DATE SET NOT NULL;


CREATE TABLE salesitems (
	sales_id bigint NOT NULL,
	product_id bigint NOT NULL,
	quantity bigint NOT NULL,
	price decimal(10,2) NOT NULL
) ;
ALTER TABLE salesitems ADD PRIMARY KEY (sales_id,product_id);
ALTER TABLE salesitems ALTER COLUMN SALES_ID SET NOT NULL;
ALTER TABLE salesitems ALTER COLUMN PRODUCT_ID SET NOT NULL;
ALTER TABLE salesitems ALTER COLUMN QUANTITY SET NOT NULL;
ALTER TABLE salesitems ALTER COLUMN PRICE SET NOT NULL;
ALTER TABLE sales ADD CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE salesitems ADD CONSTRAINT fk_sales_items_product FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE salesitems ADD CONSTRAINT fk_sales_items_sales FOREIGN KEY (sales_id) REFERENCES sales(sales_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
