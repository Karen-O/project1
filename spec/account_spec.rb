require 'active_record'
require_relative '../db/connection'

require "spec_helper"
require_relative '../lib/account'

describe Account do
  it 'can display its current balance' do
    account = Account.new                               # instantiate a new (fake/test) instance of Account class ## If I want to apply this to additional tests besides this one, the syntax structure is different-- would need to instantiate after the "describe."
    expect(account.current_balance).to eq(0)            # I now have a way to "say" the current_balance value everywhere in my program --> account.current_balance (= instance variable)
  end
end
