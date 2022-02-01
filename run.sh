#! ruby

load 'lib/create_spiral.rb'

ARGV.each do |argument|
  obj = CreateSpiral.new(argument)
  arr = obj.process
  puts ''
  pp arr
end
