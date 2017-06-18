require_relative 'genetic_algo'
require_relative 'chromosome'

Genetic_algo.new(ARGV[0] || abort("You must provide a solution"), ARGV[1] || 100).run
