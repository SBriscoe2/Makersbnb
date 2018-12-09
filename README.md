## Daily standups: 10:00am

## Daily retros: 4:30pm
---
User stories
```
As a user
So that I can use Makersbnb
I would like to sign up
```
```
As a user
So I can use my account every time I visit the site
I want to be able to log in
```
```
As a user
So that only I can log in to my account
I want to set a password
```
```
As a user
So that I can see the spaces on Makersbnb
I want to be shown a list of all spaces
```
```
As a user
So that I know everything I need to about a space
I want to be shown all its details
```
```
As a user who owns a space
So that other users can see my space
I want to create new spaces
```
```
As a user who owns a space
So that people can see a description of my space
I want to be able to add details to my space (name, description, price)
```
```
As a user who owns a space
So that other users know what dates the space is available
I want to be able to specify those dates on the space
```
```
As a user who owns a space
So that users do not request to hire it on dates when it has already been booked
I want the space to be shown as unavailable on those dates
```
```
As a user hiring a space
So that I know whether I can hire it
I want to see whether it is available on the date I want
```
```
As a user hiring a space
So that I can stay at a space listed on Makersbnb
I want to be able to request to hire that space
```
```
As a user who owns a space
So that other users can hire my space
I want to be able to approve hire requests
```
```
As a user who owns a space
So that users can hire my space
I want the space to be shown as available until the booking is confirmed
```

#### Database Instructions
1. CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60) UNIQUE, password VARCHAR(15), email VARCHAR(60) UNIQUE);
2. CREATE TABLE spaces (id SERIAL PRIMARY KEY, owner INT REFERENCES users(id), spacename VARCHAR, description VARCHAR, price DECIMAL(6,2));
3. CREATE TABLE comments (id SERIAL PRIMARY KEY, space INTEGER REFERENCES spaces(id), commenter INTEGER REFERENCES users(id), commenttext VARCHAR(50));
4. CREATE TABLE bookings(id SERIAL PRIMARY KEY, spaceid INT REFERENCES spaces(id), hirerid INT REFERENCES users(id), startdate DATE, enddate DATE, confirmed BOOLEAN DEFAULT FALSE);
5. CREATE TABLE availability(id SERIAL PRIMARY KEY, space INTEGER REFERENCES spaces(id),      availabledate DATE, unavailable BOOLEAN DEFAULT FALSE);
