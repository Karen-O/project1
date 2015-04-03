require 'active_record'
require 'pg'

require_relative 'connection'
require_relative '../lib/account'
require_relative '../lib/transaction'

Transaction.destroy_all
Account.destroy_all

checking = Account.create(name: "Karen_Account", current_balance: 0)

parties = ["Bob", "Sam", "Dana"]

categories = ["Food", "Retail", "Car", "Other"]

25.times do
  transaction = checking.transactions.create( amount: rand(25), party: parties.sample, date: Date.parse("2014-10-31"), category: categories.sample)
  puts transaction.inspect
end

# savings = Account.create(name: "Karen_Savings")
