-- Tạo cơ sở dữ liệu
CREATE DATABASE IF NOT EXISTS medical_service;
USE medical_service;

-- Tạo bảng bệnh nhân
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

-- Tạo bảng bác sĩ
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    years_of_experience INT
);

-- Tạo bảng lịch hẹn
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason VARCHAR(255),
    status VARCHAR(50) DEFAULT 'pending',
    CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT fk_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Dữ liệu mẫu
INSERT INTO patients (full_name, date_of_birth, gender, address, phone_number, email)
VALUES 
('Nguyen A', '2010-01-01', 'Male', 'Ha noi', '123456789', 'nguyen_a@gmail.com'),
('Nguyen B', '1990-05-20', 'Female', 'Ha noi', '987654321', 'nguyen_b@gmail.com'),
('Tran C', '1985-12-15', 'Male', 'Da nang', '567890123', 'tran_c@gmail.com');

INSERT INTO doctors (full_name, specialization, phone_number, email, years_of_experience)
VALUES 
('Nguyen Si', 'Cardiology', '123456789', 'nguyen_si@gmail.com', 10),
('Tran Binh', 'Neurology', '987654321', 'tran_binh@gmail.com', 8),
('Le Hoa', 'Dermatology', '567890123', 'le_hoa@gmail.com', 5),
('Pham Anh', 'Pediatrics', '112233445', 'pham_anh@gmail.com', 7),
('Doan Minh', 'Radiology', '998877665', 'doan_minh@gmail.com', 6);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason, status)
VALUES 
(1, 1, '2024-11-29 09:00:00', 'Routine check-up', 'pending'),
(2, 2, '2024-11-29 10:30:00', 'Follow-up visit', 'pending'),
(1, 3, '2024-11-29 14:00:00', 'Consultation', 'done');
