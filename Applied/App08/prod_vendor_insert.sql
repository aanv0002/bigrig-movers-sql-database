/*
AI Prompt:
generate insert statements for the product table and vendor table
The data must include five vendors and ten products. Two vendors must have no products and two products must have a prod_stock below 10.

AI Output:
*/

-- ==========================================
-- INSERT STATEMENTS FOR VENDOR TABLE (5 Vendors)
-- ==========================================
INSERT INTO vendor (vendor_id, vendor_name, vendor_phone) VALUES (101, 'TechSupply', '0412345678');
INSERT INTO vendor (vendor_id, vendor_name, vendor_phone) VALUES (102, 'GlobalTools', '0423456789');
INSERT INTO vendor (vendor_id, vendor_name, vendor_phone) VALUES (103, 'OfficeHub', '0434567890');
INSERT INTO vendor (vendor_id, vendor_name, vendor_phone) VALUES (104, 'EcoGoods', '0445678901');
INSERT INTO vendor (vendor_id, vendor_name, vendor_phone) VALUES (105, 'ApexIndustries', '0456789012');

-- ==========================================
-- INSERT STATEMENTS FOR PRODUCT TABLE (10 Products)
-- ==========================================
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1001, 'Wireless Mouse', 25.50, 50, 101);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1002, 'Mechanical Keyboard', 89.99, 5, 101);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1003, 'HD Monitor', 150.00, 12, 101);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1004, 'Hammer', 15.75, 100, 102);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1005, 'Screwdriver Set', 19.99, 4, 102);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1006, 'Power Drill', 75.00, 20, 102);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1007, 'Ergonomic Chair', 299.99, 15, 103);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1008, 'Desk Lamp', 34.50, 45, 103);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1009, 'Notebook', 4.99, 130, 103);
INSERT INTO product (prod_no, prod_name, prod_price, prod_stock, vendor_id) VALUES (1010, 'Gel Pens Pack', 9.99, 80, 103);


COMMIT;