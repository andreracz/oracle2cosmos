
BEGIN;

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY customer (customer_id,name,email) FROM STDIN;
1	John Smith	john.smith@example.com
2	Jane Doe	jane.doe@example.com
3	Bob Johnson	bob.johnson@example.com
4	Mary Williams	mary.williams@example.com
5	David Lee	david.lee@example.com
\.

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY product (product_id,name,price) FROM STDIN;
1	Apple	.5
2	Banana	.25
3	Orange	.75
4	Pear	.8
5	Grapes	1.5
6	Mango	1
7	Pineapple	2
8	Watermelon	3
9	Kiwi	.75
10	Peach	1.2
\.

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY sales (sales_id,customer_id,sales_date) FROM STDIN;
\.

SET client_encoding TO 'UTF8';
SET synchronous_commit TO off;


COPY salesitems (sales_id,product_id,quantity,price) FROM STDIN;
\.

ALTER SEQUENCE IF EXISTS iseq$$_75756 RESTART WITH 22;
ALTER SEQUENCE IF EXISTS iseq$$_75759 RESTART WITH 22;
ALTER SEQUENCE IF EXISTS iseq$$_75762 RESTART WITH 2;
COMMIT;

