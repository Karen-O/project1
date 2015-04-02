DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS transactions;

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  current_balance INTEGER NOT NULL
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  amount INTEGER NOT NULL,   -- "amount" attribute: "MONEY" data type SHOULD work --> switch to it later! (requires 2 decimal points?)
  payee TEXT NOT NULL,
  transaction_date DATE NOT NULL,
  category TEXT NOT NULL,
  account_id INTEGER REFERENCES accounts(id)
);
