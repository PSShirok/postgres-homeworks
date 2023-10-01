-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products
ADD constraint chk_products_unit_price CHECK (unit_price > 0)

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products
ADD constraint chk_products_discontinued CHECK (discontinued IN (0,1))

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
SELECT * INTO products_disc FROM products
WHERE discontinued = 1

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.
ВАРИАНТ 1
DELETE from order_details
where EXISTS (SELECT 1 FROM products_disc
			 WHERE order_details.product_id = products_disc.product_id);
DELETE FROM products WHERE discontinued = 1

ВАРИАНТ 2

ALTER TABLE order_details ADD CONSTRAINT fk_order_details_products
foreign key (product_id) REFERENCES products (product_id) ON DELETE CASCADE
DELETE FROM products WHERE discontinued = 1