--create user table
CREATE TABLE users (
 user_id SERIAL PRIMARY KEY,
 name VARCHAR (150) NOT NULL,
 email VARCHAR (100) NOT NULL UNIQUE,
 password VARCHAR (50) DEFAULT '12345',
 phone VARCHAR (20),
 role VARCHAR (30) CHECK(role IN ('Admin', 'Customer')) DEFAULT 'Customer'
);


--create vehicles
CREATE TABLE vehicles (
  vehicle_id SERIAL PRIMARY KEY,
  name VARCHAR (100) NOT NULL,
  type VARCHAR (30) CHECK(type IN ('car','bike','truck')),
  model VARCHAR (50) NOT NULL,
  registration_number VARCHAR (150) NOT NULL UNIQUE,
  rental_price INT NOT NULL,
  status VARCHAR (30) CHECK(status IN ('available','rented','maintenance')) DEFAULT 'available'
);

  
--create bookings
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users (user_id),
  vehicle_id INT NOT NULL REFERENCES vehicles (vehicle_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL CHECK (end_date>start_date),
  status  VARCHAR (30) NOT NULL CHECK(status IN ('pending','confirmed','completed','cancelled')),
  total_cost INT NOT NULL
  );

--insert user
INSERT INTO users (name, email, password, phone)
VALUES
  ('solim Uddin', 'solim.uddin@gmail.com', 'rahim@123', '01712345678'),
  ('Karim Hossain', 'karim.hossain@yahoo.com', 'karim@123', '01823456789'),
  ('Nusrat Jahan', 'nusrat.jahan@gmail.com', 'nusrat@123', '01934567890');

INSERT INTO users (name, email, password, phone, role)
VALUES
  ('Md. Hasan Ali', 'hasan.admin@company.com', 'admin@123', '01645678901', 'Admin');


-- insert vehicles
INSERT INTO vehicles (name, type, model, registration_number, rental_price, status)
VALUES
  ('Toyota Corolla', 'car', '2021', 'DHAKA-METRO-GA-101010', 4500, 'available'),
  ('Honda Civic', 'car', '2022', 'DHAKA-METRO-GA-202020', 5500, 'rented'),
  ('Nissan X-Trail', 'car', '2020', 'DHAKA-METRO-GA-303030', 6000, 'available'),
  ('Yamaha FZ-S', 'bike', '2019', 'DHAKA-METRO-LA-404040', 1200, 'maintenance'),
  ('Suzuki Gixxer', 'bike', '2021', 'DHAKA-METRO-LA-505050', 1500, 'available'),
  ('Honda CB Hornet', 'bike', '2022', 'DHAKA-METRO-LA-606060', 1800, 'rented'),
  ('Tata Ace', 'truck', '2018', 'DHAKA-METRO-TA-707070', 7000, 'available'),
  ('Isuzu NPR', 'truck', '2019', 'DHAKA-METRO-TA-808080', 8500, 'maintenance'),
  ('Toyota Hiace', 'truck', '2020', 'DHAKA-METRO-DA-909090', 8000, 'available'),
  ('Mitsubishi L200', 'truck', '2021', 'DHAKA-METRO-TA-111111', 9000, 'rented');


-- insert bookings
INSERT INTO bookings
(user_id, vehicle_id, start_date, end_date, status, total_cost)
VALUES
(1, 1, '2025-01-05', '2025-01-08', 'confirmed', 13500),
(1, 2, '2025-02-01', '2025-02-03', 'completed', 11000),
(1, 3, '2025-03-10', '2025-03-13', 'pending', 18000),
(2, 1, '2025-01-12', '2025-01-14', 'confirmed', 2400),
(2, 2, '2025-02-20', '2025-02-23', 'completed', 4500),
(2, 3, '2025-03-01', '2025-03-04', 'cancelled', 3600),
(3, 1, '2025-01-18', '2025-01-20', 'confirmed', 14000),
(3, 2, '2025-02-25', '2025-02-27', 'pending', 17000);


--query-1
SELECT booking_id, u.name AS customer_name, v.name AS vehicle_name, start_date, end_date, b.status FROM bookings AS b
LEFT JOIN users AS u ON u.user_id= b.user_id
LEFT JOIN vehicles AS v ON v.vehicle_id=b.vehicle_id;

--query-2
SELECT v.* FROM vehicles AS v
LEFT JOIN bookings AS b ON v.vehicle_id= b.vehicle_id
WHERE booking_id IS NULL;

--query-3
SELECT * FROM vehicles
WHERE type='car';

--query-4
SELECT v.name AS vehicle_name, COUNT(*) AS total_bookings FROM bookings AS b
LEFT JOIN vehicles AS v ON b.vehicle_id= v.vehicle_id
GROUP BY v.name
HAVING COUNT(*)>2;
