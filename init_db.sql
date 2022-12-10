CREATE TABLE
    users (
        id INT PRIMARY KEY,
        email VARCHAR(255) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        role ENUM('user', 'admin') NOT NULL
    );

CREATE TABLE
    advertisements (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,
        category ENUM(
            'primary',
            'secondary',
            'college'
        ) NOT NULL,
        theme VARCHAR(255) NOT NULL,
        mode ENUM('offline', 'online') NOT NULL,
        description TEXT NOT NULL,
        rate FLOAT NOT NULL,
        contact_name VARCHAR(255) NOT NULL,
        contact_address VARCHAR(255) NOT NULL,
        contact_email VARCHAR(255) NOT NULL,
        contact_phone VARCHAR(255) NOT NULL,
        location_wilaya VARCHAR(255) NOT NULL,
        location_commune VARCHAR(255) NOT NULL,
        location_address VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id)
    );

CREATE TABLE
    photos (
        id INT PRIMARY KEY,
        advertisement_id INT NOT NULL,
        url VARCHAR(255) NOT NULL,
        FOREIGN KEY (advertisement_id) REFERENCES advertisements(id)
    );

CREATE TABLE
    favorites (
        id INT PRIMARY KEY,
        user_id INT NOT NULL,
        advertisement_id INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (advertisement_id) REFERENCES advertisements(id)
    );

CREATE TABLE
    messages (
        id INT PRIMARY KEY,
        sender_id INT NOT NULL,
        advertisement_id INT NOT NULL,
        message TEXT NOT NULL,
        created_at TIMESTAMP NOT NULL,
        FOREIGN KEY (sender_id) REFERENCES users(id),
        FOREIGN KEY (advertisement_id) REFERENCES advertisements(id)
    );