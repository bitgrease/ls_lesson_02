VALID_CHOICES = %w[rock paper scissors]
TIE = -1

def use_prompt(msg, prompt_bool=true)
  puts prompt_bool ? "=> #{msg}" : msg
end

def choice
  loop do
    use_prompt("Choose one: #{VALID_CHOICES.join(', ')}: ")
    choice = gets.chomp
    if VALID_CHOICES.include? choice.downcase
      break choice.downcase
    end
  end
end

def find_winner(computer_choice, user_choice)
  case
  when computer_choice.eql?(user_choice) then TIE
  when computer_choice.eql?('paper')
    user_choice.eql?('rock')
  when computer_choice.eql?('rock')
    user_choice.eql?('scissors')
  when computer_choice.eql?('scissors')
    user_choice.eql?('paper')
  end
end

user_choice = nil
computer_win = nil
system 'cls'
system 'clear'
use_prompt("Play Rock, Paper, Scissors!", false)
loop do
  user_choice = choice
  computer_choice = VALID_CHOICES.sample
  computer_win = find_winner(computer_choice, user_choice)
  use_prompt("Computer chose: #{computer_choice} - You chose: " \
            + "#{user_choice}.", false)
  if computer_win == TIE
    use_prompt("That's a TIE!!")
  elsif computer_win
    use_prompt("Sorry, you lost!", false)
  else
    use_prompt("Congrats! You WON!!!", false)
  end
  use_prompt("Play again?(Y/N)")
  break unless gets.chomp.downcase.start_with? 'y'
  system 'cls'
  system 'clear'
end
