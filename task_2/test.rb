require_relative 'array'
require 'pp'

array = [
  (1..2).to_a,
  (5...11).to_a,
  (12..18).to_a,
  11
]

puts "Given: #{array}"

puts "Test 1:"
test1 = array.rebuild! do |element|
  element + 3
end

pp test1

puts 'Test 2:'
test2 = array.rebuild! do |element, size|
  element + size
end

pp test2
