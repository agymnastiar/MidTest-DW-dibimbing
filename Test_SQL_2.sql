--SQL 2
CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought

SELECT item
FROM (
    SELECT item, COUNT(*) as total_bought
    FROM item_bought
    GROUP BY item
) AS item_jumlah
WHERE total_bought != (
    SELECT MAX(total_bought)
    FROM (
        SELECT COUNT(*) as total_bought
        FROM item_bought
        GROUP BY item
    ) AS max_jumlah
)
AND total_bought != (
    SELECT MIN(total_bought)
    FROM (
        SELECT COUNT(*) as total_bought
        FROM item_bought
        GROUP BY item
    ) AS min_jumlah
);
