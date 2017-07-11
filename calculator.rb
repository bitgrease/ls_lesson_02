puts "===================================="
puts "=            Ruby Calculator       ="
puts "===================================="

def say(msg)
  puts "=> #{msg}"
end

def get_number
  entered_number = nil
  loop do
    say "Enter a number: "
    entered_number = gets.chomp
    # Float will catch both Integer and Floats
    break if Float(entered_number) rescue false
    say "You must enter an integer or a float!"
  end
  entered_number
end

def get_operator
  operation = nil
  loop do
    say "Enter your desired operation - 1) Add, 2) Subtract, 3) Divide, 4)" \
    + " Multiply:"
    operation = gets.chomp
    break if %w(1 2 3 4).include? operation
    say "You must enter the number for the operation - 1,2,3,or 4."
  end
  operation
end

def do_math(num1, num2, operator)
  # Decide if floats are entered or appropriate in case of division
  if num1.include?('.') || num2.include?('.') || operator == "3"
    to_method = 'to_f'
  else
    to_method = 'to_i'
  end
  case operator
  when '1' then say "#{num1} + #{num2} = " \
    + "#{num1.send(to_method) + num2.send(to_method)}."
  when '2' then say "#{num1} - #{num2} = " \
    + "#{num1.send(to_method) - num2.send(to_method)}."
  when '3' then say "#{num1} / #{num2} = " \
    + "#{num1.send(to_method) / num2.send(to_method)}."
  when '4' then say "#{num1} * #{num2} = " \
    + "#{num1.send(to_method) * num2.send(to_method)}."
  end
end

loop do
  do_math(get_number,get_number,get_operator)
  puts "Do another operation?(y/n):"
  break if gets.chomp.downcase == 'n'
end





