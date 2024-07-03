
BEGIN;

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Book"
(
    book_id serial,
    title character varying NOT NULL,
    genre character varying NOT NULL,
    publisher_id bigint NOT NULL,
    publication_year character varying NOT NULL,
    PRIMARY KEY (book_id)
);

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Authors"
(
    author_id serial,
    author_name character varying NOT NULL,
    birth_date date,
    nationality character varying,
    PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Publishers"
(
    publisher_id serial,
    publisher_name character varying NOT NULL,
    country character varying NOT NULL,
    PRIMARY KEY (publisher_id)
);

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Customers"
(
    customer_id serial,
    customer_name character varying NOT NULL,
    email character varying NOT NULL,
    address character varying,
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Orders"
(
    order_id serial,
    order_date date,
    customer_id bigint NOT NULL,
    total_amount numeric,
    PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Book_Authors"
(
    book_id bigint,
    author_id bigint
);

CREATE TABLE IF NOT EXISTS "FELLOW_TEST"."Order_Items"
(
    order_id bigint,
    book_id bigint
);

ALTER TABLE IF EXISTS "FELLOW_TEST"."Book"
    ADD CONSTRAINT publisher_id FOREIGN KEY (publisher_id)
    REFERENCES "FELLOW_TEST"."Publishers" (publisher_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "FELLOW_TEST"."Orders"
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id)
    REFERENCES "FELLOW_TEST"."Customers" (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "FELLOW_TEST"."Book_Authors"
    ADD CONSTRAINT author_id FOREIGN KEY (author_id)
    REFERENCES "FELLOW_TEST"."Authors" (author_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "FELLOW_TEST"."Book_Authors"
    ADD CONSTRAINT book_id FOREIGN KEY (book_id)
    REFERENCES "FELLOW_TEST"."Book" (book_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "FELLOW_TEST"."Order_Items"
    ADD CONSTRAINT order_id FOREIGN KEY (order_id)
    REFERENCES "FELLOW_TEST"."Orders" (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "FELLOW_TEST"."Order_Items"
    ADD CONSTRAINT book_id FOREIGN KEY (book_id)
    REFERENCES "FELLOW_TEST"."Book" (book_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;