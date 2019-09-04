module Truncate
  # Memoize old attribute getter method because define_method will override it on truncate
  # method call
  def memoize(attr_name)
    alias_method "memoized_#{attr_name}", attr_name
  end

  def truncate(attr_name, length:)
    memoize(attr_name)
    define_method(attr_name.to_sym) do
      original_value = self.public_send("memoized_#{attr_name}")
      raise AttributeError.new(attr_name) unless original_value.is_a?(String)
      original_value[0, length.to_i]
    end
  end

  class AttributeError < StandardError
    def initialize(attr_name)
      super("#{attr_name} is not a string. Truncate only supports string attributes")
    end
  end
end
