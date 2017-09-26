module Input
  class Base
    attr_reader :required_fields, :items

    def initialize(required_fields)
      @items = []
      @required_fields = required_fields
    end

    def to_hash
      hash_values(items)
    end

    def output_errors(errors = items)
      puts
      puts "Error(s):\n #{error_messages(errors).join("\n").strip}"
    end

    def valid?
      items.all?{|item| item.valid?}
    end

    def invalid?
      !valid?
    end
    
    private
    def error_messages(errors = items)
      Array.wrap(errors).collect do |item|
        item.errors.messages.values
      end.flatten
    end

    def hash_values(items)
      items.inject({}) do |hash, item|
        hash[item.key] = item.value
        hash
      end
    end
  end
end