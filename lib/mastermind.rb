require_relative "code"

class Mastermind

def initialize(length)
@secret_code = Code.random(length)
end

def print_matches(inst)
p @secret_code.num_near_matches(inst)
p @secret_code.num_exact_matches(inst)
end

def ask_user_for_guess
p"'Enter a code'"
p "ENTER ONLY R,G,B OR Y and at the length you selected"
input = gets.chomp
inst = Code.from_string(input)
p "Here's your guess status"
p "Number of exact matches: #{@secret_code.num_exact_matches(inst)}" 
p "Number of near matches: #{@secret_code.num_near_matches(inst)}" 
inst.length == @secret_code.num_exact_matches(inst)

end

end
