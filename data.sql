-- Drop if exists (optional but helpful for clean restarts)
DROP TABLE IF EXISTS tournament_member;
DROP TABLE IF EXISTS tournament;
DROP TABLE IF EXISTS member;

-- Create Member table
CREATE TABLE member (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    membership_start_date DATE,
    membership_duration INT
);

-- Create Tournament table
CREATE TABLE tournament (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    location VARCHAR(255),
    entry_fee DOUBLE,
    cash_prize DOUBLE
);

-- Join table for Many-to-Many relationship
CREATE TABLE tournament_member (
    tournament_id BIGINT,
    member_id BIGINT,
    PRIMARY KEY (tournament_id, member_id),
    FOREIGN KEY (tournament_id) REFERENCES tournament(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

-- Insert a member
INSERT INTO member (name, address, email, phone_number, membership_start_date, membership_duration)
VALUES ('Colin', '123 Main St', 'colin@example.com', '709-555-1234', '2025-07-01', 12);

-- Insert a tournament
INSERT INTO tournament (start_date, end_date, location, entry_fee, cash_prize)
VALUES ('2025-08-01', '2025-08-03', 'Avalon Golf Club', 25.00, 500.00);

-- Link member to tournament (assumes both got id = 1)
INSERT INTO tournament_member (tournament_id, member_id)
VALUES (1, 1);
