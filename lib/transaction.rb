class Transaction < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :date, :amount, :party, :category
end

def new_transaction(date, amount, party, category)
  Account.first.transactions.create(:date => date, :amount => amount, :party => party, :category => category)

end
