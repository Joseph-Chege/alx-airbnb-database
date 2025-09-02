-- Seeding Tables

INSERT INTO users (fisrt_name, last_name, email, password_hash, phone_number, role, created_at ) VALUES 
('James', 'Woodson', 'jameswoods@gmail.com', '123456', '0725390790', 'host',)
('Anna', 'Kariuki', 'annak@gmail.com', 'abcdef', '0712345678', 'guest'),
('Michael', 'Otieno', 'mikeo@gmail.com', 'qwerty', '0798765432', 'admin')
RETURNING *;

INSERT INTO property (host_id, name, description, location, price_per_night)
VALUES
    ((SELECT id FROM users WHERE email='jameswoods@gmail.com'),
     'Seaside Villa', 'Beautiful villa near the ocean', 'Mombasa, Kenya', 120.00),
    ((SELECT id FROM users WHERE email='jameswoods@gmail.com'),
     'Nairobi Apartment', 'Modern 2-bedroom apartment in the city center', 'Nairobi, Kenya', 80.00),
    ((SELECT id FROM users WHERE email='jameswoods@gmail.com'),
     'Lakeview Cottage', 'Cozy cottage with lake view', 'Naivasha, Kenya', 95.50)
RETURNING *;

INSERT INTO booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES
    ((SELECT id FROM property WHERE name='Seaside Villa'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     '2025-09-05', '2025-09-10', 600.00, 'confirmed'),
    ((SELECT id FROM property WHERE name='Nairobi Apartment'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     '2025-09-15', '2025-09-20', 400.00, 'pending'),
    ((SELECT id FROM property WHERE name='Lakeview Cottage'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     '2025-10-01', '2025-10-05', 382.00, 'cancelled')
RETURNING *;

INSERT INTO payment (booking_id, amount, payment_method, status)
VALUES
    ((SELECT id FROM booking WHERE total_price=600.00), 600.00, 'credit_card', 'completed'),
    ((SELECT id FROM booking WHERE total_price=400.00), 200.00, 'mobile_money', 'pending'),
    ((SELECT id FROM booking WHERE total_price=382.00), 0.00, 'paypal', 'failed')
RETURNING *;

INSERT INTO review (property_id, user_id, rating, comment)
VALUES
    ((SELECT id FROM property WHERE name='Seaside Villa'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     5, 'Amazing experience, will definitely return!'),
    ((SELECT id FROM property WHERE name='Nairobi Apartment'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     4, 'Great location, a bit noisy but worth it.'),
    ((SELECT id FROM property WHERE name='Lakeview Cottage'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     3, 'Cozy but could improve cleanliness.')
RETURNING *;

INSERT INTO message (sender_id, receiver_id, message_body)
VALUES
    ((SELECT id FROM users WHERE email='annak@gmail.com'),
     (SELECT id FROM users WHERE email='jameswoods@gmail.com'),
     'Hi James, is your Seaside Villa available next week?'),
    ((SELECT id FROM users WHERE email='jameswoods@gmail.com'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     'Hi Anna, yes it is available for booking.'),
    ((SELECT id FROM users WHERE email='mikeo@gmail.com'),
     (SELECT id FROM users WHERE email='annak@gmail.com'),
     'Please remember to leave a review after your stay.')
RETURNING *;




