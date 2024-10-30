create table accounts(
    id bigserial primary key,
    owner varchar(1024) not null,
    balance bigint not null,
    currency varchar(1024) not null,
    created_at timestamptz not null default (now())
);

create table entries(
    id bigserial primary key,
    account_id bigint not null,
    amount bigint not null,
    created_at timestamptz not null default (now()),
    
    foreign key(account_id) references accounts (id)
);

create table transfers(
    id bigserial primary key,
    from_account_id bigint not null,
    to_account_id bigint not null,
    amount bigint not null,
    created_at timestamptz not null default (now()),
    
    foreign key(from_account_id) references accounts (id),
    foreign key(to_account_id) references accounts (id)
);