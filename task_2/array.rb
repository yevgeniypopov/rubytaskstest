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

Array.include CoreExtensions::Array
