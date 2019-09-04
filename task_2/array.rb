module CoreExtensions
  module Array
    def rebuild!
      puts 'TEST'
    end
  end
end

Array.include CoreExtensions::Array
