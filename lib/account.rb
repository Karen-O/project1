class Account < ActiveRecord::Base
  has_many :transactions
end


class Account
  # attr_reader :current_balance              # attr_reader puts a getter method in place in order to get the attribute current_balance of the instance of class Account

def initialize current_balance = 0          # method = initialize; argument = the variable current_balance
  @current_balance = current_balance
end

def display_balance                         # display_balance = getter method; no argument (variable) is used here (but it could be if I needed a variable defined from outside the method)
  puts "Your current balance is #{@current_balance}."
end

end








# Does Account has_many USERS too??
# (as in):
#
# class Account < ActiveRecord::Base
#   has_many :transactions, :users
# end
