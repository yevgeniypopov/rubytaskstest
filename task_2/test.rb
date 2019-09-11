require_relative 'array'
require 'pp'

array = [
  (1..2).to_a,
  (5...11).to_a,
  (12..18).to_a,
  11
]

puts "Given: #{array}"

# I removed pp here because it doesn't work with do/end blocks, see https://code-examples.net/en/q/11c2bd7
# Using {} will actually work:
# pp array.rebuild! { |element| element + 3 }
puts "Test 1:"
res = array.rebuild! do |element|
  element + 3
end

pp res

# This code will add size to elements of array updated in Test 1, not original array.
# It does so because usually in ruby methods with '!' in method name change original object.
puts 'Test 2:'
res = array.rebuild! do |element, size|
  element + size
end

pp res
