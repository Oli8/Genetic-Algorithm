require 'optparse'
require_relative 'genetic_algo'
require_relative 'chromosome'

options = {}

optparse = OptionParser.new do |opts|
	opts.banner = "Usage: ruby main.rb [options] solution"

	options[:population] = 100
	opts.on( '-p', '--population SIZE', Integer, 'Set the population size to SIZE.') do |size|
		options[:population] = size
	end

	options[:max_time] = 0
	opts.on( '-m', '--max_time SECONDS', Float, 'Stop the process after SECONDS number of seconds set.') do |seconds|
		options[:max_time] = seconds
	end

	opts.on( '-h', '--help', 'Display help.') do
		puts opts
		exit
	end
end.parse!

Genetic_algo.new(ARGV.last || abort("You must provide a solution."), options[:population], options[:max_time]).run
