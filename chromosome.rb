class Chromosome
	
	attr_reader :value

	def initialize(size, value = false)
		@size = size
		@value = value || Genetic_algo.random_string(size)
	end

	def score(solution)
		match = 0
		@value.chars.each_with_index{ |letter, key|
			# account for misplaced letter ?
			match += letter == solution[key] ? 1 : 0
		}
		match.fdiv(@value.size)
	end

	def mutate!
		@value[rand(0...@size)] = Genetic_algo::ALPHABET.sample
	end

	def crossover(chromosome)
		self.class.new(@size, @value[0..@size / 2 - 1] + chromosome[@size / 2..-1])
	end

end
