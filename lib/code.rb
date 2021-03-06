class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
def self.valid_pegs?(arr)

arr.all? {|e|POSSIBLE_PEGS.keys.include?(e.upcase)}
end

def initialize(arr)
if Code.valid_pegs?(arr) == false
raise TypeError, "Didn't list possible pegs"
else
@pegs = arr.map {|e|e.upcase}
end
end

def pegs
  @pegs
end

def self.random(length)
alpha = "RGBY"
arr = []
length.times {  arr << alpha[rand(0..3)]            }
Code.new(arr)
end

def self.from_string(string)
arr = string.split("")
Code.new(arr)
end

def[](idx)
  @pegs[idx]
end

def length
@pegs.length
end

def num_exact_matches(code_ins)
count = 0
(0...code_ins.length).each do |i|
if code_ins[i] == @pegs[i]
count +=1
end
end
return count
end

def num_near_matches(code_ins)
count = 0
secret = []
secret<<@pegs
secret.flatten!
(0...code_ins.length).each do |i|
  
if secret.include?(code_ins[i])
  secret.delete_at(secret.index(code_ins[i]))
  count+=1
end
end
if count == code_ins.length
  return 0
end
return count
end

def ==(code)
  
return false if  code.length != self.length
code.pegs == self.pegs
end
end


