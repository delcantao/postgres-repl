
DO
$$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mydatabase') THEN
        CREATE DATABASE mydatabase;
    END IF;
END
$$;

\connect mydatabase;

create table if not exists users (
    id serial primary key,
    name varchar(100) not null,
    email varchar(100) not null unique,
    password varchar(100) not null,
    created_at timestamp default current_timestamp
);

create table if not exists posts (
    id serial primary key,
    user_id int references users(id) on delete cascade,
    title varchar(255) not null,
    content text not null,
    created_at timestamp default current_timestamp
);

insert into users (name, email, password) values
    ('John Doe', 'joao@joao.com', 'password123'),
    ('Jane Smith', 'janesmith@jane.com', 'password456'),
    ('Alice Johnson', 'alice@alice.com', 'password789');

insert into posts (user_id, title, content) values
    (1, 'First Post', 'This is the content of the first post.'),
    (2, 'Second Post', 'This is the content of the second post.'),
    (3, 'Third Post', 'This is the content of the third post.');