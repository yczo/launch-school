VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  puts("=> #{message}")
end

def show_result(user, computer)
  if (user == 'rock' && computer == 'scissors') ||
     (user == 'paper' && computer == 'rock') ||
     (user == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (user == 'rock' && computer == 'paper') ||
        (user == 'paper' && computer == 'scissors') ||
        (user == 'scissors' && computer == 'rock')
    prompt('Computer won!')
  else
    prompt("It's a Tie")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  show_result(choice, computer_choice)

  prompt('Again Y')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('GoodBye')