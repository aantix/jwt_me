module Models
  module KeyValue
    class Base
      include ActiveModel::Validations

      attr_accessor :key, :value

      def initialize(key, value)
        @key   = key
        @value = value
      end

      def to_hash
        {key: value}
      end
    end
  end
end