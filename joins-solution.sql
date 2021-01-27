1. --get all the customers and their addresses
SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".id;
2. --Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, FROM "line_items".quantity, "products".description FROM "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id
JOIN "products" ON "line_items".product_id = "products".id;
3.--Which warehouses have cheetos?
SELECT "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "warehouse_product".product_id= "products".id
JOIN  "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description LIKE 'cheetos';
4.--Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description LIKE 'diet pepsi';
5. --Get the number of orders for each customer. NOTE: It is OK if those without
--orders are not included in results.
SELECT "customers".first_name, COUNT("orders".id) FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".first_name;

6. --How many customers do we have?
SELECT COUNT(*) FROM "customers";
7. --How many products do we carry?
SELECT COUNT(*) FROM "products";
8. --What is the total available on-hand quantity of diet pepsi?
SELECT "products".description, SUM("warehouse_product".on_hand) FROM "products"
JOIN "warehouse_product" ON "warehouse_Product".product_id = "products".id
WHERE "products".description LIKE 'diet pepsi'
GROUP BY "products".description;