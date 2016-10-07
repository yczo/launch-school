# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# out the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'.freeze

def prompt(key)
  message = MESSAGES[LANGUAGE][key]
  Kernel.puts("=> #{message}")
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets.chomp

  break unless name.empty?
  prompt('valid_name')
end

puts("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt('first_number')
    number1 = Kernel.gets.chomp

    break if valid_number?(number1)
    prompt('not_valid_number')
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets.chomp

    break if valid_number?(number2)
    prompt('not_valid_number')
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) substract
    3) multiply
    4) divide
  MSG

  puts(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets.chomp

    break if %w(1 2 3 4).include?(operator)
    prompt('not_valid_operator')
  end

  puts("=> #{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end
  puts("=> The result is #{result}")

  prompt('calculate_again')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('thanks')
