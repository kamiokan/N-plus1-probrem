-- 市場名テーブルの作成
CREATE TABLE marckets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 業種分類テーブルの作成
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 株式銘柄テーブルの作成
CREATE TABLE stocks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    stock_code INT UNSIGNED,
    name VARCHAR(200),
    marcket_id INT,
    category_id INT,
    share_unit_number VARCHAR(200),
    is_nikkei225 INT DEFAULT 0 NOT NULL,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_marcket_id
        FOREIGN KEY (marcket_id) 
        REFERENCES marckets (id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_category_id
        FOREIGN KEY (category_id) 
        REFERENCES categories (id)
        ON DELETE RESTRICT
);
