module CoreExtensions
  module Array
    def rebuild!(&block)
      # @nestness shows how nested is current array
      # we use it to update array elements that are not nested in other arrays
      @nestness = 0

      self.each_with_index do |item, index|
        if item.is_a?(Array)
          @nestness = @nestness + 1
          item.rebuild!(&block)
        else
          length = @nestness.zero? ? self.length : 1
          self[index] = yield(item, length)
        end
      end
    end
  end
end

# I'd prefer to use ruby refinements for this monkey patch, but according to task rules all work
# should be done in array.rb file
# https://docs.ruby-lang.org/en/2.4.0/syntax/refinements_rdoc.html
Array.include CoreExtensions::Array
