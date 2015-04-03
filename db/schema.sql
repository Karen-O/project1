DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;


CREATE TABLE accounts (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  current_balance integer NOT NULL
);

CREATE TABLE transactions (
  id serial PRIMARY KEY,
  date date NOT NULL,
  amount integer NOT NULL,   -- "amount" attribute: "MONEY" data type SHOULD work --> switch to it later! (requires 2 decimal points?)
  party varchar(50) NOT NULL,
  category varchar(50) NOT NULL,
  account_id integer REFERENCES accounts(id)
);
