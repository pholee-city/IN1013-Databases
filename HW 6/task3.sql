-- 1

SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

-- 2

SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rm.room_name = 'Green' AND s.first_name = 'Charles' AND rm.room_date BETWEEN 160201 AND 160229;

-- 3

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4

SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5

SELECT DISTINCT s.first_name, s.surname
FROM restBill b1
JOIN restBill b2 ON b1.table_no = b2.table_no
JOIN restStaff s ON b2.waiter_no = s.staff_no
WHERE b1.bill_no IN (14, 17);

-- 6

SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management rm
JOIN restRest_table rt ON rm.room_name = rt.room_name
JOIN restBill b ON rt.table_no = b.table_no
JOIN restStaff s ON b.waiter_no = s.staff_no OR rm.headwaiter = s.staff_no
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312;