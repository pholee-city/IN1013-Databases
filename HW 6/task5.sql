-- 1

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date, s.first_name, s.surname
HAVING COUNT(b.bill_no) >= 2;

-- 2

SELECT rt.room_name, COUNT(*) AS num_large_tables
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3

SELECT rt.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4

SELECT h.first_name, h.surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff h
JOIN restStaff w ON h.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY h.first_name, h.surname
ORDER BY total_bill_amount DESC;


-- 5

SELECT b.cust_name, AVG(b.bill_total) AS average_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;


-- 6

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date, s.first_name, s.surname
HAVING COUNT(b.bill_no) >= 3;