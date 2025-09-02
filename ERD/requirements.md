# Entities and Attributes
1. Users

Attributes:

id (unique identifier)
name (full name)
email (unique login credential)
role (guest, host, or both)
created_at (account creation date)

Relationships:

A User (has many)/can list multiple Properties (if host).
A User (has many)/can make multiple Bookings (if guest).
A User (has many)/can leave multiple Reviews.
A User (has many)/can make multiple Payments (for bookings).

2. Properties

Attributes:

id (unique identifier)
host_id (foreign key → User)
title (property name/short description)
location (address or coordinates)
price_per_night (rate set by host)

Relationships:

A Property belongs to one User (host).
A Property (has many)/can have multiple Bookings.
A Property (has many)/can receive multiple Reviews.

3. Bookings

Attributes:

id (unique identifier)
property_id (foreign key → Property)
user_id (foreign key → User who books)
start_date (check-in)
end_date (check-out)

Relationships:

A Booking belongs to one Property.
A Booking belongs to one User (guest).
A Booking can have one Payment.

4. Reviews

Attributes:

id (unique identifier)
user_id (foreign key → User who wrote the review)
property_id (foreign key → Property being reviewed)
rating (e.g., 1–5 stars)
comment (text review)

Relationships:

A Review belongs to one User (reviewer).
A Review belongs to one Property.
A Property can have many Reviews.

5. Payments

Attributes:

id (unique identifier)
booking_id (foreign key → Booking)
amount (total paid)
payment_method (credit card, PayPal, etc.)
status (pending, completed, failed)

Relationships:

A Payment belongs to one Booking.
A User (guest) makes the Payment for their Booking.

Entity Relationship Summary:

A User can be a Host (owns Properties) or a Guest (makes Bookings).
A Property is listed by a Host (User) and can have many Bookings and Reviews.
A Booking links a Guest (User) to a Property and has an associated Payment.
A Review links a Guest (User) to a Property.
A Payment is tied to a Booking and made by a Guest (User).

