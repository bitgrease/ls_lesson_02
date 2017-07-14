# takes 2 argumens
# input - Positive integer, boolean
# output -
#  bonus is 1/2 of salary if boolean is true
#  bonus is 0 if false

def calculate_bonus(salary, getting_a_bonus)
  getting_a_bonus ? salary / 2.0 : 0
end

# Tests should all print true
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
