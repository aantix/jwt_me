module Input
  class Parser
    KLASS_PREFIX = "Models::KeyValue"

    attr_reader :key_value_strings

    # Takes a collection of key/value strings
    #  e.g. user_id=1
    #  and returns a hash of key/value pairs
    def initialize(key_values_strings)
      @key_value_strings = key_values_strings
    end

    def parse
      key_value_strings.collect do |key_value_string|
        self.class.parse_item(key_value_string)
      end.compact
    end

    def self.parse_item(key_value_string)
      key, value = key_value_from_string(key_value_string)

      klass(key).new(key, value)
    end

    def self.key_value_from_string(key_value_string)
      key, value = key_value_string.split(/=/)
      return key, value
    end

    def klass(key)
      @key_klass||=self.class.klass(key)
    end

    def self.klass(key)
      "#{KLASS_PREFIX}::#{key.camelcase}".constantize rescue Models::KeyValue::Base
    end
  end
end