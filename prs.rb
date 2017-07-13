VALID_CHOICES = %w[rock paper scissors]
TIE = -1

def say(msg, prompt_bool=true)
  puts prompt_bool ? "=> #{msg}" : msg
end

def choice
  loop do
    say("Choose one: #{VALID_CHOICES.join(', ')}: ")
    choice = gets.chomp
    if VALID_CHOICES.include? choice.downcase
      return choice
    end
  end
end

def find_winner(computer_choice, user_choice)
  computer_win = case
                 when computer_choice.eql?(user_choice)
                   TIE
                 when computer_choice.eql?('paper')
                   user_choice.eql?('rock') ? true : false
                 when computer_choice.eql?('rock')
                   user_choice.eql?('scissors') ? true : false
                 when computer_choice.eql?('scissors')
                   user_choice.eql?('paper') ? true : false
                 end
  computer_win
end

user_choice = nil
computer_win = nil
say("Play Rock, Paper, Scissors!", false)
loop do
  user_choice = choice
  computer_choice = VALID_CHOICES.sample
  computer_win = find_winner(computer_choice, user_choice)
  say("Computer chose: #{computer_choice} - You chose: #{user_choice}.", false)
  if computer_win == TIE
    say("That's a TIE!!")
  elsif computer_win
    say("Sorry, you lost!", false)
  else
    say("Congrats! You WON!!!", false)
  end
  say("Play again?(Y/N)")
  exit unless gets.chomp.downcase.start_with? 'y'
end
