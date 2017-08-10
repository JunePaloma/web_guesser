require 'sinatra'
require 'sinatra/reloader'

number = rand(100)


get '/' do
guess = params["guess"].to_i
# number = set_num
output = check_output(guess, number)
background_color = select_color(guess, number)
erb :index, :locals => {:number => number, :output => output, :background_color => background_color}
end



def check_output(guess, number)
  if number < (guess-5)
    output = "Way too high!"
  elsif number > (guess+5)
    output = "Way too low!"
  elsif number < guess
    output = "Too high"
  elsif number > guess
    output = "Too low"
  else
    output = "You got it right! The secret number is #{number}"
  end
end

def select_color(guess, number)
  color = ''
  if number < (guess-5) || number > (guess+5)
    color = "#F20732"
  elsif number < guess || number > guess
    color = "#E8B7C0"
  else
    color = "#2F951D"
  end
end
