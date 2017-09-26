module Input
  class Interactive < Base
    COMPLETION     = "(press enter to complete)"
    KEY_TEMPLATE   = "Enter key %{iteration}: "
    VALUE_TEMPLATE = "Enter '%{key}' value: "

    def initialize(required_fields)
      super(required_fields)

      @iteration = 0
    end

    def process
      @items = prompt_for_all_values
    end

    private
    def prompt_for_all_values
      prompt_for_required_values.concat(prompt_for_values)
    end

    def prompt_for_required_values
      required_fields.collect do |required_field|
        item = value_prompt(required_field)

        while item.invalid? do
          output_errors(item)
          item = value_prompt(required_field)
        end

        item
      end
    end

    def prompt_for_values
      unrequired = []

      begin
        key = key_prompt(iteration, COMPLETION)
        unrequired << value_prompt(key) if key.present?
      end while key.present?

      unrequired
    end

    def key_prompt(iteration, instructions = nil)
      puts
      puts KEY_TEMPLATE % {iteration: iteration}
      puts(instructions) if instructions.present?

      prompt
    end

    def value_prompt(key)
      puts
      puts VALUE_TEMPLATE % {key: key}
      
      Input::Parser.parse_item(key_value_string(key, prompt))
    end

    def prompt
      STDIN.gets.strip
    end

    def iteration
      @iteration+=1
    end

    def key_value_string(key, value)
      "#{key}=#{value}"
    end
  end
end