class Genetic_algo

	ALPHABET = [*'a'..'z', *'A'..'Z']

	attr_reader :population

	def initialize(solution, population_size = 100)
		@solution = solution
		@size = solution.size
		@population_size = population_size
		@population = []
	end

	def run
		create_population
	end

	def create_population
		@population_size.times do
			@population << Chromosome.new(@size)
		end
	end

	def selection(selected = 0.4, randomly_selected = 0.1)
		population_sorted = @population.sort_by{|chrom| -chrom.score(@solution)}
		best_chromosomes = population_sorted.take((@population_size * selected).round)
		best_chromosomes + population_sorted[(@population_size * selected).round..-1].take((@population_size * randomly_selected).round)
	end

	def self.random_string(size)
		output = ""
		size.times do
			output += ALPHABET.sample
		end
		output
	end 

end
