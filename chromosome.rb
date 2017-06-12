ALPHABET = [*'a'..'z', *'A'..'Z']

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

	def mutate
		@value[rand(0...@value.size)] = ALPHABET.sample
	end

	def crossover(chromosome)
		# @value[0..@size / 2 - 1] + chromosome[@size / 2..-1]
		half = @size / 2
		(@value.chars.shuffle.take(half) + chromosome.chars.shuffle.take(half.even? ? half : half + 1)).join
	end
end

def random_string(size)
	output = ""
	size.times do 
		output += ALPHABET.sample
	end
	output
end 

c = Chromosome.new(7)
p c.value
c.crossover('azertyu')