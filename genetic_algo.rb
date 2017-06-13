class Genetic_algo

	ALPHABET = [*'a'..'z', *'A'..'Z']

	def initialize(solution, population_size = 100)
		@solution = solution
		@size = solution.size
		@population_size = population_size
		@population = []
	end

	def create_population
		@population_size.times do
			@population << Chromosome.new()
		end
	end

	def self.random_string(size)
		output = ""
		size.times do
			output += ALPHABET.sample
		end
		output
	end 

end

#g = Genetic_algo.new
#p g.random_string(7)

#p Genetic_algo.random_string(7)