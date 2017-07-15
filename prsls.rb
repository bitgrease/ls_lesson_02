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

def display_prompt(msg, prepend_arrow = true)
  puts prepend_arrow ? "=> #{msg}" : msg
end

def choice
  loop do
    display_prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}.")
    display_prompt("Or use the following abbreviations " \
               + "#{VALID_CHOICES.values.join(', ')}: ")
    short_values = VALID_CHOICES.values
    choice = gets.chomp.downcase
    break choice if VALID_CHOICES.keys.include? choice
    break VALID_CHOICES.key(choice) if short_values.include? choice
  end
end

def find_winner(computer_choice, user_choice)
  return :tie if computer_choice.eql? user_choice
  WINS_AGAINST[computer_choice].include? user_choice
end

def overall_winner?(wins_count)
  wins_count.eql? 5
end

total_computer_wins = 0
total_player_wins = 0
user_choice = nil
computer_win = nil

system 'clear'
system 'cls'
display_prompt("Play Rock, Paper, Scissors, Lizard Spock!", false)
display_prompt("First to win 5 times wins the tournament!")

loop do
  user_choice = choice
  computer_choice = VALID_CHOICES.keys.sample
  computer_win = find_winner(computer_choice, user_choice)

  display_prompt("Computer chose: #{computer_choice.capitalize} - You chose: " \
            + "#{user_choice.capitalize}.", false)

  if computer_win.eql?(:tie)
    # don't count ties in overall wins
    display_prompt("That's a TIE!!")
  elsif computer_win
    display_prompt("Sorry, you lost!", false)
    total_computer_wins += 1
  else
    display_prompt("Congrats! You WON!!!", false)
    total_player_wins += 1
  end

  display_prompt("Computer: #{total_computer_wins} - " \
                 + "Player: #{total_player_wins}")

  if overall_winner?(total_computer_wins)
    puts 'Computer won the tournament ' \
         + "#{total_computer_wins}/#{total_player_wins}."
  elsif overall_winner?(total_computer_wins)
    puts 'You won the tournament ' \
         + "#{total_player_wins}/#{total_computer_wins}."
  end

  if overall_winner?(total_computer_wins) ||
     overall_winner?(total_player_wins)
    display_prompt("Play a new tournament?(Y/N)")
    total_computer_wins = total_player_wins = 0
  else
    display_prompt("Play again?(Y/N)")
  end

  break unless gets.chomp.downcase.start_with? 'y'

  system 'clear'
  system 'cls'
end
