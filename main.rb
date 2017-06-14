require_relative 'genetic_algo'
require_relative 'chromosome'

g = Genetic_algo.new('olivier')
g.run()
#p g.population.map(&:value)