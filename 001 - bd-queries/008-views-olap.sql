CREATE OR ALTER VIEW V_FT_ORDERS AS
SELECT O.order_id, OI.item_id, O.customer_id, O.store_id, O.staff_id, O.order_date, O.required_date,O.shipped_date, OI.product_id, OI.quantity, OI.discount
FROM sales.orders AS O
INNER JOIN SALES.order_items AS OI
ON O.order_id = OI.order_id
GO

CREATE OR ALTER VIEW V_DIM_PRODUCTS AS
SELECT P.product_id, P.product_name, C.category_name,b.brand_name, P.model_year, P.list_price
FROM production.products AS P
INNER JOIN production.brands AS B
ON P.brand_id = B.brand_id
INNER JOIN production.categories AS C
ON P.category_id = C.category_id
GO