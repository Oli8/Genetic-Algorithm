require 'Benchmark'

class Genetic_algo

	ALPHABET = [*'a'..'z', *'A'..'Z']

	def initialize(solution, population_size = 100)
		@solution = solution
		@size = solution.size
		@population_size = population_size
		@population = []
	end

	def run
		create_population
		generation_number = 1

		time = Benchmark.measure{
			while !solution_found do
				puts "Generation #{generation_number}... -> #{best_match.value}"
				@population = generation
				generation_number += 1
			end
		}

		puts "Solution #{@solution} found after #{generation_number} generations in #{time.real.round(2)} seconds."
	end

	private
	def create_population
		@population_size.times do
			@population << Chromosome.new(@size)
		end
	end

	def selection(selected = 0.4, randomly_selected = 0.1)
		population_sorted = @population.sort_by{|chrom| -chrom.score(@solution)}
		best_chromosomes = population_sorted.take((@population_size * selected).round)
		best_chromosomes + population_sorted[(@population_size * selected).round..-1].shuffle.take((@population_size * randomly_selected).round)
	end

	def generation
		selected = selection
		children = []

		while (selected + children).size < @population_size do
			children << selected.sample.crossover(selected.sample.value)
		end

		generation = (selected + children)
		[*0...@population_size].shuffle.take((@population_size * 0.1).round).each{|k| generation[k].mutate!}

		generation
	end

	def solution_found
		@population.select{|chrom| chrom.value == @solution}.size > 0
	end

	def best_match
		@population.max_by{|chrom| chrom.score(@solution)}
	end

	def self.random_string(size)
		size.times.collect{ALPHABET.sample}.join
	end 

end
