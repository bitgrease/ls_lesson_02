require 'yaml'
puts '===================================='
puts '=            Ruby Calculator       ='
puts '===================================='
MESSAGES = YAML.load_file('calculator_messages.yml')
def say(msg)
  puts "=> #{msg}"
end

def operator_to_message(op)
  op_text = case op
            when '1' then 'Adding'
            when '2' then 'Subtracting'
            when '3' then 'Dividing'
            when '4' then 'Multiplying'
            end
  op_text
end

def get_name
  loop do
    say MESSAGES['welcome']
    name = gets.chomp
    if name.match?(/^[a-zA-Z]+$/)
      return name
    end
    say MESSAGES['valid_name']
  end
end

def get_number
  entered_number = nil
  loop do
    say MESSAGES['enter_number']
    entered_number = gets.chomp
    # Allow entry of integers or floats
    break if entered_number.match?(/^(\+|\-){0,1}\d+\.{0,1}\d*$/)
    say MESSAGES['valid_number']
  end
  entered_number
end

def get_operator
  operation = nil
  operator_prompt = MESSAGES['prompt_for_operator']
  loop do
    say operator_prompt
    operation = gets.chomp
    break if %w[1 2 3 4].include? operation
    say MESSAGES['valid_operation']
  end
  operation
end

def do_math(num1, num2, operator)
  # Decide if floats are entered or appropriate in case of division
  converter = if num1.match?(/\d+\.\d+/) || num2.match?(/\d+\.\d+/) || \
                 operator.eql?('3')
                'to_f'
              else
                'to_i'
              end
  say "#{operator_to_message(operator)} #{num1} and #{num2}..."
  result = case operator
           when '1'
             "#{num1} + #{num2} = " \
               + "#{num1.send(converter) + num2.send(converter)}"
           when '2'
             "#{num1} - #{num2} = " \
               + "#{num1.send(converter) - num2.send(converter)}"
           when '3'
             "#{num1} / #{num2} = " \
               + "#{num1.send(converter) / num2.send(converter)}"
           when '4'
             "#{num1} * #{num2} = " \
               + "#{num1.send(converter) * num2.send(converter)}"
           end
  puts result
end

name = get_name
say "Alright #{name}, let's do math!"
loop do
  do_math(get_number, get_number, get_operator)
  say MESSAGES['another_operation?']
  break if gets.chomp.casecmp('n').zero?
end

say "Thanks for your time #{name}. Calc You Later!"
