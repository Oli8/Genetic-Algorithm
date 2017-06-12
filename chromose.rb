class Chromosome
	
	attr_reader :value

	def initialize(size, value = false)
		@size = size
		@value = value || random_string(size)
	end

	def score(solution)
		match = 0
		@value.chars.each_with_index{ |letter, key|
			match += letter == solution[key] ? 1 : 0
		}
		match.fdiv(@value.size)
	end

end

def random_string(size)
	alphabet = [*'a'..'z', *'A'..'Z']
	output = ""
	size.times do 
		output += alphabet.sample
	end
	output
end 

c = Chromosome.new(7)
p c.value
p c.score("olivier")