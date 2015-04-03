require 'active_record'
require 'pg'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/account'
require_relative 'lib/transaction'

# main ui code goes here



system "clear"

puts "Welcome back, Karen!"
sleep 1

puts""

time = Time.now


puts "Today is #{time}."
sleep 1

while true

puts""



account = Account.new
account.current_balance = Transaction.sum(:amount)




puts "Your current account balance is:"
sleep 1
puts "$#{account.current_balance}."
sleep 1
puts""

puts "What would you like to do today?"
sleep 1
puts "" ""

# while true

puts "        MAIN MENU
------------------------------"
puts "(1) Enter a new transaction
(2) Edit a transaction
(3) Delete a transaction
(4) View my transaction history
(5) Quit Finance Manager"
puts ""
#(if not right input format --> error/ sorry/ please try again message --> and re-prompt)


user_input = gets.chomp

system "clear"

  case user_input
  when "1"
    puts "You\'ve chosen to enter a new transaction."
    puts ""
    puts " > Press D to log a DEBIT to your account."
    puts " > Press C to log a CREDIT to your account."
    puts ""
    sleep 1
    #puts "(Press M to return to the Main Menu at any time.)"
    puts ""
    user_selection = gets.chomp.upcase
    # user_selection_C = gets.chomp.upcase
    # user_selection_M = gets.chomp.upcase
    system "clear"
    if user_selection == "D"
      puts "You\'ve chosen to add a new debit transaction to your account."
      sleep 1
      puts ""
      puts "Please enter a few quick details about this debit:"
      sleep 1
      puts ""
      puts "> Transaction Date (MM/DD/YYYY):"    ##Compare to schema file 'date' type-- is format entered correct?
      user_input_date = gets.chomp
      sleep 1
      puts ""
      puts "> Transaction Amount (in whole USD):"
      user_input_debit = gets.chomp.to_i * -1
      sleep 1
      puts ""
      puts "> Payee name:"
      user_input_party = gets.chomp
      sleep 1
      puts ""
      puts "> You have categorized your spending as follows:"
      puts "-------------------------------------------------------
      (1) Personal checks         (5) Gadgets & Gizmos
      (2) Food and dining         (6) Whos-its & Whats-its
      (3) Nights on the town      (7) Thinga-mabobs
      (4) Craigslist 'For Sale'   (8) Other"
      puts "-------------------------------------------------------"
      puts "> Enter a number 1-8 to select a category for this transaction:"
      user_selection_category = gets.chomp
      sleep 1
      puts ""
      trans_details = new_transaction(user_input_date, user_input_debit, user_input_party, user_selection_category)
      puts ""
      puts "This debit transaction has been successsfully entered into your account."
      # puts "Summary:"
      # puts trans_details
    elsif user_selection == "C"
      puts "You\'ve chosen to add a new credit transaction to your account."
      sleep 1
      puts ""
      puts "Please enter a few quick details about this credit:"
      sleep 1
      puts ""
      puts "> Transaction Date (MM/DD/YYYY):"    ##Compare to schema file 'date' type-- is format entered correct?
      user_input_date = gets.chomp
      sleep 1
      puts ""
      puts "> Transaction Amount (in whole USD):"
      user_input_credit = gets.chomp
      sleep 1
      puts ""
      puts "> Payer name:"
      user_input_party = gets.chomp
      sleep 1
      puts ""
      puts "> Your spending breaks down into the following categories."
      puts "-------------------------------------------------------
      (1) Personal checks         (5) Horse Races
      (2) Food and dining         (6) Uber
      (3) Nights on the town      (7) Craigslist 'For Sale'
      (4) Uber                    (8) Other"
      puts "-------------------------------------------------------"
      puts "> Enter the appropriate category number for this transaction:"
      user_selection_category = gets.chomp
      sleep 1
      puts ""
      trans_details = new_transaction(user_input_date, user_input_credit, user_input_party, user_selection_category)
      puts ""
      puts "This credit transaction has been successsfully entered into your account."
      puts "" ""
      # puts "Summary:"
      # puts trans_details
    elsif user_selection == "M"
      break
    end


  # when "2"
  #
  # when "3"
  #
  # when "4"

  when "5"
    puts "See you later Karen!"
    puts ""
    exit
  end
end
#   #(if not right input format --> error/ sorry/ please try again message --> and re-prompt)
#   when "D"
#
# end
#
# #gets.chomp(date)
#               (if not right input format --> error/ sorry/ please try again message --> and re-prompt)
#             puts "Input transaction amount in whole U.S. dollars:"   ##Switch to different 'amount' type in schema.sql (aka non-integer / allow decimals)
#               puts "$"gets.chomp(integer)
#               (if not right input format --> error/ sorry/ please try again message --> and re-prompt)
#             puts "Please enter name of payee:"
#               gets.chomp(text-name)
#               (if not right input format --> error/ sorry/ please try again message --> and re-prompt)
#             puts "Select a category for this transaction (enter category number):
#                     (1) Grocery/Drugstore
#                     (2) Retail Therapy
#                     (3) Online Poker
#                     (4) Uber
#                     (5) Nights on the town
#                     (6) Personal Checks
#                     (7) Other"
#                   gets.chomp(item_number)
#                   (if not right input format --> error/ sorry/ please try again message --> and re-prompt)
#             puts "You have successfully entered a new transaction!"
#             puts "Transaction details: $ #{USD_entered} to #{payee_entered} in category #{category_entered} debited to account
#                   for date #{date_entered}."
#             puts "You will be auto-directed to the main menu in 5 seconds, or press Q to quit the program." [pause 5 seconds]
#             -->Loop back to main menu
#
#
#
#
#
#
#         gets.chomp (user enters C)
#           puts "You've chosen to enter a new credit transaction."
#
# end
#




# binding.pry












### FRIDGE app.rb FILE ###
#
# require 'active_record'                           # SET-UP
# require 'pry'
#
# require_relative 'db/connection'
# require_relative 'lib/fridge'
# require_relative 'lib/food'
# require_relative 'lib/drink'
#
#
#
# def get_fridge
#   puts "Which fridge?"
#   puts Fridge.all
#   fridge_location = gets.chomp
#   return Fridge.find_by(location: fridge_location)
# end
#
# def get_food(fridge)
#   puts "Which food?"
#   puts fridge.foods
#   food_name = gets.chomp
#   return fridge.foods.find_by(name: food_name)
# end
#
# def get_drink(fridge)
#   puts "Which drink?"
#   puts fridge.drinks
#   drink_name = gets.chomp
#   return fridge.drinks.find_by(name: drink_name)
# end
#
# def get_fridge_input
#   fridge_attr = {}
#   puts "Where is the fridge at?"
#   fridge_attr[:location] = gets.chomp
#   puts "What brand is the fridge?"
#   fridge_attr[:brand] = gets.chomp
#   puts "What is the cubic footage?"
#   fridge_attr[:size] = gets.chomp.to_i
#   return fridge_attr
# end
#
# def get_food_input
#   food_attr = {}
#   puts "What is the food called?"
#   food_attr[:name] = gets.chomp
#   puts "What is the weight in lbs?"
#   food_attr[:weight] = gets.chomp
#   puts "Is it vegan?"
#   food_attr[:is_vegan] = gets.chomp
#   food_attr[:enter_time] = Time.now
#   return food_attr
# end
#
# def get_drink_input
#   drink_attr = {}
#   puts "What is the drink called?"
#   drink_attr[:name] = gets.chomp
#   puts "What is the size in oz?"
#   drink_attr[:size] = gets.chomp
#   puts "Is it alcoholic?"
#   drink_attr[:is_alcoholic] = gets.chomp
#   return drink_attr
# end
#


#### FRIDGE app.rb file CONT'D --> MENU!!!


# def menu
#   puts "Choose an option:
#   1. List all Fridges
#   2. Add a Fridge
#   3. Delete a Fridge
#   4. View all food items in a specific fridge
#   5. Add a food item to a fridge
#   6. Eat a food item from a fridge
#   7. View all drink items in a specific fridge
#   8. Add a drink item to a fridge
#   9. Consume PART of a drink from a fridge
#   10. Consume ALL of a drink from a fridge
#   11. Quit"
#   return gets.chomp
# end
#
#
#
#
# loop do
#
#   choice = menu         ## AR
#   case choice           ## AR
#
#   when "1"
#     puts Fridge.all
#   when "2"
#     Fridge.create(get_fridge_input)
#   when "3"
#     fridge = get_fridge
#     fridge.destroy
#   when "4"
#     fridge = get_fridge
#     puts fridge.foods
#   when "5"
#     fridge = get_fridge
#     new_food = Food.create(get_food_input)
#     new_food.fridge = fridge
#     new_food.save
#   when "6"
#     fridge = get_fridge
#     food = get_food(fridge)
#     food.destroy
#   when "7"
#     fridge = get_fridge
#     puts fridge.drinks
#   when "8"
#     fridge = get_fridge
#     new_drink = Drink.create(get_drink_input)
#     new_drink.fridge = fridge
#     new_drink.save
#   when "9"
#     fridge = get_fridge
#     drink = get_drink(fridge)
#     puts "What is the new size?"
#     new_size = gets.chomp
#     drink.size = new_size
#     drink.save
#   when "10"
#     fridge = get_fridge
#     drink = get_drink(fridge)
#     drink.destroy
#   when "11"
#     break
#   end
# end


##############################################################


###FLASHY PROGRAM INTRO?
# system "clear"   ## clears the screen in case there's other stuff there
## puts lines of picto-code
# sleep 3     ## pause 3 seconds after cheesy intro graphic
# system "clear"   ## clear the screen of the graphic
## bring up main menu etc.
