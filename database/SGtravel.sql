DROP TABLE IF EXISTS nguoi_dung;

CREATE TABLE nguoi_dung (
    id VARCHAR(10) PRIMARY KEY, 
    ten_nguoi_dung VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, 
    so_dien_thoai VARCHAR(20), 
    trang_thai VARCHAR(20)
);

DROP TRIGGER IF EXISTS trg_InsertNguoiDung;

CREATE TRIGGER trg_InsertNguoiDung
ON nguoi_dung
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @newID VARCHAR(10);
    DECLARE @count INT;
    SELECT @count = COALESCE(MAX(CAST(SUBSTRING(id, 3, LEN(id) - 2) AS INT)), 0) FROM nguoi_dung;

    INSERT INTO nguoi_dung (id, ten_nguoi_dung, email, so_dien_thoai, trang_thai)
    SELECT 
        'ND' + RIGHT('0' + CAST(@count + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 2), 
        ten_nguoi_dung, 
        email, 
        so_dien_thoai, 
        trang_thai
    FROM inserted;
END;


INSERT INTO nguoi_dung (ten_nguoi_dung, email, so_dien_thoai, trang_thai)
VALUES
('Nguyễn Văn A', 'userA@example.com', '0123456789', 'Hoạt động'),
('Trần Thị B', 'userB@example.com', '0912345678', 'Khóa'),
('Lê Văn C', 'userC@example.com', '0987654321', 'Hoạt động');


select * from nguoi_dung

CREATE TABLE dia_diem (
    id VARCHAR(10) PRIMARY KEY,  
    ten_dia_diem VARCHAR(50) NOT NULL,
    dia_chi VARCHAR(200) NOT NULL,
    so_dien_thoai VARCHAR(20), 
    gio_mo_cua TIME, 
    gio_dong_cua TIME, 
    loai_hinh varchar(30) NOT NULL,
    diem_trung_binh DECIMAL(2,1), 
    gia_ca_giao_dong VARCHAR(100), 
    so_luot_danh_gia INT DEFAULT 0, 
    link_dia_diem VARCHAR(255) 
);
DROP TRIGGER IF EXISTS trg_InsertDiaDiem;

CREATE TRIGGER trg_InsertDiaDiem
ON dia_diem
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @newID VARCHAR(10);
    DECLARE @count INT;
    SELECT @count = COALESCE(MAX(CAST(SUBSTRING(id, 3, LEN(id) - 2) AS INT)), 0) FROM dia_diem;
    INSERT INTO dia_diem (id, ten_dia_diem, dia_chi, so_dien_thoai, gio_mo_cua, gio_dong_cua, loai_hinh, diem_trung_binh, gia_ca_giao_dong, so_luot_danh_gia, link_dia_diem)
    SELECT 
        'DD' + RIGHT('0' + CAST(@count + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 2), 
        ten_dia_diem, 
        dia_chi, 
        so_dien_thoai, 
        gio_mo_cua, 
        gio_dong_cua, 
        loai_hinh, 
        diem_trung_binh, 
        gia_ca_giao_dong, 
        so_luot_danh_gia, 
        link_dia_diem
    FROM inserted;
END;

INSERT INTO dia_diem (ten_dia_diem, dia_chi, so_dien_thoai, gio_mo_cua, gio_dong_cua, loai_hinh, diem_trung_binh, gia_ca_giao_dong, so_luot_danh_gia, link_dia_diem)
VALUES
('Nhà hàng A', '123 Đường ABC', '0909 123 456', '08:00', '22:00', 'Ăn Uống', 4.5, '100,000 - 500,000 VND', 120, 'https://maps.app.goo.gl/zM9VatDXS7k8LD5t6'),
('Khách sạn B', '456 Đường XYZ', '0919 456 789', '10:00', '23:00', 'Khách Sạn', 4.0, '200,000 - 1,000,000 VND', 80, 'https://maps.app.goo.gl/h4QyRJTzi8QKrWVP9');


SELECT * FROM dia_diem;
SELECT * FROM binh_luan;

CREATE TABLE binh_luan (
    id VARCHAR(10) PRIMARY KEY, 
    noi_dung TEXT NOT NULL,
    id_dia_diem VARCHAR(10),
    nguoi_dung VARCHAR(100) NOT NULL, 
    ngay_binh_luan DATE NOT NULL,
    FOREIGN KEY (id_dia_diem) REFERENCES dia_diem(id) 
);

DROP TRIGGER IF EXISTS trg_InsertBinhLuan;
CREATE TRIGGER trg_InsertBinhLuan
ON binh_luan
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COALESCE(MAX(CAST(SUBSTRING(id, 3, LEN(id) - 2) AS INT)), 0) FROM binh_luan;
    INSERT INTO binh_luan (id, noi_dung, id_dia_diem, nguoi_dung, ngay_binh_luan)
    SELECT 
        'CM' + RIGHT('00' + CAST(@count + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 2),  
        noi_dung, 
        id_dia_diem, 
        nguoi_dung, 
        ngay_binh_luan
    FROM inserted;
END;

INSERT INTO binh_luan (noi_dung, id_dia_diem, nguoi_dung, ngay_binh_luan)
VALUES
('tôi rất thích', 'DD01', 'Nguyễn Văn A', '2024-01-01'),
('Hài lòng', 'DD02', 'Trần Thị B', '2024-01-02');
SELECT * FROM binh_luan;



DROP TABLE IF EXISTS chi_tiet_dia_diem;
CREATE TABLE chi_tiet_dia_diem (
    id VARCHAR(10) PRIMARY KEY, 
    noi_dung VARCHAR(255) NOT NULL, 
    id_nguoi_dung VARCHAR(10) NOT NULL, 
    nguoi_dang VARCHAR(100) NOT NULL, 
    hinh_anh TEXT, 
    mo_ta TEXT,
    FOREIGN KEY (id_nguoi_dung) REFERENCES nguoi_dung(id) 
);


DROP TRIGGER IF EXISTS trg_InsertChiTietDiaDiem;
CREATE TRIGGER trg_InsertChiTietDiaDiem
ON chi_tiet_dia_diem
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COALESCE(MAX(CAST(SUBSTRING(id, 3, LEN(id) - 2) AS INT)), 0) 
    FROM chi_tiet_dia_diem;
    INSERT INTO chi_tiet_dia_diem (id, noi_dung, id_nguoi_dung, nguoi_dang, hinh_anh, mo_ta)
    SELECT 
        'CT' + RIGHT('00' + CAST(@count + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 2),  -- Tạo ID mới với định dạng "CTxx"
        noi_dung, 
        id_nguoi_dung,
        nguoi_dang, 
        hinh_anh, 
        mo_ta
    FROM inserted;
END;


INSERT INTO chi_tiet_dia_diem (noi_dung, id_nguoi_dung, nguoi_dang, hinh_anh, mo_ta)
VALUES
('Quán cơm gà', 'ND02', 'Trần Thị B', 'image3.jpg, image4.jpg', 'Cơm bình dân'),
('Chùa A', 'ND03', 'Lê Văn C', 'image5.jpg, image6.jpg', 'Nơi thờ cúng');



SELECT * FROM chi_tiet_dia_diem


DROP TABLE IF EXISTS danh_gia;
CREATE TABLE danh_gia (
    id VARCHAR(10) PRIMARY KEY,  
    id_dia_diem VARCHAR(10) NOT NULL, 
    ten_dia_diem VARCHAR(255) NOT NULL,
    phuc_vu DECIMAL(2,1) NOT NULL, 
    khong_gian DECIMAL(2,1) NOT NULL, 
    chat_luong DECIMAL(2,1) NOT NULL, 
    gia_ca DECIMAL(2,1) NOT NULL, 
    diem_trung_binh DECIMAL(2,1) DEFAULT 0, 
    FOREIGN KEY (id_dia_diem) REFERENCES dia_diem(id)
);
DROP TRIGGER IF EXISTS trg_InsertDanhGia;
CREATE TRIGGER trg_InsertDanhGia
ON danh_gia
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COALESCE(MAX(CAST(SUBSTRING(id, 3, LEN(id) - 2) AS INT)), 0) FROM danh_gia;
    INSERT INTO danh_gia (id, id_dia_diem, ten_dia_diem, phuc_vu, khong_gian, chat_luong, gia_ca, diem_trung_binh)
    SELECT 
        'DG' + RIGHT('00' + CAST(@count + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 2),  -- Tạo ID mới với định dạng "DGxx"
        id_dia_diem, 
        ten_dia_diem, 
        phuc_vu, 
        khong_gian, 
        chat_luong, 
        gia_ca, 
        diem_trung_binh
    FROM inserted;
END;
INSERT INTO danh_gia (id_dia_diem, ten_dia_diem, phuc_vu, khong_gian, chat_luong, gia_ca, diem_trung_binh)
VALUES
('DD01', 'Nhà hàng A', 8.5, 9.0, 8.0, 9.0, 8.0),
('DD02', 'Quán cafe B', 7.5, 8.0, 7.0, 7.0, 8.0);
SELECT * FROM danh_gia;



CREATE TABLE bao_cao (
    id varchar(10) PRIMARY KEY,
    id_dia_diem varchar(10) NOT NULL,
    noi_dung_bao_cao TEXT NOT NULL,
    id_nguoi_dung varchar(10) NOT NULL,
    ngay_bao_cao DATE NOT NULL,
    trang_thai VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_dia_diem) REFERENCES dia_diem(id),
    FOREIGN KEY (id_nguoi_dung) REFERENCES nguoi_dung(id)
);

CREATE TRIGGER trg_InsertBaoCao
ON bao_cao
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COALESCE(MAX(CAST(SUBSTRING(id, 3, LEN(id) - 2) AS INT)), 0) FROM bao_cao;
    INSERT INTO bao_cao (id, id_dia_diem, noi_dung_bao_cao, id_nguoi_dung, ngay_bao_cao, trang_thai)
    SELECT 
        'BC' + RIGHT('00' + CAST(@count + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 2),  
        id_dia_diem, 
        noi_dung_bao_cao, 
        id_nguoi_dung, 
        ngay_bao_cao, 
        trang_thai
    FROM inserted;
END;
INSERT INTO bao_cao (id_dia_diem, noi_dung_bao_cao, id_nguoi_dung, ngay_bao_cao, trang_thai)
VALUES
('DD01', 'Bài viết chứa nội dung không phù hợp', 'ND03', '2024-10-01', 'Đang xử lý'),
('DD02', 'Bài viết chứa thông tin sai lệch', 'ND02', '2024-10-02', 'Đã xử lý');

select * from bao_cao