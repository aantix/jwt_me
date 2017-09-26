module Input
  class Cli < Base
    attr_reader :arguments

    def initialize(arguments, required_fields)
      super(required_fields)

      @arguments = arguments
    end

    def process
      @items = parse
    end

    private
    def parse
      key_values = Input::Parser.new(arguments).parse

      # Create a required field instantiation if it doesn't already exist
      #  Will cause a validation failure if the value isn't provided via
      #  the CLI
      required_fields.each do |field|
        required_item = key_values.find {|item| item.key == field}

        item = Input::Parser.klass(field).new(field, nil)
        key_values << item unless required_item.present?
      end

      key_values
    end
  end
end