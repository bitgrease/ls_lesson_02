TIE = -1

VALID_CHOICES = {
  'rock'     => 'r',
  'paper'    => 'p',
  'scissors' => 'sc',
  'lizard'   => 'l',
  'spock'    => 'sp'
}

WINS_AGAINST = {
  'rock'     => %w[lizard scissors],
  'paper'    => %w[spock rock],
  'scissors' => %w[lizard paper],
  'lizard'   => %w[spock paper],
  'spock'    => %w[rock scissors]
}

def use_prompt(msg, prompt_bool=true)
  puts prompt_bool ? "=> #{msg}" : msg
end

def choice
  loop do
    use_prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}.")
    use_prompt("Or use the following abbreviations " \
               + "#{VALID_CHOICES.values.join(', ')}: ")
    short_values = VALID_CHOICES.values
    choice = gets.chomp.downcase
    break choice if VALID_CHOICES.keys.include? choice
    break VALID_CHOICES.key(choice) if short_values.include? choice
  end
end

def win?(computer_choice, user_choice)
  return TIE if computer_choice.eql? user_choice
  WINS_AGAINST[computer_choice].include? user_choice
end

user_choice = nil
computer_win = nil
system 'clear'
use_prompt("Play Rock, Paper, Scissors, Lizard Spock!", false)
loop do
  user_choice = choice
  computer_choice = VALID_CHOICES.keys.sample
  computer_win = win?(computer_choice, user_choice)
  use_prompt("Computer chose: #{computer_choice.capitalize} - You chose: " \
            + "#{user_choice.capitalize}.", false)

  if computer_win == TIE
    use_prompt("That's a TIE!!")
  elsif computer_win
    use_prompt("Sorry, you lost!", false)
  else
    use_prompt("Congrats! You WON!!!", false)
  end
  use_prompt("Play again?(Y/N)")
  break unless gets.chomp.downcase.start_with? 'y'
  system 'clear'
end
