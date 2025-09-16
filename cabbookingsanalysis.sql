-- Create Database
CREATE DATABASE CabBookingSystem;
USE CabBookingSystem;

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(50),
    city VARCHAR(50),
    registration_date DATE
);

-- 2. Drivers Table
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    license_no VARCHAR(20) UNIQUE,
    rating DECIMAL(2,1),
    status ENUM('Available','On Trip','Inactive') DEFAULT 'Available'
);

-- 3. Cabs Table
CREATE TABLE Cabs (
    cab_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT,
    cab_number VARCHAR(15) UNIQUE,
    cab_type ENUM('Mini','Sedan','SUV','Luxury'),
    capacity INT,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- 4. Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    cab_id INT,
    booking_time DATETIME,
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    status ENUM('Ongoing','Completed','Cancelled') DEFAULT 'Ongoing',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (cab_id) REFERENCES Cabs(cab_id)
);

-- 5. TripDetails Table
CREATE TABLE TripDetails (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    distance_km DECIMAL(5,2),
    duration_min INT,
    fare DECIMAL(8,2),
    payment_mode ENUM('Cash','UPI','Card','Wallet'),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- 6. Feedback Table
CREATE TABLE Feedback(
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    driver_id INT,
    rating DECIMAL(2,1),
    comments VARCHAR(255),
    feedback_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Use Database
USE CabBookingSystem;

-- -----------------------
-- Insert Customers (50)
-- -----------------------
INSERT INTO Customers (name, phone, email, city, registration_date) VALUES
('Rahul Sharma','9876543100','rahul.sharma@gmail.com','Bangalore','2023-01-15'),
('Priya Singh','9876543101','priya.singh@gmail.com','Delhi','2023-02-12'),
('Amit Verma','9876543102','amit.verma@gmail.com','Mumbai','2023-03-08'),
('Sneha Reddy','9876543103','sneha.reddy@gmail.com','Hyderabad','2023-04-21'),
('Karan Gupta','9876543104','karan.gupta@gmail.com','Chennai','2023-05-10'),
('Neha Patel','9876543105','neha.patel@gmail.com','Pune','2023-06-11'),
('Arjun Mehta','9876543106','arjun.mehta@gmail.com','Kolkata','2023-07-03'),
('Simran Kaur','9876543107','simran.kaur@gmail.com','Amritsar','2023-07-25'),
('Rohit Yadav','9876543108','rohit.yadav@gmail.com','Lucknow','2023-08-13'),
('Isha Malhotra','9876543109','isha.malhotra@gmail.com','Noida','2023-09-18'),
('Varun Nair','9876543110','varun.nair@gmail.com','Cochin','2023-10-20'),
('Anjali Das','9876543111','anjali.das@gmail.com','Kolkata','2023-10-25'),
('Naveen Kumar','9876543112','naveen.kumar@gmail.com','Chennai','2023-11-02'),
('Meera Joshi','9876543113','meera.joshi@gmail.com','Bangalore','2023-11-19'),
('Ritika Sharma','9876543114','ritika.sharma@gmail.com','Delhi','2023-12-01'),
('Aditya Rao','9876543115','aditya.rao@gmail.com','Hyderabad','2023-12-05'),
('Tanya Kapoor','9876543116','tanya.kapoor@gmail.com','Mumbai','2023-12-15'),
('Manish Gupta','9876543117','manish.gupta@gmail.com','Pune','2024-01-10'),
('Pooja Shah','9876543118','pooja.shah@gmail.com','Ahmedabad','2024-01-25'),
('Rajeev Sinha','9876543119','rajeev.sinha@gmail.com','Patna','2024-02-05'),
('Aakash Jain','9876543120','aakash.jain@gmail.com','Jaipur','2024-02-15'),
('Divya Rani','9876543121','divya.rani@gmail.com','Gurgaon','2024-03-01'),
('Sahil Khan','9876543122','sahil.khan@gmail.com','Lucknow','2024-03-12'),
('Ramesh Iyer','9876543123','ramesh.iyer@gmail.com','Cochin','2024-03-25'),
('Bhavna Desai','9876543124','bhavna.desai@gmail.com','Surat','2024-04-01'),
('Kavya Bhat','9876543125','kavya.bhat@gmail.com','Mangalore','2024-04-10'),
('Yash Malhotra','9876543126','yash.malhotra@gmail.com','Delhi','2024-04-20'),
('Snehal Pawar','9876543127','snehal.pawar@gmail.com','Mumbai','2024-04-29'),
('Akash Pillai','9876543128','akash.pillai@gmail.com','Trivandrum','2024-05-05'),
('Shreya Ghosh','9876543129','shreya.ghosh@gmail.com','Kolkata','2024-05-18'),
('Deepak Kulkarni','9876543130','deepak.kulkarni@gmail.com','Bangalore','2024-06-01'),
('Chaitra Shetty','9876543131','chaitra.shetty@gmail.com','Mangalore','2024-06-12'),
('Ashish Mishra','9876543132','ashish.mishra@gmail.com','Noida','2024-06-20'),
('Ankita Roy','9876543133','ankita.roy@gmail.com','Guwahati','2024-07-01'),
('Vivek Saini','9876543134','vivek.saini@gmail.com','Jaipur','2024-07-15'),
('Rohini Patil','9876543135','rohini.patil@gmail.com','Pune','2024-07-20'),
('Prakash Menon','9876543136','prakash.menon@gmail.com','Cochin','2024-08-05'),
('Geeta Sharma','9876543137','geeta.sharma@gmail.com','Chandigarh','2024-08-10'),
('Arvind Rao','9876543138','arvind.rao@gmail.com','Hyderabad','2024-08-20'),
('Sunil Chauhan','9876543139','sunil.chauhan@gmail.com','Delhi','2024-08-25'),
('Payal Jain','9876543140','payal.jain@gmail.com','Mumbai','2024-09-05'),
('Harshita Verma','9876543141','harshita.verma@gmail.com','Gurgaon','2024-09-10'),
('Kunal Shah','9876543142','kunal.shah@gmail.com','Ahmedabad','2024-09-20'),
('Ritu Agarwal','9876543143','ritu.agarwal@gmail.com','Lucknow','2024-09-25'),
('Aarav Khanna','9876543144','aarav.khanna@gmail.com','Noida','2024-10-01'),
('Ishita Sinha','9876543145','ishita.sinha@gmail.com','Patna','2024-10-10'),
('Parth Goyal','9876543146','parth.goyal@gmail.com','Chandigarh','2024-10-15'),
('Krishna Das','9876543147','krishna.das@gmail.com','Kolkata','2024-10-20'),
('Rekha Nair','9876543148','rekha.nair@gmail.com','Trivandrum','2024-10-25'),
('Mohan Lal','9876543149','mohan.lal@gmail.com','Jaipur','2024-11-01');

-- -----------------------
-- Insert Drivers (30)
-- -----------------------
INSERT INTO Drivers (name, phone, license_no, rating, status) VALUES
('Ramesh Kumar','9991112200','DL12345',4.5,'Available'),
('Suresh Mehta','9991112201','DL12346',4.2,'Available'),
('Ajay Rao','9991112202','DL12347',3.8,'On Trip'),
('Vikram Nair','9991112203','DL12348',4.0,'Available'),
('Dinesh Shetty','9991112204','DL12349',3.9,'Available'),
('Rahul Patil','9991112205','DL12350',4.7,'Available'),
('Imran Khan','9991112206','DL12351',4.4,'Inactive'),
('Praveen Yadav','9991112207','DL12352',3.5,'Available'),
('Arvind Joshi','9991112208','DL12353',4.1,'Available'),
('Kishore Naik','9991112209','DL12354',3.6,'On Trip'),
('Mahesh Choudhary','9991112210','DL12355',3.9,'Available'),
('Sathish Rao','9991112211','DL12356',4.3,'Available'),
('Harish Pandey','9991112212','DL12357',3.7,'Available'),
('Gopal Reddy','9991112213','DL12358',4.0,'Inactive'),
('Nitin Jain','9991112214','DL12359',4.6,'Available'),
('Arjun Iyer','9991112215','DL12360',4.8,'Available'),
('Mohan Das','9991112216','DL12361',4.5,'Available'),
('Siddharth Mehta','9991112217','DL12362',3.4,'Available'),
('Suraj Malhotra','9991112218','DL12363',4.1,'Available'),
('Raj Malviya','9991112219','DL12364',3.3,'Available'),
('Abhishek Rawat','9991112220','DL12365',3.6,'On Trip'),
('Anil Saini','9991112221','DL12366',3.8,'Available'),
('Bhaskar Das','9991112222','DL12367',4.4,'Available'),
('Shyam Prasad','9991112223','DL12368',4.0,'Inactive'),
('Farhan Khan','9991112224','DL12369',3.2,'Available'),
('Mithun Joshi','9991112225','DL12370',4.7,'Available'),
('Ashok Rao','9991112226','DL12371',4.0,'Available'),
('Sandeep Singh','9991112227','DL12372',3.5,'Available'),
('Vishal Gupta','9991112228','DL12373',4.6,'Available'),
('Sameer Kulkarni','9991112229','DL12374',3.9,'Available');
INSERT INTO Drivers (name, phone, license_no, rating, status)
VALUES
('Anil Kumar','9991100011','DL54321',4.4,'Available'),
('Vikas Sharma','9991100012','DL54322',4.0,'On Trip'),
('Deepak Rao','9991100013','DL54323',3.6,'Available'),
('Manoj Reddy','9991100014','DL54324',4.2,'Available'),
('Ravi Patil','9991100015','DL54325',3.8,'Inactive'),
('Sanjay Kapoor','9991100016','DL54326',4.7,'Available'),
('Harish Nair','9991100017','DL54327',4.1,'On Trip'),
('Rajeev Gupta','9991100018','DL54328',3.9,'Available'),
('Sunil Mishra','9991100019','DL54329',4.5,'Available'),
('Naveen Verma','9991100020','DL54330',3.7,'Inactive'),
('Karthik Iyer','9991100021','DL54331',4.6,'Available'),
('Pawan Shetty','9991100022','DL54332',4.0,'Available'),
('Suresh Naik','9991100023','DL54333',3.5,'On Trip'),
('Vivek Sinha','9991100024','DL54334',4.3,'Available'),
('Rohit Malhotra','9991100025','DL54335',4.9,'Available'),
('Abhishek Das','9991100026','DL54336',3.6,'Inactive'),
('Girish Kulkarni','9991100027','DL54337',4.2,'Available'),
('Shashank Yadav','9991100028','DL54338',4.4,'Available'),
('Ramesh Choudhary','9991100029','DL54339',3.8,'On Trip'),
('Sameer Jain','9991100030','DL54340',4.1,'Available');


-- -----------------------
-- Insert Cabs (30)
-- -----------------------
INSERT INTO Cabs (driver_id, cab_number, cab_type, capacity) VALUES
(1,'KA01AB1234','Sedan',4),
(2,'KA01AB5678','Mini',4),
(3,'KA02CD7890','SUV',6),
(4,'KA02CD1122','Sedan',4),
(5,'KA03EF3344','Mini',4),
(6,'KA03EF5566','SUV',6),
(7,'KA04GH7788','Sedan',4),
(8,'KA04GH9900','Mini',4),
(9,'KA05AB1111','SUV',6),
(10,'KA05AB2222','Sedan',4),
(11,'KA06CD3333','Mini',4),
(12,'KA06CD4444','SUV',6),
(13,'KA07EF5555','Sedan',4),
(14,'KA07EF6666','Mini',4),
(15,'KA08GH7777','SUV',6),
(16,'KA08GH8888','Sedan',4),
(17,'KA09AB9999','Mini',4),
(18,'KA09AB0001','Sedan',4),
(19,'KA10CD0002','SUV',6),
(20,'KA10CD0003','Mini',4),
(21,'KA11EF0004','Sedan',4),
(22,'KA11EF0005','SUV',6),
(23,'KA12GH0006','Mini',4),
(24,'KA12GH0007','Sedan',4),
(25,'KA13AB0008','SUV',6),
(26,'KA13AB0009','Mini',4),
(27,'KA14CD0010','Sedan',4),
(28,'KA14CD0011','SUV',6),
(29,'KA15EF0012','Mini',4),
(30,'KA15EF0013','Sedan',4);

INSERT INTO Cabs (driver_id, cab_number, cab_type, capacity)
VALUES
(21,'KA13AB1234','Sedan',4),
(22,'KA13CD5678','Mini',4),
(23,'KA14EF2345','SUV',6),
(24,'KA14GH6789','Sedan',4),
(25,'KA15AB4321','Luxury',4),
(26,'KA15CD8765','Mini',4),
(27,'KA16EF5432','SUV',6),
(28,'KA16GH1234','Sedan',4),
(29,'KA17AB7890','Mini',4),
(30,'KA17CD3456','SUV',6),
(1,'KA18EF6543','Sedan',4),
(2,'KA18GH9876','Luxury',4),
(3,'KA19AB2345','Mini',4),
(4,'KA19CD6789','Sedan',4),
(5,'KA20EF9876','SUV',6),
(6,'KA20GH5432','Mini',4),
(7,'KA21AB1235','Sedan',4),
(8,'KA21CD5679','Mini',4),
(9,'KA22EF3456','SUV',6),
(10,'KA22GH7891','Luxury',4);


-- -----------------------
-- Bookings (80)
-- -----------------------
INSERT INTO Bookings (customer_id, cab_id, booking_time, pickup_location, drop_location, status) VALUES
(1,1,'2024-08-15 10:30:00','MG Road','Airport','Completed'),
(2,2,'2024-08-15 11:15:00','Whitefield','Electronic City','Cancelled'),
(3,3,'2024-08-16 09:45:00','Koramangala','Indiranagar','Completed'),
(4,4,'2024-08-16 12:00:00','HSR Layout','BTM Layout','Completed'),
(5,5,'2024-08-17 09:00:00','Jayanagar','Majestic','Ongoing'),
(6,6,'2024-08-18 15:20:00','Marathahalli','Airport','Completed'),
(7,7,'2024-08-19 18:45:00','Bellandur','Hebbal','Cancelled'),
(8,8,'2024-08-20 10:10:00','Koramangala','Whitefield','Completed'),
(9,9,'2024-08-20 14:30:00','BTM Layout','Electronic City','Completed'),
(10,10,'2024-08-21 08:20:00','Indiranagar','KR Puram','Completed');
-- (Add 70 more similar rows for realistic spread across customers and dates)

-- -----------------------
-- TripDetails & Feedback (Example 10)
-- -----------------------
INSERT INTO TripDetails (booking_id, distance_km, duration_min, fare, payment_mode) VALUES
(1,35.5,50,550,'UPI'),
(2,12.0,25,220,'Cash'),
(3,7.5,15,180,'UPI'),
(4,40.0,60,600,'Card'),
(5,14.2,28,250,'Wallet'),
(6,18.0,35,320,'UPI'),
(7,22.0,40,400,'Cash'),
(8,10.5,20,200,'Card'),
(9,25.0,45,450,'UPI'),
(10,7.0,15,150,'Cash'),
(11,30.0,50,500,'Wallet'),
(12,16.0,30,300,'UPI'),
(13,12.5,25,260,'Cash'),
(14,8.0,18,180,'Card'),
(15,14.8,32,310,'UPI'),
(16,20.0,38,390,'Wallet'),
(17,11.2,22,220,'UPI'),
(18,17.5,35,340,'Cash'),
(19,28.0,48,480,'Card'),
(20,9.5,18,190,'UPI'),
(21,15.0,30,300,'Wallet'),
(22,12.8,26,270,'UPI'),
(23,22.5,40,420,'Cash'),
(24,7.5,16,160,'Card'),
(25,19.0,36,360,'UPI'),
(26,14.0,28,280,'Wallet'),
(27,10.0,20,200,'UPI'),
(28,16.5,32,330,'Cash'),
(29,24.0,42,420,'Card'),
(30,8.5,17,170,'UPI'),
(31,20.5,38,400,'Wallet'),
(32,12.0,25,250,'UPI'),
(33,18.2,34,350,'Cash'),
(34,26.0,45,450,'Card'),
(35,7.8,16,160,'UPI'),
(36,15.5,30,310,'Wallet'),
(37,11.0,22,220,'UPI'),
(38,17.0,35,340,'Cash'),
(39,23.0,40,410,'Card'),
(40,9.2,18,180,'UPI'),
(41,14.5,28,290,'Wallet'),
(42,12.3,26,270,'UPI'),
(43,21.0,38,400,'Cash'),
(44,8.0,17,170,'Card'),
(45,19.5,36,360,'UPI'),
(46,13.0,27,280,'Wallet'),
(47,10.5,20,200,'UPI'),
(48,16.8,33,340,'Cash'),
(49,25.5,45,450,'Card'),
(50,7.5,16,160,'UPI');
SELECT * FROM TRIPDETAILS;

INSERT INTO Feedback (customer_id, driver_id, rating, comments, feedback_date) VALUES
(1,5,4.5,'Smooth ride and polite driver','2025-09-01'),
(2,7,3.2,'Driver was late, but trip was okay','2025-09-01'),
(3,6,5.0,'Excellent service!','2025-09-02'),
(4,9,4.0,'Comfortable ride','2025-09-02'),
(5,8,2.8,'Cab was not clean','2025-09-03'),
(6,10,4.7,'Very professional driver','2025-09-03'),
(7,11,4.2,'Quick trip, satisfied','2025-09-04'),
(8,12,3.5,'Average experience','2025-09-04'),
(9,13,5.0,'Superb ride!','2025-09-05'),
(10,14,4.6,'Driver was helpful','2025-09-05'),
(11,15,3.0,'Cab AC was not working','2025-09-06'),
(12,16,4.8,'Very smooth and safe driving','2025-09-06'),
(13,17,4.0,'Good experience','2025-09-07'),
(14,18,2.9,'Driver took a longer route','2025-09-07'),
(15,19,4.4,'Clean cab and friendly driver','2025-09-08'),
(16,20,3.7,'Delay at pickup','2025-09-08'),
(17,21,4.5,'Everything was good','2025-09-09'),
(18,22,4.1,'Satisfied with the service','2025-09-09'),
(19,23,3.8,'Slightly overpriced','2025-09-10'),
(20,24,4.9,'Perfect ride','2025-09-10'),
(1,25,4.0,'Comfortable ride','2025-09-11'),
(2,26,3.6,'Driver was polite','2025-09-11'),
(3,27,4.7,'Very good','2025-09-12'),
(4,28,4.3,'Clean cab','2025-09-12'),
(5,29,3.5,'Average','2025-09-13'),
(6,30,5.0,'Fantastic experience','2025-09-13'),
(7,1,4.9,'Super smooth ride','2025-09-14'),
(8,2,3.9,'Little late but okay','2025-09-14'),
(9,3,4.8,'Loved the ride','2025-09-15'),
(10,4,4.4,'Very good service','2025-09-15'),
(11,5,4.2,'Nice and polite driver','2025-09-16'),
(12,6,3.8,'Trip was delayed','2025-09-16'),
(13,7,4.5,'Cab was clean','2025-09-17'),
(14,8,4.1,'Driver was professional','2025-09-17'),
(15,9,3.7,'Average ride','2025-09-18'),
(16,10,4.9,'Excellent service','2025-09-18'),
(17,11,4.3,'Smooth trip','2025-09-19'),
(18,12,3.5,'Driver took longer route','2025-09-19'),
(19,13,4.8,'Comfortable and safe','2025-09-20'),
(20,14,4.0,'Good experience','2025-09-20'),
(1,15,4.6,'Very polite driver','2025-09-21'),
(2,16,3.9,'Trip slightly delayed','2025-09-21'),
(3,17,4.7,'Excellent ride','2025-09-22'),
(4,18,4.2,'Driver was courteous','2025-09-22'),
(5,19,3.6,'Cab was not very clean','2025-09-23'),
(6,20,5.0,'Amazing experience','2025-09-23'),
(7,21,4.4,'Good ride','2025-09-24'),
(8,22,3.8,'Driver late','2025-09-24'),
(9,23,4.9,'Perfect service','2025-09-25'),
(10,24,4.1,'Very satisfied','2025-09-25'),
(11,25,3.7,'Average trip','2025-09-26'),
(12,26,4.5,'Nice and clean cab','2025-09-26'),
(13,27,4.0,'Comfortable ride','2025-09-27'),
(14,28,3.9,'Driver polite','2025-09-27'),
(15,29,4.6,'Very good','2025-09-28'),
(16,30,4.8,'Excellent service','2025-09-28'),
(17,1,4.3,'Smooth ride','2025-09-29'),
(18,2,3.6,'Trip slightly delayed','2025-09-29'),
(19,3,4.9,'Great experience','2025-09-30'),
(20,4,4.0,'Satisfied','2025-09-30'),
(1,5,4.7,'Nice trip','2025-10-01'),
(2,6,3.8,'Driver was okay','2025-10-01'),
(3,7,4.6,'Comfortable and safe','2025-10-02'),
(4,8,4.2,'Good service','2025-10-02'),
(5,9,3.5,'Average experience','2025-10-03'),
(6,10,4.9,'Excellent driver','2025-10-03'),
(7,11,4.1,'Smooth and safe ride','2025-10-04'),
(8,12,3.7,'Trip delayed','2025-10-04'),
(9,13,4.8,'Very polite driver','2025-10-05'),
(10,14,4.0,'Good and comfortable','2025-10-05');
INSERT INTO Feedback (customer_id, driver_id, rating, comments, feedback_date)
VALUES
(5, 3, 2.5, 'Driver was late', CURDATE() - INTERVAL 10 DAY),
(6, 4, 2.0, 'Cab not clean', CURDATE() - INTERVAL 15 DAY),
(7, 5, 1.8, 'Driver was rude', CURDATE() - INTERVAL 20 DAY);

select * from FEEDBACK;


select * from customers;

INSERT INTO Customers (name, phone, email, city, registration_date) VALUES
('Raghav Kapoor','9876543150','raghav.kapoor@gmail.com','Bangalore','2024-11-10'),
('Sanya Bhatia','9876543151','sanya.bhatia@gmail.com','Delhi','2024-11-15'),
('Omkar Patil','9876543152','omkar.patil@gmail.com','Mumbai','2024-11-20'),
('Zoya Khan','9876543153','zoya.khan@gmail.com','Hyderabad','2024-11-25'),
('Harshit Jain','9876543154','harshit.jain@gmail.com','Pune','2024-11-30'),
('Tanvi Desai','9876543155','tanvi.desai@gmail.com','Ahmedabad','2024-12-02'),
('Lakshya Singh','9876543156','lakshya.singh@gmail.com','Lucknow','2024-12-05'),
('Avni Mehta','9876543157','avni.mehta@gmail.com','Noida','2024-12-08'),
('Kabir Sharma','9876543158','kabir.sharma@gmail.com','Jaipur','2024-12-10'),
('Dia Choudhary','9876543159','dia.choudhary@gmail.com','Chennai','2024-12-12'),
('Aryan Verma','9876543160','aryan.verma@gmail.com','Gurgaon','2024-12-15'),
('Muskan Reddy','9876543161','muskan.reddy@gmail.com','Hyderabad','2024-12-18'),
('Irfan Sheikh','9876543162','irfan.sheikh@gmail.com','Mumbai','2024-12-20'),
('Shivani Nair','9876543163','shivani.nair@gmail.com','Cochin','2024-12-22'),
('Hrithik Rao','9876543164','hrithik.rao@gmail.com','Bangalore','2024-12-24'),
('Ankush Malhotra','9876543165','ankush.malhotra@gmail.com','Delhi','2024-12-26'),
('Prachi Sharma','9876543166','prachi.sharma@gmail.com','Pune','2024-12-28'),
('Devang Joshi','9876543167','devang.joshi@gmail.com','Ahmedabad','2025-01-02'),
('Ishaan Yadav','9876543168','ishaan.yadav@gmail.com','Lucknow','2025-01-05'),
('Ananya Das','9876543169','ananya.das@gmail.com','Kolkata','2025-01-07'),
('Krish Agarwal','9876543170','krish.agarwal@gmail.com','Jaipur','2025-01-10'),
('Manya Iyer','9876543171','manya.iyer@gmail.com','Chennai','2025-01-12'),
('Adarsh Rathi','9876543172','adarsh.rathi@gmail.com','Mumbai','2025-01-15'),
('Palak Sinha','9876543173','palak.sinha@gmail.com','Patna','2025-01-18'),
('Virat Chauhan','9876543174','virat.chauhan@gmail.com','Delhi','2025-01-20'),
('Diya Menon','9876543175','diya.menon@gmail.com','Cochin','2025-01-23'),
('Shlok Shah','9876543176','shlok.shah@gmail.com','Ahmedabad','2025-01-25'),
('Aarohi Gupta','9876543177','aarohi.gupta@gmail.com','Gurgaon','2025-01-28'),
('Rudra Pillai','9876543178','rudra.pillai@gmail.com','Trivandrum','2025-01-30'),
('Keya Bhatt','9876543179','keya.bhatt@gmail.com','Surat','2025-02-02'),
('Vedant Kulkarni','9876543180','vedant.kulkarni@gmail.com','Pune','2025-02-05'),
('Niharika Saini','9876543181','niharika.saini@gmail.com','Jaipur','2025-02-08'),
('Ayaan Qureshi','9876543182','ayaan.qureshi@gmail.com','Delhi','2025-02-10'),
('Tara Roy','9876543183','tara.roy@gmail.com','Kolkata','2025-02-13'),
('Kabir Nanda','9876543184','kabir.nanda@gmail.com','Chandigarh','2025-02-15'),
('Rhea Mukherjee','9876543185','rhea.mukherjee@gmail.com','Kolkata','2025-02-18'),
('Atharv Pandey','9876543186','atharv.pandey@gmail.com','Noida','2025-02-20'),
('Sara Malviya','9876543187','sara.malviya@gmail.com','Lucknow','2025-02-23'),
('Aadi Reddy','9876543188','aadi.reddy@gmail.com','Hyderabad','2025-02-25'),
('Navya Kapoor','9876543189','navya.kapoor@gmail.com','Delhi','2025-02-28'),
('Pranay Singh','9876543190','pranay.singh@gmail.com','Gurgaon','2025-03-02'),
('Saanvi Jain','9876543191','saanvi.jain@gmail.com','Jaipur','2025-03-05'),
('Eshan Malhotra','9876543192','eshan.malhotra@gmail.com','Mumbai','2025-03-07'),
('Ritika Iyer','9876543193','ritika.iyer@gmail.com','Chennai','2025-03-10'),
('Aaryan Chauhan','9876543194','aaryan.chauhan@gmail.com','Delhi','2025-03-12'),
('Lavanya Das','9876543195','lavanya.das@gmail.com','Kolkata','2025-03-15'),
('Reyansh Khurana','9876543196','reyansh.khurana@gmail.com','Bangalore','2025-03-18'),
('Ira Bansal','9876543197','ira.bansal@gmail.com','Delhi','2025-03-20'),
('Samar Gupta','9876543198','samar.gupta@gmail.com','Pune','2025-03-22'),
('Megha Reddy','9876543199','megha.reddy@gmail.com','Hyderabad','2025-03-25'),
('Shaurya Rathore','9876543200','shaurya.rathore@gmail.com','Jaipur','2025-03-28'),
('Aadhya Mehta','9876543201','aadhya.mehta@gmail.com','Ahmedabad','2025-03-30'),
('Pari Chatterjee','9876543202','pari.chatterjee@gmail.com','Kolkata','2025-04-02'),
('Dev Rathod','9876543203','dev.rathod@gmail.com','Surat','2025-04-04'),
('Kiara Malhotra','9876543204','kiara.malhotra@gmail.com','Delhi','2025-04-07'),
('Arya Sharma','9876543205','arya.sharma@gmail.com','Mumbai','2025-04-10'),
('Rudraksh Sethi','9876543206','rudraksh.sethi@gmail.com','Bangalore','2025-04-12'),
('Samaira Roy','9876543207','samaira.roy@gmail.com','Kolkata','2025-04-15'),
('Arnav Deshmukh','9876543208','arnav.deshmukh@gmail.com','Pune','2025-04-17'),
('Aanya Saxena','9876543209','aanya.saxena@gmail.com','Delhi','2025-04-20'),
('Ishaan Gupta','9876543210','ishaan.gupta@gmail.com','Noida','2025-04-22'),
('Suhana Menon','9876543211','suhana.menon@gmail.com','Cochin','2025-04-25'),
('Kabir Raj','9876543212','kabir.raj@gmail.com','Bangalore','2025-04-28'),
('Vanya Kapoor','9876543213','vanya.kapoor@gmail.com','Delhi','2025-04-30'),
('Shaurya Nanda','9876543214','shaurya.nanda@gmail.com','Gurgaon','2025-05-02'),
('Charvi Sharma','9876543215','charvi.sharma@gmail.com','Lucknow','2025-05-05'),
('Atharv Singh','9876543216','atharv.singh@gmail.com','Jaipur','2025-05-08'),
('Risha Goyal','9876543217','risha.goyal@gmail.com','Delhi','2025-05-10'),
('Aryan Khanna','9876543218','aryan.khanna@gmail.com','Mumbai','2025-05-12'),
('Sanya Patel','9876543219','sanya.patel@gmail.com','Ahmedabad','2025-05-15'),
('Kabir Bansal','9876543220','kabir.bansal@gmail.com','Chandigarh','2025-05-18'),
('Aarav Sinha','9876543221','aarav.sinha@gmail.com','Patna','2025-05-20'),
('Mira Rathi','9876543222','mira.rathi@gmail.com','Noida','2025-05-23'),
('Yuvraj Chauhan','9876543223','yuvraj.chauhan@gmail.com','Delhi','2025-05-25'),
('Jiya Malhotra','9876543224','jiya.malhotra@gmail.com','Mumbai','2025-05-27'),
('Advait Shah','9876543225','advait.shah@gmail.com','Ahmedabad','2025-05-30'),
('Ridhi Kapoor','9876543226','ridhi.kapoor@gmail.com','Bangalore','2025-06-02'),
('Shaurya Jain','9876543227','shaurya.jain@gmail.com','Gurgaon','2025-06-05'),
('Sia Bhatia','9876543228','sia.bhatia@gmail.com','Delhi','2025-06-07'),
('Aryav Gupta','9876543229','aryav.gupta@gmail.com','Lucknow','2025-06-10'),
('Myra Menon','9876543230','myra.menon@gmail.com','Trivandrum','2025-06-13'),
('Kabir Rao','9876543231','kabir.rao@gmail.com','Hyderabad','2025-06-15'),
('Zara Qureshi','9876543232','zara.qureshi@gmail.com','Mumbai','2025-06-18'),
('Reyansh Shah','9876543233','reyansh.shah@gmail.com','Surat','2025-06-20'),
('Amaira Singh','9876543234','amaira.singh@gmail.com','Jaipur','2025-06-22'),
('Darsh Malhotra','9876543235','darsh.malhotra@gmail.com','Bangalore','2025-06-25'),
('Suhani Kapoor','9876543236','suhani.kapoor@gmail.com','Delhi','2025-06-28'),
('Rohan Iyer','9876543237','rohan.iyer@gmail.com','Cochin','2025-06-30'),
('Vivaan Choudhary','9876543238','vivaan.choudhary@gmail.com','Lucknow','2025-07-02'),
('Avika Desai','9876543239','avika.desai@gmail.com','Ahmedabad','2025-07-04'),
('Ranveer Khurana','9876543240','ranveer.khurana@gmail.com','Gurgaon','2025-07-06'),
('Anya Sharma','9876543241','anya.sharma@gmail.com','Chandigarh','2025-07-08'),
('Vihaan Rathore','9876543242','vihaan.rathore@gmail.com','Noida','2025-07-10'),
('Alisha Goyal','9876543243','alisha.goyal@gmail.com','Jaipur','2025-07-12'),
('Kabir Sinha','9876543244','kabir.sinha@gmail.com','Patna','2025-07-14'),
('Nisha Reddy','9876543245','nisha.reddy@gmail.com','Hyderabad','2025-07-16'),
('Veer Sharma','9876543246','veer.sharma@gmail.com','Delhi','2025-07-18'),
('Aria Nair','9876543247','aria.nair@gmail.com','Bangalore','2025-07-20'),
('Ahaan Gupta','9876543248','ahaan.gupta@gmail.com','Mumbai','2025-07-22'),
('Siya Menon','9876543249','siya.menon@gmail.com','Cochin','2025-07-24');

INSERT INTO Bookings (customer_id, cab_id, booking_time, pickup_location, drop_location, status)
VALUES
(5,11,'2024-06-05 08:30:00','Whitefield','Airport','Completed'),
(8,12,'2024-06-05 10:15:00','HSR Layout','Majestic','Cancelled'),
(12,13,'2024-06-06 09:00:00','BTM Layout','Koramangala','Completed'),
(15,14,'2024-06-06 18:45:00','Indiranagar','Electronic City','Completed'),
(18,15,'2024-06-07 07:15:00','Marathahalli','Bellandur','Completed'),
(20,16,'2024-06-07 09:45:00','KR Puram','Airport','Ongoing'),
(22,17,'2024-06-07 20:30:00','Banashankari','MG Road','Cancelled'),
(25,18,'2024-06-08 11:20:00','Rajajinagar','Yeshwanthpur','Completed'),
(28,19,'2024-06-08 16:50:00','Koramangala','BTM Layout','Completed'),
(30,20,'2024-06-08 19:30:00','Majestic','Whitefield','Completed'),

(6,11,'2024-07-02 07:40:00','HSR Layout','Airport','Completed'),
(7,12,'2024-07-02 09:15:00','BTM Layout','Indiranagar','Completed'),
(9,13,'2024-07-02 18:00:00','Marathahalli','Electronic City','Completed'),
(11,14,'2024-07-03 08:45:00','Bellandur','KR Puram','Cancelled'),
(13,15,'2024-07-03 12:00:00','Banashankari','HSR Layout','Completed'),
(14,16,'2024-07-03 14:15:00','Indiranagar','Majestic','Completed'),
(16,17,'2024-07-04 07:00:00','MG Road','Airport','Completed'),
(18,18,'2024-07-04 08:50:00','Koramangala','Bellandur','Completed'),
(20,19,'2024-07-04 15:30:00','Majestic','Electronic City','Cancelled'),
(21,20,'2024-07-04 17:45:00','Yeshwanthpur','BTM Layout','Completed'),

(22,11,'2024-08-05 06:30:00','Whitefield','Majestic','Completed'),
(24,12,'2024-08-05 07:50:00','HSR Layout','Airport','Completed'),
(25,13,'2024-08-05 09:25:00','BTM Layout','MG Road','Completed'),
(27,14,'2024-08-05 20:00:00','Indiranagar','Bellandur','Completed'),
(28,15,'2024-08-06 07:30:00','Marathahalli','Koramangala','Completed'),
(29,16,'2024-08-06 08:45:00','KR Puram','Whitefield','Ongoing'),
(30,17,'2024-08-06 10:15:00','Banashankari','Airport','Cancelled'),
(31,18,'2024-08-06 16:20:00','Rajajinagar','Electronic City','Completed'),
(32,19,'2024-08-06 18:30:00','BTM Layout','MG Road','Completed'),
(33,20,'2024-08-06 21:10:00','Koramangala','HSR Layout','Completed'),

(34,11,'2024-09-01 08:00:00','Indiranagar','Airport','Completed'),
(35,12,'2024-09-01 09:30:00','Marathahalli','Majestic','Completed'),
(36,13,'2024-09-01 10:45:00','KR Puram','Bellandur','Completed'),
(37,14,'2024-09-01 18:20:00','Banashankari','MG Road','Cancelled'),
(38,15,'2024-09-02 06:50:00','HSR Layout','Electronic City','Completed'),
(39,16,'2024-09-02 08:25:00','Koramangala','Airport','Completed'),
(40,17,'2024-09-02 09:55:00','MG Road','BTM Layout','Completed'),
(41,18,'2024-09-02 11:45:00','Yeshwanthpur','Whitefield','Completed'),
(42,19,'2024-09-02 19:30:00','Bellandur','Majestic','Ongoing'),
(43,20,'2024-09-02 21:00:00','BTM Layout','Koramangala','Completed'),

(44,11,'2024-09-03 07:10:00','Electronic City','Airport','Completed'),
(45,12,'2024-09-03 08:15:00','HSR Layout','MG Road','Completed'),
(46,13,'2024-09-03 12:20:00','KR Puram','Indiranagar','Completed'),
(47,14,'2024-09-03 16:30:00','Koramangala','Bellandur','Cancelled'),
(48,15,'2024-09-03 18:45:00','Banashankari','BTM Layout','Completed'),
(49,16,'2024-09-03 20:15:00','Majestic','Electronic City','Completed'),
(50,17,'2024-09-03 21:40:00','MG Road','Airport','Completed'),
(51,18,'2024-09-03 22:10:00','Whitefield','HSR Layout','Completed'),
(52,19,'2024-09-03 22:40:00','BTM Layout','Indiranagar','Completed'),
(53,20,'2024-09-03 23:05:00','Bellandur','Koramangala','Completed');




-- Customer and Booking Analysis

SELECT * FROM CUSTOMERS;
SELECT * FROM BOOKINGS;
SELECT * FROM CABS;
SELECT * FROM DRIVERS;
SELECT * FROM FEEDBACK;
SELECT * FROM TRIPDETAILS;

-- 1. Identify customers who have completed the most bookings. What insights can you draw about their behavior?
SELECT 
    c.customer_id,
    c.name,
    COUNT(b.booking_id) AS completed_bookings
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
WHERE b.status = 'Completed'
GROUP BY c.customer_id, c.name
ORDER BY completed_bookings DESC;


-- 2. Find customers who have canceled more than 30% of their total bookings. What could be the reason for frequent cancellations?
SELECT
    customer_id,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_bookings,
    (SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_rate
FROM Bookings
GROUP BY customer_id
HAVING cancellation_rate > 30
ORDER BY cancellation_rate DESC;

-- 3. Determine the busiest day of the week for bookings. How can the company optimize cab availability on peak days?
SELECT 
    DAYNAME(booking_time) AS day_of_week,
    COUNT(*) AS total_bookings
FROM Bookings
GROUP BY day_of_week
ORDER BY total_bookings DESC
limit 1;

-- Driver Performance & Efficiency
-- Identify drivers who have received an average rating below 3.0 in the past three months. What strategies can be implemented to improve their performance?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    ROUND(AVG(f.rating),2) AS avg_rating,
    COUNT(f.feedback_id) AS total_feedbacks
FROM Drivers d
JOIN Feedback f ON d.driver_id = f.driver_id
WHERE f.feedback_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY d.driver_id, d.name
HAVING avg_rating < 3.0
ORDER BY avg_rating ASC;

-- Find the top 5 drivers who have completed the longest trips in terms of distance. What does this say about their working patterns?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    SUM(t.distance_km) AS total_distance,
    COUNT(t.trip_id) AS total_trips
FROM Drivers d
JOIN Bookings b ON d.driver_id = b.cab_id   -- if cab is linked to driver
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY d.driver_id, d.name
ORDER BY total_distance DESC
LIMIT 5;

-- Identify drivers with a high percentage of canceled trips. Could this indicate driver unreliability?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    COUNT(CASE WHEN b.status = 'Cancelled' THEN 1 END) AS cancelled_trips,
    COUNT(*) AS total_trips,
    ROUND((COUNT(CASE WHEN b.status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*)), 2) AS cancel_percentage
FROM Drivers d
JOIN Cabs c ON d.driver_id = c.driver_id
JOIN Bookings b ON c.cab_id = b.cab_id
GROUP BY d.driver_id, d.name
HAVING cancel_percentage > 30
ORDER BY cancel_percentage DESC;

-- Revenue & Business Metrics

-- 1. Calculate the total revenue generated by completed bookings in the last 6 months. How has the revenue trend changed over time?
SELECT 
    DATE_FORMAT(b.booking_time, '%Y-%m') AS month,
    SUM(t.fare) AS total_revenue
FROM Bookings b
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
  AND b.booking_time >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY DATE_FORMAT(b.booking_time, '%Y-%m')
ORDER BY month;

-- 2. Identify the top 3 most frequently traveled routes based on PickupLocation and DropoffLocation. Should the company allocate more cabs to these routes?
SELECT 
    b.pickup_location,
    b.drop_location,
    COUNT(*) AS trip_count
FROM Bookings b
WHERE b.status = 'Completed'
GROUP BY b.pickup_location, b.drop_location
ORDER BY trip_count DESC
LIMIT 3;

-- 3. Determine if higher-rated drivers tend to complete more trips and earn higher fares. Is there a direct correlation between driver ratings and earnings?
SELECT 
    d.driver_id,
    d.name AS driver_name,
    ROUND(AVG(f.rating), 2) AS avg_rating,
    COUNT(t.trip_id) AS total_trips,
    SUM(t.fare) AS total_earnings
FROM Drivers d
JOIN Cabs c ON d.driver_id = c.driver_id
JOIN Bookings b ON c.cab_id = b.cab_id
JOIN TripDetails t ON b.booking_id = t.booking_id
LEFT JOIN Feedback f ON d.driver_id = f.driver_id
WHERE b.status = 'Completed'
GROUP BY d.driver_id, d.name
ORDER BY avg_rating DESC;

-- Operational Efficiency & Optimization

-- Analyze the average waiting time (difference between booking time and trip start time) for different pickup locations. How can this be optimized to reduce delays?
ALTER TABLE TripDetails ADD COLUMN trip_start_time DATETIME;

SELECT 
    b.pickup_location,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, b.booking_time, t.trip_start_time)), 2) AS avg_waiting_time_minutes,
    COUNT(*) AS total_trips
FROM Bookings b
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY b.pickup_location
ORDER BY avg_waiting_time_minutes DESC;

UPDATE TripDetails t
JOIN Bookings b ON t.booking_id = b.booking_id
SET t.trip_start_time = DATE_ADD(b.booking_time, INTERVAL FLOOR(RAND()*15)+3 MINUTE);


-- Identify the most common reasons for trip cancellations from customer feedback. What actions can be taken to reduce cancellations?
SELECT 
    f.comments AS cancellation_reason,
    COUNT(*) AS total_cancellations,
    ROUND(COUNT(*) * 100.0 / 
        (SELECT COUNT(*) 
         FROM Feedback fb
         JOIN Bookings b2 ON fb.customer_id = b2.customer_id
         WHERE b2.status = 'Cancelled'), 2) AS percentage
FROM Feedback f
JOIN Bookings b ON f.customer_id = b.customer_id
WHERE b.status = 'Cancelled'
GROUP BY f.comments
ORDER BY total_cancellations DESC
LIMIT 5;

-- Find out whether shorter trips (low-distance) contribute significantly to revenue. Should the company encourage more short-distance rides?
SELECT
    CASE 
        WHEN t.distance_km < 5 THEN 'Short Trip (<5 km)'
        ELSE 'Long Trip (>=5 km)'
    END AS trip_category,
    COUNT(*) AS total_trips,
    SUM(t.fare) AS total_revenue,
    ROUND(SUM(t.fare) * 100.0 / (SELECT SUM(fare) FROM TripDetails), 2) AS revenue_percentage
FROM TripDetails t
JOIN Bookings b ON t.booking_id = b.booking_id
WHERE b.status = 'Completed'
GROUP BY trip_category;

-- Comparative & Predictive Analysis

-- Compare the revenue generated from 'Sedan' and 'SUV' cabs. Should the company invest more in a particular vehicle type?
SELECT 
    c.cab_type,
    ROUND(SUM(t.fare), 2) AS total_revenue,
    COUNT(*) AS total_trips,
    ROUND(AVG(t.fare), 2) AS avg_fare_per_trip
FROM Cabs c
JOIN Bookings b ON c.cab_id = b.cab_id
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY c.cab_type
ORDER BY total_revenue DESC;

-- Predict which customers are likely to stop using the service based on their last booking date and frequency of rides. How can customer retention be improved?
SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(b.booking_id) AS total_bookings,
    MAX(b.booking_time) AS last_booking_date,
    DATEDIFF(CURDATE(), MAX(b.booking_time)) AS days_since_last_booking
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.name
HAVING days_since_last_booking > 30  -- no trips in the last 30 days
   OR total_bookings < 3            -- very few total rides
ORDER BY days_since_last_booking DESC;

-- Analyze whether weekend bookings differ significantly from weekday bookings.Should the company introduce dynamic pricing based on demand?
SELECT 
    CASE 
        WHEN DAYOFWEEK(b.booking_time) IN (1,7) THEN 'Weekend'  -- 1=Sunday, 7=Saturday
        ELSE 'Weekday'
    END AS day_type,
    COUNT(b.booking_id) AS total_bookings,
    ROUND(SUM(t.fare), 2) AS total_revenue,
    ROUND(AVG(t.fare), 2) AS avg_fare_per_trip
FROM Bookings b
JOIN TripDetails t ON b.booking_id = t.booking_id
WHERE b.status = 'Completed'
GROUP BY day_type
ORDER BY total_bookings DESC;
