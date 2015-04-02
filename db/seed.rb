require 'active_record'     # Do I need this?
require 'pg'                # Do I need this?

require_relative 'connection'
require_relative '../lib/account'
require_relative '../lib/transaction'
# require_relative '../lib/user'        

Transaction.destroy_all
Account.destroy_all

checking = Account.create(name: "Karen_Account")

Transaction.create( amount: "102", payee: "Name", transaction_date: Date.parse("2014-10-31"), category: "debit")

25.times do
  checking.transaction.create( amount: rand(25), payee: payees.sample, transaction_date: Date.parse("2014-10-31"), category: category.sample)

end

# savings = Account.create(name: "Karen_Account")





=begin

require_relative 'connection'
require_relative '../lib/fridge'
require_relative '../lib/food'
require_relative '../lib/drink'

Doctor.destroy_all
Patient.destroy_all

doctors = Doctor.create([
  {name: "bob"},
  {name: "tom"},
  {name: "sam"},
  {name: "tim"}
])

bob = Doctor.find_by(name:"bob")
bobs_patients = bob.patients.create([
  {name: "sarah"},
  {name: "timothy"},
  {name: "chris"}
])

tom = Doctor.find_by(name:"tom")
toms_patients = tom.patients.create([
  {name: "sarah1"},
  {name: "timothy1"},
  {name: "chris1"}
])

=end
