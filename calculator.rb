puts "===================================="
puts "=            Ruby Calculator       ="
puts "===================================="

def say(msg)
  puts "=> #{msg}"
end

def get_number
  entered_number = nil
  loop do
    say "Enter the a number: "
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
    num1_converted = num1.to_f
    num2_converted = num2.to_f
  else
    num1_converted = num1.to_i
    num2_converted = num2.to_i
  end
  case operator
  when '1' then say "#{num1_converted_converted} + #{num2_converted} = " \
    + "#{num1_converted + num2_converted}."
  when '2' then say "#{num1_converted} - #{num2_converted} = " \
    + "#{num1_converted - num2_converted}."
  when '3' then say "#{num1_converted} / #{num2_converted} = " \
    + "#{num1_converted / num2_converted}."
  when '4' then say "#{num1_converted} * #{num2_converted} = " \
    + "#{num1_converted * num2_converted}."
  end
end

loop do
  first_number = get_number
  second_number = get_number
  operation = get_operator
  do_math(first_number,second_number,operation)
  puts "Do another operation?(y/n):"
  break if gets.chomp.downcase == 'n'
end





