require 'optparse'
require_relative 'genetic_algo'
require_relative 'chromosome'

options = {}

optparse = OptionParser.new do |opts|
	opts.banner = "Usage: ruby main.rb [options] solution"

	options[:population] = 100
	opts.on( '-p', '--population SIZE', Integer, 'Set the population size.') do |size|
		options[:population] = size
	end

	options[:max_time] = false
	opts.on( '-m', '--max_time MS', Integer, 'Stop the process after number of milliseconds set.') do |ms|
		options[:max_time] = ms
	end

	opts.on( '-h', '--help', 'Display help.' ) do
		puts opts
		exit
	end
end.parse!

Genetic_algo.new(ARGV.last || abort("You must provide a solution."), options[:population]).run
